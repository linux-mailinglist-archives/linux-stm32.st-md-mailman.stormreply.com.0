Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9EB946B
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Sep 2019 17:51:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0857C35E01;
	Fri, 20 Sep 2019 15:51:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 366A0C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 15:51:04 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CA1D2086A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568994662;
 bh=Gk8b96/zmrgvgnCdppmwZEWWClB9i1dZv17q7MLhgfc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OZM0VO15KguCMz8L73yAu9wwfmIvWTtRKsRWtXbjJFKVXMMLe2p8bfBQAQkCKcL2U
 ZC9RtUZrL5eJL0Hk2B8lfXus6Mb7THpBP0h7NAF9u+kkBEJeVMK5UCXfPgFFwcMQVI
 OoR623SUjj3mRa2R4ehGSSj+mTawpcia4HoOgbSk=
Received: by mail-qt1-f181.google.com with SMTP id x5so9184945qtr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2019 08:51:02 -0700 (PDT)
X-Gm-Message-State: APjAAAV96n/9hQTTuAbC5YzZAChpQ1sMJcQgQvw5k7yNLF7ou3/Ogd0/
 nGWHoESBR2B1LOnU4NLgFzC6o0yfRTcgCQTuJw==
X-Google-Smtp-Source: APXvYqwMIrqIhbU+PH2zwmKFyZZ7p9gmNZDVfDvJtsMY/FngbKyrGtmiBbkzWBc5h/SVux0vE5Rh9MaGgWH9K6YJIV0=
X-Received: by 2002:ac8:444f:: with SMTP id m15mr4046894qtn.110.1568994661811; 
 Fri, 20 Sep 2019 08:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-8-krzk@kernel.org>
In-Reply-To: <20190918173141.4314-8-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 20 Sep 2019 10:50:50 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+0ikCageBv3TSwx0tp=ZDkrFwpFVt2gJHWsFe2f-K2pA@mail.gmail.com>
Message-ID: <CAL_Jsq+0ikCageBv3TSwx0tp=ZDkrFwpFVt2gJHWsFe2f-K2pA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Matt Mackall <mpm@selenic.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 8/8] dt-bindings: pwm: Convert Samsung
	PWM bindings to json-schema
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

