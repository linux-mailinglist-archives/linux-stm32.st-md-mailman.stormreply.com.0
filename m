Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3651225BAF6
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Sep 2020 08:19:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC1CCC3FAFE;
	Thu,  3 Sep 2020 06:19:33 +0000 (UTC)
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A385C3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Sep 2020 00:18:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599092291; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/cPhb+gGOs1DePmkbBXbDUkj/+DPAUVO3PMNwpoHWUU=;
 b=dZKavcURc/531ca3OTgMe8LBrU9l/A+mk3O0/EHCzzuQz+Hputgrip2J1X0FNWmmZQKCFqhS
 HKjcFXODsJiibdejEDu5J0wyFVBOQrnM0MEfNrb8KJaxQwhCIRVle9nr+A333xw3OJyjcYoP
 Q84taDopAnTHX+LN8J3i3mxmJDw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1Njk0YyIsICJsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f50363254e87432be15a447 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 00:17:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0E4F2C433A0; Thu,  3 Sep 2020 00:17:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tingweiz-gv.qualcomm.com (unknown [180.166.53.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tingwei)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 80541C433C9;
 Thu,  3 Sep 2020 00:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 80541C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tingwei@codeaurora.org
From: Tingwei Zhang <tingwei@codeaurora.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Thu,  3 Sep 2020 08:17:05 +0800
Message-Id: <20200903001706.28147-6-tingwei@codeaurora.org>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20200903001706.28147-1-tingwei@codeaurora.org>
References: <20200903001706.28147-1-tingwei@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Sep 2020 06:19:31 +0000
Cc: tsoni@codeaurora.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mao Jinlong <jinlmao@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 5/6] stm class: ftrace: enable supported
	trace export flag
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

Set flags for trace_export. Export function trace, event trace
and trace marker to stm.

Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 drivers/hwtracing/stm/ftrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwtracing/stm/ftrace.c b/drivers/hwtracing/stm/ftrace.c
index ce868e095410..c694a6e692d1 100644
--- a/drivers/hwtracing/stm/ftrace.c
+++ b/drivers/hwtracing/stm/ftrace.c
@@ -46,6 +46,8 @@ static int stm_ftrace_link(struct stm_source_data *data)
 	struct stm_ftrace *sf = container_of(data, struct stm_ftrace, data);
 
 	sf->ftrace.write = stm_ftrace_write;
+	sf->ftrace.flags = TRACE_EXPORT_FUNCTION | TRACE_EXPORT_EVENT
+			| TRACE_EXPORT_MARKER;
 
 	return register_ftrace_export(&sf->ftrace);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
