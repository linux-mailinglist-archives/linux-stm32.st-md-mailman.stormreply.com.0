Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0127A7A1
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Sep 2020 08:36:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F11FDC424BA;
	Mon, 28 Sep 2020 06:36:15 +0000 (UTC)
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E71C3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 01:01:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601082115; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=XXQo52wVAC/YUknWi48RX9tleVqyBQmhoiJ/n2dbzRI=;
 b=t2Fn0q9doOy14tZr1SgJ5A7N9c/ygJAW7Fm9tTpzgbm24CS7B2GV4PpyE2YYuGvDkQnXZWuE
 hGHYyIWSdKKBy3Iczbu7YimFhPq53t33SedenhDXiVstNd1bRhU8uWACur4od8sYwTgtmT6m
 y8aNchg/XNKGmrQyn9hnRXFpyFg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f6e92cb9cd44bf51ac67654 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 26 Sep 2020 01:00:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CE336C433C8; Sat, 26 Sep 2020 01:00:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tingweiz-gv.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tingwei)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3643DC43382;
 Sat, 26 Sep 2020 01:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3643DC43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=tingwei@codeaurora.org
From: Tingwei Zhang <tingwei@codeaurora.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Sat, 26 Sep 2020 09:00:01 +0800
Message-Id: <20200926010005.14689-3-tingwei@codeaurora.org>
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
Subject: [Linux-stm32] [PATCH v4 2/6] tracing: add flag to control different
	traces
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

More traces like event trace or trace marker will be supported.
Add flag for difference traces, so that they can be controlled
separately. Move current function trace to it's own flag
instead of global ftrace enable flag.

Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Reviewed-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 include/linux/trace.h |  5 +++++
 kernel/trace/trace.c  | 36 +++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/include/linux/trace.h b/include/linux/trace.h
index 36d255d66f88..c115a5d2269f 100644
--- a/include/linux/trace.h
+++ b/include/linux/trace.h
@@ -3,6 +3,9 @@
 #define _LINUX_TRACE_H
 
 #ifdef CONFIG_TRACING
+
+#define TRACE_EXPORT_FUNCTION	BIT(0)
+
 /*
  * The trace export - an export of Ftrace output. The trace_export
  * can process traces and export them to a registered destination as
@@ -15,10 +18,12 @@
  * next		- pointer to the next trace_export
  * write	- copy traces which have been delt with ->commit() to
  *		  the destination
+ * flags	- which ftrace to be exported
  */
 struct trace_export {
 	struct trace_export __rcu	*next;
 	void (*write)(struct trace_export *, const void *, unsigned int);
+	int flags;
 };
 
 int register_ftrace_export(struct trace_export *export);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index f40d850ebabc..3ca121ad8728 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2744,33 +2744,37 @@ trace_buffer_unlock_commit_nostack(struct trace_buffer *buffer,
 
 static void
 trace_process_export(struct trace_export *export,
-	       struct ring_buffer_event *event)
+	       struct ring_buffer_event *event, int flag)
 {
 	struct trace_entry *entry;
 	unsigned int size = 0;
 
-	entry = ring_buffer_event_data(event);
-	size = ring_buffer_event_length(event);
-	export->write(export, entry, size);
+	if (export->flags & flag) {
+		entry = ring_buffer_event_data(event);
+		size = ring_buffer_event_length(event);
+		export->write(export, entry, size);
+	}
 }
 
 static DEFINE_MUTEX(ftrace_export_lock);
 
 static struct trace_export __rcu *ftrace_exports_list __read_mostly;
 
-static DEFINE_STATIC_KEY_FALSE(ftrace_exports_enabled);
+static DEFINE_STATIC_KEY_FALSE(trace_function_exports_enabled);
 
-static inline void ftrace_exports_enable(void)
+static inline void ftrace_exports_enable(struct trace_export *export)
 {
-	static_branch_enable(&ftrace_exports_enabled);
+	if (export->flags & TRACE_EXPORT_FUNCTION)
+		static_branch_inc(&trace_function_exports_enabled);
 }
 
-static inline void ftrace_exports_disable(void)
+static inline void ftrace_exports_disable(struct trace_export *export)
 {
-	static_branch_disable(&ftrace_exports_enabled);
+	if (export->flags & TRACE_EXPORT_FUNCTION)
+		static_branch_dec(&trace_function_exports_enabled);
 }
 
-static void ftrace_exports(struct ring_buffer_event *event)
+static void ftrace_exports(struct ring_buffer_event *event, int flag)
 {
 	struct trace_export *export;
 
@@ -2778,7 +2782,7 @@ static void ftrace_exports(struct ring_buffer_event *event)
 
 	export = rcu_dereference_raw_check(ftrace_exports_list);
 	while (export) {
-		trace_process_export(export, event);
+		trace_process_export(export, event, flag);
 		export = rcu_dereference_raw_check(export->next);
 	}
 
@@ -2818,8 +2822,7 @@ rm_trace_export(struct trace_export **list, struct trace_export *export)
 static inline void
 add_ftrace_export(struct trace_export **list, struct trace_export *export)
 {
-	if (*list == NULL)
-		ftrace_exports_enable();
+	ftrace_exports_enable(export);
 
 	add_trace_export(list, export);
 }
@@ -2830,8 +2833,7 @@ rm_ftrace_export(struct trace_export **list, struct trace_export *export)
 	int ret;
 
 	ret = rm_trace_export(list, export);
-	if (*list == NULL)
-		ftrace_exports_disable();
+	ftrace_exports_disable(export);
 
 	return ret;
 }
@@ -2884,8 +2886,8 @@ trace_function(struct trace_array *tr,
 	entry->parent_ip		= parent_ip;
 
 	if (!call_filter_check_discard(call, entry, buffer, event)) {
-		if (static_branch_unlikely(&ftrace_exports_enabled))
-			ftrace_exports(event);
+		if (static_branch_unlikely(&trace_function_exports_enabled))
+			ftrace_exports(event, TRACE_EXPORT_FUNCTION);
 		__buffer_unlock_commit(buffer, event);
 	}
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
