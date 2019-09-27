Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2ADC0048
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2019 09:49:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E103BC36B12;
	Fri, 27 Sep 2019 07:49:13 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D3ACC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 07:49:13 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E665CC0DD7;
 Fri, 27 Sep 2019 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1569570551; bh=MV+Pa6bWic8PJcQ0PmrvM1y6FtITxVDL2Xu5W5HutE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=SY98zuQSRffbIhSYtGFOB1P2E/uD0H5fxHiecGoVR7sioYH+HGj79+gMcZqKYozaa
 yGJ1BmNssJr4KPH0Z2FxzTQwQpWeOT+rPihgNy92fzHlgbr/PZeMpA4csQKlrnojcC
 z9ddfh8TXYcowDKQq25t7yClSVpaAsUOZ2Nv1SSNECCXe6zXgqrdDgV0xILLEDsOob
 yE9rrHtmnPjwLeyKCIrJWDXm5XNKR0bLo0ledZld9VNF8dnIrkgIKFMpYWREixk9fJ
 PtxVHoNKpeYf5LvY0fpChnx6diPxHuOo9m1Cs5FWWJg9IXGIjhxGBf7j80BgmDXEFc
 t0YOaNF2hGoqw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5E435A007C;
 Fri, 27 Sep 2019 07:49:09 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Fri, 27 Sep 2019 09:48:52 +0200
Message-Id: <7a69c00a5dc6d54eabceba806e90151197565d1a.1569569778.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569569778.git.Jose.Abreu@synopsys.com>
References: <cover.1569569778.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1569569778.git.Jose.Abreu@synopsys.com>
References: <cover.1569569778.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 4/8] net: stmmac: dwmac4: Always update
	the MAC Hash Filter
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

We need to always update the MAC Hash Filter so that previous entries
are invalidated.

Found out while running stmmac selftests.

Fixes: b8ef7020d6e5 ("net: stmmac: add support for hash table size 128/256 in dwmac4")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 9b4b5f69fc02..2cb9c53f93b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -401,8 +401,11 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 	int numhashregs = (hw->multicast_filter_bins >> 5);
 	int mcbitslog2 = hw->mcast_bits_log2;
 	unsigned int value;
+	u32 mc_filter[8];
 	int i;
 
+	memset(mc_filter, 0, sizeof(mc_filter));
+
 	value = readl(ioaddr + GMAC_PACKET_FILTER);
 	value &= ~GMAC_PACKET_FILTER_HMC;
 	value &= ~GMAC_PACKET_FILTER_HPF;
@@ -416,16 +419,13 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 		/* Pass all multi */
 		value |= GMAC_PACKET_FILTER_PM;
 		/* Set all the bits of the HASH tab */
-		for (i = 0; i < numhashregs; i++)
-			writel(0xffffffff, ioaddr + GMAC_HASH_TAB(i));
+		memset(mc_filter, 0xff, sizeof(mc_filter));
 	} else if (!netdev_mc_empty(dev)) {
 		struct netdev_hw_addr *ha;
-		u32 mc_filter[8];
 
 		/* Hash filter for multicast */
 		value |= GMAC_PACKET_FILTER_HMC;
 
-		memset(mc_filter, 0, sizeof(mc_filter));
 		netdev_for_each_mc_addr(ha, dev) {
 			/* The upper n bits of the calculated CRC are used to
 			 * index the contents of the hash table. The number of
@@ -440,10 +440,11 @@ static void dwmac4_set_filter(struct mac_device_info *hw,
 			 */
 			mc_filter[bit_nr >> 5] |= (1 << (bit_nr & 0x1f));
 		}
-		for (i = 0; i < numhashregs; i++)
-			writel(mc_filter[i], ioaddr + GMAC_HASH_TAB(i));
 	}
 
+	for (i = 0; i < numhashregs; i++)
+		writel(mc_filter[i], ioaddr + GMAC_HASH_TAB(i));
+
 	value |= GMAC_PACKET_FILTER_HPF;
 
 	/* Handle multiple unicast addresses */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
