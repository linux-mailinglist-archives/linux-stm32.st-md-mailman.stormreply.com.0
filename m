Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A23A7EBBE
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 20:59:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1F46C7128A;
	Mon,  7 Apr 2025 18:59:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35158C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 18:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hBtz6Ng9ArKpM+af3s56+9PEKH0n/HDxcMnPXlkcvuA=; b=AHM7AwvqV0FmHKwQ5UK3nAs+qj
 awi//mBHqMSo2FRcyA9+f26sLvSxkzVniia8baE/vsSBybzSsISUUr9hzzmwEjAq15KpzexLzeCAb
 6O0oTjLaeqqZ74TzSZ4gnMpviTo5tAk2BSWmJ07rYT4czyzUac0tjNn19rVWqr3nx0u1bScna6FCk
 9TkPZAG63aeR94ECET0iIGMKM2nu7ocW4uNECGsgNVtKssr5Igc4aJYMSXhFo1lySkIz3hQx38JQO
 PBdH/+W8sH7B309esxeCfz4c094V4otWXu/o5wX9XZUkEMm9OmAsHZn+/LgwyPXegofBC8VvJUtfd
 uNN6TYmg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47702 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1u1rgu-00069a-0n;
 Mon, 07 Apr 2025 19:59:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1u1rgO-0013gj-5r; Mon, 07 Apr 2025 19:58:56 +0100
In-Reply-To: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1u1rgO-0013gj-5r@rmk-PC.armlinux.org.uk>
Date: Mon, 07 Apr 2025 19:58:56 +0100
Cc: Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/5] net: stmmac: intel: remove
 eee_usecs_rate and hardware write
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

Remove the write to GMAC_1US_TIC_COUNTER for two reasons:

1. during initialisation or reinitialisation of the DWMAC core, the
   core is reset, which sets this register back to its default value.
   Writing it prior to stmmac_dvr_probe() has no effect.

2. Since commit 8efbdbfa9938 ("net: stmmac: Initialize
   MAC_ONEUS_TIC_COUNTER register"), GMAC4/5 core code will set
   this register based on the rate of plat->stmmac_clk. This clock
   is created by the same code which initialises plat->eee_usecs_rate,
   which is also created to run at this same rate. Since Marek's
   commit, this will set this register appropriately using the
   rate of this clock.

Therefore, dwmac-intel.c writing GMAC_1US_TIC_COUNTER serves no
useful purpose and can be removed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index c8bb9265bbb4..54db5b778304 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -682,7 +682,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->axi->axi_blen[2] = 16;
 
 	plat->ptp_max_adj = plat->clk_ptp_rate;
-	plat->eee_usecs_rate = plat->clk_ptp_rate;
 
 	/* Set system clock */
 	sprintf(clk_name, "%s-%s", "stmmac", pci_name(pdev));
@@ -1313,13 +1312,6 @@ static int intel_eth_pci_probe(struct pci_dev *pdev,
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[0];
 
-	if (plat->eee_usecs_rate > 0) {
-		u32 tx_lpi_usec;
-
-		tx_lpi_usec = (plat->eee_usecs_rate / 1000000) - 1;
-		writel(tx_lpi_usec, res.addr + GMAC_1US_TIC_COUNTER);
-	}
-
 	ret = stmmac_config_multi_msi(pdev, plat, &res);
 	if (ret) {
 		ret = stmmac_config_single_msi(pdev, plat, &res);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
