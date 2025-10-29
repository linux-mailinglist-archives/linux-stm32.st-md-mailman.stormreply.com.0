Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F03FEC17752
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 01:03:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 280DFC62D2C;
	Wed, 29 Oct 2025 00:03:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9391FC62D28
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 00:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=thLpG7fs2ihD+ToFoNCiunRlF5bc6gkGMjFRZXn8QW8=; b=hwG5/lej+RLBb0WH/WtAVdrPlL
 +AG7J0+Ab6qAdIbf8nNos1pMlyZUTXRdm0CpJsZ7t1DSF3UWBv4SlbNDn/C3Zp2NJMdTjKqr1pOMm
 uB/zAb42K6Ytr9CPsfylGzqVE/jkA46yZ5qeilvCsokPAw837WnW5qzjKKdU4kc+GE1A7yZCsJ2XW
 N5nKM9bB2Bs9LfU3ou04TUShQYnsXcTfuasFgkw/Kaz9atcsgMN7s2L4Wg/s437EInJt3s7zJjmO2
 J6Tg03zlHYoQn213gpCUI0cKMjLJ8uMXVI8FNE6SslgboYXQa0Dt/XhsALk27bzhxZKoWMUlM54Bs
 Vg7gMKQQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56198 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vDtf7-000000003hx-2XQC;
 Wed, 29 Oct 2025 00:03:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vDtf6-0000000CCCL-1cQA; Wed, 29 Oct 2025 00:03:36 +0000
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vDtf6-0000000CCCL-1cQA@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Oct 2025 00:03:36 +0000
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 6/8] net: stmmac: provide function
	to lookup hwif
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

Provide a function to lookup the hwif entry given the core type,
Synopsys version, and device ID (used for XGMAC cores).

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 40 +++++++++++++++-------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 26cc1bc758bf..892cef79c4d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -299,6 +299,30 @@ static const struct stmmac_hwif_entry {
 	},
 };
 
+static const struct stmmac_hwif_entry *
+stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
+{
+	const struct stmmac_hwif_entry *entry;
+	int i;
+
+	for (i = ARRAY_SIZE(stmmac_hw) - 1; i >= 0; i--) {
+		entry = &stmmac_hw[i];
+
+		if (core_type != entry->core_type)
+			continue;
+		/* Use synopsys_id var because some setups can override this */
+		if (snpsver < entry->min_id)
+			continue;
+		if (core_type == DWMAC_CORE_XGMAC &&
+		    (dev_id ^ entry->dev_id))
+			continue;
+
+		return entry;
+	}
+
+	return NULL;
+}
+
 int stmmac_hwif_init(struct stmmac_priv *priv)
 {
 	enum dwmac_core_type core_type = priv->plat->core_type;
@@ -306,7 +330,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	struct stmmac_version version;
 	struct mac_device_info *mac;
 	bool needs_setup = true;
-	int i, ret;
+	int ret;
 
 	stmmac_get_version(priv, &version);
 
@@ -339,18 +363,10 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 	spin_lock_init(&mac->irq_ctrl_lock);
 
 	/* Fallback to generic HW */
-	for (i = ARRAY_SIZE(stmmac_hw) - 1; i >= 0; i--) {
-		entry = &stmmac_hw[i];
-
-		if (core_type != entry->core_type)
-			continue;
-		/* Use synopsys_id var because some setups can override this */
-		if (priv->synopsys_id < entry->min_id)
-			continue;
-		if (core_type == DWMAC_CORE_XGMAC &&
-		    (version.dev_id ^ entry->dev_id))
-			continue;
 
+	/* Use synopsys_id var because some setups can override this */
+	entry = stmmac_hwif_find(core_type, priv->synopsys_id, version.dev_id);
+	if (entry) {
 		/* Only use generic HW helpers if needed */
 		mac->desc = mac->desc ? : entry->desc;
 		mac->dma = mac->dma ? : entry->dma;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
