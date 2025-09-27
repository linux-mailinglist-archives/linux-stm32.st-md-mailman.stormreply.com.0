Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B9BA6409
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Sep 2025 00:20:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1107C32E8F;
	Sat, 27 Sep 2025 22:20:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27CBBC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Sep 2025 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=odkFKXOldqDIOZCvIlWG0IgIw5UqgIFwVetK5lpN4Dw=; b=x0ovdlibqOHKSHeKlD7uS0K56J
 xByjvjIpch7SYKEdvHdp+mnQgJW6SPCHiYNlo3j9dOzwYDuiH+SrZj4GgL1VywFZXPPNiAIo3mSyz
 GxJ90CKYRL8G4GkJvRW/d2WN9oZT6hhcZ+S/4Gfaj36lECgpg8Qfcz9osJL0XM2aewwl88CxUFU9o
 0BoEAjxeLhPtJO8CIWDJWhqAWGHzzeyAWGRrVT0KTq/lePi68Y3kAHf38Dxa2IyH9aucqIjLs10bf
 AiQFU7HKDa7TI7k6kLerA7cctz4rnXEB3xlOfukdecEFvvFWnTxfjeIknBcXe5yjhmLuR+i4KUwsX
 kDsvxX0g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50452)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1v2dGj-000000004pK-1PIK;
 Sat, 27 Sep 2025 23:19:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1v2dGc-000000001yQ-3Z5o; Sat, 27 Sep 2025 23:19:46 +0100
Date: Sat, 27 Sep 2025 23:19:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <aNhjAhBQzNzNTzZr@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
 <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
 <34478e1c-b3ba-4da3-839a-4cec9ac5f51e@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34478e1c-b3ba-4da3-839a-4cec9ac5f51e@broadcom.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Sat, Sep 27, 2025 at 02:04:15PM -0700, Florian Fainelli wrote:
> =

> =

> On 9/26/2025 12:05 PM, Florian Fainelli wrote:
> > =

> > =

> > On 9/26/2025 10:59 AM, Russell King (Oracle) wrote:
> > > On Wed, Sep 17, 2025 at 05:31:16PM +0100, Russell King (Oracle) wrote:
> > > > On Wed, Sep 17, 2025 at 05:36:37PM +0200, Gatien Chevallier wrote:
> > > > > If the "st,phy-wol" property is present in the device tree node,
> > > > > set the STMMAC_FLAG_USE_PHY_WOL flag to use the WoL capability of
> > > > > the PHY.
> > > > > =

> > > > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > > > ---
> > > > > =A0 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 5 +++++
> > > > > =A0 1 file changed, 5 insertions(+)
> > > > > =

