Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BBA42CA7
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2025 20:24:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1FE1C7803B;
	Mon, 24 Feb 2025 19:24:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5367CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2025 19:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9fNRf84FTtJjHliYcAUhh7w6jjxdbYy6571+0WzKs8U=; b=FjydXtq8/upia+NN3lmp+mKknf
 lL8PdXsnIs4kBH71ncA9vo3jC18J02I8lHXuvCw8olTvs1dr2d4xlZEy/IIfy0tKRFA1N+h4KSKqt
 j0l9RqdLq4S1GDTAvgIb8thmaEiKA5CxmSloYiJmrxmcj5ZT0PecVTcD5RwlC/Cjsyi0+kT8VKa2C
 r6YO6J2VuRfb6yCT5U3Sp08LyWlA+iNQ58K9eUQ3ekGQ2OCGPB9IrY180vVSOEjCoLvQ+1pCF2Q3b
 puAVRKj4x7rFujSibeSUCWJIRdWZZmbkAK5pIKz1O7XGjsThwahg4JjK50UDHQuyi7yWVHIpVJuJ4
 +JQg74ow==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50622)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tme3p-0007O7-2i;
 Mon, 24 Feb 2025 19:24:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tme3l-0005G0-14;
 Mon, 24 Feb 2025 19:24:09 +0000
Date: Mon, 24 Feb 2025 19:24:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <Z7zHWceA9SmtcXPm@shell.armlinux.org.uk>
References: <E1tlRMP-004Vt5-W1@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tlRMP-004Vt5-W1@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos: clean up
 clock initialisation
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

On Fri, Feb 21, 2025 at 11:38:25AM +0000, Russell King (Oracle) wrote:
> Clean up the clock initialisation by providing a helper to find a
> named clock in the bulk clocks, and provide the name of the stmmac
> clock in match data so we can locate the stmmac clock in generic
> code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> dwc_eth_find_clk() should probably become a generic helper given that
> plat_dat->clks is part of the core platform support code, but that
> can be done later when converting more drivers - which I will get
> around to once I've got the set_clk_tx_rate() patch series out that
> someone else needs to make progress.

Jakub,

This one can also be removed from patchwork.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
