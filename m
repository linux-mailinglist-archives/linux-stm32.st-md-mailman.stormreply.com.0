Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8EA5A1A8B
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 22:48:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFD55C640FC;
	Thu, 25 Aug 2022 20:48:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5609C03FDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 20:48:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id n17so1432221wrm.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 13:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6UzUCNgt4y0AHaBNJHl0u/FLrxd0vX2AFvB+HEQd8NM=;
 b=E96RMdPc6kX9TtDJzrOqo1gGRHBzfP6XCPrz5N8u6kh2oo7pX+NvWTtXitAGAyhOYZ
 dLItkLw4f906wzOWubVOl/F2SWCkaHk/7bPn+J3AUOnkJCWEAVLrTFRlPF9ems0p6hJ3
 rqSs+G7ZXvCYbMxGQdTxdVkLQuSAS6snMZ7uZ7YmuI5cL9Qd6Kl17IYR8qF65hLEIzAz
 D7fnTM3kkZKCh29/6g/AIk87eu0ky3FNRGVFb95NdU1qt+007aFXG+0xtNjdzOgUvERN
 q5HP8HsJWwKJm/sRFdO/V+N0yfalBVs6XtPel5rDvkIRQifRPC/ddv7c1LEI1dUkh+5b
 R61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6UzUCNgt4y0AHaBNJHl0u/FLrxd0vX2AFvB+HEQd8NM=;
 b=N3Kss7UJ0GMRpX/M758ZckJIw1Vh0Zy2MuDV5pFYkw+6rGDxpp7jQ0zgRGnc7qzCwz
 xvJoTfgELdXT1tBryK4UO1qAM2xTeTTEM1XLXUi6QxnT12VhkVIUOPhEAU+M2FY5QoN5
 MWaKf4C8mh8FCYq4p9Y1aBzLRiTYCDrwiEcysWr/iQdUSalfOtX4TT2ggcagJY5IZw+c
 89OE9varL61WBHXyCezBN95z8nJxPwJfwhiCDFr+tGv464h09jwCOjiArKAdG3I3nD6H
 nJD4gluyZgoNIPXKNjQbp/K7IfIeKk/Syo4G+KYhKy0f/WAlwU7QWMq6v8NxQhIUaVJE
 BpHg==
X-Gm-Message-State: ACgBeo0UGYx6ClMw/K/prlyKG7TEj4zZ7+NIqTk+EtzLdIBfZnG2O7qt
 klQKgPL4Non6yb4NmNzBxs0=
X-Google-Smtp-Source: AA6agR5luFniLeLJR/gpv3f8y8PSO9iYmRy9xopByet6i9pxvH109nYNZOhflEi5Ej+3VAkPWavVHw==
X-Received: by 2002:a5d:64e1:0:b0:225:5495:ff75 with SMTP id
 g1-20020a5d64e1000000b002255495ff75mr3216411wri.21.1661460536349; 
 Thu, 25 Aug 2022 13:48:56 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 l14-20020a5d668e000000b002253fd19a6asm266939wru.18.2022.08.25.13.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 13:48:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Tim Harvey <tharvey@gateworks.com>, Robert Jones <rjones@gateworks.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, - <patches@opensource.cirrus.com>,
 Steve Twiss <stwiss.opensource@diasemi.com>, Chris Zhong <zyw@rock-chips.com>,
 Zhang Qing <zhangqing@rock-chips.com>,
 Alistair Francis <alistair@alistair23.me>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>
Date: Thu, 25 Aug 2022 22:48:54 +0200
Message-ID: <13083804.uLZWGnKmhe@kista>
In-Reply-To: <20220823145649.3118479-4-robh@kernel.org>
References: <20220823145649.3118479-4-robh@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Add missing
	(unevaluated|additional)Properties on child nodes
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

Dne torek, 23. avgust 2022 ob 16:56:35 CEST je Rob Herring napisal(a):
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../mfd/allwinner,sun6i-a31-prcm.yaml         | 40 +++++++++++++++++++
>  .../mfd/allwinner,sun8i-a23-prcm.yaml         | 10 +++++
>  .../bindings/mfd/cirrus,lochnagar.yaml        |  5 +++
>  .../devicetree/bindings/mfd/dlg,da9063.yaml   |  7 ++--
>  .../bindings/mfd/gateworks-gsc.yaml           |  5 ++-
>  .../bindings/mfd/maxim,max14577.yaml          |  1 +
>  .../bindings/mfd/maxim,max77843.yaml          |  1 +
>  .../bindings/mfd/rockchip,rk817.yaml          |  2 +
>  .../bindings/mfd/silergy,sy7636a.yaml         |  1 +
>  .../bindings/mfd/st,stm32-lptimer.yaml        |  4 ++
>  .../bindings/mfd/st,stm32-timers.yaml         |  3 ++
>  .../devicetree/bindings/mfd/st,stmfx.yaml     |  1 +
>  .../bindings/mfd/stericsson,ab8500.yaml       | 22 ++++++++++
>  .../devicetree/bindings/mfd/ti,tps65086.yaml  |  1 +
>  .../bindings/mfd/x-powers,axp152.yaml         |  1 +
>  15 files changed, 100 insertions(+), 4 deletions(-)
> 
> diff --git
> a/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml
> b/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml index
> d131759ccaf3..021d33cb3dd6 100644
> --- a/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml
> +++ b/Documentation/devicetree/bindings/mfd/allwinner,sun6i-a31-prcm.yaml
> @@ -22,6 +22,7 @@ properties:
>  patternProperties:
>    "^.*_(clk|rst)$":
>      type: object
> +    unevaluatedProperties: false
> 
>      properties:
>        compatible:
> @@ -34,6 +35,45 @@ patternProperties:
>            - fixed-factor-clock
> 
>      allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: fixed-factor-clock
> +
> +        then:
> +          $ref: /schemas/clock/fixed-factor-clock.yaml#
> +
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: allwinner,sun4i-a10-mod0-clk
> +
> +        then:
> +          properties:
> +            "#clock-cells":
> +              const: 0
> +
> +            # Already checked in the main schema
> +            compatible: true
> +
> +            clocks:
> +              maxItems: 2

Last time node with allwinner,sun4i-a10-mod0-clk compatible was used, it had 3 
clocks. See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/
arm/boot/dts/sun4i-a10.dtsi?id=f18698e1c66338b902de386e4ad97b8b1b9d999d#n406

Once that fixed, allwinner,sun6i-a31-prcm.yaml and allwinner,sun8i-a23-
prcm.yaml  are:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


> +
> +            clock-output-names:
> +              maxItems: 1
> +
> +            phandle: true
> +
> +          required:
> +            - "#clock-cells"
> +            - compatible
> +            - clocks
> +            - clock-output-names
> +
> +          additionalProperties: false
> +
>        - if:
>            properties:
>              compatible:



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
