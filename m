Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999E82EEC2
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 13:14:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDD01C6B457;
	Tue, 16 Jan 2024 12:13:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8FAAC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 12:13:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA498E0007;
 Tue, 16 Jan 2024 12:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1705407233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HAVZV89c3QYDdLE/sBbeCyFMppkpsy3QuH1HDnDx73c=;
 b=mkAehRpoJMOds1A3ag3izRN4ezIhnrkAkhPQxR5DxoOK4BvIsTbIR5UfiwKB4HGGdbmwB0
 kYFfl8c3mQ/9440wIMEl95bjiR/nGqf1LDVCp+1IGxg6uP1rDUpnZ99oLJf74vp/3jfnkG
 fjjjWq5Af3ubeIgwqM399Yf4Q3/Aj16xblGfGy6gOgRw3bZ16Xdoe1hnt7vheGIBggz0id
 GweB3+qyJ3nsSrZDfxOfbSj8lNVWsS+nT5cup4GQW/1/zbsj+jgzxCtu0kJcLwSzQnjgm5
 BCJfZZZst3IaTq5M9wi36/a7f6zhHHa/g9QY7f7LdD64D4SBfbno6ZKaOomfcA==
Date: Tue, 16 Jan 2024 13:14:15 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
In-Reply-To: <20240112181327.505b424e@kernel.org>
Message-ID: <fca39a53-743e-f79d-d2d1-f23d8e919f82@bootlin.com>
References: <20240111-prevent_dsa_tags-v5-1-63e795a4d129@bootlin.com>
 <20240112181327.505b424e@kernel.org>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v5] net: stmmac: Prevent DSA tags from
	breaking COE
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

Hi Jakub,

On Fri, 12 Jan 2024, Jakub Kicinski wrote:

> > @@ -4997,7 +5020,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
> >  	stmmac_rx_vlan(priv->dev, skb);
> >  	skb->protocol = eth_type_trans(skb, priv->dev);
> >  
> > -	if (unlikely(!coe))
> > +	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
> 
> The lack of Rx side COE checking in this driver is kinda crazy.
> Looking at enh_desc_coe_rdes0() it seems like RDES0_FRAME_TYPE
> may be the indication we need here? 

I don't think that RDES0_FRAME_TYPE would be enough, at least not on its own. 
That bit is set by checking the length/ethertype field to see if is an 
Ethernet II frame or an IEEE802.3 frame. But even Ethernet II frames with non-IP 
ethertypes will not be checksummed. Also protocols with a non-fixed ethertype 
field such as DSA_TAG_PROTO could trigger the bit, or not, depending on what 
they put in the DSA tag.

--
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
