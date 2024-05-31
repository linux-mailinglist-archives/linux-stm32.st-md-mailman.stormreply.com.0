Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C968D6546
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 17:10:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EB23C712A1;
	Fri, 31 May 2024 15:10:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F157C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 15:10:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VDnIcl015872;
 Fri, 31 May 2024 17:10:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 64wt0pzZ2kSRPpOSzALQl3R/464mRk7ij9nfrGdQFww=; b=kZPcKcj5E94ulSWg
 4XQYKORgCPyuDzJ9S818wavq/eIAdCOpqkcRtQBbABps+NVHdEbrfO+p44Zlo7dH
 yxrB9O2HD2JOBjnjGAwUiezb/SZaOr5moSz7MQs+ROI2KWEmny7gNedFM7r9u5gr
 Suq1PbutAml0ot/ZnemsxjD37iwANtZhi4sSsbAoKYyRPSXKsW6Zlm4SwHhRiTkw
 AlZPEHzvSpRML4qXirzuKvcMhkIK54W9kJ/4Y9HnVyD9UU8XlashGosyWPzEd16R
 Jx1emC+6JkVCUACFTMmD+SrBIVKM15tQ0Zvz7sSmtxPS8kUpRiDtvUqppKrhQhjf
 1tytmw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yba52ceqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:10:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D3D9840048;
 Fri, 31 May 2024 17:10:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EAF5207FF0;
 Fri, 31 May 2024 17:09:25 +0200 (CEST)
Received: from localhost (10.252.27.179) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 17:09:24 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 31 May 2024 17:07:11 +0200
Message-ID: <20240531150712.2503554-12-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531150712.2503554-1-amelie.delaunay@foss.st.com>
References: <20240531150712.2503554-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.27.179]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_11,2024-05-30_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 11/12] dmaengine: stm32-dma3: defer channel
	registration to specify channel name
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

On STM32 DMA3, channels can be reserved, so they are non available for
Linux. This non-availability creates a mismatch between dma_chan id and
DMA3 channel id.

Use dma_async_device_channel_register() to register the channels
after controller registration and change the default channel name, so that
it can match the name in the Reference Manual and ease requesting a channel
thanks to its name.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 9249b64a4455..4e932c2931dc 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1732,9 +1732,6 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 		chan->fifo_size = get_chan_hwcfg(i, G_FIFO_SIZE(i), hwcfgr);
 		/* If chan->fifo_size > 0 then half of the fifo size, else no burst when no FIFO */
 		chan->max_burst = (chan->fifo_size) ? (1 << (chan->fifo_size + 1)) / 2 : 0;
-		chan->vchan.desc_free = stm32_dma3_chan_vdesc_free;
-
-		vchan_init(&chan->vchan, dma_dev);
 	}
 
 	ret = dmaenginem_async_device_register(dma_dev);
@@ -1742,14 +1739,26 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 		goto err_clk_disable;
 
 	for (i = 0; i < ddata->dma_channels; i++) {
+		char name[12];
+
 		if (chan_reserved & BIT(i))
 			continue;
 
+		chan = &ddata->chans[i];
+		snprintf(name, sizeof(name), "dma%dchan%d", ddata->dma_dev.dev_id, chan->id);
+
+		chan->vchan.desc_free = stm32_dma3_chan_vdesc_free;
+		vchan_init(&chan->vchan, dma_dev);
+
+		ret = dma_async_device_channel_register(&ddata->dma_dev, &chan->vchan.chan, name);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "Failed to register channel %s\n", name);
+			goto err_clk_disable;
+		}
+
 		ret = platform_get_irq(pdev, i);
 		if (ret < 0)
 			goto err_clk_disable;
-
-		chan = &ddata->chans[i];
 		chan->irq = ret;
 
 		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
