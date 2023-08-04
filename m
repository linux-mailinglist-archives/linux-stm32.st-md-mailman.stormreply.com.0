Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13244770893
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 21:06:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B631BC6B466;
	Fri,  4 Aug 2023 19:06:53 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA90CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 19:06:52 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-31768ce2e81so2146824f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Aug 2023 12:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691176012; x=1691780812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+mKs9GVqXrgLKiydu37dkxuWRwX9m6vUvXBGA4iGEQ=;
 b=pJXcyaij59wykiKOA9tCEB8S4gg3Z1GHrOT8L9w9quvTeK3CJwd93TcMmgeH9qsTmX
 jA5YMPXtem49OKIeZuBW/B7z7dS8WFJdH65DKww5XyYHLXhgTnbsAwscbEHTb6mbtrZZ
 BZa8BIBGOH4Q+SkpavEdH0otXnzRijACuCopeESvO+XHcmL3ZXNW9EGslJl77px9Boeb
 GqQnVqw0k6HMm2l7+XHIGKAPYRVqgCsnRSsJE1fnLs2Nj797U07C0NurMSGCn8/yNgCc
 lDyCVZnGxxnzNo6RW2GsgNpucmHIvVKiEjxprA51NTiam2O4cd25vg7MKR2tt8ini3Xu
 IdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691176012; x=1691780812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+mKs9GVqXrgLKiydu37dkxuWRwX9m6vUvXBGA4iGEQ=;
 b=TCw6Amodt0tsx5GeG5O8OK2fQcBFnSSoH4yAi5ST3JUPdz8UtYbaRH8TDGOySs/GTW
 blucNCtmfg/U/FX5A0SnMcwe9z+3FfK6ZgAfwjy3obwC5+xWSSN9GeFAV0Q6d3AaRrl8
 3ubgCBR+YHCjjMS0NPu9YMDmPI3tlCzakNzePEXz8iFZOpZ9gpZiELyHYDf39M8nr9go
 6+SkSCbniMYymjTtOdUX60GC6QYlHmio36jRZ87zhSoowCRk8Z5g/R5BnV2dbf7Cz3qi
 oIqasuRPHVuNE5XXJz8OsJcqLDRDMP28ECgPQ7gzYah3bSC3jFpBKs3BTlARMKEpysL+
 LL8A==
X-Gm-Message-State: AOJu0Yw9QlWXoy7Gjm0wYXDkxF4zxNxSUNI03bwLuvVGGY+oVVRymhTC
 OFJ1xsaH5edfeSMCVtVTQvw=
X-Google-Smtp-Source: AGHT+IHpybGIS5pubkiM9vt8iNkqlu2gS6LosaHfJR1MT91WNa9XG7Bef9hWZF/8p1yMJF9KzrDRaA==
X-Received: by 2002:a5d:4a4a:0:b0:317:6175:95fd with SMTP id
 v10-20020a5d4a4a000000b00317617595fdmr1855584wrs.43.1691176011920; 
 Fri, 04 Aug 2023 12:06:51 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233]) by smtp.gmail.com with ESMTPSA id
 x12-20020adfec0c000000b0031274a184d5sm3143402wrn.109.2023.08.04.12.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 12:06:51 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 04 Aug 2023 21:06:45 +0200
Message-ID: <4820522.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-staging@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-riscv@lists.infradead.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Jerome Brunet <jbrunet@baylibre.com>, Luca Weiss <luca@z3ntu.xyz>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Michael Walle <michael@walle.cc>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Alex Elder <elder@kernel.org>, Alexander Shiyan <shc_work@mail.ru>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 Hector Martin <marcan@marcan.st>, Heiko Stuebner <heiko@sntech.de>,
 Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH v2 1/2] pwm: Manage owner assignment
	implicitly for drivers
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Dne petek, 04. avgust 2023 ob 16:27:06 CEST je Uwe Kleine-K=F6nig napisal(a=
):
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
> =

