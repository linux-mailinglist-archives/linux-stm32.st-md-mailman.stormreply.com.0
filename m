Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D84059DA69B
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2024 12:12:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63739C7129D;
	Wed, 27 Nov 2024 11:12:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05F39C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2024 11:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YV7Ng+UILJGgeX2OpLHjyU7yknzjQ5R3jvrdw+xvoG8=; b=nUjmzZSp0723C2w0rHv8ZaBBLX
 XrkG0T8d+DtE6S1tVqA9igzcoRFqbPXKGKBIZ4RCgzvAxBiu8zSDZRkP20hWC2zi8ejzAABOEMym7
 kYc3vo4iaWZF96oJya2fXWPR/2ADrBQ2Zc0LVayYCZsQVkNbns4K+a83WfHjjVGA5cDWoE8WNokM1
 BTj6Cw6Y2MGA2Jun7EV5DrGKSxIzwuJwfIzhGN8NocCwFQ8KLj+3vKYKXnyWG1EIJTTSRYRTqE4Ok
 SFB0hKL53Udq4ZcTt7L3qRABwslS07W0/G/N7Vg31EgBkjZdFOHliWC/4WxGFkZcvzPgVJTyDpfDt
 SsxAZIxQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39324)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tGFyC-0000E0-0T;
 Wed, 27 Nov 2024 11:12:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tGFy8-00076l-1e;
 Wed, 27 Nov 2024 11:12:28 +0000
Date: Wed, 27 Nov 2024 11:12:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <Z0b-nJ7bt8IlBMpz@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3F-005yhT-AA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tFv3F-005yhT-AA@rmk-PC.armlinux.org.uk>
Cc: UNGLinuxDriver@microchip.com, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 02/23] net: phy: fix
 phy_ethtool_set_eee() incorrectly enabling LPI
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

On Tue, Nov 26, 2024 at 12:52:21PM +0000, Russell King (Oracle) wrote:
> @@ -1685,15 +1685,21 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
>  static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
>  				      const struct eee_config *old_cfg)
>  {
> -	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
> +	bool enable_tx_lpi;
> +
> +	if (!phydev->link)
> +		return;
> +
> +	enable_tx_lpi = phydev->eee_cfg.tx_lpi_enabled && phydev->eee_active;
> +
> +	if (phydev->enable_tx_lpi != enable_tx_lpi ||
>  	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {

I'm wondering whether this should be:

	if (phydev->enable_tx_lpi != enable_tx_lpi ||
	    (phydev->enable_tx_lpi &&
	     phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer)) {

The argument for this change would be to avoid cycling the link when the
LPI timer changes but we're not using LPI.

The argument against this change would be that then we don't program the
hardware, and if the driver reads the initial value from hardware and
is unbound/rebound, we'll lose that update whereas before the phylib
changes, it would have been preserved.

The problem, however, are drivers where the LPI timer is dependent on
the speed.

Any thoughts?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
