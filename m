Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 667229A3A00
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 11:31:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AFDEC78038;
	Fri, 18 Oct 2024 09:31:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00CFAC78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 09:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HlrpvQzAD74zpG/3GIoBLA8kbr31aQNRFZQK4Fk73F0=; b=VY0r10MXrN9/KTibX/0cBxVUqD
 VE7/7B1MR1tbT7/Pcc6fy4ctLa4apyToKbk7KUgbAK3ty6xImf+4Fs7iUDx0zdcDiqEYscfpLAUlq
 l4ISDQ1SCiH1lHe1wSCvfPNevz/NKTjejdFlv2KMUeKW230U59ityrajHFLBOiwwfJCczuLOEAZD4
 9ppriVgwcREP5pDdYtF34873tqElPSSBPE1v1F3t4uzl0rQDjgz/qfOt/YB6D+2rWQyW6zzoDUq8r
 AVUmN/eolaBrZ0LtcLwDq4MpH9+GBzUNB5czbNrMqE/B5XAjsHpWnkoH7jJMm7BnZdfRCe5vFrWkE
 Ps44qxUA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47696)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1t1jKI-0007uY-0V;
 Fri, 18 Oct 2024 10:31:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1t1jKD-00077F-35;
 Fri, 18 Oct 2024 10:31:13 +0100
Date: Fri, 18 Oct 2024 10:31:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <ZxIq4Q3GqdCEkK9D@shell.armlinux.org.uk>
References: <cover.1729233020.git.0x1207@gmail.com>
 <1776606b2eda8430077551ca117b035f987b5b70.1729233020.git.0x1207@gmail.com>
 <20241018091321.gfsdx7qzl4yoixgb@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241018091321.gfsdx7qzl4yoixgb@skbuf>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Furong Xu <0x1207@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 7/8] net: stmmac: xgmac:
	Complete FPE support
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

On Fri, Oct 18, 2024 at 12:13:21PM +0300, Vladimir Oltean wrote:
> I know this is a preposterous and heretic thing to suggest, but a person
> who isn't knee-deep in stmmac has a very hard time locating himself in
> space due to the unnecessarily complex layering. If that isn't something
> that is important, feel free to ignore.

That is driven by Serge, who seems to be driven by wanting the smallest
code possible with function pointers to abstract the minutest detail.
Like you, I disagree with this approach because it makes following the
code incredibly difficult unless one is constantly looking at it.

Serge wanted to do that to my PCS patches, and when I disagreed, he
stated basically that he'd convert the code after my patches were
merged to his style. So I deleted the patches from my tree. I've also
asked that stmmac removes its use of phylink because stmmac abuses
phylink and with Serge's attitude, it effectively makes it unfixable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
