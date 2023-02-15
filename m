Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE43697E2D
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 15:19:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9564DC69066;
	Wed, 15 Feb 2023 14:19:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BFA9C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 14:19:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E942561C32;
 Wed, 15 Feb 2023 14:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56C4C4339B;
 Wed, 15 Feb 2023 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676470760;
 bh=gQEel9EdWJL6nindAVV89iHXQOyC9ETUfqvkvbtD2gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEGQwrEr7+4WeFzY/RpUMkgnLnkz3fghVF7WJBwbfnBSFv/l/K9ykEmLj7kWn6gss
 boN+28fkVXq2qh9YXa3j66y4Hj/kpEL9EYG3AiTTfxOrke1JcvDKQydudVbzQ17IGH
 ZL4MG5W5BmvBAd6rx1y4zhrf/hs2iovXQ0Y1T2Z28UEqyKBjNDQkO60YWp04Z15os0
 LITBxJhiNSW/UvxDu/uH5bdF9unqvUhGcL4wXv6m2shBXdbZI7J9XcZ3STxeTl72a0
 U4bJYIhivyPi3krbtjRY1d/s/g+7MAdiLn1pDItsS9gGz71pmYvlLxV6SmGbJp+ikl
 VT4QJaIeWDiZw==
Date: Wed, 15 Feb 2023 14:19:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Message-ID: <Y+zp5F2l8pffEEvN@sirena.org.uk>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
 <20230210193647.4159467-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230210193647.4159467-2-amit.kumar-mahapatra@amd.com>
X-Cookie: Serving suggestion.
Cc: heiko@sntech.de, linus.walleij@linaro.org, eajames@linux.ibm.com,
 perex@perex.cz, alim.akhtar@samsung.com, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, stefan@datenfreihafen.org,
 tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org,
 mpe@ellerman.id.au, tiwai@suse.com, haibo.chen@nxp.com, mingo@redhat.com,
 linux-imx@nxp.com, linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de,
 l.stelmach@samsung.com, npiggin@gmail.com, james.schulman@cirrus.com,
 sanju.mehta@amd.com, sbranden@broadcom.com, andrew@aj.id.au,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc,
 kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org,
 claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com,
 tanureal@opensource.cirrus.com, david.rhodes@cirrus.com, edumazet@google.com,
 ldewangan@nvidia.com, windhl@126.com, lars@metafoo.de, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com, andi@etezian.org,
 Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro,
 haojian.zhuang@gmail.com, jaswinder.singh@linaro.org, clg@kaod.org,
 linux-amlogic@lists.infradead.org, michal.simek@amd.com,
 linux-arm-kernel@lists.infradead.org, libertas-dev@lists.infradead.org,
 mcoquelin.stm32@gmail.com, khilman@baylibre.com, pratyush@kernel.org,
 linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mtd@lists.infradead.org, christophe.leroy@csgroup.eu,
 masahisa.kojima@linaro.org, festevam@gmail.com, linux-aspeed@lists.ozlabs.org,
 git@amd.com, f.fainelli@gmail.com, benjaminfair@google.com,
 jernej.skrabec@gmail.com, yuenn@google.com, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 yangyingliang@huawei.com, pabeni@redhat.com, amitrkcian2002@gmail.com,
 William Zhang <william.zhang@broadcom.com>, rjui@broadcom.com,
 john.garry@huawei.com, rostedt@goodmis.org, rf@opensource.cirrus.com,
 tali.perry1@gmail.com, avifishman70@gmail.com, thierry.reding@gmail.com,
 netdev@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net,
 alex.aring@gmail.com, vigneshr@ti.com, konrad.dybcio@somainline.org,
 bjorn.andersson@linaro.org, linux-riscv@lists.infradead.org,
 robert.jarzmik@free.fr, kdasu.kdev@gmail.com, richard@nod.at,
 chin-ting_kuo@aspeedtech.com, Dhruva Gole <d-gole@ti.com>, agross@kernel.org,
 kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, han.xu@nxp.com,
 oss@buserror.net, venture@google.com, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com,
 jic23@kernel.org, linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 daniel@zonque.org
Subject: Re: [Linux-stm32] [PATCH v4 01/15] spi: Replace all
 spi->chip_select and spi->cs_gpiod references with function call
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
Content-Type: multipart/mixed; boundary="===============0773676258521268325=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0773676258521268325==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mHMK7QDQWaz9I52Q"
Content-Disposition: inline


--mHMK7QDQWaz9I52Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 11, 2023 at 01:06:32AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and

This again doesn't apply against my current code - I think the
best thing to do here is going to be to rebase against -rc1 when
it comes out and resend then, that will also make the issues
integrating with other trees easier as then I can make a clean
branch against -rc1 that other trees will be able to merge as
needed.

--mHMK7QDQWaz9I52Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPs6eMACgkQJNaLcl1U
h9DMTQf7BClrpZ6y6mPa14iVbIWKtokY4RW9qSMUPLjIFwC9eRXAa0tO9cEn7yie
Dhg3Nh0HQil5b3ETrpYSZcezEkC0LjXhOcrQL2AaNPnYqp8rwD3n4tFQXOY7hA9R
fhdZQcSulOPdvy2GDwF7fvgenpxkVDIZM0OyEYKr5amWKxjhGICMWTBjvHmWJWo5
Kh34j6KD6URlG9Rlf2b8CSTbJrwj5bREjrjMOvUNQWTt775APe+cKcZF6Jp3IhOC
q8wYya1VrWoegeXxgG6IJW/I5BYCmloUtbj8BTpW9CIHMuOTdeqMduuExe3cWHOx
xEsHIS5meBbApEDmthwKyZw5q9xE6w==
=3UQL
-----END PGP SIGNATURE-----

--mHMK7QDQWaz9I52Q--

--===============0773676258521268325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0773676258521268325==--
