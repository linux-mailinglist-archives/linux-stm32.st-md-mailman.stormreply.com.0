Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A844C9B6
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 20:52:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26F55C5EC70;
	Wed, 10 Nov 2021 19:52:26 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 499B5CFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 19:52:25 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so5589323otl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 11:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=idiDHIx887w76Be1+DoMm+DC/fAFpYxmnW+2ngUk+Lw=;
 b=7An2zXvZpMKbSODoC4U4+8W1qSiPkLNOktYwGnUZ182rgMBBlyZ5GKdQdiHfGLaV+t
 yfrES21sYtEpYvaImT73SLX11FQde+F1zHO4zfY0R2RCfsGh0OSeabz4B7xaGAxwyccu
 M11eDS1/KOu+jXPEcKinuFmnYuHOjsqMhbDWbjHQ/YGCiw0k+UC1NODQOGt4l/5gDSt0
 xPM1UULzPlqC+fiqvJYuKHMU0GxaJNQNycFttk7qiPFAq4laVKPJMfpgyiGk5TVIJ5H7
 zoVT2aYyaYk7OtxfpB0gVA5y2seIlQZQwM+tD5dxgtI7zTzctmGT92ewwKFsPFw3l62t
 n2oQ==
X-Gm-Message-State: AOAM530fyKhPd5TszIusbeKK/v/xXad11Qki1PGLiqT3YZ6Vj/M/D6PI
 ++3pxcRBymdOll8cGdTWzA==
X-Google-Smtp-Source: ABdhPJybq9LO3rX5SokDCkXN9j6OMCOI/V0Dfx02D+RWZ3KXqjzTHAnpYpaSp6MZwgVF6u6l3jseFQ==
X-Received: by 2002:a9d:7586:: with SMTP id s6mr1448044otk.158.1636573944136; 
 Wed, 10 Nov 2021 11:52:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k4sm168568oij.54.2021.11.10.11.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:52:23 -0800 (PST)
Received: (nullmailer pid 1856875 invoked by uid 1000);
 Wed, 10 Nov 2021 19:52:20 -0000
Date: Wed, 10 Nov 2021 13:52:20 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <YYwi9P3b4tBmFVyv@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-6-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-6-patrice.chotard@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jassi Brar <jassisinghbrar@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Guenter Roeck <linux@roeck-us.net>, ohad ben-cohen <ohad@wizery.com>,
 linux-pm@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-spi@vger.kernel.org, linux-crypto@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 david airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, lars-peter clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, stephen boyd <sboyd@kernel.org>,
 pascal Paillet <p.paillet@foss.st.com>,
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, jonathan cameron <jic23@kernel.org>,
 linux-iio@vger.kernel.org, michael turquette <mturquette@baylibre.com>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 baolin wang <baolin.wang7@gmail.com>, "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, Marc Zyngier <maz@kernel.org>,
 herbert xu <herbert@gondor.apana.org.au>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, daniel vetter <daniel@ffwll.ch>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 5/5] dt-bindings: treewide: Update
 @st.com email address to @foss.st.com
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

On Wed, 10 Nov 2021 16:01:44 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Not all @st.com email address are concerned, only people who have
> a specific @foss.st.com email will see their entry updated.
> For some people, who left the company, remove their email.
> 
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Lionel Debieve <lionel.debieve@foss.st.com>
> Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> Cc: Ludovic Barre <ludovic.barre@foss.st.com>
> Cc: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: pascal Paillet <p.paillet@foss.st.com>
> Cc: Erwan Le Ray <erwan.leray@foss.st.com>
> Cc: Philippe CORNU <philippe.cornu@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Acked-By: Vinod Koul <vkoul@kernel.org>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/arm/sti.yaml                | 2 +-
>  Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml     | 4 ++--
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml        | 4 ++--
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml        | 2 +-
>  Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml  | 2 +-
>  Documentation/devicetree/bindings/crypto/st,stm32-crc.yaml    | 2 +-
>  Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml   | 2 +-
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml   | 2 +-
>  .../devicetree/bindings/display/bridge/snps,dw-mipi-dsi.yaml  | 2 +-
>  .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml | 2 +-
>  .../devicetree/bindings/display/panel/raydium,rm68200.yaml    | 2 +-
>  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml   | 4 ++--
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml  | 4 ++--
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml    | 2 +-
>  Documentation/devicetree/bindings/dma/st,stm32-mdma.yaml      | 2 +-
>  .../devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml       | 2 +-
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>  .../devicetree/bindings/iio/adc/sigma-delta-modulator.yaml    | 2 +-
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml   | 2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++--
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml   | 2 +-
>  .../bindings/interrupt-controller/st,stm32-exti.yaml          | 4 ++--
>  Documentation/devicetree/bindings/mailbox/st,stm32-ipcc.yaml  | 4 ++--
>  Documentation/devicetree/bindings/media/st,stm32-cec.yaml     | 2 +-
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 2 +-
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml    | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stmfx.yaml           | 2 +-
>  Documentation/devicetree/bindings/mfd/st,stpmic1.yaml         | 2 +-
>  Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml | 2 +-
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml         | 2 +-
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml        | 4 ++--
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml   | 2 +-
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 2 +-
>  .../devicetree/bindings/regulator/st,stm32-booster.yaml       | 2 +-
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml       | 2 +-
>  .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 2 +-
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml        | 4 ++--
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml       | 2 +-
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml       | 2 +-
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 2 +-
>  Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml   | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml     | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml     | 2 +-
>  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml | 2 +-
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml      | 4 ++--
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 4 ++--
>  .../devicetree/bindings/thermal/st,stm32-thermal.yaml         | 2 +-
>  Documentation/devicetree/bindings/usb/st,stusb160x.yaml       | 2 +-
>  Documentation/devicetree/bindings/watchdog/st,stm32-iwdg.yaml | 4 ++--
>  53 files changed, 65 insertions(+), 65 deletions(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
