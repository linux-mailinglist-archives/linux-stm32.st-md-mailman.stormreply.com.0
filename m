Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B94BC3B1E9B
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 18:26:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77583C5662F;
	Wed, 23 Jun 2021 16:26:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 097B1C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 16:26:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F1D760FEE;
 Wed, 23 Jun 2021 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624465577;
 bh=vvKsxcawOIU7zaJ1jBb+8b/U8+WkJThvm04wURj4SMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cbTH33dUHXrd0FmIlJ6uBzJbjsqN3uycHS90voxRndM3GrMvgq1s+0PolD82WF2Tz
 Q1ZRHadFyslVuVGXVqLoW3oFaIPIGHPoYyY6IKJNOH4ISGNLF0ONjJLRsiaAGz8lIn
 kb1e/PeNd872slHmurnOoGlnPTz1fulOs23ZcPwQ8mQtrCDnn62rZBk1qFMAwDVQwV
 8GIzIhYeh02GSL41FcXv9zibzRQbiPpE/XeXMNxGh6fjUdYzsNT0HeaYH3qgHRCq9F
 0cjDu6GeOh80+KhGcQPZ4+FIS9F21D6f7fzIJGEX0jISpMLZalpwORbP0knzbP8tbx
 yhmpEe6r/IPpQ==
Date: Wed, 23 Jun 2021 18:26:15 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <YNNgpx8eMUuRH1y7@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Michal Simek <michal.simek@xilinx.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-4-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-4-krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Sekhar Nori <nsekhar@ti.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-i2c@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org,
 Michal Simek <michal.simek@xilinx.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Peter Rosin <peda@axentia.se>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Linux-stm32] [PATCH 4/9] i2c: cadence: Simplify with
	dev_err_probe()
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
Content-Type: multipart/mixed; boundary="===============0079759288318038947=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0079759288318038947==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yQCihXPE0Rw77HZd"
Content-Disposition: inline


--yQCihXPE0Rw77HZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:38PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--yQCihXPE0Rw77HZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTYKcACgkQFA3kzBSg
KbY0zw/+KHiicY05BPDAkNLs7LvofrF8GF9g4q4kNTv+0zHqKwrdbTJFdBOXoQDL
9L1VLCkQgAGYrDEFDyr5QTS7merRNCmWLg2NHVd57L15Gk0XqApSyo2ecEG1it4f
5HH9mrgym+WGmgcqVOw4c8DxZjywEFo8ls+y8VugOQyYzSdRgOAigzm8ywA/tLYo
YorHpmN4IVqbrhkXrsDTUZ9McG/n7XtJDZo9kBhKX279kQQIRfLkJ09mBTQm0zgw
FVaSgkqs9wbo3nfupnpUf8rc1nos0iIKz+W0/P1JWPESV7Krqiv1zUk27lY5ptHy
FWDvCK+/kBaJSjbYdEGixKXv2DsFQdbrzE9xi+19n1xzF7DtYmkOnk5lNKpxlB3z
cx5Laus/NvZtK6U36lK5HULjZ4DCIJEbTrjMsR9FRJNowPeKPnSLnfm6TIYiq8EJ
zDgsWhuZ3c7MZ/VS1WCZpxpNTjsEbm+bNmcO9RfyBVJif3To71mDsJjUcS2PdXIO
HuAurETnq5MRepPzAzOy3LPs/xoD0dEx/0oFx3UVJHLHL/URRH364keM5YS6vMMo
iJ+fYMPQ2zMLfBbGQA3/WFCjEDarJZPc0hqJTPyZLbZvAsjWFuMDVSR2oysB7zEy
JiQdi8m3PVKkShrA7dCkC/wCManU+MZ/HOeaitjlY80AQ0WfF70=
=kMfn
-----END PGP SIGNATURE-----

--yQCihXPE0Rw77HZd--

--===============0079759288318038947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0079759288318038947==--
