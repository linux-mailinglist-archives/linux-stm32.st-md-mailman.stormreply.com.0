Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22384B60F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 14:12:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB83C6B476;
	Tue,  6 Feb 2024 13:12:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A7CCC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 13:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjKogbJoVYwz4/4zIRPiHZA8DeUtMRsDWvm2PZop3Tc=; b=1naGhjY7kYT8LNxUUIUOowYWeX
 eKwBs27naUc6/NxZ6U/hWTiIEXpVXwM6TFkHBBzOETzr0T2kl8nAOdru3pAOKyabsFXeL7livY0kf
 OD3F5iyMvCtxKORhmUACtDY0BoSx242QEo+yw8OiIHoVlXgbhR9X5Nn02hPMtAyuE5vaTuJRcWVon
 CAjx21TdK+VHLsaK7sfo1PVuJ+xHQtc6AXlDN23pRm1ObkEfVef33aY3BZcB9ht4M6C9coPYiaCFG
 AF75hBHggI3Ug/weORRMZpw+EMmfo35N0wmIodL9XBj4A661QS1p3FcnpNa/8Agc8SSU/Op6FcAPp
 2qslTbKw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39738)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rXLFh-00021Y-0h;
 Tue, 06 Feb 2024 13:12:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rXLFZ-0003f6-I9; Tue, 06 Feb 2024 13:12:33 +0000
Date: Tue, 6 Feb 2024 13:12:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <ZcIwQcn3qlk0UjS4@shell.armlinux.org.uk>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
 <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
 <20240206112024.3jxtcru3dupeirnj@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206112024.3jxtcru3dupeirnj@skbuf>
Cc: Andrew Lunn <andrew@lunn.ch>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] net: dsa: b53: remove
 eee_enabled/eee_active in b53_get_mac_eee()
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

On Tue, Feb 06, 2024 at 01:20:24PM +0200, Vladimir Oltean wrote:
> On Sun, Feb 04, 2024 at 12:13:28PM +0000, Russell King (Oracle) wrote:
> > b53_get_mac_eee() sets both eee_enabled and eee_active, and then
> > returns zero.
> > 
> > dsa_slave_get_eee(), which calls this function, will then continue to
> > call phylink_ethtool_get_eee(), which will return -EOPNOTSUPP if there
> > is no PHY present, otherwise calling phy_ethtool_get_eee() which in
> > turn will call genphy_c45_ethtool_get_eee().
> 
> Nitpick: If you need to resend, the function name changed to
> dsa_user_get_eee().

Thanks.

> > @@ -2227,16 +2227,10 @@ EXPORT_SYMBOL(b53_eee_init);
> >  int b53_get_mac_eee(struct dsa_switch *ds, int port, struct ethtool_keee *e)
> >  {
> >  	struct b53_device *dev = ds->priv;
> > -	struct ethtool_keee *p = &dev->ports[port].eee;
> > -	u16 reg;
> >  
> >  	if (is5325(dev) || is5365(dev))
> >  		return -EOPNOTSUPP;
> >  
> > -	b53_read16(dev, B53_EEE_PAGE, B53_EEE_LPI_INDICATE, &reg);
> > -	e->eee_enabled = p->eee_enabled;
> > -	e->eee_active = !!(reg & BIT(port));
> > -
> 
> I know next to nothing about EEE and especially the implementation on
> Broadcom switches. But is the information brought by B53_EEE_LPI_INDICATE
> completely redundant? Is it actually in the system's best interest to
> ignore it?

That's a review comment that should have been made when the original
change to phylib was done, because it's already ignored in kernels
today since the commit changing phylib that I've referenced in this
series - since e->eee_enabled and e->eee_active will be overwritten by
phylib.

If we need B53_EEE_LPI_INDICATE to do something, then we need to have
a discussion about it, and decide how that fits in with the EEE
interface, and how to work around phylib's implementation.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
