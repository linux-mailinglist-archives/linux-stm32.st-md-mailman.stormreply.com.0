Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC3B827011
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 14:41:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CD8BC6DD63;
	Mon,  8 Jan 2024 13:41:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50795C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=eG9T8lTouYuHP4iTNggEDal9BKSEaIu9o9UHqgV4zmU=; b=g/89ezCx8XKj8W9WmBVIIO1o2v
 Xrhg/GZiVeJL8+zT0PrmSbue3YHm45GvMqN34rXMHhRVjLn5ggcS5uLitaN9K3ZBf9LvpoTlX3G2l
 f1q+wmn+Iq76ScsWq6Apwf8I0AEZUWJTBs5u7YApblPFDXs5zD4uka8lxEKjQ+BwNpwc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rMpsM-004dvG-Sa; Mon, 08 Jan 2024 14:41:10 +0100
Date: Mon, 8 Jan 2024 14:41:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Laight <David.Laight@aculab.com>
Message-ID: <32c4095e-ec33-4059-a8d3-f85e18363c77@lunn.ch>
References: <CANn89iLuYZBersxq4aH-9Fg_ojD0fh=0xtdLbRdbMrup=nvrkA@mail.gmail.com>
 <20240105113402.0f5f1232@meshulam.tesarici.cz>
 <CANn89iLEvW9ZS=+WPETPC=mKRyu9AKmueGCWZZOrz9oX3Xef=g@mail.gmail.com>
 <20240105121447.11ae80d1@meshulam.tesarici.cz>
 <20240105142732.1903bc70@meshulam.tesarici.cz>
 <CANn89iLHLvGFX_JEYU-en0ZoCUpTvjXPBzFECxLFfa_Jhpcjmg@mail.gmail.com>
 <CANn89iKWSemsKmfsLjupwWBnyeKjtHH+mZjTzYiJT4G=xyUrNQ@mail.gmail.com>
 <20240105154558.2ca38aca@meshulam.tesarici.cz>
 <a8bb0eb0-8398-4e7e-8dc5-6ebf2f981ca8@lunn.ch>
 <d05ca29283eb47df9c58838cb87a887c@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d05ca29283eb47df9c58838cb87a887c@AcuMS.aculab.com>
Cc: Jiri Pirko <jiri@resnulli.us>, open list <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: protect statistics updates
	with a spinlock
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

> > You might want to consider per CPU statistics. Since each CPU has its
> > own structure of statistics, you don't need atomic.
> > 
> > The code actually using the statistics then needs to sum up the per
> > CPU statistics, and using syncp should be sufficient for that.
> 
> Doesn't that consume rather a lot of memory on systems with
> 'silly numbers' of cpu?

Systems with silly number of CPUS tend to also have silly amounts of
memory. We are talking about maybe a dozen u64 here. So the memory
usage goes from 144 bytes, to 144K for a 1024CPU system.  Is 144K
excessive for such a system?

> Updating an atomic_t is (pretty much) the same as taking a lock.
> unlock() is also likely to also contain an atomic operation.
> So if you update more than two atomic_t it is likely that a lock
> will be faster.

True, but all those 1024 CPUs in your silly system get affected by a
lock or an atomic. They all need to do something with there L1 and L2
cache when using atomics. Spending an extra 144K of RAM means the
other 1023 CPUs don't notice anything at all during the increment
phase, which could be happening 1M times a second. They only get
involved when something in user space wants the statistics, so maybe
once per second from the SNMP agent.

Also, stmmac is not used on silly CPU systems. It used in embedded
systems. I doubt its integrated into anything with more than 8 CPUs.

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
