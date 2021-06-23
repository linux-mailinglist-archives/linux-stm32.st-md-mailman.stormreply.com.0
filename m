Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D53B1EA0
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 18:26:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 575E3C57196;
	Wed, 23 Jun 2021 16:26:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F131FC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 16:26:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E0456101D;
 Wed, 23 Jun 2021 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624465599;
 bh=x9Y32u8xKnq9y9RUCEeFlJlF/lSKVUF+efxe6yJZN4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fz4b58xSieSWwb4sHRoe4Lj2rrT7gQSIUzklMVC3obvRrjUTvDFLU4hCRQNC1cdJl
 FCRfpjjpGoomjQOmxBZGWbhJwhe0Lz35zllUWnm0z7787yx3Z09UX3GTt9zW2VZgkO
 zhwfEuYACVH6v/dBQI9T/hgXO06ZvTGs9OPOm9Q9AMD1bNqZ6Q9GnQ7eJCHzjpj+0b
 2hRndsgIxBEP3PiYNSJYhIGHF43COPjFViTmsde0QQA3aLXycwdukKQRKK5K7W3TdU
 NWhHAOkZNmaOwcygMLAsQMnK1JHOcc8GP5b6cvB176RsbB4lX3N53yKMTJh9CPVDN/
 DblZ3aUNa4vBA==
Date: Wed, 23 Jun 2021 18:26:36 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <YNNgvMKtG6Fg0Jee@kunai>
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
 <20200902150643.14839-2-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-2-krzk@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 2/9] i2c: xiic: Simplify with
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
Content-Type: multipart/mixed; boundary="===============1265018549439453717=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1265018549439453717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RyrFzM+QFbnSHop+"
Content-Disposition: inline


--RyrFzM+QFbnSHop+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:36PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--RyrFzM+QFbnSHop+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTYLwACgkQFA3kzBSg
KbaeVw//XoYX3KOAm8qeZlZZ1yMVkrOM8FdXdIkWJXp/6GWZ2CZw1O2bmnTmWLtu
oTpTQUJeibcURR6v0MX7SUFJHRRUMa0iN56HulVX2ficfGOhKBG2bh/YPbnOPKOc
kyc0oe4L9AXqWIs+XtNQHyCpV8rJoP73vIXSlYZVF6UbwNzDQl8c8Br6ryP1kY4I
Dd9XNXM6PnLYsmTJtnYZ4ZcGhn7YSYTaSUsoo8Ec+N51f9Aavi9dDDyqLl62kbZS
SQBlBigpHUw3XC7NNtKL8D5zyMfrvfIdbHyMGbIJ1lDUZ7oeXj55Gvk7qrI6eg4Y
d3SEELrApAwxisaWfKP/2BiECz5WL+eH4ak59S1Gs/s6M8x0/BncbRFmWRSyy+It
WSGxJhX0R2WU54ECN/JAjrVP75GPlIEc1gNpwkdCF1djAg9banpxKOe7dWNvFmrW
ezzm2no8S8BeoKxGnR1XBQhAd9Dqwor4V3qKWtSPYyS9uegAhllnXHIXp0nJxJNz
xk4XjBZaL9+0QCe6TfSdKO2skHGejTHnrCSpNKedXCd5ax1la/HHT7qhNu3fXPhC
2tS7osemPAXLJ/+5yBlFTD+SEMvAJTL/4PjUZmLlvOk0tn4lOTc38pk8bqzgUoZI
HW7ehBttpBwKxRgE42hdeJIj/MAAVxTzEyoYTO9qWEN1hJHH++E=
=ofX/
-----END PGP SIGNATURE-----

--RyrFzM+QFbnSHop+--

--===============1265018549439453717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1265018549439453717==--
