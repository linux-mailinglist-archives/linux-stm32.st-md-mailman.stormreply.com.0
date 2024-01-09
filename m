Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E00DB8288CC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 16:16:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96ECDC6DD74;
	Tue,  9 Jan 2024 15:16:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 263A7C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 15:16:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 543ED20002;
 Tue,  9 Jan 2024 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704813386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ssy2NqEQhKlkgPOMZNnArO4w7khdLMgeVZhOT1pVsOI=;
 b=VFu75ftCyPs7Lt9Z8ASUCZLKtzregIBQ7aO1l9XO0o4PxjAaAZodyeAc62v9jOluNfDemu
 k3UYeyXIwZv+40VMTA8dbBJ96HLEz1GcKkRFD7hUZ9YA35syoJI0M3P+LZYGF/08ycxnVc
 hso6sRefCxYy8VW40CxWvbKDZdFfQjw0PJ8q0rbL+a4Y8fcZ+/9tvLsJ8EMPbluacn/FjD
 GP3DbZjfpODWTrs3T/1J0xL2q6FPFmKGhlQBwYim9+vscLOa2A2cgZWrc9LNHdYZO3S+ma
 Oo4Ui811n+ADwLMT6aTcnKnAszkX8zPAtIC2pWRcNjiGy9tWl4KoozOfyOye1Q==
Date: Tue, 9 Jan 2024 16:16:49 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
In-Reply-To: <20240108143614.ldeizw33o6l7aevi@skbuf>
Message-ID: <7afd8717-4b3a-2104-3581-4cf3440be0f8@bootlin.com>
References: <20240108130238.j2denbdj3ifasbqi@skbuf>
 <3c2f6555-53b6-be1c-3d7b-7a6dc95b46fe@bootlin.com>
 <20240108143614.ldeizw33o6l7aevi@skbuf>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 1/1] net: stmmac: Prevent DSA tags
 from breaking C
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

On Mon, 8 Jan 2024, Vladimir Oltean wrote:

> On Mon, Jan 08, 2024 at 03:23:38PM +0100, Romain Gantois wrote:
> > I see, the kernel docs were indeed enlightening on this point. As a side note, 
> > I've just benchmarked both the "with-inline" and "without-inline" versions. 
> > First of all, objdump seems to confirm that GCC does indeed follow this pragma 
> > in this particular case. Also, RX perfs are better with stmmac_has_ip_ethertype 
> > inlined, but TX perfs are actually consistently worse with this function 
> > inlined, which could very well be caused by cache effects.
> > 
> > In any case, I think it is better to remove the "inline" pragma as you said. 
> > I'll do that in v4.
> 
> Are you doing any code instrumentation, or just measuring the results
> and deducing what might cause them?
> 
> It might be worth looking at the perf events and seeing what function
> consumes the most amount of time.
> 
> CPU_CORE=0
> perf record -e cycles -C $CPU_CORE sleep 10 && perf report
> perf record -e cache-misses -C $CPU_CORE sleep 10 && perf report
> 

Unfortunately my hardware doesn't support these performance metrics, but I did 
manage to do some instrumentation with the ftrace profiler:

Same test conditions as before, 10 second iperf3 runs with unfragmented UDP 
packets.

no inline TX
  average time per call for stmmac_xmit(): 85us
  average time per call for stmmac_has_ip_ethertype(): 2us

no inline RX
  average time per call for stmmac_napi_poll_rx(): 8142us
  average time per call for stmmac_has_ip_ethertype(): 2us

inline TX:
  average time per call for stmmac_xmit(): 85us

inline RX:
  average time per call for stmmac_napi_poll_rx(): 8410us

It seems like this time, RX performed slightly worse with the function inline. 
To be honest, I'm starting to doubt the reproducibility of these tests. In any 
case it seems better to just remove the "inline" and let gcc do the optimizing.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
