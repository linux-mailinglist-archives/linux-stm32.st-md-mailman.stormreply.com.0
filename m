Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D76C4D649
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 12:26:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ECBEC628AA;
	Tue, 11 Nov 2025 11:26:45 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91C67C60497
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Nov 2025 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qgAfxK2MHik3nNugmeifO/rBJyY1F9RlKzlJQysCZZE=; b=teHh3k49Ca2cV+YDu4ciIA/DvO
 kg6hvuAZ3bGw6zDo8ruejkZPLdHbqB1KpfgFl/2sX8GQHmNPh6WVxBWmozfxxmnVPRG8+9fiLJuto
 GcKmwMyV7pp+va4OgEptejkSSPvoGzTgGnxNOO1Mzm6S+rGHqqGJj8L/06NGF/cmDokJ+skKhAKHt
 JoDdXS2OeSxW6IQyteH/HrM3Q0tJyTv5csqOvR1Epc4VF8adpaOexLrt/0Egp4i7qv1i9niGvWFhc
 m4xGWNaix2TM6YdM0wh029QthFNzEfIf94HIjXBg9ehdCSi18kym85CH86CVfeKLVGs3EpQR103SP
 Rj7YP5YQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55950 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vImWB-000000002Tq-09lg;
 Tue, 11 Nov 2025 11:26:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vImWA-0000000DrIl-1HZY; Tue, 11 Nov 2025 11:26:34 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vImWA-0000000DrIl-1HZY@rmk-PC.armlinux.org.uk>
Date: Tue, 11 Nov 2025 11:26:34 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: improve ndev->max_mtu
	setup readability
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

Improve the readibility of the code setting ndev->max_mtu. This depends
on the hardware specific maximum defined by the MAC core, and also a
platform provided maximum.

The code was originally checking that the platform specific maximum was
between ndev->min_mtu..MAC core maximum before reducing ndev->max_mtu,
otherwise if the platform specific maximum was less than ndev->min_mtu,
issuing a warning.

Re-order the code to handle the case where the platform specific max is
below ndev->min_mtu, which then means that the subsequent test is
simply reducing ndev->max_mtu.

Update the comment, and add a few blank lines to separate the blocks of
code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ccf383b355e7..eb4350193996 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1392,9 +1392,9 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 	return NET_SKB_PAD;
 }
 
-static int stmmac_set_bfsize(int mtu, int bufsize)
+static int stmmac_set_bfsize(int mtu)
 {
-	int ret = bufsize;
+	int ret;
 
 	if (mtu >= BUF_SIZE_8KiB)
 		ret = BUF_SIZE_16KiB;
@@ -3958,12 +3958,13 @@ stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
 		return ERR_PTR(-ENOMEM);
 	}
 
+	/* Returns 0 or BUF_SIZE_16KiB if mtu > 8KiB and dwmac4 or ring mode */
 	bfsize = stmmac_set_16kib_bfsize(priv, mtu);
 	if (bfsize < 0)
 		bfsize = 0;
 
 	if (bfsize < BUF_SIZE_16KiB)
-		bfsize = stmmac_set_bfsize(mtu, 0);
+		bfsize = stmmac_set_bfsize(mtu);
 
 	dma_conf->dma_buf_sz = bfsize;
 	/* Chose the tx/rx size from the already defined one in the
@@ -7773,22 +7774,23 @@ int stmmac_dvr_probe(struct device *device,
 
 	/* MTU range: 46 - hw-specific max */
 	ndev->min_mtu = ETH_ZLEN - ETH_HLEN;
+
 	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
 		ndev->max_mtu = XGMAC_JUMBO_LEN;
-	else if ((priv->plat->enh_desc) || (priv->synopsys_id >= DWMAC_CORE_4_00))
+	else if (priv->plat->enh_desc || priv->synopsys_id >= DWMAC_CORE_4_00)
 		ndev->max_mtu = JUMBO_LEN;
 	else
 		ndev->max_mtu = SKB_MAX_HEAD(NET_SKB_PAD + NET_IP_ALIGN);
-	/* Will not overwrite ndev->max_mtu if plat->maxmtu > ndev->max_mtu
-	 * as well as plat->maxmtu < ndev->min_mtu which is a invalid range.
+
+	/* Warn if the platform's maxmtu is smaller than the minimum MTU,
+	 * otherwise clamp the maximum MTU above to the platform's maxmtu.
 	 */
-	if ((priv->plat->maxmtu < ndev->max_mtu) &&
-	    (priv->plat->maxmtu >= ndev->min_mtu))
-		ndev->max_mtu = priv->plat->maxmtu;
-	else if (priv->plat->maxmtu < ndev->min_mtu)
+	if (priv->plat->maxmtu < ndev->min_mtu)
 		dev_warn(priv->device,
 			 "%s: warning: maxmtu having invalid value (%d)\n",
 			 __func__, priv->plat->maxmtu);
+	else if (priv->plat->maxmtu < ndev->max_mtu)
+		ndev->max_mtu = priv->plat->maxmtu;
 
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
