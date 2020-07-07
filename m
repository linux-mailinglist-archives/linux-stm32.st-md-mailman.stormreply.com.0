Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E28A9217A75
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2320C36B2A;
	Tue,  7 Jul 2020 21:31:25 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69781C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:23 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id gc15so1298304pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3MCXBkEweRCBCXnKkbvCmuaqKQRYPJZEhIYqjzffxA=;
 b=GZsKvRttTVdpRXiFAFQqLB/OSr1mbj6jtRxZCmNENnI2UyhGQ97vFRT73Rf53p1Pw/
 7Kv8tMfvl8SbjnJPz7hAgz2qL96nPrs5yxXLMJaXlz7IDv1viQhZd5q0U8gi1u8EUQ62
 I3TVIossUE8jTwWxWgD3bsaOGbA/z9LMxoQ1RVCFvVOP/kwVl80fSm3NS2bfjRNX73i5
 bdPpi2ievzipfaZk06WjSrTQJs4zFvIv59xVdtWnb2usDFSd5y4yaBg4OjVK3udXkBWE
 2yxbDGZ3Dbrv8WUhnmw9rQ/MqxfPgtE9PcZDdqSPjpPydg8wkR+dBP+gnZG2cTMr4D3Z
 xctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3MCXBkEweRCBCXnKkbvCmuaqKQRYPJZEhIYqjzffxA=;
 b=Ac/K+guYj75ASBYI+/JWbCmw4bFi8QDYJmRoMn8lMkfqsZu8s8HVcH30ksRT2N2vgC
 8JSnMAhcXcE31yP60iS/Y9av1qgtJpH4Sc9A4GMay4mDV+nGghhuMyF87XrLGIFG3iiT
 JuHSgbzBzvSuhuZHN/MaP6gEamsSbIX3LwkQG47o9HrtEmYyeliLG6CvDzXQDlkVk2Bx
 zschd3ey0h+4V42xgBtlVnjOTDu7/MXJzBiMFaDfbpOXe9riot7pXFFibu/PCPgW1Wku
 Rn91tpNphmre7vY3qqZAIX4I74igKEdD9Bt5uZDgrwDVSeWi+nsVj6A2sdZdfM5wOlbz
 d/ww==
X-Gm-Message-State: AOAM5318w2itvXHhJSyZGoXZa4yvt24H8ek8m7x8qZPPla+qxP5oTVat
 X+KnUafFoMCqhHZWM6abFNcHtQ==
X-Google-Smtp-Source: ABdhPJzK/vQWGHOgnTL/Tw1JIjnDO3iSBBS4unWLbbvc5+fevfix2oAOiUFAwNtcZMZEixXYa9AjMQ==
X-Received: by 2002:a17:902:c411:: with SMTP id
 k17mr44127764plk.165.1594157482000; 
 Tue, 07 Jul 2020 14:31:22 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:21 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:07 -0600
Message-Id: <20200707213112.928383-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 06/11] remoteproc: stm32: Properly set
	co-processor state when attaching
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

Introduce the required mechanic to set the state of the M4 in order
to properly deal with scenarios where the co-processor has been
started by another entity.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 961a53f67ec5..cbeb5ceb15c5 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -39,6 +39,13 @@
 #define STM32_MBX_VQ1_ID	1
 #define STM32_MBX_SHUTDOWN	"shutdown"
 
+#define M4_STATE_OFF		0
+#define M4_STATE_INI		1
+#define M4_STATE_CRUN		2
+#define M4_STATE_CSTOP		3
+#define M4_STATE_STANDBY	4
+#define M4_STATE_CRASH		5
+
 struct stm32_syscon {
 	struct regmap *map;
 	u32 reg;
@@ -636,12 +643,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 	return 0;
 }
 
+static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
+				     unsigned int *state)
+{
+	/* See stm32_rproc_parse_dt() */
+	if (!ddata->m4_state.map) {
+		/*
+		 * We couldn't get the coprocessor's state, assume
+		 * it is not running.
+		 */
+		state = M4_STATE_OFF;
+		return 0;
+	}
+
+	return regmap_read(ddata->m4_state.map, ddata->m4_state.reg, state);
+}
+
+
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	unsigned int state;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -664,6 +689,13 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	ret = stm32_rproc_get_m4_status(ddata, &state);
+	if (ret)
+		goto free_rproc;
+
+	if (state == M4_STATE_CRUN)
+		rproc->state = RPROC_DETACHED;
+
 	rproc->has_iommu = false;
 	ddata->workqueue = create_workqueue(dev_name(dev));
 	if (!ddata->workqueue) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
