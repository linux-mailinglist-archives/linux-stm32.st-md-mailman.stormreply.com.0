Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F104E8CA031
	for <lists+linux-stm32@lfdr.de>; Mon, 20 May 2024 17:52:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAF24C7129F;
	Mon, 20 May 2024 15:52:05 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D052C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2024 15:51:59 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KDxJsG030261;
 Mon, 20 May 2024 17:51:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=hsel/3AnsWqMvcvLhKt+H3+n/klED6301J96xkMZlkc=; b=0W
 GD+3cF8z4IyOBXZauTkTquEUNFKQH/4Yab55hkcXBAbfwldAcw11xcwfbSR8IekH
 g4MuRTN1JZVyKLULeYCqufddHyb9eed8lOzpW6fF9meg9M1paRkLNVYwACaIs3bT
 BvMw0oBmwn7ymEjlxRpc0CLPgHhgEE4E+pE+axacT/HnxzbV2dRIZIL32vwHLDLL
 hUUIAwX8t021d2xfLuI67JAA6uGWDkjh9KjXfuxf/apguTgvtbpUmARsJ0ZkbR9U
 lDX8rUeWykA0iLUdUeOb6+a5lRm3RD/T3QKoKtoJU9ElHnf/WubP8fRQiySXGuDn
 lPlG6yPrs8HwZiQILMvA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y779hnn2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2024 17:51:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D240F40044;
 Mon, 20 May 2024 17:51:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C1F7226FBD;
 Mon, 20 May 2024 17:50:59 +0200 (CEST)
Received: from localhost (10.252.8.132) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 17:50:58 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 20 May 2024 17:49:44 +0200
Message-ID: <20240520154948.690697-9-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520154948.690697-1-amelie.delaunay@foss.st.com>
References: <20240520154948.690697-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.8.132]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 08/12] dmaengine: stm32-dma3: add
	device_pause and device_resume ops
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

STM32 DMA3 controller is able to suspend an ongoing transfer (the transfer
is suspended after the ongoing burst is flushed to the destination) and
resume it from the point it was suspended. No need to reconfigure any
register.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index d379857d7aef..30cb18f382dc 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1249,6 +1249,35 @@ static int stm32_dma3_config(struct dma_chan *c, struct dma_slave_config *config
 	return 0;
 }
 
+static int stm32_dma3_pause(struct dma_chan *c)
+{
+	struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
+	int ret;
+
+	ret = stm32_dma3_chan_suspend(chan, true);
+	if (ret)
+		return ret;
+
+	chan->dma_status = DMA_PAUSED;
+
+	dev_dbg(chan2dev(chan), "vchan %pK: paused\n", &chan->vchan);
+
+	return 0;
+}
+
+static int stm32_dma3_resume(struct dma_chan *c)
+{
+	struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
+
+	stm32_dma3_chan_suspend(chan, false);
+
+	chan->dma_status = DMA_IN_PROGRESS;
+
+	dev_dbg(chan2dev(chan), "vchan %pK: resumed\n", &chan->vchan);
+
+	return 0;
+}
+
 static int stm32_dma3_terminate_all(struct dma_chan *c)
 {
 	struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
@@ -1485,6 +1514,8 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 	dma_dev->device_prep_dma_cyclic = stm32_dma3_prep_dma_cyclic;
 	dma_dev->device_caps = stm32_dma3_caps;
 	dma_dev->device_config = stm32_dma3_config;
+	dma_dev->device_pause = stm32_dma3_pause;
+	dma_dev->device_resume = stm32_dma3_resume;
 	dma_dev->device_terminate_all = stm32_dma3_terminate_all;
 	dma_dev->device_synchronize = stm32_dma3_synchronize;
 	dma_dev->device_tx_status = dma_cookie_status;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