> > > > > diff --git
> > > > > a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/
> > > > > drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > > > > index 77a04c4579c9dbae886a0b387f69610a932b7b9e..6f197789cc2e8018d=
6959158b795e4bca46869c5
> > > > > 100644
> > > > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> > > > > @@ -106,6 +106,7 @@ struct stm32_dwmac {
> > > > > =A0=A0=A0=A0=A0 u32 speed;
> > > > > =A0=A0=A0=A0=A0 const struct stm32_ops *ops;
> > > > > =A0=A0=A0=A0=A0 struct device *dev;
> > > > > +=A0=A0=A0 bool phy_wol;
> > > > > =A0 };
> > > > > =A0 struct stm32_ops {
> > > > > @@ -433,6 +434,8 @@ static int stm32_dwmac_parse_data(struct
> > > > > stm32_dwmac *dwmac,
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > =A0=A0=A0=A0=A0 }
> > > > > +=A0=A0=A0 dwmac->phy_wol =3D of_property_read_bool(np, "st,phy-w=
ol");
> > > > > +
> > > > > =A0=A0=A0=A0=A0 return err;
> > > > > =A0 }
> > > > > @@ -557,6 +560,8 @@ static int stm32_dwmac_probe(struct
> > > > > platform_device *pdev)
> > > > > =A0=A0=A0=A0=A0 plat_dat->bsp_priv =3D dwmac;
> > > > > =A0=A0=A0=A0=A0 plat_dat->suspend =3D stm32_dwmac_suspend;
> > > > > =A0=A0=A0=A0=A0 plat_dat->resume =3D stm32_dwmac_resume;
> > > > > +=A0=A0=A0 if (dwmac->phy_wol)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 plat_dat->flags |=3D STMMAC_FLAG_USE_PHY_W=
OL;
> > > > =

> > > > I would much rather we found a different approach, rather than addi=
ng
> > > > custom per-driver DT properties to figure this out.
> > > > =

> > > > Andrew has previously suggested that MAC drivers should ask the PHY
> > > > whether WoL is supported, but this pre-supposes that PHY drivers are
> > > > coded correctly to only report WoL capabilities if they are really
> > > > capable of waking the system. As shown in your smsc PHY driver patc=
h,
> > > > this may not be the case.
> > > > =

> > > > Given that we have historically had PHY drivers reporting WoL
> > > > capabilities without being able to wake the system, we can't
> > > > implement Andrew's suggestion easily.
> > > > =

> > > > The only approach I can think that would allow us to transition is
> > > > to add:
> > > > =

> > > > static inline bool phy_can_wakeup(struct phy_device *phy_dev)
> > > > {
> > > > =A0=A0=A0=A0return device_can_wakeup(&phy_dev->mdio.dev);
> > > > }
> > > > =

> > > > to include/linux/phy.h, and a corresponding wrapper for phylink.
> > > > This can then be used to determine whether to attempt to use PHY-ba=
sed
> > > > Wol in stmmac_get_wol() and rtl8211f_set_wol(), falling back to
> > > > PMT-based WoL if supported at the MAC.
> > > > =

> > > > So, maybe something like:
> > > > =

> > > > static u32 stmmac_wol_support(struct stmmac_priv *priv)
> > > > {
> > > > =A0=A0=A0=A0u32 support =3D 0;
> > > > =

> > > > =A0=A0=A0=A0if (priv->plat->pmt && device_can_wakeup(priv->device))=
 {
> > > > =A0=A0=A0=A0=A0=A0=A0 support =3D WAKE_UCAST;
> > > > =A0=A0=A0=A0=A0=A0=A0 if (priv->hw_cap_support && priv->dma_cap.pmt=
_magic_frame)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 support |=3D WAKE_MAGIC;
> > > > =A0=A0=A0=A0}
> > > > =

> > > > =A0=A0=A0=A0return support;
> > > > }
> > > > =

> > > > static void stmmac_get_wol(struct net_device *dev, struct
> > > > ethtool_wolinfo *wol)
> > > > {
> > > > =A0=A0=A0=A0struct stmmac_priv *priv =3D netdev_priv(dev);
> > > > =A0=A0=A0=A0int err;
> > > > =

> > > > =A0=A0=A0=A0/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
> > > > =A0=A0=A0=A0if (phylink_can_wakeup(priv->phylink) ||
> > > > =A0=A0=A0=A0=A0=A0=A0 priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
> > > > =A0=A0=A0=A0=A0=A0=A0 err =3D phylink_ethtool_get_wol(priv->phylink=
, wol);
> > > > =A0=A0=A0=A0=A0=A0=A0 if (err !=3D 0 && err !=3D -EOPNOTSUPP)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > =A0=A0=A0=A0}
> > > > =

> > > > =A0=A0=A0=A0wol->supported |=3D stmmac_wol_support(priv);
> > > > =

> > > > =A0=A0=A0=A0/* A read of priv->wolopts is single-copy atomic. Locki=
ng
> > > > =A0=A0=A0=A0 * doesn't add any benefit.
> > > > =A0=A0=A0=A0 */
> > > > =A0=A0=A0=A0wol->wolopts |=3D priv->wolopts;
> > > > }
> > > > =

> > > > static int stmmac_set_wol(struct net_device *dev, struct
> > > > ethtool_wolinfo *wol)
> > > > {
> > > > =A0=A0=A0=A0struct stmmac_priv *priv =3D netdev_priv(dev);
> > > > =A0=A0=A0=A0u32 support, wolopts;
> > > > =A0=A0=A0=A0int err;
> > > > =

> > > > =A0=A0=A0=A0wolopts =3D wol->wolopts;
> > > > =

> > > > =A0=A0=A0=A0/* Check STMMAC_FLAG_USE_PHY_WOL for legacy */
> > > > =A0=A0=A0=A0if (phylink_can_wakeup(priv->phylink) ||
> > > > =A0=A0=A0=A0=A0=A0=A0 priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL) {
> > > > =A0=A0=A0=A0=A0=A0=A0 struct ethtool_wolinfo w;
> > > > =

> > > > =A0=A0=A0=A0=A0=A0=A0 err =3D phylink_ethtool_set_wol(priv->phylink=
, wol);
> > > > =A0=A0=A0=A0=A0=A0=A0 if (err !=3D -EOPNOTSUPP)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return err;
> > > > =

> > > > =A0=A0=A0=A0=A0=A0=A0 /* Remove the WoL modes that the PHY is handl=
ing */
> > > > =A0=A0=A0=A0=A0=A0=A0 if (!phylink_ethtool_get_wol(priv->phylink, &=
w))
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 wolopts &=3D ~w.wolopts;
> > > > =A0=A0=A0=A0}
> > > > =

> > > > =A0=A0=A0=A0support =3D stmmac_wol_support(priv);
> > > > =

> > > > =A0=A0=A0=A0mutex_lock(&priv->lock);
> > > > =A0=A0=A0=A0priv->wolopts =3D wolopts & support;
> > > > =A0=A0=A0=A0device_set_wakeup_enable(priv->device, !!priv->wolopts);
> > > > =A0=A0=A0=A0mutex_unlock(&priv->lock);
> > > > =

> > > > =A0=A0=A0=A0return 0;
> > > > }
> > > > =

> > > > ... and now I'm wondering whether this complexity is something that
> > > > phylink should handle internally, presenting a mac_set_wol() method
> > > > to configure the MAC-side WoL settings. What makes it difficult to
> > > > just move into phylink is the STMMAC_FLAG_USE_PHY_WOL flag, but
> > > > that could be a "force_phy_wol" flag in struct phylink_config as
> > > > a transitionary measure... so long as PHY drivers get fixed.
> > > =

> > > I came up with this as an experiment - I haven't tested it beyond
> > > running it through the compiler (didn't let it get to the link stage
> > > yet.) Haven't even done anything with it for stmmac yet.
> > > =

> > =

> > I like the direction this is going, we could probably take one step
> > further and extract the logic present in bcmgenet_wol.c and make those
> > helper functions for other drivers to get the overlay of PHY+MAC WoL
> > options/password consistent across all drivers. What do you think?
> =

> +		if (wolopts & WAKE_MAGIC)
> +			changed |=3D !!memcmp(wol->sopass, pl->wol_sopass,
> +					    sizeof(wol->sopass));
> =

> =

> Should not the hunk above be wolopts & WAKE_MAGICSECURE?

Yes, and there's a few other bits missing as well. The series has
progressed, and stmmac is converted and tested on my Jetson platform.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
