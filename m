Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D1095CB8E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 13:39:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BF8EC71289;
	Fri, 23 Aug 2024 11:39:30 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B6E5C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 11:39:23 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f3ea86377aso19339751fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724413162; x=1725017962;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jlruKgWSyuzMsIHMo/qBZLFbjRmtSnM9kjyIrTE/wvg=;
 b=e+K/oNF5GN9oBviGN7RLaefZa1MpBd/m+oFynBX//rQES4LTcAy/KZ+UeyRyZroNKb
 xsbJsLgNJAQM9E122uMEp8i3wc+ySvzZZ8mGUWN0OHfbrzfE2DlMKdFgEsi7heuQMP+B
 jWUJdFdI1tZeQ0cHr01ECgnx+W3cD+5MQkejQxYvKrUIKI1yFDoWv82fKRXpZY2phWwH
 xN/UOnckC4i8Urq3RXQMlslsD8Qd+moakCKqxcZU67Y9x6BNLnr8stp04AlmtlNlcQQ3
 A1+AQ/Y1KwsVeItbRsY1K2J0x1baMDP4lSedfkq3RuVJjspEgYrm9PvYgtIp5NE8rSFN
 vmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724413162; x=1725017962;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlruKgWSyuzMsIHMo/qBZLFbjRmtSnM9kjyIrTE/wvg=;
 b=MgOBmku2sfWOHlDbJwYymACNFNReUnqCfpnyS2ye3vRETGBTJv02LBPA/5cmpogsYO
 omfUemEQZ67PWULnoEjFpYqiQQK5e2HY+79SO/ekYKoP/8A26NqM2XCV+b4i6fYRhzdG
 x+cd1+4cuUclX9VQB1xS+kIzTcbaFh2lZPX0J7bdGS/pop7E75o1i9IK4LWWr2on3WlT
 fQNih5nrgNDMX58ZDFM/2KJyasBn2VSD9boUf6+wuUwQT3g7GDKonf9nUfWJBZM/1mUS
 CLbMKy0Mni2DlvHdBNsjiBROOJm7zyY5QseViZuouoKEp5RNj39CQ1P0/z3Nz33c2WDE
 6F4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaesZptXBfXdwVUj4viFKb/EZeKT8EcSeIAsGO8ShYgFlrxkTBb3QLVaGPD6Hbu/F4i+yOWSy2Hql7KA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+treAAc0AdfCL8vSI9cDMWvbeFN+c2QanURGkRuUPDgRyKRpo
 t2VWHbq0407NYBcesVozl2qNCvVbYLi0Fj+L3I4nLrogaOIE7JIb
X-Google-Smtp-Source: AGHT+IGFZsbaVFFRPu1XfQgRoVIGdIfcvZRHBov5lLf0J3VMkYh9shDO4B98AiQLhmcrPhVqhMokVg==
X-Received: by 2002:a2e:bea8:0:b0:2ef:296d:1dd5 with SMTP id
 38308e7fff4ca-2f4f4745a34mr18409651fa.0.1724413161623; 
 Fri, 23 Aug 2024 04:39:21 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f4047a4ed4sm4527191fa.10.2024.08.23.04.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 04:39:21 -0700 (PDT)
Date: Fri, 23 Aug 2024 14:39:18 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: ende.tan@starfivetech.com
Message-ID: <hq3rdtfobswczm5aecjezmm5isitquedryhjiw64n4bp2rhqyj@mvhhyanfbmuz>
References: <20240821060307.46350-1-ende.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821060307.46350-1-ende.tan@starfivetech.com>
Cc: andrew@lunn.ch, leyfoon.tan@starfivetech.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 edumazet@google.com, joabreu@synopsys.com, minda.chen@starfivetech.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 endeneer@gmail.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v2,
 1/1] net: stmmac: Add dma_wmb() barrier before setting OWN bit in
 set_rx_owner()
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

Hi Tan

