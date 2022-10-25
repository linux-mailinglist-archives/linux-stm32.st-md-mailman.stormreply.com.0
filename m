Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7CC60C664
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Oct 2022 10:27:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C042CC03FC9;
	Tue, 25 Oct 2022 08:27:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63946C01E96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666686421; x=1698222421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/8wa08b9rvNl5cMcmZVDXdij/gFrnDmrwVc10g0xUnw=;
 b=APXHlNuxm+rXY0irf5RqJOe9B0x/8rFDDthkLUEUUwIowprvOZbIPNag
 wtLDRGJ9SfmwidzvpWaA21Zc0GNRrH4eL9RMl06jfisDQginRs6fncevq
 yS2qC96kFZ8WLdHlKnFZeYm4BDI3IpszRjT9FHVniyfiVikiYvEcYC4U/
 IgQSDGHAfeP7F9grhNgfmWm0aIHomJ0g7HkCa7yHMb25Uabn1OTmgxm2z
 DyXOcExTh5kjgwxs5+iAM3adjhfVnkXM33H6Sbpx9mLFI3Atg6lD+WHrT
 Dpi08QKWUrPU+FQyTSjZVhRlyI7gY4cu4R9SychBBU98bZ6bjS19ToRgH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="287340494"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="287340494"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 01:26:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="582697282"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="582697282"
Received: from junxiaochang.bj.intel.com ([10.238.135.52])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2022 01:26:55 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, Joao.Pinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Oct 2022 16:17:47 +0800
Message-Id: <20221025081747.1884926-1-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: junxiao.chang@intel.com, veekhee@gmail.com
Subject: [Linux-stm32] [PATCH net-next,
	v2] net: stmmac: remove duplicate dma queue channel macros
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

It doesn't need extra macros for queue 0 & 4. Same macro could
be used for all 8 queues. Related queue/channel functions could
be combined together.

Original macro which has two same parameters is unsafe macro and
might have potential side effects. Each MTL RxQ DMA channel mask
is 4 bits, so using (0xf << chan) instead of GENMASK(x + 3, x) to
avoid unsafe macro.

Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
v2: combined "if (queue < 4)" and "else" according to Vee Khee's suggestion.
v1: https://lore.kernel.org/r/20221025053555.1883731-1-junxiao.chang@intel.com
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  4 +---
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 21 ++++++-------------
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 71dad409f78b0..ccd49346d3b30 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -331,9 +331,7 @@ enum power_event {
 
 #define MTL_RXQ_DMA_MAP0		0x00000c30 /* queue 0 to 3 */
 #define MTL_RXQ_DMA_MAP1		0x00000c34 /* queue 4 to 7 */
-#define MTL_RXQ_DMA_Q04MDMACH_MASK	GENMASK(3, 0)
-#define MTL_RXQ_DMA_Q04MDMACH(x)	((x) << 0)
-#define MTL_RXQ_DMA_QXMDMACH_MASK(x)	GENMASK(11 + (8 * ((x) - 1)), 8 * (x))
+#define MTL_RXQ_DMA_QXMDMACH_MASK(x)	(0xf << 8 * (x))
 #define MTL_RXQ_DMA_QXMDMACH(chan, q)	((chan) << (8 * (q)))
 
 #define MTL_CHAN_BASE_ADDR		0x00000d00
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c25bfecb4a2df..513f6ea335a82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -214,26 +214,17 @@ static void dwmac4_map_mtl_dma(struct mac_device_info *hw, u32 queue, u32 chan)
 	void __iomem *ioaddr = hw->pcsr;
 	u32 value;
 
-	if (queue < 4)
+	if (queue < 4) {
 		value = readl(ioaddr + MTL_RXQ_DMA_MAP0);
-	else
-		value = readl(ioaddr + MTL_RXQ_DMA_MAP1);
-
-	if (queue == 0 || queue == 4) {
-		value &= ~MTL_RXQ_DMA_Q04MDMACH_MASK;
-		value |= MTL_RXQ_DMA_Q04MDMACH(chan);
-	} else if (queue > 4) {
-		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue - 4);
-		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue - 4);
-	} else {
 		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue);
 		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue);
-	}
-
-	if (queue < 4)
 		writel(value, ioaddr + MTL_RXQ_DMA_MAP0);
-	else
+	} else {
+		value = readl(ioaddr + MTL_RXQ_DMA_MAP1);
+		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue - 4);
+		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue - 4);
 		writel(value, ioaddr + MTL_RXQ_DMA_MAP1);
+	}
 }
 
 static void dwmac4_config_cbs(struct mac_device_info *hw,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