> The upside is that new lowlevel drivers cannot forget the assignment and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>  drivers/leds/rgb/leds-qcom-lpg.c      |  1 -
>  drivers/pwm/core.c                    | 24 ++++++++++++++----------
>  drivers/pwm/pwm-ab8500.c              |  1 -
>  drivers/pwm/pwm-apple.c               |  1 -
>  drivers/pwm/pwm-atmel-hlcdc.c         |  1 -
>  drivers/pwm/pwm-atmel-tcb.c           |  1 -
>  drivers/pwm/pwm-atmel.c               |  1 -
>  drivers/pwm/pwm-bcm-iproc.c           |  1 -
>  drivers/pwm/pwm-bcm-kona.c            |  1 -
>  drivers/pwm/pwm-bcm2835.c             |  1 -
>  drivers/pwm/pwm-berlin.c              |  1 -
>  drivers/pwm/pwm-brcmstb.c             |  1 -
>  drivers/pwm/pwm-clk.c                 |  1 -
>  drivers/pwm/pwm-clps711x.c            |  1 -
>  drivers/pwm/pwm-cros-ec.c             |  1 -
>  drivers/pwm/pwm-dwc.c                 |  1 -
>  drivers/pwm/pwm-ep93xx.c              |  1 -
>  drivers/pwm/pwm-fsl-ftm.c             |  1 -
>  drivers/pwm/pwm-hibvt.c               |  1 -
>  drivers/pwm/pwm-img.c                 |  1 -
>  drivers/pwm/pwm-imx-tpm.c             |  1 -
>  drivers/pwm/pwm-imx1.c                |  1 -
>  drivers/pwm/pwm-imx27.c               |  1 -
>  drivers/pwm/pwm-intel-lgm.c           |  1 -
>  drivers/pwm/pwm-iqs620a.c             |  1 -
>  drivers/pwm/pwm-jz4740.c              |  1 -
>  drivers/pwm/pwm-keembay.c             |  1 -
>  drivers/pwm/pwm-lp3943.c              |  1 -
>  drivers/pwm/pwm-lpc18xx-sct.c         |  1 -
>  drivers/pwm/pwm-lpc32xx.c             |  1 -
>  drivers/pwm/pwm-lpss.c                |  1 -
>  drivers/pwm/pwm-mediatek.c            |  1 -
>  drivers/pwm/pwm-meson.c               |  1 -
>  drivers/pwm/pwm-microchip-core.c      |  1 -
>  drivers/pwm/pwm-mtk-disp.c            |  1 -
>  drivers/pwm/pwm-mxs.c                 |  1 -
>  drivers/pwm/pwm-ntxec.c               |  1 -
>  drivers/pwm/pwm-omap-dmtimer.c        |  1 -
>  drivers/pwm/pwm-pca9685.c             |  1 -
>  drivers/pwm/pwm-pxa.c                 |  1 -
>  drivers/pwm/pwm-raspberrypi-poe.c     |  1 -
>  drivers/pwm/pwm-rcar.c                |  1 -
>  drivers/pwm/pwm-renesas-tpu.c         |  1 -
>  drivers/pwm/pwm-rockchip.c            |  1 -
>  drivers/pwm/pwm-rz-mtu3.c             |  1 -
>  drivers/pwm/pwm-samsung.c             |  1 -
>  drivers/pwm/pwm-sifive.c              |  1 -
>  drivers/pwm/pwm-sl28cpld.c            |  1 -
>  drivers/pwm/pwm-spear.c               |  1 -
>  drivers/pwm/pwm-sprd.c                |  1 -
>  drivers/pwm/pwm-sti.c                 |  1 -
>  drivers/pwm/pwm-stm32-lp.c            |  1 -
>  drivers/pwm/pwm-stm32.c               |  1 -
>  drivers/pwm/pwm-stmpe.c               |  1 -
>  drivers/pwm/pwm-sun4i.c               |  1 -

For sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/pwm/pwm-sunplus.c             |  1 -
>  drivers/pwm/pwm-tegra.c               |  1 -
>  drivers/pwm/pwm-tiecap.c              |  1 -
>  drivers/pwm/pwm-tiehrpwm.c            |  1 -
>  drivers/pwm/pwm-twl-led.c             |  2 --
>  drivers/pwm/pwm-twl.c                 |  2 --
>  drivers/pwm/pwm-visconti.c            |  1 -
>  drivers/pwm/pwm-vt8500.c              |  1 -
>  drivers/pwm/pwm-xilinx.c              |  1 -
>  drivers/staging/greybus/pwm.c         |  1 -
>  include/linux/pwm.h                   | 10 ++++++----



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
