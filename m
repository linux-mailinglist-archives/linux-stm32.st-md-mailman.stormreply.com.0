Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82720A54097
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 03:21:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42B48C78F80;
	Thu,  6 Mar 2025 02:21:19 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50C1BC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 02:21:18 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2f9d3d0f55dso286986a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Mar 2025 18:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741227677; x=1741832477;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9uf9XkZp6sUpoZuVO6jgJ6hPy2Z9ZctUdmgbqHKgrhA=;
 b=jnwvaBpwAOk+tWolvW6fNeP6TTaK29uOGV3s/hHOUcb/dXVnbg/o7tUX2rNYucoYZ+
 Z1sIBqKaHw2w3BozpD8g2VYYhwD9j8RAKBWZTSRU8/0PAYAWr5ns8et9gOEPxGofc4Hz
 wW/k9/11lE5ng9zkoElNyIFcHez8VtVI3zzoqVoxhTQ8HrW1hn6kjwTGXgARTdoeMbqY
 t/7DyGzg+DEtdatqfhr0rPan+fi1B+fTsvIwCgv5CCFO0SFNnek3ubJ/F9hXR3d0nMQr
 NmMAAs0A+8S52JlLfKB5/Yyrt4sjT5XyPRwJZnrwzCPWpnOIxFr3T6vFMvb+T61jmlbw
 T2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741227677; x=1741832477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9uf9XkZp6sUpoZuVO6jgJ6hPy2Z9ZctUdmgbqHKgrhA=;
 b=sfU640blHbRCMs4PfZs1Qb0n1/Zy0Rf9Oy517WcLp4+P3f932cLPZ1cw2G4KkY0HMC
 MY8YrU3JG7vEpDvzUZYoYTPfxwejtnMeD8O55G0IJEggJG70txTwucOv3NNgZMr2IzeQ
 /ojP1I+3nHWyECxevHvlTpiSkY19VW6rj1TsGSptFHcADIMangDlMJNuKiLGcn8UVr8C
 +npYBSQ0YvMrYA9YPkRo+sBCa/NMV9Yxkf5GIY8Xnehr3UfhZnIwqDGjyg+K/UGQDp6j
 ODSwoJIL0GDzLyWrl51MCaj59JfpOCX32F4N7oJySBhXIzRPlj8IqK3MopZXO33LKUy/
 4krg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFpdrm75Yl9rO3D2W8mJMidSBljvQMJqfXSRynaouF7wTIauP4hAgx2PBLJUn7a1Flyn1OFN1a5IUHEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcciUXacS5T8bs8EejSKsUcYZSYP+sKRIiXEy3f3PWSChRabmE
 cYTjrcAI1atdjZkQYIZP1x5gLpQrk8QdEyRej0kfCRkATDFIH+FD
X-Gm-Gg: ASbGncsFSeN8ilDjFTxbXDdQwz8P68XcjbzaGkMIdfs4TPamnhJIgYZNUY98UHbU3rV
 yU7KkysVKKpDvrinJZ6EfM8AHbDvc3BH+YtzkCF3Cx9yW0TK3xjXKeooELl4EYqjcgFcvGo1jTy
 4uAjth6+Y0FBhFJ743y8e52o9kYITTKkOwAmKOvx3rUm7xz/ds9vft9IoY5QYkdzUyCWeOAkYi5
 YNjrb/bngfyahS9wUog0IpgmH2LjQZO/3Haup/Dytfv7a1o2y9u6JA+CpBxD3ujA73c4PE9yIka
 u9rJfGr8ROK0Qgo44MJUQGpprr5OagTQmX940g==
X-Google-Smtp-Source: AGHT+IHkMiSrpKwGbFAkWOhgsD087E6Gf2q0MWqWgQE8twjmH+Zp7KHIpHrJbDkVmH95oKOIZuwckQ==
X-Received: by 2002:a17:90b:5747:b0:2ef:114d:7bf8 with SMTP id
 98e67ed59e1d1-2ff49717514mr8399175a91.6.1741227676668; 
 Wed, 05 Mar 2025 18:21:16 -0800 (PST)
Received: from localhost ([144.24.43.60]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693527f9sm167239a91.11.2025.03.05.18.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 18:21:16 -0800 (PST)
Date: Thu, 6 Mar 2025 10:21:07 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250306102107.00003c31@gmail.com>
In-Reply-To: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
References: <E1tpswi-005U6C-Py@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: avoid shadowing
	global buf_sz
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

On Wed, 05 Mar 2025 17:54:16 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> stmmac_rx() declares a local variable named "buf_sz" but there is also
> a global variable for a module parameter which is called the same. To
> avoid confusion, rename the local variable.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 334d41b8fa70..cb5099caecd0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5475,10 +5475,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  	struct sk_buff *skb = NULL;
>  	struct stmmac_xdp_buff ctx;
>  	int xdp_status = 0;
> -	int buf_sz;
> +	int bufsz;
>  
>  	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
> -	buf_sz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
> +	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
>  	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
>  
>  	if (netif_msg_rx_status(priv)) {
> @@ -5591,7 +5591,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			net_prefetch(page_address(buf->page) +
>  				     buf->page_offset);
>  
> -			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
> +			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
>  			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
>  					 buf->page_offset, buf1_len, true);
>  

Reviewed-by: Furong Xu <0x1207@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
