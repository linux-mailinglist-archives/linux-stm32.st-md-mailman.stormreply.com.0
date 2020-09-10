Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2A263D45
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Sep 2020 08:27:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C53D8C3FAFE;
	Thu, 10 Sep 2020 06:27:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50DD7C3FAE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 06:27:13 +0000 (UTC)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EA4A207EA;
 Thu, 10 Sep 2020 06:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599719232;
 bh=Gm5FP8nCLsvEkfvRpd3DNlXiO/khQnSfhfWHWBBmjY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=etU4Y2hicXxYTNu/4kWYn9Al5j8eZkOpVlo2pD0o1ZsWbpO8yQItP3MmmeCtXmeSe
 fyvU9aDyHqv0zV0t5Qq9zQ5V1TzIGX8u0YUgsApk05uWFgTZuWfYcPmjEM53hyKvc7
 5F65oqU/5kMGkwkHBLR+LePV9sqD9cHQMPpUiAVQ=
Date: Thu, 10 Sep 2020 08:27:09 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200910062708.GG1031@ninjato>
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-6-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-6-krzk@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 6/9] i2c: imx: Simplify with
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
Content-Type: multipart/mixed; boundary="===============8234833088371000017=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8234833088371000017==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sLx0z+5FKKtIVDwd"
Content-Disposition: inline


--sLx0z+5FKKtIVDwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:40PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks, but this patch was a bit earlier:

http://patchwork.ozlabs.org/project/linux-i2c/patch/1597203954-1803-1-git-s=
end-email-Anson.Huang@nxp.com/


--sLx0z+5FKKtIVDwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZxzwACgkQFA3kzBSg
KbYCNhAAo2nfbP6Dmy9CcAEl/QKmFLjmjJKUIQb45IeuIZWlBMUc7gk6SBrqectE
PTAyWBluLF8Pub2rqHtIuQZBEu19HG2reXcyNugVvoz64rUFksRUw0Ap3CJW3MBC
81/i1SLsMp6gNhXUz7T+2JypfIu/XRYB5sMYVFCLFzstxepY15cQ6DwV37ARpJDp
Z9n5uD9qNgcCmerP8TZC6HIwLSa4FDwJ1U2MYzWHp7IVIEA6OwshA/g7b28J/VBU
egPLlaDRy9utqwMH1LqBJe9e8+yB52M/VI6ao4iA5qaMzdy9wROhiigkSJxRK/RS
sx33t55k+3q9CfSiVhOuVepKetiNyTMEvXvOf8DvXqfPeUzIaZr0xKU3vnTa8kE8
RDjC9mDy1aeH92gJxwhDPg90G9kaoz2G8unIynr5aS+5qGnPMQnK3nSn5IGVktD9
aYtx0xQw1Io+BYoyE/W4gW6xOO4MROaqU354P1y+DodMVLrkfv8pluItqu9363cY
NRkePoQnoWP2Ac2/cP7e7bY3P/ha7SNWMLS0FRpAitYAREilgiaABW2T+2v1WoNt
6V6Oy97ceBSNxLuVTLEGWPqJasIk07gTR5SyB4i+doS+wDwfiHh1codmfOyErKz0
00w5u9BN78VIAkriPGp/xz5a2rptVGvT0ovdvT6jsypdGplR1tM=
=5W+d
-----END PGP SIGNATURE-----

--sLx0z+5FKKtIVDwd--

--===============8234833088371000017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8234833088371000017==--
