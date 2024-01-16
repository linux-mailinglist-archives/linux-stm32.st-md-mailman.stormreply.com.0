Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CAE82F162
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jan 2024 16:23:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3CD0C6B476;
	Tue, 16 Jan 2024 15:23:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BAB7C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 15:23:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A6A7D6126A;
 Tue, 16 Jan 2024 15:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF7FC433C7;
 Tue, 16 Jan 2024 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705418582;
 bh=AmZdj0eOvsIB/ujpQpyR8C/TssJ81P4jo/0LQq93d8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nq4ggkoL4EWs4nhCK2iucl9MmiXNhmC6pgZ7TaIeIM/Lg6XVkB87rwndBWwYB4Q3P
 sPyclCXTudskQ8Je4/NNXPRb8KGgOGlHhnzqXHFAkDmizz2mLMlcGmeqwUlPapk5gl
 RLCNplQFOJ0ZQDPT6FrjflKizAYloysT3Vs9H/iNzKyyAAjXE2pw/nJlA2nTwPy4ZA
 /C5LT8PZweUUzWRPgiPlxupO9ja20RncG5jXUvGlDyjhPi35Fpn97B//GgvnA3u4sQ
 qIULyU8tFAdke8LtHCx1uT4gcbLSQLwP+4gTxyx+zk58r5haZpwFnpZEsdmvQ936HF
 fvrrmMX8KjY6g==
Date: Tue, 16 Jan 2024 07:23:00 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240116072300.3a6e0dbe@kernel.org>
In-Reply-To: <fca39a53-743e-f79d-d2d1-f23d8e919f82@bootlin.com>
References: <20240111-prevent_dsa_tags-v5-1-63e795a4d129@bootlin.com>
 <20240112181327.505b424e@kernel.org>
 <fca39a53-743e-f79d-d2d1-f23d8e919f82@bootlin.com>
MIME-Version: 1.0
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Tue, 16 Jan 2024 13:14:15 +0100 (CET) Romain Gantois wrote:
> > > @@ -4997,7 +5020,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
> > >  	stmmac_rx_vlan(priv->dev, skb);
> > >  	skb->protocol = eth_type_trans(skb, priv->dev);
> > >  
> > > -	if (unlikely(!coe))
> > > +	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))  
> > 
> > The lack of Rx side COE checking in this driver is kinda crazy.
> > Looking at enh_desc_coe_rdes0() it seems like RDES0_FRAME_TYPE
> > may be the indication we need here?   
> 
> I don't think that RDES0_FRAME_TYPE would be enough, at least not on its own. 
> That bit is set by checking the length/ethertype field to see if is an 
> Ethernet II frame or an IEEE802.3 frame. But even Ethernet II frames with non-IP 
> ethertypes will not be checksummed. Also protocols with a non-fixed ethertype 
> field such as DSA_TAG_PROTO could trigger the bit, or not, depending on what 
> they put in the DSA tag.

Hm, the comment in enh_desc_coe_rdes0() says:

	/* bits 5 7 0 | Frame status
	 * ----------------------------------------------------------
	 *      0 0 0 | IEEE 802.3 Type frame (length < 1536 octects)
	 *      1 0 0 | IPv4/6 No CSUM errorS.
	 *      1 0 1 | IPv4/6 CSUM PAYLOAD error
	 *      1 1 0 | IPv4/6 CSUM IP HR error
	 *      1 1 1 | IPv4/6 IP PAYLOAD AND HEADER errorS
	 *      0 0 1 | IPv4/6 unsupported IP PAYLOAD
	 *      0 1 1 | COE bypassed.. no IPv4/6 frame
	 *      0 1 0 | Reserved.
	 */

which makes it sound like bit 5 will not be set for a Ethernet II frame
with unsupported IP payload, or not an IP frame. Does the bit mean other
things in different descriptor formats?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
