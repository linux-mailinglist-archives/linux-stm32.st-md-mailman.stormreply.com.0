Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBEtJ7CO8Gl4UwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2026 12:40:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2AB482CB5
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2026 12:40:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62E6CC87EDF;
	Tue, 28 Apr 2026 10:40:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63C1CC1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777372845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7gA47fGzFrwfbeRQhPiDfBesIkKjWe3OMqniZMXkZ4A=;
 b=L7FKjramA3TEn7UZwClLnVgL66TDxVGAK7AqUYQCLIt5eLxwSUN6Oz2zH9fFj+DvHPKHDz
 BsUFAkIaR/BPc51fuF3sUWHy4ElJ+L+ljMD5XVz6Fg/NQofLo5Z7DNLYNIxezrvOp0pHIe
 MagducDfb38dlg0cWdaJPXqG5CGBuxQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-StFAHAkROLyNjm9UeA_v1Q-1; Tue, 28 Apr 2026 06:40:44 -0400
X-MC-Unique: StFAHAkROLyNjm9UeA_v1Q-1
X-Mimecast-MFC-AGG-ID: StFAHAkROLyNjm9UeA_v1Q_1777372843
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8aca3b7b536so284474476d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2026 03:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777372843; x=1777977643;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7gA47fGzFrwfbeRQhPiDfBesIkKjWe3OMqniZMXkZ4A=;
 b=EiE9D4mlDbSXpuiaaCq+4z484TWeAe5mhs7NbbQ9fz+m12w3iIDs1DYM97tqlBBK4c
 oUKAf7/I2BY68NsfJEBAURieev9Voif/pHe7ex5usBdXslWpVuILjhTXULAHGk0rMPpR
 1U42qlCJgl8WzORxn+5BtzwqtlZNVysytmGnXCHS/PKgFCcOaqFNKUNXJ9SiZJGt2B+p
 +9dZoIzowqS8XRTY7VrKCmZvcrFOYQgqsyyhWjpUCw42RKLvcm4a12G8eL4OF5kqlz1n
 mnupuRyRh3vec/g7gVy28zPKPyxmCzw9FAyfmw7S05T7VbJ+1J05xhinW+Ddvn1ZLnqd
 lQGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ//6bN65yqX/hRf/mnYKsj4XDCFq/La7q4AArxF1xiWdV+p33VxuwXUDuVOiDMrHvabia1hV8MXH0Dp0Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyBoPLp0ZvBs0WZkW8hH0tlb/djo1TD0bdbja06WYmlNue0hHwL
 Q+Iq/fpXFYd+EYlWJP7GxR7/8pRlUOUEclSVKxn/YsXT5yLsSJGsBEQOEa9DayFypU3spczkM3p
 Xvt1p2pBsmDHQjvIq2/A+iS8d3WArbXZZhdE5PEQh20Trj4lw4xJGYJ1yq/yAXZ7sHFl/TjCaKR
 /i5nuRcA==
X-Gm-Gg: AeBDieu+YBf8HuwXQPA9djDvBvfGNXKPBu2j398rGekL15gNhBNdPV/cid/G/jrLmG/
 XFMrXtrLqxOp5ne0nI21tvf3Gagnevb0B0q8gzS+YKSq1AilknmhiAa9JfrQCuSVjpCxOp64AfQ
 n/p4fCcABLSyHpOyZ53DVKOPXoyajF/QjwQ2qgOt5pfJ4jDmCyrGrKEvinMtY/Cx2aVnZQMvhL4
 +o/2x4ip2XdR+0z2//llKLd7++MZCubQU18a0tBInM86Z85WOjY111+LzO4qX8axMNA10tbsj9a
 oV0S8TJ3AACqxP99FlqgDmI5vwZejasvmT4bLd/TDWZnvBiIca0HWWbtnnXU3bozlkOmA0lX+Z8
 +6Z45cXRFWBMjaVaHpFARSEpmvs+pXiLgw/tfH5v1LFN6qTLzl/UMU8C8uMOBZ64uiQ==
X-Received: by 2002:a05:6214:2404:b0:8ac:b677:c3fc with SMTP id
 6a1803df08f44-8b3e31dd1f2mr40510456d6.51.1777372843223; 
 Tue, 28 Apr 2026 03:40:43 -0700 (PDT)
X-Received: by 2002:a05:6214:2404:b0:8ac:b677:c3fc with SMTP id
 6a1803df08f44-8b3e31dd1f2mr40510006d6.51.1777372842607; 
 Tue, 28 Apr 2026 03:40:42 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.114])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b3e2811b1fsm17395116d6.10.2026.04.28.03.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 03:40:42 -0700 (PDT)
Message-ID: <1db7e764-1485-422b-8b68-b45b18f492b2@redhat.com>
Date: Tue, 28 Apr 2026 12:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sam Edwards <cfsworks@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <20260422044503.5349-1-CFSworks@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260422044503.5349-1-CFSworks@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Og90Rf7-crffGtq6ESWvtYrXJTf9UQCrbQi1QG8DB2o_1777372843
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v6] net: stmmac: Prevent NULL deref
 when RX memory exhausted
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
X-Rspamd-Queue-Id: 2B2AB482CB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:linux@armlinux.org.uk,m:vladimir.oltean@nxp.com,m:fancer.lancer@gmail.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:peppe.cavallaro@st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:fancerlancer@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,armlinux.org.uk,nxp.com,gmail.com,bootlin.com,st.com,st-md-mailman.stormreply.com,lists.infradead.org,renesas.com];
	NEURAL_SPAM(0.00)[0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]

