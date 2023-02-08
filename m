Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A068EFD6
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 14:32:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD0DDC6A5E8;
	Wed,  8 Feb 2023 13:32:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EA01C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MvQdLI3Bfs8SWdCC/a8nzWKrc1dNg1a+wGdZBOHt6sg=; b=OItGhxR3lLxTOyRv+U0uXdgJUF
 Z7W1PlBU+mC4ndecMyjVziWedj1A5rwSplaIeOTLz0LiAgpx6CQI9PzkWM+ubjHSunHwOMN3rx9+d
 qCHgmAPXycuGOxPkSUYsu8pogyO3g15U/3OSDDYrlM9AMZ5zct8wjzdFS2BmO4AD/17TOQoYjcyWm
 Df/MkZYje+UStD8rT/6aZdeyyY4CUNDQqbibs7e2tx3jYx89nIwX/1vcJmbXuXDMdNK54jAMjybII
 +Y63I7mkvaMITjAUlIrU+tFONmijjQTE6kV44e1hgp/D71D5YA7AAB0KzavbtQrtFUzH0Y4woGTsV
 CVsuAWYA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36466)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pPkYg-0005hW-Km; Wed, 08 Feb 2023 13:32:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pPkYU-0003i8-Fw; Wed, 08 Feb 2023 13:32:10 +0000
Date: Wed, 8 Feb 2023 13:32:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Guan Wentao <guanwentao@uniontech.com>
Message-ID: <Y+OkWiGAr1ysMxSt@shell.armlinux.org.uk>
References: <20230208124025.5828-1-guanwentao@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208124025.5828-1-guanwentao@uniontech.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: get phydev->interface from
 mac for mdio phy init
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

[Not fully over covid but I spotted this and don't agree with this change]

On Wed, Feb 08, 2023 at 08:40:25PM +0800, Guan Wentao wrote:
> The phy->interface from mdiobus_get_phy is default from phy_device_create.
> In some phy devices like at803x, use phy->interface to init rgmii delay.
> Use plat->phy_interface to init if know from stmmac_probe_config_dt.
> 
> Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
> Signed-off-by: Guan Wentao <guanwentao@uniontech.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1a5b8dab5e9b..debfcb045c22 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1162,6 +1162,12 @@ static int stmmac_init_phy(struct net_device *dev)
>  			return -ENODEV;
>  		}
>  
> +		/* If we know the interface, it defines which PHY interface */
> +		if (priv->plat->phy_interface > 0) {
> +			phydev->interface = priv->plat->phy_interface;
> +			netdev_dbg(priv->dev, "Override default phy interface\n");
> +		}
> +

Why do you need to do this?

You call phylink_create() with ->phy_interface, which tells phylink
which interface you want to use. Then, phylink_connect_phy().

phylink will then call phylink_attach_phy() and then phy_attach_direct()
with the interface you asked for (which was ->phy_interface).

phy_attach_direct() will then set phydev->interface to that interface
mode.

So, I think what you have above is a hack rather than a proper fix,
and the real problem is elsewhere.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
