Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F7C6E3A15
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Apr 2023 18:04:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B07EC6B448;
	Sun, 16 Apr 2023 16:04:38 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3704C6A61F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 16:04:35 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7606cf9fc63so44061139f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681661074; x=1684253074;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=DvyJQrP9UkgoEpM6LF6RSI8qFgLSE064i5p1rN/mkpE=;
 b=Rjsd/vPUp+rVHOA9ZNdASN/VeVhhpBT8mHqDUVjdzxLmV/a1BWixL2FLTm6oojhRCI
 XPAGEfkBWiUacifIUGd3enaORGfFOkM+2MyxLQJUulLnLXvQf5LYMGHm3GsqG64S0vHL
 4DssqHiN4f1xshttWtVgzgqRRVtsFWvvPbHtkxbDFAug4XF+PNq3zKFgSfFEzowJR+Ev
 7ohaeeKrHIb1h7YeE5L7rX6pcZYf6GKdwiMTgfc1bnvl4ObqUTrKPet9NQOT4ZVc+JGF
 pFKm0EI+AX8fBQTommDAyGn52ZZk3DnXSX1/Hyz83svG6/GcwKZv11IWw6O/xsvZate9
 VcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681661074; x=1684253074;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DvyJQrP9UkgoEpM6LF6RSI8qFgLSE064i5p1rN/mkpE=;
 b=dxaXnD64DQbDx8/ARRC/Pa7tDSWpFW7/KY8lR6C/8vt7clqYLVqnDKJACy1XPHtwFJ
 sKnMrdoOZLgim3jB3itn2zVajvIzYfZxZ4k+tI7qTHGbBfroNKlisUH1GpMAoxl4Dvxs
 c9yEGZwGv/kFtgVgHeZhBSwCJzdDANkIO7kOQmYKdGCYWO/CjvrsKMRcxnYIEyF4lmS+
 knBPJxOozagR2azDwWaiKdOB4syjhX8wg0jUc9uYFOjWvyhjbmNCkuzv1mo+dl4eev9p
 gg8I59id3VZvg5ijDWDcVe2jpq171GSfVuiXs45AWKzcild4Wygzo56Jo2K4nJ2QKwX7
 lIaQ==
X-Gm-Message-State: AAQBX9cIkOHiU0tODHp2RFfmuanzTOYjnOu7UEji1lsUIe2pt26s33R1
 n8NbM3USuQKhw8R8Nb6PJb0=
X-Google-Smtp-Source: AKy350b8nOHI+C0ZJQewf0qqo1qiG0HMZyX0zk7KgmvMTGs+cXzuzrPwrUaFbu2uXf1mrD3iW4LNgw==
X-Received: by 2002:a92:90b:0:b0:328:52d1:6415 with SMTP id
 y11-20020a92090b000000b0032852d16415mr8855471ilg.15.1681661074352; 
 Sun, 16 Apr 2023 09:04:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a056638338900b003c4f35c21absm2603277jav.137.2023.04.16.09.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 09:04:33 -0700 (PDT)
Message-ID: <16d3bb91-af02-2504-1a8b-7805a2d30bb4@roeck-us.net>
Date: Sun, 16 Apr 2023 09:04:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sander Vanheule <sander@svanheule.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>, =?UTF-8?B?77+9ZWNraQ==?=
 <rafal@milecki.pl>, Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jamie Iles <jamie@jamieiles.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: watchdog: drop
 duplicated GPIO watchdog bindings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/15/23 02:51, Krzysztof Kozlowski wrote:
> Two conversions to DT schema of GPIO watchdog binding happened and came
> through different trees.  Merge them into one:
> 1. Combine maintainers,
> 2. Use more descriptive property descriptions and constraints from
>     gpio-wdt.yaml,
> 3. Switch to unevaluatedProperties:false, to allow generic watchdog
>     properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


For the series:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

On a side note, the e-mail addresses in patchwork are messed up for
patches sent by you. As result, I can not reply to your e-mails after
pulling a patch from patchwork. This means that some replies get lost
if I did not keep the original e-mail.

That is how it looks like after I pull one of your patches from patchwork:

