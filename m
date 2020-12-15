Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592C2DB26E
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Dec 2020 18:22:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 442A1C3FAD4;
	Tue, 15 Dec 2020 17:22:45 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD0E4C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 17:22:44 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id j12so20110592ota.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 09:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TPedXdl2PY6JHGKX0f/qlnbwmUVBy3y2nBUN43lCo10=;
 b=rpo5cflUZ/eW3zO3zxxlriF47VYoDLliYDHolP5HaBKPZ8W8NpzGMaevevMB0K3HiC
 UApj53JmvKEULw0lyUN/FMs9HxlcKm1+xYtbZTN3dbzkuPHS2cjFv3zfbaWuYa/pyyZG
 d/oJ6rw3nZta6KCliddDisgJLrL0tr7VEyUU8TE84xXHT6qhCI/Ot/Otck5g4RuB2MLp
 MBi4/vw5FqyEycmDx8R4thnuK2hD4oIFwQ9TRoveZoJCtc+UPX7j9E7XmTEooHqQUOKd
 oEMXrtx1+jFEBx2ggBCUndLpL07NlASRoz6hadLnhORGRvqy1Y60PI2gfQXHdaLHktxf
 hHcw==
X-Gm-Message-State: AOAM530tseqvZFgXsuYihiXZRJBzVoTdYl2NmZOd+Eog0srZ1X3etnf8
 dzsTO5cMTnbLiRBlUYcEtw==
X-Google-Smtp-Source: ABdhPJzYe/1d+PtO64iiDzUljskow3Y88N+EV3ueO8nk0GUixOHeB/tzaf6tSb2hz8UTo5IMx0i3NA==
X-Received: by 2002:a05:6830:159a:: with SMTP id
 i26mr23203338otr.315.1608052962799; 
 Tue, 15 Dec 2020 09:22:42 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l132sm5125659oia.23.2020.12.15.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:22:42 -0800 (PST)
Received: (nullmailer pid 4059538 invoked by uid 1000);
 Tue, 15 Dec 2020 17:22:40 -0000
Date: Tue, 15 Dec 2020 11:22:40 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <20201215172240.GA4047815@robh.at.kernel.org>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214091616.13545-4-Sergey.Semin@baikalelectronics.ru>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Lars Persson <larper@axis.com>, linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH 03/25] dt-bindings: net: dwmac: Fix the
 TSO property declaration
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

On Mon, Dec 14, 2020 at 12:15:53PM +0300, Serge Semin wrote:
> Indeed the STMMAC driver doesn't take the vendor-specific compatible
> string into account to parse the "snps,tso" boolean property. It just
> makes sure the node is compatible with DW MAC 4.x, 5.x and DW xGMAC
> IP-cores. Fix the conditional statement so the TSO-property would be
> evaluated for the compatibles having the corresponding IP-core version.
> 
> While at it move the whole allOf-block from the tail of the binding file
> to the head of it, as it's normally done in the most of the DT schemas.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Note this won't break the bindings description, since the "snps,tso"
> property isn't parsed by the Allwinner SunX GMAC glue driver, but only
> by the generic platform DT-parser.

But still should be valid for Allwinner?

> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 52 +++++++++----------
>  1 file changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index e084fbbf976e..0dd543c6c08e 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -37,6 +37,30 @@ select:
>    required:
>      - compatible
>  
> +allOf:
> +  - $ref: "ethernet-controller.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - snps,dwmac-4.00
> +              - snps,dwmac-4.10a
> +              - snps,dwmac-4.20a
> +              - snps,dwmac-5.10a
> +              - snps,dwxgmac
> +              - snps,dwxgmac-2.10
> +
> +      required:
> +        - compatible
> +    then:
> +      properties:
> +        snps,tso:
> +          $ref: /schemas/types.yaml#definitions/flag
> +          description:
> +            Enables the TSO feature otherwise it will be managed by
> +            MAC HW capability register.

BTW, I prefer that properties are defined unconditionally, and then 
restricted in conditional schemas (or ones that include this schema).

> +
>  properties:
>  
>    # We need to include all the compatibles from schemas that will
> @@ -314,34 +338,6 @@ dependencies:
>    snps,reset-active-low: ["snps,reset-gpio"]
>    snps,reset-delay-us: ["snps,reset-gpio"]
>  
> -allOf:
> -  - $ref: "ethernet-controller.yaml#"
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - allwinner,sun7i-a20-gmac

This does not have a fallback, so snps,tso is no longer validated. I 
didn't check the rest.

> -              - allwinner,sun8i-a83t-emac
> -              - allwinner,sun8i-h3-emac
> -              - allwinner,sun8i-r40-emac
> -              - allwinner,sun8i-v3s-emac
> -              - allwinner,sun50i-a64-emac
> -              - snps,dwmac-4.00
> -              - snps,dwmac-4.10a
> -              - snps,dwmac-4.20a
> -              - snps,dwxgmac
> -              - snps,dwxgmac-2.10
> -              - st,spear600-gmac
> -
> -    then:
> -      properties:
> -        snps,tso:
> -          $ref: /schemas/types.yaml#definitions/flag
> -          description:
> -            Enables the TSO feature otherwise it will be managed by
> -            MAC HW capability register.
> -
>  additionalProperties: true
>  
>  examples:
> -- 
> 2.29.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
