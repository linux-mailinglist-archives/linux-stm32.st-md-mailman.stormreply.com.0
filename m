Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82727CCB3
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Sep 2020 14:38:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77978C36B37;
	Tue, 29 Sep 2020 12:38:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09D6EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Sep 2020 12:38:36 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74C452075F;
 Tue, 29 Sep 2020 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601383113;
 bh=1agHRxXJKhB2RD26+gZ4x8RWV4EKhITxeEYpiuBbO3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWmjA8UFdsFWnaqLQDJfMWuIbOP31zKYrwaHNjRkhgkkbyol6UJQNOL2g65mEmM7z
 r3wh0aEAIXzhRSusZ2U0MLVqmtsLu8t/8GK56UP3hceV/6s4ECE+CCU/O8tZzN6Rvf
 K42OX9LCLHmQUHnGEYx+BhHjmTGzPz+rvHs8rKnU=
Date: Tue, 29 Sep 2020 13:37:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20200929123734.GC4799@sirena.org.uk>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2009291344590.2808@hadrien>
X-Cookie: I left my WALLET in the BATHROOM!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Joe Perches <joe@perches.com>,
 openipmi-developer@lists.sourceforge.net
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
Content-Type: multipart/mixed; boundary="===============0913389899155449256=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0913389899155449256==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 29, 2020 at 01:46:19PM +0200, Julia Lawall wrote:
> On Tue, 29 Sep 2020, Mark Brown wrote:

> > Feel free to submit patches to b4.  Ideally things like this wouldn't be
> > being sent as serieses in the first place, there's no dependencies or
> > interactions between the patches.

> It was suggested (a long time ago, not with respect to this patch in
> particular) that sending such patches in a series is useful because it
> allows people who are not interested in the 18 patches to skip over them
> more easily.  So there are two conflicting needs...

I'm not convinced that there are huge numbers of people reading LKML as
a list TBH, and if you are sending things as a series then the way
you're doing it at the minute where you don't CC the cover letter to
people makes things confusing as it's unclear if there are dependencies
to worry about.

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9zKo0ACgkQJNaLcl1U
h9BJ9wf4mEIT3UglAONn9EPv4I6DolXuWfJHGs52mxyy1JeuXGyjVMYRuKfw8ZE5
TbgRR0pAg1aZUsqI/T/PWSVDmUCNzL6QM4RbG8ZUSFw47v509iCABBidbK+PLnwo
y5A+IrAPTDVviLFNJm2SfFN3XEgpsGmOqhyuhKiGNeLOryaPNvOmiRF6cwND7Vbq
97kDmafX0KgHVsmK/br50D/XJpOJSR9T2hB5hjQRoVl44a6aV0eZWwDDZyH57kat
KO59OyGGHDyWrsF9oHWajymCB1kMZZ4YLiwCyjx98g74uRLSiSaGwrsr4IeXGn66
Mmpn90mfVDnP/Es10vbKsC+JZShG
=qH7V
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--

--===============0913389899155449256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0913389899155449256==--
