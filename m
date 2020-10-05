Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E687283CD2
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 18:53:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23416C32EA7;
	Mon,  5 Oct 2020 16:53:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA846C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 16:53:11 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BDA1207BC;
 Mon,  5 Oct 2020 16:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601916790;
 bh=p/E99tTjql4QstxaT4SSl5drfyNj4h+kQn/1L+FU6Hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gBC/IzIeywxmI9gsb/JTsx+zOOUJIooFw3wfYC06TBiHzICVtnlgNaAv/yO1EfA51
 zVseZLj5T0M70hmLa6qq17YAe111X+Q9rT1NlLPW8KVTi2SkXaQsGts5rIE+F43U3z
 nybuOkwnpLc2tf4yEu29xxvUOBIsDUDyDKfTSVTQ=
Date: Mon, 5 Oct 2020 17:52:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20201005165206.GA2440@sirena.org.uk>
References: <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
 <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
 <alpine.DEB.2.22.394.2010032118420.2741@hadrien>
 <20201003193137.z2bpwzlz5a66kkex@chatter.i7.local>
 <9ab43333596f08abbbbbf1fa8cdf1ded4b65af2a.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <9ab43333596f08abbbbbf1fa8cdf1ded4b65af2a.camel@perches.com>
X-Cookie: God is real, unless declared integer.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <julia.lawall@inria.fr>, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, tools@linux.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/18] use semicolons rather than commas
 to separate statements
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
Content-Type: multipart/mixed; boundary="===============2441999309734016978=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2441999309734016978==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2020 at 12:43:13PM -0700, Joe Perches wrote:
> On Sat, 2020-10-03 at 15:31 -0400, Konstantin Ryabitsev wrote:

> > I'm worried that this can get unwieldy for series of 50 patches where 4=
9=20
> > got applied. Would the following be better:

=2E..

> > A subset of these patches was applied to
> >=20
> >   https://...
> >=20
> > Thanks!
> >=20
> > [5/18] regmap: debugfs:
> >        commit:

It's definitely an improvement but TBH I'm not sure how much it's going
to help those struggling to parse the current messages.

> > I think this is a better solution than potentially flooding everyone=20
> > with 49 emails.

I would tend to prefer cutting down on mail volume but I don't think
there's any way to keep everyone happy with this stuff.

> I think it would be better to reply individually as
> the likelihood that the maintainer skips just a few
> patches of a large series is relatively low.

It's not at all unusual for driver updates to both add new DT bindings
(either for entirely new drivers or new properties/compatibles for
existing drivers) and also have DTS file updates using those bindings,
these go via separate trees.

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97TzUACgkQJNaLcl1U
h9DI9Qf/dhOghwYGEqexRQ644ACI4w9j7rH7Z4qsTYl+rdj06q5wrcOFnyypjB/j
N/Qx3llsTbG0UagMLyGeuFi5bzhxALnrvmrbv8cBPI0/3jS2D7u22cD5m6toS+Tp
f08tgo7VkjfkB3QCZn9A7XGAPq3bEvoaCvFalxqGt0FPUw5kVGrboVa1dgJCzRL/
CtWXDQfG9vy5ZVs0cY+s+O9yvAbrZJyMPaKkeoa7dwnqzOQz1Ga4ADtUZsUWyieK
wuCO/HNGdf77CmSbOuG6BMrWi5SGoEtRmVO+w5NmYO1yOfnooSih3uWDR4H01xVg
3zFgbOHRZMIwAEzTfTqRA4vzPMXRQQ==
=wwYC
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============2441999309734016978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2441999309734016978==--
