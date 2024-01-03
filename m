Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF4482298D
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 09:40:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5449C6DD69;
	Wed,  3 Jan 2024 08:40:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 094DBC6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 08:40:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FAA7E000A;
 Wed,  3 Jan 2024 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704271219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mbyKDE6LxBB4pt4rAudS3Wo2lvqVspXh6sWUjAjOt3o=;
 b=FUWLmozv1lOWyRPl125r4yShizx8ZyjVEHwaVOariUJ7aXLVKDjpme/ubSiIwoqsb3nsdJ
 MtbyWBEq5ox8YUvWRRiRa3icEdGyTgTkPXYPRkyvIgUl96BAAf0KVyMtjC2mWFeqHxrTtD
 TvwTraBrLZvEI27cbHvuio22KdPXODO98rMo90wSFiN1ojp6FTmmhlN2p7B8odtybhjuyK
 ZV1vB3xRuVxiz47x6T+5D9MtRpNpQrzFKa4CsP9E5gO2G6mOdjPkpnsaxzPOfPnvojuO/i
 FvciG0Xd49tOV6gjichyIgNN5LHpMPldNPy09HTevxOnQHYt1tNsPXzUs7yybA==
Date: Wed, 3 Jan 2024 09:40:40 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <e2250240-db19-4cb6-93ca-2384a382cdd5@gmail.com>
Message-ID: <753d4eab-5699-91e3-05a4-d0e03f7052e6@bootlin.com>
References: <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
 <e2250240-db19-4cb6-93ca-2384a382cdd5@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
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

Hi Florian,

On Tue, 2 Jan 2024, Florian Fainelli wrote:

...
> > Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
> > Cc: stable@vger.kernel.org
> > Reported-by: Richard Tresidder <rtresidd@electromag.com.au>
> > Closes:
> > https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electromag.com.au/
> > Reported-by: Romain Gantois <romain.gantois@bootlin.com>
> > Closes:
> > https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin.com/
> 
> Fairly sure those should be Link: and Closes: should be used for bug tracker
> entries.

ACK

> > +	return (proto == htons(ETH_P_IP)) || (proto == htons(ETH_P_IPV6)) ||
> > +		(proto == htons(ETH_P_8021Q));
> 
> Do you need to include ETH_P_8021AD in that list as well or is not stmmac
> capable of checksuming beyond a single VLAN tag?

The datasheet for my Ethernet controller doesn't mention 802.1ad tag 
handling and I ran some loopback tests that showed that this controller doesn't 
recognize 802.1ad frames as vlan frames. I also haven't seen anything in the 
stmmac driver that suggests that 802.1ad offloading is supported. Maybe the 
stmmac maintainers could weigh in on this?

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
