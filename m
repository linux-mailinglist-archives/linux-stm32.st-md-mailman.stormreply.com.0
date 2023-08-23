Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FB786064
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Aug 2023 21:14:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D203C6B44C;
	Wed, 23 Aug 2023 19:14:04 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E82F5C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 19:14:02 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-99d937b83efso775305966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Aug 2023 12:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692818042; x=1693422842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCIrAxFDF25mzcKHeRcgDzkO8YOJQLUfVKMU+Ywn+CI=;
 b=F0m1dC0r1D9CfIev6pc24EaKzGxk0UuGNnqavKUqIieO1QM7EZ7130J/Dl71vD6cck
 b4tEURRXTFB8K8kYrJunVHW9jBttCV6oOn8MVoJC79gH1IKNI19yDUYtMafAbmCqjXGD
 jVl603iPiqILuA4/TICEL/jjU1Zfbn8GRo7IvKdaiiAVALYvHyo8QXpiqsHXR3TLXa0H
 BMTTH8pb0RyPS7pzI0xuKr4OWTzNw+a/EX5nYDengR5UprSeu/PNWdOWKKpalqT87OfD
 yS2EFWh9G3CbcUle03vyDcSzD2TgQgsnuyYnmsRhV0Z/we7N8WB/AHWK+LsXaMGpdm0x
 eX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692818042; x=1693422842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCIrAxFDF25mzcKHeRcgDzkO8YOJQLUfVKMU+Ywn+CI=;
 b=YBHEmJwr+V0DSYrlBdpFOunI9EnIzTGnS+DMAGH3f+bc/5K2KQF/A5nBKmrhyIVg9w
 TP0N2+HU3BlWXL9LCyO2HDVTL4VJJEqw9M7A7Xr5tic914ZsaWForJ9nUMzzROtqrxJV
 GiYRqk6UdEUc5+XDZYZ/blmNvySTS6Wausmk+dSnScZDoNeD/V4fD2uVe+WpAUpeaPMf
 3rId7X0k5hBUe4lr+ILa/SIVOxpxXRpeYZEvOs3oYezTR6SGOedWSDc9kL6CQit/jR/Y
 PGpzgCC/KSbrCsKoWbrRyk3nximFxKnHd6PVdzg1Bss/eFBdkkSnjKV2E7ZcoJl/PsBw
 C4nw==
X-Gm-Message-State: AOJu0YzevZsvc8tyQLgt9Hlkhq1J+34BhXOsq+k959heclECjIWLrdiP
 L8F6f2yX+ez2CSAKq4VsWVE=
X-Google-Smtp-Source: AGHT+IFbojcSnWWb57HEiIyw8RL+IR9XS37Wm62sPrbcTpWpKP2WmF6c9EcbiBXGI99RpkWM2z7iJQ==
X-Received: by 2002:a17:906:cc2:b0:99d:f560:5d3c with SMTP id
 l2-20020a1709060cc200b0099df5605d3cmr11357511ejh.23.1692818042131; 
 Wed, 23 Aug 2023 12:14:02 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906084f00b0099cf9bf4c98sm10059758ejd.8.2023.08.23.12.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 12:14:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 23 Aug 2023 21:13:59 +0200
Message-ID: <4504114.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
References: <20230823085146.113562-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] Re: [PATCH 1/2] ARM: dts: use capital "OR" for
	multiple licenses in SPDX
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

Dne sreda, 23. avgust 2023 ob 10:51:45 CEST je Krzysztof Kozlowski napisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi                  | 2 +-
>  arch/arm/boot/dts/allwinner/sunxi-d1s-t113-mangopi-mq-r.dtsi  | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  arch/arm/boot/dts/nxp/imx/imx6dl-b105pv2.dts                  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b105v2.dts                   | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts                  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts                   | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts                   | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b1x5pv2.dtsi                 | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi                  | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dts              | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi                    | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6q-emcon-avari.dts               | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-emcon-avari.dtsi            | 2 +-
>  arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi                  | 2 +-
>  arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dts              | 2 +-
>  arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi           | 2 +-



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
