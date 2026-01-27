Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFeQB3EreGl7oQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 04:05:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4478F5C1
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 04:05:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23D4CC36B30;
	Tue, 27 Jan 2026 03:05:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1288CC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 03:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D3523436A4;
 Tue, 27 Jan 2026 03:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4736C116C6;
 Tue, 27 Jan 2026 03:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769483117;
 bh=0eIazrYKt2H5dVz7aR3WwR1CWkD2A4VVVnLg5inRWCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bsteKB38Vgdxvn6fjaonze1NGEu4h/x6dfnvShLEL5ZXBp6d78jL3+k0oIrPtrL+W
 JHpww+J6XLaI8onnyqSBQJVjRb12xmCEaS4TMyuDwq6K2tOQz+pRYNQmAR58Kvkxek
 kKKnilR3gJVsaXrW6PD0/KWxsNcOw1a91QXE8cNlprmiTDGns7cfmc66XiiN/ax1cJ
 JofwEocyUtpkGH3rPHgThSTr8DSpgIUhh+CgrHJb0JUbKA5oHdKB2XWFdgj/OlnTgA
 r+98poQyyjsQVifmEX6PEfHp1XmeQNa+NCJQ+shpBhFekKHzv20ZVeVRhh2KGrjnfn
 S5XJNivEjJjqg==
From: Jakub Kicinski <kuba@kernel.org>
To: lihaoxiang@isrc.iscas.ac.cn
Date: Mon, 26 Jan 2026 19:04:47 -0800
Message-ID: <20260127030447.3838706-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125135412.2070798-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260125135412.2070798-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Cc: hawk@kernel.org, daniel@iogearbox.net, davem@davemloft.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 edumazet@google.com, sdf@fomichev.me, mcoquelin.stm32@gmail.com,
 boon.leong.ong@intel.com, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] fix a potential memory leak in
	stmmac_xdp_enable_pool()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lihaoxiang@isrc.iscas.ac.cn,m:hawk@kernel.org,m:daniel@iogearbox.net,m:davem@davemloft.net,m:netdev@vger.kernel.org,m:john.fastabend@gmail.com,m:ast@kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:mcoquelin.stm32@gmail.com,m:boon.leong.ong@intel.com,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,davemloft.net,vger.kernel.org,gmail.com,lunn.ch,google.com,fomichev.me,intel.com,redhat.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.966];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url]
X-Rspamd-Queue-Id: 9F4478F5C1
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
fix a potential memory leak in stmmac_xdp_enable_pool()

This patch adds xsk_pool_dma_unmap() to the error path when
stmmac_xsk_wakeup() fails, to release the DMA mapping allocated
earlier by xsk_pool_dma_map().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> index d7e4db7224b0..7d89d6066ea3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> @@ -48,8 +48,10 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
>  		napi_enable(&ch->rxtx_napi);
>
>  		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
> -		if (err)
> +		if (err) {
> +			xsk_pool_dma_unmap(pool, STMMAC_RX_DMA_ATTR);
>  			return err;
> +		}

Is the error cleanup here complete? Looking at stmmac_xdp_enable_pool(),
before this point the code has already executed:

  set_bit(queue, priv->af_xdp_zc_qps);
  stmmac_enable_rx_queue(priv, queue);
  stmmac_enable_tx_queue(priv, queue);
  napi_enable(&ch->rxtx_napi);

When stmmac_xsk_wakeup() fails, the patch unmaps the DMA pool but does not
appear to reverse these other state changes. Comparing with the cleanup
sequence in stmmac_xdp_disable_pool(), should the error path also:

  - call clear_bit(queue, priv->af_xdp_zc_qps)
  - disable the queues and NAPI that were just enabled

The DMA descriptors allocated by stmmac_enable_rx_queue() and
stmmac_enable_tx_queue() would also be leaked on this error path.

>  	}
>
>  	return 0;
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
