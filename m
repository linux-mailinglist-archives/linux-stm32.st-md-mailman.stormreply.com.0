Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F674DC11
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 19:16:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C7D1C6B457;
	Mon, 10 Jul 2023 17:16:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 312CFC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 17:16:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4A4F61136;
 Mon, 10 Jul 2023 17:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607EFC433C8;
 Mon, 10 Jul 2023 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689009395;
 bh=CgnlYd6F8QNT9n++b/k47msx5swkm6/AbNv02cH7FqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nCNLRwD0ouHI8pJTPN00LKshCADBsrezjsyCWSHlUtPA86QMcTtmuANY2THapc+ya
 rkH5tcQmXa5WkKmxP1SPoeLDBnKChb3smPLszGKE/fOJpIoKZHw2XHyVjIgwHTZ/1z
 MufgsvMGmS7UeltSFfqOX5aakYX6Oi9D+fdx6r4xTwDjZDukvdOJHqT+HXAuPx0WPm
 TWMpwYu5OvJq0RnyxMb5KHCGmQeKSlmlgHlItZHKy5JjIjq74cV332HHX8EX4US9YN
 7LvxZOQBp61R6AEZ7cokvT4lucM8T0YliBj7nuBwioqSX1VDucIF209VQysfZBVMCk
 jUIpbFJ9ng45w==
Date: Mon, 10 Jul 2023 18:16:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
X-Cookie: Do you have lysdexia?
Cc: Richard Cochran <richardcochran@gmail.com>,
 Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-trace-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Radu Pirea <radu_nicolae.pirea@upb.ro>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sanjay R Mehta <sanju.mehta@amd.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 05/15] spi: Remove code duplication in
 spi_add_device_locked()
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
Content-Type: multipart/mixed; boundary="===============4877962033753542938=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4877962033753542938==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="smwEq19A8LfCcchg"
Content-Disposition: inline


--smwEq19A8LfCcchg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 06:49:22PM +0300, Andy Shevchenko wrote:
> Seems by unknown reason, probably some kind of mis-rebase,
> the commit 0c79378c0199 ("spi: add ancillary device support")
> adds a dozen of duplicating lines of code. Drop them.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/spi/spi.c | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index c99ee4164f11..46cbda383228 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -712,17 +712,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
>  static int spi_add_device_locked(struct spi_device *spi)
>  {
>  	struct spi_controller *ctlr =3D spi->controller;
> -	struct device *dev =3D ctlr->dev.parent;
> -
> -	/* Chipselects are numbered 0..max; validate. */
> -	if (spi_get_chipselect(spi, 0) >=3D ctlr->num_chipselect) {
> -		dev_err(dev, "cs%d >=3D max %d\n", spi_get_chipselect(spi, 0),
> -			ctlr->num_chipselect);
> -		return -EINVAL;
> -	}
> -
> -	/* Set the bus ID string */
> -	spi_dev_set_name(spi);

I see that this is duplicating spi_add_device() (and we really could do
better with code sharing there I think) but I can't immediately see
where the duplication that's intended to be elimiated is here - where
else in the one call path that spi_add_device_locked() has would we do
the above?  Based on the changelog I was expecting to see some
duplicated code in the function itself.

--smwEq19A8LfCcchg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsPOUACgkQJNaLcl1U
h9DBUwf9Euy3I6rYQCugpUDlBhWVoSMMz7t1ATFjPAfJAReJsl7tNz8zO3ZIBKvo
DT0wuXofoowlS3XkS80I3NNL7wRjCktrPJnRHSBr/n15W3VCvz7cA+vkKlJdt60d
vqLIOGnEqqPBftrOwUjsobHicO0YhL47AxOStev3fjlhFEbS0RrIpvCsVsRI1HDs
5MalNotHe8wd+ujY4p9wUX9c2EZvSWQAE4XUBml+faspwunMGqKbjE+srfTbz+eB
bkym8H1s/H5a/SQn5ya4y6dkDZ0jR9hz4H3HxMm4C/KgUJRnZXiIgNRtghmsQNys
LGdv8LQz0S452H4iaGYZlWdB4IEu1w==
=KWBr
-----END PGP SIGNATURE-----

--smwEq19A8LfCcchg--

--===============4877962033753542938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4877962033753542938==--
