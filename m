Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 484D944C99C
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 20:51:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EB20C5EC71;
	Wed, 10 Nov 2021 19:51:27 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66CA2C5EC6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 19:51:26 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so5586076otl.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 11:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ObzL7zoc4FaanTV0FRdsY2Jh7qTWU6rDhJWsEvGiEMQ=;
 b=fRVzvFmfKu1qnoRb6R2pty1K8x1gTsH3iEpSUznDNs8zPcd+wHNmzM1CcQPF+i4Fpw
 edhfFwTzA55afQyjSY5ceRRHWK3x1QKcDnV2VXse/lm7PlgOK7iDraYiY6ckKowa7wuY
 kNU1hDqOdLkAzO1W7IXqkcvnM8Mw8HMl9u1lBRF4y+JvWIoSvK8SuamClxkB5GfpeTsc
 iLBbTjjor3NGVx4wYFsoLgVvzDC6Z2inzMq1qI0xF40T01qFIeeUreoiVdOjeh1rT2Pi
 b3FGLKz0zjlj8rc7dCr5pUJo5LngCTAmYp4BzclOFlJW6scrcfRzqzutxI4UpAv4r5lW
 kkww==
X-Gm-Message-State: AOAM532ACErxwAuPLcen306YLhC7gTWcIe0u3d+1QvTDvhCveKjWK7tn
 O+WRAFUVmEx07Bi7hyVGEQ==
X-Google-Smtp-Source: ABdhPJyc+9+E+QZMI61J8RiueoqqJVjd5eWhNxneY0MS3rvPxMprKNWZtdE0NAi9tMvBLGJnnztoeA==
X-Received: by 2002:a9d:bf2:: with SMTP id 105mr1475029oth.21.1636573885318;
 Wed, 10 Nov 2021 11:51:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bb39sm213735oib.28.2021.11.10.11.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:51:24 -0800 (PST)
Received: (nullmailer pid 1851374 invoked by uid 1000);
 Wed, 10 Nov 2021 19:51:21 -0000
Date: Wed, 10 Nov 2021 13:51:20 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <YYwiuItyk2NtQC4v@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-5-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-5-patrice.chotard@foss.st.com>
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
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 alsa-devel@alsa-project.org, david airlie <airlied@linux.ie>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 thierry reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 lars-peter clausen <lars@metafoo.de>,
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
 Amit Kucheria <amitk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 linux-rtc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, baolin wang <baolin.wang7@gmail.com>,
 "david s . miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>,
 bjorn andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Lee Jones <lee.jones@linaro.org>,
 Marek Vasut <marex@denx.de>, herbert xu <herbert@gondor.apana.org.au>,
 Marc Zyngier <maz@kernel.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, daniel vetter <daniel@ffwll.ch>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/5] dt-bindings: media: Update
 maintainers for st, stm32-hwspinlock.yaml
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

On Wed, 10 Nov 2021 16:01:43 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, remove his name from maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
