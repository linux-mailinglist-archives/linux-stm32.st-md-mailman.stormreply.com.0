Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC0B454F6
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 12:42:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E330C35E2E;
	Fri,  5 Sep 2025 10:42:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A43EC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 10:42:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC3D940C45;
 Fri,  5 Sep 2025 10:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C01C4CEF1;
 Fri,  5 Sep 2025 10:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757068955;
 bh=+I+6Ob8PFYzlZ0UQk3wSgdfHmrOiugnSzIZKb8fhQEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FJb78JN9Aubn7l+hWFWK2KhL4xncFQiznSU1O+VqVeYoJWONHp4RcAOCsvHduuTfN
 +nudQ518QxKtrWwCOfBIzTxEEJAGpU/jUCrDlsuwWXRXBBl2j3vBt1Ltw4szB1n87y
 h7x6GKYVobYJ3QTWpsrKBMfGZ15EnA7yYfTpXWUhfEXV1WWfuuJ0vS7hs6fM/OGabb
 EOWmFuoLcS3oeA8aB09KPBnxvbJrH5hUgrl3aMa2r81N5UzhAZ8Ke81VM3YcHVbnvU
 RJi3JEAJOsT+TM9h+WPDYgQX6anuQ91U155dHwC08dgE3WTQvlLfDX33vEVEuA2/m4
 2N9AdUNBEKQBA==
Date: Fri, 5 Sep 2025 11:42:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Xichao Zhao <zhao.xichao@vivo.com>
Message-ID: <2f060139-7446-4cb1-910d-791918b28f51@sirena.org.uk>
References: <20250905072423.368123-1-zhao.xichao@vivo.com>
 <20250905072423.368123-5-zhao.xichao@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20250905072423.368123-5-zhao.xichao@vivo.com>
X-Cookie: He who laughs, lasts.
Cc: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 David Lechner <dlechner@baylibre.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 Guenter Roeck <linux@roeck-us.net>, Masami Hiramatsu <mhiramat@kernel.org>,
 "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Eduardo Valentin <edubezval@gmail.com>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Markus Mayer <mmayer@broadcom.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Talel Shenhar <talel@amazon.com>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>, Andy Shevchenko <andy@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Keerthy <j-keerthy@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 04/12] regulator: max8973: Remove
 redundant error log prints
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
Content-Type: multipart/mixed; boundary="===============3810693663543023230=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3810693663543023230==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSBr52yOin/qCY9V"
Content-Disposition: inline


--hSBr52yOin/qCY9V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2025 at 03:23:56PM +0800, Xichao Zhao wrote:
> devm_thermal_of_zone_register() prints error log messages when
> it fails, so there is no need to print error log messages again.

Acked-by: Mark Brown <broonie@kernel.org>

--hSBr52yOin/qCY9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi6vocACgkQJNaLcl1U
h9A9Ggf8DfcaSZB9QDgKG3CTzMYN6dA03Qdzw6VmLM9o81xSSlRvqsWSYEm0G86q
z/jyW0esF1zaS9pQ+ni9mgIUQQvCBr6/d1pY2UJpJd3z1xw2eJUWIgNHIfLsaKDk
ZIixofNJ8unn3ayIaYKW6fWIhZcoMRY+yXMtvdtUD2vxzMFOerQ1dFKakBEsu9Nj
JTQTup0slsEXR1tzi/4HBQfftUi+24MUDaRkOnfPfOn1D5gmUaZ6c07B1fGp9dmM
5c73MTNcN3xonK265AHjzWrgi4sJoXEeqfN7SmvHqspnq6df5zHeKUvFD9Jx+lEw
n/HlWMMkt3wAlpDVMMsmqqlWaSrGcA==
=sWAM
-----END PGP SIGNATURE-----

--hSBr52yOin/qCY9V--

--===============3810693663543023230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3810693663543023230==--
