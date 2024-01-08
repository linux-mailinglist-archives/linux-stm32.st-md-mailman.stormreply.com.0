Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1AF82711F
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 15:23:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B23CCC6DD63;
	Mon,  8 Jan 2024 14:23:20 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08054C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 14:23:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96F241BF20B;
 Mon,  8 Jan 2024 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704723798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8/7gyP7Ro6EIbSwHo4bXO7Wl4exbJDbw0YZeICc6ouA=;
 b=icnrmGyALvII03k+3GInGbojmaxtepRoQ7+GtXT2w0spXvKR1ks6erFkOAI2x9pIX0BBsc
 MJcD5ANmD/A92ILssF2Da2xZ3qNH8sHiZ28QKKl8Kp8c4BPpaRUagJZtHuDNWMgnVAGDnq
 hJO3W1ZMAJDbgqABnXKC0prKgPjmlcM+tlVXS2aYXWhl1HGZqKNgqDyyxABbjrYfebXu2X
 lq0L96omGzIS6TEXJTBrR+ETUHeUwhT94HYhhVSMyopDtf1aDp1t5HuBBACmaIoWIYTNn7
 fifQ+OACszEyUZ8XKo4P6W3Fs+rzBjyaVpXgx/CT18/mxUNwgMmUmc1z1Y4XEg==
Date: Mon, 8 Jan 2024 15:23:38 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
In-Reply-To: <20240108130238.j2denbdj3ifasbqi@skbuf>
Message-ID: <3c2f6555-53b6-be1c-3d7b-7a6dc95b46fe@bootlin.com>
References: <20240108130238.j2denbdj3ifasbqi@skbuf>
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

...

> Nitpick: you could render this in kernel-doc format.
> https://docs.kernel.org/doc-guide/kernel-doc.html
> 
> > +static inline bool stmmac_has_ip_ethertype(struct sk_buff *skb)
> 
> Nitpick: in netdev it is preferred not to use the "inline" keyword at
> all in C files, only "static inline" in headers, and to let the compiler
> decide by itself when it is appropriate to inline the code (which it
> does by itself even without the "inline" keyword). For a bit more
> background why, you can view Documentation/process/4.Coding.rst, section
> "Inline functions".

I see, the kernel docs were indeed enlightening on this point. As a side note, 
I've just benchmarked both the "with-inline" and "without-inline" versions. 
First of all, objdump seems to confirm that GCC does indeed follow this pragma 
in this particular case. Also, RX perfs are better with stmmac_has_ip_ethertype 
inlined, but TX perfs are actually consistently worse with this function 
inlined, which could very well be caused by cache effects.

In any case, I think it is better to remove the "inline" pragma as you said. 
I'll do that in v4.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
