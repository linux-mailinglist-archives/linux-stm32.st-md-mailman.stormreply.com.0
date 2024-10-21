Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD4A9A6012
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 11:32:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF0E6C78035;
	Mon, 21 Oct 2024 09:32:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DFD0C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e2KtIWZwoHWCmTSFbig/OZ/NTIZfLZGMEI1bMNZEUZk=; b=TkGTYQCA+UZmqCOZR1JF4Qfbly
 v3XOILld5vEHYr7KxT7Ep/yazSha/UjtnegV0rTVdQy6tO+eZCITIrGnImOoEYEUsJqbrdqpClAPQ
 Qq9YkU4SgSiP8q5pfKPCCX8EtBXwG7v6ssXItO3dY00XmlMuNIyUGNv9BVUhU56hq0QN0hX2yHfqd
 S1MdYIva2r0GxOyHcg3+CDlrxQvDJVBBjsfibdfJVfYWAPkYFFpGH5k1AIvGaWaFwm+0aNavwmgBN
 J4BtQi3jxTKEtS/baRRI40zIQ89CoLZOS6Q0S4X32uxtAIhAhacGFcASpWxHVEW3UCq5Nh8337wYK
 8LiyspaQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33768)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1t2olp-00036U-1s;
 Mon, 21 Oct 2024 10:32:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1t2olm-0001ct-2b;
 Mon, 21 Oct 2024 10:32:10 +0100
Date: Mon, 21 Oct 2024 10:32:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZxYfmtPYd0yL51C5@shell.armlinux.org.uk>
References: <20241018222407.1139697-1-quic_abchauha@quicinc.com>
 <60119fa1-e7b1-4074-94ee-7e6100390444@lunn.ch>
 <ZxYc2I9vgVL8i4Dz@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZxYc2I9vgVL8i4Dz@shell.armlinux.org.uk>
Cc: Jon Hunter <jonathanh@nvidia.com>, kernel@quicinc.com,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: Disable PCS Link and
 AN interrupt when PCS AN is disabled
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

On Mon, Oct 21, 2024 at 10:20:24AM +0100, Russell King (Oracle) wrote:
> On Sat, Oct 19, 2024 at 04:45:16AM +0200, Andrew Lunn wrote:
> > On Fri, Oct 18, 2024 at 03:24:07PM -0700, Abhishek Chauhan wrote:
> > > Currently we disable PCS ANE when the link speed is 2.5Gbps.
> > > mac_link_up callback internally calls the fix_mac_speed which internally
> > > calls stmmac_pcs_ctrl_ane to disable the ANE for 2.5Gbps.
> > > 
> > > We observed that the CPU utilization is pretty high. That is because
> > > we saw that the PCS interrupt status line for Link and AN always remain
> > > asserted. Since we are disabling the PCS ANE for 2.5Gbps it makes sense
> > > to also disable the PCS link status and AN complete in the interrupt
> > > enable register.
> > > 
> > > Interrupt storm Issue:-
> > > [   25.465754][    C2] stmmac_pcs: Link Down
> > > [   25.469888][    C2] stmmac_pcs: Link Down
> > > [   25.474030][    C2] stmmac_pcs: Link Down
> > > [   25.478164][    C2] stmmac_pcs: Link Down
> > > [   25.482305][    C2] stmmac_pcs: Link Down
> > 
> > I don't know this code, so i cannot really comment if not enabling the
> > interrupt is the correct fix or not. But generally an interrupt storm
> > like this is cause because you are not acknowledging the interrupt
> > correctly to clear its status. So rather than not enabling it, maybe
> > you should check what is the correct way to clear the interrupt once
> > it happens?
> 
> stmmac PCS support is total crap and shouldn't be used, or stmmac
> should not be using phylink. It's one or the other. Blame Serge for
> this mess.

Seriously, we could've had this fixed had the patch set I was working
on that fixed stmmac's _bad_ _conversion_ to phylink progressed to the
point of being merged.

The whole stmmac PCS support is broken, bypassing phylink.

This series also contained bug fixes for stuff like this interrupt
storm after Serge tested it. However, Serge wanted to turn my series
into his maze of indirect function pointers approach that I disagreed
with, and he wouldn't change his mind on that, so I deleted the series.

As I keep saying - either stmmac uses phylink *properly* and gets its
PCS hacks sorted out, or it does not use phylink *at* *all*. It's one
or the other.

I am not going to patch stmmac for any future phylink changes, and if
it breaks, then I'll just say "oh that's a shame, not my problem."
Blame Serge for that. I've had it with the pile of crap that is
stmmac.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
