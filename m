Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9759FD2EB
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Dec 2024 11:01:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E494C78018;
	Fri, 27 Dec 2024 10:01:43 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FF7DC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Dec 2024 10:01:36 +0000 (UTC)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <othacehe@gnu.org>)
 id 1tR79r-0006cy-Oc; Fri, 27 Dec 2024 05:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
 references; bh=9DEKZGF8SvaLlJuIGDJ5lSPb68oHIixULPaNolYeeXA=; b=GCZTIsl+LbYSO8
 l4bY+WiXSIvY+GOdNZ7kNjRFrd5IDSoEOBtn8Z1QJ/KVKNdw/sUbElI/rLIhbFR7nNgC/4G+uieqH
 ISDF6pivvf//dZdEQoRAkOy/F4u0BWdWAvwSWGqdu1pCS8Qr+zjMsvDh3XYJHgg3DESvw4b0834ga
 MshwfVQYSw+gaVRYDgANpfSg9mM+MXy3I3oywgu1gtKSNB2WBiRJThs2GG+plt2TwtMNh+G36qSU5
 0cVmnzAqwFP4DUsM18eVMVCByD5JmEqwfHv7ToGDrK9FL6wWv7HmCDtjJo33je5m1UFDgrzz4B8kE
 ApzkKa7Msu8NNwQS0kCg==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Date: Fri, 27 Dec 2024 10:59:22 +0100
Message-ID: <20241227095923.4414-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mathieu Othacehe <othacehe@gnu.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] net: dwmac-imx: add imx93 clock input
	support in RMII mode
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

If the rmii_refclk_ext boolean is set, configure the ENET QOS TX_CLK pin
direction to input. Otherwise, it defaults to output.

That mirrors what is already happening for the imx8mp in the
imx8mp_set_intf_mode function.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
Changelog:
v2: regmap_update_bits -> regmap_clear_bits

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 43e0fbba4f77b..4ac7a78f4b14b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -36,6 +36,8 @@
 #define MX93_GPR_ENET_QOS_INTF_SEL_RMII		(0x4 << 1)
 #define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
+#define MX93_GPR_ENET_QOS_CLK_SEL_MASK		BIT_MASK(0)
+#define MX93_GPR_CLK_SEL_OFFSET			(4)
 
 #define DMA_BUS_MODE			0x00001000
 #define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
@@ -108,13 +110,21 @@ imx8dxl_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 static int imx93_set_intf_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct imx_priv_data *dwmac = plat_dat->bsp_priv;
-	int val;
+	int val, ret;
 
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
 		val = MX93_GPR_ENET_QOS_INTF_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
+		if (dwmac->rmii_refclk_ext) {
+			ret = regmap_clear_bits(dwmac->intf_regmap,
+						dwmac->intf_reg_off +
+						MX93_GPR_CLK_SEL_OFFSET,
+						MX93_GPR_ENET_QOS_CLK_SEL_MASK);
+			if (ret)
+				return ret;
+		}
 		val = MX93_GPR_ENET_QOS_INTF_SEL_RMII;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
