Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6598C781227
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 19:40:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D5F1C6B461;
	Fri, 18 Aug 2023 17:40:02 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D52C7C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 17:40:00 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2b9db1de50cso17661141fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692380400; x=1692985200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SBqiuE1W/JJkU+Tq/bgiu3Be54o3xfgf8EPQHSsbYvE=;
 b=BE6OaS94KC3ES1uLbXhuynhUsT43JlDerMghFFjqIBLZRKj3V6ayVWQjeDeSF0fpIM
 m1eWPzhApnMgn2BM6oKkZASsKq1b5exbcw4gYIBhdWwkF8rKGj8MEfH5soKjOGHwvkBH
 mAfzprqByd9zneoNWzFx/Ilo9cqeQqsSnY4MRvX0Vu2cU7Xx0oY05D7X2WveFD/gsJlR
 lEa4a7PRqZP2059Wln0pRUKBOXPlsyu0IBwJ1zJGV2sIs7DDdPCTtl6wlpdeVRM8IyYu
 6IfzJRkMFBJCXIhh68jJB25BDm0d2oLGBtuGWLVWq9h+yrKU8goCbjPLkk7OVurTkGYA
 BqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692380400; x=1692985200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBqiuE1W/JJkU+Tq/bgiu3Be54o3xfgf8EPQHSsbYvE=;
 b=T2uetrODvYMMiOwJlZvgK+G9EekKQSwfMNPovvTynHgglbXzq7R2LjvT4oYW0OgElp
 yKCF58NWTNZeNh9Lo9CfC4tLVfP1jzG5fBxpgRBBEqrfo64rOnUUj1czTguv4rCQUfD4
 JkuU3giAZshdhAT4H4OkuOB7dBKi57wve5GO+HJEOR7MDEi1ANzt32g9+ec3t40mT5XF
 zz5XOzROz50XjP+G4Azmgee50Ih91BApFxy28sqy1GVf3dIsZW0qqbAISUQPvs8HqqE4
 UsrSdPCAfdOakUpBSIb/hS5ZIbMLeH3eCWy0UbNbw/4ADiWaKZx9pCFHxXcYu5cl34/l
 Iw2Q==
X-Gm-Message-State: AOJu0YwhtSvnBcqnsheOlQdwf1SD58lT/iW9rvSZ5rmQ345O/KrxhOQR
 5p0LgHM4YzeR5rKkbhVoXqk=
X-Google-Smtp-Source: AGHT+IGK+CdeoXcBxxlJm2PEhmKHd4mivKEyLJ33UNYeWnW7bCiXLwfuHFYfdl82c1rbMIs3ytviaw==
X-Received: by 2002:a2e:9c55:0:b0:2b9:eb9d:cc53 with SMTP id
 t21-20020a2e9c55000000b002b9eb9dcc53mr2439249ljj.42.1692380399736; 
 Fri, 18 Aug 2023 10:39:59 -0700 (PDT)
Received: from mobilestation ([93.157.254.210])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a2e9256000000b002b9f4f3e16dsm546065ljg.85.2023.08.18.10.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 10:39:59 -0700 (PDT)
Date: Fri, 18 Aug 2023 20:39:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <wkzy3v272ia237pfhlvtrwbij7qeswb2zmkxhnsir5xtroezr7@frow2mvqeq35>
References: <20230817165749.672-1-jszhang@kernel.org>
 <20230817165749.672-7-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817165749.672-7-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 6/9] dt-bindings: net: snps,
 dwmac: add safety irq support
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

On Fri, Aug 18, 2023 at 12:57:46AM +0800, Jisheng Zhang wrote:
> The snps dwmac IP support safety features, and those Safety Feature
> Correctible Error and Uncorrectible Error irqs may be separate irqs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml         | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index ddf9522a5dc2..ee9174f77d97 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -103,17 +103,26 @@ properties:
>  
>    interrupts:
>      minItems: 1
> +    maxItems: 5
> +    additionalItems: true
>      items:
>        - description: Combined signal for various interrupt events
>        - description: The interrupt to manage the remote wake-up packet detection
>        - description: The interrupt that occurs when Rx exits the LPI state
> +      - description: The interrupt that occurs when Safety Feature Correctible Errors happen
> +      - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
>  
>    interrupt-names:
>      minItems: 1
> +    maxItems: 5
> +    additionalItems: true
>      items:
>        - const: macirq
> -      - enum: [eth_wake_irq, eth_lpi]
> -      - const: eth_lpi
> +      - enum:
> +          - eth_wake_irq
> +          - eth_lpi
> +          - sfty_ce
> +          - sfty_ue

IIUC this would mean the next constraints:
Item    0: must be macirq,
Item    1: any of eth_wake_irq, eth_lpi, sfty_ce, sfty_ue
Items 2:4: any bla-bla-bla.

After adding the per-DMA-channel IRQs in the next patches the array
will be extended to up to 37 any names. It doesn't look correct. What
about converting it to the position independent arrays constraint:

  interrupts:
    minItems: 1
    maxItems: 34

    
  interrupt-names:
    minItems: 1
    maxItems: 34
    items:
      oneOf:
        - description: Combined signal for various interrupt events
          const: macirq
        - description: The interrupt to manage the remote wake-up packet detection
          const: eth_wake_irq
        - description: The interrupt that occurs when Rx exits the LPI state
          const: eth_lpi
        - description: Safety Feature Correctible Errors interrupt
          const: sfty_ce
        - description: Safety Feature Uncorrectible Errors interrupt
          const: sfty_ue
        - description: DMA Tx per-channel interrupt
          pattern: '^dma_tx([0-9]|1[0-5])?$'
        - description: DMA Rx per-channel interrupt
          pattern: '^dma_rx([0-9]|1[0-1])?$'

    allOf:
      - contains:
          const: macirq

Hope neither Krzysztof nor Rob will be against such modification
especially seeing it's the only way to resolve the very much possible
case of a device having macirq and per-DMA-channel IRQs but lacking
the LPI, PMT or Safety IRQs.

Note 1. I've changed the name of the Tx/Rx IRQs to having the "dma_"
suffix to signify that these are actually DMA-channel IRQs. The MTL
queue interrupts drive the sbd_intr_o signal which is tracked by the
"macirq" line.

Note 2. I've reduced the number of DMA Rx IRQs to being up to 12 in
accordance with available to me DW XGMAC HW manual.

-Serge(y)

>  
>    clocks:
>      minItems: 1
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
