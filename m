Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A726E180
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Sep 2020 18:59:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E088C32EA9;
	Thu, 17 Sep 2020 16:59:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7E6AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Sep 2020 16:59:52 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 045672064B;
 Thu, 17 Sep 2020 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361991;
 bh=GrVLcLTzWbHaOqc8yOe5ZOBLBJsBrKi9IQirWn1MN9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZeOcTkKfqTfSKxXLPMixk2hmhneSDyakuPt4w8Nampx1mtSc0kRuAHpEFutfAxfY7
 uIcrH0fSHivfjQgniTmymU64XQGk65j8QkFpmgsST5k8t5jZp0BXNXEQJ8EDfj7rEC
 uvl3hrkXmj1YC296VtKaBpVAkLsbX1Fr+UuPWAV0=
Date: Thu, 17 Sep 2020 17:59:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200917165901.GH4755@sirena.org.uk>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-11-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200917165301.23100-11-krzk@kernel.org>
X-Cookie: If you fail to plan, plan to fail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Stefan Agner <stefan@agner.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Anson Huang <Anson.Huang@nxp.com>, Lee Jones <lee.jones@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Andy Teng <andy.teng@mediatek.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Jaroslav Kysela <perex@perex.cz>,
 Sungbo Eo <mans0n@gorani.run>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>,
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sricharan R <sricharan@codeaurora.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hoan Tran <hoan@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 - <patches@opensource.cirrus.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH v2 10/13] ASoC: dt-bindings: zl38060:
 include common schema in GPIO controllers
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
Content-Type: multipart/mixed; boundary="===============2194381986526872617=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2194381986526872617==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline


--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 17, 2020 at 06:52:58PM +0200, Krzysztof Kozlowski wrote:
> Include the common GPIO schema in GPIO controllers to be sure all common
> properties are properly validated.

Acked-by: Mark Brown <broonie@kernel.org>

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9jldQACgkQJNaLcl1U
h9DvjAf/SUwcEnnEwBpfQ63szoqKB0GpzaO3m5BAaJb0bUIPA2VN3awzEjKnCovc
fnUtwtxB7sjJgRZ5gqdC1FNzT56AaSO0d+KKyFzSO5scq0339MN8F5OrqPApPq6D
5872VVvT+IHmDr9xk600vkkUzeHS7IWMLec5m5mgf64tw4D/63P/c+0XsEzFIm70
wV059r8k53Bv6vk1vXKp1cRIcJwaHgej9et7G/ms3/8qDIvU7hMudfagtpokCskS
AqN20HMVJ+ba+DZquq3w6ZRuE8ZhUhO6HDER8/irW05k7k2i6eowlzrx7W7mX5xL
oo7u9xyoVEIXan4nPqjiWMHo+uy81g==
=PMAQ
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--

--===============2194381986526872617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2194381986526872617==--
