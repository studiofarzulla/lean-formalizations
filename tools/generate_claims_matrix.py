#!/usr/bin/env python3
import argparse
import json
import re
from pathlib import Path
from typing import Dict, List, Tuple

ROOT = Path(__file__).resolve().parents[1]
PAPERMAP_GLOB = ROOT / "FarzullaProofs"
DEFAULT_OUT = ROOT / "claims_matrix.json"

HEADING_RE = re.compile(r"^##\s+(.*)$")
BULLET_RE = re.compile(r"^-\s+(.*)$")
MAP_RE = re.compile(r"^(.+?)\s*->\s*`([^`]+)`\s*$")
THM_RE = re.compile(r"(THM-[A-Za-z0-9\-]+)")
BT_RE = re.compile(r"`([^`]+)`")


def parse_sections(text: str) -> Dict[str, List[str]]:
    sections: Dict[str, List[str]] = {}
    current = ""
    for raw in text.splitlines():
        m = HEADING_RE.match(raw.strip())
        if m:
            current = m.group(1).strip()
            sections.setdefault(current, [])
            continue
        if current:
            sections[current].append(raw.rstrip("\n"))
    return sections


def section_bullets(lines: List[str]) -> List[str]:
    out: List[str] = []
    for line in lines:
        m = BULLET_RE.match(line.strip())
        if m:
            out.append(m.group(1).strip())
    return out


def parse_mappings(sections: Dict[str, List[str]]) -> List[Tuple[str, str, str, str]]:
    rows: List[Tuple[str, str, str, str]] = []
    for heading, lines in sections.items():
        h = heading.lower()
        if "mapping" not in h and "mapped claims" not in h and "extensions" not in h:
            continue
        for bullet in section_bullets(lines):
            m = MAP_RE.match(bullet)
            if not m:
                continue
            lhs = m.group(1).strip()
            decl = m.group(2).strip()
            thm_match = THM_RE.search(lhs)
            claim_id = thm_match.group(1) if thm_match else ""
            rows.append((heading, lhs, decl, claim_id))
    return rows


def parse_assumption_tags(sections: Dict[str, List[str]]) -> List[str]:
    tags: List[str] = []
    for heading, lines in sections.items():
        if heading.strip().lower() != "assumption tags":
            continue
        for line in section_bullets(lines):
            for token in BT_RE.findall(line):
                if token.startswith("A-"):
                    tags.append(token)
    # stable unique
    return sorted(set(tags))


def parse_falsification_boundaries(sections: Dict[str, List[str]]) -> List[str]:
    for heading, lines in sections.items():
        if heading.strip().lower() == "falsification boundaries":
            return section_bullets(lines)
    return []


def canonical_tex(sections: Dict[str, List[str]]) -> str:
    for heading, lines in sections.items():
        if heading.strip().lower() == "canonical paper":
            bullets = section_bullets(lines)
            return bullets[0] if bullets else ""
    return ""


def status_value(sections: Dict[str, List[str]]) -> str:
    for heading, lines in sections.items():
        if heading.strip().lower() == "status":
            bullets = section_bullets(lines)
            return bullets[0] if bullets else ""
    return ""


def lean_entrypoints(sections: Dict[str, List[str]]) -> List[str]:
    for heading, lines in sections.items():
        if heading.strip().lower() == "lean entrypoints":
            return section_bullets(lines)
    return []


def build_matrix() -> dict:
    papermaps = sorted(PAPERMAP_GLOB.glob("*/PaperMap.md"))
    claims = []
    papers = []

    for pm in papermaps:
        module = pm.parent.name
        rel_pm = str(pm.relative_to(ROOT))
        text = pm.read_text(encoding="utf-8")
        sections = parse_sections(text)

        canon = canonical_tex(sections)
        status = status_value(sections)
        assumptions = parse_assumption_tags(sections)
        falsification = parse_falsification_boundaries(sections)
        entrypoints = lean_entrypoints(sections)

        papers.append(
            {
                "module": module,
                "canonical_paper": canon,
                "status": status,
                "lean_entrypoints": entrypoints,
                "paper_map": rel_pm,
                "assumption_tags": assumptions,
                "falsification_boundaries": falsification,
            }
        )

        for mapping_section, manuscript_ref, declaration, claim_id in parse_mappings(sections):
            claims.append(
                {
                    "module": module,
                    "canonical_paper": canon,
                    "status": status,
                    "claim_id": claim_id,
                    "manuscript_reference": manuscript_ref,
                    "lean_declaration": declaration,
                    "mapping_section": mapping_section,
                    "assumption_scope": "paper_level",
                    "assumption_tags": assumptions,
                    "falsification_boundaries": falsification,
                    "paper_map": rel_pm,
                }
            )

    claims.sort(key=lambda c: (c["module"], c["mapping_section"], c["lean_declaration"]))
    papers.sort(key=lambda p: p["module"])

    return {
        "version": "0.1.0",
        "source": "PaperMap.md",
        "paper_count": len(papers),
        "claim_count": len(claims),
        "papers": papers,
        "claims": claims,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Generate claims matrix from PaperMap files.")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--check", action="store_true", help="Fail if output is out-of-date.")
    args = parser.parse_args()

    matrix = build_matrix()
    rendered = json.dumps(matrix, indent=2, sort_keys=True) + "\n"

    if args.check:
        if not args.output.exists():
            print(f"Missing {args.output}")
            return 1
        current = args.output.read_text(encoding="utf-8")
        if current != rendered:
            print(f"Out-of-date: {args.output}")
            return 1
        print("claims_matrix.json is up to date.")
        return 0

    args.output.write_text(rendered, encoding="utf-8")
    print(f"Wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
