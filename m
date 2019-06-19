Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A985C4BB1B
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 16:18:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8F7DC56638
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:18:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A75BBC56637
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:18:06 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3262A2064A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560953885;
 bh=cR/H6G5KIVj2Tl/rlffCQ7FS2/cGJNh3qbq5IZ8GGd4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IBG26sgsHejava7dMMDKid2azDT1wXKb5y0e/Tb2WqRj/64CY4K3+VD8Cg3mJp3CH
 Jr8HP0mlnWjNb2LWK2jeYt7TL/mwbaqBQOWYLqqI3cbAjcnIrcSng4TXf/yAhJwaK9
 uGkmdqEDwjxszz8qp+wv2io8n85Hhiz8nrR+bWYY=
Received: by mail-qt1-f181.google.com with SMTP id n11so20033447qtl.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 07:18:05 -0700 (PDT)
X-Gm-Message-State: APjAAAVlM4LWtynkmy/s3kk9OWLYs8pyfXK6RkkMUlOD+CFAjQoMGrXy
 wxbUvbZdNG1zPQpLfWPhXH7RbxIzuytP9xP2Hg==
X-Google-Smtp-Source: APXvYqyhdR1ApTNT0vTQ+yPM+vLDBBgTJuYVuRc+czCo8t7Z44TCthCHxu3q6kJsso6WcEaPhLDuWuqve5Eszjay4Ug=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr34384022qve.72.1560953884410; 
 Wed, 19 Jun 2019 07:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <89b834af795fa6ad5ba1f04a5a61c54204bf4f96.1560937626.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <89b834af795fa6ad5ba1f04a5a61c54204bf4f96.1560937626.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 08:17:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKeGrXEECmP8Gec5DdLTikyx0xS+kaopRXNQ7RUEJbx4g@mail.gmail.com>
Message-ID: <CAL_JsqKeGrXEECmP8Gec5DdLTikyx0xS+kaopRXNQ7RUEJbx4g@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 03/16] dt-bindings: net: Add a YAML
 schemas for the generic MDIO options
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

On Wed, Jun 19, 2019 at 3:47 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The MDIO buses have a number of available device tree properties that can
> be used in their device tree node. Add a YAML schemas for those.
>
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - New patch
> ---
>  Documentation/devicetree/bindings/net/mdio.txt  | 38 +-------------
>  Documentation/devicetree/bindings/net/mdio.yaml | 51 ++++++++++++++++++-
>  2 files changed, 52 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/mdio.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/mdio.txt b/Documentation/devicetree/bindings/net/mdio.txt
> index e3e1603f256c..cf8a0105488e 100644
> --- a/Documentation/devicetree/bindings/net/mdio.txt
> +++ b/Documentation/devicetree/bindings/net/mdio.txt
> @@ -1,37 +1 @@
> -Common MDIO bus properties.
> -
> -These are generic properties that can apply to any MDIO bus.
> -
> -Optional properties:
> -- reset-gpios: One GPIO that control the RESET lines of all PHYs on that MDIO
> -  bus.
> -- reset-delay-us: RESET pulse width in microseconds.
> -
> -A list of child nodes, one per device on the bus is expected. These
> -should follow the generic phy.txt, or a device specific binding document.
> -
> -The 'reset-delay-us' indicates the RESET signal pulse width in microseconds and
> -applies to all PHY devices. It must therefore be appropriately determined based
> -on all PHY requirements (maximum value of all per-PHY RESET pulse widths).
> -
> -Example :
> -This example shows these optional properties, plus other properties
> -required for the TI Davinci MDIO driver.
> -
> -       davinci_mdio: ethernet@5c030000 {
> -               compatible = "ti,davinci_mdio";
> -               reg = <0x5c030000 0x1000>;
> -               #address-cells = <1>;
> -               #size-cells = <0>;
> -
> -               reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
> -               reset-delay-us = <2>;
> -
> -               ethphy0: ethernet-phy@1 {
> -                       reg = <1>;
> -               };
> -
> -               ethphy1: ethernet-phy@3 {
> -                       reg = <3>;
> -               };
> -       };
> +This file has moved to mdio.yaml.
> diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> new file mode 100644
> index 000000000000..8f4f9d0a2882
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/mdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MDIO Bus Generic Binding
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Florian Fainelli <f.fainelli@gmail.com>
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +description:
> +  These are generic properties that can apply to any MDIO bus. Any
> +  MDIO bus must have a list of child nodes, one per device on the
> +  bus. These should follow the generic ethernet-phy.yaml document, or
> +  a device specific binding document.
> +
> +properties:
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      The phandle and specifier for the GPIO that controls the RESET
> +      lines of all PHYs on that MDIO bus.
> +
> +  reset-delay-us:
> +    description:
> +      RESET pulse width in microseconds. It applies to all PHY devices
> +      and must therefore be appropriately determined based on all PHY
> +      requirements (maximum value of all per-PHY RESET pulse widths).
> +
> +examples:
> +  - |
> +    davinci_mdio: ethernet@5c030000 {

Shouldn't this be mdio@... ?

> +        compatible = "ti,davinci_mdio";
> +        reg = <0x5c030000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        reset-gpios = <&gpio2 5 1>;
> +        reset-delay-us = <2>;
> +
> +        ethphy0: ethernet-phy@1 {

Would be good to have some unit-address checks. Could be a follow-up though.

> +            reg = <1>;
> +        };
> +
> +        ethphy1: ethernet-phy@3 {
> +            reg = <3>;
> +        };
> +    };
> --
> git-series 0.9.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
