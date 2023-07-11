Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688D74F16E
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 16:15:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F17F5C6B44C;
	Tue, 11 Jul 2023 14:15:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D14B7C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 14:15:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77C8D61360;
 Tue, 11 Jul 2023 14:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209CBC433C9;
 Tue, 11 Jul 2023 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689084907;
 bh=A+lgFSqWg8vRgir1XqFzY9nIE1Cw0dwqFBu8P2BdZBc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwXQpO0JwJwS2tync5AfGpO9HXb9u4mgZfpWRxyxjmWV7o23oHa66oSgLBUqWen2D
 ZlOHsSEyXpzrsEeWWEmLhLLitAzI15911I18ub63ARZldiwGDK6EeLi3B34Qy+IEG4
 waxyA6VmnpE80hBohYtayTpWfyRhiz5yBCu2xfPCie7wDB1OJGO5pfFeIe7TmhLaf6
 2F7TtEpspxDmIAOKWfQt4n5/QaTo60Dymh5zBKNq1hnkXPOMFNsHXFu721qfrAekf9
 KAql0ORVXuf2YxOmwhPq6tE1iNaCTZM61qgKsPoZvWs0hppRNFtMcBrTT4RcCr66z6
 VpMXSzxRgleHw==
Date: Tue, 11 Jul 2023 15:14:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
 <ZK02efTYxV3czigr@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <ZK02efTYxV3czigr@smile.fi.intel.com>
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
Content-Type: multipart/mixed; boundary="===============4438393262925447567=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4438393262925447567==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MZrPSMfLUzZVYlnE"
Content-Disposition: inline


--MZrPSMfLUzZVYlnE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 02:01:13PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 06:30:32PM +0100, Mark Brown wrote:
> > On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:

> > > + * Assume speed to be 100 kHz if it's not defined at the time of invocation.

> > You didn't mention this bit in the changelog, and I'm not 100% convinced
> > it was the best idea in the first place.  It's going to result in some
> > very big timeouts if it goes off, and we really should be doing
> > validation much earlier in the process.

> Okay, let's drop this change.

Like I say we *should* be fine with the refactoring without this, or at
least if it's an issue we should improve the validation.

> > > +	u32 speed_hz = xfer->speed_hz ?: 100000;

> > Not only the ternery operator, but the version without the second
> > argument for extra clarity!

> Elvis can be interpreted as "A _or_ B (if A is false/0)".
> Some pieces related to SPI use Elvis already IIRC.

I understand what it means, I just don't find it's adding clarity most
of the times it's used (there's a few places where it is useful like
pasting in strings in formats).  There are some examples that I'd
complain about in the code, most of them predating me working on SPI too
much, but I'm not a fan.

--MZrPSMfLUzZVYlnE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmStY90ACgkQJNaLcl1U
h9DeQQf+MxpgOv6egcsQtreuAtaq7Ev7HPCaH6MbusHDNH2hElvH+GmEYjovkV6m
h3LadU5OvktJBaXfjDQRjU71Cbf70/Nlo8I3WN5V4iRKzqWtfMV16ZStvy2+1Rx/
jHek+Aib8L8SiwlzvD6WB163yHCsSn5KBv2Pqp95DjGWamTl918onxXzSS6g2j5A
ib1Mz8aOXWBsiIdaFTQ3NoK7Uvnykzp1X2uGcfrRZuPWQNVvpJs/wt5iOuTpuEws
6O2PEgJext+6CeKBCv8pCvpex2QsVtDKLnDVvmDX4Oa2impxsxSIjLyVbZfbJ480
4XviYIQ2LNlTFidlbAAqqEafOQrvRg==
=WM20
-----END PGP SIGNATURE-----

--MZrPSMfLUzZVYlnE--

--===============4438393262925447567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4438393262925447567==--
