Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700F607693
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 13:56:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB584C6411E;
	Fri, 21 Oct 2022 11:56:33 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D626C64108
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666353392; x=1697889392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4ReGExCC4IsU35G/nCfB0MLcAh4NzfBpvMtiQxP8CQ=;
 b=Xx3iRZfs0d7ISArk8hkN3oKlOf9qp3MWjZM+BRM50QtD2tYsz3gszdj3
 0QpvV0oQniwysuY6euUQt5ZhaIxHU4/rm9vSCSNDbh/N296oG3w0Rng2Q
 zMdmV4uPtvs4z6j3vB8vmxO5FdErm2p0uQcbw1adtxSRyYdNnGFVPMELW
 HfwPgtOKnleQT8QavAvbEVnQyPIiag/7O1G5mmhvjShuyTB9gG3bIIcQS
 SWfdQjcUjWgIBq336X4knddM1cM5v6AGYkXEZrysOjw7NlfWnAX59G5fL
 des7+oTMMhbk36ObjAjo+hOHwhh6SR1yWwP62SIEjHNZWRfBO5vzdiT3K A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="305722088"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="305722088"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:56:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="632891131"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="632891131"
Received: from junxiaochang.bj.intel.com ([10.238.135.52])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 04:56:28 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, Joao.Pinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 21 Oct 2022 19:47:11 +0800
Message-Id: <20221021114711.1610797-2-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021114711.1610797-1-junxiao.chang@intel.com>
References: <20221021114711.1610797-1-junxiao.chang@intel.com>
MIME-Version: 1.0
Cc: junxiao.chang@intel.com
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: remove duplicate
	dma queue channel macros
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
be used for all 8 queues.

Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      |  2 --
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 11 ++++-------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index 3c1490408a1c3..ccd49346d3b30 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -331,8 +331,6 @@ enum power_event {
 
 #define MTL_RXQ_DMA_MAP0		0x00000c30 /* queue 0 to 3 */
 #define MTL_RXQ_DMA_MAP1		0x00000c34 /* queue 4 to 7 */
-#define MTL_RXQ_DMA_Q04MDMACH_MASK	GENMASK(3, 0)
-#define MTL_RXQ_DMA_Q04MDMACH(x)	((x) << 0)
 #define MTL_RXQ_DMA_QXMDMACH_MASK(x)	(0xf << 8 * (x))
 #define MTL_RXQ_DMA_QXMDMACH(chan, q)	((chan) << (8 * (q)))
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c25bfecb4a2df..64b916728bdd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -219,15 +219,12 @@ static void dwmac4_map_mtl_dma(struct mac_device_info *hw, u32 queue, u32 chan)
 	else
 		value = readl(ioaddr + MTL_RXQ_DMA_MAP1);
 
-	if (queue == 0 || queue == 4) {
-		value &= ~MTL_RXQ_DMA_Q04MDMACH_MASK;
-		value |= MTL_RXQ_DMA_Q04MDMACH(chan);
-	} else if (queue > 4) {
-		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue - 4);
-		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue - 4);
-	} else {
+	if (queue < 4) {
 		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue);
 		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue);
+	} else {
+		value &= ~MTL_RXQ_DMA_QXMDMACH_MASK(queue - 4);
+		value |= MTL_RXQ_DMA_QXMDMACH(chan, queue - 4);
 	}
 
 	if (queue < 4)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
