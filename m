Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939EC9FF756
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2025 10:17:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B2CEC7801F;
	Thu,  2 Jan 2025 09:17:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6909FC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jan 2025 09:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y0ebg5JYBQo93J+yDyT483SON+/adfVmrWmE2TfO5rU=; b=mbx+aB1irJScO3s1js3RX9QgJi
 sTP1lXV9i4EmdKhwfSYGJtnXZ45gKyckkykk1YzokCgwlfN+x6Msm2JBtU+KeRjVfPFfcfEkuWThz
 9YsfMB1N2AYGUkqUgCOTgFyMRdKpxLq/WS6OqTtGB2h5lyHOI9chM5ucpVkkuQ25wX3JrZVFagkW1
 0PZM13qmuC9xDo+rujrCoOQNTHUgB1C24Zw29R4kwpFfzNh3e5z9/bEJeEQYPdLhJPy2+IYqnItlH
 3WctIYCphARWHzle8H+e2asvYtRaYbpFtk7uO+lNCcoJblpr5Yt4PHW824uRYUNfqQCtPYL7wEvqE
 JoujGgKw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34372)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tTHK7-0001nt-1u;
 Thu, 02 Jan 2025 09:16:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tTHK4-00009Q-2g;
 Thu, 02 Jan 2025 09:16:56 +0000
Date: Thu, 2 Jan 2025 09:16:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <Z3ZZiCbQb3jFvZMv@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <E1tMBRF-006vae-WC@rmk-PC.armlinux.org.uk>
 <20241217141547.7748b3d3@fedora.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217141547.7748b3d3@fedora.home>
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/5] net: pcs: mtk-lynxi: fill in
 PCS supported_interfaces
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

On Tue, Dec 17, 2024 at 02:15:47PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On Fri, 13 Dec 2024 19:35:01 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Fill in the new PCS supported_interfaces member with the interfaces
> > that the Mediatek LynxI supports.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/pcs/pcs-mtk-lynxi.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> > index 7de804535229..1377fb78eaa1 100644
> > --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> > +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> > @@ -306,6 +306,11 @@ struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
> >  	mpcs->pcs.poll = true;
> >  	mpcs->interface = PHY_INTERFACE_MODE_NA;
> >  
> > +	__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_QSGMII, mpcs->pcs.supported_interfaces);
> 
> I'm sorry if I missed something, but I don't find where the QSGMII
> support comes from based on the current codebase :/
> 
> I didn't spot that in the inband_caps commit, sorry :(
> 
> > +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs.supported_interfaces);

This list comes from the behaviour of the PCS as it stood before any of
these changes - the PCS code itself never validates the interface it's
passed, except for the call to
phylink_mii_c22_pcs_encode_advertisement() and checking that the
return value is non-negative. This is the only place that the
interfaces will be restricted - and they will be restricted to the
four interfaces I've listed above.

I don't have information on the hardware; so I can only go by the
behaviour of the existing code when making changes - and I take the
approach when adding new stuff of trying to avoid changing the code
behaviour, even if the existing code is doing something wrong.

I think, therefore, that a patch to remove stuff that isn't actually
supported should come after these patches, because that changes the
driver behaviour - otherwise the reason why QSGMII isn't included in
the patch would have needed to be described in each commit adding
extra code dealing with the interface mode.

It would've been nice had the driver implemented .pcs_validate() from
the start, which would've made it obvious which interface modes were
supported!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
