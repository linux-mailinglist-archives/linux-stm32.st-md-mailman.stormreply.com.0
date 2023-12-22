Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FA681CB84
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 15:51:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D469C6C820;
	Fri, 22 Dec 2023 14:51:11 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DE25C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 14:51:09 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-50e6bcca684so508387e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 06:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703256668; x=1703861468;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jtUnE4xxhx15CW5JpLi7TOoE2wmO68jA2bGdTJ/24bk=;
 b=Yptd8o6Nr82vBdhAYqVEi6SFE1yDZipvl+kWy7emUSfHo3TFHb5ZsVY8Tjg4ZEbohd
 PLGu6KkutdK4oOPua73PSmA9FuZupvPyPcPOuokGw2/fs23Za4TZ9sM1qx1Tu3uRfZpj
 PhLIbaSmMGtydlj/gFwUDDDqgspg088eiHGwPRvVQzv7CwyvS9GyJk1m2dOowLof+qj8
 IrXD0nV5pHwugmblSX7+vtsu23AHIe3kteQA7ahiJ7hdlPt4kjGz50p/VDKkKxNkN6y9
 hswY9HVXgSK+paYQkR8FngAz3QgP6NkM8JnjSuzacW+5oCauzV625ihmB/tAAILXw4GU
 JHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703256668; x=1703861468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jtUnE4xxhx15CW5JpLi7TOoE2wmO68jA2bGdTJ/24bk=;
 b=kU9LsUKK5yTMZG406+sZDtJA+BMQLlaBT3AcwByDPCjq2Z7vEjFzUiGHT+gk0aQPIN
 YhTj0o/Y5pWX68FnQk7bRxuxlRKk+Rsn53eZLh4FDBPXxThhIbI5pHf76JObLVVQxmm9
 keHNtzEm+H3dpbFilh9moKVIeaV3kH2k3yVHB8GgmzJG+EJwoMoWAF8cn8etFvvbcYVk
 sXfgFX7LxGpS2tAbhjg3/oWmA+GTQH87QUmA1o2r7XyunB3iK29dvYQvl354Xf93T/60
 gJBgu809ANvzQEDYqNJx0sIFCn8NBvcZ+yBl4uPp2kziSMnxRlzJ9paXEjQy3U1LqSeu
 QXXQ==
X-Gm-Message-State: AOJu0Yzipw46oC6jKLVBun0Vh4WiuBWukLbNTkocENYyU+I+RNR/3GwC
 wQN4Br1cuy9vZuF0FrASBfY=
X-Google-Smtp-Source: AGHT+IHL1Qfai+8qWEquMbFEUPJRFgvR0ti3liSz/epY51csYe8OPA6HRw50x/Gp8NzXQAMmvk8UaQ==
X-Received: by 2002:a19:700e:0:b0:50e:5a39:bbeb with SMTP id
 h14-20020a19700e000000b0050e5a39bbebmr393705lfc.173.1703256668116; 
 Fri, 22 Dec 2023 06:51:08 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 m13-20020ac2424d000000b0050e697f2d0esm192153lfl.61.2023.12.22.06.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 06:51:07 -0800 (PST)
Date: Fri, 22 Dec 2023 17:51:04 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <tly7rej6uz7r36j3nm2yk6mhrbdxkvwyphj3oosar5xd3ucpey@hv4dro7emw3h>
References: <20231222054451.2683242-1-leong.ching.swee@intel.com>
 <20231222054451.2683242-2-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222054451.2683242-2-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/4] dt-bindings: net: snps,
 dwmac: per channel irq
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

On Fri, Dec 22, 2023 at 01:44:48PM +0800, Leong Ching Swee wrote:
> From: Swee Leong Ching <leong.ching.swee@intel.com>
> 
> Add dt-bindings for per channel irq.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
> Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 24 +++++++++++++------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 5c2769dc689a..e72dded824f4 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -103,17 +103,27 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    items:
> -      - description: Combined signal for various interrupt events
> -      - description: The interrupt to manage the remote wake-up packet detection
> -      - description: The interrupt that occurs when Rx exits the LPI state
> +    maxItems: 19
>  
>    interrupt-names:
>      minItems: 1
> +    maxItems: 19
>      items:
> -      - const: macirq
> -      - enum: [eth_wake_irq, eth_lpi]
> -      - const: eth_lpi
> +      oneOf:
> +        - description: Combined signal for various interrupt events
> +          const: macirq
> +        - description: The interrupt to manage the remote wake-up packet detection
> +          const: eth_wake_irq
> +        - description: The interrupt that occurs when Rx exits the LPI state
> +          const: eth_lpi
> +        - description: DMA Tx per-channel interrupt
> +          pattern: '^dma_tx[0-7]?$'
> +        - description: DMA Rx per-channel interrupt
> +          pattern: '^dma_rx[0-7]?$'
> +

> +    allOf:
> +      - contains:
> +          const: macirq

As Rob correctly noted it's also better to make sure that 'macirq' is
placed first in the array. So instead of the constraint above I guess
the next one would make sure both the array has 'macirq' name and it's
the first item:

allOf:
  - maxItems: 34
    items:
      - const: macirq

-Serge(y)

>  
>    clocks:
>      minItems: 1
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
