Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16388B2B218
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 22:10:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80C08C36B20;
	Mon, 18 Aug 2025 20:10:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F6E1C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 20:10:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2026345AAB;
 Mon, 18 Aug 2025 20:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7B7C4CEEB;
 Mon, 18 Aug 2025 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755547838;
 bh=qg6GZTp8IOOZdRgNGIXFARftWitXEVGq3DzHCuGmImo=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=JIpOS1xk7YahMhN5Ye/QxfvM1KFZzF+ZJKLD1lPbylumH+5cNqfFXMwBkxuvWL60v
 qi4ZUeXgTw+TLW1+3cnLUthS8RU/rplcG2CDUkqpiPPW5RqF3PHaiPwyJulrJuDI4N
 xQISNqlI4R6NnYQXtV7jw0ApGiVSjH6JLT5rYnjmzThfKjzuu67dyZnWdWYpXXcy0x
 Y9B7SkxmxNElXdnU8JtDZfUQMFGt/K1e6TgmtamsG6LunbtISoRzbTA3gkeFvrU7Pl
 jUDODGTn5iRWh6am2TOOeB+pWZdb+TF7c+v7Ej012BUzj8hGZvqiqXubas7FFeT0bM
 rHR/aKgHbW/hA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 9A80ACE122F; Mon, 18 Aug 2025 13:10:37 -0700 (PDT)
Date: Mon, 18 Aug 2025 13:10:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <4c3b0193-4fa7-47ef-9d61-f060c10d3ed4@paulmck-laptop>
References: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
 <aKN-Tdfvc3_hD2p7@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aKN-Tdfvc3_hD2p7@shell.armlinux.org.uk>
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Aug 18, 2025 at 08:26:05PM +0100, Russell King (Oracle) wrote:
> On Mon, Aug 18, 2025 at 12:11:09PM -0700, Paul E. McKenney wrote:
> > Hello!
> > 
> > This might be more of a bug report than a patch, but here goes...
> > 
> > Running rcuscale or refscale performance tests on datacenter ARM systems
> > gives the following build errors with CONFIG_HIBERNATION=n:
> > 
> > ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-rk.ko] undefined!
> > ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.ko] undefined!
> 
> The kernel build bot caught this, and I asked questions of Rafael last
> week and have been waiting for a response that still hasn't come.
> 
> However, there was some discussion over the weekend (argh) on IRC from
> rdd and arnd, but I didn't have time over a weekend (shocking, I know,
> we're supposed to work 24x7 on the kernel, rather than preparing to
> travel to a different location for medical stuff) to really participate
> in that discussion.
> 
> Nevertheless, I do have a patch with my preferred solution - but whether
> that solution is what other people prefer seems to be a subject of
> disagreement according to that which happened on IRC. This affects every
> driver that I converted to use stmmac_simple_pm_ops, which is more than
> you're patching.
> 
> I've been missing around with medical stuff today, which means I also
> haven't had time today to do anything further.
> 
> It's a known problem, but (1) there's been no participation from the
> kernel community to help address it and (2) over the last few days I've
> been busy myself doing stuff related to medical stuff.
> 
> Yea, it's shocking, but it's also real life outside of the realms of
> kernel hacking.

;-) ;-) ;-)

I am happy with whatever solves the problem.  In the meantime, I will
be using my patch in testing to get this failure out of the way of
other bugs.

							Thanx, Paul
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
