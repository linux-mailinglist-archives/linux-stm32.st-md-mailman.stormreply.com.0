Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FABE99E95B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 14:16:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3922FC78032;
	Tue, 15 Oct 2024 12:16:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F68EC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 12:16:26 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FCDgww007077;
 Tue, 15 Oct 2024 14:16:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 20xEPx4JtIHJKB3XkmoT5ueiiLey/iQq4U2NsvYq/Ns=; b=a/1U2B53urKib74m
 Ja3HrZUBazeMf49Au1g9cUARiJ0XAHYE0wbVqm35HR8ptcc0VlfGODPK0u1NUsAg
 HrNFd1XDnsXQgjiQZF6JC8aT71Ug05c+FyiCKpaDiTambe1tVNr5RLR58s2OTFoM
 XJcLqpcAszgwU7kZN2PE21ue/NAIQNd+HX9W4DOsf9dd0WcMsp+Sp3kII2w4Vn0O
 XkpERlJ7fmR8TyG5vi9yHWMDAsPaO8Z4nSy9b2guFAhZxQzR/eyk+3JbjIuHU+Bc
 m6BFCacNpgpP5GB92q9dfQ2eoPKzfHNxi57kLXbY+UArnIWNqtO/zlsvyFnHzXjb
 Tz2i0Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4282p12r85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Oct 2024 14:16:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AA2C140069;
 Tue, 15 Oct 2024 14:15:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07D1E22233D;
 Tue, 15 Oct 2024 14:14:48 +0200 (CEST)
Received: from localhost (10.48.87.35) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 15 Oct
 2024 14:14:47 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 15 Oct 2024 14:14:38 +0200
MIME-Version: 1.0
Message-ID: <20241015-dma3-mp25-updates-v2-2-b63e21556ec8@foss.st.com>
References: <20241015-dma3-mp25-updates-v2-0-b63e21556ec8@foss.st.com>
In-Reply-To: <20241015-dma3-mp25-updates-v2-0-b63e21556ec8@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.35]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/9] dmaengine: stm32-dma3: prevent
 pack/unpack thanks to DT configuration
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

When source data width/burst and destination data width/burst are
different, data are packed or unpacked in DMA3 channel FIFO, using
CxTR1.PAM.
Data are pushed out from DMA3 channel FIFO when the destination burst
length (= data width * burst) is reached.
If the transfer is stopped before CxBR1.BNDT = 0, and if some bytes are
packed/unpacked in the DMA3 channel FIFO, these bytes are lost.
Indeed, DMA3 channel FIFO has no flush capability, only reset.
To avoid potential bytes lost, pack/unpack must be prevented by setting
memory data width/burst equal to peripheral data width/burst.
Memory accesses will be penalized. But it is the only way to avoid bytes
lost.

Prevent pack/unpack feature can be activated by setting bit 16 of DMA3
Transfer requirements bitfield (tr_conf) in device tree.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32/stm32-dma3.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index b9470f783f98940a99addaeef6d0a8bc07b5c54b..f793eecd2c27ca17cedd5cabbaa1b1beca202039 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -221,6 +221,7 @@ enum stm32_dma3_port_data_width {
 #define STM32_DMA3_DT_BREQ		BIT(8) /* CTR2_BREQ */
 #define STM32_DMA3_DT_PFREQ		BIT(9) /* CTR2_PFREQ */
 #define STM32_DMA3_DT_TCEM		GENMASK(13, 12) /* CTR2_TCEM */
+#define STM32_DMA3_DT_NOPACK		BIT(16) /* CTR1_PAM */
 
 /* struct stm32_dma3_chan .config_set bitfield */
 #define STM32_DMA3_CFG_SET_DT		BIT(0)
@@ -622,6 +623,10 @@ static int stm32_dma3_chan_prep_hw(struct stm32_dma3_chan *chan, enum dma_transf
 		/* Set source (memory) data width and burst */
 		sdw = stm32_dma3_get_max_dw(chan->max_burst, sap_max_dw, len, src_addr);
 		sbl_max = stm32_dma3_get_max_burst(len, sdw, chan->max_burst);
+		if (!!FIELD_GET(STM32_DMA3_DT_NOPACK, tr_conf)) {
+			sdw = ddw;
+			sbl_max = dbl_max;
+		}
 
 		_ctr1 |= FIELD_PREP(CTR1_SDW_LOG2, ilog2(sdw));
 		_ctr1 |= FIELD_PREP(CTR1_SBL_1, sbl_max - 1);
@@ -652,6 +657,11 @@ static int stm32_dma3_chan_prep_hw(struct stm32_dma3_chan *chan, enum dma_transf
 		/* Set destination (memory) data width and burst */
 		ddw = stm32_dma3_get_max_dw(chan->max_burst, dap_max_dw, len, dst_addr);
 		dbl_max = stm32_dma3_get_max_burst(len, ddw, chan->max_burst);
+		if (!!FIELD_GET(STM32_DMA3_DT_NOPACK, tr_conf) ||
+		    ((_ctr2 & CTR2_PFREQ) && ddw > sdw)) { /* Packing to wider ddw not supported */
+			ddw = sdw;
+			dbl_max = sbl_max;
+		}
 
 		_ctr1 |= FIELD_PREP(CTR1_SDW_LOG2, ilog2(sdw));
 		_ctr1 |= FIELD_PREP(CTR1_SBL_1, sbl_max - 1);

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
