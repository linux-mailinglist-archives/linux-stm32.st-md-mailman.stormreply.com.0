Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D66DECF4
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 09:51:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAF8FC65E4F;
	Wed, 12 Apr 2023 07:51:38 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D998EC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WDasEsbrZhq6Y6NIih1XXwyVWPjBSJhq2DHjFCLMKyU=; b=fFqzuowZKwSTde6gG9QCNF4AeM
 wFNcTZtQuE/+ZJKEE1xmzTEG3bJCxaTw2LqZKs9ElseEkHen+IU6tU7YdSeOo1YWgc7QTqj0N1d+t
 7deQ2ITZBv+gbdo5Uv5xrYSSGDNiBzUaI1OKVu5a1gmxeZXLuLhI7ML2VEqXQsSf5BW1+g91fFmil
 9tVV+nxo69zsc4OoJ3zFxKQ34kU9hNDaXyoty9P/7PwGB6zLk2HdnCGAvwpm1J2Y+c2jk7ghylFOO
 gzAOm1mVq6vXnfsiSLvPH1R4oae1MHK+++Vp2SoZZAUrpKdiXWsDEJ69RZ3u139Bqw+vwoY5KQAMv
 Zps9iteg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48782)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pmVGJ-0007f7-CV; Wed, 12 Apr 2023 08:51:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pmVGD-0004wd-Rw; Wed, 12 Apr 2023 08:51:21 +0100
Date: Wed, 12 Apr 2023 08:51:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <ZDZi+fs13A8JJFOs@shell.armlinux.org.uk>
References: <20230412074850.41260-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412074850.41260-1-maxime.chevallier@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, "linux-stm32 @ st-md-mailman . stormreply . com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Sit Michael Wei Hong <michael.wei.hong.sit@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 "alexis . lothore @ bootlin . com" <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: phylink: check for SFP bus
 presence in phylink_expects_phy
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

On Wed, Apr 12, 2023 at 09:48:50AM +0200, Maxime Chevallier wrote:
> When an SFP bus is present, we don't expect a PHY to be attached
> directly from the MAC driver, it will be handled by phylink at SFP
> attach time.

If we have a SFP, then phylink should be configured for in-band mode.
Maybe fix the firmware description instead?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
