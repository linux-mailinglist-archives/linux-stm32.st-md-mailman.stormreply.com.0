Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62B8BC817
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 09:07:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF2DC6C855;
	Mon,  6 May 2024 07:07:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 940A9C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2024 07:07:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B373C0009;
 Mon,  6 May 2024 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1714979223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mF3okb/zlCrXIKizMgfKu76xu/b0djUY7d04ZIvQ2SI=;
 b=j6S2vSVa12Y36dfV8tSiSbHT3HtfhSkv0miIpTvodL/pMj702HSJQ9y/L1BrzHr+qwLXn6
 v2ZyKVzBxVY7xGQtCTXTbWlD8rGppHUFKNmkECKa+Yf1VYBvrBLYTLoG7xuPT0nlDSFKTn
 tQ7+PrQmjCcsQsxCuGd/N0KUPOwZG5vSd8hklW22nf0kovdubmuVt/SGy/3rbafk+S4FOJ
 tzr3557EK3oB4tVti3Y4jis6NgO+W+RNz4aJ954fCkd/SayzGMqihFKlpTH/owBuA4AaJk
 mFHMNUcOPz0toEn0zeYQqJcoHweorazXNAudn8zQUYj+d9aebS6A5a/Z6hztRg==
Date: Mon, 6 May 2024 09:07:41 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <4wdcmcb2yxneynxtppestl6cp25z5xge3hfv7o47bxwpafn4cg@mtvc3ls2cxij>
Message-ID: <ec3e6c1b-1a5e-f7c9-4782-bc8f01a67f5f@bootlin.com>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
 <20240430-rzn1-gmac1-v5-2-62f65a84f418@bootlin.com>
 <4wdcmcb2yxneynxtppestl6cp25z5xge3hfv7o47bxwpafn4cg@mtvc3ls2cxij>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/7] net: stmmac: Add
 dedicated XPCS cleanup method
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

Hi Serge,

On Fri, 3 May 2024, Serge Semin wrote:

> 
> > +void stmmac_pcs_clean(struct stmmac_priv *priv)
> 
> Ideally it would have been great to have the entire driver fixed to
> accept the stmmac_priv pointer as the functions argument. But this
> would be too tiresome. Anyway seeing the PCS-setup protagonist method
> has the net_device pointer passed I would implement the same prototype
> for the antagonist even though it would require an additional local
> variable. That will make the MDIO and PCS local interface-functions
> looking alike and as if unified. That is the reason of why I made
> stmmac_xpcs_clean() accepting the net_device pointer. 
> 
> Alternatively both stmmac_pcs_setup() and stmmac_pcs_clean() could be
> converted to just accepting a pointer to the stmmac_priv instance.

I think that adapting stmmac_pcs_clean() to take a net_device struct would be 
more appropriate since it's the simpler of the two methods. I'll implement this 
in the next version.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
