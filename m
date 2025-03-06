Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F830A546FA
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 10:57:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E82FFC7801E;
	Thu,  6 Mar 2025 09:57:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74FA2CFAC4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 09:57:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4C44D5C4B74;
 Thu,  6 Mar 2025 09:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335F6C4CEE2;
 Thu,  6 Mar 2025 09:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741255035;
 bh=wsDrmZWqNwZ8Z92QvIsMkJWkfZRuwXzjXEV5bkQIeE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BkUmWWfq0wnktTbrQMOzFCxZ1idiOiZOA0Td5RKlwaMZLIzNz8MCsANI6ruO+VVZp
 gbGm7NG8dpfDTk4y3ua5cy3hTFiR8v4JXyYFNoQE450Jkq+dXHs9gXxrUbNs7B7+q4
 xySW/R9nLFVa21UfFdAEhuSjeQJh/tp6GlJbhPT3tEcjlRW6hLVnCgjQ0rtGnls/dz
 tlLYsYOaP4jm3eK0Ipat41qGStDjxly3buRLC7i+x/V7WgMlU7AerBmYZ26g9j/0Fi
 hLTgZNC0sfOIk976NyWco3xeMZQ5uQndGt+QKyO3FUfl5L3DdTnKUCV1f0RFX7wxY9
 QETTN5tbBhK3w==
Date: Thu, 6 Mar 2025 09:57:10 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250306095710.GR3666230@kernel.org>
References: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: simplify
 phylink_suspend() and phylink_resume() calls
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

On Tue, Mar 04, 2025 at 11:21:27AM +0000, Russell King (Oracle) wrote:
> Currently, the calls to phylink's suspend and resume functions are
> inside overly complex tests, and boil down to:
> 
> 	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> 		call phylink
> 	} else {
> 		call phylink and
> 		if (device_may_wakeup(priv->device))
> 			do something else
> 	}
> 
> This results in phylink always being called, possibly with differing
> arguments for phylink_suspend().
> 
> Simplify this code, noting that each site is slightly different due to
> the order in which phylink is called and the "something else".
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
