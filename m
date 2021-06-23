Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E83B1E9C
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 18:26:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2856C5662F;
	Wed, 23 Jun 2021 16:26:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7E84C0612E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 16:26:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC5716100B;
 Wed, 23 Jun 2021 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624465587;
 bh=f8jfUGDIsGoDUvStlPo2ihoRuJM8S3wV5YVSk/OHcCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eqfj4zZDu0ioOWCBrvww4ZxvMGJhE9nMGHlhWzLes0djdv7HTnTjLDCTl0g8tcCgs
 iQkgvvIy0fgXnmbV+ODTej+fVL9zGrLO12ayD8unJwXKDd3SD36h6pYvzu+VekLUeP
 mSUyg5XWmFNYCBPJoa4ZBUuUWK24KANZx10nmNlgt4M7pVnB7/19dUt7rGlEdw5Pa9
 V8QH719yXK0XKiT0YbrmSXi5IeBvWI6tas9CLq0URN7FnzKksddIhLUcoR/nkuCuZr
 mY1zJy/vbtjoOSUlVXJ7sIASv+oG6EGFFx0ci3N1RSjzvBMZdBNBsdie+wN9Gj+cer
 VtstjKh4MXOjw==
Date: Wed, 23 Jun 2021 18:26:24 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <YNNgsLS1KtfNjBkc@kunai>
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
 <20200902150643.14839-5-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-5-krzk@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 5/9] i2c: davinci: Simplify with
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
Content-Type: multipart/mixed; boundary="===============5242374724166569937=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5242374724166569937==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="McslsymjVjCUswlO"
Content-Disposition: inline


--McslsymjVjCUswlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:39PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--McslsymjVjCUswlO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTYLAACgkQFA3kzBSg
KbYqLw//dsYnYLS1NUVJkuErYmMje539th7kKWQS4WdI9gO/feZZv2DPwLXkj3e7
g1+xg2fngE9iEP/phJ4r26wYV1Lo2JJChg+xfUxdpI0ZDJWYdoHLnsTPw3mhim5J
+6sNaGcq/JcN46iW8J5sM+Q0ZHWOpjO5b7rZSMyBNh4brDm8uKKo5r1de1ZEoCrl
UOPDtX1I4wgUJ7kma1CE7qsp7moZAptyaPNLcLEFjgzIzAVPQFC6lRPGhzeQqKTa
i0foiKovC3gOX15EcaMGXUzxJnPw85tVHWuTLL52uCNpNaHLAIsN3Jo1G+JyypSs
4TgTEGPGDCwE50tBn3dugKEr6yxp01YcLJMTis1mIoiDxAM1MzHYIlkgQu4oZ9pV
hAzPdEIqY6dkItB51HKO6K067v0B6jEQgyX2huAL+71VTZ5yr5EVb1YcVcH4VSJL
91osHWWFSVvzjXAks3rYKd2E92jVwxfidX0usCy/2hyGdTNUYknUZDe3meytFkMK
I7p6iIBzEgCMt9ZXtH91BbmuvFYmNzFdFSNQ6/gqryHV07rsTqImxgtVTzzs1N3M
SDJOAG8lWb+LqIf6sjM2MBIJ0FQcSkiaXyA7JBt4VndRg4+AHyJCUsqkavL9Twa3
3tTsk+zvhYgCWAkALzhR1xiVrQkruqEF+CYWHz0BwwOXzzVe3PE=
=2cJu
-----END PGP SIGNATURE-----

--McslsymjVjCUswlO--

--===============5242374724166569937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5242374724166569937==--
