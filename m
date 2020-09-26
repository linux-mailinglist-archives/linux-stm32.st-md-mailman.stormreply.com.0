Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64827A79C
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Sep 2020 08:36:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26902C35E2B;
	Mon, 28 Sep 2020 06:36:15 +0000 (UTC)
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C76A8C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 01:01:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601082065; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=uumwK5Kf3sQNgW/XebRuJyLy7quH9hSZ/5GZaqWTKv8=;
 b=bvpl9e3RSN9ti4UziWf98Iphi8TAcJWPE5BucwW/Jlj0iKrgc3XO/G6YucX/wKFbEDsTPROo
 4DmZOn8ffHaZyjkNDXZmqsnsgWgjGgTSmTB4pIfLPJtBBsT/P6Km9VA9uWbqDTnH3hpecE3s
 Qc+UN9aaZleSkLC19JzjMmecwSA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f6e92cfe051fb32a063aead (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 26 Sep 2020 01:01:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 19C9AC43395; Sat, 26 Sep 2020 01:01:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tingweiz-gv.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tingwei)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA31CC43387;
 Sat, 26 Sep 2020 01:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EA31CC43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=tingwei@codeaurora.org
From: Tingwei Zhang <tingwei@codeaurora.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Sat, 26 Sep 2020 09:00:02 +0800
Message-Id: <20200926010005.14689-4-tingwei@codeaurora.org>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20200926010005.14689-1-tingwei@codeaurora.org>
References: <20200926010005.14689-1-tingwei@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 06:36:12 +0000
Cc: tsoni@codeaurora.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mao Jinlong <jinlmao@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 3/6] tracing: add trace_export support for
	event trace
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Only function traces can be exported to other destinations currently.
This patch exports event trace as well. Move trace export related
function to the beginning of file so other trace can call
trace_process_export() to export.

Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Reviewed-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 include/linux/trace.h |   1 +
 kernel/trace/trace.c  | 259 ++++++++++++++++++++++--------------------
 2 files changed, 135 insertions(+), 125 deletions(-)

diff --git a/include/linux/trace.h b/include/linux/trace.h
index c115a5d2269f..86033d214972 100644
--- a/include/linux/trace.h
+++ b/include/linux/trace.h
@@ -5,6 +5,7 @@
 #ifdef CONFIG_TRACING
 
 #define TRACE_EXPORT_FUNCTION	BIT(0)
