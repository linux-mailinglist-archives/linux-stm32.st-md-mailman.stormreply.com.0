Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 534789F0731
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 10:05:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09484C7801F;
	Fri, 13 Dec 2024 09:05:38 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AA07C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 09:05:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E25651BF204;
 Fri, 13 Dec 2024 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734080731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxM8+Leu8MwruhsMJIlIYRMswoFi1MwEa2tyG0/MFaI=;
 b=mBjcJwO02cTezzCp3XYcoFdJbdVzBVazXlvccMmSiZd4UY/Kkyw+8TbOHO1Q85aXZ2GDXV
 rwd5DBplbdmBg60aSgTT8UExB2pIEAbtVLkhXfkX2h4sJVkhkG9xwdcUTa3IlQ2y9765r0
 aZIDleIr7dVb6VJcdZ3rzPn2gyes+lLphrABQJYTFanWm8xIb4d8buR/xK+ZKzJL23Sy2C
 kSR0L7oj0vd/lM/FAexfIJ6ptBBJVgo03/QAdB2adYYgn207pcviXxf1zuDeTIIj+j4xCt
 Tu6xea8EOQM8K+l11+4dSqBDHFbwKGgq6yXf3+YdVh/SkynlBGWS0qIPD3Kzfg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 13 Dec 2024 10:05:24 +0100
Message-ID: <20241213090526.71516-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: dwmac-socfpga: Add
	support for 1000BaseX
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

The dwmac-socfpga found on altera socfpga SoCs can use 1000BaseX or
SGMII. The IP integrates a variation of the Lynx PCS, which the driver
supports well. However, there's some internal circuitry that needs
enabling when using SGMII or 1000BaseX through the "sgmii_adapter" in
the socfpga wrapper. So far, this is only enabled when SGMII is used as
the interface mode. Make so that 1000BaseX also enables that block.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 16020b72dec8..8c7b82d29fd1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -258,6 +258,7 @@ static int socfpga_set_phy_mode_common(int phymode, u32 *val)
 	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_GMII:
 	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
 		*val = SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
@@ -300,6 +301,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	if (dwmac->f2h_ptp_ref_clk ||
 	    phymode == PHY_INTERFACE_MODE_MII ||
 	    phymode == PHY_INTERFACE_MODE_GMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX ||
 	    phymode == PHY_INTERFACE_MODE_SGMII) {
 		regmap_read(sys_mgr_base_addr, SYSMGR_FPGAGRP_MODULE_REG,
 			    &module);
@@ -321,7 +323,8 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
-	if (phymode == PHY_INTERFACE_MODE_SGMII)
+	if (phymode == PHY_INTERFACE_MODE_SGMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX)
 		socfpga_sgmii_config(dwmac, true);
 
 	return 0;
@@ -356,6 +359,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 	if (dwmac->f2h_ptp_ref_clk ||
 	    phymode == PHY_INTERFACE_MODE_MII ||
 	    phymode == PHY_INTERFACE_MODE_GMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX ||
 	    phymode == PHY_INTERFACE_MODE_SGMII) {
 		ctrl |= SYSMGR_GEN10_EMACGRP_CTRL_PTP_REF_CLK_MASK;
 		regmap_read(sys_mgr_base_addr, SYSMGR_FPGAINTF_EMAC_REG,
@@ -374,7 +378,8 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
-	if (phymode == PHY_INTERFACE_MODE_SGMII)
+	if (phymode == PHY_INTERFACE_MODE_SGMII ||
+	    phymode == PHY_INTERFACE_MODE_1000BASEX)
 		socfpga_sgmii_config(dwmac, true);
 	return 0;
 }
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
