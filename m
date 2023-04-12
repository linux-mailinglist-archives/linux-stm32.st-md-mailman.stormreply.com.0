Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 939096E07CB
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 09:33:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F290C6A614;
	Thu, 13 Apr 2023 07:33:39 +0000 (UTC)
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
 [209.85.216.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE925C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 17:00:06 +0000 (UTC)
Received: by mail-pj1-f73.google.com with SMTP id
 nn5-20020a17090b38c500b00246772f5325so4879322pjb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 10:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681318805;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=kpKB7SqPD1WEJcm5mP/ZS9AV7kRHrr2cruyzGPdJnmY=;
 b=0dJ9X7z1jh25oYOHdd+ljdJXvOW0dD6zhgL9qARYaY8+1ZTVplJLk+y5Aqe0axj3f7
 rVda5IIvH/u9Mqx1YM4d0qjJrdRXlxwNLJlT3miGS7NcBeAWuFzmKipOZKiFXsHiIL6T
 CaKVTz/SjKtNGnp7avxMqpahnjuoTUT2P5T8gW/+RyXl9cT27GQpQ51fkvGdzeQQl5cD
 +fQ5My91JFTUE3tWCvY92nPuUsiGOO+mEOjRSnKlR/K+ZOhQwo6p0Yt8Zeb3AIof9tx9
 0Pt0VWQRjjZjTU1US/MsJ9d5y5H4C3VMfArkbKJhdzLnma7r7K7IN7gX3VGgvRhe2V/N
 q8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681318805;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kpKB7SqPD1WEJcm5mP/ZS9AV7kRHrr2cruyzGPdJnmY=;
 b=WeBI9tkX/3TgELEuwRYVzr2EhrhF2KhNRejDDwBcesOwOMTSvSh6RCS3ctUoguxUfE
 nNeYeWPoOHovbbQ4vnkpzby5Ed3YtreBpTlteW/wlx2JL+d2VnMZjVUtquPaRUe7zSbF
 3H0HWdaCW0Wl1TzoiDLj0yFfrHoRi/4OUk/Uj8PNxQ8jAgDtb6sXe8CAmCKywTcM0z6x
 X18EOqD3/3Z65rpAGBrE/KIhD/Lo9YXa2n1ssaupG8RnRac7SijQQNdLNSruJmOnDd9t
 EpL09ELl3yEIAUpFPoebfVpuilpplZy6NgrWCZKKY1Ogm77ZMy0YG4KHVEP7X7PGQCGu
 ovtA==
X-Gm-Message-State: AAQBX9drFUywxVnqhCHY5Yp3jX5FZTmw8F2dmV+yvBjftpO57qlFHbcJ
 kbIhc3Ix0U5rKSGypG0iimscEQ8=
X-Google-Smtp-Source: AKy350bqCRuf2+nw6G4Xo/+RMWx8JZZGxbP78hg7vN5q2J6hphsLxNUKDMeaTSlnL3vx8TUht7eSaik=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a65:60c2:0:b0:51a:52b1:1b70 with SMTP id
 r2-20020a6560c2000000b0051a52b11b70mr775383pgv.10.1681318805239; Wed, 12 Apr
 2023 10:00:05 -0700 (PDT)
Date: Wed, 12 Apr 2023 10:00:03 -0700
In-Reply-To: <20230412094235.589089-4-yoong.siang.song@intel.com>
Mime-Version: 1.0
References: <20230412094235.589089-1-yoong.siang.song@intel.com>
 <20230412094235.589089-4-yoong.siang.song@intel.com>
Message-ID: <ZDbjkwGS5L9wdS5h@google.com>
From: Stanislav Fomichev <sdf@google.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
X-Mailman-Approved-At: Thu, 13 Apr 2023 07:33:37 +0000
Cc: xdp-hints@xdp-project.net, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Alexander Duyck <alexanderduyck@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/4] net: stmmac: add Rx HWTS
 metadata to XDP receive pkt
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

On 04/12, Song Yoong Siang wrote:
> Add receive hardware timestamp metadata support via kfunc to XDP receive
> packets.
> 
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 +++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 ++++++++++++++++++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index ac8ccf851708..826ac0ec88c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -94,6 +94,9 @@ struct stmmac_rx_buffer {
>  
>  struct stmmac_xdp_buff {
>  	struct xdp_buff xdp;
> +	struct stmmac_priv *priv;
> +	struct dma_desc *p;
> +	struct dma_desc *np;
>  };
>  
>  struct stmmac_rx_queue {
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f7bbdf04d20c..ed660927b628 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5315,10 +5315,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  
>  			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
>  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> -					 buf->page_offset, buf1_len, false);
> +					 buf->page_offset, buf1_len, true);
>  
>  			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>  				  buf->page_offset;
> +
> +			ctx.priv = priv;
> +			ctx.p = p;
> +			ctx.np = np;
> +
>  			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
>  			/* Due xdp_adjust_tail: DMA sync for_device
>  			 * cover max len CPU touch
> @@ -7071,6 +7076,23 @@ void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
>  	}
>  }
>  
> +static int stmmac_xdp_rx_timestamp(const struct xdp_md *_ctx, u64 *timestamp)
> +{
> +	const struct stmmac_xdp_buff *ctx = (void *)_ctx;
> +
> +	*timestamp = 0;
> +	stmmac_get_rx_hwtstamp(ctx->priv, ctx->p, ctx->np, timestamp);
> +

[..]

> +	if (*timestamp)

Nit: does it make sense to change stmmac_get_rx_hwtstamp to return bool
to indicate success/failure? Then you can do:

if (!stmmac_get_rx_hwtstamp())
	reutrn -ENODATA;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
