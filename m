Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F80327A7A0
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Sep 2020 08:36:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2CF5C424B7;
	Mon, 28 Sep 2020 06:36:15 +0000 (UTC)
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EE48C3FADF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Sep 2020 01:01:50 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601082113; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KYo1MEwXVCcSihTHW3CCwSJaU7l9vAJrjZOB2qJD3BI=;
 b=M3EGK/QNbdis9d7LbXMcY6D8jX+vhb3BWeORjoaXh4byKMW1MSXpmVf5JyvgYgi6gUdzhDUY
 EYmfrXGyu7qFkZTlkUWI9VLsOE0o8KcwF0DB5y0SQBRfTa2RUR8UdDikyHuOWr5X0t/NEtbN
 0Zbblyhpw1DYZbzNfJmwnjY3jBc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f6e92d3971b64f61b15ca55 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 26 Sep 2020 01:01:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F771C433C8; Sat, 26 Sep 2020 01:01:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tingweiz-gv.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tingwei)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 01043C433CA;
 Sat, 26 Sep 2020 01:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01043C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=tingwei@codeaurora.org
From: Tingwei Zhang <tingwei@codeaurora.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Sat, 26 Sep 2020 09:00:03 +0800
Message-Id: <20200926010005.14689-5-tingwei@codeaurora.org>
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
Subject: [Linux-stm32] [PATCH v4 4/6] tracing: add trace_export support for
	trace_marker
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

Add the support to route trace_marker buffer to other destination
via trace_export.

Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Reviewed-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
---
 include/linux/trace.h | 1 +
 kernel/trace/trace.c  | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/trace.h b/include/linux/trace.h
index 86033d214972..886a4ffd9d45 100644
--- a/include/linux/trace.h
+++ b/include/linux/trace.h
@@ -6,6 +6,7 @@
 
 #define TRACE_EXPORT_FUNCTION	BIT(0)
 #define TRACE_EXPORT_EVENT	BIT(1)
+#define TRACE_EXPORT_MARKER	BIT(2)
 
 /*
  * The trace export - an export of Ftrace output. The trace_export
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index a40ee413123c..6048fba2f590 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -271,6 +271,7 @@ static struct trace_export __rcu *ftrace_exports_list __read_mostly;
 
 static DEFINE_STATIC_KEY_FALSE(trace_function_exports_enabled);
 static DEFINE_STATIC_KEY_FALSE(trace_event_exports_enabled);
+static DEFINE_STATIC_KEY_FALSE(trace_marker_exports_enabled);
 
 static inline void ftrace_exports_enable(struct trace_export *export)
 {
@@ -279,6 +280,9 @@ static inline void ftrace_exports_enable(struct trace_export *export)
 
 	if (export->flags & TRACE_EXPORT_EVENT)
 		static_branch_inc(&trace_event_exports_enabled);
+
+	if (export->flags & TRACE_EXPORT_MARKER)
+		static_branch_inc(&trace_marker_exports_enabled);
 }
 
 static inline void ftrace_exports_disable(struct trace_export *export)
@@ -288,6 +292,9 @@ static inline void ftrace_exports_disable(struct trace_export *export)
 
 	if (export->flags & TRACE_EXPORT_EVENT)
 		static_branch_dec(&trace_event_exports_enabled);
+
+	if (export->flags & TRACE_EXPORT_MARKER)
+		static_branch_dec(&trace_marker_exports_enabled);
 }
 
 static void ftrace_exports(struct ring_buffer_event *event, int flag)
@@ -6687,6 +6694,8 @@ tracing_mark_write(struct file *filp, const char __user *ubuf,
 	} else
 		entry->buf[cnt] = '\0';
 
+	if (static_branch_unlikely(&trace_marker_exports_enabled))
+		ftrace_exports(event, TRACE_EXPORT_MARKER);
 	__buffer_unlock_commit(buffer, event);
 
 	if (tt)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
