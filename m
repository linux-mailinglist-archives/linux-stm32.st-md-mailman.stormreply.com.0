Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D927FE00
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Oct 2020 13:02:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6100DC3FAFF;
	Thu,  1 Oct 2020 11:02:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C533FC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Oct 2020 11:02:51 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D93AE20B1F;
 Thu,  1 Oct 2020 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601550170;
 bh=xYiMC3INrKF34oEyrsmUUrqjbwI/zSijaQlQHN9HorA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KEei53PbBIIkdzQLDb/7K/52YSbflBQYn3bG/m713eKa8/9nV0fPPDI4yq6H+/fvV
 xVqht4hR38nzz4Qgnh/AAp0mk+5WyFzIOOYfEFPMoUP75ral06RLc43LxHUnNG4hb1
 tZZP4hijlYOR/icBsCoZV1jH7RB2VuKegMZKFfws=
Date: Thu, 1 Oct 2020 12:01:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20201001110150.GA6715@sirena.org.uk>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
X-Cookie: Stay away from flying saucers today.
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
Content-Type: multipart/mixed; boundary="===============4702369943399350610=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4702369943399350610==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 12:33:39PM -0700, Joe Perches wrote:
> On Tue, 2020-09-29 at 12:37 +0100, Mark Brown wrote:

> > Feel free to submit patches to b4.

> Have you tried the existing option to send
> thank you's on a specific ranges of patches?

I am relying on b4 to identify which patches that I've downloaded are in
the pushed branches.  Given that it explicitly lists the patches that
are applied it appears to be doing an OK job here.

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl91tx4ACgkQJNaLcl1U
h9D1IAf/a6Dh+mjW+LjpuCd+hkWCJa8iJTLmYSy9suf32mX9fM1T/gbOLQ1RJtu4
ZQP0A5w52htIbRIWtYHrgtZQGXrq2SIm+peRmnKP0DXly+Fj0/G0zxg4lqxKzXtV
+XpQjLbvcjF6JIV1ok5ScRg5HH8bfLJQvbGBbpmL9pvI+WniF4smB5bQRwd3qWEf
MrBNI79S+kr1Cvjxnya+/TP7O4TtOQzzpB695ejEGvqxlTJQM5GGaZTLNJlBivOz
ygXvOFlrffOajvN1K7URe41xznaDG4+c8pfziFXllSoEGp3yzANBNTtCGEvny0SY
Nx0W3O8/sebfFJPHQ89w2atWG/nVEQ==
=onQ8
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--

--===============4702369943399350610==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4702369943399350610==--
