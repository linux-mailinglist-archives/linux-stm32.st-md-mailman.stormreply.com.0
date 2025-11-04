Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D1C305E0
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 10:55:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07343C62ED5;
	Tue,  4 Nov 2025 09:55:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60BE6C030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 09:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3GD3WtzrKWlpy2aI0UjWLqcC9jrT8mGnNqjXDUv8Jk=; b=BajtH6ndoioXThM99+Kw+0rTJv
 Gw8GLOZ3yhKQCBrgW0hjZXOIXiooqeJevBEQD3QklMWbMPQ+xvqd6ClHBHXtAz3MmMDtOc6PmSj6q
 s+grZ7qD4pPt7HC2T2a/cTCdr1POGxbXPsFAE89smW0PlGn5r24MVaIQJzgQYM8HRLVoVtwlROz2X
 6CTL+BGPxLatk/5cNnIeHK/LanaXPXuGPP77ywbuDSW64RJMPTyYQP4UlfZKm+DZQ8jqox1P0f3pr
 lemU83FfAUzaJxmbXwxtM9yj5AfWcGfXvScvq9m1Q4aHmMBbD7cl+PvmSIKFcWbEo2jjIL0siFkFA
 7aUkoIBQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39054)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vGDlB-000000001ys-3e1I;
 Tue, 04 Nov 2025 09:55:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vGDl7-000000004g1-3uIv; Tue, 04 Nov 2025 09:55:25 +0000
Date: Tue, 4 Nov 2025 09:55:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <aQnNjWuytebZpZyW@shell.armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4S-0000000ChoS-2Ahi@rmk-PC.armlinux.org.uk>
 <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQnJRgJqFY99kDUj@lsv051416.swis.nl-cdc01.nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 02/11] net: stmmac: s32: move
 PHY_INTF_SEL_x definitions out of the way
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

On Tue, Nov 04, 2025 at 10:37:10AM +0100, Jan Petrous wrote:
> On Mon, Nov 03, 2025 at 11:50:00AM +0000, Russell King (Oracle) wrote:
> >  /* SoC PHY interface control register */
> > -#define PHY_INTF_SEL_MII	0x00
> > -#define PHY_INTF_SEL_SGMII	0x01
> > -#define PHY_INTF_SEL_RGMII	0x02
> > -#define PHY_INTF_SEL_RMII	0x08
> > +#define S32_PHY_INTF_SEL_MII	0x00
> > +#define S32_PHY_INTF_SEL_SGMII	0x01
> > +#define S32_PHY_INTF_SEL_RGMII	0x02
> > +#define S32_PHY_INTF_SEL_RMII	0x08
> 
> Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Thanks. One question: is it possible that bits 3:1 are the dwmac
phy_intf_sel_i inputs, and bit 0 selects an external PCS which
is connected to the dwmac using GMII (and thus would be set bits
3:1 to zero) ?

It's not really relevant as the driver only appears to support
RGMII.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
