Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F376F0937
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 18:10:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 369B9C6A5E6;
	Thu, 27 Apr 2023 16:10:53 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A918BC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 16:10:51 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-18f16bb1a9bso5267491fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 09:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682611850; x=1685203850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zb4UIqURY+BWTS3e9vX+YTZaBHbEmn0Eg9W3zLRlAs=;
 b=R+2hFlRuqCYpRdHbnrAdaFXK5oIvZQjbcY+aFydbJjKrsuJE7AJHZx9A4KXJ8vGa5t
 u0VvCA3d82pfT35bh/TcuXmS0PDsMajch1tSdLUG4MvDigXF1Aa/7E0956jdNWmvL40X
 9X7ku5hF++AxX0QZ4/1p7XXkbgJWCjKXyTv+nw3fKPZjHqmK0MzJF5hkQheaBHtO0fE0
 ZIFbIH0HaF12yiDhbAt+DrkPgy7ERCxnXOr++7e0+xrfSlFC5QIHXRfIu8piebQwtJvN
 0DKi7DpfKQy4rQhLlbjjUadw5VdTA7D1Ob1ZXhOfnlagSIWNilxBVaPXaMq69fhT/mSa
 6qyA==
X-Gm-Message-State: AC+VfDz9Q1QuUi4eq40YmfUUNNNQmcEvmF+RNeGhwYd4YPooKvNA4+T/
 PUrWx7gtZ4OguMumvzwHXgA7yKmA3w==
X-Google-Smtp-Source: ACHHUZ69Sq4w3EraVz3yG/3YjM+ceN2r9AONaP5KgtunTytLs//j63DXjClPMLRDUmHDfuI/a8cy3w==
X-Received: by 2002:a05:6830:201a:b0:6a7:bced:411e with SMTP id
 e26-20020a056830201a00b006a7bced411emr1138804otp.3.1682611850271; 
 Thu, 27 Apr 2023 09:10:50 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i15-20020a9d624f000000b0069fb8bfb4f3sm8056756otk.77.2023.04.27.09.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 09:10:49 -0700 (PDT)
Received: (nullmailer pid 3112114 invoked by uid 1000);
 Thu, 27 Apr 2023 16:10:49 -0000
Date: Thu, 27 Apr 2023 11:10:49 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20230427161049.GA3107476-robh@kernel.org>
References: <20230426-stmpe-dt-bindings-v2-0-2f85a1fffcda@linaro.org>
 <20230426-stmpe-dt-bindings-v2-1-2f85a1fffcda@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426-stmpe-dt-bindings-v2-1-2f85a1fffcda@linaro.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: gpio: Add STMPE YAML
	DT schema
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

On Wed, Apr 26, 2023 at 01:21:38PM +0200, Linus Walleij wrote:
> This adds a schema for the STMPE GPIO that while it is used a
> lot in the kernel tree is anyway missing its bindings.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - New patch split off from the MFD patch.
> ---
>  .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> new file mode 100644
> index 000000000000..6e991ebbdf77
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/st,stmpe-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectonics Port Expander (STMPE) GPIO Block
> +
> +description: STMicroelectronics Port Expander (STMPE) is a series of slow
> +  bus controllers for various expanded peripherals such as GPIO, keypad,
> +  touchscreen, ADC, PWM or rotator. It can contain one or several different
> +  peripherals connected to SPI or I2C. These bindings pertain to the
> +  GPIO portions of these expanders.
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: st,stmpe-gpio
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  interrupt-controller: true
> +
> +  st,norequest-mask:
> +    description: A bitmask of GPIO lines that cannot be requested because for
> +      for example not being connected to anything on the system
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +patternProperties:
> +  "^.+-hog(-[0-9]+)?$":
> +    type: object
> +
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios

All you need for hog nodes is:

"^.+-hog(-[0-9]+)?$":
  type: object
  required:
    - gpio-hog

The presence of 'gpio-hog' causes the hog schema to be applied.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
