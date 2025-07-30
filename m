Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0813B15DFC
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 12:19:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECC1FC3087A;
	Wed, 30 Jul 2025 10:19:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72308C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 10:19:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF1AF5C5707;
 Wed, 30 Jul 2025 10:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582B1C4CEE7;
 Wed, 30 Jul 2025 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753870771;
 bh=EAo1JwLwQmSVpdRh6bDezMwGkO6es9S03FxPuaNswug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyQOpxcVcR1H63+BHWg/CFKigaLqUqMvNvXsUknLdHPeMkodeiZl5MPug/8DsVw/a
 giBEQoO6YJfc2IYMup/cB5/tzxUNdpq26OkCCKKEyijv3HeDTvTPB42bZ/LAWWap1W
 HSU9KVqt3jnCYHFHTDpwJjFf8xW2jB/JQQE+K88VmHLkDDwagXryM/B6XDesFEu6sE
 dSdDZ+j8pNDSjEmeF0IcFGmPg4/QvfL9hUVm6h9WtgU6dBsthpBa+4155dTYEuncfm
 LoudalTEKGq6b4IJRJAblOtrJzxaq8mDhKnhvwKxJ1GJAz0exZz3MffWB+GUVgM/Fm
 qi3d0rU9EWtOg==
Date: Wed, 30 Jul 2025 11:19:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Message-ID: <490091ee-ba84-4f97-96b4-fe30ed082e17@sirena.org.uk>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-5-b505c1238f9f@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-5-b505c1238f9f@oss.qualcomm.com>
X-Cookie: Linux is obsolete
Cc: imx@lists.linux.dev, Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-spi@vger.kernel.org,
 Janne Grunau <j@jannau.net>, linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-msm@vger.kernel.org,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 linux-mips@vger.kernel.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 asahi@lists.linux.dev, Viken Dadhaniya <quic_vdadhani@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-rpi-kernel@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-tegra@vger.kernel.org,
 Sven Peter <sven@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Saravana Kannan <saravanak@google.com>, Scott Branden <sbranden@broadcom.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Takao Orito <orito.takao@socionext.com>, dmaengine@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Daniel Mack <daniel@zonque.org>, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH RFC 5/6] spi: geni-qcom: Hint GENI
	protocol ID to GPI DMA
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
Content-Type: multipart/mixed; boundary="===============7583990789897692820=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7583990789897692820==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bAEzP5efOXdEgXiD"
Content-Disposition: inline


--bAEzP5efOXdEgXiD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 11:33:32AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> With the API in place, request the correct protocol ID with the GPI DMA
> to avoid having to hardcode this obvious information in the device
> tree.

Acked-by: Mark Brown <broonie@kernel.org>

--bAEzP5efOXdEgXiD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiJ8ZoACgkQJNaLcl1U
h9DnvAf+LbcTzds/hsfTeLtLPENpavgpdBbC/kj+eo3NQESPHZy9K7kiL8p7Xjbr
hMSf6upQxsK7NZMFyKsLc0oAEP6LLyDU16ON/R+QDQiNYou0xOm9vYoJwtmhMvDY
PDJaohO2ZSfEwodlxhodZ0HxhrSaPXLEiJt2tA/ASGUdRtCC15yUoXItcUf+b04C
/A3TjgtsVE32Xz6HKLh2/Z6WkBWVgqpGswljAu7JkNAvKlp7BTviSUX645kuiQYz
/o32yfxiCCO5LO/s2/wvMjiCgaKi2Kf8uLjifxymS8nOhqcw/yZjAZ70/lo6j8IO
EmQkB6uCcv8iOoBmuo/fb2/ULFapvQ==
=j7vN
-----END PGP SIGNATURE-----

--bAEzP5efOXdEgXiD--

--===============7583990789897692820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7583990789897692820==--
