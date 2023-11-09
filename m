Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C17E6707
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Nov 2023 10:46:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E64CC6B47A;
	Thu,  9 Nov 2023 09:46:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86A7CC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cToWrjKVkKlNsoeH6fQytqUtrMdfuAVIxZoekhMSeHU=; b=BWdti6VBodHQYvNyN5+fj7ApxK
 pBBN4JBp6GoSQOmrIrCZt585hkq3fgNoHm14umxjNweakNB0fuBEo454E4n3j0Dv9wNleEfP1cpHu
 Y2lNsjV01IZVD29zbeJb5X4bN7AzfiywYP/PMR43P0K4NX2laKuksRwSdTZtuvWApcX7VSCv9ksf0
 S7VuzWrJHFWVPqXqPR92IJ6o7iTORGUFBU3iknfCD28oRjjIowdXCO8tApMtnTHDdG0Xa6p3PQsiB
 da+LDhPjglZxooSqrfPmr6R/deiZ/gHxOkFNVWe3prUuISHU7Ji2b4p1nwfMWOr+WI6uRmu8wmQMz
 EMwySoHQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35116)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1r11cD-0002DX-0q;
 Thu, 09 Nov 2023 09:46:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1r11cB-0000Rt-RJ; Thu, 09 Nov 2023 09:46:19 +0000
Date: Thu, 9 Nov 2023 09:46:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gan Yi Fang <yi.fang.gan@intel.com>
Message-ID: <ZUyqa5lVfWtDP9/F@shell.armlinux.org.uk>
References: <20231109050027.2545000-1-yi.fang.gan@intel.com>
 <ZUyjOEQHHnnbzwrV@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZUyjOEQHHnnbzwrV@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Song Yoong Siang <yoong.siang.song@intel.com>,
 Voon Weifeng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Looi Hong Aun <hong.aun.looi@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix MAC and phylink
 mismatch issue after resume with STMMAC_FLAG_USE_PHY_WOL enabled
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

On Thu, Nov 09, 2023 at 09:15:36AM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 09, 2023 at 01:00:27PM +0800, Gan Yi Fang wrote:
> > From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
> > 
> > The issue happened when flag STMMAC_FLAG_USE_PHY_WOL is enabled.
> > It can be reproduced with steps below:
> > 1. Advertise only one speed on the host
> > 2. Enable the WoL on the host
> > 3. Suspend the host
> > 4. Wake up the host
> > 
> > When the WoL is disabled, both the PHY and MAC will suspend and wake up
> > with everything configured well. When WoL is enabled, the PHY needs to be
> > stay awake to receive the signal from remote client but MAC will enter
> > suspend mode.
> > 
> > When the MAC resumes from suspend, phylink_resume() will call
> > phylink_start() to start the phylink instance which will trigger the
> > phylink machine to invoke the mac_link_up callback function. The
> > stmmac_mac_link_up() will configure the MAC_CTRL_REG based on the current
> > link state. Then the stmmac_hw_setup() will be called to configure the MAC.
> > 
> > This sequence might cause mismatch of the link state between MAC and
> > phylink. This patch moves the phylink_resume() after stmamc_hw_setup() to
> > ensure the MAC is initialized before phylink is being configured.
> 
> Isn't this going to cause problems?
> 
> stmamc_hw_setup() calls stmmac_init_dma_engine(), which then calls
> stmmac_reset() - and stmmac_reset() can fail if the PHY clock isn't
> running, which is why phylink_resume() gets called before this.

I think these two commits should be reviewed to understand why the code
is the way it is, and why changing it may cause regressions:

90702dcd19c0 ("net: stmmac: fix MAC not working when system resume back
with WoL active")

36d18b5664ef ("net: stmmac: start phylink instance before
stmmac_hw_setup()")

As part of my work on stmmac that got junked, I was looking at a
solution to the "we need the PHY clock to be running for the MAC to
work for things like reset" problem - but those patches got thrown
away when stmmac folk were very nitpicky over %u vs %d in format
strings to print what was a _signed_ value that stmmac code stupidly
converts to an unsigned integer... it's still a signed integer no
matter if code decides to use "unsigned int". I suspect all those
patches (and there was a considerable number of them) have now been
expired from git, so are now totally lost, and honestly I have no
desire to put further work into stmmac stuff.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
