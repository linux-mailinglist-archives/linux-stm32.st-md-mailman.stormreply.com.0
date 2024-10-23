Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 807809ACC17
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 16:17:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20225C71289;
	Wed, 23 Oct 2024 14:17:12 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9ABAC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 14:17:04 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a99e690a3e9so71141766b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 07:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729693024; x=1730297824;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RgEr86OeLs+qLPckKWtoHddsgWSl6fk02nvmP20gJ1s=;
 b=kwEai+9ectPxGrmANRJ2bdmm6ZoQ29L5JUElE/evf2HIsSv3f/C/ZrXkEkjqHxy7g/
 DyRk6/9sigrWtUOxe65gTEIH85Jx5jD4VW2xsSC7Sj+8qIPMkvBP+U/ZCuR3ZoH/jD9v
 G73xTz1y6ltm4cjDpBuwKt1Rkx6nnM5oGJ7pKRkHdeYV6k35kg5uwb7jqAk++IVQ6KbU
 aLDKqq+uuu9wxJJF10LgaDO7kelTIKCGTo0y4Vn33FolH4PxkfQzqZ7o9xL59vJTmF6o
 AMR0fG7r4EhQjg0vKlZJWrcx5yVf8N8gYJ+xfRhtUOIxFVY099bL73LBa7NXpsix1E4w
 hoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729693024; x=1730297824;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RgEr86OeLs+qLPckKWtoHddsgWSl6fk02nvmP20gJ1s=;
 b=NDzCfmysEshOftA6nUzFjUmQCaWEYCcWVFdQq6IYHpCxqYdx1mGVm5FRTtMHwNUmtW
 PTjTtFve8YWe7YlKYfrM+hR//Chz0S9nJ17oryuOWk/JOnxGanjbhK3JDtd5l58C+6Os
 fBoNGH15lLQCHQOXwrktORrzyckptPG7UbAdFyKR9HvqtcO8p4v9TOZBXZaYlebwddBV
 YZRP0+D5ct9MEChaYW0abIz0Ux4W+140N8mZ5eZ2voRl1UM28b17Flg23RPLMyDWxqgY
 dpyO/Q4qpK0bDMeJ29kSc5fo1m8XD0eCmOQv4/6fcBPIiYXq68CAb06RuZN53NpFM09s
 XbeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ0VcdJOBDlMLFHDsuD0zqqo00qLISfxJNYEaui+LGPkN2PldApVaBNJhzdvhTZ+p74satvwpeweanlg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdnwdZ8n6Yp3TtKbkQ0qMocn6t9plPwYQauzEn1kWgA8wVrY5u
 8k/fACvrCca3UPfqM6MJIVsuRBA5dMoMBWyInWu03P/arGx1iQDK
X-Google-Smtp-Source: AGHT+IEV0YikMikXJEsk3rCrnY1FH/p9IQzfHmP4dSCxt90dLsVCtjcMi6dhpcSlH+cOBzDnw0R7Bw==
X-Received: by 2002:a17:906:f5a7:b0:a9a:5b78:cee5 with SMTP id
 a640c23a62f3a-a9abf92b233mr112552866b.9.1729693024025; 
 Wed, 23 Oct 2024 07:17:04 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a9137053csm481018066b.115.2024.10.23.07.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 07:17:03 -0700 (PDT)
Date: Wed, 23 Oct 2024 17:17:00 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241023141700.niz3ow2xu6pbgbg4@skbuf>
References: <cover.1729663066.git.0x1207@gmail.com>
 <4949cb6845b8a4e7c79af4165814fad270459f7b.1729663066.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4949cb6845b8a4e7c79af4165814fad270459f7b.1729663066.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/6] net: stmmac: Refactor FPE
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

On Wed, Oct 23, 2024 at 03:05:23PM +0800, Furong Xu wrote:
> -void dwmac5_fpe_configure(void __iomem *ioaddr, struct stmmac_fpe_cfg *cfg,
> -			  u32 num_txq, u32 num_rxq,
> +void stmmac_fpe_configure(struct stmmac_priv *priv, u32 num_txq, u32 num_rxq,
>  			  bool tx_enable, bool pmac_enable)
>  {
> +	struct stmmac_fpe_cfg *cfg = &priv->fpe_cfg;
> +	const struct stmmac_fpe_reg *reg = cfg->reg;
> +	void __iomem *ioaddr = priv->ioaddr;
>  	u32 value;
>  
> +	if (!reg)
> +		return;

What are all these "if (!reg) return" checks protecting against?
At all call sites you ensure that priv->dma_cap.fpesel is true.
If defense against driver writers is necessary, check only once at boot
time that if priv->dma_cap.fpesel is true, we have a way to handle it
(priv->fpe_cfg.reg is set). Or are there still supported DWMAC variants
with the FPE hardware capability but without driver support?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ab547430a717..7874a955ab60 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5944,8 +5944,7 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
>  				      &priv->xstats, tx_cnt);
>  
>  	if (priv->dma_cap.fpesel) {
> -		int status = stmmac_fpe_irq_status(priv, priv->ioaddr,
> -						   priv->dev);
> +		int status = stmmac_fpe_irq_status(priv);
>  
>  		stmmac_fpe_event_status(priv, status);
>  	}

I think this coding pattern is illogical, and the code refactoring makes
it more apparent. stmmac_common_interrupt() does nothing with "status",
it just takes it as a return code from stmmac_fpe_irq_status(), and
passes it to stmmac_fpe_event_status(), both of which are in
stmmac_fpe.c. Why isn't there a direct tail call from one function to
the other, to simplify the external API exposed by stmmac_fpe.h?

> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
