Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B16D745B
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 08:21:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B95FC6A61B;
	Wed,  5 Apr 2023 06:21:36 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9CDAC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 16:11:20 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id kc4so31750353plb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Apr 2023 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680624679;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CLSNpBLE1zZj2pYIUNEhwYsUjIS5zTtbyz1C7DwdTc8=;
 b=a3wZ8DLBM+5b6x83GzLyseUCS2NaCJ1RHsOkEEJklmRMDa67BWIjsTj3PxWwocGCG7
 6imk0mip5Tzb68Vya/2wPqZ4M4KHcjf2C8i68L9t0PCf7oyoi9kc6HavLVzktZ0jQzip
 TUqAbQFbE3HTVyZK7HKfOPBvOvHdSQVnaH/qSOAi7piFTMOgQE9uK3mO9wmlIgHUklTC
 H2Rjf747c0m9aT0EOyKossmx75acKjl4ngbVW5Y8La6GGy0fI3dfwEM9SyLy5z2LVqbk
 yLbYJHZ9aLe0NgxWtu7dEV/rW0v7XqSQr3YdwSqlrj8jfEVBUdmLPrjTjVrhIORRsvU/
 GCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680624679;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CLSNpBLE1zZj2pYIUNEhwYsUjIS5zTtbyz1C7DwdTc8=;
 b=JuIik4cttroC6kSvy+m3php6g5s6vSZZ1kxJKP6aWF+vARVkhmc4C9PKklH5Z8cxL5
 7vmnF0tijKdcDbVUJ2cAs6I0i+D50HfLkCPBXPF+CrBWFNCEjzlz/3VGdXsBouuxkcUg
 IGuOHPx1J9+8Td+baHKaPo8gGw8TfeEcNyFPwK3sFqdS3al7I+kY3glbQY5o5RlPKJdR
 +GOmufEBvl32aC/vnVOknCxdmUOD63fRJzY5O8Fxs5Dl2Bza9e4P5+7pOPLsa60GdAHV
 ftwcYnEVCgEUdIbRs25qJfj0QFOZ2D0SHyp0ZrQJPYfrAHLZRdM1ghcYsNYiM5cKwwe1
 C51Q==
X-Gm-Message-State: AAQBX9dyeZz8lQkRtI/uL6DqJ/s8dyPM5y1p1wAxi52nulce9TNoUmSC
 5BSmlNvNWVwjIT1CDpZ6bnY=
X-Google-Smtp-Source: AKy350and3Y73d+IQ7L9nx8YhlsQ1wChDracxJniTYlJXyPMirizEFteA2SQxqK8jX6sKRzSYD/bFA==
X-Received: by 2002:a05:6a20:7a04:b0:e4:9940:d7c9 with SMTP id
 t4-20020a056a207a0400b000e49940d7c9mr2197897pzh.39.1680624678948; 
 Tue, 04 Apr 2023 09:11:18 -0700 (PDT)
Received: from [192.168.0.128] ([98.97.112.205])
 by smtp.googlemail.com with ESMTPSA id
 13-20020aa7924d000000b006262520ac59sm8937614pfp.127.2023.04.04.09.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:11:18 -0700 (PDT)
Message-ID: <903f658b47d8b02695d9cd7d43b5d9cfb0558490.camel@gmail.com>
From: Alexander H Duyck <alexander.duyck@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Christian Marangi
 <ansuelsmth@gmail.com>
Date: Tue, 04 Apr 2023 09:11:17 -0700
In-Reply-To: <20230404044823.3226144-1-yoong.siang.song@intel.com>
References: <20230404044823.3226144-1-yoong.siang.song@intel.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Apr 2023 06:21:34 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Add queue reset into
 stmmac_xdp_open() function
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

On Tue, 2023-04-04 at 12:48 +0800, Song Yoong Siang wrote:
> Queue reset was moved out from __init_dma_rx_desc_rings() and
> __init_dma_tx_desc_rings() functions. Thus, the driver fails to transmit
> and receive packet after XDP prog setup.
> 
> This commit adds the missing queue reset into stmmac_xdp_open() function.
> 
> Fixes: f9ec5723c3db ("net: ethernet: stmicro: stmmac: move queue reset to dedicated functions")
> Cc: <stable@vger.kernel.org> # 6.0+
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3e5bbfe3c41b..e4c27eb17bd2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6630,6 +6630,8 @@ int stmmac_xdp_open(struct net_device *dev)
>  		goto init_error;
>  	}
>  
> +	stmmac_reset_queues_param(priv);
> +
>  	/* DMA CSR Channel configuration */
>  	for (chan = 0; chan < dma_csr_ch; chan++) {
>  		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);

Looks good to me.

Reviewed-by: Alexander Duyck <alexanderduyck@fb.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
