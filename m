Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 308728229F6
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 10:11:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8AF7C6DD69;
	Wed,  3 Jan 2024 09:11:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A8ACC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 09:11:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E39060003;
 Wed,  3 Jan 2024 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704273094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0d2TPKJzfDkr9YkXLiJF5yuJVu7qTBvfkcRucs3iN8=;
 b=mLPvaeDJhmpcd4+AQdE8hESe2HAJTBF+SLjydD+IEzfZNIl7pseOiJDieFtN/5sfE16P+Z
 tf7jLMdlz1IcDyMwzhxgRdltCTHAkj36HY0Zwu83CFIgTf9SXOi0x/iqCB82lj+knRY6zS
 KtWOmHhHIPLajSqx1jhIXoz8HiSwL5ixUloCCJVgSrcFN/1fq81DHOhpWNJtfodkZAW44i
 AQQaEHmybha0NE0lEWSLNPkaUz7zcAcZXOTecUIQko8+RVkDKvyjrd6MzWCuASUl6u1IgO
 QUYutMEEpJ0hgETlQmnwb4/4iRmT323grPCnJZAdGnxzKYu+l52YGp2NlLvYJQ==
Date: Wed, 3 Jan 2024 10:11:54 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <CACRpkdZjOBpD6HoobgMBA27dS+uz5pqb8otL+fGtMvsywYBTPA@mail.gmail.com>
Message-ID: <d3d73e26-10a9-bd2b-ff44-cbdc72e1f6ee@bootlin.com>
References: <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
 <CACRpkdZjOBpD6HoobgMBA27dS+uz5pqb8otL+fGtMvsywYBTPA@mail.gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Prevent DSA tags
 from breaking COE on stmmac
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

Hi Linus,

On Tue, 2 Jan 2024, Linus Walleij wrote:
...
> > +static inline bool stmmac_has_ip_ethertype(struct sk_buff *skb)
> > +{
> > +       __be16 proto = eth_header_parse_protocol(skb);
> 
> I made a new function for this in my patch
> https://lore.kernel.org/netdev/20231222-new-gemini-ethernet-regression-v4-2-a36e71b0f32b@linaro.org/
> 
> I was careful to add if (!pskb_may_pull(skb, ETH_HLEN)) because Eric
> was very specific about this, I suppose you could get fragment frames that
> are smaller than an ethernet header.

Okay nice, then I'll rewrite this series to use the new function once your 
changes make it in.

> Should we add an if (!pskb_may_pull(skb, ETH_HLEN)) to
> eth_header_parse_protocol()?
That does sound logical to me but I couldn't tell you what the impact on current 
callers would be. The net maintainers will probably have a better idea of this.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
