Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1713BCC5
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 21:22:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBBE9C6DD7D
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 19:22:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 129B7C6DD7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:22:14 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7154C20862
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 19:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560194532;
 bh=RPlu/FbNde1/05Jkd4DjfnOS1p2Ifq3mg3vcN1zbvYg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qKo12MNcZKN64gvTfBORHDqRSm2bzQXWKdb5jUQTOKAQm1mzJK2zPG4c7cRpWuSMc
 7pMnZ3sAM8LC39cK1b+8CVYKeFZ50QQUNLZQ0+b+5riVCjoKf4xRG3Oy3j8rv/aK7M
 U3TWRE5uuXTFRg56mdbDXOfagfXTfMrtsUbSf3Jw=
Received: by mail-qt1-f178.google.com with SMTP id x47so11708371qtk.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 12:22:12 -0700 (PDT)
X-Gm-Message-State: APjAAAX/PSfY6N79zJ3OlpdoWBZatSrt4vBI87gqxn45UlxSCm8Qdz6w
 9wGEqqAMdwxiHmWWCoIqjMriqN4eNOZC32O3WA==
X-Google-Smtp-Source: APXvYqzaWg5gHRbYcZZU5WCMaC0Wy9RpGjgJGqJlUQXdbCejYqZKeuKwQpEct2tnWtVmzr3oE+BmMlLsBw7Z0y/5WHA=
X-Received: by 2002:aed:3fb0:: with SMTP id s45mr7705653qth.136.1560194531666; 
 Mon, 10 Jun 2019 12:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <f3f393db88b26d84a048cb71887a571611b984a2.1560158667.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <f3f393db88b26d84a048cb71887a571611b984a2.1560158667.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 13:22:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL8ARs3jQECS+E-BtZGouLYJhofM+oPpS1a3SxPORwMZA@mail.gmail.com>
Message-ID: <CAL_JsqL8ARs3jQECS+E-BtZGouLYJhofM+oPpS1a3SxPORwMZA@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 09/11] dt-bindings: net: sun8i-emac:
 Convert the binding to a schemas
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

On Mon, Jun 10, 2019 at 3:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch our Allwinner H3 EMAC controller binding to a YAML schema to enable
> the DT validation. Since that controller is based on a Synopsys IP, let's
> add the validation to that schemas with a bunch of conditionals.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Add specific binding document
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 353 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/net/dwmac-sun8i.txt                | 201 +-----------------------------------------
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml                |  15 +++-
>  3 files changed, 368 insertions(+), 201 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/dwmac-sun8i.txt
>
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> new file mode 100644
> index 000000000000..814cfb862e4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -0,0 +1,353 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-gmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A83t EMAC Device Tree Bindings
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: allwinner,sun8i-a83t-emac
> +      - const: allwinner,sun8i-h3-emac
> +      - const: allwinner,sun8i-r40-emac
> +      - const: allwinner,sun8i-v3s-emac
> +      - const: allwinner,sun50i-a64-emac
> +      - items:
> +        - const: allwinner,sun50i-h6-emac
> +        - const: allwinner,sun50i-a64-emac
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +    const: macirq
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: stmmaceth
> +
> +  syscon:
> +    $ref: /schemas/types.yaml#definitions/phandle
> +    description:
> +      Phandle to the device containing the EMAC or GMAC clock
> +      register
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phy-mode
> +  - phy-handle
> +  - syscon
> +
> +allOf:
> +  - $ref: "snps,dwmac.yaml#"
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun8i-a83t-emac
> +              - allwinner,sun8i-h3-emac
> +              - allwinner,sun8i-v3s-emac
> +              - allwinner,sun50i-a64-emac
> +
> +    then:
> +      properties:
> +        allwinner,tx-delay-ps:
> +          allOf:
> +            - $ref: /schemas/types.yaml#definitions/uint32

Can drop this as anything with unit prefix has its type defined already.

> +            - enum: [0, 100, 200, 300, 400, 500, 600, 700]
> +              default: 0
> +          description:
> +            External RGMII PHY TX clock delay chain value in ps.
> +
> +        allwinner,rx-delay-ps:
> +          allOf:
> +            - $ref: /schemas/types.yaml#definitions/uint32
> +            - enum:
> +                - 0
> +                - 100
> +                - 200
> +                - 300
> +                - 400
> +                - 500
> +                - 600
> +                - 700
> +                - 800
> +                - 900
> +                - 1000
> +                - 1100
> +                - 1200
> +                - 1300
> +                - 1400
> +                - 1500
> +                - 1600
> +                - 1700
> +                - 1800
> +                - 1900
> +                - 2000
> +                - 2100
> +                - 2200
> +                - 2300
> +                - 2400
> +                - 2500
> +                - 2600
> +                - 2700
> +                - 2800
> +                - 2900
> +                - 3000
> +                - 3100

I think you can do

enum: [1, 2, 3,
  4,  5, 6]

Or you can do:

minimum: 0
maximum: 3100
multipleOf: 100

IIRC that multipleOf is a json-schema key.

> +              default: 0
> +          description:
> +            External RGMII PHY TX clock delay chain value in ps.
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun8i-r40-emac
> +
> +    then:
> +      properties:
> +        allwinner,rx-delay-ps:
> +          allOf:
> +            - $ref: /schemas/types.yaml#definitions/uint32
> +            - enum: [0, 100, 200, 300, 400, 500, 600, 700]
> +              default: 0
> +          description:
> +            External RGMII PHY TX clock delay chain value in ps.
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun8i-h3-emac
> +              - allwinner,sun8i-v3s-emac
> +
> +    then:
> +      properties:
> +        allwinner,leds-active-low:
> +          $ref: /schemas/types.yaml#definitions/flag
> +          description:
> +            EPHY LEDs are active low.
> +
> +        mdio-mux:
> +          type: object
> +
> +          properties:
> +            compatible:
> +              const: allwinner,sun8i-h3-mdio-mux
> +
> +            mdio-parent-bus:
> +              $ref: /schemas/types.yaml#definitions/phandle
> +              description:
> +                Phandle to EMAC MDIO.
> +
> +            mdio@1:
> +              type: object
> +              description: Internal MDIO Bus
> +
> +              properties:
> +                "#address-cells":
> +                  const: 1
> +
> +                "#size-cells":
> +                  const: 0
> +
> +                compatible:
> +                  const: allwinner,sun8i-h3-mdio-internal
> +
> +                reg:
> +                  const: 1
> +
> +              patternProperties:
> +                "^ethernet-phy@[0-9a-f]$":
> +                  type: object
> +                  description:
> +                    Integrated PHY node
> +
> +                  properties:
> +                    clocks:
> +                      maxItems: 1
> +
> +                    resets:
> +                      maxItems: 1
> +
> +                  required:
> +                    - clocks
> +                    - resets
> +
> +
> +            mdio@2:
> +              type: object
> +              description: External MDIO Bus (H3 only)
> +
> +              properties:
> +                "#address-cells":
> +                  const: 1
> +
> +                "#size-cells":
> +                  const: 0
> +
> +                reg:
> +                  const: 2
> +
> +          required:
> +            - compatible
> +            - mdio-parent-bus
> +            - mdio@1
> +
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
