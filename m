Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9898259F8
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 19:21:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE4C8C6C83C;
	Fri,  5 Jan 2024 18:21:52 +0000 (UTC)
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A906EC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 18:21:51 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 889101A8358;
 Fri,  5 Jan 2024 19:21:50 +0100 (CET)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1704478910; bh=Zd/QIL3RU/XZlGubxDcUGduBTA9ghSJPnexMb7uMPkw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=5b28g5tdhYjmeIVp67lsuAzXWN+OZvbWOUDS7fBOBp5SLPuoLblTJISHX7SrLtL5q
 XRobKJwIkizfH3xueEeo8vNaA5HwHgqjP9kWVH16WNSvkEljfSNriF5HnJ/Pqjhr1W
 4CABjaJKCKTd6gFGK60cqLQwor08KNCLel8qSP7f1IIHOvcgiiWVmUz9v9tBjvfK2p
 J9U2K1LFoWOihDAEKmaMzPzHZJ3UQ3R1ZiXJHusDgCS7p29yJntBsLQ21sSnODROwv
 FaqispTRFj6Hz/X2jkuH1VUMylgCEp5vGT8cAB244sqLFFdrA9HtpKHmjLo7MCyRH3
 +xJah2vi/Q53w==
Date: Fri, 5 Jan 2024 19:21:48 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20240105192148.0accd8f2@meshulam.tesarici.cz>
In-Reply-To: <a8bb0eb0-8398-4e7e-8dc5-6ebf2f981ca8@lunn.ch>
References: <20240105091556.15516-1-petr@tesarici.cz>
 <CANn89iLuYZBersxq4aH-9Fg_ojD0fh=0xtdLbRdbMrup=nvrkA@mail.gmail.com>
 <20240105113402.0f5f1232@meshulam.tesarici.cz>
 <CANn89iLEvW9ZS=+WPETPC=mKRyu9AKmueGCWZZOrz9oX3Xef=g@mail.gmail.com>
 <20240105121447.11ae80d1@meshulam.tesarici.cz>
 <20240105142732.1903bc70@meshulam.tesarici.cz>
 <CANn89iLHLvGFX_JEYU-en0ZoCUpTvjXPBzFECxLFfa_Jhpcjmg@mail.gmail.com>
 <CANn89iKWSemsKmfsLjupwWBnyeKjtHH+mZjTzYiJT4G=xyUrNQ@mail.gmail.com>
 <20240105154558.2ca38aca@meshulam.tesarici.cz>
 <a8bb0eb0-8398-4e7e-8dc5-6ebf2f981ca8@lunn.ch>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: Jiri Pirko <jiri@resnulli.us>, open list <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
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

On Fri, 5 Jan 2024 18:36:45 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> > This only leaves an atomic_t in hard irq context. I have tried to find
> > something that could relax the requirement, but AFAICS at least some
> > setups use several interrupts that can be delivered to different CPUs
> > simultaneously, and all of them will walk over all channels. So we're
> > left with an atomic_t here.  
> 
> You might want to consider per CPU statistics. Since each CPU has its
> own structure of statistics, you don't need atomic.
> 
> The code actually using the statistics then needs to sum up the per
> CPU statistics, and using syncp should be sufficient for that.

Thanks for the tip.

Honestly, the more I'm looking into this, the less I am convinced that
it is worth the effort, but yeah, if we touch this code now, let's do
things properly. ;-)

> Maybe look at mvneta.c for inspiration.

I think I know what you mean, but I'll have a look.

Petr T
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
