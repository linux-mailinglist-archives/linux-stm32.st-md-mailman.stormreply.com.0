Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7C4BBFB
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 16:46:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6477EC57168
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 14:46:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01A9AC57167
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:46:43 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8432C21882
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560955601;
 bh=ybVW7Ea5eMfZg+bToe1PcrWBxJTqfPTPZQ35pTPG7h4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZzUwgQGkvk0bBDa2uRT/zR74u7nL2T25/qTALzzZADu6+sV93WrM6REYlJw1kQFtE
 HkeRAKjQYkEm+W5fJMYLgui2FKCdjvgMdjJHMsqg82p41ZW47pMylujCsT+bcr/Jko
 FioKfD/f3GZuW6jMkoGxLVe+gDSTSHr9KjyZtnqY=
Received: by mail-qt1-f177.google.com with SMTP id i34so14894531qta.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 07:46:41 -0700 (PDT)
X-Gm-Message-State: APjAAAX3HhCnx9Hioi5qqva9OqfcNtJrK6z7TitGXsuYJrFolS1x27DI
 ZTnNf64qB2Ra/he7xLgf7hk+x76R8g+7Q/0RPA==
X-Google-Smtp-Source: APXvYqxsL55tBpnh7d1D58N3IolGY5fTDOQVrJmdjfIwoxLtWxuN1egPqybHkL3wTo4GaEANYh8XHiHR9+TvMpfENos=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr41487170qtf.110.1560955600704; 
 Wed, 19 Jun 2019 07:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <e7c13fc3c4e287df6292dbee27ae1caeca0c06c4.1560937626.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <e7c13fc3c4e287df6292dbee27ae1caeca0c06c4.1560937626.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 08:46:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+A+jspyCpu9USL6FQ9y5qL_yqYS=DTE=aM5YzyeZwd0w@mail.gmail.com>
Message-ID: <CAL_Jsq+A+jspyCpu9USL6FQ9y5qL_yqYS=DTE=aM5YzyeZwd0w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v3 06/16] dt-bindings: net: sun4i-emac:
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

On Wed, Jun 19, 2019 at 3:48 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch our Allwinner A10 EMAC controller binding to a YAML schema to enable
> the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v2:
>   - Switch from the deprecated phy property to phy-handle
> ---
>  Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt      | 19 -------------------
>  2 files changed, 55 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
>
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
> new file mode 100644
> index 000000000000..2ff9e605cd26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner A10 EMAC Ethernet Controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "ethernet-controller.yaml#"
> +
> +maintainers:
> +  - Chen-Yu Tsai <wens@csie.org>
> +  - Maxime Ripard <maxime.ripard@bootlin.com>
> +
> +properties:
> +  compatible:
> +    const: allwinner,sun4i-a10-emac
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  allwinner,sram:
> +    description: Phandle to the device SRAM
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - phy-handle

Doesn't this throw an error if not listed in properties?

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
