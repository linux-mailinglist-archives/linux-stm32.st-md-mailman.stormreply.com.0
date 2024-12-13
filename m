Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97F9F072F
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 10:05:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E25A7C78006;
	Fri, 13 Dec 2024 09:05:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 564ECC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 09:05:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A141E1BF209;
 Fri, 13 Dec 2024 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734080732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKPP2QZefEX/1xcDDWpR3rAb+ukEcDE/pNkA8dPwcZM=;
 b=YQIiuthdBqmu2By5+3wovQpNCgKIdq5aY+qrlpi1ANVyS5lJIrMMmLk3OsmBCKst3VMhlL
 sspuybomI1+fRmzNfp5flaYkXPtIceyJToBmlKlNsbfyrh32GWxzcvw5G4UXFjKPLy0bYu
 qIPTR4FKC31tmwFJV3UVMGl6kx1M0FVS3fE5CMNJC1hTReMMTRNwxMXxfkMVPLx04b24ZA
 qe73thbJpQ15jzIYcLRECkTJvpSji8U4cgGnrkHbwCFquh9c7c9PvAcPevSziXlVHwAoxj
 MSpWkoLIsWOz9hDeucZIaSUx5Phtod4t04K+OppfxGM5WEM4eBO9iJQb5edRMA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 13 Dec 2024 10:05:25 +0100
Message-ID: <20241213090526.71516-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set
	interface modes from Lynx PCS as supported
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

On Socfpga, the dwmac controller uses a variation of the Lynx PCS to get
additional support for SGMII and 1000BaseX. The switch between these
modes may occur at runtime (e.g. when the interface is wired to an SFP
cage). In such case, phylink will validate the newly selected interface
between the MAC and SFP based on the internal "supported_interfaces"
field.

For now in stmmac, this field is populated based on :
 - The interface specified in firmware (DT)
 - The interfaces supported by XPCS, when XPCS is in use.

In our case, the PCS in Lynx and not XPCS.

This commit makes so that the .pcs_init() implementation of
dwmac-socfpga populates the supported_interface when the Lynx PCS was
successfully initialized.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 8c7b82d29fd1..ff9a30afd7e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -425,6 +425,17 @@ static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv)
 		return PTR_ERR(pcs);
 
 	priv->hw->phylink_pcs = pcs;
+
+	/* Having a Lynx PCS means we can use SGMII and 1000BaseX. Phylink's
+	 * supported_interface is populated according to what's found in
+	 * devicetree, but as we can dynamically switch between both modes at
+	 * runtime, make sure both modes are marked as supported
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+		  priv->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII,
+		  priv->phylink_config.supported_interfaces);
+
 	return 0;
 }
 
-- 
2.47.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
