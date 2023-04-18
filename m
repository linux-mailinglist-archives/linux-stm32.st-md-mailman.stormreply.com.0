Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B646E6E14
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 23:25:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2650CC6B441;
	Tue, 18 Apr 2023 21:25:33 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75769C6A5FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 21:25:31 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-38c35975545so681339b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 14:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681853130; x=1684445130;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yT4GcMjbrel2c9kDi9IQ9tl5o6MfO8exlHC9/eKTb0=;
 b=ZnPdnPJ1gHg2MsajvhKyqGZf5B0VKsIxyjHw+xfrFnAEOyu09ca0gTuSPmmLXjVvbP
 3T/QZqizDNd4O5ZH8S3Jmyj8AOBSmpdqjXHfB0c+AHyl0Dj6IymaMgcUKR1ND1Bc4ghu
 2AU9HAbssujwV4HdUwu0NX7DW9fnGN222OT2Xg3ATet52NBo3EFc+Ka3JqLgQBGrK8Vv
 fEovOUJilcz4M0UMul5A2/jJOQpfltjMO4vyQ6xP+YVtvjqu4AdspM5vI33DgbJZCKPx
 nCC2rcLNikY8ZKzUHqgDc2DikuU66zCBi+JGhQGh4I6JocEwUtjMmIlAxWxyZRLQ5sIg
 EaNQ==
X-Gm-Message-State: AAQBX9figd0vP5z0PEhTBRM+WxvoBaqk4kRmg51zF7ighxaRmbFLlfWj
 svgEZfHdDrB+nwvqV+UATw==
X-Google-Smtp-Source: AKy350bJbf7E4XDwA3/8131dQDn0lBGN26VByKnBFlDX2ebpKxcur0FYvrpyn2ImyGuSOquucrCuNQ==
X-Received: by 2002:a05:6808:ab7:b0:38c:17a7:5b80 with SMTP id
 r23-20020a0568080ab700b0038c17a75b80mr1621062oij.37.1681853130221; 
 Tue, 18 Apr 2023 14:25:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v124-20020a4a5a82000000b0051ffe0fe11bsm6369196ooa.6.2023.04.18.14.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:25:29 -0700 (PDT)
Received: (nullmailer pid 2361549 invoked by uid 1000);
 Tue, 18 Apr 2023 21:25:27 -0000
Date: Tue, 18 Apr 2023 16:25:27 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <168185312747.2361485.10895999899602826593.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Jamie Iles <jamie@jamieiles.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fu Wei <fu.wei@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andy Gross <agross@kernel.org>, Evan Benn <evanbenn@chromium.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Robert Marko <robert.marko@sartura.hr>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-renesas-soc@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Julius Werner <jwerner@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: watchdog: indentation,
 quotes and white-space cleanup
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


On Sat, 15 Apr 2023 11:51:08 +0200, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 10 +++---
>  .../bindings/watchdog/arm,sbsa-gwdt.yaml      |  1 -
>  .../bindings/watchdog/arm,twd-wdt.yaml        |  6 ++--
>  .../bindings/watchdog/arm-smc-wdt.yaml        |  7 ++--
>  .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 14 ++++----
>  .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  6 ++--
>  .../bindings/watchdog/faraday,ftwdt010.yaml   | 16 +++++-----
>  .../watchdog/mediatek,mt7621-wdt.yaml         |  6 ++--
>  .../bindings/watchdog/qcom-wdt.yaml           | 32 +++++++++----------
>  .../bindings/watchdog/renesas,wdt.yaml        | 14 ++++----
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 32 +++++++++----------
>  .../bindings/watchdog/st,stm32-iwdg.yaml      | 10 +++---
>  .../watchdog/xlnx,xps-timebase-wdt.yaml       | 12 +++----
>  13 files changed, 83 insertions(+), 83 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
