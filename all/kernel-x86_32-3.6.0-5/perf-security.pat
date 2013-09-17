From 8176cced706b5e5d15887584150764894e94e02f Mon Sep 17 00:00:00 2001
From: Tommi Rantala <tt.rantala@gmail.com>
Date: Sat, 13 Apr 2013 19:49:14 +0000
Subject: perf: Treat attr.config as u64 in perf_swevent_init()

Trinity discovered that we fail to check all 64 bits of
attr.config passed by user space, resulting to out-of-bounds
access of the perf_swevent_enabled array in
sw_perf_event_destroy().

Introduced in commit b0a873ebb ("perf: Register PMU
implementations").

Signed-off-by: Tommi Rantala <tt.rantala@gmail.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: davej@redhat.com
Cc: Paul Mackerras <paulus@samba.org>
Cc: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
Link: http://lkml.kernel.org/r/1365882554-30259-1-git-send-email-tt.rantala@gmail.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7e0962e..4d3124b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5331,7 +5331,7 @@ static void sw_perf_event_destroy(struct perf_event *event)
 
 static int perf_swevent_init(struct perf_event *event)
 {
-	int event_id = event->attr.config;
+	u64 event_id = event->attr.config;
 
 	if (event->attr.type != PERF_TYPE_SOFTWARE)
 		return -ENOENT;
--
cgit v0.9.2