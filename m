Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 938093551A9
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Apr 2021 13:16:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DBBBC5719D;
	Tue,  6 Apr 2021 11:16:03 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B782BC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Apr 2021 11:16:00 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id w3so21282960ejc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Apr 2021 04:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yVEDKiVUDMBOpgUCPiSByRWJFXrj0auSVMAOE9mqU+U=;
 b=eF4JkJr9jyFg9X/TymlZbfz77nC1P0sRTQUA4jzF2Pz25yTkHXNWicf0Y3N/KFEMBg
 KtSkAXw6WXUHAv+8G32fsEH635mZevPOihNO49sWpIUwQ8I+CT7CtQPtkW/QGFq++k4G
 DugHhWhubTu0yLiWjuT4VrSF+WfFquNFrxVCrC1TNcnPl0rMnOGvaV9aGYrbZAzbZNpu
 9yQpA9rBcDGa9ucFhda2RoVxLSvBByHuklnjvrjh/XFUcSAl0FBhHnUi5liXQC7P2Y7F
 amxG+oFeNkRZcvjRNXSyUoD3p7KU9lroDVDd7/X+I9p9hMyzHQ1rVvwPMlTMRP6CZn4f
 MRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yVEDKiVUDMBOpgUCPiSByRWJFXrj0auSVMAOE9mqU+U=;
 b=Uhj/cTgOI8wRtP6g25VV4FqvCq28fDlA9nRJuMd0bJEQbuk4df/buccxmBvxAgM8dv
 bYkpSuJL688rNNaX42R+WPzOlyNZKzpLEAEnxyPWCqKOwIiVaPEb7fTY+vWSIFnmqkTo
 cz7T5yysznQ4Bn92m91guRJojKd9foax6FH6RPyVKfQwSYGwFxT6jd8J8VON598xL5AE
 O0zL7Awh7qmLV+E3Y1dxhAkfRnjaOi3XzmOTjb+zrm0qfJrBHST4wdbtRG2zxiNjsbsS
 QIcpfdDzLQcTN8wBsDZ/NQb5pon6UQOLiJ6bo9CAZAQSDTBJmHjGzzb+p1f+a3ThCw9S
 BLLA==
X-Gm-Message-State: AOAM531s9NQlGIUxeM1GHLBsuDEUMDnsP7fp6Y5p8sARXeE48FPXJUTF
 0NUDEe5YyDmhvjw0GpnYOBM=
X-Google-Smtp-Source: ABdhPJySr3mBbF07VyzFBl9k8WSX0iBzHT1u+7rCFpmxkrk+5FOaupGQM5xmxtmv1+7X7Xid4NTPbA==
X-Received: by 2002:a17:907:2da7:: with SMTP id
 gt39mr1456317ejc.193.1617707760199; 
 Tue, 06 Apr 2021 04:16:00 -0700 (PDT)
Received: from localhost (p2e5be490.dip0.t-ipconnect.de. [46.91.228.144])
 by smtp.gmail.com with ESMTPSA id y24sm13894442eds.23.2021.04.06.04.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:15:58 -0700 (PDT)
Date: Tue, 6 Apr 2021 13:16:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YGxDD4jVZx/H/Zdr@orome.fritz.box>
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-input@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
Content-Type: multipart/mixed; boundary="===============0831143763940432380=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0831143763940432380==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kAjYvSBiDvNQ2JMa"
Content-Disposition: inline


--kAjYvSBiDvNQ2JMa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 09:30:36AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Given that lowlevel drivers usually cannot implement exactly what a
> consumer requests with pwm_apply_state() there is some rounding involved.
>=20
> pwm_get_state() traditionally returned the setting that was requested most
> recently by the consumer (opposed to what was actually implemented in
> hardware in reply to the last request). To make this semantic obvious
> rename the function.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  Documentation/driver-api/pwm.rst           |  6 +++-
>  drivers/clk/clk-pwm.c                      |  2 +-
>  drivers/gpu/drm/i915/display/intel_panel.c |  4 +--
>  drivers/input/misc/da7280.c                |  2 +-
>  drivers/input/misc/pwm-beeper.c            |  2 +-
>  drivers/input/misc/pwm-vibra.c             |  4 +--
>  drivers/pwm/core.c                         |  4 +--
>  drivers/pwm/pwm-atmel-hlcdc.c              |  2 +-
>  drivers/pwm/pwm-atmel.c                    |  2 +-
>  drivers/pwm/pwm-imx27.c                    |  2 +-
>  drivers/pwm/pwm-rockchip.c                 |  2 +-
>  drivers/pwm/pwm-stm32-lp.c                 |  4 +--
>  drivers/pwm/pwm-sun4i.c                    |  2 +-
>  drivers/pwm/sysfs.c                        | 18 ++++++------
>  drivers/regulator/pwm-regulator.c          |  4 +--
>  drivers/video/backlight/pwm_bl.c           | 10 +++----
>  include/linux/pwm.h                        | 34 ++++++++++++++--------
>  17 files changed, 59 insertions(+), 45 deletions(-)

Honestly, I don't think this is worth the churn. If you think people
will easily get confused by this then a better solution might be to more
explicitly document the pwm_get_state() function to say exactly what it
returns. But there's no need to make life difficult for everyone by
renaming this to something as cumbersome as this.

Thierry

--kAjYvSBiDvNQ2JMa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBsQwwACgkQ3SOs138+
s6ECqA//Zd57LkVbLnSm51dMJdU3OzbgvA2eSnrblJcbIJaVQX93rfojOCA72Loe
UqwrOYm9kh6H6Drl9Z2koBzoW1IW0UteSwPwn/KhORLXqdbDPnLWhQgEiMpykEIy
avZbWjX1fgz6pX0CGwmbns0dJs7knTCFroGMjOnZamRoU9fe5fj6MzhlPtIVluBz
LDUa5s1k74PnNc5REcD53DNOtFBWYUQa/2mv1MGIOKNdFmJBfb+gVJrayUN9iAmn
jVUy50BHt0Hrp6GunWAAEsjogOTtXbV+X2opyG3aXM/EMfCli06XHEsI+rTcHl07
F4cU9K4gQOprj2pQ+5CX3QZ1VPi17rk1/Ny5EoFMRIfPuFWQtiJIoWCG11eEv7Xv
D0at6sonV6l9zuH60/udcqMoq+ktq9v5bgCZJkY2lswkR1u4droUBsEaak7fm3/E
DfRVgSBTCVnPhEBtL06UXQURErSP6GFShSeOflPXKudYj2OPRb/xYSw5iLbJDL2U
L9o7KxbaYeSdNcT0q+ubQuegWdUfc289Om3VbTBPz8H61FpSsgt5YEpYGgpUx84G
ZQkIs5iv3dgUm0ip3GbUtT5FxHXUoqCRhFJBZfaCJMTEaBFlmT413aZthMWmdYJY
RJeTHFTLUaptPV26ZSqYpNRLr070C4wJMNCnleCoYFAJY/gdZ8w=
=zxs0
-----END PGP SIGNATURE-----

--kAjYvSBiDvNQ2JMa--

--===============0831143763940432380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0831143763940432380==--
