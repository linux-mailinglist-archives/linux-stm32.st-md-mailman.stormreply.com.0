Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D3C8F181
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Nov 2025 16:07:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2660C60497;
	Thu, 27 Nov 2025 15:07:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32D90C60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Nov 2025 15:07:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C61A4C16A19;
 Thu, 27 Nov 2025 15:06:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8520D6072A;
 Thu, 27 Nov 2025 15:07:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE57C102F218C; Thu, 27 Nov 2025 16:06:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764256032; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Xb2gYHXIhVp2zaSFmlDMNszWhEx2yHpcG9wfBD9WQ6Q=;
 b=KsDxrTwJZ35P4V4zqNgBRz6dueQQQ479lYnTv33vH6BaAZQ6mqaBR8WEopD6/WxoiDZf3C
 Ic4RTSKoLEfjd0/q+TBQmqIrfWBRSTeCoErZlb34wHoEcX2HAzuN2RzutFpS6+d2ln9KMJ
 TSvAsAUfwMfwSBd4rCMr2Fdi3SKnKSNaEM9vqWiV42ClnoYd2t6PVCTiOsInGdUD2yiqj4
 ZzTUOWwdLINFYrJ9uWeuCkQFxLH7ib2+v5JAxnvTykYWonFW1xB3OWNxxohmbmwdgPC/rA
 Ba8/f4uTLQUuaOMbgPFSeaBwbd+ExYFXfFw+9W2+71ncOaO/+QIwmKbAGZv6Rw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Thu, 27 Nov 2025 16:06:47 +0100
Message-ID: <8695751.T7Z3S40VBb@fw-rgant>
In-Reply-To: <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
References: <20251124-ltm8054-driver-v4-0-107a8a814abe@bootlin.com>
 <3021060.e9J7NaK4W3@fw-rgant>
 <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-hwmon@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Casey Connolly <casey.connolly@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-phy@lists.infradead.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Dixit Parmar <dixitparmar19@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, David Lechner <dlechner@baylibre.com>,
 Jaroslav Kysela <perex@perex.cz>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matheus Castello <matheus@castello.eng.br>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Iskren Chernev <me@iskren.info>,
 Takashi Iwai <tiwai@suse.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>, linux-pm@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 0/6] Add support for the LTM8054
	voltage regulator
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
Content-Type: multipart/mixed; boundary="===============5622853989659242863=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5622853989659242863==
Content-Type: multipart/signed; boundary="nextPart10847283.nUPlyArG6x";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart10847283.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Date: Thu, 27 Nov 2025 16:06:47 +0100
Message-ID: <8695751.T7Z3S40VBb@fw-rgant>
In-Reply-To: <0E900830-E248-4F0F-A048-075EAF1D2440@goldelico.com>
MIME-Version: 1.0

On Tuesday, 25 November 2025 11:25:24 CET H. Nikolaus Schaller wrote:
> Hi,
> 
> > Am 25.11.2025 um 09:41 schrieb Romain Gantois
> > <romain.gantois@bootlin.com>:
> > 
> > 
> > This is planned support for a voltage regulator chip.
> 
> Well, but one which is not by itself programmable. So IMHO, it does not
> support that chip, but the circuit it is used in.
> 

The boundary is a bit blurry in this case, sure.

> > > Are you looking for a virtual "glue" driver to logically combine several
> > > low level functions?
> > 
> > I'm looking for a clean userspace abstraction for this component, the low-
> > level functions in this case are those of a voltage regulator.
> 
> As far as I understood it has
> - constant voltage
> - current can be limited
> - it can be turned on/off
> 
> That means it is a fixed-regulator (for constant voltage and turn on/off)
> and a mechanism to program the current limit (iio-dac). Both have clean
> userspace abstraction.
> 
> What am I missing?
> 

In my case, the regulator has a DAC tapping into the feedback divider with 
allows modifying the output voltage level. This isn't specific to the LTM8054 
though, you can theoretically do this with any regulator chip that has a 
feedback pin.

...
> The question remains if you want to solve something for a single board which
> happens to have an LTM8054 or if you are solving a more general design
> pattern.
> 
> In summary my view is that the LTM8054 is just a "fixed-regulator" which
> gets an additional current-limiter feature by adding a DAC chip (which needs
> a driver of course). So software control is required not by the LTM8054 but
> by adding a DAC chip.
> 
> Another suggestion: what extending the "regulator-fixed", "regulator-gpio",
> "regulator-fixed-clock" pattern by some
> "regulator-gpio-iio-dac-current-limiter" driver to make it independent of
> your specific chip?
> 
> By the way, are you aware of this feature of the regulator-gpio driver?
> 
> https://elixir.bootlin.com/linux/v6.18-rc7/source/drivers/regulator/gpio-reg
> ulator.c#L97
> 

That could be a preferable solution given that similar current limit and 
output voltage limit control methods could apply to other regulator chips... 
I'll have to think about it some more.

> Just to note: I am neither maintainer nor doing any decisions on this, just
> asking questions for curiosity and from experience and giving hints for
> alternative approaches, where I hope they help to find the really best
> solution.

Sure, I appreciate that.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart10847283.nUPlyArG6x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmkoaQcACgkQKCYAIARz
eA4wIA//cR+gzKtW78qSkS/qn3QD4fmem8sIoJemjJ96zZS/fPrrD7BVbwlzmT8Z
PX35PtLLxRdN0CRWsdmEqAAwFLRMn0/UBGpROLNSqKZT9c3SisrVH5XlVV0s95LB
fS6l3xzgbIjdqhGxwXgV+43B2OuuBLE9AopgYIwRunAam9+nECFHo9hU/4glxqrS
O54WKxLhs7/BMJdpAv4T8UYjqKiC7Lvpd4oq43g64sacplSnZNv4iwqkga0oOtd8
2IayCT5+gRm6xd9Xt/cVkQUQAFsoiieLLt87+JZP1ECtjcfwIsDiPBf49DvppELP
SLg8qwG44QYRhfsPvdBRLFuvkmsu1rGZaBdRQZ+npfBkkwljuh6EllMbFgUOpuCR
aFQleHJ/6naNsAZGxp4mW6x1YPwsiYeCQuQdffSq2DrTLEAnG3EV3wIB5TbMsF72
p6glXdEj3uYECnRJ9Lql1PWO9MHGnubF2xCDqRIn7HDxq+DLmZkkZzg4c69/V1fy
O7go8T5OfK1233Kqb1VDvY9SDRL5+nLo1tacht8yyrhq3LEUumAf7TFLXzBmN+QQ
5TURL5uovvulw4c6SXs9sa7yriUKuayb9s5CKLsJJI4uYBt+Csyhm/fOfpuvKVm5
Bryk0xixSfV1ekLMojoBFaS3AFNPGNCHqSmjGOEsaK8hrJ5HgkM=
=KPmo
-----END PGP SIGNATURE-----

--nextPart10847283.nUPlyArG6x--




--===============5622853989659242863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5622853989659242863==--



