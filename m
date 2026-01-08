Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DFDD02DC5
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 14:08:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B87FFC8F289;
	Thu,  8 Jan 2026 13:08:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5232C5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 13:08:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 145C360130;
 Thu,  8 Jan 2026 13:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5C7C19421;
 Thu,  8 Jan 2026 13:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767877706;
 bh=WZjdReui+9uqUJBxWx2+yu3EA2Z46nNDOpIBBhIZ02I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mLgIxyIabylAX90rx8Jn7L7Ic7m5O6LPAg00NPgiwUYN3y+JMJBkdqB/7Vxi3rLZD
 Jg5EmXYj+477H+SmSv5xI9DFNGRcTmkwoa1O/w5Axf7zPG0kXQ+zKMWgNPgMKYN7FG
 LYBwveojc4+eDCgY2l44SC+0FgsLOjXcMeoeKVoWltRFpLg6S4wmwdsFbBSiGaY6Fk
 Q380fpWdb59Orv57GDKpV/skFTr3SN2SpYRCXdxvB//6hE/sM/+aJKp+YqHwodbIqQ
 MVKrl59yk9yyscEMBA/o3p822Cers2a23PvADzPEOdykLGYREzi1q2pEc3Y6V1Pk4S
 r3qd+RNZFQfVQ==
From: Dinh Nguyen <dinguyen@kernel.org>
Date: Thu, 08 Jan 2026 07:08:09 -0600
MIME-Version: 1.0
Message-Id: <20260108-remove_ocp-v3-1-ea0190244b4c@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
In-Reply-To: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mamta Shukla <mamta.shukla@leica-geosystems.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820; i=dinguyen@kernel.org;
 h=from:subject:message-id; bh=WZjdReui+9uqUJBxWx2+yu3EA2Z46nNDOpIBBhIZ02I=;
 b=owEBbQKS/ZANAwAKARmUBAuBoyj0AcsmYgBpX6xFghfZ1y+O/7GElll7ySvx0smqv/iVf0Hry
 vmvy//a2CKJAjMEAAEKAB0WIQSgeEx6LKTlWbBUzA0ZlAQLgaMo9AUCaV+sRQAKCRAZlAQLgaMo
 9NAZD/9xVkxvSB9+n9yzDdezbrLFCJNDOIoDca0A0vbDwXhREq046hORyNqa6F0s1XEMl7z0MQJ
 6XqSywVv/pbGH3ais/VL6jbBKGIw+9tQt/bbVrO9kzMp8CEe3V8WlneIAsVu4iVp1l8KWicTBX0
 jHfATx7DsBk+nk3t11X+lxACHPilw1I+iMis2nQPE1+0V2/o2reGfVNITYIsWXDRjs0buG6GXOo
 bY5ib1cMuoBGIMUpyEnD2zXbYvi9PHxq3D0gmXRCnnVkE8ZfcfbSVtEV1S+9SKrVVQtPuBOb70o
 MYrPpsc+yV8pbuJqylwEcXBVFZbwNqynnPTgLBEvltk7nuV/ivY+F11ePuOA2Tk5N7FgrnjU+Gj
 /DjKsbckxRKJBiAOYMfT5kfg4imlMvYpfQQc28vF2BUYN5c/iav5aHm4S72fceMcmku/MqQdlwc
 36vPHQlDkdNnpwA/EEvmOfbMTIxHd7+drJbo4HfE2XekorW7lu96sd7nurgFRM2hgh8DwPg80pi
 IZnLChkpAFOtgFkCemmsROs59GWgYL1iv46I5M1xmRMT5i9IknJNn6n79ZjcEridvU+btshj2SN
 HSd5z8sm7cToPWXCs/tag7wQ8wkN67twox5b1eRI6pz9G1abjUBUJuleEeJWvITb1sDZDF4m9qV
 AHaJo/qohyIqx1A==
X-Developer-Key: i=dinguyen@kernel.org; a=openpgp;
 fpr=A0784C7A2CA4E559B054CC0D1994040B81A328F4
Cc: devicetree@vger.kernel.org, bsp-development.geo@leica-geosystems.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/3] net: stmmac: socfpga: add call to
 assert/deassert ahb reset line
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

The "stmmaceth-ocp" reset line of stmmac controller on the SoCFPGA
platform is essentially the "ahb" reset on the standard stmmac
controller. But since stmmaceth-ocp has already been introduced into
the wild, we cannot just remove support for it. But what we can do is
to support both "stmmaceth-ocp" and "ahb" reset names. Going forward we
will be using "ahb", but in order to not break ABI, we will be call reset
assert/de-assert both ahb and stmmaceth-ocp.

The ethernet hardware on SoCFPGA requires either the stmmaceth-ocp or
ahb reset to be asserted every time before changing the phy mode, then
de-asserted when the phy mode has been set.

With this change, we should be able to revert patch:
commit 62a40a0d5634 ("arm: dts: socfpga: use reset-name "stmmaceth-ocp"
instead of "ahb"")

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index a2b52d2c4eb6f..79df55515c718 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -407,6 +407,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 
 	/* Assert reset to the enet controller before changing the phy mode */
 	reset_control_assert(dwmac->stmmac_ocp_rst);
+	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_assert(dwmac->stmmac_rst);
 
 	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
@@ -436,6 +437,7 @@ static int socfpga_gen5_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 * the enet controller, and operation to start in requested mode
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
+	reset_control_deassert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
 	if (phymode == PHY_INTERFACE_MODE_SGMII)
 		socfpga_sgmii_config(dwmac, true);
@@ -463,6 +465,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 
 	/* Assert reset to the enet controller before changing the phy mode */
 	reset_control_assert(dwmac->stmmac_ocp_rst);
+	reset_control_assert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_assert(dwmac->stmmac_rst);
 
 	regmap_read(sys_mgr_base_addr, reg_offset, &ctrl);
@@ -489,6 +492,7 @@ static int socfpga_gen10_set_phy_mode(struct socfpga_dwmac *dwmac)
 	 * the enet controller, and operation to start in requested mode
 	 */
 	reset_control_deassert(dwmac->stmmac_ocp_rst);
+	reset_control_deassert(dwmac->plat_dat->stmmac_ahb_rst);
 	reset_control_deassert(dwmac->stmmac_rst);
 	if (phymode == PHY_INTERFACE_MODE_SGMII)
 		socfpga_sgmii_config(dwmac, true);

-- 
2.42.0.411.g813d9a9188

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
