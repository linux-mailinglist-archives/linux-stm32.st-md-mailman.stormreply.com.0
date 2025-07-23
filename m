Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC6EB0EE61
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 11:25:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF9ADC36B36;
	Wed, 23 Jul 2025 09:25:47 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D51DC36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RQQNlB7I/R+hz0Pu8a7A7amzzOyNcSagtZOh2OuR264=; b=WZh6BmN8hQuSFxA834dDH6kvHr
 6SE3fOtagej8RVCHO+0bc9gYSxOLat7qdCtP1argbaypPp9KTTL48yPBCyeXWL7bufvDhgiiZzZW0
 QxUS9kXhOIh12/uAVF1hrtwrNqCGTvM3N4HLwhZYE+7kfRm6aksFTDzKT+NYOh9IVPzDaJrFoiuXi
 dyVtSMnykJmX4bX5BOATpSENv1AJYnlW6Vp5Fvjd+a8x5KZb1xrLcCEUw15jdcNLdfzuS+Ck+B41n
 wSNRlEqXRc4WNGFTlQv1iPhgoO8fgYiNTxZIuLOW+4kxj6a8nh0nN9/ES8MU3zEewbPqD6+19jcii
 o92g88QQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37166)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1ueVjC-0001QJ-0A;
 Wed, 23 Jul 2025 10:25:34 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1ueVj9-00082Q-34;
 Wed, 23 Jul 2025 10:25:31 +0100
Date: Wed, 23 Jul 2025 10:25:31 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Message-ID: <aICqi9eRi-vB1i1m@shell.armlinux.org.uk>
References: <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <5a2e0cd8-6d20-4f5a-a3a0-9010305509e3@foss.st.com>
 <9c9499e3-10c9-4245-938a-65831fe10c05@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c9499e3-10c9-4245-938a-65831fe10c05@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Tristram Ha <Tristram.Ha@microchip.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: document
 st, phy-wol property
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

On Wed, Jul 23, 2025 at 10:53:55AM +0200, Gatien CHEVALLIER wrote:
> On 7/23/25 10:50, Gatien CHEVALLIER wrote:
> > On 7/22/25 22:20, Russell King (Oracle) wrote:
> > > On Tue, Jul 22, 2025 at 03:40:16PM +0200, Andrew Lunn wrote:
> > > > I know Russell has also replied about issues with stmmac. Please
> > > > consider that when reading what i say... It might be not applicable.
> > > > =

> > > > > Seems like a fair and logical approach. It seems reasonable that =
the
> > > > > MAC driver relies on the get_wol() API to know what's supported.
> > > > > =

> > > > > The tricky thing for the PHY used in this patchset is to get this
> > > > > information:
> > > > > =

> > > > > Extract from the documentation of the LAN8742A PHY:
> > > > > "The WoL detection can be configured to assert the nINT interrupt=
 pin
> > > > > or nPME pin"
> > > > =

> > > > https://www.kernel.org/doc/Documentation/devicetree/bindings/power/=
wakeup-source.txt
> > > > =

> > > > It is a bit messy, but in the device tree, you could have:
> > > > =

> > > > =A0=A0=A0=A0 interrupts =3D <&sirq 0 IRQ_TYPE_LEVEL_LOW>
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 <&pmic 42 IRQ_T=
YPE_LEVEL_LOW>;
> > > > =A0=A0=A0=A0 interrupt-names =3D "nINT", "wake";
> > > > =A0=A0=A0=A0 wakeup-source
> > > > =

> > > > You could also have:
> > > > =

> > > > =A0=A0=A0=A0 interrupts =3D <&sirq 0 IRQ_TYPE_LEVEL_LOW>;
> > > > =A0=A0=A0=A0 interrupt-names =3D "wake";
> > > > =A0=A0=A0=A0 wakeup-source
> > > > =

> > > > In the first example, since there are two interrupts listed, it must
> > > > be using the nPME. For the second, since there is only one, it must=
 be
> > > > using nINT.
> > > > =

> > > > Where this does not work so well is when you have a board which does
> > > > not have nINT wired, but does have nPME. The phylib core will see
> > > > there is an interrupt and request it, and disable polling. And then
> > > > nothing will work. We might be able to delay solving that until suc=
h a
> > > > board actually exists?
> > > =

> > > (Officially, I'm still on vacation...)
> > > =

> > > At this point, I'd like to kick off a discussion about PHY-based
> > > wakeup that is relevant to this thread.
> > > =

> > > The kernel has device-based wakeup support. We have:
> > > =

> > > - device_set_wakeup_capable(dev, flag) - indicates that the is
> > > =A0=A0 capable of waking the system depending on the flag.
> > > =

> > > - device_set_wakeup_enable(dev, flag) - indicates whether "dev"
> > > =A0=A0 has had wake-up enabled or disabled depending on the flag.
> > > =

> > > - dev*_pm_set_wake_irq(dev, irq) - indicates to the wake core that
> > > =A0=A0 the indicated IRQ is capable of waking the system, and the core
> > > =A0=A0 will handle enabling/disabling irq wake capabilities on the IRQ
> > > =A0=A0 as appropriate (dependent on device_set_wakeup_enable()). Other
> > > =A0=A0 functions are available for wakeup IRQs that are dedicated to
> > > =A0=A0 only waking up the system (e.g. the WOL_INT pin on AR8031).
> > > =

> > > Issue 1. In stmmac_init_phy(), we have this code:
> > > =

> > > =A0=A0=A0=A0=A0=A0=A0=A0 if (!priv->plat->pmt) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct ethtool_wolin=
fo wol =3D { .cmd =3D ETHTOOL_GWOL };
> > > =

> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 phylink_ethtool_get_=
wol(priv->phylink, &wol);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device_set_wakeup_ca=
pable(priv->device,
> > > !!wol.supported);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 device_set_wakeup_en=
able(priv->device, !!wol.wolopts);
> > > =A0=A0=A0=A0=A0=A0=A0=A0 }
> > > =

> > > This reads the WoL state from the PHY (a different struct device)
> > > and sets the wakeup capability and enable state for the _stmmac_
> > > device accordingly, but in the case of PHY based WoL, it's the PHY
> > > doing the wakeup, not the MAC. So this seems wrong on the face of
> > > it.
> > =

> > 2 cents: Maybe even remove in stmmac_set_wol() if !priv->plat->pmt.
> > =

> =

> Sorry, that's not very clear. I was thinking of removing:
> device_set_wakeup_enable(priv->device, !!wol->wolopts); in
> stmmac_set_wol()

Yes, I think that's something which should be looked into, along with
the code at the bottom of stmmac_init_phy() calling
device_set_wakeup_capable() and device_set_wakeup_enable() depending on
the PHY state. However, that's something which needs testing by folk
who have stmmac setups that use PHY-side WoL.

It appears that my Jetson Xavier NX currently doesn't, although
MAC-side WoL also doesn't appear to work, so I've asked nVidia folk
for assistance. It could be it's supposed to use PHY-side, or maybe
there's something missing to support MAC-side (e.g. clk_rx_i is
being turned off in suspend despite WoL being enabled.)

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
