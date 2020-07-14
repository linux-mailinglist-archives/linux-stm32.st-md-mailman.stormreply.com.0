Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9022821FE0A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:04:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FEBFC36B2A;
	Tue, 14 Jul 2020 20:04:59 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 372CBC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:04:57 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id t15so2036816pjq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLlEel+6hkVFpJmPTSkYr9jJlciZ5vVR474YE3QPGUI=;
 b=J2al1fLyl+C52Ke+qEdt6M1Bbv8a6SBTdeYTQm9PdUTrHxKH6TblbNw6+xcL60+qML
 s+Fb1GjCAinYeKKMfupdyIwYHbuyHiGV5GdjwaP+4+S8bH2iOup0ev6zNRJ7kXXC8GQr
 CEqSJcWz6HnEQTD+JyK5kkRBduxnQNSJceHNgHd68kvx3+5Oy3X+V55jizyeh41D0QoA
 BOJlQhmfTS33b+QUEPNT51HsgqLNhSW9g6GvoefqOlDps8iEqy+iJk8UX5G7D3FEG3dr
 1U9PYiv7Yn+uT21VI9qlA/P3cLI4bqu2uWLSMzN0pPNas0Grw5Bt/bZtohj0kwknnKvh
 nM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLlEel+6hkVFpJmPTSkYr9jJlciZ5vVR474YE3QPGUI=;
 b=bSnlVYZK8WNO5yUxZhki5JnqxYC6VD56CYejt4zz83wAiO3M4UsxFXyficDvU0Z68l
 VF8ALfnciF9mv3E5To5HY00VbUAIShofLVrA/vaeV0GZv7G+VbgwUCUXbHDuoOU3uoN8
 A0xImkhxWASgmqIJbJXI1UN3Qf3e8o5sbZ7TStNQGo4BY5sWcx0VnaDMbBR2XNPGnqMu
 4C9+spXhrIy++outLMHXNKZCrHVGo465IuVEg4LDo0NqyoDJ3GpTpHfBVCXbivLxtylm
 nDYClI1Jk7lqdulG8u+kdDSDVmb3XwZjxI9uJ+v8YTn22u5iGiHgHRakxfhCPT7xJp2J
 qicg==
X-Gm-Message-State: AOAM5314JEG9CMCEdNctHEID0KVvYhEcN0LC+ck7hbvTW4sZOH9vuGQ3
 L1nq9BEsJdLqEQcoNlDC10VGPg==
X-Google-Smtp-Source: ABdhPJxYNLWJRYA87GVE2PmZT3pjEv+4tXiNcgg7HfZU4zaIdo175xOC9JQGh0zDYmdfjP1o83nP3w==
X-Received: by 2002:a17:90a:43c3:: with SMTP id
 r61mr6805055pjg.216.1594757095648; 
 Tue, 14 Jul 2020 13:04:55 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:04:55 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:40 -0600
Message-Id: <20200714200445.1427257-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 06/11] remoteproc: stm32: Properly set
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
 drivers/remoteproc/stm32_rproc.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 961a53f67ec5..f393f2503106 100644
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
@@ -636,12 +643,29 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
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
 static int stm32_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
 	struct rproc *rproc;
+	unsigned int state;
 	int ret;
 
 	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(32));
@@ -664,6 +688,13 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