To:
+=?unknown-8bit?q?Wim_Van_Sebroeck_=3Cwim=40linux-watchdog=2Eorg=3E=2C_Gu?==?unknown-8bit?q?enter_Roeck_=3Clinux=40roeck-us=2Enet=3E=2C_Rob_Herring_?==?unknown-8bit?q?=3Crobh+dt=40kernel=2Eorg=3E=2C_Krzysztof_Kozlowski_=3Ckrz?==?unknown-8bit?q?yszt
+of=2Ekozlowski+dt=40linaro=2Eorg=3E=2C_Neil_Armstrong_?==?unknown-8bit?q?=3Cneil=2Earmstrong=40linaro=2Eorg=3E=2C_Kevin_Hilman_=3Ck?==?unknown-8bit?q?hilman=40baylibre=2Ecom=3E=2C_Jerome_Brunet_=3Cjbrunet=40b?==?unknown-8bit?q?aylibre=2Ecom=3E=2C_
+Martin_Blumenstingl_=3Cmartin=2Eblumen?==?unknown-8bit?q?stingl=40googlemail=2Ecom=3E=2C_Julius_Werner_=3Cjwerner?==?unknown-8bit?q?=40chromium=2Eorg=3E=2C_Evan_Benn_=3Cevanbenn=40chromium?==?unknown-8bit?q?=2Eorg=3E=2C_Nicolas_Ferre_=3Cnicolas=2E
+ferre=40microchip?==?unknown-8bit?q?=2Ecom=3E=2C_Alexandre_Belloni_=3Calexandre=2Ebelloni=40bo?==?unknown-8bit?q?otlin=2Ecom=3E=2C_Claudiu_Beznea_=3Cclaudiu=2Ebeznea=40mic?==?unknown-8bit?q?rochip=2Ecom=3E=2C_Florian_Fainelli_=3Cf=2Efainelli=40gma
+i?==?unknown-8bit?q?l=

Guenter

> ---
>   .../bindings/watchdog/gpio-wdt.yaml           | 55 -------------------
>   .../bindings/watchdog/linux,wdt-gpio.yaml     | 17 +++++-
>   2 files changed, 15 insertions(+), 57 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml b/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
> deleted file mode 100644
> index 155dc7965e9b..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/watchdog/gpio-wdt.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: GPIO controlled watchdog
> -
> -maintainers:
> -  - Robert Marko <robert.marko@sartura.hr>
> -
> -properties:
> -  compatible:
> -    const: linux,wdt-gpio
> -
> -  gpios:
> -    maxItems: 1
> -    description: GPIO connected to the WDT reset pin
> -
> -  hw_algo:
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description: Algorithm used by the driver
> -    oneOf:
> -      - description:
> -          Either a high-to-low or a low-to-high transition clears the WDT counter.
> -          The watchdog timer is disabled when GPIO is left floating or connected
> -          to a three-state buffer.
> -        const: toggle
> -      - description:
> -          Low or high level starts counting WDT timeout, the opposite level
> -          disables the WDT.
> -          Active level is determined by the GPIO flags.
> -        const: level
> -
> -  hw_margin_ms:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description: Maximum time to reset watchdog circuit (in milliseconds)
> -    minimum: 2
> -    maximum: 65535
> -
> -  always-running:
> -    type: boolean
> -    description:
> -      If the watchdog timer cannot be disabled, add this flag to have the driver
> -      keep toggling the signal without a client.
> -      It will only cease to toggle the signal when the device is open and the
> -      timeout elapsed.
> -
> -required:
> -  - compatible
> -  - gpios
> -  - hw_algo
> -  - hw_margin_ms
> -
> -unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> index 50af79af6416..499f1b7e03f9 100644
> --- a/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/linux,wdt-gpio.yaml
> @@ -8,6 +8,7 @@ title: GPIO-controlled Watchdog
>   
>   maintainers:
>     - Guenter Roeck <linux@roeck-us.net>
> +  - Robert Marko <robert.marko@sartura.hr>
>   
>   properties:
>     compatible:
> @@ -19,11 +20,23 @@ properties:
>   
>     hw_algo:
>       description: The algorithm used by the driver.
> -    enum: [ level, toggle ]
> +    oneOf:
> +      - description:
> +          Either a high-to-low or a low-to-high transition clears the WDT counter.
> +          The watchdog timer is disabled when GPIO is left floating or connected
> +          to a three-state buffer.
> +        const: toggle
> +      - description:
> +          Low or high level starts counting WDT timeout, the opposite level
> +          disables the WDT.
> +          Active level is determined by the GPIO flags.
> +        const: level
>   
>     hw_margin_ms:
>       description: Maximum time to reset watchdog circuit (milliseconds).
>       $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 2
> +    maximum: 65535
>   
>     always-running:
>       type: boolean
> @@ -42,7 +55,7 @@ required:
>   allOf:
>     - $ref: watchdog.yaml#
>   
> -additionalProperties: false
> +unevaluatedProperties: false
>   
>   examples:
>     - |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
