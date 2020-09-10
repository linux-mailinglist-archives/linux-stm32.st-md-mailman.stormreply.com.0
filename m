Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5803263D38
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 08:25:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C007C3FAE2;
	Thu, 10 Sep 2020 06:25:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 688C9C36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:25:01 +0000 (UTC)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 24B43207DE;
 Thu, 10 Sep 2020 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599719100;
 bh=//a6qxzEgSMZ3QQI7xw0qyPHvTAV/TNy95Zgt/g+v60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=seRvHY4AHQ3zjw168vBNI9Sn7KbMkxIoe0VjU9K3EMlgTQZOHNWQ2NzzfLYOyHMkz
 pqjU0IrB3AfuBWKvlDjQBkndrzSx2PhUnEUSQ3pC+DyOh1mx6YPspcWR+7pA+EKvQU
 jrQG/7gEMGYy2dft9u5scUMMtbQZhAxxM+u7Bd7g=
Date: Thu, 10 Sep 2020 08:24:56 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200910062456.GE1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-9-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-9-krzk@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 9/9] i2c: mux: reg: Simplify with
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
Content-Type: multipart/mixed; boundary="===============2598431388595458488=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2598431388595458488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline


--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:43PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxrgACgkQFA3kzBSg
KbYpRw//TLwPExzFBv8TTBphzRzCmoGKsmf5N3jW0O9HgZmAWVorubIMyACOmggd
S8mrJRk0d+HRsUq89l+y7MFDjo1wj86is7xBO4KQTm//nK0zqfeNNXMPGiFGwXa0
IhrTvGn91cJsUNDASSuVHPJUbXFxh62EiXYX+Va+RKJygyPRZEoEgQiaHoZf74sK
q3JETm2um6x2fCbPhIC4jN5TjvFwbnkiWFpUoZg5kQRao/qYCNbUY0XP0sQQMsPL
5PcpWM1HU505eGGIahQv8gl6ejxaz/w8K+GE7GSttBJ6T7/xy7ylqMnbB9sTFz7s
0+3VMAVcQKwFRq8mpU9lXuEc9cnzoyRVlOd3Dxi6QbSN2XIOoG+ipqgYq6ovIP1m
lAaYc+EfCRD9o2EdWkXMo5jh7Z+6FKfhnr0SVZphPcD/pfzFON/EEV4SN8aHxclL
YU6lEWItw9Fmo2XR8JRtLMtzKC+juNKrs6F7FnasrFV8W4BiF2AE5XzQDZ/keDfq
vS1/YnYBtYKGhFLHix56GRFIMsIXaa78ACwvGCIDk8qqrWHvOH3RCugI9CZMrizp
A79qLX53E+hRfgfowJP6LPZvWVWaSwXyBvvgmLGW3LRRfMYCCWy9goIfX3GzkpxB
caRa+RKl7G3B0fU/WQkKn/B0soM1EiUdQVSkmtGDxEb+v8bBzeU=
=oPRu
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--

--===============2598431388595458488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2598431388595458488==--
