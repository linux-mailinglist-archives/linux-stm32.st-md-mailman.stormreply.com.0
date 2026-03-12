Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJclAuiLsmkKNgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 10:48:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F5826FD1F
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 10:48:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D300C900A5;
	Thu, 12 Mar 2026 09:48:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92BC9C8F28C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IX9QCS5b6Xn8/dE+/kiOOEMjyLxuCn5DnqDHXAakk1Q=; b=aeYFHgEtYTI5faN/d/LqgD2Dp6
 odc7r897g1zvAU6wvFcuBnivPiYJbIxNehFn3ZKXukEe2Lxlm/YIfB6y71RBd1b1jq/1tcm2ntQmR
 jikwtnBlvs5XmwbNZx+7HZiA62AWry4n2J4zruKOj7swfs9a6L8E1Z0jirq8Gdfwg7PQ3rCw2Rar/
 JGdtsGje6JyAXnBsa2hGg8O8vtb6pesAjYqqcwwsQqYlKNp1QYkcRCTzKay133DvUxElIUtY/we0Q
 FkVmm8WLGj37z1lgPHsrU5chrBFb7nygXNfFR4R3dx3U24Lq9sucIwaAV0lQlE/B3QaJMP/YRmZjX
 hgjfxbpA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51292)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w0bo1-000000007QA-0LuK;
 Thu, 12 Mar 2026 08:54:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w0bnx-0000000076N-39Oq; Thu, 12 Mar 2026 08:54:05 +0000
Date: Thu, 12 Mar 2026 08:54:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <abJ_Le1xOP6roesb@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
 <E1w0GEg-0000000CiSj-2CVA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1w0GEg-0000000CiSj-2CVA@rmk-PC.armlinux.org.uk>
X-Mailman-Approved-At: Thu, 12 Mar 2026 09:48:20 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 02/15] net: stmmac: helpers for
 filling tx_q->tx_skbuff_dma
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:ast@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E5F5826FD1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:52:14AM +0000, Russell King (Oracle) wrote:
> +static void stmmac_set_tx_dma_entry(struct stmmac_tx_queue *tx_q,
> +				    unsigned int entry,
> +				    enum stmmac_txbuf_type type,
> +				    dma_addr_t addr, size_t len,
> +				    bool map_as_page)
> +{
...
> +	tx_q->tx_skbuff_dma[entry].buf_type = type;
...
> +}
> +
> +static void stmmac_set_tx_skb_dma_entry(struct stmmac_tx_queue *tx_q,
> +					unsigned int entry, dma_addr_t addr,
> +					size_t len, bool map_as_page)
> +{
> +	stmmac_set_tx_dma_entry(tx_q, entry, STMMAC_TXBUF_T_SKB, addr, len,
> +				map_as_page);
> +}

...

> @@ -4471,10 +4495,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  	 * this DMA buffer right after the DMA engine completely finishes the
>  	 * full buffer transmission.
>  	 */
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_headlen(skb);
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> +	stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des, skb_headlen(skb),
> +				    false);

when nfrags is zero, tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type is set
here.

>  
>  	/* Prepare fragments */
>  	for (i = 0; i < nfrags; i++) {
> @@ -4489,17 +4511,14 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
>  				     (i == nfrags - 1), queue);
>  
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = des;
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].len = skb_frag_size(frag);
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
> -		tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
> +		stmmac_set_tx_skb_dma_entry(tx_q, tx_q->cur_tx, des,
> +					    skb_frag_size(frag), true);
>  	}

... and tx_q->cur_tx is not incremented because the loop is not
executed.

>  
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].last_segment = true;
> +	stmmac_set_tx_dma_last_segment(tx_q, tx_q->cur_tx);
>  
>  	/* Only the last descriptor gets to point to the skb. */
>  	tx_q->tx_skbuff[tx_q->cur_tx] = skb;
> -	tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;

Thus this assignment of tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type is
redundant. As the loop doesn't execute any code in the nfrags=0 case,
there is no call to stmmac_tso_allocator(), and thus tx_q->cur_tx will
be the same as when the previous stmmac_set_tx_skb_dma_entry() was
called.

Therefore, the AI review is incorrect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
