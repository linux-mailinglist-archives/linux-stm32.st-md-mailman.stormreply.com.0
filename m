Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EBE6E6E1A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 23:25:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E3A7C6B441;
	Tue, 18 Apr 2023 21:25:59 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28B5DC6A5FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 21:25:57 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-187b07ad783so750579fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 14:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681853156; x=1684445156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1y++hWxszbxdwjn4XHYGat0BkERR+aOKZ06U2V4Qsw=;
 b=b5baH83CaV/6BqVb04/gM69cxtkGP12UgC1Sq6wv0SukL1aZFWJbAHVOrj9SglGghw
 bwcZmQ5DhyhrF/GECvIdp/amEcoNUEVdzABnxGdLEwOAkfTrS/JITHIxp7ED0yvgde++
 dAgl4M/PNt8yKpmy7bvaOXinvVFuC0BXpbAI85k+AvBf1nb4WJ688aZ6/eK94XUKViBr
 XSNJ8+DM8lfCKplRgfu+cB21lyoZGnjhSHEOIYPQCaKZ2afaP/J1T9gOm/eAX84DrRMY
 Pz8bExkPSt4DOSgLyi9M7Vv2wG9aswBXTI+J6G4PQSRLkkSgw+0Phm+V7McqwiS5C9Nv
 7LxQ==
X-Gm-Message-State: AAQBX9cn7u82VfwmyZuFNuzEvsPPhhTKADSuNYl/ySZnRyoKkobYJ5FH
 atlllaXFG5FI/5imirlvUQ==
X-Google-Smtp-Source: AKy350a/OTdllCATjmGezPT1m6bdviDcFkCirlifvfPn2ydSCEej4nyQRiMWdgkdCNUBPOZoo/lCZA==
X-Received: by 2002:a05:6870:b14d:b0:184:8536:ce54 with SMTP id
 a13-20020a056870b14d00b001848536ce54mr1896652oal.28.1681853156080; 
 Tue, 18 Apr 2023 14:25:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e6-20020a056870944600b0017fea9c156esm6023892oal.18.2023.04.18.14.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:25:55 -0700 (PDT)
Received: (nullmailer pid 2362107 invoked by uid 1000);
 Tue, 18 Apr 2023 21:25:53 -0000
Date: Tue, 18 Apr 2023 16:25:53 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <168185315346.2362046.17065820066385103041.robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230415095112.51257-3-krzysztof.kozlowski@linaro.org>
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
 Fu Wei <fu.wei@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Anson Huang <Anson.Huang@nxp.com>,
 Viresh Kumar <vireshk@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Corentin Labbe <clabbe@baylibre.com>, Evan Benn <evanbenn@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
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
 Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 3/6] dt-bindings: watchdog: arm,
 sp805: drop unneeded minItems
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


On Sat, 15 Apr 2023 11:51:09 +0200, Krzysztof Kozlowski wrote:
> There is no need to specify minItems when they are equal to maxItems,
> because it is implied by maxItems.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/watchdog/arm,sp805.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
