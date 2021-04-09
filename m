Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0A359E53
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Apr 2021 14:08:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07621C5719D;
	Fri,  9 Apr 2021 12:08:43 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C330C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 12:08:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id mh7so8250291ejb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cEi4dBMf1BkmuY14gGbElJbBTh//wd4dN7gILare5wE=;
 b=pQ+ZrITvRJMq9gBKBD5zfu3ZTxMiQ0leTkBxsvGMVbkQw/+/nGowpbVKDkLnwkIvf1
 rr4UDyF83OUFNyun0b/I8NlZzgYFhUWaSZsBn00AYCh/72n3ePyYZVlPB/Ma40c6mdsk
 SOKXCjAuNMB5QXHfNXqBeE5RAcnyp3n0aG1Z/c5AVFW2SHNhN0P3e0RCLvosgCS85T1V
 shoITnsV/MmRNuMOih8rWULq78meoIiVsqp7Ll+G9nHexsotUoPN0MZsF7cNCgU10CpJ
 6URgdTD3ejvZc+FmgmuX49Rxa98bdXURDxEcTAzejG2L+vjnu0jzkWrXwhPBzD8cDx/t
 68GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cEi4dBMf1BkmuY14gGbElJbBTh//wd4dN7gILare5wE=;
 b=ckKq80QNrj3DokV+klNi1arcr59ca6iwINVz5HY/9JNiqr9flPRhVALALY59xRMkXf
 Ehnb4ereUKEyMC2arWaQ8xWgiwc6mbjlHb5TTlXkyOp/x5csReaidGTKl5hK8ZEWzsY9
 Y7ITRwwkTBpQFfdUXvh4Gh+IYvt5eiUU51Z2xzokQJvXMK7FszfdM4GgjOHYAZ87Orfx
 FSUdbqzGfHA98+zPr7TV49x6j0I4vhjXqDra+H5CVkvzVDQ1Mi5wqJJT6noj+8DnEqwZ
 NXaOKYVIcfjOSy6cSNET2GMh7+YFvPaLKqmsbxvkQ41SRPxHVWn8Szoh7IlH5UzeCmFw
 zgSg==
X-Gm-Message-State: AOAM532Ze5pvtmHw3GRry84hTBQ6+YdJjAd+eVfoXwDI6NoOTvyS7e26
 oIr8DpFAv5KoBqS4WEpwTt0=
X-Google-Smtp-Source: ABdhPJx8h9Pc3BjF3vRa5o1sWGyI42O8E2SC22STz2KAQ0OfGsoMxl6LpxVlci6LyxYc8HpCRIYF8g==
X-Received: by 2002:a17:906:1115:: with SMTP id
 h21mr16575768eja.352.1617970121833; 
 Fri, 09 Apr 2021 05:08:41 -0700 (PDT)
Received: from localhost (pd9e51abe.dip0.t-ipconnect.de. [217.229.26.190])
 by smtp.gmail.com with ESMTPSA id h13sm1345521edz.71.2021.04.09.05.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 05:08:40 -0700 (PDT)
Date: Fri, 9 Apr 2021 14:09:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YHBD7AhOJGyELpVZ@orome.fritz.box>
References: <20210406073036.26857-1-u.kleine-koenig@pengutronix.de>
 <YGxDD4jVZx/H/Zdr@orome.fritz.box>
 <20210406134356.dda74heeshkwdarw@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210406134356.dda74heeshkwdarw@pengutronix.de>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-input@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-pwm@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============4206911983901110862=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4206911983901110862==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PvYVwmcUBFdXJjNu"
Content-Disposition: inline


--PvYVwmcUBFdXJjNu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 03:43:56PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Thierry,
>=20
> On Tue, Apr 06, 2021 at 01:16:31PM +0200, Thierry Reding wrote:
> > On Tue, Apr 06, 2021 at 09:30:36AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Given that lowlevel drivers usually cannot implement exactly what a
> > > consumer requests with pwm_apply_state() there is some rounding invol=
ved.
> > >=20
> > > pwm_get_state() traditionally returned the setting that was requested=
 most
