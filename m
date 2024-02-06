Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EAF84B2F0
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 11:59:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C48B6C6907A;
	Tue,  6 Feb 2024 10:59:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC96BC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 10:59:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9226C60FDA;
 Tue,  6 Feb 2024 10:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84048C433C7;
 Tue,  6 Feb 2024 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707217149;
 bh=m1COPvgI8DAgpxWvHI1P0CLUstxG49tEkR1RqUd5cuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HLYe5xSd1BGjdt9JytXSQ0iJHMFYUejuUzmpBDu+9ZMUDUoClQyZUKCSENVA5kT9m
 vgDc4b00j+NSnir3Glqca86K00a/o06TGHh1fnwCNkpUK6oWv8r0FqDkSO0NyJu0cZ
 rLFrF/CPpFp2oau3Py417CL7J0e9MbRZtJbWUM6VLnee8KwgN1HLnJbByom/tOK8Be
 Xk7aY8V3dII2cBKDeyVAEDbl+Lh5I3cJMobvDIsrE6XoBssIvvw0DkI5tDnIcGq67a
 AADmjAgVVue9m299igFPDFXSqzoIMywCIm2wuI/XFXnlIfAOSPv1rjiflwMEtKhD1l
 46W6CJKCQDr8Q==
Date: Tue, 6 Feb 2024 10:59:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <ZcIQ+f3F/hSU1Jcx@finisterre.sirena.org.uk>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
 <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
 <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVj1bS9s69ASrd5xULc8oELoBbnb8HEX9MEmA43853_EQ@mail.gmail.com>
X-Cookie: You might have mail.
Cc: neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com,
 support.opensource@diasemi.com, mazziesaccount@gmail.com,
 linux-kernel@vger.kernel.org, lee@kernel.org, rf@opensource.cirrus.com,
 linux-renesas-soc@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, Bo Liu <liubo03@inspur.com>,
 patches@opensource.cirrus.com, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 marek.vasut+renesas@gmail.com
Subject: Re: [Linux-stm32] [PATCH 00/18] mfd: convert to use maple tree
	register cache
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
Content-Type: multipart/mixed; boundary="===============8179319168062117909=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8179319168062117909==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wohqWBqzA9LyPZP8"
Content-Disposition: inline


--wohqWBqzA9LyPZP8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 11:14:11AM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 6, 2024 at 11:09=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:

> > There is a very small niche for devices where cache syncs are a
> > particularly important part of the workload where rbtree's choices might
> > give better performance, especially on systems with low end CPUs.

> The REGCACHE_* value is specified by the device, not by the CPU?

The device is going to dominate here, the main thing is how much of the
workload consists of syncs.

> While some of these MFD devices are on-SoC, and thus there is some
> relation between device and CPU, several others (e.g. PMICs) are
> external, and thus might be present on systems with a variety of CPU
> performance.

> Perhaps the value should depend on some CPU heuristic instead?

No.

--wohqWBqzA9LyPZP8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXCEPgACgkQJNaLcl1U
h9CLEQf/Q8Y34eZ58gNTCjgBWHllS9BWTNNoJRfggd2UXR/TK6Wux1Oco73AD+sp
j/x/FfZT9XT7iXbarZ87ZUfIEOS0Av7GhvLufUzoxtgfwbGkm+8sR96avkCzf8sX
WpZ5sICL8fs2NykKkJt76AWsgWaBOYnRgyZrIZ+0a1w+ZUiE5UYEb6TQ7IZZtKrE
EehYa/mJg3yWROqkiRtnEvouDAmIAgVH7rM2Vfj9G79uLyG4fsvvsuOEjQ5KMGMU
IQAfWU0Vik+XfvR3VhaP11Bd3wjt8noEbyksgDXNSHwDDNH1zytr6GrQJGJkkVh0
JB5leaIP9fDnAmofgyqoOqG6uUokNQ==
=UNpd
-----END PGP SIGNATURE-----

--wohqWBqzA9LyPZP8--

--===============8179319168062117909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8179319168062117909==--
