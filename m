Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A306484410C
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jan 2024 14:53:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38F43C65E4F;
	Wed, 31 Jan 2024 13:53:23 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB83BC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jan 2024 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=qcyaXFYC+ivJeWBiO5AvsKPXRmjwKj0eXMoou6vZC8M=; b=JtQmV1Z/FRjfJmPxrI8pyW029C
 NYwbzy+E9g99rrspc1RWRQNVOB6G3r4ZGs1gMhjmSuIMrrrUiYkELTS0Q4g5vQ2iiiumz7ZN41wVv
 gq3PMrRFsiOLGlBhpHYyWHTYRW7VtLfEo6QPhC/7qMNl8+dbdguano5QFQyHho/xe/5E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rVB1Z-006aFh-AA; Wed, 31 Jan 2024 14:53:09 +0100
Date: Wed, 31 Jan 2024 14:53:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <c8602a95-3131-4c15-9ec5-4a5bdcae3ac9@lunn.ch>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
 <78ee61dc-3f1e-4092-b2a3-5831f8caf132@lunn.ch>
 <ZbkBZPm2R9LgYYCI@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZbkBZPm2R9LgYYCI@shell.armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/7] net: phy: add
 PHY_F_RXC_ALWAYS_ON to PHY dev flags
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

On Tue, Jan 30, 2024 at 02:02:12PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 30, 2024 at 02:55:50PM +0100, Andrew Lunn wrote:
> > > @@ -768,6 +768,7 @@ struct phy_device {
> > >  
> > >  /* Generic phy_device::dev_flags */
> > >  #define PHY_F_NO_IRQ		0x80000000
> > > +#define PHY_F_RXC_ALWAYS_ON	BIT(30)
> > 
> > It is a bit odd mixing 0x numbers and BIT() macros for the same class
> > of thing. I would use 0x40000000, or convert PHY_F_NO_IRQ to BIT(31)
> 
> If I used 0x40000000, there would be review comments suggesting the use
> of BIT(). Can't win!

No, you cannot win, but at least it would be consistent :-)

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
