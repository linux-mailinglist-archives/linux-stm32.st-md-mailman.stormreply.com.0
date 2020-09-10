Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A7263D3C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 08:25:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FACCC3FAFE;
	Thu, 10 Sep 2020 06:25:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 712CEC36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:25:37 +0000 (UTC)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1703A206A1;
 Thu, 10 Sep 2020 06:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599719136;
 bh=1tmPJGIkpBXHgR/46GF8TeWUiMz2EH43SrJ8FMzonN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXaXfT1gOvjM9QB5dCOqR58HhVflow1+Q+bmi9oYJZdyWEd3X6svuE1JTuswzqWqg
 1jmkkGWmaKl1PXdy/VCMIjw2b8PtEY7ioBS6LQX8JyTGqsHG1l/VPZoHMmFzki/SJR
 cseoRUmUBSndK4MRfpeGrkR8H+RiqbHr5/q/p+s4=
Date: Thu, 10 Sep 2020 08:25:33 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200910062533.GF1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-3-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-3-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Heiko Stuebner <heiko@sntech.de>, Sekhar Nori <nsekhar@ti.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-i2c@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
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
Subject: Re: [Linux-stm32] [PATCH 3/9] i2c: bcm2835: Simplify with
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
Content-Type: multipart/mixed; boundary="===============6913147992637992493=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6913147992637992493==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:37PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxtwACgkQFA3kzBSg
KbaeHg//TExyGapDctpG3/NfiZUK8fRTxopI6eApuGkuRNFi4dDR7IN7TnG4JBIC
ZzQa6MIT0nKsWK8hVRcGpEFYgU5pyxXvjT7UWr+EHD4sYaTJRocZVvNjC1D4FZhh
JjgPJ6zbcneONv5izf77WadDSDkGXZ/PFo03gqW/NIaXx64YyCIp9LkPdqFqHYrw
cmlC7ZMWUIVIBvITbES4MaW+h3byshkSNdy+45RPf15CH4w27YJubcFWlOozdWg5
T4hRK0XLKuBzjvNF/K+tj8OPyWUHQS17P0M1fJ6orSo5XnkANcac9crhTSA2+mQG
vOFCYGFh4ctXFYb2l4N+q2sZvqqjItcntGkQGYMNs0naoFN6rdIo9KYhhbU9nx9T
JcYuUVKxv2mITRhD+Lvq0YfxJmKYoqpnGeN6I5UIqcV9QH3n1VKZOA6CwXVhgVaM
L4CSVfQak+iqj3Yxz5D3p22uF5788jHRW8nKuR/aqQvyTB7nHYwTQR97jQWtpxuA
b6aG1tecsKP4GxXhKozl1twrAtk0wqvvz/MrY7XDlTOwq4vDSgVioSSkPaw0G6E3
n3BhV5CVQbBdSvFxg6IVpNsvGxGWOoEZFfvNup+6Q2DDqLiX556mvvt+0iJSoBgz
ZS6M10mqVyirKjO9YWLDD4yUCx9VLgDUuXPdaNcLqvnpnlmipjs=
=NMWb
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--

--===============6913147992637992493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6913147992637992493==--
