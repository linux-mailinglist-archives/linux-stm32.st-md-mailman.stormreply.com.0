Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A674F410
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 17:50:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE20AC6B457;
	Tue, 11 Jul 2023 15:50:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33770C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 15:50:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 046936155D;
 Tue, 11 Jul 2023 15:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A565C433C8;
 Tue, 11 Jul 2023 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689090607;
 bh=Rfrk1uyNxWMBBOGH5Jxn2umsc9+1UwzSvXH/XCQVTMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQcn8OvC6bRBN7WzpsoGdLVO3L4xuskzngmmfRCEj2SQ0jAC+8jd5iN20p9gHRbpg
 XUbhNgU9wAusI4gCQRZQWpSdosA5W/FQG4z1AWEgo24Qhpez1zvl8Qd08L+UQadjys
 qOLdKWVQ3JbXYchCASI4opWSvhez0uMrvZY11sAMGFC7hweCIW8F+sFtyDKkG13nS0
 BpkHBiCRn9aeI6z28Cfu2Vk50UunuJFeo1j1nrYJyD6L4Kr0GqQXWYq2XqyGdtwIe+
 r8LZOFGfyssDNKEB3zOQjK+1KK7aegmO8dmKUMp5no+2+L0MPlqIAyMOrhHo2iXkMt
 IC4BE92YJ2DdQ==
Date: Tue, 11 Jul 2023 16:49:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <dafdb3d9-572f-49d3-82d7-f0d7667df5dd@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
 <ZK02efTYxV3czigr@smile.fi.intel.com>
 <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
 <ZK11flZf/1grJ1Bd@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <ZK11flZf/1grJ1Bd@smile.fi.intel.com>
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
Content-Type: multipart/mixed; boundary="===============8129625090993803660=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8129625090993803660==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/wyG6sqMhUk9SL4"
Content-Disposition: inline


--z/wyG6sqMhUk9SL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 06:30:06PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 11, 2023 at 03:14:54PM +0100, Mark Brown wrote:

> > Like I say we *should* be fine with the refactoring without this, or at
> > least if it's an issue we should improve the validation.

> For the speeds < 1000 Hz, this change will lead to the div by 0 crash.
> It seems that the current code which this one removes is better than
> the spi_controller_xfer_timeout() provides.

> If anything, the spi_controller_xfer_timeout() should be improved first.
> So, for now I drop this for sure. Maybe in the future we can come back
> to it.

I don't think this is the only thing that might fall over without a
speed, what we've generally been doing (and do try to do with speeds, we
already need to default in the controller's speed and so on) is to
sanitise input on the way into the subsystem rather than trying to
ensure that all the users are handling everything.

--z/wyG6sqMhUk9SL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSteiEACgkQJNaLcl1U
h9DAYgf9GamF50fucbXVx/aZUwGY2hD+eGYGVpMwfSRhuUlWbnbam1vDqMkEllpk
X95Rur4vRJQA8erYbUKnhyABsYUSGd8CKx8/mDgvePWDPlYZ3TkdMV8z/j59HZbA
WhFO3yBSJzNOgDxpftw96yBP7l7eZZHabEpeUAOx+SZ04jtNfdnRHeHBIBKL+YUT
eFnArWnhTo4dUwNTaAojL5Lfgos/MGY9ABY3b2E4ZkjSaHCUTOa2rxKo9zjc43tE
gdVuQ8cvshKLUDx2CFZ4oux+stLEOfjcsmR0prxZp3q9t2ywp1CsOHBY1ndd/8Ds
SnUGepjz95NgZBU7ewJoIuRhKJUQtA==
=GGl+
-----END PGP SIGNATURE-----

--z/wyG6sqMhUk9SL4--

--===============8129625090993803660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8129625090993803660==--
