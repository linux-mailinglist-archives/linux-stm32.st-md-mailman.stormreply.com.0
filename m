Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 225709CFF87
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Nov 2024 16:34:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4FDDC78028;
	Sat, 16 Nov 2024 15:34:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 827B0C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Nov 2024 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kl9+L+s20bjo6FdXRDv6f97HZvSe4Rkk10pmpIZ6IVo=; b=ljE4+OXpXvnb40kYTYlAbN3ON7
 wQHgYoJJylhoqXNdAIOzjJklYVz+AcgHUdDpoJZPMJsNdWzku2ynM7h2JF0FkdqtViHqiJXXG9Bwh
 csLzfJsobCuAXtdoOZwxpiX5BMHtQy+XDX4cKjSqAWq5Oo5TrPrTvGGd53TdDrnbhDxC/4K0ys9ow
 yax1oYN6vFOferrYBM86G2ShYEKu+9yLfxM+tdJMkZa69v0ANAqVMpfkHUefziGOo/Ktw8lxvxyCV
 wCmBLFg961DC9L8vUsInGuWl0ntIbj9yc7BUum2rD3uoCPKRpB/PJ/ed1zQ4Y3Ger9OBPLHVkTWOb
 x3B3FVNQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42354)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tCKoX-0007L6-0O;
 Sat, 16 Nov 2024 15:34:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tCKoQ-0003DP-11;
 Sat, 16 Nov 2024 15:34:14 +0000
Date: Sat, 16 Nov 2024 15:34:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Zzi7dqqZLCCVvlHq@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
 <ZzdW2iB2OkbZxTgS@shell.armlinux.org.uk>
 <170a8d59-e954-4316-9b83-9b799cb60481@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170a8d59-e954-4316-9b83-9b799cb60481@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 0/2] Fix 'ethtool --show-eee'
	during initial stage
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

On Fri, Nov 15, 2024 at 09:35:25PM +0100, Heiner Kallweit wrote:
> On 15.11.2024 15:12, Russell King (Oracle) wrote:
> > On Fri, Nov 15, 2024 at 02:41:54PM +0100, Heiner Kallweit wrote:
> >> On 15.11.2024 12:11, Choong Yong Liang wrote:
> >>> From: Choong Yong Liang <yong.liang.choong@intel.com>
> >>>
> >>> When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
> >>> the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
> >>> the driver side is disabled. If we try to enable EEE through
> >>> 'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
> >>> matches the setting required to enable EEE in ethnl_set_eee().
> >>>
> >>> This patch series will remove phydev->eee_enabled and replace it with
> >>> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
> >>> will follow the master configuration to have software and hardware in sync,
> >>> allowing 'ethtool --show-eee' to display the correct value during the
> >>> initial stage.
> >>>
> >>> v2 changes:
> >>>  - Implement the prototype suggested by Russell
> >>>  - Check EEE before calling phy_support_eee()
> >>>
> >>> Thanks to Russell for the proposed prototype in [1].
> >>>
> >>> Reference:
> >>> [1] https://patchwork.kernel.org/comment/26121323/
> >>>
> >>> Choong Yong Liang (2):
> >>>   net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
> >>>   net: stmmac: set initial EEE policy configuration
> >>>
> >>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
> >>>  drivers/net/phy/phy-c45.c                         | 11 +++++------
> >>>  drivers/net/phy/phy_device.c                      |  6 +++---
> >>>  include/linux/phy.h                               |  5 ++---
> >>>  4 files changed, 13 insertions(+), 12 deletions(-)
> >>>
> >>
> >> Russell submitted the proposed patch already:
> >> https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
> >> So there's no need for your patch 1.
> > 
> > Patch 1 is an updated version of that patch, minus my authorship and of
> > course no sign-off. I've already marked this series as requiring changes
> > in patchwork (hopefully, if I did it correctly.)
> > 
> 
> The updated version adds an argument to genphy_c45_an_config_eee_aneg(),
> and I wonder whether we can do better, as this results in several calls
> with the same argument. The following is an alternative, to be applied
> on top of your original patch. I don't have a clear preference, though.
> 
> ---
>  drivers/net/phy/phy.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 8876f3673..22c9bbebb 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -1682,11 +1682,10 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
>   * configuration.
>   */
>  static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
> -				      struct ethtool_keee *data)
> +				      struct ethtool_keee *old_cfg)
>  {
> -	if (phydev->eee_cfg.tx_lpi_enabled != data->tx_lpi_enabled ||
> -	    phydev->eee_cfg.tx_lpi_timer != data->tx_lpi_timer) {
> -		eee_to_eeecfg(&phydev->eee_cfg, data);
> +	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
> +	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
>  		phydev->enable_tx_lpi = eeecfg_mac_can_tx_lpi(&phydev->eee_cfg);
>  		if (phydev->link) {
>  			phydev->link = false;
> @@ -1706,21 +1705,27 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
>   */
>  int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
>  {
> +	struct eee_config old_cfg;
>  	int ret;
>  
>  	if (!phydev->drv)
>  		return -EIO;
>  
> +	old_cfg = phydev->eee_cfg;
> +	eee_to_eeecfg(&phydev->eee_cfg, data);
> +

Hmm, don't we want to do this under phydev->lock, because network
drivers and phylib may be reading from phydev->eee_cfg? If we
update it outside the lock, and then revert, there's a chance that
the phylib state machine / network driver may see the changes
which then get reverted on failure, potentially leading to
inconsistent state.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
