Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C1F842691
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 15:02:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89CC1C6C820;
	Tue, 30 Jan 2024 14:02:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBA66C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B+qqCMS/lknoBXhTRlhfXHK7D4gHB5v8JSzkpcRldtE=; b=gwySDtMvJgokkQQEsZ7zsFDcUD
 iMsZL8ktSjeZ/04CwdzjTluKIpxBhO75Chs9HpAEBk1i37cS11wCx98d6zpOsoYF+oBMLQ40BY2w1
 b9dlQ9S4mgx2TWrAAwmyW4U29XhtvOEBX6C8M4zldexpS2Xa7MXUJN1TSpIQ9na58HqeE19ak+8rl
 hiF6kSf4hrL9CFcEbopeT4GyFY+TFyP5qTFZUHCm8HiKLET5qnHbKLBXhI44itJ9w8Oe5/AgcgAwe
 C1htZBHaqVodvNJZ/6/jEh1dblWhOWJU+JD0UQnjJ/7DFrHQbu9nHKh4XVlmeSpq7WmXevl87woHQ
 pTja/jXw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44332)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1rUogr-0001ub-0v;
 Tue, 30 Jan 2024 14:02:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1rUogm-0005Yl-RT; Tue, 30 Jan 2024 14:02:12 +0000
Date: Tue, 30 Jan 2024 14:02:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZbkBZPm2R9LgYYCI@shell.armlinux.org.uk>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
 <20240130-rxc_bugfix-v2-1-5e6c3168e5f0@bootlin.com>
 <78ee61dc-3f1e-4092-b2a3-5831f8caf132@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78ee61dc-3f1e-4092-b2a3-5831f8caf132@lunn.ch>
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

On Tue, Jan 30, 2024 at 02:55:50PM +0100, Andrew Lunn wrote:
> > @@ -768,6 +768,7 @@ struct phy_device {
> >  
> >  /* Generic phy_device::dev_flags */
> >  #define PHY_F_NO_IRQ		0x80000000
> > +#define PHY_F_RXC_ALWAYS_ON	BIT(30)
> 
> It is a bit odd mixing 0x numbers and BIT() macros for the same class
> of thing. I would use 0x40000000, or convert PHY_F_NO_IRQ to BIT(31)

If I used 0x40000000, there would be review comments suggesting the use
of BIT(). Can't win!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
