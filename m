Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8D768DB7
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0A3EC6C832;
	Mon, 31 Jul 2023 07:17:27 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DD76C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jul 2023 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689595701; x=1721131701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O3yP0T0bW+xJPNEoHbl0Tg6ZcW8tghAmjL0CP7lEp9o=;
 b=MxJh3lyrdZU5r92gfq5jr0HFMMACJi+B18+ckhgw9c/JNZhYOVwTpK1j
 /2+9DD94/XTsIKGhlsEe0kHsPAlBFzBqQuR3KmdJ58WoW23K7GTl3LfiE
 TtYDQT2sgcQGOsqiyp/ScHGpc9wstp0AejjMKebCK0DOjvAOuIevzMXxd
 aMGpGM3Kd/xAkWGEl0DoMveE1Lxso/2E4/sGdDMcqQxn7HLZNU6gX2fXf
 aEESVmAlaTozjnlszepkNgnNFqDwsuibUTc48/mm1VQfxELn0FzgAglrI
 B7qwtXM5wuaqGNwaZ87OvMZYVWNlTcuCQxmzW7oT7UC8w6iYzr8GbVrW3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="452286740"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="452286740"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 05:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="1053891367"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="1053891367"
Received: from pglc00062.png.intel.com ([10.221.207.82])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jul 2023 05:08:13 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 17 Jul 2023 20:06:03 +0800
Message-Id: <20230717120603.5053-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: Fix L3L4
	filter count
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

Get the exact count of L3L4 filters when the L3L4FNUM field of
HW_FEATURE1 register is >= 8. If L3L4FNUM < 8, then the number of L3L4
filters supported by XGMAC is equal to L3L4FNUM. From L3L4FNUM >= 8
the number of L3L4 filters goes on like 8, 16, 32, ... Current
maximum of L3L4FNUM = 10.

Also, fix the XGMAC_IDDR bitmask of L3L4_ADDR_CTRL register. IDDR
field starts from the 8th bit of the L3L4_ADDR_CTRL register. IDDR[3:0]
indicates the type of L3L4 filter register while IDDR[8:4] indicates
the filter number (0 to 31). So overall 9 bits are used for IDDR
(i.e. L3L4_ADDR_CTRL[16:8]) to address the registers of all the
filters. Currently, XGMAC_IDDR is GENMASK(15,8), causing issues
accessing L3L4 filters above 15 for those XGMACs configured with more
than 16 L3L4 filters.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 1913385df685..153321fe42c3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -165,7 +165,7 @@
 #define XGMAC_DCS_SHIFT			16
 #define XGMAC_ADDRx_LOW(x)		(0x00000304 + (x) * 0x8)
 #define XGMAC_L3L4_ADDR_CTRL		0x00000c00
-#define XGMAC_IDDR			GENMASK(15, 8)
+#define XGMAC_IDDR			GENMASK(16, 8)
 #define XGMAC_IDDR_SHIFT		8
 #define XGMAC_IDDR_FNUM			4
 #define XGMAC_TT			BIT(1)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 070bd912580b..df5af52fd1a1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -408,6 +408,16 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
 	/* MAC HW feature 1 */
 	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE1);
 	dma_cap->l3l4fnum = (hw_cap & XGMAC_HWFEAT_L3L4FNUM) >> 27;
+	/* If L3L4FNUM < 8, then the number of L3L4 filters supported by
+	 * XGMAC is equal to L3L4FNUM. From L3L4FNUM >= 8 the number of
+	 * L3L4 filters goes on like 8, 16, 32, ... Current maximum of
+	 * L3L4FNUM = 10.
+	 */
+	if (dma_cap->l3l4fnum >= 8 && dma_cap->l3l4fnum <= 10)
+		dma_cap->l3l4fnum = 8 << (dma_cap->l3l4fnum - 8);
+	else if (dma_cap->l3l4fnum > 10)
+		dma_cap->l3l4fnum = 32;
+
 	dma_cap->hash_tb_sz = (hw_cap & XGMAC_HWFEAT_HASHTBLSZ) >> 24;
 	dma_cap->rssen = (hw_cap & XGMAC_HWFEAT_RSSEN) >> 20;
 	dma_cap->tsoen = (hw_cap & XGMAC_HWFEAT_TSOEN) >> 18;
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
