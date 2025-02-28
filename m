Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A67A48D08
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 01:02:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B865CFAC4A;
	Fri, 28 Feb 2025 00:02:28 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED8C5CFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 00:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C8YkUSgUJyyz9lrq7gtxuszWtm5nHi8ieFSmR1xycgY=; b=gBdZlsQs+VZBAHvrazy5uv0QAh
 FhAzeVBg9ePSZVo0xWfwq2yVJPqs3AaCsjAUXlNV1xUVXVD+1a7vqiK2XSalcs0QenaqxGz6zNgCk
 GDXplgBDHCJlwid/UuUelCUk4oV00kAnJ0AKC759Cw8GSSVc6bYXSIEHng2qT3SV9h7+NTqObWvTB
 BDiwfGm3JR3ocpOrGjRt73asEpNEAeoBb4SZCYxTF6o/ChYOy+Vuewwb1i1lyHAlIWhajv77yJR/O
 tjwT6rd/usaOVb7ovq/rmw2dU1Qemp2d5EUATjRQ0vIxLdrw0aCJBb3xIOGHkJ9b6/gXPOMQm6dq8
 KcIo5BLA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51146)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnnpX-0000ME-0Y;
 Fri, 28 Feb 2025 00:02:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnnpS-00008X-1H;
 Fri, 28 Feb 2025 00:02:10 +0000
Date: Fri, 28 Feb 2025 00:02:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <Z8D9AiZRPp_oyKi_@shell.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
 <92442281-9896-4271-a040-0c14331cb1d3@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92442281-9896-4271-a040-0c14331cb1d3@lunn.ch>
Cc: Thierry Reding <treding@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/5] net: stmmac: call
 phylink_start() and phylink_stop() in XDP functions
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

On Thu, Feb 27, 2025 at 11:27:57PM +0100, Andrew Lunn wrote:
> On Thu, Feb 27, 2025 at 03:05:02PM +0000, Russell King (Oracle) wrote:
> > Phylink does not permit drivers to mess with the netif carrier, as
> > this will de-synchronise phylink with the MAC driver. Moreover,
> > setting and clearing the TE and RE bits via stmmac_mac_set() in this
> > path is also wrong as the link may not be up.
> > 
> > Replace the netif_carrier_on(), netif_carrier_off() and
> > stmmac_mac_set() calls with the appropriate phylink_start() and
> > phylink_stop() calls, thereby allowing phylink to manage the netif
> > carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> > methods.
> > 
> > Note that RE should only be set after the DMA is ready to avoid the
> > receive FIFO between the MAC and DMA blocks overflowing, so
> > phylink_start() needs to be placed after DMA has been started.
> 
> Sorry, i don't know enough about XDP to review this :-(

I suspect there aren't many people who could review it.

However, delving into the history, it seems that this commit was
responsible for introducing stmmac_xdp_{open,release}, thus
intrducing the fidding of the netif carrier which is prohibited
by phylink:

commit ac746c8520d9d056b6963ecca8ff1da9929d02f1
Author: Ong Boon Leong <boon.leong.ong@intel.com>
Date:   Thu Nov 11 22:39:49 2021 +0800

    net: stmmac: enhance XDP ZC driver level switching performance

but that commit was wrong for this very reason.

Didn't phylib used to not renegotiate the link if nothing changed
across a phy_stop()..phy_start() ?

I'm wondering whether my commit is in essence reverting this commit.


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