+#define TRACE_EXPORT_EVENT	BIT(1)
 
 /*
  * The trace export - an export of Ftrace output. The trace_export
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 3ca121ad8728..a40ee413123c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -251,6 +251,138 @@ unsigned long long ns2usecs(u64 nsec)
 	return nsec;
 }
 
+static void
+trace_process_export(struct trace_export *export,
+	       struct ring_buffer_event *event, int flag)
+{
+	struct trace_entry *entry;
+	unsigned int size = 0;
+
+	if (export->flags & flag) {
+		entry = ring_buffer_event_data(event);
+		size = ring_buffer_event_length(event);
+		export->write(export, entry, size);
+	}
+}
+
+static DEFINE_MUTEX(ftrace_export_lock);
+
+static struct trace_export __rcu *ftrace_exports_list __read_mostly;
+
+static DEFINE_STATIC_KEY_FALSE(trace_function_exports_enabled);
+static DEFINE_STATIC_KEY_FALSE(trace_event_exports_enabled);
+
+static inline void ftrace_exports_enable(struct trace_export *export)
+{
+	if (export->flags & TRACE_EXPORT_FUNCTION)
+		static_branch_inc(&trace_function_exports_enabled);
+
+	if (export->flags & TRACE_EXPORT_EVENT)
+		static_branch_inc(&trace_event_exports_enabled);
+}
+
+static inline void ftrace_exports_disable(struct trace_export *export)
+{
+	if (export->flags & TRACE_EXPORT_FUNCTION)
+		static_branch_dec(&trace_function_exports_enabled);
+
+	if (export->flags & TRACE_EXPORT_EVENT)
+		static_branch_dec(&trace_event_exports_enabled);
+}
+
+static void ftrace_exports(struct ring_buffer_event *event, int flag)
+{
+	struct trace_export *export;
+
+	preempt_disable_notrace();
+
+	export = rcu_dereference_raw_check(ftrace_exports_list);
+	while (export) {
+		trace_process_export(export, event, flag);
+		export = rcu_dereference_raw_check(export->next);
+	}
+
+	preempt_enable_notrace();
+}
+
+static inline void
+add_trace_export(struct trace_export **list, struct trace_export *export)
+{
+	rcu_assign_pointer(export->next, *list);
+	/*
+	 * We are entering export into the list but another
+	 * CPU might be walking that list. We need to make sure
+	 * the export->next pointer is valid before another CPU sees
+	 * the export pointer included into the list.
+	 */
+	rcu_assign_pointer(*list, export);
+}
+
+static inline int
+rm_trace_export(struct trace_export **list, struct trace_export *export)
+{
+	struct trace_export **p;
+
+	for (p = list; *p != NULL; p = &(*p)->next)
+		if (*p == export)
+			break;
+
+	if (*p != export)
+		return -1;
+
+	rcu_assign_pointer(*p, (*p)->next);
+
+	return 0;
+}
+
+static inline void
+add_ftrace_export(struct trace_export **list, struct trace_export *export)
+{
+	ftrace_exports_enable(export);
+
+	add_trace_export(list, export);
+}
+
+static inline int
+rm_ftrace_export(struct trace_export **list, struct trace_export *export)
+{
+	int ret;
+
+	ret = rm_trace_export(list, export);
+	ftrace_exports_disable(export);
+
+	return ret;
+}
+
+int register_ftrace_export(struct trace_export *export)
+{
+	if (WARN_ON_ONCE(!export->write))
+		return -1;
+
+	mutex_lock(&ftrace_export_lock);
+
+	add_ftrace_export(&ftrace_exports_list, export);
+
+	mutex_unlock(&ftrace_export_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(register_ftrace_export);
+
+int unregister_ftrace_export(struct trace_export *export)
+{
+	int ret;
+
+	mutex_lock(&ftrace_export_lock);
+
+	ret = rm_ftrace_export(&ftrace_exports_list, export);
+
+	mutex_unlock(&ftrace_export_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(unregister_ftrace_export);
+
 /* trace_flags holds trace_options default values */
 #define TRACE_DEFAULT_FLAGS						\
 	(FUNCTION_DEFAULT_FLAGS |					\
@@ -2699,6 +2831,8 @@ void trace_event_buffer_commit(struct trace_event_buffer *fbuffer)
 	if (static_key_false(&tracepoint_printk_key.key))
 		output_printk(fbuffer);
 
+	if (static_branch_unlikely(&trace_event_exports_enabled))
+		ftrace_exports(fbuffer->event, TRACE_EXPORT_EVENT);
 	event_trigger_unlock_commit_regs(fbuffer->trace_file, fbuffer->buffer,
 				    fbuffer->event, fbuffer->entry,
 				    fbuffer->flags, fbuffer->pc, fbuffer->regs);
@@ -2742,131 +2876,6 @@ trace_buffer_unlock_commit_nostack(struct trace_buffer *buffer,
 	__buffer_unlock_commit(buffer, event);
 }
 
-static void
-trace_process_export(struct trace_export *export,
-	       struct ring_buffer_event *event, int flag)
-{
-	struct trace_entry *entry;
-	unsigned int size = 0;
-
-	if (export->flags & flag) {
-		entry = ring_buffer_event_data(event);
-		size = ring_buffer_event_length(event);
-		export->write(export, entry, size);
-	}
-}
-
-static DEFINE_MUTEX(ftrace_export_lock);
-
-static struct trace_export __rcu *ftrace_exports_list __read_mostly;
-
-static DEFINE_STATIC_KEY_FALSE(trace_function_exports_enabled);
-
-static inline void ftrace_exports_enable(struct trace_export *export)
-{
-	if (export->flags & TRACE_EXPORT_FUNCTION)
-		static_branch_inc(&trace_function_exports_enabled);
-}
-
-static inline void ftrace_exports_disable(struct trace_export *export)
-{
-	if (export->flags & TRACE_EXPORT_FUNCTION)
-		static_branch_dec(&trace_function_exports_enabled);
-}
-
-static void ftrace_exports(struct ring_buffer_event *event, int flag)
-{
-	struct trace_export *export;
-
-	preempt_disable_notrace();
-
-	export = rcu_dereference_raw_check(ftrace_exports_list);
-	while (export) {
-		trace_process_export(export, event, flag);
-		export = rcu_dereference_raw_check(export->next);
-	}
-
-	preempt_enable_notrace();
-}
-
-static inline void
-add_trace_export(struct trace_export **list, struct trace_export *export)
-{
-	rcu_assign_pointer(export->next, *list);
-	/*
-	 * We are entering export into the list but another
-	 * CPU might be walking that list. We need to make sure
-	 * the export->next pointer is valid before another CPU sees
-	 * the export pointer included into the list.
-	 */
-	rcu_assign_pointer(*list, export);
-}
-
-static inline int
-rm_trace_export(struct trace_export **list, struct trace_export *export)
-{
-	struct trace_export **p;
-
-	for (p = list; *p != NULL; p = &(*p)->next)
-		if (*p == export)
-			break;
-
-	if (*p != export)
-		return -1;
-
-	rcu_assign_pointer(*p, (*p)->next);
-
-	return 0;
-}
-
-static inline void
-add_ftrace_export(struct trace_export **list, struct trace_export *export)
-{
-	ftrace_exports_enable(export);
-
-	add_trace_export(list, export);
-}
-
-static inline int
-rm_ftrace_export(struct trace_export **list, struct trace_export *export)
-{
-	int ret;
-
-	ret = rm_trace_export(list, export);
-	ftrace_exports_disable(export);
-
-	return ret;
-}
-
-int register_ftrace_export(struct trace_export *export)
-{
-	if (WARN_ON_ONCE(!export->write))
-		return -1;
-
-	mutex_lock(&ftrace_export_lock);
-
-	add_ftrace_export(&ftrace_exports_list, export);
-
-	mutex_unlock(&ftrace_export_lock);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(register_ftrace_export);
-
-int unregister_ftrace_export(struct trace_export *export)
-{
-	int ret;
-
-	mutex_lock(&ftrace_export_lock);
-
-	ret = rm_ftrace_export(&ftrace_exports_list, export);
-
-	mutex_unlock(&ftrace_export_lock);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(unregister_ftrace_export);
-
 void
 trace_function(struct trace_array *tr,
 	       unsigned long ip, unsigned long parent_ip, unsigned long flags,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
