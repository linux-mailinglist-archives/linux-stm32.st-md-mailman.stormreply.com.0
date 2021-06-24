Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD083B2B91
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jun 2021 11:40:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEAA4C57196;
	Thu, 24 Jun 2021 09:40:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CCFDC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jun 2021 09:40:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O9c7k6004760; Thu, 24 Jun 2021 11:40:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=9K0el6v2S3oKMB5e1ZaxFrvwWS0dlKkQ3UZ872NGc4Y=;
 b=AdVlWRK2w8f7UVERcqRWi4Mzb445fmvGbq+ovAx28WncX4MndbuJMve8H3gyGSftpxgR
 9UXTMlvDMD0g9lI6fLZsj5PChu0tKJ7T8akQDTCvGgHsEC8hPGk/wF90ev4QdXT8mFmd
 prWKYFOmg3dBW42DDbYFLXrkw8FveOZ0ebLoNR9w1qqsAfdrRuHFmTC7a2Z6tBjbjmPT
 HVhatxSscaZv60jKozTRjV01vNW1fl8OQhHLbgJwVgAdIStOFWqVTfYrptl5KELXmcWq
 vvUs82xEsGcJAJiQebHZvNE+7NAvkqzRRPeG3PluV4vftSU+s8595MD48zFrrR0Tcbg3 DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39chf6jsvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jun 2021 11:40:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D9AA100034;
 Thu, 24 Jun 2021 11:40:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1377921B518;
 Thu, 24 Jun 2021 11:40:05 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 24 Jun 2021 11:40:04
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 24 Jun 2021 11:39:59 +0200
Message-ID: <20210624093959.142265-3-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210624093959.142265-1-amelie.delaunay@foss.st.com>
References: <20210624093959.142265-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-24_06:2021-06-24,
 2021-06-24 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] dmaengine: stm32-dma: add alternate
	REQ/ACK protocol management
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

STM32 USART/UART is not managing correctly the default DMA REQ/ACK protocol
leading to possibly lock the DMA stream.
Default protocol consists in maintaining ACK signal up to the removal of
REQuest and the transfer completion.
In case of alternative REQ/ACK protocol, ACK de-assertion does not wait the
removal of the REQuest, but only the transfer completion.

This patch retrieves the need of the alternative protocol through the
device tree, and sets the protocol accordingly.
It also unwrap STM32_DMA_DIRECT_MODE_GET macro definition for consistency
with new STM32_DMA_ALT_ACK_MODE_GET macro definition.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-dma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index f54ecb123a52..d3aa34b3d2f7 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -60,6 +60,7 @@
 #define STM32_DMA_SCR_PSIZE_GET(n)	((n & STM32_DMA_SCR_PSIZE_MASK) >> 11)
 #define STM32_DMA_SCR_DIR_MASK		GENMASK(7, 6)
 #define STM32_DMA_SCR_DIR(n)		((n & 0x3) << 6)
+#define STM32_DMA_SCR_TRBUFF		BIT(20) /* Bufferable transfer for USART/UART */
 #define STM32_DMA_SCR_CT		BIT(19) /* Target in double buffer */
 #define STM32_DMA_SCR_DBM		BIT(18) /* Double Buffer Mode */
 #define STM32_DMA_SCR_PINCOS		BIT(15) /* Peripheral inc offset size */
@@ -138,8 +139,9 @@
 #define STM32_DMA_THRESHOLD_FTR_MASK	GENMASK(1, 0)
 #define STM32_DMA_THRESHOLD_FTR_GET(n)	((n) & STM32_DMA_THRESHOLD_FTR_MASK)
 #define STM32_DMA_DIRECT_MODE_MASK	BIT(2)
-#define STM32_DMA_DIRECT_MODE_GET(n)	(((n) & STM32_DMA_DIRECT_MODE_MASK) \
-					 >> 2)
+#define STM32_DMA_DIRECT_MODE_GET(n)	(((n) & STM32_DMA_DIRECT_MODE_MASK) >> 2)
+#define STM32_DMA_ALT_ACK_MODE_MASK	BIT(4)
+#define STM32_DMA_ALT_ACK_MODE_GET(n)	(((n) & STM32_DMA_ALT_ACK_MODE_MASK) >> 4)
 
 enum stm32_dma_width {
 	STM32_DMA_BYTE,
@@ -1252,6 +1254,8 @@ static void stm32_dma_set_config(struct stm32_dma_chan *chan,
 	chan->threshold = STM32_DMA_THRESHOLD_FTR_GET(cfg->features);
 	if (STM32_DMA_DIRECT_MODE_GET(cfg->features))
 		chan->threshold = STM32_DMA_FIFO_THRESHOLD_NONE;
+	if (STM32_DMA_ALT_ACK_MODE_GET(cfg->features))
+		chan->chan_reg.dma_scr |= STM32_DMA_SCR_TRBUFF;
 }
 
 static struct dma_chan *stm32_dma_of_xlate(struct of_phandle_args *dma_spec,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
