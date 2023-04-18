Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF4C6E6E36
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 23:30:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F5C9C6B442;
	Tue, 18 Apr 2023 21:30:12 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19032C6A5FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 21:30:11 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6a5f602a8f7so873480a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 14:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681853410; x=1684445410;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6SgIob3ZbJ9A9DbSdga+gd14f2Z3RSbkiShhGJVWvl4=;
 b=hJm+gYz9ob75fsZzwymJHsMZRL23dSRjvEIwy0Yb6jqpQh4mJqdf7KT85SIhvM7fqb
 LFpDwIijGAM6QVQkX6QFK9Rg8ggdk5Rf3tM/hPdmTzdEzbmAJH/DrSjUTfwkGhmrvFq2
 we2n9s9MyyU+bkDKGH4wAD8djxCPAu34OYZUEoxFOQkLayR3E45of/745ljaPH8NFhHk
 xD4vKfdkYz1ZsZmF6edwNaCOKpSGhMzCBGl/pa3sF7uYdbxEUYIxgwmTrWBbhYcMKtHr
 5kdiXrYbZ7loUV78lxzyV3C2UhXTHb6VWkLKbYnc2Fy+5WvsaLxmvP2CNEtFNi6azPT7
 NfrQ==
X-Gm-Message-State: AAQBX9f4VUlfOmH7MEeqPLgKg+jyZYVBXa8fz1UfijsYFKYhNd0cp8HC
 fKdiX3sv8B2lCEQaz9XeAg==
X-Google-Smtp-Source: AKy350aReJVaibAghZiN+VSoVRy43DPIB7GVh66FFWas1Pk9GeRCRwxzczKHwH8CDiBT6m+naiEd7w==
X-Received: by 2002:a05:6870:2191:b0:187:89c5:1eef with SMTP id
 l17-20020a056870219100b0018789c51eefmr1880813oae.34.1681853409910; 
 Tue, 18 Apr 2023 14:30:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q4-20020a056870e60400b0016e49af5815sm5958219oag.51.2023.04.18.14.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:30:08 -0700 (PDT)
Received: (nullmailer pid 2366687 invoked by uid 1000);
 Tue, 18 Apr 2023 21:30:07 -0000
Date: Tue, 18 Apr 2023 16:30:07 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <168185340654.2366635.7606572133355407089.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-4-krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Jamie Iles <jamie@jamieiles.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fu Wei <fu.wei@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Viresh Kumar <vireshk@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Evan Benn <evanbenn@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Corentin Labbe <clabbe@baylibre.com>,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Robert Marko <robert.marko@sartura.hr>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 4/6] dt-bindings: watchdog:
 fsl-imx7ulp-wdt: simplify with unevaluatedProperties
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


On Sat, 15 Apr 2023 11:51:10 +0200, Krzysztof Kozlowski wrote:
> Allow generic watchdog properties by using unevaluatedProperties: false.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
