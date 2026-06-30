Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MEB9F5igQ2rUdgoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 12:55:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B76E32E3
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 12:55:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=Z+IQL+6Z;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88BD3C8F265;
	Tue, 30 Jun 2026 10:55:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AD8BC7A830
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782816917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMKiXFK0pfNTOQ9DCFZIRhDUF8Wl7Qfuw9O2ocILSG4=;
 b=Z+IQL+6ZQQjlLVRzcaClAzGyZitfp2olCP+7nJPioz3inYY18YU5dm6RXG+5ScxTZoTSmE
 h/crKEG+6BS2D+HbfGEofKfLvUahiCjw4AiHp4unTrrYf9Hgw8dIOdTl935tFgpBm+9ABA
 1N9gvCcGUiUin2ueHcoY/K0x8OEEEi0=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-Vf6cTC2fP26O_NysSIr3Kw-1; Tue, 30 Jun 2026 06:55:15 -0400
X-MC-Unique: Vf6cTC2fP26O_NysSIr3Kw-1
X-Mimecast-MFC-AGG-ID: Vf6cTC2fP26O_NysSIr3Kw_1782816915
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-6650f57ffa8so24009d50.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2026 03:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782816915; x=1783421715;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hMKiXFK0pfNTOQ9DCFZIRhDUF8Wl7Qfuw9O2ocILSG4=;
 b=DhrjPh6F0Q/6chRYRAPi45nIjHvMNKa8JYqc55WPyTR9u1Lowr3GCW8mkNAvb1zf2Y
 iHq43W2lLK2whQKr3Gk3T+HGfC57x+ZwAsEJ+4NU6UEyz7sMRLIyF94v1h8eOjTZVKVe
 Gaq2OuiJMt5JjquCLc8Wu9oqNxCD3z1znrsmzF/mpued3gi9gfmr3qBeH2VkFiCDHYTU
 PyocEnb3OGmkvuz5R6bxqiEPlEnLFiiKr5nppLoU0+f/sipcB3ak926sOBNEab/1ezv8
 J+tq5/Vnd/OdSiG5n6npZzQnHYgg8z9dhC+Jo7vXqkNDqDZ3EZ+wYqmUb6m7kU+6HEOu
 81cw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqpCppCK+QDDYT7U8hi8Id3G9h9acdBuZeorvUpjUK/faqjdFjMmTPbfWtwiayjQaysinnmLW2BVmyq6g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYTxzlHV7frw83rwRKyYiF4THiBQxnQqg0olFR4P2B56cwbvxe
 zuQjN0SSyCaJqW4/E9IRjFDyBu72OrqGlbYLuy4cJ6dFGiY1DF3eWe8YV07cjmC6LOx4b/5q2f/
 npvSFb+8NDV0OIcfQfb+k4KCq9Q55bob/BT5s635yD3NQZyExAblyNUglp0bVhTQ0trMYk8ihBh
 GQNOA4ew==
X-Gm-Gg: AfdE7ckw4jkavlhOoP0N7O1z5SFHDs9Xdi3ZKmQ+txFaI8mLQBzDDwSJ7eWTDQBl2+u
 uaX59OvzXxoSsJ+J8uvhR1c3W4BSzLfA3E7oacICOJ2LAnvX5/H+47TbVAOKJx9FEKBqZXZIraK
 62iAPLo38m6vmeSxjjeZ4bBU/S9ymlykw06uRTBzi+M1Qo7BmW9FSLQrbd74s1qDNJdV5edshyS
 T5sHgP3pF1H73EpiAlCqomD4Quw9ouCHBWVNHKBQiy3peZlfgc5fw8+hwQMayBhFD9iCsNDjgbc
 0wqauM/zzmtCE0cqKtlTuejd4kcsmlQT4RCt6uWKiPpwJUh3II8hARCf3Sj/FaKZN1Jsj2DLDMI
 5eqR6m0BydwlBt87SH1i8wSgYV8p7UI48qPX1GeLv6JWralSrhBhq5VWcLjYeXjg9CbVkjK+Hk3
 lFMhZrl7jbLw==