> > > recently by the consumer (opposed to what was actually implemented in
> > > hardware in reply to the last request). To make this semantic obvious
> > > rename the function.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  Documentation/driver-api/pwm.rst           |  6 +++-
> > >  drivers/clk/clk-pwm.c                      |  2 +-
> > >  drivers/gpu/drm/i915/display/intel_panel.c |  4 +--
> > >  drivers/input/misc/da7280.c                |  2 +-
> > >  drivers/input/misc/pwm-beeper.c            |  2 +-
> > >  drivers/input/misc/pwm-vibra.c             |  4 +--
> > >  drivers/pwm/core.c                         |  4 +--
> > >  drivers/pwm/pwm-atmel-hlcdc.c              |  2 +-
> > >  drivers/pwm/pwm-atmel.c                    |  2 +-
> > >  drivers/pwm/pwm-imx27.c                    |  2 +-
> > >  drivers/pwm/pwm-rockchip.c                 |  2 +-
> > >  drivers/pwm/pwm-stm32-lp.c                 |  4 +--
> > >  drivers/pwm/pwm-sun4i.c                    |  2 +-
> > >  drivers/pwm/sysfs.c                        | 18 ++++++------
> > >  drivers/regulator/pwm-regulator.c          |  4 +--
> > >  drivers/video/backlight/pwm_bl.c           | 10 +++----
> > >  include/linux/pwm.h                        | 34 ++++++++++++++------=
--
> > >  17 files changed, 59 insertions(+), 45 deletions(-)
> >=20
> > Honestly, I don't think this is worth the churn. If you think people
> > will easily get confused by this then a better solution might be to more
> > explicitly document the pwm_get_state() function to say exactly what it
> > returns.
>=20
> I'm not so optimistic that people become aware of the semantic just
> because there is documentation describing it and I strongly believe that
> a good name for functions is more important than accurate documentation.
>=20
> If you don't agree, what do you think about the updated wording in
> Documentation/driver-api/pwm.rst?

Yeah, that clarifies this a bit. I can apply that hunk of the patch
separately.

> > But there's no need to make life difficult for everyone by
> > renaming this to something as cumbersome as this.
>=20
> I don't expect any merge conflicts (and if still a problem occurs
> resolving should be trivial enough). So I obviously don't agree to your
> weighing.

I wasn't talking about merge conflicts but instead about the extra churn
of changing all consumers and having to type all these extra characters
for no benefit.

Thierry

--PvYVwmcUBFdXJjNu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBwQ+wACgkQ3SOs138+
s6FoaQ/9EG+snyNuisvtyU5qYi/2TVmPDZz6j1D/s1DAK1Op6AtOQksGAH7dqHgw
bT+jTMJi5bTnc4RSeUNrVFcVtb5qVWZEvN3D4c1wcr3PLtM8O4XxRQaMULo2+3pN
CCrHZKWyvB50hVFEs9CUSozlWk3HO/MNjef2MmwxBHiro1JBdAJivwFZEX8xQo2h
/y0HVDlrH2A1soG/WaGEeR6s3TzquHZiOawgNu51xgxIaxrEBs/ca7gBCuEfvy7d
Mu2yR+6VpjNWA0m3e53Nc4QkbQUDG89Thdf2i2HjVYsHX8wpVKWiA3OogCpVbTlQ
BUqEvvRQ5krW5IcneASEEKMOJSkX6zf86kC3RoYSbKmydCc6BlYVePr25yoTMAPK
XaYqd7i5ocueQZF5RdxrIXIoRgjU3Wu8v34N2mgaCCrHIwTHFJHAdim4h18Mbj+3
hVgZ+cuQ8Kaz0YjF4nAGQTQLsAQb7u7CjH6BqRzKUveMfInqD5wij6bP+jN0IYZA
4eUL5tfEdajQBvosPm4aQm0xULcg5jxq7rG/hpTa9y+J7s31IzXQ73dx2gse4kOt
0QY36evBxZKnvM5LGwWOkHK3aB8T2RqQP4l0kA9fmiQYYBudAL3VSEyE4mWU2Iza
P1UoRFFrCJ9K6dYBRX19nE+N1kAi2axBa0+KTMxQAUo0KzYGB0w=
=aO1m
-----END PGP SIGNATURE-----

--PvYVwmcUBFdXJjNu--

--===============4206911983901110862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4206911983901110862==--
