.PHONY: verify verify-fast claims report build

verify:
	tools/verify_papermap_refs.py
	tools/generate_claims_matrix.py --check
	tools/verify_claims_consistency.py --report reports/paper_verification_report.md
	lake build

verify-fast:
	tools/verify_papermap_refs.py
	tools/generate_claims_matrix.py --check
	tools/verify_claims_consistency.py --report reports/paper_verification_report.md

claims:
	tools/generate_claims_matrix.py

report:
	tools/verify_claims_consistency.py --report reports/paper_verification_report.md

build:
	lake build
