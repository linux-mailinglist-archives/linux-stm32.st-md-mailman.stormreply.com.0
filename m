Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1827C5BB
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Sep 2020 13:38:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2A45C36B37;
	Tue, 29 Sep 2020 11:38:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D9BAC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Sep 2020 11:38:45 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6554921924;
 Tue, 29 Sep 2020 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601379523;
 bh=a1gSTFeVH3iQKCsomWRRIF1vuKiVS5UiB6voFxEywig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hdzI0LjRLhiFG0H47FIBQWDcq5DX1OrXKHvX76qVWK0yBh7qixa5RtPKtcE8g49eP
 849mw8WVqgX3AJpUqyOH01WQOeFbrbw/M492DQxRltPOst6YZTph/nyc+VD+s81Egu
 Ct3VdN9U6DSJGkK9104YvlYtXkg0L6SNaTM2JCZ4=
Date: Tue, 29 Sep 2020 12:37:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20200929113745.GB4799@sirena.org.uk>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
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
 Julia Lawall <Julia.Lawall@inria.fr>, linux-crypto@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============0928786492019887203=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0928786492019887203==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2020 at 05:45:24PM -0700, Joe Perches wrote:
> On Mon, 2020-09-28 at 20:35 +0100, Mark Brown wrote:

> > [1/1] regmap: debugfs: use semicolons rather than commas to separate statements
> >       commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee

> Rather than replying to the 0/n cover letter to a patch
> series, can you reply to each of the specific patches in
> the patch series you are applying?

> Otherwise, it's a bit difficult to figure out which patches
> you are applying.

Feel free to submit patches to b4.  Ideally things like this wouldn't be
being sent as serieses in the first place, there's no dependencies or
interactions between the patches.

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9zHIgACgkQJNaLcl1U
h9AUrQf/V6+K22eTWHbMJo7Z/GUR0aZ8ZbPiLfJjhWnbSq+gQVC1xnbSwQx7hDlv
+AoeDaVjgmnGS3YtW/c1K8e4d2SFvxR89a5I5U/dEtc/j/N/5vnGgwxjLDfN5xUC
lV2F+ftiHGIRzn0ojcUVOj6hEIqnGvkQe17key6Po0TlZuuoZE+eh3mfbajDeYCs
/BJ39skDi0g8xqOY8V8qZAoH/Bowz0xIroEbdg0zbM78UIOi2Fzxl5MSXapN2Cd7
o9QO7lsPCWxberp7ZwIUg6cvYQnjBE4ZZRGsfnzuPRH4fptLRzDSZRJCSW6IqH8s
j8rUaeCv+XQBPjpBvj3FJIUWXyI5QQ==
=kEnh
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--

--===============0928786492019887203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0928786492019887203==--
