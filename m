Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 433F16BF896
	for <lists+linux-stm32@lfdr.de>; Sat, 18 Mar 2023 08:56:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1CA4C6907C;
	Sat, 18 Mar 2023 07:55:59 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A553C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 07:55:58 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id eh3so28513514edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Mar 2023 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679126158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3mb1pjia0IgyxNYtGaBW063L8X9ZIfqHcxc0T2DSoE=;
 b=fBX72+jPi22mNWR0n66lXXvwXHTQxcM41cjOKQOFBjpMqwvJXTQARhbixvvPdkkpyg
 iRz5F1olqpPnPEhjzGsE8uRjUIq0KObfvNgQ33aXB16Xe4mdr88HqTAATKyBFPncUXHN
 pAHvLgLybu/xG4qaqSDaGPMBl4snRJTmMwG7ZAjPV0ZmxqwZwUqiR0DLEKcbQ+k4MgFm
 uLv/UFLAxju66WskNVs6KYpSK7pn8sxPIhpX3kVxZGAwHr4Yi+Sx1ojZX8mCwCAtaHdg
 cFHHoFp3LRvH0s2K5dzSmzksNvnh5RF5z5TITUuf/CxXcgImrBy6REOAOt+P4G3p7ZrF
 qT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679126158;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3mb1pjia0IgyxNYtGaBW063L8X9ZIfqHcxc0T2DSoE=;
 b=mVUqakxzpPkH4TA3pzz6oc7nBDcroJewABuGC7KMUy7vNHJHEs8aqEHY0MXN+/g1z+
 hhQvlPGaAoSAT9Lu9wSYzijQqwUZn2ha7Gk7OOatoLHEL6Qs0TALutO21fD47TTdKUEw
 m58WBqavy46M4kS/RyArDDS6mfEm9uAYcRKNTq0xXQGXRgZE83z6GFEHwnYjVZU/X4m9
 M2SUffWG4VE5ZyVe2B2Nnjxcb3vErt1MI8BNqxYd5z5FM4K+RWWu6NutFAwNI8Hlcu1C
 Nhgyg0ipE+dFTOmGcFrbVwC1W8NPOQBqMd/EogGe7JF3XctIgyNQsSfwYoBUngmaXJyV
 eGWA==
X-Gm-Message-State: AO0yUKWnGmkaiYoUzG2d1+qByHm+e4kjIgUSvuXKP7OAyxyB6EJVMKGO
 vPytS4uPPQ49ysep9IyZPnE=
X-Google-Smtp-Source: AK7set+YGRH+NdfCv25lT4gzGUwF+d+mhdcmW8UIiZ6tl7LF/5aTRoQ3LntLinj37gw5RiBcrUdU9w==
X-Received: by 2002:a17:907:2bc8:b0:931:2306:f363 with SMTP id
 gv8-20020a1709072bc800b009312306f363mr2055699ejc.21.1679126157741; 
 Sat, 18 Mar 2023 00:55:57 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 xo10-20020a170907bb8a00b008ec793ac3f4sm1850916ejc.192.2023.03.18.00.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 00:55:57 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>
Date: Sat, 18 Mar 2023 08:55:54 +0100
Message-ID: <2672483.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230317233643.3969019-1-robh@kernel.org>
References: <20230317233643.3969019-1-robh@kernel.org>
MIME-Version: 1.0
X-Topics: 
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 asahi@lists.linux.dev, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: watchdog: Drop unneeded
	quotes
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

Dne sobota, 18. marec 2023 ob 00:36:42 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 +-

for allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml       | 2 +-
>  Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml     | 2 +-
>  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml         | 2 +-
>  .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml          | 2 +-
>  .../devicetree/bindings/watchdog/faraday,ftwdt010.yaml          | 2 +-
>  Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml | 2 +-
>  Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml   | 2 +-
>  Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml     | 2 +-
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml     | 2 +-
>  .../devicetree/bindings/watchdog/socionext,uniphier-wdt.yaml    | 2 +-
>  Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml   | 2 +-
>  Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml      | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
