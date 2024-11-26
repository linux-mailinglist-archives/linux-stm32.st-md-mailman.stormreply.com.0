Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB259D9BEA
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 17:56:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CBC2C7803C;
	Tue, 26 Nov 2024 16:56:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A5B7C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vi83y/8B3Gubm1QfFkkHpp9kuAcCX8lWoAL/8HKghRw=; b=lqj0VSmLHjU0d/oG8cpuR8TM88
 9JLF2np7GplvnvAjtFYNVFnPif6QNYPrimeY3ZhlZeNM4HPwDeOpNTZoaYVLrboAkOItRuTJg9RbV
 clGXZOP6hygYwfJf9N7detcqyasKYrUSVkgOr1IxYMgJ6av4A8jBKYI5VRmYwdX4rIBsuhWwlDONH
 p42ZQE3N+0SM/sUbq9FidT4vbG6yxWfVqtWxgSLwkqzaOHEJXCeAlmWajjHouVrcdxo2Gbto76miW
 I98PF9G+jRUgpKiPX8Y0N+NQg1MVAnOmn36Y84IOYVDKiY7wb5KhhlSctIBefUh4GzWJrteJKrAcw
 2INfuvng==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36036)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tFyqm-0007NI-2j;
 Tue, 26 Nov 2024 16:55:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tFyqk-0004hL-06;
 Tue, 26 Nov 2024 16:55:42 +0000
Date: Tue, 26 Nov 2024 16:55:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z0X9jVhpLvBGkRXD@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 00/23] net: phylink managed
	EEE support
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

On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
> In doing this, I came across the fact that the addition of phylib
> managed EEE support has actually broken a huge number of drivers -
> phylib will now overwrite all members of struct ethtool_keee whether
> the netdev driver wants it or not. This leads to weird scenarios where
> doing a get_eee() op followed by a set_eee() op results in e.g.
> tx_lpi_timer being zeroed, because the MAC driver doesn't know it needs
> to initialise phylib's phydev->eee_cfg.tx_lpi_timer member. This mess
> really needs urgently addressing, and I believe it came about because
> Andrew's patches were only partly merged via another party - I guess
> highlighting the inherent danger of "thou shalt limit your patch series
> to no more than 15 patches" when one has a subsystem who's in-kernel
> API is changing.

Note that, I think, fec_main.c isn't broken, although a quick review
only looking at fec_enet_get_eee() may suggest otherwise:

static int
fec_enet_get_eee(struct net_device *ndev, struct ethtool_keee *edata)
{
        struct fec_enet_private *fep = netdev_priv(ndev);
        struct ethtool_keee *p = &fep->eee;

        if (!(fep->quirks & FEC_QUIRK_HAS_EEE))
                return -EOPNOTSUPP;

        if (!netif_running(ndev))
                return -ENETDOWN;

        edata->tx_lpi_timer = p->tx_lpi_timer; // <===========================

        return phy_ethtool_get_eee(ndev->phydev, edata);
}

static int
fec_enet_set_eee(struct net_device *ndev, struct ethtool_keee *edata)
{
...
        p->tx_lpi_timer = edata->tx_lpi_timer;

Since the driver does not touch phydev->eee_cfg.tx_lpi_timer,
phy_ethtool_get_eee() above will overwrite edata->tx_lpi_timer with
zero. If ethtool does a read-modify-write on the EEE settings, then
fec_enet_set_eee() will be passed a value of zero for
edata->tx_lpi_timer.

This will result in FEC_LPI_SLEEP and FEC_LPI_WAKE being written with
zero, and from what I can see in fec_enet_eee_mode_set(), that disables
EEE.

The saving grace for this driver is that p->tx_lpi_timer also starts
off as zero.

A better implementation would be to get rid of p->tx_lpi_timer
entirely, and instead rely on phydev->eee_cfg.tx_lpi_timer to be
managed by phylib, obtaining its value from there in
fec_enet_eee_mode_set(). At least the driver doesn't attempt to
maintain any other EEE state!

So something like this:


diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index 1cca0425d493..c81f2ea588f2 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -671,8 +671,6 @@ struct fec_enet_private {
 	unsigned int tx_time_itr;
 	unsigned int itr_clk_rate;
 
-	/* tx lpi eee mode */
-	struct ethtool_keee eee;
 	unsigned int clk_ref_rate;
 
 	/* ptp clock period in ns*/
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 1b55047c0237..25c842835d52 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2045,14 +2045,14 @@ static int fec_enet_us_to_tx_cycle(struct net_device *ndev, int us)
 	return us * (fep->clk_ref_rate / 1000) / 1000;
 }
 
-static int fec_enet_eee_mode_set(struct net_device *ndev, bool enable)
+static int fec_enet_eee_mode_set(struct net_device *ndev, u32 lpi_timer,
+				 bool enable)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	struct ethtool_keee *p = &fep->eee;
 	unsigned int sleep_cycle, wake_cycle;
 
 	if (enable) {
-		sleep_cycle = fec_enet_us_to_tx_cycle(ndev, p->tx_lpi_timer);
+		sleep_cycle = fec_enet_us_to_tx_cycle(lpi_timer);
 		wake_cycle = sleep_cycle;
 	} else {
 		sleep_cycle = 0;
@@ -2105,7 +2105,9 @@ static void fec_enet_adjust_link(struct net_device *ndev)
 			napi_enable(&fep->napi);
 		}
 		if (fep->quirks & FEC_QUIRK_HAS_EEE)
-			fec_enet_eee_mode_set(ndev, phy_dev->enable_tx_lpi);
+			fec_enet_eee_mode_set(ndev,
+					      phy_dev->eee_cfg.tx_lpi_timer,
+					      phy_dev->enable_tx_lpi);
 	} else {
 		if (fep->link) {
 			netif_stop_queue(ndev);
@@ -3181,7 +3183,6 @@ static int
 fec_enet_get_eee(struct net_device *ndev, struct ethtool_keee *edata)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	struct ethtool_keee *p = &fep->eee;
 
 	if (!(fep->quirks & FEC_QUIRK_HAS_EEE))
 		return -EOPNOTSUPP;
@@ -3189,8 +3190,6 @@ fec_enet_get_eee(struct net_device *ndev, struct ethtool_keee *edata)
 	if (!netif_running(ndev))
 		return -ENETDOWN;
 
-	edata->tx_lpi_timer = p->tx_lpi_timer;
-
 	return phy_ethtool_get_eee(ndev->phydev, edata);
 }
 
@@ -3198,7 +3197,6 @@ static int
 fec_enet_set_eee(struct net_device *ndev, struct ethtool_keee *edata)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	struct ethtool_keee *p = &fep->eee;
 
 	if (!(fep->quirks & FEC_QUIRK_HAS_EEE))
 		return -EOPNOTSUPP;
@@ -3206,8 +3204,6 @@ fec_enet_set_eee(struct net_device *ndev, struct ethtool_keee *edata)
 	if (!netif_running(ndev))
 		return -ENETDOWN;
 
-	p->tx_lpi_timer = edata->tx_lpi_timer;
-
 	return phy_ethtool_set_eee(ndev->phydev, edata);
 }
 
Another patch to be added to my stack...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
