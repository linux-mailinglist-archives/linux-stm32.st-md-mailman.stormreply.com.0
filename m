Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 238086B4B23
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Mar 2023 16:31:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0E17C6A60C;
	Fri, 10 Mar 2023 15:31:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8636EC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Mar 2023 15:31:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E2876195A;
 Fri, 10 Mar 2023 15:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2C7C433EF;
 Fri, 10 Mar 2023 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678462312;
 bh=nUzOTuEgT91ilSzmzilIEFK3iqUy+T792nACm/ObXo8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVDFRff32CUeg4VYZc0KxwyW7FRibHcCgOsXmEDulirUJ1Y3IyxHc+k5rgu+krn+f
 LBLRHqN5iB4qujARfr6I9K6XSy+CpZYXKc9iBpNeqJgEQjktyxklC051kSVeXuXp86
 JVJvV5eicKe6jDyHOv2homy93sYvRn15szXjW3Tj1/dYeFN8Wt6oinxlLREFqNWcDj
 OiaZHKqvOX2i3j13+TXuGVlappDzZhw+hPOVsmKsc7A50KTP6aUO8ZEAsiAIbyz1QU
 Bmga1n6munzOp/7VgWSY+hRQ5BxxIuDpQJbVN4cUcijREMpgWaikEsXTllWMHmJTis
 IaWc+rpQsCniw==
Date: Fri, 10 Mar 2023 15:31:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZAtNZUifDt/Yl2qp@sirena.org.uk>
References: <20230310144732.1546328-1-robh@kernel.org>
 <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
 <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
X-Cookie: Single tasking: Just Say No.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-tegra@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] ASoC: Use of_property_present() for
 testing DT property presence
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
Content-Type: multipart/mixed; boundary="===============7877075296597694335=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7877075296597694335==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YQTqPomgC6kqCvBH"
Content-Disposition: inline


--YQTqPomgC6kqCvBH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 09:14:08AM -0600, Rob Herring wrote:
> On Fri, Mar 10, 2023 at 9:01=E2=80=AFAM Amadeusz S=C5=82awi=C5=84ski
> > On 3/10/2023 3:47 PM, Rob Herring wrote:

> > > -             if (of_get_property(ep,   "reg", NULL))
> > > +             if (of_property_present(ep,   "reg"))

> > Bit of nit picking, but any reason, why there are multiple spaces,
> > before "reg" here?

> Only because there was before and it was a scripted change.

Yeah, I don't think there's any reason for that - perhaps at some
point it caused the code to line up?

--YQTqPomgC6kqCvBH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQLTWQACgkQJNaLcl1U
h9Ap4gf9HaaXZcTMkFjkbHzWE/oyzg7IX24irsYTqkShQjQs79+TcFLpH/R2wAJP
D5Op6bvPzyNokg0rlIA1bPuTtJxvAOgboa9LobpsLRNso9ezIW/7c+IXmDfa1ZAB
eWXBs3HN4IXKkDybSV2eyC5e9wckRJQfOAx2OTMeT7AmNs1nWTw4Ls6sIbAKxh4o
osLdFick4HeMgxdZtNeTFr9dvlGqjkh6zR78oavbu132XUlvfqctErcIQ9qh4w7Y
8yGUubnPOeOfr54Z5iT1MgcgLXXiyuziWdWaRGupAV8WqKmf8O0HySGKr1w3IVYP
vyuuWuc++z0Kg8zh15H/vsdrTSVlUg==
=7fFJ
-----END PGP SIGNATURE-----

--YQTqPomgC6kqCvBH--

--===============7877075296597694335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7877075296597694335==--
