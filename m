Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305DA0462D
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 17:29:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3CD4C78026;
	Tue,  7 Jan 2025 16:28:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AF98C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hy6dMB/NYlTUoopxS/bUiLuE4+CdWNkcsNTcUQf43qQ=; b=mKSS77Jc6kYVLgXHHtpb3orz5c
 4Zo2caR4toi+ZfbhI8FtK4JvKXhWwjItJ6tiKR8Tca9e5bl/eXcrhR6BujbwbfYKWQiFQ89NY0SFk
 uRZFkgPegdxgjCA1JNviUAmBqRmTcnJBFrApxl1ve2UpgUhcpmEUjkYRXjmtk2DbgawdLsStRKyxz
 3g1/7gqO6ziNpvQ15iPrB8oRnR51B3DsAgM4NJzJhLH/jHum+bIRyxVb7SUPp3wmals9wg5WIby2T
 yqFiU/TGvfRfouYdGpYkt5+AgJ9QhCMVjEjbNrAN1reGKVq6TzD/2QlqKUdwrFsygsZZRx8QdrvFg
 bCJ2yJlQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41202 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tVCRh-0007lI-1j;
 Tue, 07 Jan 2025 16:28:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tVCRe-007Y3B-Dl; Tue, 07 Jan 2025 16:28:42 +0000
In-Reply-To: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tVCRe-007Y3B-Dl@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Jan 2025 16:28:42 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 03/18] net: stmmac: use correct
 type for tx_lpi_timer
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

The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
Use u32 to store this internally within stmmac rather than "int"
which could misinterpret large values.

Correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
rather than int, which is derived from tx_lpi_timer. Even though this
path won't be used with values larger than STMMAC_ET_MAX, this brings
consistency of type usage to the stmmac code for this variable.

We leave eee_timer unchanged for now, with the assumption that values
up to INT_MAX will safely fit in a u32.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c36f90a782c5..9ed8620580a8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -420,10 +420,10 @@ static void dwmac4_set_eee_pls(struct mac_device_info *hw, int link)
 	writel(value, ioaddr + GMAC4_LPI_CTRL_STATUS);
 }
 
-static void dwmac4_set_eee_lpi_entry_timer(struct mac_device_info *hw, int et)
+static void dwmac4_set_eee_lpi_entry_timer(struct mac_device_info *hw, u32 et)
 {
 	void __iomem *ioaddr = hw->pcsr;
-	int value = et & STMMAC_ET_MAX;
+	u32 value = et & STMMAC_ET_MAX;
 	int regval;
 
 	/* Program LPI entry timer value into register */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 2f7295b6c1c5..0f200b72c225 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -363,7 +363,7 @@ struct stmmac_ops {
 	void (*set_eee_mode)(struct mac_device_info *hw,
 			     bool en_tx_lpi_clockgating);
 	void (*reset_eee_mode)(struct mac_device_info *hw);
-	void (*set_eee_lpi_entry_timer)(struct mac_device_info *hw, int et);
+	void (*set_eee_lpi_entry_timer)(struct mac_device_info *hw, u32 et);
 	void (*set_eee_timer)(struct mac_device_info *hw, int ls, int tw);
 	void (*set_eee_pls)(struct mac_device_info *hw, int link);
 	void (*debug)(struct stmmac_priv *priv, void __iomem *ioaddr,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index df386fc948ec..984e708d019f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -307,7 +307,7 @@ struct stmmac_priv {
 	int lpi_irq;
 	int eee_enabled;
 	int eee_active;
-	int tx_lpi_timer;
+	u32 tx_lpi_timer;
 	int tx_lpi_enabled;
 	int eee_tw_timer;
 	bool eee_sw_timer_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ddb79e8880e9..dbe5635398b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -394,11 +394,11 @@ static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 
 static void stmmac_lpi_entry_timer_config(struct stmmac_priv *priv, bool en)
 {
-	int tx_lpi_timer;
+	u32 tx_lpi_timer;
 
 	/* Clear/set the SW EEE timer flag based on LPI ET enablement */
 	priv->eee_sw_timer_en = en ? 0 : 1;
-	tx_lpi_timer  = en ? priv->tx_lpi_timer : 0;
+	tx_lpi_timer = en ? priv->tx_lpi_timer : 0;
 	stmmac_set_eee_lpi_timer(priv, priv->hw, tx_lpi_timer);
 }
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
