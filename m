Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D670D9B5228
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 19:52:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EE42C71290;
	Tue, 29 Oct 2024 18:52:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EB91C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 18:52:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-37d450de14fso518094f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 11:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730227955; x=1730832755;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cQbHGrEqsKD5aF1OKVKnRulxpzJaf4NY46AhJlO9sJg=;
 b=WWEnyucumL8/A500IOcSb3A/dG7WepH3+CC0517a02wyVBL79ig+tQSnqgoqEqylgv
 n1GHxibrA1ZciZpB4EAH/8wvcSWHrAu0XdQ3hyWPlGQfoAW/QzskK7O40rG8CAuRL6IX
 DWs6LP0JvBD694PFDuavipqZYIsl4Mf2AVOlT/Kf9Lvdb0zMCOQ7Ep+/qT6YN+PgDIxd
 xXdh9ry70tSQdjFm4MZzdWz8w+W/gr1lDkEesGPN7yeMxfHI0VrubDSVzgiTbdfzllZr
 F/d5CjnyuvCt7l8xjshNu2jcQPZ8dX1kfBhESX6cb1sD6q6NDudB9uzoSm2brpR5feP+
 nD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730227955; x=1730832755;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQbHGrEqsKD5aF1OKVKnRulxpzJaf4NY46AhJlO9sJg=;
 b=VV/Uo8w2Hr9ojCICPlxkNl+BtahV4fJlSK2Shc+Mxb36k9w/XNrLDFyaSzld2xI9na
 8av/Zjw4vPLuPPY+oUPiMxIhuPkYhu0hKW7+HmztDcZyCC0Vb5EsxDDz0zyYfCFEMToG
 kG1t8OGUuBV0tgzwzhV2S3IFj2Uy/4L0JO5Wy2/wqr9eci41aceGDX3qj4PIt9t6lZFr
 5Dipgz00kXfaonm1ZU0e4WLacOusyjRL9syWd9I5ucuwIl9RZ7xxeUjvY5MmKd2/PxZD
 lgaUc5qan2TC/lchM9uFkxE1exZ1+SeOVmhuCoX4AmsnzcL86c/wre/9x3oHFaBoxkEn
 FhRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX++mAM7HtSqvJ7aKOMjCfk55qxS5u6+0BL+zd5hsOTfif9+EJmOJ7E+dW5UinUxIZf8xPAh4ggKv+Mgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx5XtCd1MdwWyFPQuqxafRvuuyExvonsL0c16OnlSSlQ/5PFUhp
 XuZvagNg4kFy3KVa9W1f01LbFXQYlNWdMQHR57fa6pzhpcnW0iBR
X-Google-Smtp-Source: AGHT+IF1JuH5GETYzM48l9lfnZfPVRTjPuBUwhpTxF2mnfjmnhq15lSAoKb5oQuP+txb+/2Ssczf8A==
X-Received: by 2002:a05:600c:1c29:b0:431:50b9:fa81 with SMTP id
 5b1f17b1804b1-4319ad368f4mr46064815e9.7.1730227955179; 
 Tue, 29 Oct 2024 11:52:35 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573e47sm154555825e9.8.2024.10.29.11.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:52:34 -0700 (PDT)
Date: Tue, 29 Oct 2024 20:52:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241029185231.fgy6tofi2uoslp3l@skbuf>
References: <cover.1730084449.git.0x1207@gmail.com>
 <0f13217c5f7a543121286f13b389b5800bde1730.1730084449.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f13217c5f7a543121286f13b389b5800bde1730.1730084449.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/6] net: stmmac: Refactor FPE
 functions to generic version
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

On Mon, Oct 28, 2024 at 11:07:26AM +0800, Furong Xu wrote:
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
>  	unsigned long flags;
>  
> +	if (!priv->dma_cap.fpesel)
> +		return;
> +

Minor nitpick: all call sites also have this test already.

>  	timer_shutdown_sync(&fpe_cfg->verify_timer);
>  
>  	spin_lock_irqsave(&fpe_cfg->lock, flags);
>  
>  	if (is_up && fpe_cfg->pmac_enabled) {
>  		/* VERIFY process requires pmac enabled when NIC comes up */
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> +		stmmac_fpe_configure(priv, priv->plat->tx_queues_to_use,
>  				     priv->plat->rx_queues_to_use,
>  				     false, true);
>  
> @@ -154,6 +161,11 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
>  	priv->fpe_cfg.status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
>  	timer_setup(&priv->fpe_cfg.verify_timer, stmmac_fpe_verify_timer, 0);
>  	spin_lock_init(&priv->fpe_cfg.lock);
> +
> +	if (priv->dma_cap.fpesel && !priv->fpe_cfg.reg) {
> +		dev_warn(priv->device, "FPE on this MAC is not supported by driver, force disable it.\n");
> +		priv->dma_cap.fpesel = 0;
> +	}

Let's not change the output of stmmac_dma_cap_show() sysfs attribute if
we don't have to. Who knows what depends on that. It's better to
introduce stmmac_fpe_supported(), which tests for both conditions,
and use it throughout (except, of course, for the sysfs, which should
still print the raw DMA capability).

Which devices would those even be, which support FPE but the driver
doesn't deal with them (after your XGMAC addition), do you have any idea?

>  }
>  
>  void stmmac_fpe_apply(struct stmmac_priv *priv)
> @@ -164,8 +176,7 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
>  	 * Otherwise let the timer code do it.
>  	 */
>  	if (!fpe_cfg->verify_enabled) {
> -		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> +		stmmac_fpe_configure(priv, priv->plat->tx_queues_to_use,
>  				     priv->plat->rx_queues_to_use,
>  				     fpe_cfg->tx_enabled,
>  				     fpe_cfg->pmac_enabled);
> @@ -178,50 +189,54 @@ void stmmac_fpe_apply(struct stmmac_priv *priv)
>  	}
>  }
>  
> -void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			  u32 num_txq, u32 num_rxq,
> +void stmmac_fpe_configure(struct stmmac_priv *priv, u32 num_txq, u32 num_rxq,
>  			  bool tx_enable, bool pmac_enable)

num_txq? not used anywhere. num_rxq? can be retrieved from the "priv"
pointer already provided.

The rest of the series looks good, I have no other comments.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
