Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 437DF74DC39
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 19:22:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC254C6B457;
	Mon, 10 Jul 2023 17:21:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF427C6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 17:21:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE93460FE6;
 Mon, 10 Jul 2023 17:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7CBC433C7;
 Mon, 10 Jul 2023 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689009717;
 bh=CpTuLljbdaBkyoyitx9Zt2kT2mpNPwthrmEzA4FZh0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jH9O9AHymoIzZncRhS0boDcQENihuPJ9tiOMacCBW9S1HyXoS4fmk05l3yiGNAo2K
 KI1hyt+ZX+7NEHBvWCqXjT4yNe/LtAsjRDwPWtbPDyinDXBlqwNxiz4igGDEvFujjT
 HvuvVf7zfJpIqBT2DHBv4rYYp+mzBEGWoHelZgtBRzC5a9ODbB3jbYPRYOu+MpK8DF
 3DKPCT3xy2bGoPblEhEFYavUFRlVpmVElN1x+riHF3GGBKfZ16h5m4CDQWCrPt/Kv/
 vK54neWN9FR7qTjWY6hgaJiuvxPLSkqkKUC983rTnSx7XHJONotnyRARakAtXoacgn
 BzkLNw5lEztpw==
Date: Mon, 10 Jul 2023 18:21:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <54bb9fe7-fb62-4c2e-ae36-d2c10648ee27@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 08/15] spi: Clean up headers
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
Content-Type: multipart/mixed; boundary="===============4232898037351711265=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4232898037351711265==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5h1T0k99Bnkn5Gc"
Content-Disposition: inline


--w5h1T0k99Bnkn5Gc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:25PM +0300, Andy Shevchenko wrote:
> There is a few things done:
> - include only the headers we are direct user of
> - when pointer is in use, provide a forward declaration
> - add missing headers
> - group generic headers and subsystem headers
> - sort each group alphabetically

The previous commit was supposed to be sorting things and AFAICT did
so...

> +struct spi_device_id;

Why are we adding this given that there's also an inclusion of
mod_devicetable that you didn't remove?

--w5h1T0k99Bnkn5Gc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsPicACgkQJNaLcl1U
h9CPUAf/RRQIrb0PfZnRSA7kc94fTv5rQbNfPboY9/94tcd2SIZjbZezvGfMuSZp
6KHTd2Kkiwzya3J0dExwrNiIzmVrIGl+uWJWbvppEpglEeE0BNrEl1a9mRgzaQUk
Ys7HqCSSbbtJqGSlgQAODJPS7eaPIw1ChR5Wv5B+4AlUGavA+iCrwDK+TD0dFZpQ
ovdLIOvU+8RA2XrWSPmDSi4ywOFt9I70VxOWbR9rbfQcvXLRaJA1FOJa2ZArMhHy
CULubdIfA4BO7mOmyLX63DXgjZqu703oW4W5RFmjc+sa9xmoSdlCYflpgXX/xSqG
VmDSPECCeUQc9NZwlOM4i7+iPwCymQ==
=E/m2
-----END PGP SIGNATURE-----

--w5h1T0k99Bnkn5Gc--

--===============4232898037351711265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4232898037351711265==--
