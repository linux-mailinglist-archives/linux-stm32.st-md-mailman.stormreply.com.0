Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 059961EA8BB
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:56:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C22EBC36B28;
	Mon,  1 Jun 2020 17:56:05 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E919DC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:56:03 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id 5so172418pjd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UjRIi2EJxbL5MBHfOKyrAGQUtxoKwiBe/CM48DHAMvM=;
 b=XtiuiNP724RWlnK84qm9/l1Ohi6G22E5lgTFSt4VRQFtx4jQQi5z8CziOfBSHWV7ae
 X7tjiaz1jgwd13ysS5MS2pOV7lNtEofx5PURxUVko8WUZzwtgojiMJT6CnqCYUYM+b3z
 unMjjSsTMU6AOj8+YcFmkpy57FoXzTwuEgaIQHmPGmq3ooZNZPmuSSzOwaJnOQCXCLV1
 w9c2kcoXlePiTbsAx3Kwdm8btVOuETPx9FFjf9T8hvEgrrHFLmtS59XaQCC1h+d98LgV
 9OZkPnhaiseYjnLZt/GGkIZMAUOzyumOlm595fNYngpxtwk2K1tZJ0qCyzunV9fn9Nl9
 m8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UjRIi2EJxbL5MBHfOKyrAGQUtxoKwiBe/CM48DHAMvM=;
 b=ecURmaBvRHsKg2o2HmvsFl+Sh+L8tize7nvPZ0vtOdRLa4gahPKYdIdU94k1pbhrnj
 oAfiEwGat4pucAkhGwugHEUgLutyrOb/Dm+IwBTj98/HrvUUrHDq2FmAetRE+NVANWbH
 K3LRUh0FTghx9WX/zJlS/Dlyw+yftnzcK05ooqmqe4PXfewd5s0Q0lfLeV/TxVTTGBQK
 xqKDVF9hPFn+HQiQsKAsGJbPcjvA86aZQPAADuDHz/pIrBzP6OFVVXADpGTHNX99XhCl
 KjUtGxkMZSXp+2cPNTZOyiwyRXrdqz5jgP4zgZ+qCWRFKogGJYqV7XIeIWwDN/rFZi8z
 xpRA==
X-Gm-Message-State: AOAM53359+q3G5Kz8mtK+74dzwuOUSQiuw02vsB8vIdLjBKDPHqx55+f
 XzMTtie3TVwmWBIoWp00QVh5nA==
X-Google-Smtp-Source: ABdhPJy5nT7+CY/1aFdlTpP4oiTag5rh3vPEE5Tw3v78GbxlhWqMZA7DHmoAbLMSI6xhzJOof+CiwA==
X-Received: by 2002:a17:902:7e41:: with SMTP id
 a1mr20962820pln.72.1591034162457; 
 Mon, 01 Jun 2020 10:56:02 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:56:02 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:47 -0600
Message-Id: <20200601175552.22286-7-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 06/11] remoteproc: stm32: Properly set
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
stated by another entity.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 80fd8fd831da..2154c8b90a2a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -38,6 +38,13 @@
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
@@ -635,12 +642,30 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
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
@@ -663,6 +688,13 @@ static int stm32_rproc_probe(struct platform_device *pdev)
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
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
