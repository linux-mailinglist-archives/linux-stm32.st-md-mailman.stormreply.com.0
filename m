Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C520627A232
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Sep 2020 20:01:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74A78C36B37;
	Sun, 27 Sep 2020 18:01:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 342F9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 18:01:39 +0000 (UTC)
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 690C4239EE;
 Sun, 27 Sep 2020 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601229698;
 bh=IxIVeKJYmD2WxR814QsH0EvlFMWfSB1OHN5F7yMa9aY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FaNdOR7tXX/2emfjfzen11ZnesKWs6RmkzODxKu5B3rlPe6M1ofY7E95DBRFRUd3c
 wzzgtWZLRrCEgJuQUTOTsBLuf/kWEhQbkkxkd3QSIg4v/Kst7Xi2NhBIQUuSOVlfKM
 UMkHjgCrO/ohRqJt7wKP0i1f3zKdQSV/ZX1RzZvQ=
Date: Sun, 27 Sep 2020 20:01:35 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200927180135.GA19475@kunai>
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
 <20200902150643.14839-7-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-7-krzk@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 7/9] i2c: rk3x: Simplify with
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
Content-Type: multipart/mixed; boundary="===============2309393553628756250=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2309393553628756250==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 05:06:41PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to for-next, thanks!


--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w03sACgkQFA3kzBSg
KbZBpQ//da1xjT5NZ0JR2DTtqFdK+FsDuAnixq1XMIfQfk7Kt2bOC1PK9NSqjDPb
TInsycWM2dKpYl1UptBYzlYchflgmox7nLNkkK9SEsnk8RE3THm3FzT32YkQH78M
+3fnm+nDELWNIm+W15ISJY4lnqRZV8+8Pf6j6oJ9wGJtAIZ7ee9qDPuCQrCMAI0j
xQvRN8+0OopUB8puW7pbthc+HgjigBSm0KIb3CQLMwhnhDRhYx5ah5XYmeFo3N8z
8zaAm4ewrNuVfY59fUjBk9jv/tJwPYKk26hVNAa0tHooY16OFf0Ia3HXXqAq03fL
c6mPsGtoYwnkKqNzV+1rpBncdpLRnlh0Fa/pljrZFwrvsOaU/NprJ8K7mrcYGanu
4r/OldG1HGuxkLPdYQTd5VtDfD331uQHqXsvwzBu2mIGnZC/GNWBjj/jrkXyEO1a
IM6CKwKRs+1KcCdZ+y04FA+bgs6T42a8B/JMXHH6sNi0TLigmTGgFTiqzXcyUgtF
DUNpDuuENgCG72wIHxAhThw289KqXqzsLWpZMTbWmtbAxYWAUeitRRUdS0dKAIbO
yqR9BhJWbGJFrzFv2yUwxtGOaz9n7/hRnmGn3hXv7BgFr7/H7z92WEW0bZEDC7QI
hJ/GkaTK5wbEbGa3XdVwcRoG9/Z6gmwrTMl1IF9dbdslWN4puls=
=3XWQ
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

--===============2309393553628756250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2309393553628756250==--
