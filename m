Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 991AECD9EFE
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Dec 2025 17:24:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B737C8F271;
	Tue, 23 Dec 2025 16:24:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA2C0C030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 16:24:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CBB0660123;
 Tue, 23 Dec 2025 16:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0240C113D0;
 Tue, 23 Dec 2025 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766507078;
 bh=3qVOvSQIWwScePELLmWnd91+x+FO0ghrlMNcQT2LZbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YxocYG+qrFsexKvWp8UnmdmobfpsDyH7P1+YJTEa2MYESPoFxhafpM8gsfi6cIU1R
 n9Gfg1fwPKTG1mVszIKw6gD/hi1FUHPlichzp8hHC1c+ODcPI9IBtiK3ysngVX/8kW
 6qtUsjPhga/f+L4DCnVAi/486vh+xUTx4zZGQNwJ3DsWuw1m/H07s9A63d0isPWvAn
 xfv73Q5cyzS9PAQGwA0vuOAt9j1S+Rh8W8c92InWjFECnByviZpnF8o0xVzvH73G+F
 Ou0DXgasgqiym6+NqEvExYrZ1OZI3ZKfz52X4AGZYCiiAOFPgWM25YiaBJBeAweuxD
 6BLkrF9xDKKgg==
Date: Tue, 23 Dec 2025 21:54:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <aUrCQu-wmQ7gOyD3@vaman>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-phy@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 linux-hwmon@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Hans de Goede <hansg@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] iio: inkern: Use namespaced exports
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

On 09-12-25, 09:25, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> This will make it easier to manage the IIO export surface. Consumer drivers
> will only be provided access to a specific set of functions, thereby
> restricting usage of internal IIO functions by other parts of the kernel.
> 
> This change cannot be split into several parts without breaking
> bisectability, thus all of the affected drivers are modified at once.
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  drivers/extcon/extcon-adc-jack.c                |  1 +
>  drivers/hwmon/iio_hwmon.c                       |  1 +
>  drivers/hwmon/ntc_thermistor.c                  |  1 +
>  drivers/iio/adc/envelope-detector.c             |  1 +
>  drivers/iio/afe/iio-rescale.c                   |  1 +
>  drivers/iio/buffer/industrialio-buffer-cb.c     |  1 +
>  drivers/iio/buffer/industrialio-hw-consumer.c   |  1 +
>  drivers/iio/dac/ad8460.c                        |  1 +
>  drivers/iio/dac/dpot-dac.c                      |  1 +
>  drivers/iio/inkern.c                            | 54 ++++++++++++-------------
>  drivers/iio/light/cm3605.c                      |  1 +
>  drivers/iio/light/gp2ap002.c                    |  1 +
>  drivers/iio/multiplexer/iio-mux.c               |  1 +
>  drivers/iio/potentiostat/lmp91000.c             |  1 +
>  drivers/input/joystick/adc-joystick.c           |  1 +
>  drivers/input/keyboard/adc-keys.c               |  1 +
>  drivers/input/touchscreen/colibri-vf50-ts.c     |  1 +
>  drivers/input/touchscreen/resistive-adc-touch.c |  1 +
>  drivers/phy/motorola/phy-cpcap-usb.c            |  1 +

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
