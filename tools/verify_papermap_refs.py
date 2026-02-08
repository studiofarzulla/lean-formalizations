#!/usr/bin/env python3
import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PAPERMAP_GLOB = ROOT / "FarzullaProofs"

HEAD_RE = re.compile(r"^##\s+(.*)$")
BULLET_RE = re.compile(r"^-\s+(.*)$")
MAP_RE = re.compile(r"^(.+?)\s*->\s*`([^`]+)`\s*$")

DECL_RE = re.compile(
    r"^\s*(?:noncomputable\s+)?(?:theorem|lemma|def|abbrev|structure|class|inductive|axiom)\s+([A-Za-z0-9_']+)",
    re.MULTILINE,
)


def parse_sections(text: str):
    sections = {}
    cur = None
    for line in text.splitlines():
        m = HEAD_RE.match(line.strip())
        if m:
            cur = m.group(1).strip()
            sections[cur] = []
            continue
        if cur is not None:
            sections[cur].append(line.rstrip("\n"))
    return sections


def bullets(lines):
    out = []
    for line in lines:
        m = BULLET_RE.match(line.strip())
        if m:
            out.append(m.group(1).strip())
    return out


def mapped_decls(sections):
    out = []
    for heading, lines in sections.items():
        h = heading.lower()
        if "mapping" not in h and "mapped claims" not in h and "extensions" not in h:
            continue
        for b in bullets(lines):
            m = MAP_RE.match(b)
            if m:
                out.append((heading, m.group(2).strip(), m.group(1).strip()))
    return out


def entrypoints(sections):
    for heading, lines in sections.items():
        if heading.strip().lower() == "lean entrypoints":
            return bullets(lines)
    return []


def load_decl_names(files):
    names = set()
    for f in files:
        txt = f.read_text(encoding="utf-8")
        names.update(DECL_RE.findall(txt))
    return names


def verify(papermap: Path):
    txt = papermap.read_text(encoding="utf-8")
    sections = parse_sections(txt)
    eps = entrypoints(sections)
    ep_paths = []
    unresolved = []
    for ep in eps:
        # Support exact paths and glob-style entrypoints (e.g. `Foo/*.lean`).
        if any(ch in ep for ch in ["*", "?", "["]):
            matched = sorted(ROOT.glob(ep))
            if not matched:
                unresolved.append(ep)
            ep_paths.extend(matched)
            continue
        p = ROOT / ep
        if p.exists():
            ep_paths.append(p)
        else:
            unresolved.append(ep)
    names = load_decl_names(ep_paths)

    missing = []
    for heading, decl, ref in mapped_decls(sections):
        if decl not in names:
            missing.append((heading, decl, ref))
    return eps, ep_paths, unresolved, missing


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--module", help="Module folder name under FarzullaProofs")
    args = ap.parse_args()

    papermaps = sorted(PAPERMAP_GLOB.glob("*/PaperMap.md"))
    if args.module:
        papermaps = [p for p in papermaps if p.parent.name == args.module]

    failed = 0
    for pm in papermaps:
        eps, ep_paths, unresolved, missing = verify(pm)
        print(
            f"[{pm.parent.name}] entrypoints={len(ep_paths)}/{len(eps)} "
            f"unresolved_entrypoints={len(unresolved)} mapped_missing={len(missing)}"
        )
        for ep in unresolved:
            print(f"  - unresolved entrypoint `{ep}`")
        for h, decl, ref in missing:
            print(f"  - missing `{decl}` ({h} :: {ref})")
        if unresolved or missing:
            failed += 1

    raise SystemExit(1 if failed else 0)


if __name__ == "__main__":
    main()
