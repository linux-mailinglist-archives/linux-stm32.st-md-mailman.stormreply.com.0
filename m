Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A77388265E2
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 21:10:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55D5FC6B476;
	Sun,  7 Jan 2024 20:10:42 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03DA0C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 20:10:40 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so976845e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 Jan 2024 12:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704658240; x=1705263040;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qaJWomBUGOWZwKBbr+CxKGUdDqR+QRKmIC9Sup/5TvM=;
 b=nbRWqdlRb5F9UF2+k4cq8as3gWB1mUCN6JZj6qjql7cKyvnjV2JEgoBrTqNsxpG1PO
 +OXJeqVCZ/zNIreaO9lrnCAxCIFUnvG3mTAVa99jkdWUrOJB6TkKsxGuWJRILh019LvI
 XLLCK1PqI85scguaRrtcoqZ0Bg9xcKRUzB1bWFGoXH3IZWCESilPLQPZRR7GLpcZDRR1
 yKAsLB3B2Mhyx97lqU3EIUY8P60l1NOpZ4GSroEkZRIBrsc1iPl3ZDY8y91J8qTUCtwM
 rZw5T3u5J0WOhNWEknilkAC9VOTB4pXJVWaksa5aXAT+9kH9LFTQ/ieF4aVThbnhtDa8
 +pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704658240; x=1705263040;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qaJWomBUGOWZwKBbr+CxKGUdDqR+QRKmIC9Sup/5TvM=;
 b=q2DZwQx0CpzScx2PQRQ5k7mk6enl24mzzTB4SNOCAR4LBd6H+w9hmBWjYXfIdZUw1H
 63N55fRgoHKOA6BdObjFBMfVEwLesrjHqyMgfRtOp9O6pqXHAs1fgi5zss1QLw7nv1Aq
 Y79VTvTFGE3IlZtBq08REj6LhGxNbBqCuZzKeRTKSIhLDjqZlG7tvEt8TYz4dz/KElWR
 0E+SRpfKwwHtgrQkK4v5uP+BFh3Uc/TYji0lQK8mK3QBXn7WBN4EZlcbeAaiWFwAI8wM
 RdhekbOf2J/3quPf6HYRyyqCj7MZJ+TEgVLDtmRpO3Obbvu9PEsb3X9tTDCNiQIeMi7B
 5o8Q==
X-Gm-Message-State: AOJu0Ywa8aH6EJzFo2RfPNJ6B1b4/gvUTaldrPuYN0htuGddPOvkBV4F
 meVxjW+k4/N4AaFU7HGo+Gw=
X-Google-Smtp-Source: AGHT+IHEMxvk5VzwBbMSWTolLmXZcJe6Lp63iVd4NJJuLqphj6cRpR5nB+giIsXfwHs1cD7VFOpheQ==
X-Received: by 2002:ac2:4dac:0:b0:50e:305c:25fb with SMTP id
 h12-20020ac24dac000000b0050e305c25fbmr406141lfe.216.1704658240025; 
 Sun, 07 Jan 2024 12:10:40 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 w3-20020ac254a3000000b0050e7e8644c3sm914216lfk.289.2024.01.07.12.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jan 2024 12:10:39 -0800 (PST)
Date: Sun, 7 Jan 2024 23:10:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Message-ID: <ffiewfybqvh66nmri4im4veupwytvlxk5jfgdy3nbj6wldxjl2@2vwvnnu37pt7>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
 <20240105070925.2948871-2-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105070925.2948871-2-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/4] dt-bindings: net: snps,
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

On Fri, Jan 05, 2024 at 03:09:22PM +0800, Leong Ching Swee wrote:
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

In order to restore the v1 discussion around this change, here is my
comment copied from there:

> As Rob correctly noted it's also better to make sure that 'macirq' is placed first
> in the array. So instead of the constraint above I guess the next one would
> make sure both the array has 'macirq' name and it's the first item:
>
> allOf:
>   - maxItems: 34
>     items:
>       - const: macirq

Leong said it didn't work:
https://lore.kernel.org/netdev/CH0PR11MB54904615B45E521DE6B1A7B3CF61A@CH0PR11MB5490.namprd11.prod.outlook.com/

Rob, Krzysztof, Conor could you please clarify whether this change is ok the
way it is or it would be better to preserve the stricter constraint
and fix the DT-schema validation tool somehow?

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
