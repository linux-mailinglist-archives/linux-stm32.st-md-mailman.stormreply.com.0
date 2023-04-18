Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDD06E6E6C
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 23:39:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B8B3C6B442;
	Tue, 18 Apr 2023 21:39:38 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F832C6A5FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 21:39:37 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-38ba6bec245so461651b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 14:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681853976; x=1684445976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FTQgI3HTIujYCvmdGvbn1iYHKKTz5bkM55o7VU7wfs=;
 b=LrHYJPT3nJ85YgpNxIr+pHtc8xpaMuMbpCd5Wjkn8C1qqyaToUD9ngwSGIqhZdEUKw
 IAj84ZuOuXEFXBEJHYgXvtxlwP4HhKxOYcjgHwfjG0I3OcvwOksTV3JZ7AvCfbbP3+Ti
 sf/qXAxGB8t+Yz0GGLDTWSkjOQQWR9DeEPyu9lEtyn80dvjU5lMzcN/CMLzqZkhgBQJT
 4+KotcPepn/gghzFAhjrlvJZefMyOXYGu3O8EOruJYOmCcQKlWZ8UsQ9vvuMFO5Qo9fl
 mQcETWTPRIbQ2Y5832q6SW+sz+ZW+i/0SDZNUwr3QRDJqrYCZnvvsXKVGrLjOpHrDCX2
 rdsg==
X-Gm-Message-State: AAQBX9cSF6qJG6cMOvngVdXHibmGMVUYWplx3SrnKsywnp9cmCzqwhNt
 hQjAc8U2dtB4qOd8Hcuglg==
X-Google-Smtp-Source: AKy350ad1gFJziMA7uFDXKgRYHOImiDLZc2+2kux8SA8FrsvhCP7QU7dcKoZR+twA7gAQFYNGfgJUA==
X-Received: by 2002:aca:644:0:b0:378:2df5:49f5 with SMTP id
 65-20020aca0644000000b003782df549f5mr1944858oig.2.1681853974837; 
 Tue, 18 Apr 2023 14:39:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n3-20020aca2403000000b0038bffe1332dsm3950756oic.57.2023.04.18.14.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:39:31 -0700 (PDT)
Received: (nullmailer pid 2376874 invoked by uid 1000);
 Tue, 18 Apr 2023 21:39:29 -0000
Date: Tue, 18 Apr 2023 16:39:29 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <168185396909.2376821.8732982905359058158.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-6-krzysztof.kozlowski@linaro.org>
Cc: Sander Vanheule <sander@svanheule.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
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
 Andy Gross <agross@kernel.org>, Evan Benn <evanbenn@chromium.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <linux@roeck-us.net>, Corentin Labbe <clabbe@baylibre.com>,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Robert Marko <robert.marko@sartura.hr>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 6/6] dt-bindings: watchdog: realtek,
 otto-wdt: simplify requiring interrupt-names
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


On Sat, 15 Apr 2023 11:51:12 +0200, Krzysztof Kozlowski wrote:
> Required properties should be listed in "required:" block.  Since
> interrupts are already there, the dependency of interrupt-names on the
> interrupts can be simplified.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/watchdog/realtek,otto-wdt.yaml        | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
