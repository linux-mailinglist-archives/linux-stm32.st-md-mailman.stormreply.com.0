Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBzvBzzuyGnSsQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 11:17:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8169C35150B
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 11:17:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7D0C87EC4;
	Sun, 29 Mar 2026 09:17:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8B85C56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2026 09:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9I9pWg1qiYfKGe+2u/Y2VqDef17Cucv2X9t5EHG/VHY=; b=KJhk2qyRb7hH9av5+qNwazNMTy
 /H/qCrwEypVy856dDzpTdNFAtkcNVVQQWMdtn7PtGZYzaC2M+en5DweQT9uriJql4SxDEPNXy1afc
 IytMSDELrmpfTx2w5SOY1FyFkgEOP36SNOVZ+6c0NPtSLbySQp4X2sqBWSsMYUKwnQVgm82tUpQBs
 Z+0NndiXiAcvInuKxbhUyAWkOxf184wn1GmoKnXd10wwoCrlsZWXbr1XnugFhNp2iWsmMocE8eNzN
 kFprirWTNz3gnTt0Cvn5AwxRcd+cgozm5qwxDdjJe5iYKCGu3FsQuQjxBm9jJrhicQAP0J6w3YjyF
 4QLWLwLQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47022)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w6mH7-000000007oq-2vj2;
 Sun, 29 Mar 2026 10:17:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w6mH6-000000001bg-0198; Sun, 29 Mar 2026 10:17:40 +0100
Date: Sun, 29 Mar 2026 10:17:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <acjuM_ryTVHU9Ib_@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <E1w6bL9-0000000ELu9-1quN@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1w6bL9-0000000ELu9-1quN@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 06/10] net: stmmac: simplify
 GSO/TSO test in stmmac_xmit()
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.751];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,st-md-mailman.stormreply.com:rdns,shell.armlinux.org.uk:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 8169C35150B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 09:37:07PM +0000, Russell King (Oracle) wrote:
> +static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
> +{
> +	if (!tso) {
> +		priv->gso_enabled_types = 0;
> +	} else {
> +		/* Manage oversized TCP frames for GMAC4 device */
> +		priv->gso_enabled_types = SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
> +		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
> +			priv->gso_enabled_types |= SKB_GSO_UDP_L4;

I've been wondering whether keying all three of these off NETIF_F_TSO
is correct. Shouldn't SKB_GSP_UDP_L4 be dependent on NETIF_F_GSO_UDP_L4?

(The above code doesn't change the current driver behaviour, so this
would be a separate fix.)

> +	}
> +}
> +
>  /**
>   *  stmmac_tso_xmit - Tx entry point of the driver for oversized frames (TSO)
>   *  @skb : the socket buffer
> @@ -4671,7 +4683,6 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	u32 queue = skb_get_queue_mapping(skb);
>  	int nfrags = skb_shinfo(skb)->nr_frags;
>  	unsigned int first_entry, tx_packets;
> -	int gso = skb_shinfo(skb)->gso_type;
>  	struct stmmac_txq_stats *txq_stats;
>  	struct dma_desc *desc, *first_desc;
>  	struct stmmac_tx_queue *tx_q;
> @@ -4683,14 +4694,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  	if (priv->tx_path_in_lpi_mode && priv->eee_sw_timer_en)
>  		stmmac_stop_sw_lpi(priv);
>  
> -	/* Manage oversized TCP frames for GMAC4 device */
> -	if (skb_is_gso(skb) && priv->tso) {
> -		if (gso & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))
> -			return stmmac_tso_xmit(skb, dev);
> -		if (priv->plat->core_type == DWMAC_CORE_GMAC4 &&
> -		    (gso & SKB_GSO_UDP_L4))
> -			return stmmac_tso_xmit(skb, dev);
> -	}
> +	if (skb_is_gso(skb) &&
> +	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
> +		return stmmac_tso_xmit(skb, dev);

I'm also wondering whether we should check gso_type in our
.ndo_features_check() method rather than here - if we get a GSO skb at
this point for a type that we don't recognise, surely it is wrong to
pass it via the normal skb transmission flow.

Yet more worms in the stmmac can... :/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