On 4/22/26 6:45 AM, Sam Edwards wrote:
> The CPU receives frames from the MAC through conventional DMA: the CPU
> allocates buffers for the MAC, then the MAC fills them and returns
> ownership to the CPU. For each hardware RX queue, the CPU and MAC
> coordinate through a shared ring array of DMA descriptors: one
> descriptor per DMA buffer. Each descriptor includes the buffer's
> physical address and a status flag ("OWN") indicating which side owns
> the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
> the flag and the MAC is only allowed to clear it, and both must move
> through the ring in sequence: thus the ring is used for both
> "submissions" and "completions."
> 
> In the stmmac driver, stmmac_rx() bookmarks its position in the ring
> with the `cur_rx` index. The main receive loop in that function checks
> for rx_descs[cur_rx].own=0, gives the corresponding buffer to the
> network stack (NULLing the pointer), and increments `cur_rx` modulo the
> ring size. After the loop exits, stmmac_rx_refill(), which bookmarks its
> position with `dirty_rx`, allocates fresh buffers and rearms the
> descriptors (setting OWN=1). If it fails any allocation, it simply stops
> early (leaving OWN=0) and will retry where it left off when next called.
> 
> This means descriptors have a three-stage lifecycle (terms my own):
> - `empty` (OWN=1, buffer valid)
> - `full` (OWN=0, buffer valid and populated)
> - `dirty` (OWN=0, buffer NULL)
> 
> But because stmmac_rx() only checks OWN, it confuses `full`/`dirty`. In
> the past (see 'Fixes:'), there was a bug where the loop could cycle
> `cur_rx` all the way back to the first descriptor it dirtied, resulting
> in a NULL dereference when mistaken for `full`. The aforementioned
> commit resolved that *specific* failure by capping the loop's iteration
> limit at `dma_rx_size - 1`, but this is only a partial fix: if the
> previous stmmac_rx_refill() didn't complete, then there are leftover
> `dirty` descriptors that the loop might encounter without needing to
> cycle fully around. The current code therefore panics (see 'Closes:')
> when stmmac_rx_refill() is memory-starved long enough for `cur_rx` to
> catch up to `dirty_rx`.
> 
> Fix this by explicitly checking, before advancing `cur_rx`, if the next
> entry is dirty; exit the loop if so. This prevents processing of the
> final, used descriptor until stmmac_rx_refill() succeeds, but
> fully prevents the `cur_rx == dirty_rx` ambiguity as the previous bugfix
> intended: so remove the clamp as well. Since stmmac_rx_zc() is a
> copy-paste-and-tweak of stmmac_rx() and the code structure is identical,
> any fix to stmmac_rx() will also need a corresponding fix for
> stmmac_rx_zc(). Therefore, apply the same check there.
> 
> In stmmac_rx() (not stmmac_rx_zc()), a related bug remains: after the
> MAC sets OWN=0 on the final descriptor, it will be unable to send any
> further DMA-complete IRQs until it's given more `empty` descriptors.
> Currently, the driver simply *hopes* that the next stmmac_rx_refill()
> succeeds, risking an indefinite stall of the receive process if not. But
> this is not a regression, so it can be addressed in a future change.
> 
> Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
> Cc: stable@vger.kernel.org
> Suggested-by: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>
> ---
> 
> This is v6 of [1], which was itself split out of [2]. This patch prevents a
> NULL dereference in the stmmac receive path, and (at Russell's suggestion) in
> the zero-copy path as well.
> 
> The approach is different from the previous version and checks the dirty_rx
> index in the loop proper, copied directly from Russell's suggestion [3]. Parts
> of the commit message also use his phrasing. For these reasons he is credited
> with `Suggested-by`.
> 
> The commit message now acknowledges the pipeline stall that can occur in case
> of failure of the next stmmac_rx_refill() after the MAC consumes the final
> descriptor. I still intend to fix that bug when I can find the time to finish
> investigating and implement the timer as requested by Jakub, however I'm
> sending this patch now to resolve the outright _panic_ and simplify review.
> The stmmac_rx_zc() path is not affected by this stall.
> 
> [1] https://lore.kernel.org/netdev/20260415023947.7627-1-CFSworks@gmail.com/
> [2] https://lore.kernel.org/netdev/20260401041929.12392-1-CFSworks@gmail.com/
> [3] https://lore.kernel.org/netdev/ad-LAB08-_rpmMzK@shell.armlinux.org.uk/
> 
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca68248dbc78..3591755ea30b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5549,9 +5549,12 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
>  			break;
>  
>  		/* Prefetch the next RX descriptor */
> -		rx_q->cur_rx = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
> -						priv->dma_conf.dma_rx_size);
> -		next_entry = rx_q->cur_rx;
> +		next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
> +					       priv->dma_conf.dma_rx_size);
> +		if (unlikely(next_entry == rx_q->dirty_rx))
> +			break;

Sashiko notes that breaking the loop of DMA descriptors owned by the CPU
may cause double accounting for the ingress stats by stmmac_rx_status().

AFAICS that is not a regression, as the existing later XDP check already
does the same, so I think that problem should be addressed separately.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
