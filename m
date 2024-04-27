Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 465768B4864
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Apr 2024 23:52:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9412C7129A;
	Sat, 27 Apr 2024 21:52:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D64FEC71295
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2024 21:51:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 128F487FFB;
 Sat, 27 Apr 2024 23:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1714254713;
 bh=aG3QNGQPGlTlLfCjPNS6RQD1+fXVLlGCASqKJj0gk/A=;
 h=From:To:Cc:Subject:Date:From;
 b=JU/klyIhApxeWQpFjDTTNMrGUXl4OHi+xWFWGutA+R4SZSwpMwdlWFeswx2Xihr/t
 tGmDBtAaCruG3kURonwahK8aKYcC75UrMXChXDJp7vSVtkC9bZolGugVop4+y1xaFA
 L7/FCHeuq6+RdgA3xWznAxjHNhC2oFqPsw1lmmtJiyUnvD/8JzjXdTfKZDHmKBb/QI
 STN1xZZDukCFKK9fC85fLE1HOoUnRjf1vOySgkNkpL2vAqMcEQePLmnsv2VoJ57aJ7
 +aPE6c3sBlSb4w12GanB6Bvb13Vyhn3/T3w7UeTwu+ct2Nti7+L36poFQ9aMyaeSvx
 OikNIHgQWOZGw==
From: Marek Vasut <marex@denx.de>
To: netdev@vger.kernel.org
Date: Sat, 27 Apr 2024 23:50:40 +0200
Message-ID: <20240427215113.57548-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [net-next, RFC,
	PATCH 1/5] net: stmmac: dwmac-stm32: Separate out external clock
	rate validation
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

Pull the external clock frequency validation into a separate function,
to avoid conflating it with external clock DT property decoding and
clock mux register configuration. This should make the code easier to
read and understand.

This does change the code behavior slightly. The clock mux PMCR register
setting now depends solely on the DT properties which configure the clock
mux between external clock and internal RCC generated clock. The mux PMCR
register settings no longer depend on the supplied clock frequency, that
supplied clock frequency is now only validated, and if the clock frequency
is invalid for a mode, it is rejected.

Previously, the code would switch the PMCR register clock mux to internal
RCC generated clock if external clock couldn't provide suitable frequency,
without checking whether the RCC generated clock frequency is correct. Such
behavior is risky at best, user should have configured their clock correctly
in the first place, so this behavior is removed here.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 54 +++++++++++++++----
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index c92dfc4ecf570..43340a5573c64 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -157,25 +157,57 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat, bool resume)
 	return stm32_dwmac_clk_enable(dwmac, resume);
 }
 
+static int stm32mp1_validate_ethck_rate(struct plat_stmmacenet_data *plat_dat)
+{
+	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
+	const u32 clk_rate = clk_get_rate(dwmac->clk_eth_ck);
+
+	switch (plat_dat->mac_interface) {
+	case PHY_INTERFACE_MODE_MII:
+		if (clk_rate == ETH_CK_F_25M)
+			return 0;
+		break;
+	case PHY_INTERFACE_MODE_GMII:
+		if (clk_rate == ETH_CK_F_25M)
+			return 0;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		if (clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_50M)
+			return 0;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		if (clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_125M)
+			return 0;
+		break;
+	default:
+		break;
+	}
+
+	dev_err(dwmac->dev, "Mode %s does not match eth-ck frequency %d Hz",
+		phy_modes(plat_dat->mac_interface), clk_rate);
+	return -EINVAL;
+}
+
 static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
-	u32 reg = dwmac->mode_reg, clk_rate;
-	int val;
+	u32 reg = dwmac->mode_reg;
+	int val, ret;
 
-	clk_rate = clk_get_rate(dwmac->clk_eth_ck);
 	dwmac->enable_eth_ck = false;
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		if (clk_rate == ETH_CK_F_25M && dwmac->ext_phyclk)
+		if (dwmac->ext_phyclk)
 			dwmac->enable_eth_ck = true;
 		val = SYSCFG_PMCR_ETH_SEL_MII;
 		pr_debug("SYSCFG init : PHY_INTERFACE_MODE_MII\n");
 		break;
 	case PHY_INTERFACE_MODE_GMII:
 		val = SYSCFG_PMCR_ETH_SEL_GMII;
-		if (clk_rate == ETH_CK_F_25M &&
-		    (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk)) {
+		if (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk) {
 			dwmac->enable_eth_ck = true;
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		}
@@ -183,8 +215,7 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		val = SYSCFG_PMCR_ETH_SEL_RMII;
-		if ((clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_50M) &&
-		    (dwmac->eth_ref_clk_sel_reg || dwmac->ext_phyclk)) {
+		if (dwmac->eth_ref_clk_sel_reg || dwmac->ext_phyclk) {
 			dwmac->enable_eth_ck = true;
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
 		}
@@ -195,8 +226,7 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		val = SYSCFG_PMCR_ETH_SEL_RGMII;
-		if ((clk_rate == ETH_CK_F_25M || clk_rate == ETH_CK_F_125M) &&
-		    (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk)) {
+		if (dwmac->eth_clk_sel_reg || dwmac->ext_phyclk) {
 			dwmac->enable_eth_ck = true;
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		}
@@ -209,6 +239,10 @@ static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
 		return -EINVAL;
 	}
 
+	ret = stm32mp1_validate_ethck_rate(plat_dat);
+	if (ret)
+		return ret;
+
 	/* Need to update PMCCLRR (clear register) */
 	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
 		     dwmac->ops->syscfg_eth_mask);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
