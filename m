Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F378960C36E
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Oct 2022 07:45:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F2C8C03FC9;
	Tue, 25 Oct 2022 05:45:11 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9743EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 05:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666676709; x=1698212709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p2UaT46WgwCPZyBsHVRtMczv0jT1EuB9P7Y5ogY+vmE=;
 b=WxCjd50v3UOG6m8wJzKcdTKxsYk6KopXVa7Mr0hT+eOMwuFtahBEc+Io
 LmtRplZBMtSE74jjuBjQn6OInKt11XV+U55s66eibNYtgD28R4p0W88OB
 /xlwbp0SJ3904RrlPqKFbbJdwoyAWGwPgyo7v85pdqeeKnOZdKsGPvmPL
 TR92UyJdsgf1Bm2H8+DfJ8+Y8JQdPn911167iN4kX/lbHon+b62WE/1In
 lI93SclMYWem45e1sAovjpPKwXRc/Hwl6Zubnqt44W0nBgd6fjAveadvY
 X9h/1dlIJaWwtfy3KGqukAkBXe0ESoUNYVQ4eZQDRNTnVNYb/Lh9b1vDI Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="306323799"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="306323799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 22:45:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="694824890"
X-IronPort-AV: E=Sophos;i="5.95,211,1661842800"; d="scan'208";a="694824890"
Received: from junxiaochang.bj.intel.com ([10.238.135.52])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 22:45:04 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, Joao.Pinto@synopsys.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 25 Oct 2022 13:35:55 +0800
Message-Id: <20221025053555.1883731-1-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: junxiao.chang@intel.com
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: remove duplicate dma
	queue channel macros
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

Original macro which has two same parameters is unsafe macro and
might have potential side effects. Each MTL RxQ DMA channel mask
is 4 bits, so using (0xf << chan) instead of GENMASK(x + 3, x) to
avoid unsafe macro.

Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      |  4 +---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 11 ++++-------
 2 files changed, 5 insertions(+), 10 deletions(-)

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
