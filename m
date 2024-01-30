Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 389D7841CAA
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jan 2024 08:35:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2653C6C820;
	Tue, 30 Jan 2024 07:35:43 +0000 (UTC)
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02112C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jan 2024 07:35:41 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id 65FFB19BD2B;
 Tue, 30 Jan 2024 08:35:40 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none)
 header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1706600140; bh=/jhiDAXn5xDQ3jcJlcHR5q1dx8ajj5r1UfIhMLOvtTM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=z1ZN3vjzuGCX+Y8dEn4+fs1ySTvsw7mor35rpzLLbpdiIU7jI14MfiJQr6sSuXSk+
 cS1uXiN+QQcT2P8DfF0xCQ+G5AGr/CPEdyVsnqnTnTQeTQZfdUTL4fxXwLBR6r1bw3
 80J4G6nxl2jOiKZaMWnoYm0ug3JOqVnrKoww6oh3thgZYrGr3At7aIrbUwxZHM6QUi
 qOXRUg55nQPTae3/2tyna2ggFM1kDsZRpz3tseBRi2GitO9ZMvwO76s1t8zcJb98HQ
 r0BR64lk9k9ZSnSrjwyDK+gJFZ+MPYGUANexI3pnMckyS/Fxo+ZYIpKs2cL6jxYNKK
 68IXl2PYqbUYg==
Date: Tue, 30 Jan 2024 08:35:39 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <20240130083539.4ea26a8d@meshulam.tesarici.cz>
In-Reply-To: <ZbiCWtY8ODrroHIq@xhacker>
References: <20240128193529.24677-1-petr@tesarici.cz>
 <ZbiCWtY8ODrroHIq@xhacker>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Samuel Holland <samuel@sholland.org>,
 Marc Haber <mh+netdev@zugschlus.de>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 stable@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: protect updates of
 64-bit statistics counters
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

On Tue, 30 Jan 2024 13:00:10 +0800
Jisheng Zhang <jszhang@kernel.org> wrote:

> On Sun, Jan 28, 2024 at 08:35:29PM +0100, Petr Tesarik wrote:
> > As explained by a comment in <linux/u64_stats_sync.h>, write side of struct
> > u64_stats_sync must ensure mutual exclusion, or one seqcount update could
> > be lost on 32-bit platforms, thus blocking readers forever. Such lockups
> > have been observed in real world after stmmac_xmit() on one CPU raced with
> > stmmac_napi_poll_tx() on another CPU.
> > 
> > To fix the issue without introducing a new lock, split the statics into
> > three parts:
> > 
> > 1. fields updated only under the tx queue lock,
> > 2. fields updated only during NAPI poll,
> > 3. fields updated only from interrupt context,
> > 
> > Updates to fields in the first two groups are already serialized through
> > other locks. It is sufficient to split the existing struct u64_stats_sync
> > so that each group has its own.
> > 
> > Note that tx_set_ic_bit is updated from both contexts. Split this counter
> > so that each context gets its own, and calculate their sum to get the total
> > value in stmmac_get_ethtool_stats().
> > 
> > For the third group, multiple interrupts may be processed by different CPUs
> > at the same time, but interrupts on the same CPU will not nest. Move fields
> > from this group to a newly created per-cpu struct stmmac_pcpu_stats.
> > 
> > Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where necessary")
> > Link: https://lore.kernel.org/netdev/Za173PhviYg-1qIn@torres.zugschlus.de/t/
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Petr Tesarik <petr@tesarici.cz>  
> 
> Thanks for the fix patch. One trivial improviement below
> s/netdev_alloc_pcpu_stats/devm_netdev_alloc_pcpu_stats to simplify
> error and exit code path.

Thanks for your review.

In fact, many other allocations in stmmac could be converted to devm_*.
I wanted to stay consistent with the existing code, but hey, you're
right there's no good reason for it.

Plus, I can send convert the other places with another patch.

> With that:
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
> PS: when I sent the above "net: stmmac: use per-queue 64 bit statistics
> where necessary", I had an impression: there are too much statistics in
> stmmac driver, I didn't see so many statistics in other eth drivers, is
> it possible to remove some useless or not that useful statistic members?

I don't feel authorized to make the decision. But I also wonder about
some counters. For example, why is there tx_packets and tx_pkt_n? The
former is shown as RX packets by "ip stats show dev end0", the latter
is shown by as tx_pkt_n by "ethtools -S end0". The values do differ,
but I have no clue why, and if they are even expected to be different
or if it's a bug.

Petr T
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
