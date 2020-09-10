Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE3263D35
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 08:24:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5946EC3FAE2;
	Thu, 10 Sep 2020 06:24:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C08D7C36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:24:51 +0000 (UTC)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5BCF207DE;
 Thu, 10 Sep 2020 06:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599719089;
 bh=YYdbufaGVHlqO4nKD2x3a6t2VMqS5rsZ1vep5b/qwAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aTAXkxtLEunJFDT7fR21mpntjBM1h5RX7bLwZGytsLNRI6f9ocxRQhQ3P1zD9DYAi
 hKiIw0BWQy+ig7qo9I/QWmxojJQ7ybNsK/S+m3pCv2dBD0gVFTmozjlhPJiG6XDPjx
 285R+8i4zWAgog4LQ+tLw3BkQzLJEu8AG3RmQ66U=
Date: Thu, 10 Sep 2020 08:24:46 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200910062446.GD1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-8-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-8-krzk@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 8/9] i2c: mux: gpmux: Simplify with
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
Content-Type: multipart/mixed; boundary="===============2062257891426857286=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2062257891426857286==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:42PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Zxq4ACgkQFA3kzBSg
KbbgJg/9GSHP1qRdFGhNdLgjcwkknpOwbjsZrYyXVYeYuUFbx9XQPf55dRd2yB28
h6D02c/8cGep4CPrKQQDUpg/yFqTXV16AniUtjv8w0mP+BlBsyZ/GWhjUIsYxnHG
Ff9l2LogCfDSoy3ZV5GLyELiGN0Ex3W1m6X5vjj+u3/pBMANwC6sUp89CmqgCic7
IBX2wORSVUtvnA1cfA9ecn556CmTIWg9UzbGGV5/bPPItVALZ9gejg8CjHjaol/6
mSUYdfaawrNZE9GYWP0iypPzu1qIdvPCcV38nbVp1/Y5DRA5bYD+NV3Yfc9MpLpK
Ws+kpqElTyzcqorAABjk9TYUMa0CwEMfH40YysuupfdFRrZqkxMTtHQQ1DDhd//a
p35eewasMSRaFzPalg5jAYX1WylSCi68O/o7tcmetO+4O0/z2yjTKrHsynaGKDpP
6wy1pRywMx7ppAWamk1/4JQiq6KbpfjDK/0cbHVTigzUfCVvw0F6stAmUwqfV4dg
/Osc9IuAXWlyax4rOcbWB5HsYXuPf5m3nqTNlHyYpFEThj0S8AfeyM8Zy1sDZ1SY
Zk7VVFPPAIfDqfWlNMLhYTGrynwXjsDXW5gUUE71PccXJ2P1ZsbRO91fGDoZ+sIq
ZOWfSEl1GHIwbSEmf06MM+fQNRg8WM3zA7EReBpW5GSntii3vpY=
=CslT
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--

--===============2062257891426857286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2062257891426857286==--
