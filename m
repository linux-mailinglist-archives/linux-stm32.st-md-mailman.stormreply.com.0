Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CABA6AD4
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Sep 2025 10:22:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F633C32EA8;
	Sun, 28 Sep 2025 08:22:06 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86F32C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Sep 2025 08:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h4AdV+djV+yTy0JX/TnMvSNKHPhRFNpLrO26oQgiLoA=; b=oKHHqryOllCf4DGRx+mmOcOyYq
 qlL7l2DsPeXL7X9WQUyqSYuEtoQn4MyLneUOunlCH98RltxCZi4tAe6eaGjSBFD8c8C5WxbG4RbgQ
 71qVakVU13nw89eu/EaWEEzCptoyRj321RKwY0HCjwsUfaBCohb0GsMexIBpixwfh/iGlDvRCM+tg
 0EuVurCzgNP9xRX45J8KIo7ZcYNWb4o3rCf6ERoS7W27eiDbW1VcnmPKWjeTIHfN/eMRaJcvgBx6d
 ClmeBe0V5/qeQ3LXj984L1UvWEHENh6jDupX0gbWL6us97wJUkbdq84/koUNhOy+ryxJffEPe1Dh8
 9gwUPoOg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49782)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v2mfE-0000000057R-3ezc;
 Sun, 28 Sep 2025 09:21:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v2mfA-000000002QE-1riS; Sun, 28 Sep 2025 09:21:44 +0100
Date: Sun, 28 Sep 2025 09:21:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <aNjwGHrefA5j3dOp@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
 <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: stm32: add
 WoL from PHY support
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

On Fri, Sep 26, 2025 at 12:05:19PM -0700, Florian Fainelli wrote:
> I like the direction this is going, we could probably take one step further
> and extract the logic present in bcmgenet_wol.c and make those helper
> functions for other drivers to get the overlay of PHY+MAC WoL
> options/password consistent across all drivers. What do you think?

The logic I've implemented is fairly similar, but with one difference:
I'm always storing the sopass, which means in the wol_get method I
don't have to be concerned with the sopass returned by the PHY.
This should be fine, unless the PHY was already configured for WoL
magicsecure, and in that case we'll return a zero SOPASS but indicating
WAKE_MAGICSECURE which probably isn't great.

So, my new get_wol logic is:

        if (phylink_mac_supports_wol(pl)) {
                if (phylink_phy_supports_wol(pl, pl->phydev))
                        phy_ethtool_get_wol(pl->phydev, wol);

                /* Where the MAC augments the WoL support, merge its support and
                 * current configuration.
                 */
                if (~wol->wolopts & pl->wolopts_mac & WAKE_MAGICSECURE)
                        memcpy(wol->sopass, pl->wol_sopass,
                               sizeof(wol->sopass));

                wol->supported |= pl->config->wol_mac_support;
                wol->wolopts |= pl->wolopts_mac;

with:

static bool phylink_mac_supports_wol(struct phylink *pl)
{
        return !!pl->mac_ops->mac_wol_set;
}

static bool phylink_phy_supports_wol(struct phylink *pl,
                                     struct phy_device *phydev)
{
        return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
}

static inline bool phy_can_wakeup(struct phy_device *phydev)
{
        return device_can_wakeup(&phydev->mdio.dev);
}

This is to cope with PHYs that respond to phy_ethtool_get_wol()
reporting that they support WoL but have no capability to actually wake
the system up. MACs can choose whether to override that by setting
phylink_config->wol_phy_legacy.

Much like taking this logic away from MAC driver authors, I think we
need to take the logic around "can this PHY actually wake-up the
system" away from the PHY driver author. I believe every driver that
supports WoL with the exception of realtek and broadcom.c reports that
WoL is supported and accepts set_wol() even when they're not capable
of waking the system. e.g. bcm_phy_get_wol():

        wol->supported = BCM54XX_WOL_SUPPORTED_MASK;
        wol->wolopts = 0;

with no prior checks. This is why the "phylink_phy_supports_wol()"
logic above is necessary, otherwise implementing this "use either
the PHY or MAC" logic will break stuff.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
