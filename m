Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D2B2B186
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 21:26:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA41C36B20;
	Mon, 18 Aug 2025 19:26:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64236C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 19:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kd+IXbkrMS5qiS+Sd0sXzW37rFNI73FRN7pVjSKY668=; b=goN7U/QS6bPVXFS85mifHaha++
 mt627KyDXT7bQ2rbldEKEwyKL+Ibd3XZWKVfwmUKRPWs3t+Vc1yCjqDWYl17Ix4BhYydjKdaEZURC
 XHvfokBXFoV5bhY0UTdkJlpesXobGS0EwLeQ/oyzLRnnH7xpjYU/6iMO6iUKYenZO9bRO6C/IWgA1
 XYISo4fsVze3vSN3CN5MvoopPNbxehtEildTjTg1dncrsgZTrIfNJI7qUfpN5o+MhsQCFJ0Ho0T9t
 CzW+rD19rT5+KsztxLUvx/66g58mMe3/Q5KbH6nxNwBpzLPjihysdilfP3aOMmW+4kbsMhxj0YpYA
 dY/3SAaA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38234)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uo5Uf-00028K-1Q;
 Mon, 18 Aug 2025 20:26:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uo5Ub-0002hA-1M;
 Mon, 18 Aug 2025 20:26:05 +0100
Date: Mon, 18 Aug 2025 20:26:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Paul E. McKenney" <paulmck@kernel.org>
Message-ID: <aKN-Tdfvc3_hD2p7@shell.armlinux.org.uk>
References: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC] net: stmmac: Make DWMAC_ROCKCHIP and
 DWMAC_STM32 depend on PM_SLEEP
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

On Mon, Aug 18, 2025 at 12:11:09PM -0700, Paul E. McKenney wrote:
> Hello!
> 
> This might be more of a bug report than a patch, but here goes...
> 
> Running rcuscale or refscale performance tests on datacenter ARM systems
> gives the following build errors with CONFIG_HIBERNATION=n:
> 
> ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-rk.ko] undefined!
> ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.ko] undefined!

The kernel build bot caught this, and I asked questions of Rafael last
week and have been waiting for a response that still hasn't come.

However, there was some discussion over the weekend (argh) on IRC from
rdd and arnd, but I didn't have time over a weekend (shocking, I know,
we're supposed to work 24x7 on the kernel, rather than preparing to
travel to a different location for medical stuff) to really participate
in that discussion.

Nevertheless, I do have a patch with my preferred solution - but whether
that solution is what other people prefer seems to be a subject of
disagreement according to that which happened on IRC. This affects every
driver that I converted to use stmmac_simple_pm_ops, which is more than
you're patching.

I've been missing around with medical stuff today, which means I also
haven't had time today to do anything further.

It's a known problem, but (1) there's been no participation from the
kernel community to help address it and (2) over the last few days I've
been busy myself doing stuff related to medical stuff.

Yea, it's shocking, but it's also real life outside of the realms of
kernel hacking.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
