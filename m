Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C278D1D33DC
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 17:00:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68A4CC36B12;
	Thu, 14 May 2020 15:00:38 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87B03C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 15:00:33 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id k110so2586553otc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 08:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b4HeH81d7CC2pFdjz+KIc9E1a6jJhBx25lXQ9gtMpzM=;
 b=G3XbV1c1g6D+0alQpjSGXYfQ8Roq47cZxwhI1nw/rYjJ2+EzMeqmTOTWi+14LYSbFo
 6JRuFHWniU2G/ZxOmnwg5vVYVDyUvCLLu74jE7IAQsv9tuwtN6FW74q3we9EsHHbDnxz
 WYyHNuDawmfF1EgZcdcRGuPLHpR7imKTAMXFFd425HPnF5Jf7c4lmI7Q+eSLn8A5W1TL
 YFrISHJJRQgpRhAKTlJMXuTNU9TptbGu6gqbxwg3teWTeTHS9vONt0N21V6DFjFCEq2E
 DF0XQemsPCQvoINtZqT9S5OSjBIFCXPIlIvd9eNXhkbHhuhadevKl1hazTCxOLG0mE2D
 OyAQ==
X-Gm-Message-State: AOAM5325X/n3zP0HR/D7mHeOIVRqv6SC6nHqQdpSNaC/wsuaGtzHAQfo
 Z8Bpvft0YU9tEvxbZSd5mw==
X-Google-Smtp-Source: ABdhPJzW85ZeQbTbhD2yMI5gcvb3x7Kv8qJI1H0Pl22tcfxBOiO1jCVwwbhxlPlqaQj6fzuo6pKuzg==
X-Received: by 2002:a9d:7343:: with SMTP id l3mr3559142otk.276.1589468430559; 
 Thu, 14 May 2020 08:00:30 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u45sm818344ooi.41.2020.05.14.08.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 08:00:29 -0700 (PDT)
Received: (nullmailer pid 8677 invoked by uid 1000);
 Thu, 14 May 2020 15:00:28 -0000
Date: Thu, 14 May 2020 10:00:28 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200514150028.GB28489@bogus>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 06/10] dt-bindings: mtd: update STM32
 FMC2 NAND controller documentation
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

On Wed, May 06, 2020 at 11:11:15AM +0200, Christophe Kerello wrote:
> These bindings can be used on SOCs where the FMC2 NAND controller is
> in standalone. In case that the FMC2 embeds 2 controllers (an external
> bus controller and a raw NAND controller), the register base and the
> clock will be defined in the parent node. It is the reason why the
> register base address and the clock are now optional.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>  .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml   | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> index b059267..68fac1a 100644
> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
> @@ -18,13 +18,15 @@ properties:
>  
>    reg:
>      items:
> -      - description: Registers
> +      - description: Registers (optional)

The only thing that can be optional are the last entries. You have to do 
a 'oneOf' with 6 entries and 7 entries.

And where's your new compatible string for this different h/w?

>        - description: Chip select 0 data
>        - description: Chip select 0 command
>        - description: Chip select 0 address space
>        - description: Chip select 1 data
>        - description: Chip select 1 command
>        - description: Chip select 1 address space
> +    minItems: 6
> +    maxItems: 7
>  
>    interrupts:
>      maxItems: 1
> @@ -61,7 +63,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
>  
>  examples:
>    - |
> @@ -77,13 +78,13 @@ examples:
>              <0x81000000 0x1000>,
>              <0x89010000 0x1000>,
>              <0x89020000 0x1000>;
> -            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> -            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
> -                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
> -                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
> -            dma-names = "tx", "rx", "ecc";
> -            clocks = <&rcc FMC_K>;
> -            resets = <&rcc FMC_R>;
> +      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +      dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
> +             <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
> +             <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
> +      dma-names = "tx", "rx", "ecc";
> +      clocks = <&rcc FMC_K>;
> +      resets = <&rcc FMC_R>;
>        #address-cells = <1>;
>        #size-cells = <0>;
>  
> -- 
> 1.9.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
