Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F356BF8AA
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 08:57:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B373C6907C;
	Sat, 18 Mar 2023 07:57:43 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4793AC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 07:57:42 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id eg48so28454430edb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679126262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mwEOc5hIeG9CeKtWiV7AEMYJMnkS3/Hf7eGt7j2uMO4=;
 b=MxwHR+yNd1TLM1VXKVH8QQvHdMIj9bNfTTKFZLeNj+3NWlHAAhSwf6U5DsfdBTk749
 E/mOXmsOEK4g2V61JUx+/lKJdzsiFwVhBfzIENyU0UJunOrfqDVknrrZjHacivAdEE7P
 p4r3ep7FKIAI1RIP7FLc1hg+iIRvd1tBNgSY4mR13IE6x0irS5nfHgNNU8Ck9XIq1yud
 qBwOgImWumO0yLQm+FC/kmzzcJWtiIJV0+6HLn4NfoePBFC8J469WarKiUJcNVxTPTEq
 qbHEkNQ/dulOCe2tGI4Lc7ptKS6xe4pz3edM5D2VR3Tk+2cQi6fwi/zxlzTHmuRRJnzy
 Oqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679126262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwEOc5hIeG9CeKtWiV7AEMYJMnkS3/Hf7eGt7j2uMO4=;
 b=QDf0W5088x1PbPSak5G0tmEOnKSpZwqLr0CYx0fMmq1FKlZTAx0u1bgPC6ZMB1vGjB
 ooJw+Oh6gnQrGzF4BY/oFf9apQTRajb1CZHsRjUNFDTYtzx8uhYpAfrQZVi+lb8eBfdn
 itmthOT6a2YFhDTeo5iNidcpDaG4gV06pE27yIYOTHDHw5RE7VMg+x3uANg8ViABVbZX
 o53MMaySJnR9jExs06uU0UL0WDGId5mdXf8mgnYhm6gfUdltP2lG0fvStGmrIcxhRX1V
 OMI0PiEs8i2gtnfMvZlI7gDAWjcU+46zI5PYhCQUsNnj9Nn0EByIM1RRBXcX1fTiJACB
 SnSg==
X-Gm-Message-State: AO0yUKVBjNP4ne3yApzrGRdoybIR5an6TzKye0KsZkX9X47HrfxqSI4O
 ViQXC0bkHAjb31j1b7q/XJw=
X-Google-Smtp-Source: AK7set8GbnpVfJNCu1eoVd9Z9fGylLQXsIimdP5yZ9nesRJ59KZUePcgh+xs6yhfk80f/5Rhh+04uw==
X-Received: by 2002:a17:906:3387:b0:8b1:3483:e3d5 with SMTP id
 v7-20020a170906338700b008b13483e3d5mr2172986eja.48.1679126261884; 
 Sat, 18 Mar 2023 00:57:41 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 ja21-20020a170907989500b0093338259b2bsm316182ejc.207.2023.03.18.00.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 00:57:41 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Date: Sat, 18 Mar 2023 08:57:39 +0100
Message-ID: <4814217.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
References: <20230317233634.3968656-1-robh@kernel.org>
MIME-Version: 1.0
X-Topics: 
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rtc: Drop unneeded quotes
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

Dne sobota, 18. marec 2023 ob 00:36:33 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml      | 2 +-
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 2 +-
>  .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml        | 2 +-
>  .../devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml       | 2 +-
>  Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml   | 4 ++--
>  .../devicetree/bindings/rtc/microcrystal,rv3032.yaml          | 2 +-
>  Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml   | 2 +-
>  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml   | 2 +-
>  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml        | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc-mxc.yaml            | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml         | 2 +-
>  Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml         | 4 ++--
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml       | 2 +-
>  Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml          | 2 +-
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml        | 2 +-
>  16 files changed, 18 insertions(+), 18 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
