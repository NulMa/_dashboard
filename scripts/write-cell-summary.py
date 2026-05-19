import json, os
data = {
    "repo": os.environ.get("REPO", ""),
    "should_run": os.environ.get("SHOULD_RUN") or "unknown",
    "reason": os.environ.get("REASON") or "gate step failed before emit",
    "first_report": os.environ.get("FIRST_REPORT", ""),
    "commit_count": os.environ.get("COMMIT_COUNT") or "0",
    "current_sha": os.environ.get("CURRENT_SHA", ""),
    "run_status": os.environ.get("RUN_STATUS") or "skipped",
    "out_file": os.environ.get("OUT_FILE", ""),
    "reports_pushed": os.environ.get("REPORTS_PUSHED") or "false",
    "reconcile_pushed": os.environ.get("RECONCILE_PUSHED") or "false",
}
open(os.environ["SUMMARY_FILE"], "w", encoding="utf-8").write(json.dumps(data, ensure_ascii=False) + "\n")
