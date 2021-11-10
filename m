Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3289644C989
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 20:51:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFD44C5EC70;
	Wed, 10 Nov 2021 19:51:08 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A74CCCFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 19:51:07 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 l7-20020a0568302b0700b0055ae988dcc8so5514951otv.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 11:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IaGtHvG6f2Nq9zdI9Tpc3bPF147EUDcHeqfU5NOs8/A=;
 b=LgSObteLgKgBciKPqOqhnsXqkXxOSoSq1G1msOikE1LAaxW/vIbYkCChnOZudAwBSw
 orWfyN5aTPfSPxp53Oyowb5asct4Y30rcyrZDiBw3VJjG7ZCSA3S6Epi8UBx8wVmDrrg
 7ZVgKbJ/hWs41zPXDU0lBCPc9sTqvELLzkt+2V1BNFcelZ0HFyHmMqXU7yHdNRq5gwAB
 J68xOPmADfgEw/YTZy3TdDZKYp3yecKDeCjnVLNZG1/Hpr2i7ylteQVm1nChYTSDd+2V
 f3DPBhLDh1w5AmsboXGoyr3lzCRuViS1oJBy7rjdozYQaINtTZADNq/Abzvy87oStn0j
 4aUA==
X-Gm-Message-State: AOAM53323pCGpnvaDsxfEFE4gGCLDxRuWx5pRQu4X/AdD49EiarPA0Mc
 JY/Eg/lcCLOjMKrwndqBCA==
X-Google-Smtp-Source: ABdhPJyoqzCKoO1mccILtZ9+sI1239ZXZq43Cb4nIbMhmS7HoNW5DY3iPPKtMi57BRAkrSAOfgsptg==
X-Received: by 2002:a9d:6854:: with SMTP id c20mr1506260oto.190.1636573866562; 
 Wed, 10 Nov 2021 11:51:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q44sm190616otv.80.2021.11.10.11.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:51:05 -0800 (PST)
Received: (nullmailer pid 1849495 invoked by uid 1000);
 Wed, 10 Nov 2021 19:51:02 -0000
Date: Wed, 10 Nov 2021 13:51:02 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Message-ID: <YYwipuVeW+U9LgXa@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-4-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-4-patrice.chotard@foss.st.com>
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
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-crypto@vger.kernel.org, alsa-devel@alsa-project.org,
 david airlie <airlied@linux.ie>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
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
 Amit Kucheria <amitk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 linux-phy@lists.infradead.org, sam ravnborg <sam@ravnborg.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
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
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 dillon min <dillon.minfei@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 netdev@vger.kernel.org, yannick fertre <yannick.fertre@foss.st.com>,
 vinod koul <vkoul@kernel.org>, daniel vetter <daniel@ffwll.ch>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/5] dt-bindings: media: Update
 maintainers for st, stm32-cec.yaml
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

On Wed, 10 Nov 2021 16:01:42 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, remove his name from maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-cec.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
