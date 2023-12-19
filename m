Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35880818847
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 14:08:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1D9EC6B461;
	Tue, 19 Dec 2023 13:07:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 708C6C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 13:07:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C78DE1C000F;
 Tue, 19 Dec 2023 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1702991278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vOCGtitF2HXWOLXDqhpNdoEBncyC42eynFv1ljek8s=;
 b=J/IGMFa4EEj/d/lEkcPk0xSpQNuPyk2FE6kqlPgm/6jdbO/ngl3pGC/pYFd7akxBt6Rl03
 BYOB11oXgmQCP8b/zIbLG98RzZqD6r5v56IqxtnFM5iwOS2q37v4N7weF3RdGiYKdcPjRJ
 LESkn5eU0dafsjzWts/m6HqmXaIG0t8dyvd8ynrXs/9TL0pOHh394ZN8XxUIQZOWhO7aGc
 0Mqtli1bCPm1Tx1YCc2tdp1NNMB/zTytaqteHcmQ/4gH4ODU2UM/x6sQQ7aNJqYdwqOE6a
 Ge79Fcd8q2q2CDcOKiBfI3xBJDTNcfcVJDUAZx8ynU5q5b1CYpWq2AGWdaE7uQ==
Date: Tue, 19 Dec 2023 14:07:54 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20231219140754.7a7a8dbd@device-28.home>
In-Reply-To: <20231219122034.pg2djgrosa4irubh@skbuf>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <20231218162326.173127-2-romain.gantois@bootlin.com>
 <20231219122034.pg2djgrosa4irubh@skbuf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Prevent DSA tags
	from breaking COE
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

Hi Vlad,

+ Linus Walleij

On Tue, 19 Dec 2023 14:20:34 +0200
Vladimir Oltean <olteanv@gmail.com> wrote:

> Hi Romain,
> 
> On Mon, Dec 18, 2023 at 05:23:23PM +0100, Romain Gantois wrote:
> > Some stmmac cores have Checksum Offload Engines that cannot handle DSA tags
> > properly. These cores find the IP/TCP headers on their own and end up
> > computing an incorrect checksum when a DSA tag is inserted between the MAC
> > header and IP header.
> > 
> > Add an additional check on stmmac link up so that COE is deactivated
> > when the stmmac device is used as a DSA conduit.
> > 
> > Add a new dma_feature flag to allow cores to signal that their COEs can't
> > handle DSA tags on TX.
> > 
> > Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
> > Cc: stable@vger.kernel.org
> > Reported-by: Richard Tresidder <rtresidd@electromag.com.au>
> > Closes: https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electromag.com.au/
> > Reported-by: Romain Gantois <romain.gantois@bootlin.com>
> > Closes: https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin.com/
> > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> > ---  
> 
> DSA_TAG_PROTO_LAN9303, DSA_TAG_PROTO_SJA1105 and DSA_TAG_PROTO_SJA1110
> construct tags with ETH_P_8021Q as EtherType. Do you still think it
> would be correct to say that all DSA tags break COE on the stmmac, as
> this patch assumes?
> 
> The NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM convention is not about
> statically checking whether the interface using DSA, but about looking
> at each packet before deciding whether to use the offload engine or to
> call skb_checksum_help().

So it looks like an acceptable solution would be something along the
lines of what Linus is suggesting here :

https://lore.kernel.org/netdev/20231216-new-gemini-ethernet-regression-v2-2-64c269413dfa@linaro.org/

If so, maybe it's worth adding a new helper for that check ?

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
