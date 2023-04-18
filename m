Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 406516E6E0B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 23:23:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF526C6B441;
	Tue, 18 Apr 2023 21:23:15 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CBA9C6A5FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 21:23:14 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-18777914805so6246617fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 14:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681852993; x=1684444993;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKdLQJ2WfynsAnQi4i43G4jU69vCcdQQMLvbvIaqAHQ=;
 b=cCF301TR7jlaYQNjzhgC7l+rQJCH91VtP5i6jrLULrBsLWJKGsBkPLwE+mk4lXpizZ
 ifTAM12wtiSX5GA7wuPUYzwH+dV66H3qxlAE3yeS18feaancvyS5BGrnLDvG9R4ozLnb
 HxG2i0tqAFGd56VWS4XbxnV9mbiEX6k1voNHrLYFIvdRmSr98vwBY1ycENynQCdWCe+B
 xnyQ7BZg+1QY0UxeueF6rvg6SXNVdkAYNey/dtJMr19W83waI0sAIlMgYT3VIUZNAjCO
 DMdymUzexHUFrnpirZgVtLHnEWocpX+3BY2g4gyEYTmO50MVfHVjQw3F0KqJysDaArrB
 KbgQ==
X-Gm-Message-State: AAQBX9flyUO8bDx84ifR4a46kIk5hgu6W7VABu1YrCOO0eMqUERKvDvd
 D0/3gdXWNiSRWq+akVmnBA==
X-Google-Smtp-Source: AKy350bdmvWWvs8e3IniLnnX6QWq/ARMeVjy2OYmobsGssJEfW0Lm1T3KwueQwpXlw4Lj4ZiKOdsBA==
X-Received: by 2002:aca:c256:0:b0:38e:3d5a:abb5 with SMTP id
 s83-20020acac256000000b0038e3d5aabb5mr114233oif.9.1681852991281; 
 Tue, 18 Apr 2023 14:23:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e190-20020a4a55c7000000b0054542d3219asm3883392oob.11.2023.04.18.14.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:23:10 -0700 (PDT)
Received: (nullmailer pid 2358722 invoked by uid 1000);
 Tue, 18 Apr 2023 21:23:08 -0000
Date: Tue, 18 Apr 2023 16:23:08 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <168185298846.2358657.13423905325582795303.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Jamie Iles <jamie@jamieiles.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fu Wei <fu.wei@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Anson Huang <Anson.Huang@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Evan Benn <evanbenn@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 Corentin Labbe <clabbe@baylibre.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Robert Marko <robert.marko@sartura.hr>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-watchdog@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Julius Werner <jwerner@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On Sat, 15 Apr 2023 11:51:07 +0200, Krzysztof Kozlowski wrote:
> Two conversions to DT schema of GPIO watchdog binding happened and came
> through different trees.  Merge them into one:
> 1. Combine maintainers,
> 2. Use more descriptive property descriptions and constraints from
>    gpio-wdt.yaml,
> 3. Switch to unevaluatedProperties:false, to allow generic watchdog
>    properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/watchdog/gpio-wdt.yaml           | 55 -------------------
>  .../bindings/watchdog/linux,wdt-gpio.yaml     | 17 +++++-
>  2 files changed, 15 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/gpio-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
