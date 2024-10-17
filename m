Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2481D9A2AF5
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 19:31:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2C01C78032;
	Thu, 17 Oct 2024 17:31:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42B18C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 17:31:06 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43158124a54so1398905e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729186265; x=1729791065;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bQhe5YTuIUzDPM9p0+DYkvny8q+P5qebGCGivJy9ZCM=;
 b=gMzGIkLi89mj/jryuioSqa01AMqe+UjgBXqMakbAx46Fi9plK24qeGGCj2iFSVLgPM
 Xc7I9YZLX35BKMuFAbxoDuuNq17cXt2VOnM/67peXfFtsKxeEDYCrwZdjYB3yv+TqWPJ
 mGWDpRaFTpXZh1s/BC+FhC3qe9EB59uuKBeBCJ8f7FctqkztlChJRmey2xeqpATVKSwv
 ZjfeseVg2eMKfvs/CxIIoDofNVhopdWyffcCOxCD0KRNg0RYznJ9YyGn8qhOJFkwuU0O
 GJ62rpB1THVurtTc3I4kXs/Ezfm22lX3cQG1ADBFtef/WS5qKwQvDtvQ64afgBfzZNpb
 4Tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729186265; x=1729791065;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQhe5YTuIUzDPM9p0+DYkvny8q+P5qebGCGivJy9ZCM=;
 b=do/Kdk/h1i87cXfu7hxyQSLzVRFNK1z0bxLkxAwVLlO+WG0VFgps6m87BGKhVDux4T
 HZyWJRdo1QDrVG4KYvcL+5EMHdt2gBLilF7PaQ9giKKU5q4VulTw4vt7V/PxBXuhFsnF
 oAL21tN120g14CmH97tcj2JPLmb5LpApUAF/EYUiFa51UvR9VlYEE49NnWsgasemGv4e
 /Yplrzlt1+FoRoIW9SnyT+H6pqcdy6BjYaPCX1A5lpxTT3KDLJn+0268hI+k6TW+y+oz
 DQGiL0ShK6Jqf2kcUWkC4csvsY2CPwPTs7h42BxY33Uu+G263qX5MxGQvKRa76xnfsLZ
 NHCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXENqnKJ8ta9KibulyOfH6IGWhgn+nQx1uGLl8NWPwdJOADd8AfPqhQiMxtLmGmIsnmqLFk24s4kHkaUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBqlszk1ftmNm64/g1aj06Zapo3fexGEkHMWR9bW7QbFvWMVZV
 oXBvXdQXzgllss01LpvhjWQo/vq3bSU5T75ABcSG0dXHg4ijSzBw
X-Google-Smtp-Source: AGHT+IE27Q0RXwZxaGIC0/Z8xDnKDmjt7pfBnbOjjTsf8K19xvnS2BcDyVndGa3dsQPmgSt6uPJamw==
X-Received: by 2002:a05:600c:511c:b0:42c:aeee:e603 with SMTP id
 5b1f17b1804b1-431585f994dmr14823905e9.7.1729186265288; 
 Thu, 17 Oct 2024 10:31:05 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316069e12dsm1898315e9.22.2024.10.17.10.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 10:31:03 -0700 (PDT)
Date: Thu, 17 Oct 2024 20:31:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241017173101.oby36jwek7tninsx@skbuf>
References: <cover.1728980110.git.0x1207@gmail.com>
 <7b244a9d6550bd856298150fb4c083ca95b41f38.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b244a9d6550bd856298150fb4c083ca95b41f38.1728980110.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 5/5] net: stmmac: xgmac:
	Complete FPE support
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

On Tue, Oct 15, 2024 at 05:09:26PM +0800, Furong Xu wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index 6060a1d702c6..80f12b6e84e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -160,41 +160,54 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
>  	}
>  }
>  
> -static void dwmac5_fpe_configure(void __iomem *ioaddr,
> -				 struct stmmac_fpe_cfg *cfg,
> -				 u32 num_txq, u32 num_rxq,
> -				 bool tx_enable, bool pmac_enable)
> +static void common_fpe_configure(void __iomem *ioaddr,
> +				 struct stmmac_fpe_cfg *cfg, u32 rxq,
> +				 bool tx_enable, bool pmac_enable,
> +				 u32 rxq_addr, u32 fprq_mask, u32 fprq_shift,
> +				 u32 mac_fpe_addr, u32 int_en_addr,
> +				 u32 int_en_bit)

11 arguments to a function is a bit too much. Could you introduce a
structure with FPE constants per hardware IP, and just pass a pointer to
that?

>  {
>  	u32 value;
>  
> -		writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
> -		return;
> +	if (!num_tc) {
> +		/* Restore default TC:Queue mapping */
> +		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +		}
>  	}
>  
> -	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
> -	value &= ~XGMAC_FPRQ;
> -	value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
> -	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
> +	/* Synopsys Databook:
> +	 * "All Queues within a traffic class are selected in a round robin
> +	 * fashion (when packets are available) when the traffic class is
> +	 * selected by the scheduler for packet transmission. This is true for
> +	 * any of the scheduling algorithms."
> +	 */
> +	for (u32 tc = 0; tc < num_tc; tc++) {
> +		count = ndev->tc_to_txq[tc].count;
> +		offset = ndev->tc_to_txq[tc].offset;
> +
> +		if (pclass & BIT(tc))
> +			preemptible_txqs |= GENMASK(offset + count - 1, offset);
>  
> -	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
> -	value |= STMMAC_MAC_FPE_CTRL_STS_EFPE;
> -	writel(value, ioaddr + XGMAC_MAC_FPE_CTRL_STS);
> +		for (u32 i = 0; i < count; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +		}
> +	}

I agree with Simon that this patch is hard to review. The diff looks
like a jungle here, the portion with - has nothing to do with the
portion with +. Please try to do as suggested, first refactor existing
code into the common stuff, then call common stuff from new places.
Also try to keep an eye on how things look in git diff, and splitting
even further if it gets messy.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
