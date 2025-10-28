Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC181C141ED
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 11:35:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF3D6C628CB;
	Tue, 28 Oct 2025 10:35:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62B8EC628BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 10:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7HIcXgRn4F/ZV4CqVmuIzaxh6G+n/mevlVZ22fTlXFc=; b=gJi84TZAGLfLo0NYavISvKgFUX
 Qv30sQmkW3RmiPp+TlkX9LjRD7O9xBorYxG8MfLh+6L0bmCKgpIgKxlCX8+1UeXuud9NzAz1+6I1p
 1vpRv84Dv2MCo2NmnREhrDSelsTpEAk2JRpRuJ8KzY3z2EIprzeag8An4O3Nzt+8WoMpirVrBKz6e
 zGxX/OYOgnHPjV5g8Ap8ic0ubT8iX0NNl5ophPzAxs5zKaf1rNy5zFmQZk61WnBWfMA3whi9aEfJW
 CrZo8/4G4YTk68Kjw54uHCDQhM5e2upsg+dg7y1nITG0flqjGU5ldiw7cFY/XgsaygykhVRunSVkf
 8zi9L2YQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41302)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vDh2f-0000000033x-2aUs;
 Tue, 28 Oct 2025 10:35:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vDh2a-000000006U0-1mOG; Tue, 28 Oct 2025 10:35:00 +0000
Date: Tue, 28 Oct 2025 10:35:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aQCcVOYV15SeHAMU@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
 <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
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

On Tue, Oct 28, 2025 at 11:16:00AM +0100, Maxime Chevallier wrote:
> Hello Russell,
> 
> On 25/10/2025 22:48, Russell King (Oracle) wrote:
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Maybe this needs a commit log, even a small one ? :(

Thanks for giving Jakub a reason to mark this "changes required." :D
I'm not really expecting this to be merged as-is. So why didn't I
post it as RFC? Too many people see "RFC" as a sign to ignore the
patch series. Some people claim that "RFC" means it isn't ready and
thus isn't worth reviewing/testing/etc. I say to those people... I
can learn their game and work around their behaviour.

Yes, it will need a better commit log, but what I'm much much more
interested in is having people who are using the integrated PCS (in
SGMII mode as that's all we support) to test this, especially
dwmac-qcom-ethqos folk.

The 2.5G support was submitted by Sneh Shah, and my attempts to make
contact have resulted in no response.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
