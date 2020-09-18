Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7903426FFDE
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Sep 2020 16:30:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E2EFC32EA9;
	Fri, 18 Sep 2020 14:30:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C54DDC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Sep 2020 14:30:17 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E5D423998
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Sep 2020 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600439416;
 bh=BzRCCHrMyRtEbFXS+WPF2C06UQOXtwZQ6+AR7KwiNeY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wsnGvCVQtY3Fjm96gabQ3yL4JGp4SlDe9LHAm1jvpUvHr4V01rcYNvZ8aAR5/K6DI
 4ZbsvZ+rAFCvVqvjpfACz0NLKa8hCi2rM2fn+sntjgW8FTh7cdsNOd+SljkNn6CNLZ
 +rN4wh+xCQKm+ZXfiYaJE9WT1AOlwD7HPuVdyYqE=
Received: by mail-yb1-f176.google.com with SMTP id c17so4485065ybe.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Sep 2020 07:30:16 -0700 (PDT)
X-Gm-Message-State: AOAM533mWN56ETdmatll+A8+VsEp5TLezRc42GjIW6zPdmnHTwFjjZWn
 wx+hZ5r9I6vjLWQcORvknUwIT6SLfAVJ0OW6JA==
X-Google-Smtp-Source: ABdhPJwB1Ma/MKweZxwzRdC4MQG3s3W4wg0oVoNXdP8sSb8gUQ626v5DX61EKMyUVGmHFAKJsNKSrOjgarNcaCyLkpU=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr21429982otp.107.1600439413814; 
 Fri, 18 Sep 2020 07:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
In-Reply-To: <20200917165301.23100-2-krzk@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 18 Sep 2020 08:30:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
Message-ID: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Stefan Agner <stefan@agner.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Teng <andy.teng@mediatek.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jaroslav Kysela <perex@perex.cz>, Sungbo Eo <mans0n@gorani.run>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sricharan R <sricharan@codeaurora.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hoan Tran <hoan@os.amperecomputing.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 - <patches@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH v2 01/13] dt-bindings: gpio: add common
	schema for GPIO controllers
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

On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Convert parts of gpio.txt bindings into common dtschema file for GPIO
> controllers.  The schema enforces proper naming of GPIO controller nodes
> and GPIO hogs.

Did you not see my previous reply about a common schema? We already
have a common GPIO and hog schema in dtschema. Please add to it
whatever is missing.

My goal is all common schema end up in dtschema, but I haven't pushed
folks to do that yet. Ones I've done are there though. One issue is
what's in dtschema should be GPL/BSD and the existing text bindings
are default GPL, so there's a relicensing exercise. In some cases, the
schema is there but I haven't copied over the descriptions.

Rob


> +    description:
> +      Indicates the start and size of the GPIOs that can't be used.
> +
> +  ngpios:
> +    description: |
> +      Optionally, a GPIO controller may have a "ngpios" property. This property
> +      indicates the number of in-use slots of available slots for GPIOs. The
> +      typical example is something like this: the hardware register is 32 bits
> +      wide, but only 18 of the bits have a physical counterpart. The driver is
> +      generally written so that all 32 bits can be used, but the IP block is
> +      reused in a lot of designs, some using all 32 bits, some using 18 and
> +      some using 12. In this case, setting "ngpios = <18>;" informs the driver
> +      that only the first 18 GPIOs, at local offset 0 .. 17, are in use.
> +
> +      If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1,
> +      an additional set of tuples is needed to specify which GPIOs are
> +      unusable, with the gpio-reserved-ranges binding.
> +
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +    description:
> +      The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> +      providing automatic GPIO request and configuration as part of the
> +      gpio-controller's driver probe function.
> +      Each GPIO hog definition is represented as a child node of the GPIO controller.
> +
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name:
> +        description:
> +          The GPIO label name. If not present the node name is used.
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +
> +    oneOf:
> +      - required:
> +          - input
> +      - required:
> +          - output-high
> +      - required:
> +          - output-low
> +
> +    additionalProperties: false
> +
> +required:
> +  - "#gpio-cells"
> +  - gpio-controller
> +
> +examples:
> +  - |
> +    gpio-controller@15000000 {
> +        compatible = "foo";
> +        reg = <0x15000000 0x1000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        ngpios = <18>;
> +        gpio-reserved-ranges = <0 4>, <12 2>;
> +        gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
> +                          "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
> +                          "Row A", "Row B", "Row C", "Row D", "NMI button",
> +                          "poweroff", "reset";
> +    };
> +
> +  - |
> +    gpio-controller@1400 {
> +        compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
> +        reg = <0x1400 0x18>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +
> +        line-b-hog {
> +            gpio-hog;
> +            gpios = <6 0>;
> +            input;
> +            line-name = "foo-bar-gpio";
> +        };
> +    };
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
