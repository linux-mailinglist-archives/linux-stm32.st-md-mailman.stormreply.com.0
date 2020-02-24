Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F14B316AE70
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2020 19:14:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A552DC36B0B;
	Mon, 24 Feb 2020 18:14:47 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E187C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 18:14:45 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b3so9583269otp.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 10:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4nmmGful+MegUr8aRgRCB1gCieEuCvrSiIBlqsABDmE=;
 b=fL+SAh+UlkNOMY+tDqTHMz3PzNJZiXIqCuI+A+Yi2ujLh0ZecAGXesXf5ySp1GXnqY
 2MHhMucMQqCbYnkma9NTsfHSRaNlICPJB5Vgsyh/wd+04e7WWKFVyC4dK04XgCBWh4qJ
 r2aPSeidg7vMAcwglaRB6ttAQAycL3wEX4LPIT7oO8Sr1gUenZCt1TE+cJk+OP9/kMJb
 aTZ/p+9cyyJ5VEHRCiIts0tgTvqSXZMjY4obFOmSFP57sOJl2F+xe06+agyc9aV/yzgE
 oQtSPL4y4uRizQqXfWF2dlmsWsszoQI7aS3f77vUmTPwMVD8ljs438po8xKvxbzvD3sf
 4QLg==
X-Gm-Message-State: APjAAAXuNO0tvcsuYLKMbteQwoo12VG+oQgiowJ6AaRQGc4Nr+bExZBa
 xVmQFVAujbSR144nIZ2tGw==
X-Google-Smtp-Source: APXvYqzSAV62BhNi363gv0daEbhuDKzBdde3JmEZAlbjVYZ9GcAmP/tY+ZpDRe7P2Ti1DpLoIK6ciQ==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr29162204oto.135.1582568083899; 
 Mon, 24 Feb 2020 10:14:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 60sm4761700otu.45.2020.02.24.10.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 10:14:43 -0800 (PST)
Received: (nullmailer pid 24218 invoked by uid 1000);
 Mon, 24 Feb 2020 18:14:41 -0000
Date: Mon, 24 Feb 2020 12:14:41 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200224181441.GA23262@bogus>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stuart Yoder <stuyoder@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Amit Kucheria <amit.kucheria@verdurent.com>,
 linux-aspeed@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Joel Stanley <joel@jms.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 linux-gpio@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Andy Gross <agross@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [Linux-stm32] [PATCH 2/7] docs: dt: fix several broken
 references due to renames
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

On Sat, Feb 22, 2020 at 10:00:02AM +0100, Mauro Carvalho Chehab wrote:
> Several DT references got broken due to txt->yaml conversion.
> 
> Those are auto-fixed by running:
> 
> 	scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,scmi.txt        | 2 +-
>  Documentation/devicetree/bindings/arm/arm,scpi.txt        | 2 +-
>  .../devicetree/bindings/arm/bcm/brcm,bcm63138.txt         | 2 +-
>  .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt  | 2 +-
>  .../devicetree/bindings/arm/msm/qcom,idle-state.txt       | 2 +-
>  Documentation/devicetree/bindings/arm/omap/mpu.txt        | 2 +-
>  Documentation/devicetree/bindings/arm/psci.yaml           | 2 +-
>  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml       | 2 +-
>  .../devicetree/bindings/display/tilcdc/tilcdc.txt         | 2 +-
>  Documentation/devicetree/bindings/leds/common.yaml        | 2 +-
>  .../devicetree/bindings/leds/register-bit-led.txt         | 2 +-
>  .../devicetree/bindings/memory-controllers/ti/emif.txt    | 2 +-
>  Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt   | 2 +-
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml          | 2 +-
>  .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml  | 2 +-
>  .../devicetree/bindings/reset/st,stm32mp1-rcc.txt         | 2 +-
>  .../devicetree/bindings/thermal/brcm,avs-ro-thermal.yaml  | 2 +-
>  MAINTAINERS                                               | 8 ++++----
>  20 files changed, 23 insertions(+), 23 deletions(-)

Applied.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
