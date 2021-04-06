Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3217335528F
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 13:44:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D61EAC5719D;
	Tue,  6 Apr 2021 11:44:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FB05C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 11:44:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54559613A3;
 Tue,  6 Apr 2021 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617709453;
 bh=2Vm9ityjyZldn07RFATp/5Z6vJvrtF34+UIuw8/w51g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GReFQWQpMbEkyEVsTKHs7ItqEeoFaP16m5Z3rbHGee/xUg8t97DrCK353XkdbGbf9
 lao7igukf7FQKFGApt0frZlorzz/1m9K6PSQnaNs8KWGe74p49eVqMnMWSMWr/eWb6
 h0E6V8WCjhzowkzHQKaBkT6y+Zl0z1OLo0UBhroRVCHDhJe0Nw2db833UnCeJjEsF5
 vFXsftpWcfKnGw/Wg7KJBeV7IdlAJh6JaV2qku9wWyxeJQCnvfMWFJ4nXmMzAkQKYp
 MBgfG9A4tCMG1nh+ayjA722WXw/iGJ434k7CUQ3wegQio0D9yZSJwuwQyNNFxp3+dF
 yc6IGZsD1CfUg==
Date: Tue, 6 Apr 2021 12:43:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20210406114357.GC6443@sirena.org.uk>
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
X-Cookie: BARBARA STANWYCK makes me nervous!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Stephen Boyd <sboyd@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] pwm: Rename pwm_get_state() to better
 reflect its semantic
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
Content-Type: multipart/mixed; boundary="===============4796246739623601211=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4796246739623601211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline


--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 09:30:36AM +0200, Uwe Kleine-K=F6nig wrote:
> Given that lowlevel drivers usually cannot implement exactly what a
> consumer requests with pwm_apply_state() there is some rounding involved.

Acked-by: Mark Brown <broonie@kernel.org>

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBsSXwACgkQJNaLcl1U
h9CeAAgAg9/Q2RgSOxhbh64cI3whEBi2rDoy4JrnVOIaezDbl1KVpYtyba0y715D
Y+27eAxh97zRr3AOb8di8IGVTcKZqEJvwbFWeAxIYTqr7yewyfFV2r3+aj1n6uji
E06xtLVSajGadFJ8cwDdQmB2HGTiOraS8BIQTq8UgV4X6S2LOC6RRZ/BADXxlSXZ
awgIor1dw+uVGentYfCseXYt3xOeoBGm1kcv2bLWZOf7p34NrBErZxEelYeZycnR
FVaAHx4aGe2/1xPGOYGRdXxub+JSiKOXp8tFNWDNnrr/343S2A8pBE8u1GWqB2tu
i/C2E1EQmwot6hIKN5/6hIg/LOb4cA==
=bscb
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--

--===============4796246739623601211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4796246739623601211==--