X-Received: by 2002:a05:690e:419b:b0:662:e26f:cd10 with SMTP id
 956f58d0204a3-664f98cfe16mr2737865d50.51.1782816914992; 
 Tue, 30 Jun 2026 03:55:14 -0700 (PDT)
X-Received: by 2002:a05:690e:419b:b0:662:e26f:cd10 with SMTP id
 956f58d0204a3-664f98cfe16mr2737836d50.51.1782816914353; 
 Tue, 30 Jun 2026 03:55:14 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534?
 ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-66500666305sm757620d50.5.2026.06.30.03.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 03:55:13 -0700 (PDT)
Message-ID: <b42c9095-aa2a-4e2f-b65e-11adbd2dbec6@redhat.com>
Date: Tue, 30 Jun 2026 12:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ding Hui <dinghui1111@163.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Ding Hui <dinghui@lixiang.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260627122533.1165324-1-dinghui1111@163.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260627122533.1165324-1-dinghui1111@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c5M_APmC5vO_ThjLGaJFQOGQbZ19kz8UsSGVKhssxDM_1782816915
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: xiasanbo@lixiang.com, liuxuanjun@lixiang.com, yangchen11@lixiang.com
Subject: Re: [Linux-stm32] [PATCH v4] net: stmmac: fix fatal bus error on
 resume by reinitializing RX buffers
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dinghui1111@163.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:xiasanbo@lixiang.com,m:liuxuanjun@lixiang.com,m:yangchen11@lixiang.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[163.com,lunn.ch,davemloft.net,google.com,kernel.org,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,lixiang.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lixiang.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D09B76E32E3

On 6/27/26 2:25 PM, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> 
> On suspend, stmmac_suspend() calls stmmac_disable_all_queues() which
> stops the RX NAPI, but the RX DMA engine may still be running for a
> short window before stmmac_stop_all_dma() takes effect. During that
> window the hardware can write incoming frames into the buffers pointed
> to by the RX descriptors and write back the descriptors (clearing the
> OWN bit and overwriting RDES0/1/2 with status/timestamp data). Because
> NAPI is already disabled, the driver never refills these descriptors,
> so the RX ring is left in a "consumed but not refilled" state with
> stale content in the descriptor buffer-address fields.
> 
> On resume, stmmac_clear_descriptors() only re-arms the OWN bit and
> does not repopulate the RX buffer address fields. When the DMA is
> restarted it dereferences these stale addresses and triggers a fatal
> bus error (not kernel panic, just a Fatal Bus Error interrupt and
> RX DMA engine halts).
> 
> Fix this by introducing stmmac_reinit_rx_descriptors(), called from
> stmmac_resume() immediately after stmmac_clear_descriptors(). The
> helper iterates every RX descriptor slot and re-programs its buffer
> address fields:
> 
>  - For normal (page_pool) queues: restore RDES0/1 from buf->addr and
>    RDES2 from buf->sec_addr. The DMA mapping has remained valid across
>    suspend/resume because no pages were freed. Slots left NULL by a
>    prior GFP_ATOMIC failure in stmmac_rx_refill() before suspend
>    are re-allocated here with GFP_KERNEL;
>    -ENOMEM is returned and resume is aborted if allocation fails.
>    The slots with null buffer are unacceptable, because they will
>    cause a DMA suspend dead lock problem by the condition of
>    Current Descriptor Pointer == Descriptor Tail Pointer.
> 
>  - For AF_XDP zero-copy queues: restore the DMA address from
>    xsk_buff_xdp_get_dma(buf->xdp). Slots with no xdp buffer
>    (e.g. TX-only socket, empty fill ring) attempt xsk_buff_alloc()
>    first; on failure the descriptor is zeroed so the DMA engine skips
>    the slot safely via an RBU event.
> 
>  - For chain mode: call stmmac_mode_init() to rebuild the des3 next-
>    descriptor pointer chain, which hardware may have overwritten with
>    a PTP timestamp value (as noted in chain_mode.c:refill_desc3()).
> 
> After reprogramming all address fields, a final pass restores OWN=1
> on every valid slot. This is necessary because set_sec_addr and
> chain-mode init unconditionally overwrite des3 (clearing the OWN bit
> set by stmmac_clear_descriptors()), and must run after all address
> writes are complete.
> 
> Also fix stmmac_init_rx_buffers() to actually use its gfp_t flags
> parameter instead of the hardcoded GFP_ATOMIC | __GFP_NOWARN.
> 
> Signed-off-by: Ding Hui <dinghui@lixiang.com>

This looks like 'net' material, it should specify 'net' into the subj
prefix and include a suitable Fixes tag.

> ---
> Changes in v4:
> - Just add description for return value of 'stmmac_reinit_rx_descriptors'.
> - Link to v3:
>   https://lore.kernel.org/netdev/20260604144557.3175399-1-dinghui1111@163.com/
> 
> Changes in v3:
> - Re-allocate page_pool NULL slots (from prior GFP_ATOMIC failures)
>   with GFP_KERNEL in stmmac_reinit_rx_descriptors(); return -ENOMEM and
>   abort resume.
> - For XSK NULL slots, attempt xsk_buff_alloc() first; fall back to
>   stmmac_clear_desc() only when allocation fails.
> - Add a re-arm loop at the end of stmmac_reinit_rx_descriptors() to
>   restore OWN=1 on all valid slots, since set_sec_addr and
>   chain-mode init both write des3 unconditionally.
> - stmmac_reinit_rx_descriptors() now returns int; stmmac_resume()
>   checks the return value and propagates -ENOMEM with mutex/rtnl cleanup.
> - Fix stmmac_init_rx_buffers() to use its flags parameter instead of
>   hardcoded GFP_ATOMIC | __GFP_NOWARN.
>   (884d2b845477 ("net: stmmac: Add GFP_DMA32 for rx buffers if no 64
>   capability"))
> - Run stmmac_reinit_rx_descriptors() after stmmac_clear_descriptors()
>   so that stmmac_clear_desc() on XSK NULL slots overrides the OWN
>   bit set by stmmac_clear_descriptors().
> - Update commit message.
> - Link to v2:
>   https://lore.kernel.org/netdev/20260526022620.501229-1-dinghui1111@163.com/
> 
> Changes in v2:
> - Introducing stmmac_reinit_rx_descriptors() to reinitializing rx
>   buffers without any allocation.
> - Modify commit log.
> - Link to v1:
>   https://lore.kernel.org/netdev/20260515053856.2310369-1-dinghui1111@163.com/
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 164 +++++++++++++++++-
>  1 file changed, 163 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..c82f3d5dbd43 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1660,7 +1660,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
>  {
>  	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
>  	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
> -	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
> +	gfp_t gfp = flags;

The above should go via a separate (net) patch.

>  
>  	if (priv->dma_cap.host_dma_width <= 32)
>  		gfp |= GFP_DMA32;
> @@ -1693,6 +1693,148 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
>  	return 0;
>  }
>  
> +/**
> + * stmmac_reinit_rx_descriptors - re-program RX descriptor buffer addresses
> + *				   after stmmac_clear_descriptors()
> + * @priv: driver private structure
> + * @dma_conf: structure holding the dma data
> + * @queue: RX queue index
> + *
> + * Description: Called in the resume path after stmmac_clear_descriptors()
> + * has re-armed the OWN bit on every descriptor.  Walk buf_pool[] and
> + * re-program the buffer-address fields of every RX descriptor from the
> + * buffers that are already attached to the queue.  Slots whose page was
> + * never allocated (GFP_ATOMIC failure before suspend) are re-allocated
> + * here with GFP_KERNEL; the resume path is in process context.
> + *
> + * Between suspend and resume the hardware may have written back status/
> + * length information into the descriptor address fields (RDESx are reused
> + * for status on completion for GMAC4/XGMAC), so the address fields must be
> + * repopulated before the DMA is restarted.
> + *
> + * For XSK slots that have no xdp buffer at suspend time (TX-only socket,
> + * empty fill ring for Rx), xsk_buff_alloc() is attempted but does not
> + * return an error on failure because we can't identify a real TX-only
> + * socket from an alloc error (same as stmmac_alloc_rx_buffers_zc() in
> + * __init_dma_rx_desc_rings); on failure the descriptor is zeroed so the DMA
> + * engine skips the slot safely.
> + *
> + * To avoid the DMA stall after resume in non-XSK mode, this function
> + * re-allocates pages for NULL slots using GFP_KERNEL (the resume path runs
> + * in process context). If allocation fails, -%ENOMEM is returned immediately
> + * and the resume is aborted; the caller should report the error.
> + *
> + * This helper must be called after stmmac_clear_descriptors() and before
> + * stmmac_hw_setup() in stmmac_resume() because we need to wipe the OWN bit
> + * set in stmmac_clear_descriptors() for NULL slots in XSK mode.

Please try to condense the above text in one or 2 paragraph.

> + *
> + * Returns: 0 on success, or a negative errno on allocation failure in
> + * non-XSK mode (e.g. -%ENOMEM).
> + */
> +static int stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
> +					struct stmmac_dma_conf *dma_conf,
> +					u32 queue)
> +{
> +	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
> +	struct stmmac_rx_buffer *buf;
> +	struct dma_desc *p;
> +	int i;
> +
> +	if (rx_q->xsk_pool) {
> +		for (i = 0; i < dma_conf->dma_rx_size; i++) {
> +			buf = &rx_q->buf_pool[i];
> +			p = stmmac_get_rx_desc(priv, rx_q, i);
> +
> +			/* The XSK pool may not be fully populated (e.g.
> +			 * xdpsock TX-only, empty fill ring).  Try to refill
> +			 * from the pool; on failure zero the descriptor so the
> +			 * DMA engine skips this slot safely.
> +			 */
> +			if (!buf->xdp) {
> +				buf->xdp = xsk_buff_alloc(rx_q->xsk_pool);
> +				if (!buf->xdp) {
> +					stmmac_clear_desc(priv, p);
> +					continue;
> +				}
> +			}
> +
> +			stmmac_set_desc_addr(priv, p,
> +					     xsk_buff_xdp_get_dma(buf->xdp));
> +			stmmac_set_desc_sec_addr(priv, p, 0, false);
> +		}
> +	} else {
> +		for (i = 0; i < dma_conf->dma_rx_size; i++) {
> +			buf = &rx_q->buf_pool[i];
> +			p = stmmac_get_rx_desc(priv, rx_q, i);
> +
> +			/* buf->page can be NULL when stmmac_rx_refill() hit a
> +			 * GFP_ATOMIC failure before suspend and left the slot
> +			 * without a buffer. The resume path runs in process
> +			 * context, so re-allocate with GFP_KERNEL. Allocation
> +			 * failure aborts the resume.
> +			 */
> +			if (!buf->page) {
> +				int err;
> +
> +				err = stmmac_init_rx_buffers(priv, dma_conf, p,
> +							     i, GFP_KERNEL,
> +							     queue);
> +				if (err)
> +					return err;
> +				/* stmmac_init_rx_buffers() already programmed
> +				 * the descriptor; skip the reprogramming below.
> +				 */
> +				continue;
> +			}
> +
> +			stmmac_set_desc_addr(priv, p, buf->addr);
> +			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
> +						 priv->sph_active &&
> +						 buf->sec_page);

AFAICS stmmac_rx_refill() can error out after successfully allocating
buf->page, but leaving a NULL sec_page, I think you should try to
realloc even the latter.

Finally this chunk shares quite a bit of code with stmmac_rx_refill()
and stmmac_rx_refill_zc() it would be better try to factor out common
helpers.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
