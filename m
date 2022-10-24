Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDA60A7E9
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Oct 2022 15:00:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBEA8C03FC6;
	Mon, 24 Oct 2022 13:00:37 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33232C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 13:00:36 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-13ba9a4430cso3010000fac.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Oct 2022 06:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p+x9joGdXdBFLPPxN1p6d7/jrm+b1E7zu0ZikUl9XbM=;
 b=yfEwyDl89XgJQghAGXOeIrRtoyZolcLGK0uJpeMcRUlq5rxIO5MBASei2quve5L8y2
 9zFA8JxKswyI112TzgxUqpwgbeZaLikrmKzXetUga0BfyUE+nEm7/2OoGs/W+9ss1FWN
 jfRrp2ETRxFr7xR9ScMnh5jmQnlGdI4P0YfpBaxEd6u1fnKoZRyC4UfIzQEjNCBlUiZr
 FX6nvlRiZ6Wq4B4cq19I71BIOqaBIBXsZwqtwMKX3a0NXq5xQHDUgzQegzHwhaUmgS1p
 yHhZnN85Pbk8Ho8TCAzGxpbVKUZ26hx1oy948C9vfaKlzMmel6K1Ios491lqqtwk8HUx
 H7YA==
X-Gm-Message-State: ACrzQf3ioEyRfHltF3qgtMJZWSKhFmDwfO39NHv2Fm8uCB0MuNHhD/Fc
 2Ih0Le5ftuRAKOf60CveMQ==
X-Google-Smtp-Source: AMsMyM4RB1x55W7tWXLqKMCfn9+yNGKoyP28eeDXqoWuK46CSg7FurAIxSSG6961lNUtLuCZU2W88g==
X-Received: by 2002:a05:6870:e9a8:b0:133:223f:49a1 with SMTP id
 r40-20020a056870e9a800b00133223f49a1mr38235091oao.114.1666616434841; 
 Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g20-20020a056870c15400b0012796e8033dsm2716705oad.57.2022.10.24.06.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: (nullmailer pid 1652638 invoked by uid 1000);
 Mon, 24 Oct 2022 13:00:35 -0000
Date: Mon, 24 Oct 2022 08:00:35 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20221024130035.GA1645003-robh@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/21] ARM: s3c: clean out obsolete
	platforms
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

On Fri, Oct 21, 2022 at 10:22:28PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

[...]

>  Documentation/arm/index.rst                   |    1 -
>  Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
>  .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
>  Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
>  Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
>  Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
>  Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
>  .../arm/samsung-s3c24xx/overview.rst          |  311 ---
>  Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
>  Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
>  .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
>  Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
>  .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
>  Documentation/arm/samsung/overview.rst        |   13 -

What about?:

Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
Documentation/devicetree/bindings/mmc/samsung,s3cmci.txt
Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
