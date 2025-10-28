Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C0C14243
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 11:41:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D803C628CF;
	Tue, 28 Oct 2025 10:40:59 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4E04C628BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0wxYpGazz/mbNZkEG1ty2jCdBuuX7dP/ZCMsktvXgQ=; b=FmlJ9xZ3AY35fJOn9eqW4EynqN
 4md0M+JNO60HV64L82O8Q+kAXwSzTSZN8aPxxeiMYBVZ5WP19k8UPJijuTrqIHxsC0ulDf0Y8VZBf
 89DqVHJNgHjrNestsskRMz2dSzcy5w+Qk60EoQJpRKekZw5LrmWRhUY05mp0C6EJZavc1tAyv1C0G
 YNQNMpI+PJxz0WCx4Msg8YSUo0vG59zHvmIsWEMh0+sCJJrbs4QmpT6PkbNSUQoC0HviSuoGnRme3
 ShHPYC/bh9+TgDXHb+WrxgoXMqgc48fmiCQmFGfzRS3wmGhJcbhuhil3H9l4pPIsVzj2qh5PT4wqf
 7FMhcGww==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57222)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vDh8A-0000000034l-3TOU;
 Tue, 28 Oct 2025 10:40:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vDh88-000000006V0-1YLu; Tue, 28 Oct 2025 10:40:44 +0000
Date: Tue, 28 Oct 2025 10:40:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aQCdrNQHF07BVPti@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
 <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
 <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
Cc: Yu-Chun Lin <eleanor15x@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Alexis Lothor__ <alexis.lothore@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: add support
 specifying PCS supported interfaces
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

On Tue, Oct 28, 2025 at 10:35:00AM +0000, Russell King (Oracle) wrote:
> Thanks for giving Jakub a reason to mark this "changes required." :D
> I'm not really expecting this to be merged as-is. So why didn't I
> post it as RFC? Too many people see "RFC" as a sign to ignore the
> patch series. Some people claim that "RFC" means it isn't ready and
> thus isn't worth reviewing/testing/etc. I say to those people... I
> can learn their game and work around their behaviour.
> 
> Yes, it will need a better commit log, but what I'm much much more
> interested in is having people who are using the integrated PCS (in
> SGMII mode as that's all we support) to test this, especially
> dwmac-qcom-ethqos folk.
> 
> The 2.5G support was submitted by Sneh Shah, and my attempts to make
> contact have resulted in no response.

I should add - I'm expecting dwmac-qcom-ethqos to reveal that we need
to include 2500BASE-X for the PCS, and possibly 1000BASE-X as well
(which in dwmac terms uses the TBI interface to a platform integrator
provided serdes block.)

The most important thing is for people with the hardware that would be
affected by these patches to test. However, I'm expecting no testing
feedback from such people based on experience - it seems stmmac is rife
for "throw code over the wall into mainline and run away" behaviour. :(

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
