Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 194D2305363
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Jan 2021 07:47:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C11CBC57183;
	Wed, 27 Jan 2021 06:47:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6424CC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 06:47:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EB692072C;
 Wed, 27 Jan 2021 06:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611730042;
 bh=SMf/sTVmFizoaTCRhZKOzJIDd9pG2drSndbHjehSYHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eIxDYowELLXJdzjiGwaNPG2hkaUmupGzw2zEemwVvQomvLqzMvseCF/SkUiqZIduO
 Gvf8oKij0ja051ihFnNxn1vEEmr2V7Rezxly/hz1a2DfgLLDiHYVnu7ywJbmKoZ/1n
 jTjUvD1r6r/xOuNkE/io5HVCc6JZfMxpD46Zw0pDJW3S6qcXerAxfVIO9YzZfcx8BZ
 7abmVKMgGR50oOPfV4GFaWENi4Ss/oJanPtz4wNs5YcT6fz7mNssNUbap4x9DqDp7k
 94/V6xmo4VOiVFFF3CTluEAGGxMwLkYC3YD81tj+qqyC0M53/29Mjt0KM9D41YabCf
 I2bnFL90rxHIw==
Date: Wed, 27 Jan 2021 07:47:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20210127064715.GA981@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Vinod Koul <vkoul@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210126165835.687514-5-u.kleine-koenig@pengutronix.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Eric Anholt <eric@anholt.net>, linux-i2c@vger.kernel.org,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 Vladimir Zapolskiy <vz@mleia.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 linux-watchdog@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Leo Yan <leo.yan@linaro.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [Linux-stm32] [PATCH v3 4/5] amba: Make the remove callback
	return void
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
Content-Type: multipart/mixed; boundary="===============0046266966598829263=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0046266966598829263==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline


--huq684BweRXVnRxX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 05:58:34PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> All amba drivers return 0 in their remove callback. Together with the
> driver core ignoring the return value anyhow, it doesn't make sense to
> return a value here.
>=20
> Change the remove prototype to return void, which makes it explicit that
> returning an error value doesn't work as expected. This simplifies changi=
ng
> the core remove callback to return void, too.
>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org> # for drivers/memory
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmARDG8ACgkQFA3kzBSg
KbZUgg/+MkBwxjwkME0XbCPEYMUsJ9F6QLP4gXXTqGleAgxMVqSLG5XG/rJgCfPv
BB3X116hBgVOZZBTz+uWxpOSy90WrhLh3HrOb/SGB6hmKn/a0fYdB2/YXhVOXKyN
OlhKbYBl0Ev0PM+m8xV4sr0sQYOn1wOs0NMHoMvmK+TlnCX1GDxHBVuElpNWo8Wj
/nFLnpq9eUGt+i4eAsKoTj/1l8Ak4cOihHe2cRWxVUC3NDRTJBL9HgZwD38wVl5v
u/iwGQG5Zram49KLbGoBFpd60hrifA1X3Cwx2qhwZ+cm/ks3n+NwIQPvpoRyJ8Ny
gK5+QKowfQvOtSP8PFC1QE/u+oLVpYJ4rVT3DmXddPj89l3Peo17VAS08AoPk3hO
McIAFelbN1FmcjCpZ0ELpjCo/G6S1pKx9uAtFLbbMf80CoREU5ucCPzzWbf9unQv
5xhIdK1xkszSC1kGjHABw1zBy/ZAEoy+x3yktPjX2nU1L8Ni/vKjR6+w27G7pspU
WZwk2lkCFEnt8gFnRI4MFhjGagpiyiEfq0QeD1O452zgZimiPvfKjMLnWArfWzF0
25EngNXoizDEZMYZX46drnzfUfIDKBVkCbj1CWcQLFivpp4pj7+7n4D5lJlgwNvE
kqhQNlLLFbibwI0LNt/LqCbC/SggaYOUfYQ8XefoTe0Z6dH/+J0=
=FyXm
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

--===============0046266966598829263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0046266966598829263==--
