Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A7A74DBBB
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 18:57:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53BABC6B457;
	Mon, 10 Jul 2023 16:57:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E77EC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 16:57:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4835D6102A;
 Mon, 10 Jul 2023 16:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013E7C433C8;
 Mon, 10 Jul 2023 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689008234;
 bh=IIro+PYudoCpsNeH2Llkq/gmEiqeLq8TswCPO5UnD6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7yUWoNb8JNe5qIMp13em9m8Rzsc1ghhta/kWFSe5/qi4pD5l1Kdd3nTIbhSAnB41
 W8C1J2axQqESm/vo5JFAn+FCzJ9O92y9klVgFoPPFBocvgHANqPMFGPKWSy1cah2AJ
 6B66a+6OSbM4vJnoAPeTpJQU1ZveA0PYXoTV6fut7sflD58+Jtel0GfBpq6p2nXiCt
 M0xsvZQxCC0EolQkXizKejaZaayP6VSNsobrYWwUH758W9Nr9zRBh1oYMDG5FsShL0
 zQI22BV9Iz/Ww1LFbCTyWKHKLILGMYlknCcvjk0BqOW9V/aTLFc+59pabBeheGKNwr
 5euI/OtpKjArA==
Date: Mon, 10 Jul 2023 17:56:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <24e71654-bc79-42ac-86d1-4e6100f6893a@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 03/15] spi: Replace if-else-if by
 bitops and multiplications
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
Content-Type: multipart/mixed; boundary="===============4378332877839520988=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4378332877839520988==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fI+fdz2D5/EEE42m"
Content-Disposition: inline


--fI+fdz2D5/EEE42m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:20PM +0300, Andy Shevchenko wrote:

> -		if (xfer->bits_per_word <= 8)
> -			maxsize = maxwords;
> -		else if (xfer->bits_per_word <= 16)
> -			maxsize = 2 * maxwords;
> -		else
> -			maxsize = 4 * maxwords;
> -
> +		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));

This will change the behaviour if bits_per_word is more than 32.  That
is validated out elsewhere but I shouldn't have had to go around
checking the code to confirm that this is the case.  This is the sort of
thing that should be highlighted when doing this sort of edge case
stylistic change.

--fI+fdz2D5/EEE42m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsOFsACgkQJNaLcl1U
h9A2Ywf+KXUPki4n4OHbYfUF8KSXIYSkZGLAugrUbcI1dW/wY8+0fLYP8+4w9V+j
f81LA7/NDs1aRdnIEAvy6JRWhsUGKyHHKw42xpXD6MqtamipzOaVSYaL2Hr3ZuqC
22p4KuNl0BAuHc+iyOWLpX7/btG8mweyZNWYjDbaB3duv4usx8Pis5kQu9HrTvfw
e1repiQ4pqd5PGfhReO1fGbR6QIhoswiEm/9yfkZTQs1HAIOpRAePL2XPZD3sBuj
pehvlOvP2yRq1fOxYVWGxXH8dhavS5t/mUlzyTYI7VxMD2HUZD1EiZ2uYcmntUEl
y8tiLDQIFQRb++F+IFf0SjU+vXe0UQ==
=tuUl
-----END PGP SIGNATURE-----

--fI+fdz2D5/EEE42m--

--===============4378332877839520988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4378332877839520988==--
