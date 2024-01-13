Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AD382C913
	for <lists+linux-stm32@lfdr.de>; Sat, 13 Jan 2024 03:13:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28882C6DD7A;
	Sat, 13 Jan 2024 02:13:32 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10C03C6DD78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 02:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 777C6B82416;
 Sat, 13 Jan 2024 02:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3378C433C7;
 Sat, 13 Jan 2024 02:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705112009;
 bh=5ognxcE1HcI052/VObEGy4guszc42K8ozoLqQioknjI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Db8vIRk4Ae3BQLrgCp+c/2hJK3FZun1UD1mAy8lg/2z/iWzQBR+nSOmSmatK2Vu8U
 OrAGcFYQEKp4HQzwOs6jQyhINXj10TqS4Ahx1/YSGu/SpaRFTiObr0Sz/UF8bw4gdb
 CmS5mKqcM46hwGLJNWARbSWlCIXKEoS7mX1ezjHU9mKr7GZx7vkvGJReT8AFxgoyeO
 uLAsw6Vgn6/VOVN1DjXGQrX9hw4ptlqAO5W/8DzO2y5CWAbJKcbvz+g+aOfYf2inPf
 KDyqgheBVC2+zT6i+6bW8/rizBsaZiBJhtOonvdUaSG46N1RKnIXIpPoYNcCjeUAQh
 54nAoBwyugGdg==
Date: Fri, 12 Jan 2024 18:13:27 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240112181327.505b424e@kernel.org>
In-Reply-To: <20240111-prevent_dsa_tags-v5-1-63e795a4d129@bootlin.com>
References: <20240111-prevent_dsa_tags-v5-1-63e795a4d129@bootlin.com>
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

On Thu, 11 Jan 2024 15:58:51 +0100 Romain Gantois wrote:
> Some DSA tagging protocols change the EtherType field in the MAC header
> e.g.  DSA_TAG_PROTO_(DSA/EDSA/BRCM/MTK/RTL4C_A/SJA1105). On TX these tagged
> frames are ignored by the checksum offload engine and IP header checker of
> some stmmac cores.
> 
> On RX, the stmmac driver wrongly assumes that checksums have been computed
> for these tagged packets, and sets CHECKSUM_UNNECESSARY.
> 
> Add an additional check in the stmmac TX and RX hotpaths so that COE is
> deactivated for packets with ethertypes that will not trigger the COE and
> IP header checks.
> 
> Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
> Cc:  <stable@vger.kernel.org>

nit: double space

> +/**
> + * stmmac_has_ip_ethertype() - Check if packet has IP ethertype
> + * @skb: socket buffer to check
> + *
> + * Check if a packet has an ethertype that will trigger the IP header checks
> + * and IP/TCP checksum engine of the stmmac core.
> + *
> + * Return: true if the ethertype can trigger the checksum engine, false otherwise

nit: please don't go over 80 chars unless there's a good reason.
we are old school and stick to checkpatch --max-line-length=80 in netdev

>  	if (csum_insertion &&
> -	    priv->plat->tx_queues_cfg[queue].coe_unsupported) {
> +	    (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
> +	    !stmmac_has_ip_ethertype(skb))) {

nit: minor misalignment here, the '!' should be under 'p'

>  		if (unlikely(skb_checksum_help(skb)))
>  			goto dma_map_err;
>  		csum_insertion = !csum_insertion;
> @@ -4997,7 +5020,7 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
>  	stmmac_rx_vlan(priv->dev, skb);
>  	skb->protocol = eth_type_trans(skb, priv->dev);
>  
> -	if (unlikely(!coe))
> +	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))

The lack of Rx side COE checking in this driver is kinda crazy.
Looking at enh_desc_coe_rdes0() it seems like RDES0_FRAME_TYPE
may be the indication we need here? 

We can dig into it as a follow up but I'm guessing that sending
an IPv6 packet with extension headers will also make the device
skip checksumming, or a UDP packet with csum of 0?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
