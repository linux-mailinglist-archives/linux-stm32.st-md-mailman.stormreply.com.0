Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3693423EC93
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Aug 2020 13:33:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E567EC36B3A;
	Fri,  7 Aug 2020 11:33:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D39A8C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Aug 2020 11:33:56 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76A9221744;
 Fri,  7 Aug 2020 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596800035;
 bh=EMH/rpG5GgAoo0E4h69GGp2clEh0+xJ/Es2GJrNlakQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uNSXAb213aRYOI4p6KThK0R6c0zjIBKU+M9Fbfxrh4AjSmJJow5vIkzwbAMTRug0c
 k6AwZPssxCrsVcDbVNSHkAsvOMjpGb8xJ5BxsSVZPQkya/1D9AsMkBYAi8YO3ElMeo
 I0omKl9CJt/XAdPo35P8mDR1GZcksiUcjZKuBPck=
Date: Fri, 7 Aug 2020 12:33:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200807113330.GC5435@sirena.org.uk>
References: <20200806181932.2253-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Russell King <linux@armlinux.org.uk>, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Andi Shyti <andi@etezian.org>,
 Jason Cooper <jason@lakedaemon.net>, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-fbdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mmc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 alsa-devel@alsa-project.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-input@vger.kernel.org, linux-clk@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH v2 00/41] spi / fbdev / cpufreq / usb /
 mmc / hwmon / ARM: Prepare for multiplatform S3C
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
Content-Type: multipart/mixed; boundary="===============1482560293465380122=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1482560293465380122==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ncSAzJYg3Aa9+CRW"
Content-Disposition: inline


--ncSAzJYg3Aa9+CRW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2020 at 08:19:32PM +0200, Krzysztof Kozlowski wrote:

> I intend to take it through Samsung SoC tree so all Acks are welcomed.

Any issue with me applying the ASoC bits and sending you a branch?  This
seems like it might run into some of the subsystem wide cleanups we've
got going on.

--ncSAzJYg3Aa9+CRW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tPAoACgkQJNaLcl1U
h9ALrwf+KZAjsQtFvrjZaItEWb3sRhI1J89Qn9P11Ip3UWCcQGbI2gxICttpG+8L
CTgI0cvmg6Gi1qmTb9hBL0NoaHXegLZCYlU8Ihb7C5L5NW1YmPt27OlXPVseR4vY
JzUmPWLTz/WZjKu/cPr3D+57sgeb7UxIyo5WOkAiay6qnqCb5y3zfFVkVx//gJAw
6joeeiegM3L0a4MQwV84WQtD/ygF8cInCx5dALetxU2e5Bh1Gow3dZUKty+5k+o5
cfT3ahiZTNOVmoWOkVkN7K0KSfSv9hcJM7klhFzerGOwX29Zblgo4ruMHHwEx1RU
gsZEtshX07ihXINpTYruaObjgrgpQw==
=wTm8
-----END PGP SIGNATURE-----

--ncSAzJYg3Aa9+CRW--

--===============1482560293465380122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1482560293465380122==--