On Wed, Aug 21, 2024 at 02:03:07PM +0800, ende.tan@starfivetech.com wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Currently, some set_rx_owner() callbacks set interrupt-on-completion bit
> in addition to OWN bit, without inserting a dma_wmb() barrier in
> between. This might cause missed interrupt if the DMA sees the OWN bit
> before the interrupt-on-completion bit is set.
> 
> Thus, this patch adds dma_wmb() barrier right before setting OWN bit in
> each of the callbacks. Now that the responsibility of calling dma_wmb()
> is delegated to the callbacks, let's simplify main driver code by
> removing dma_wmb() before stmmac_set_rx_owner().
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>
> ---
> v2:
> - Avoid introducing a new function just to set the interrupt-on-completion
>   bit, as it is wasteful to do so.
> - Delegate the responsibility of calling dma_wmb() from main driver code
>   to set_rx_owner() callbacks (i.e. let callbacks to manage the low-level
>   ordering/barrier rather than cluttering up the main driver code).
> v1:
> - https://patchwork.kernel.org/project/netdevbpf/patch/20240814092438.3129-1-ende.tan@starfivetech.com/
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 5 ++++-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 5 +++--
>  drivers/net/ethernet/stmicro/stmmac/enh_desc.c       | 1 +
>  drivers/net/ethernet/stmicro/stmmac/norm_desc.c      | 1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 2 --
>  5 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index 1c5802e0d7f4..95aea6ad485b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -186,10 +186,13 @@ static void dwmac4_set_tx_owner(struct dma_desc *p)
>  
>  static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
>  {

> -	p->des3 |= cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR);
> +	p->des3 |= cpu_to_le32(RDES3_BUFFER1_VALID_ADDR);
>  
>  	if (!disable_rx_ic)
>  		p->des3 |= cpu_to_le32(RDES3_INT_ON_COMPLETION_EN);
> +
> +	dma_wmb();
> +	p->des3 |= cpu_to_le32(RDES3_OWN);
>  }
>  
>  static int dwmac4_get_tx_ls(struct dma_desc *p)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index fc82862a612c..d76ae833c840 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -56,10 +56,11 @@ static void dwxgmac2_set_tx_owner(struct dma_desc *p)
>  
>  static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
>  {
> -	p->des3 |= cpu_to_le32(XGMAC_RDES3_OWN);
> -
>  	if (!disable_rx_ic)
>  		p->des3 |= cpu_to_le32(XGMAC_RDES3_IOC);
> +
> +	dma_wmb();
> +	p->des3 |= cpu_to_le32(XGMAC_RDES3_OWN);

I am not against moving the barrier here but really I don't see a firm
reason of why you can't collect the flags in a local variable and
then flush it out to the DES3 field.

Getting back to your discussion with Andrew:
https://lore.kernel.org/netdev/06297829-0bf7-4a06-baaf-e32c39888947@lunn.ch/
you said:

> I didn't use local variable because I worry about CPU out-of-order execution. 
> For example,
> ```
> local_var = (INT_ON_COMPLETION | OWN)
> des3 |= local_var
> ```
> CPU optimization might result in this
> ```
> des3 |= INT_ON_COMPLETION
> des3 |= OWN
> ```
> or worst, out of order like this
> ```
> des3 |= OWN
> des3 |= INT_ON_COMPLETION
> ```

Why do you think the CPU would split up the pre-initialized local
variable write into the two-staged write?

Anyway Andrew is right about the descriptors memory nature. It's a
coherent memory to which the access is expensive and should be
minimized as much as possible.

-Serge(y)

>  }
>  
>  static int dwxgmac2_get_tx_ls(struct dma_desc *p)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> index 937b7a0466fc..9219fe69ea44 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
> @@ -289,6 +289,7 @@ static void enh_desc_set_tx_owner(struct dma_desc *p)
>  
>  static void enh_desc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
>  {
> +	dma_wmb();
>  	p->des0 |= cpu_to_le32(RDES0_OWN);
>  }
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
> index 68a7cfcb1d8f..d0b703a3346f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
> @@ -155,6 +155,7 @@ static void ndesc_set_tx_owner(struct dma_desc *p)
>  
>  static void ndesc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
>  {
> +	dma_wmb();
>  	p->des0 |= cpu_to_le32(RDES0_OWN);
>  }
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d9fca8d1227c..859a2c4c9e5c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4848,7 +4848,6 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
>  		if (!priv->use_riwt)
>  			use_rx_wd = false;
>  
> -		dma_wmb();
>  		stmmac_set_rx_owner(priv, p, use_rx_wd);
>  
>  		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_rx_size);
> @@ -5205,7 +5204,6 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
>  		if (!priv->use_riwt)
>  			use_rx_wd = false;
>  
> -		dma_wmb();
>  		stmmac_set_rx_owner(priv, rx_desc, use_rx_wd);
>  
>  		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_rx_size);
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
