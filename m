Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A639A4EBEE6
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 12:37:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CA3AC60467;
	Wed, 30 Mar 2022 10:37:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA4E0C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 10:37:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U97xdG012932;
 Wed, 30 Mar 2022 12:36:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=d4JOb+YHVgrwP+08iqsQrB5MreHyNjkxKYaMVDOBz7o=;
 b=Qr1MR95AWC0XJrGwqmSl7B6W+eMtKVYe2AWGbrrubN0anGR3FrbdKKOXkaFrFGMXjxdE
 NBX+MA1BKZjwVg5hMlJAT0iHHZ4b0ue4FVNReguLmDI0e+bcTgrghPFancPtk3qT62SZ
 hNQP/Y4ySqceRZ2qRAzTVscehZrUJ2jFgM/RU/OrQ69mDdYGQTe6MeZEWAdvNLJO8zYN
 mQOFow6eulzujjBb9feE3Ta0HRBCC/yEgCmDaze1rdvo0X5Xm1gCdHuo4OPoo4tCNQux
 zaeV4L2xg478vju+Cc2oBplClP5oc1sv5j0vMtcRzrgUUZy6lQYL1fVX71R5WJvURl/H uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1s4pe9n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 12:36:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87C1710002A;
 Wed, 30 Mar 2022 12:36:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F7A521BF5E;
 Wed, 30 Mar 2022 12:36:46 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 30 Mar 2022 12:36:46
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 30 Mar 2022 12:36:45 +0200
Message-ID: <20220330103645.99969-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_03,2022-03-30_01,2022-02-23_01
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: check the channel
	availability (secure or not)
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

STM32_MDMA_CCR bit[8] is used to enable Secure Mode (SM). If this bit is
set, it means that all the channel registers are write-protected. So the
channel is not available for Linux use.

Add stm32_mdma_filter_fn() callback filter and give it to
__dma_request_chan (instead of dma_get_any_slave_channel()), to exclude the
channel if it is marked Secure.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Already sent few weeks ago. No change since
https://lore.kernel.org/lkml/20220117100300.14150-1-amelie.delaunay@foss.st.com/
---
 drivers/dma/stm32-mdma.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 6f57ff0e7b37..95e5831e490a 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -73,6 +73,7 @@
 #define STM32_MDMA_CCR_WEX		BIT(14)
 #define STM32_MDMA_CCR_HEX		BIT(13)
 #define STM32_MDMA_CCR_BEX		BIT(12)
+#define STM32_MDMA_CCR_SM		BIT(8)
 #define STM32_MDMA_CCR_PL_MASK		GENMASK(7, 6)
 #define STM32_MDMA_CCR_PL(n)		FIELD_PREP(STM32_MDMA_CCR_PL_MASK, (n))
 #define STM32_MDMA_CCR_TCIE		BIT(5)
@@ -248,6 +249,7 @@ struct stm32_mdma_device {
 	u32 nr_channels;
 	u32 nr_requests;
 	u32 nr_ahb_addr_masks;
+	u32 chan_reserved;
 	struct stm32_mdma_chan chan[STM32_MDMA_MAX_CHANNELS];
 	u32 ahb_addr_masks[];
 };
@@ -1456,10 +1458,23 @@ static void stm32_mdma_free_chan_resources(struct dma_chan *c)
 	chan->desc_pool = NULL;
 }
 
+static bool stm32_mdma_filter_fn(struct dma_chan *c, void *fn_param)
+{
+	struct stm32_mdma_chan *chan = to_stm32_mdma_chan(c);
+	struct stm32_mdma_device *dmadev = stm32_mdma_get_dev(chan);
+
+	/* Check if chan is marked Secure */
+	if (dmadev->chan_reserved & BIT(chan->id))
+		return false;
+
+	return true;
+}
+
 static struct dma_chan *stm32_mdma_of_xlate(struct of_phandle_args *dma_spec,
 					    struct of_dma *ofdma)
 {
 	struct stm32_mdma_device *dmadev = ofdma->of_dma_data;
+	dma_cap_mask_t mask = dmadev->ddev.cap_mask;
 	struct stm32_mdma_chan *chan;
 	struct dma_chan *c;
 	struct stm32_mdma_chan_config config;
@@ -1485,7 +1500,7 @@ static struct dma_chan *stm32_mdma_of_xlate(struct of_phandle_args *dma_spec,
 		return NULL;
 	}
 
-	c = dma_get_any_slave_channel(&dmadev->ddev);
+	c = __dma_request_channel(&mask, stm32_mdma_filter_fn, &config, ofdma->of_node);
 	if (!c) {
 		dev_err(mdma2dev(dmadev), "No more channels available\n");
 		return NULL;
@@ -1615,6 +1630,10 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 	for (i = 0; i < dmadev->nr_channels; i++) {
 		chan = &dmadev->chan[i];
 		chan->id = i;
+
+		if (stm32_mdma_read(dmadev, STM32_MDMA_CCR(i)) & STM32_MDMA_CCR_SM)
+			dmadev->chan_reserved |= BIT(i);
+
 		chan->vchan.desc_free = stm32_mdma_desc_free;
 		vchan_init(&chan->vchan, dd);
 	}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
