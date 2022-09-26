Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4005EB482
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 00:26:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 667BBC63324;
	Mon, 26 Sep 2022 22:26:08 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB885C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:26:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54664B812A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1FCC433C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 22:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664231165;
 bh=klJE1A72ytoccdNalFwjQEyU1raaYluEvz2uA7jDiyM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C9lUllbZe8EAJXslV4d6LGmvGXUwjcpCgroXy36rnk35P2zr7ptn5d9r8K1aiZJDo
 alrDrNDq/RXqV0lwGFLWGKOzlWCbA1yAgUPORQvikXjkt6tEszpbvybgaI5gTQhL69
 379pRSMSZeh4UUU1GWCH2PDZhSFXEzkm0UDC4YcW53TIWpoBdE1/nki4xyhU9NrPQU
 x31RFEDu0UkRnxURnVCHjgNzn9FwXy1XHyr2HA0EWchc8xDbB3wand7ZBxf2Dvly6A
 aADW53CMuGzEvc4Mqcrl/eR0NG9qyKIHGiwNEJxqjN2+LDfC9Xd03wXuThJ0ObUV29
 v0YjHugM41QcQ==
Received: by mail-vs1-f47.google.com with SMTP id j17so8025068vsp.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 15:26:05 -0700 (PDT)
X-Gm-Message-State: ACrzQf2bkIdEj6+v6RwcSKpj3yvACqY3q8dvsxUiZ2RKkRJU6QSnkRoU
 p5EaD0i1LASylJz/z1hWtNQsx9PmZehjCCIY4Q==
X-Google-Smtp-Source: AMsMyM4xZtUZ0hzLy/baDwwOnesblmfVIVWpsOnvhMWrHZULUdTtlo+RTvyp/RlqGZorNjNtQ1vcVb5ZpjpH/Jy/ojo=
X-Received: by 2002:a67:c18a:0:b0:398:4c72:cafb with SMTP id
 h10-20020a67c18a000000b003984c72cafbmr8945997vsj.53.1664231163988; Mon, 26
 Sep 2022 15:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220926221635.526676-1-marex@denx.de>
In-Reply-To: <20220926221635.526676-1-marex@denx.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 26 Sep 2022 17:25:52 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLpezumZF_kdD45yYjMBoLY0BfMTx9AtQj033oTNYxUug@mail.gmail.com>
Message-ID: <CAL_JsqLpezumZF_kdD45yYjMBoLY0BfMTx9AtQj033oTNYxUug@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: memory-controller: st,
	stm32: Split off MC properties
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

On Mon, Sep 26, 2022 at 5:16 PM Marek Vasut <marex@denx.de> wrote:
>
> Split st,stm32-fmc2-ebi.yaml specific properties into st,stm32-fmc2-ebi-props.yaml ,
> split memory-controller bus peripheral properties into mc-peripheral-props.yaml ,
> reference the st,stm32-fmc2-ebi-props.yaml in mc-peripheral-props.yaml and
> reference the mc-peripheral-props.yaml in micrel,ks8851.yaml .
>
> This way, the FMC2 controller properties in Micrel KSZ8851MLL ethernet
> controller node can be properly validated.
>
> Fixes the following warning:
>
> "
> arch/arm/boot/dts/stm32mp153c-dhcor-drc-compact.dtb: ethernet@1,0: Unevaluated properties are not allowed ('bank-width', 'st,fmc2-ebi-cs-mux-enable', 'st,fmc2-ebi-cs-transaction-type', 'st,fmc2-ebi-cs-buswidth', 'st,fmc2-ebi-cs-address-setup-ns', 'st,fmc2-ebi-cs-address-hold-ns', 'st,fmc2-ebi-cs-bus-turnaround-ns', 'st,fmc2-ebi-cs-data-setup-ns', 'st,fmc2-ebi-cs-data-hold-ns', 'st,fmc2-ebi-cs-write-address-setup-ns', 'st,fmc2-ebi-cs-write-address-hold-ns', 'st,fmc2-ebi-cs-write-bus-turnaround-ns', 'st,fmc2-ebi-cs-write-data-setup-ns', 'st,fmc2-ebi-cs-write-data-hold-ns' were unexpected)
> "
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../mc-peripheral-props.yaml                  |  36 +++++
>  .../st,stm32-fmc2-ebi-props.yaml              | 144 ++++++++++++++++++
>  .../memory-controllers/st,stm32-fmc2-ebi.yaml | 137 -----------------
>  .../bindings/net/micrel,ks8851.yaml           |   1 +
>  4 files changed, 181 insertions(+), 137 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/st,stm32-fmc2-ebi-props.yaml
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
> new file mode 100644
> index 0000000000000..442744a9b711d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/mc-peripheral-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Peripheral-specific properties for a Memory Controller bus.
> +
> +description:
> +  Many MC controllers need to add properties to peripheral devices.

Memory Controller controllers?

> +  They could be common properties like reg or they could be controller
> +  specific like delay in clock or data lines, etc. These properties need
> +  to be defined in the peripheral node because they are per-peripheral
> +  and there can be multiple peripherals attached to a controller. All
> +  those properties are listed here. The controller specific properties
> +  should go in their own separate schema that should be referenced
> +  from here.
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +properties:
> +  reg:
> +    description: Bank number, base address and size of the device.
> +
> +  bank-width:
> +    description: Bank width of the device, in bytes.

This needs a type and constraints (enum: [ 1, 2, 4 ]).

Other than that,

Reviewed-by: Rob Herring <robh@kernel.org>

(I'm assuming Krzysztof takes this)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