On Wed, Sep 18, 2019 at 12:32 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert Samsung PWM (S3C, S5P and Exynos SoCs) bindings to DT schema
> format using json-schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Fix samsung,pwm-outputs after review,
> 3. Remove double-quotes from clock names.
> ---
>  .../devicetree/bindings/pwm/pwm-samsung.txt   |  51 ---------
>  .../devicetree/bindings/pwm/pwm-samsung.yaml  | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-samsung.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
>
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.txt b/Documentation/devicetree/bindings/pwm/pwm-samsung.txt
> deleted file mode 100644
> index 5538de9c2007..000000000000
> --- a/Documentation/devicetree/bindings/pwm/pwm-samsung.txt
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -* Samsung PWM timers
> -
> -Samsung SoCs contain PWM timer blocks which can be used for system clock source
> -and clock event timers, as well as to drive SoC outputs with PWM signal. Each
> -PWM timer block provides 5 PWM channels (not all of them can drive physical
> -outputs - see SoC and board manual).
> -
> -Be aware that the clocksource driver supports only uniprocessor systems.
> -
> -Required properties:
> -- compatible : should be one of following:
> -    samsung,s3c2410-pwm - for 16-bit timers present on S3C24xx SoCs
> -    samsung,s3c6400-pwm - for 32-bit timers present on S3C64xx SoCs
> -    samsung,s5p6440-pwm - for 32-bit timers present on S5P64x0 SoCs
> -    samsung,s5pc100-pwm - for 32-bit timers present on S5PC100, S5PV210,
> -                         Exynos4210 rev0 SoCs
> -    samsung,exynos4210-pwm - for 32-bit timers present on Exynos4210,
> -                          Exynos4x12, Exynos5250 and Exynos5420 SoCs
> -- reg: base address and size of register area
> -- interrupts: list of timer interrupts (one interrupt per timer, starting at
> -  timer 0)
> -- clock-names: should contain all following required clock names:
> -    - "timers" - PWM base clock used to generate PWM signals,
> -  and any subset of following optional clock names:
> -    - "pwm-tclk0" - first external PWM clock source,
> -    - "pwm-tclk1" - second external PWM clock source.
> -  Note that not all IP variants allow using all external clock sources.
> -  Refer to SoC documentation to learn which clock source configurations
> -  are available.
> -- clocks: should contain clock specifiers of all clocks, which input names
> -  have been specified in clock-names property, in same order.
> -- #pwm-cells: should be 3. See pwm.txt in this directory for a description of
> -  the cells format. The only third cell flag supported by this binding is
> -  PWM_POLARITY_INVERTED.
> -
> -Optional properties:
> -- samsung,pwm-outputs: list of PWM channels used as PWM outputs on particular
> -    platform - an array of up to 5 elements being indices of PWM channels
> -    (from 0 to 4), the order does not matter.
> -
> -Example:
> -       pwm@7f006000 {
> -               compatible = "samsung,s3c6400-pwm";
> -               reg = <0x7f006000 0x1000>;
> -               interrupt-parent = <&vic0>;
> -               interrupts = <23>, <24>, <25>, <27>, <28>;
> -               clocks = <&clock 67>;
> -               clock-names = "timers";
> -               samsung,pwm-outputs = <0>, <1>;
> -               #pwm-cells = <3>;
> -       }
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
> new file mode 100644
> index 000000000000..06d11faabff6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/pwm-samsung.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC PWM timers
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +
> +description: |+
> +  Samsung SoCs contain PWM timer blocks which can be used for system clock source
> +  and clock event timers, as well as to drive SoC outputs with PWM signal. Each
> +  PWM timer block provides 5 PWM channels (not all of them can drive physical
> +  outputs - see SoC and board manual).
> +
> +  Be aware that the clocksource driver supports only uniprocessor systems.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,s3c2410-pwm             # 16-bit, S3C24xx
> +      - samsung,s3c6400-pwm             # 32-bit, S3C64xx
> +      - samsung,s5p6440-pwm             # 32-bit, S5P64x0
> +      - samsung,s5pc100-pwm             # 32-bit, S5PC100, S5PV210, Exynos4210 rev0 SoCs
> +      - samsung,exynos4210-pwm          # 32-bit, Exynos
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    description: |
> +      Should contain all following required clock names:
> +      - "timers" - PWM base clock used to generate PWM signals,
> +      and any subset of following optional clock names:
> +      - "pwm-tclk0" - first external PWM clock source,
> +      - "pwm-tclk1" - second external PWM clock source.
> +      Note that not all IP variants allow using all external clock sources.
> +      Refer to SoC documentation to learn which clock source configurations
> +      are available.
> +    oneOf:
> +      - items:
> +        - const: timers
> +      - items:
> +        - const: timers
> +        - const: pwm-tclk0
> +      - items:
> +        - const: timers
> +        - const: pwm-tclk1
> +      - items:
> +        - const: timers
> +        - const: pwm-tclk0
> +        - const: pwm-tclk1
> +
> +  interrupts:
> +    description:
> +      One interrupt per timer, starting at timer 0.
> +    minItems: 1
> +    maxItems: 5
> +
> +  "#pwm-cells":
> +    description:
> +      The only third cell flag supported by this binding
> +      is PWM_POLARITY_INVERTED.
> +    const: 3
> +
> +  samsung,pwm-outputs:
> +    description:
> +      A list of PWM channels used as PWM outputs on particular platform.
> +      It is an array of up to 5 elements being indices of PWM channels
> +      (from 0 to 4), the order does not matter.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - uniqueItems: true
> +      - items:
> +          minimum: 0
> +          maximum: 4
> +
> +required:
> +  - clocks
> +  - clock-names
> +  - compatible
> +  - interrupts
> +  - "#pwm-cells"
> +  - reg

additionalProperties: false

should work here. And in the rng binding too.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
