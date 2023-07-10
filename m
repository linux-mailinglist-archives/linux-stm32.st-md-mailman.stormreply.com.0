Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D574DC7B
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 19:30:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 849ACC6B457;
	Mon, 10 Jul 2023 17:30:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEBA6C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 17:30:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD59A61166;
 Mon, 10 Jul 2023 17:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B727C433C9;
 Mon, 10 Jul 2023 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689010245;
 bh=8daJmCsRggn9xziEjmtzfB/+TEmSHGqfTrQOxt4tg1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t2qoXUnSHuV+TbWU69K3xBxeG6UAs5r8JvEuI+8qIwEdTjDJX9HPZn++uZHMNIQaD
 86g42vDDjo+xgTS9/scrmuWADvN0R48PLgUPQA8lzB5uIE7gczU7YsGie2UjWiD40Y
 soETF0P1p+D4lt8Jw6O9FNAf5+tzNnhQ6U1GTpxDacTetMTQd4tHQO7p92dxIvPKDo
 vCacGl+XShxk3g8tnOVtoXP+PJNeX8VjY17MSNUMQyZxhOaFwy902auPvHxrZTYMla
 iILw2xA2Gbqp0/Iihh6sd5pNaL6Cxsx8tHLlJ00pYbON+m3jOCfuniILkrN7AJJX38
 Zx5bmFaJNvHKA==
Date: Mon, 10 Jul 2023 18:30:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
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
Content-Type: multipart/mixed; boundary="===============2510534218568141036=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2510534218568141036==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IbZ/DrTRficzGRpW"
Content-Disposition: inline


--IbZ/DrTRficzGRpW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:

> Since the new spi_controller_xfer_timeout() helper appeared,
> we may replace open coded variant in spi_transfer_wait().

> + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> + *

You didn't mention this bit in the changelog, and I'm not 100% convinced
it was the best idea in the first place.  It's going to result in some
very big timeouts if it goes off, and we really should be doing
validation much earlier in the process.

> +	u32 speed_hz = xfer->speed_hz ?: 100000;

Not only the ternery operator, but the version without the second
argument for extra clarity!

--IbZ/DrTRficzGRpW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsQDcACgkQJNaLcl1U
h9DEzgf/dy9EpgGVS5JKG+2sOnEEWzJ1/z92vL5sQoHWJT0M7rzfGdRlGddYvj2k
yOJg6fvzzY2vbGoYuqkSlYi95WyUFmwqjd+BwayzJ5gH0xKRXo4MwCHKIET3z44z
8pD55r1ow40GOeztLTsLwgiADUQSMRLm/Y33rrf2I1J+/AgrEV6V+oZnbWsmoI+I
0QS2ZIQk8m1oDghyOmEOzW+jqJQbDR6HAP0L9dUbd/zcJK9LDXHE5hepkLjQbC6v
oGrJJVbs+IYFbaNJrDNtxtF3JwlAtVWWSten66FG3fmreSDQwcKATVKiHWtLlhJb
a/T8TlFW3ianwYVf2yMOEojOIbZvQw==
=d1Us
-----END PGP SIGNATURE-----

--IbZ/DrTRficzGRpW--

--===============2510534218568141036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2510534218568141036==--
