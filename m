Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C70E0C9A72C
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 08:31:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FEA1C58D7A;
	Tue,  2 Dec 2025 07:31:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98F5EC57A52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 07:31:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 07D5A1A1EB5;
 Tue,  2 Dec 2025 07:31:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C3C60606E3;
 Tue,  2 Dec 2025 07:31:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 403D9103C8F04; Tue,  2 Dec 2025 08:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764660676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=gutkuk21iRBLBzb9hvOl6cUp6HFUU/VZ7OrEhTRZmwQ=;
 b=bY3TTYiSLFXa5B94KQgeAayt80JXK78ig76Aq2SyfufNuWcT41c/auFS4kPqbVeYIZlJKX
 QrXrN/qRIP4zNsj2m/7od8XOWVPza9ZQvvaa8nia4r3ByMuNdtTuF/t2v7gxBFCMMsW9RB
 i0p/8OBYWY3+n3FRUeyswfCRhz6Fv2at184ftP1FUUlpPAnLeFkqXVNSm5O6zbN24Wre4+
 N8LDjO5ty4mD4BpDEbuBV6eat2hrRdfThqf+Hnymm7a9OslgagnMsXhZ11fV4HVQz7RWeL
 AMcHDMFpAB93S2dU0dURDWQPs1MVtcc1ZnrYa/w6k4129RIITI9OMaZRIN58Wg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Kevin Tsai <ktsai@capellamicro.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hansg@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Casey Connolly <casey.connolly@linaro.org>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 David Lechner <dlechner@baylibre.com>
Date: Tue, 02 Dec 2025 08:30:58 +0100
Message-ID: <5948030.DvuYhMxLoT@fw-rgant>
In-Reply-To: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
 <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-hwmon@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-input@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] iio: inkern: Use namespaced exports
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
Content-Type: multipart/mixed; boundary="===============4964671484253052920=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4964671484253052920==
Content-Type: multipart/signed; boundary="nextPart6220005.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6220005.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
Date: Tue, 02 Dec 2025 08:30:58 +0100
Message-ID: <5948030.DvuYhMxLoT@fw-rgant>
In-Reply-To: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
MIME-Version: 1.0

On Monday, 1 December 2025 18:15:54 CET David Lechner wrote:
> On 12/1/25 4:59 AM, Romain Gantois wrote:
> > Use namespaced exports for IIO consumer API functions.
> > 
> > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> > ---
> 
> ...
> 
> > diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> > index a8198ba4f98a..33d6692f46fe 100644
> > --- a/drivers/iio/dac/ds4424.c
> > +++ b/drivers/iio/dac/ds4424.c
> > @@ -14,7 +14,6 @@
> > 
> >  #include <linux/iio/iio.h>
> >  #include <linux/iio/driver.h>
> >  #include <linux/iio/machine.h>
> > 
> > -#include <linux/iio/consumer.h>
> 
> Unrelated change?

Indeed, I'll leave that out in v2.

> >  #define DS4422_MAX_DAC_CHANNELS		2
> >  #define DS4424_MAX_DAC_CHANNELS		4
> > 
> > @@ -321,3 +320,4 @@ MODULE_AUTHOR("Ismail H. Kose
> > <ismail.kose@maximintegrated.com>");> 
> >  MODULE_AUTHOR("Vishal Sood <vishal.sood@maximintegrated.com>");
> >  MODULE_AUTHOR("David Jung <david.jung@maximintegrated.com>");
> >  MODULE_LICENSE("GPL v2");
> > 
> > +MODULE_IMPORT_NS("IIO_CONSUMER");
> 
> Is this actually needed if we don't use anything from consumer.h?

No, it's not.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart6220005.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmkulbIACgkQKCYAIARz
eA6r+A//aMF01GyQ28Vt1qVRnR+uQNAhVi/B2aUu4XYyy1hc2lVzhHwvSjyYiXET
h1jorSaLD9m5MsoTo9Scxhpu1d5KWIy5DaNATac1wmHh9t0IdE8gw1kNaUcNmefr
NFOanFttvVt7e9cko6PsxmX9GOioawS3CVrJuObkGGftqR3KVD3WMOg+n551pkK4
63Xbfe6PPADF06Lyu2kyyxUXLwIsuXQ8Z4dQ+kX4Bky34L0v4w0Yxos4Uhkwv5ur
SOUtezyExAQTgAJi9KW5MPADpCdXfB3moTv29CdWRs1K8XLkxxLeprZnutXRFxOu
CrmiA30lNs2pp7wut+8PfmeYX6btqOCMQ8KENXNV9StrRc9UqD6K6TbbJGE/Vbzg
gxDVp9t0i0nxcQAwhtvnlmAjf3pxeJWXf1iII5ooXoxv2yW1G+FsL9RBztyEnTA1
0iLFg1Yyx/28b7iZsf6oD5luqSRnQ7Qi0js5sAA3rVHfMtOlO/rGcUH1BprrpLPa
m5jycApgp26OuCSxacOhlAZ6iXy1pyepTaDlS9wz1kbdwVJOf3IaWuRhDHrRugCd
zya/579XFCsbobzejkSRHzgwylhuGsDMAniIn0MaeQw3E5wyBTCVJTXx9qebFj3v
sUVcLNhFQBy/G8YWighvreSaPr43mWS4ueBmAMClqYmOzq2nF2k=
=n+bE
-----END PGP SIGNATURE-----

--nextPart6220005.lOV4Wx5bFT--




--===============4964671484253052920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4964671484253052920==--



