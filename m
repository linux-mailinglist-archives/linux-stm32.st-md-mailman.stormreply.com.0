Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A874EFCB
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 15:05:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 376C1C6B457;
	Tue, 11 Jul 2023 13:05:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65466C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 13:05:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5788614A9;
 Tue, 11 Jul 2023 13:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE23AC433C8;
 Tue, 11 Jul 2023 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689080732;
 bh=HnVEva2jdOLXu3EN/cKYarAoyETVmcXrgG0CY9KCvZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BO5Sf+xL4FaASSNsNdM5EGXByrv4WeTUxRBoPW2QNejIwlELvXTu5gKKqv4hkKhGg
 oi3ZfR9Shzo5QwnSHTFndf8ZIVkqpTClpssosTOBH6/4HIjVrlXO3KdynsW5+Pg7kp
 pbkKvKQx6ir3yg7CLJDoLHQzo0ewO66SzIeDifz9SCJzdBAZAn9RpEQzQEGNZHOmt+
 6tOI/PPlmxZBFom+gGGjOjy+qrSc5cI26iueLs1Gv6DR2sYD26rubxcFZS48+8Dw/G
 5SSyFU8wEM4MuZLWsQU4tXLcKI+0ehoZc3/OitBA10N/7/7vB38b2KMdMwG1AhcrlN
 +CUurb7ZrrwoQ==
Date: Tue, 11 Jul 2023 14:05:18 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <e3688ce5-616a-4399-a4e3-c410a09f6a45@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <83c4b75a-06d7-9fca-ffa0-f2e6a6ae7aed@collabora.com>
MIME-Version: 1.0
In-Reply-To: <83c4b75a-06d7-9fca-ffa0-f2e6a6ae7aed@collabora.com>
X-Cookie: marriage, n.:
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
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
Content-Type: multipart/mixed; boundary="===============1468925055045359747=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1468925055045359747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="925w7TTgRoHZtFsT"
Content-Disposition: inline


--925w7TTgRoHZtFsT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 10:28:13AM +0200, AngeloGioacchino Del Regno wrote:
> Il 10/07/23 17:49, Andy Shevchenko ha scritto:

> > +		ms = spi_controller_xfer_timeout(ctlr, xfer);

> I agree on using helpers, but the logic is slightly changing here: yes it is
> unlikely (and also probably useless) to get ms == UINT_MAX, but the helper is
> limiting the maximum timeout value to 500mS, which may not work for some slow
> controllers/devices.

The helper is limiting the *minimum* timeout value to 500ms - it's using
max() not min().  The idea is the other way around, that for a very fast
transfer we don't want to end up with such a short timeout that it false
triggers due to scheduling issues.

--925w7TTgRoHZtFsT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmStU40ACgkQJNaLcl1U
h9B+yQf+KBYXJ7506wC0Am0zY2LnPrpwi7/uhVWQsN9GzhBVU0RGwam2xuqmpCeo
A3o92lqKSQPkQGllTlnuM3r4jp2qDy1/U/QJJxak+i/i8NjuVxIQQIKtnM/nRQxh
yRpIp6WbVt+HJsdFgPS6j6r/3m1qS4eTbso7/ciwLzdRc2Yxk9SLXFteOErlAEoq
hhR7VxhID4BE72a+1NbyuALEVGjSMYBdpddD//Qa1UsJVw1yK5HuM51CaQd9bTlo
EtrmXMgaG9FB+lQeu2zedT6HTQQH/hOB77luYq4zGm849tw2sfBPIhqVgQtkkutv
4hpXSMiuD+iL32PThXfathhu4xvFiQ==
=l6sR
-----END PGP SIGNATURE-----

--925w7TTgRoHZtFsT--

--===============1468925055045359747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1468925055045359747==--
