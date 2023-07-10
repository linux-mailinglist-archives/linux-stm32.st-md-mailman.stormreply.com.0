Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E43D74DBEE
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 19:09:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BBEAC6B457;
	Mon, 10 Jul 2023 17:09:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07F0EC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 17:09:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC4FC61133;
 Mon, 10 Jul 2023 17:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822D8C433C9;
 Mon, 10 Jul 2023 17:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689008956;
 bh=nKZycr1bbDIhX+7r/umilV/wuLHcsLLg8WWLjNqfVGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ks7RL3h40J9Gsg6+T5tGMhXUPebOkMtv2HYbINZYkE0HBcDFe3InO0uHvSLO6Ywfd
 z9dbScYbXDyBfN0KKzvhwsevIOZI2Wa4nTPSPcqSdIk9dVy3t4CwrMIhESNVB8EcTq
 DHcqHiLwexT4fjkOSD7WRFfWxwr4oLox+CN38zoYAqwcwq7DLt0YYhvaSCGjOeZdC6
 /OMp7mPT/0W9iS9bRuPwjhjEgn3ZN4a3GPUVex+MO83a5hpzqpvTmLwha1tCaAJG7B
 IOQDzu3lMvKgzC08AKXIF8wSz30WvJ3WDseHtgBrUd0ZFYjZe2rdpVVbiRnkMjF1jV
 sbYhTW/HyF8mg==
Date: Mon, 10 Jul 2023 18:09:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20230710154932.68377-3-andriy.shevchenko@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 02/15] spi: Drop duplicate IDR
 allocation code in spi_register_controller()
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
Content-Type: multipart/mixed; boundary="===============3286004104236042948=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3286004104236042948==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugTz/0iIbXaMesMQ"
Content-Disposition: inline


--ugTz/0iIbXaMesMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 06:49:19PM +0300, Andy Shevchenko wrote:

> Refactor spi_register_controller() to drop duplicate IDR allocation.
> Instead of if-else-if branching use two sequential if:s, which allows
> to re-use the logic of IDR allocation in all cases.

For legibility this should have been split into a separate factoring out
of the shared code and rewriting of the logic, that'd make it trivial to
review.

> -		mutex_lock(&board_lock);
> -		id = idr_alloc(&spi_master_idr, ctlr, first_dynamic,
> -			       0, GFP_KERNEL);
> -		mutex_unlock(&board_lock);
> -		if (WARN(id < 0, "couldn't get idr"))
> -			return id;
> -		ctlr->bus_num = id;
> +		status = spi_controller_id_alloc(ctlr, first_dynamic, 0);
> +		if (status)
> +			return status;

The original does not do the remapping of return codes that the previous
two copies do...

--ugTz/0iIbXaMesMQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSsOysACgkQJNaLcl1U
h9Bj2wf/eujSGQes7B4PBTQ3n1oBhkcL7Y24XQnkT5q6FXhb+PNy2gOUL7X4u8/s
jewRdgc+ViUGaokkDON2TN26dLdi/+KEGq7rPGhgLMeyGSqKJx5uRaCQSSdKa2Y2
w1zSdEXhWd9SZsgsLa18k9bVMBbmyuylLjQYrLlHktiuD4/baW1HQ5SqKICkb1Bg
/ZdcRGqcKDfgJWnVfK4loF7rFNMRBY0rXsSdOVE3yOKeZE2uS46s2BPPN+xc7UaA
KTSUu8JjCacwP+V70yrm4VGRb5/c0NJ++iO44yiykKNRvcJWCDemwAYhj9zV1ja/
5l/fUqxd3+5Kv3hbc1rSnyAywM7/4g==
=1GBL
-----END PGP SIGNATURE-----

--ugTz/0iIbXaMesMQ--

--===============3286004104236042948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3286004104236042948==--
