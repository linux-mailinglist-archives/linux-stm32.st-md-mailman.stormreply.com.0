Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E98184C9
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 10:49:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 379B6C6DD6F;
	Tue, 19 Dec 2023 09:49:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C38B3C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 09:49:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 635F560005;
 Tue, 19 Dec 2023 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1702979396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TFwRIbCu773yJM6SoJhaRdgwhYYSLN14HzCIEELJBlM=;
 b=g203GzoRSn3CF1+2MF3Q9E0Paa1Qv5l10q/q6/ipcdH1TSxNrwoBQ9GFKVM6MnQLdJUVA7
 XO42FaR9ulL1VSG1zHqB90X7SFAi9keN5hsPANnrkWTke1HrW3w9Fc4hNVR5tic9l8BDKZ
 GrB2kMUEo7xm+ZFfy6ZgDqn34zAO6Tejw9lIDY9m1SnXXtS8jnuToMrzGlAopVra7nr6so
 Eiu/u1oC4a3NGofLlD6opNwgJNPn5vC/13SlIF3c7FE25esIsB+NVDIQGXHPZmPPYPgs02
 Q9CaxgQPzp1ZSBY0g+jhxpXe/BUhzG6r7NKFf0OaLRRsyUqA1Q1iyspiYgXwPA==
Date: Tue, 19 Dec 2023 10:50:15 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
In-Reply-To: <f4166144-4874-4b10-96f8-fc3e03f94904@lunn.ch>
Message-ID: <cdc38cdf-536c-c23b-46c1-abadf14001a2@bootlin.com>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <f4166144-4874-4b10-96f8-fc3e03f94904@lunn.ch>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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

On Mon, 18 Dec 2023, Andrew Lunn wrote:
...
> Probably a dumb question.... Does this COE also perform checksum
> validation on receive? Is it also getting confused by the DSA header?
> 
> You must of tested receive, so it works somehow, but i just wounder if
> something needs to be done to be on the safe side?

That's a good point, I just investigated the RX path a bit more and the MAC 
indeed has IP/TCP/UDP RX checksum offloading enabled. However, the 
external switch in my setup uses EDSA tags, which displace the "true" ethertype 
field to the end of the DSA header and replaces the "normal" ethertype with 
ETH_P_EDSA (0xdada). So to the MAC controller, the ethernet frame has an unknown 
ethertype, and so it doesn't see it as an IP frame at all. All of the 
ethtool counters related to IP stuff are at 0, which supports this.

This explains why checksum offloading doesn't break the RX path in my case. 
However, other maybe other DSA switches using different frame formats could 
cause different behavior? Considering this, I think it would be safer to change 
the dsa_breaks_tx_coe flag to a general dsa_breaks_coe flag. It makes sense to 
me to assume that if DSA tags break TX COE, then RX COE will also not work.

I'll take this into account when I send a v2.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
