Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4F4854983
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 13:49:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12E60C62EFE;
	Wed, 14 Feb 2024 12:49:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F7EEC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707914993; x=1739450993;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VfFo/DkZzmeQyKntjmarBqvTj2pcgH+G7HGM6HxEwSk=;
 b=C+SZyq4J6dxhznCmpkjvmy+MGaS5U2l5nRx41CS0BLupO3iyoLrQFtwq
 BJ09p4KhLgY1jnrwB1UvVd/cr+/uFKMg8mPOLVrZXfn2kkoMCnjOyMVys
 06ITgTPSgxPSmfeWTFBJG7eCjyYBFeuxTUCEBvOfb64cu+vpEueacGcrj
 3XhvfcA4wDySrKdmAEZ4QNUixarqaXNbxHtaEZqhWjddpMqbbk2gJ/tC/
 +sqKqTgMDSRE2B4d0lgr1zoaUokl0Qpr+J0uNWNGJ7DDFtKyEtFriPBju
 2HJ5FxWp2mk06ybPvs0bdG4n64d367N2BjZP3ySQAQgmGzuJAU2p+mlJk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1809725"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1809725"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 04:49:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="912083870"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="912083870"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 04:49:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1raEhb-00000004UXT-0JCa; Wed, 14 Feb 2024 14:49:27 +0200
Date: Wed, 14 Feb 2024 14:49:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Zcy21tsntcK80hef@smile.fi.intel.com>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Pavel Machek <pavel@ucw.cz>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-samsung-soc@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Anderson <sean.anderson@seco.com>,
 Benson Leung <bleung@chromium.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Michal Simek <michal.simek@amd.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-leds@vger.kernel.org,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 linux-pwm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Sven Peter <sven@svenpeter.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Orson Zhai <orsonzhai@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexander Shiyan <shc_work@mail.ru>, Scott Branden <sbranden@broadcom.com>,
 linux-gpio@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Hector Martin <marcan@marcan.st>,
 linux-stm32@st-md-mailman.stormreply.com,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>
Subject: Re: [Linux-stm32] [PATCH v6 003/164] pwm: Provide pwmchip_alloc()
 function and a devm variant of it
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

On Wed, Feb 14, 2024 at 10:30:50AM +0100, Uwe Kleine-K=F6nig wrote:
> This function allocates a struct pwm_chip and driver data. Compared to
> the status quo the split into pwm_chip and driver data is new, otherwise
> it doesn't change anything relevant (yet).
> =

> The intention is that after all drivers are switched to use this
> allocation function, its possible to add a struct device to struct
> pwm_chip to properly track the latter's lifetime without touching all
> drivers again. Proper lifetime tracking is a necessary precondition to
> introduce character device support for PWMs (that implements atomic
> setting and doesn't suffer from the sysfs overhead of the /sys/class/pwm
> userspace support).
> =

> The new function pwmchip_priv() (obviously?) only works for chips
> allocated with pwmchip_alloc().

...

> +#define PWMCHIP_ALIGN ARCH_DMA_MINALIGN
> +
> +static void *pwmchip_priv(struct pwm_chip *chip)
> +{
> +	return (void *)chip + ALIGN(sizeof(*chip), PWMCHIP_ALIGN);
> +}

Why not use dma_get_cache_alignment() ?

...

> +/* This is the counterpart to pwmchip_alloc */

pwmchip_alloc()

...

> +EXPORT_SYMBOL_GPL(pwmchip_put);

> +EXPORT_SYMBOL_GPL(pwmchip_alloc);

> +EXPORT_SYMBOL_GPL(devm_pwmchip_alloc);

Are these exported via namespace? If no, can they be from day 1?

...

> +static inline void pwmchip_put(struct pwm_chip *chip)
> +{
> +}

Can be one line, but it's up to the present style in this header.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
