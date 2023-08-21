Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 857517833A7
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Aug 2023 22:33:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A271C6B44B;
	Mon, 21 Aug 2023 20:33:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BC5CC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Aug 2023 20:33:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BFA0647CD;
 Mon, 21 Aug 2023 20:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2339C433C7;
 Mon, 21 Aug 2023 20:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692650011;
 bh=5vlYrHkhc7cFmjCTrb/meqorIzW1oUWzABr2g9dGJ2I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jCpkAnjeAAqTR93vSTyj3v30/3TC6Ft0XUih2pb9KE9QgRHMG6ZHIO1TGu178JiqN
 KvSHLj7h2+xI1pmeEMV+k1i8kNrrcwRIswS4QKQ+moy23SqowM/KxhTxJZfMuwbivD
 Oa0y/Jwesoi1lwav8V7D6H2mc7FK2cbjHmnrEt2X37K7nD/JjbaoofMBSiIFtpYQHF
 9jcwxcfTxuY/QDMQhZdMK4cG4ZTNN9HKqBZW6oWMD4XMCanrlaF2xjRvsK2yDAP6xC
 WQc7aeTnGi7jLbLIkjTzwEmcZeCi8sbA3GEm4+gjb+kDsKDWzhaJepNYbQ4cS1yDkV
 0TGi0DXNqTXzA==
Received: (nullmailer pid 2247465 invoked by uid 1000);
 Mon, 21 Aug 2023 20:33:28 -0000
Date: Mon, 21 Aug 2023 15:33:28 -0500
From: Rob Herring <robh@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <20230821203328.GA2197059-robh@kernel.org>
References: <20230817165749.672-1-jszhang@kernel.org>
 <20230817165749.672-7-jszhang@kernel.org>
 <wkzy3v272ia237pfhlvtrwbij7qeswb2zmkxhnsir5xtroezr7@frow2mvqeq35>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wkzy3v272ia237pfhlvtrwbij7qeswb2zmkxhnsir5xtroezr7@frow2mvqeq35>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
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

On Fri, Aug 18, 2023 at 08:39:56PM +0300, Serge Semin wrote:
> On Fri, Aug 18, 2023 at 12:57:46AM +0800, Jisheng Zhang wrote:
> > The snps dwmac IP support safety features, and those Safety Feature
> > Correctible Error and Uncorrectible Error irqs may be separate irqs.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml         | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index ddf9522a5dc2..ee9174f77d97 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -103,17 +103,26 @@ properties:
> >  
> >    interrupts:
> >      minItems: 1
> > +    maxItems: 5
> > +    additionalItems: true
> >      items:
> >        - description: Combined signal for various interrupt events
> >        - description: The interrupt to manage the remote wake-up packet detection
> >        - description: The interrupt that occurs when Rx exits the LPI state
> > +      - description: The interrupt that occurs when Safety Feature Correctible Errors happen
> > +      - description: The interrupt that occurs when Safety Feature Uncorrectible Errors happen
> >  
> >    interrupt-names:
> >      minItems: 1
> > +    maxItems: 5
> > +    additionalItems: true
> >      items:
> >        - const: macirq
> > -      - enum: [eth_wake_irq, eth_lpi]
> > -      - const: eth_lpi
> > +      - enum:
> > +          - eth_wake_irq
> > +          - eth_lpi
> > +          - sfty_ce
> > +          - sfty_ue
> 
> IIUC this would mean the next constraints:
> Item    0: must be macirq,
> Item    1: any of eth_wake_irq, eth_lpi, sfty_ce, sfty_ue
> Items 2:4: any bla-bla-bla.

Indeed.

> 
> After adding the per-DMA-channel IRQs in the next patches the array
> will be extended to up to 37 any names. It doesn't look correct. What
> about converting it to the position independent arrays constraint:
> 
>   interrupts:
>     minItems: 1
>     maxItems: 34
> 
>     
>   interrupt-names:
>     minItems: 1
>     maxItems: 34
>     items:
>       oneOf:
>         - description: Combined signal for various interrupt events
>           const: macirq
>         - description: The interrupt to manage the remote wake-up packet detection
>           const: eth_wake_irq
>         - description: The interrupt that occurs when Rx exits the LPI state
>           const: eth_lpi
>         - description: Safety Feature Correctible Errors interrupt
>           const: sfty_ce
>         - description: Safety Feature Uncorrectible Errors interrupt
>           const: sfty_ue
>         - description: DMA Tx per-channel interrupt
>           pattern: '^dma_tx([0-9]|1[0-5])?$'
>         - description: DMA Rx per-channel interrupt
>           pattern: '^dma_rx([0-9]|1[0-1])?$'
> 
>     allOf:
>       - contains:
>           const: macirq

This would keep macirq being first:

allOf:
  - maxItems: 34
    items:
      - const: macirq

In newer json-schema the schema and list versions were split into 
"prefixItems" and "items", so we could avoid the "allOf" with that. 
Unfortunately, the former is the list version which we use everywhere. I 
don't really want to do a treewide change of that and also I find the 
'prefixItems' name kind of awkward.


> Hope neither Krzysztof nor Rob will be against such modification
> especially seeing it's the only way to resolve the very much possible
> case of a device having macirq and per-DMA-channel IRQs but lacking
> the LPI, PMT or Safety IRQs.

Don't love it, but I give up on these licensed IPs. :(

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
