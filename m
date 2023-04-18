Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A986E6E55
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 23:37:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DC1DC6B442;
	Tue, 18 Apr 2023 21:37:04 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7DF5C6A5FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 21:37:02 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6a5d9853d97so486846a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 14:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681853821; x=1684445821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CbWVwRDoV9I2kcGoqtOHA4AoHy2tf9k4WaGcKcFo53w=;
 b=c2I7R5Ol5Ls4OMmOIUKZOSUcBMnngwi4osa7qTtKc3GTWYiIE6Km1srPELeQIu3ESK
 PTQLYIGZga1VtE5KPTlnPnaYUXWNKo04GU2DKuiYDrJ/ma6KfLkkeLLNDrECZ29TG9fa
 umG8FrXdvoeiXq636HHV3J1w/XO2N+oPR4ASCfljaHAdMhlJeFR5CtzJ6qoaYyZO06iD
 GAA1gBmtpbkmEfpr9Vqc/4EFLvt71I6Q+l9EMzysvC3sq5qkS6kQ68RgKdOsUhE6yxNo
 gthr93z0a6cAX/oEqNIsULf4pI4hSRoboT+SanybUdrP7TCvfD0y63dJEdtax81uzYis
 2KfA==
X-Gm-Message-State: AAQBX9c3VzOdt5MhdiyNSApICkiohno5eTOMqiOVrQKWKc3ZgNXitRx+
 hRlkcx8EcdjKXWzlG8fTPA==
X-Google-Smtp-Source: AKy350ajzlK+Nfe2WjS2CiPYlhzjq0hQUI8vA59pqj48sqD1cxE9cnAHbFCnFTn8iDnot1Luwh/ZcQ==
X-Received: by 2002:a9d:69d3:0:b0:6a6:598:b915 with SMTP id
 v19-20020a9d69d3000000b006a60598b915mr833018oto.8.1681853821579; 
 Tue, 18 Apr 2023 14:37:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020a9d7546000000b006a2ce5f3641sm6000241otl.8.2023.04.18.14.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:37:00 -0700 (PDT)
Received: (nullmailer pid 2374252 invoked by uid 1000);
 Tue, 18 Apr 2023 21:36:58 -0000
Date: Tue, 18 Apr 2023 16:36:58 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <168185381738.2374180.14119161072449587074.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-5-krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
 Jamie Iles <jamie@jamieiles.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Fu Wei <fu.wei@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-renesas-soc@vger.kernel.org, Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Robert Marko <robert.marko@sartura.hr>, Anson Huang <Anson.Huang@nxp.com>,
 Viresh Kumar <vireshk@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Evan Benn <evanbenn@chromium.org>,
 Guenter Roeck <linux@roeck-us.net>, Corentin Labbe <clabbe@baylibre.com>,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 5/6] dt-bindings: watchdog: toshiba,
 visconti-wdt: simplify with unevaluatedProperties
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


On Sat, 15 Apr 2023 11:51:11 +0200, Krzysztof Kozlowski wrote:
> Allow generic watchdog properties by using unevaluatedProperties: false.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/toshiba,visconti-wdt.yaml    | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
