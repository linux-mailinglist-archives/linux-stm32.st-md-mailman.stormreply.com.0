Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25BCB420E
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 23:10:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4B9DC1A981;
	Wed, 10 Dec 2025 22:10:29 +0000 (UTC)
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6D3DC290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 22:10:28 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 68E341F80060
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 22:09:52 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id ED573B127F5; Wed, 10 Dec 2025 22:09:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from collins (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id EBB48B127E9;
 Wed, 10 Dec 2025 22:09:35 +0000 (UTC)
Date: Wed, 10 Dec 2025 23:09:33 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Janne Grunau <j@jannau.net>
Message-ID: <aTnvnaRuJ5lF4dVv@collins>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
 <20251208200555.GA333481@robin.jannau.net>
MIME-Version: 1.0
In-Reply-To: <20251208200555.GA333481@robin.jannau.net>
Cc: linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, andrew.jones@linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
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
Content-Type: multipart/mixed; boundary="===============8134415186387671303=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8134415186387671303==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MEb6eXQ93P1+3Wd8"
Content-Disposition: inline


--MEb6eXQ93P1+3Wd8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Janne,

Le Mon 08 Dec 25, 21:05, Janne Grunau a =C3=A9crit :
> On Mon, Dec 08, 2025 at 07:13:50PM +0100, Paul Kocialkowski wrote:
> > Hi Randy,
> >=20
> > On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> > > from  https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
> > >=20
> > > The bugzilla entry includes a Perl script and a shell script.
> > > This is the edited result of running them (I removed some entries tha=
t were noise).
> >=20
> > [...]
> >=20
> > > DRM_KMS_DMA_HELPER ---
> > > drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> > > drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> >=20
> > For these two, the symbol was removed in commit
> > 09717af7d13d63df141ae6e71686289989d17efd
>=20
> That commit removed DRM_KMS_CMA_HELPER. Later commit 6bcfe8eaeef0
> ("drm/fb: rename FB CMA helpers to FB DMA helpers") renamed
> DRM_KMS_CMA_HELPER erroneously to DRM_KMS_DMA_HELPER.
>=20
> > but these two drivers either were
> > missed by the batch rename or were introduced a bit later.
>=20
> In the case of drivers/gpu/drm/adp/Kconfig it was missed much later
> during review (but iirc went through the same rename out of tree).
>=20
> > Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by =
the
> > drivers), it should be replaced with DRM_GEM_CMA_HELPER.
>=20
> That symbol doesn't exist anymore either. It's now DRM_GEM_DMA_HELPER
> which is already present in both files.

Thanks for the details! It seems that I was looking at an older tree.

> So the "select DRM_KMS_DMA_HELPER" lines can be removed from both files.

Good, then I'll craft a patch removing these two lines.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--MEb6eXQ93P1+3Wd8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmk5750ACgkQhP3B6o/u
lQxOag/+J9Lwmq+hqcg9BxoDCZl6KmFGAh/RmelPeBUew6LlQphMcDpjQ0yJavK3
bxojss4r12rV5307+f47JlSMFJa/100MablzoWV0koupx/JCRszhYf2w1lxYHKJh
7jwy8GLd9NnaZGaiscrckVEcfaVRufzSM2I6ErSZIMSYEZ1LUTCakTPAwrgtarZb
b9FzHmCrau56mdC2M6StWaolU90t4em1/We8XVRtLY87MEY/VQK6qLylL2fbpuIX
5+DjnOBDMrvyB7UJFVbzcQA4ev1ckCBvnB2JdzGOfquj6XTO23m5/L5qfxTVk6qa
yp9ShU6lQZ9RjinifpGWf8JTYl46U7hch9PrUCE/n0FgVl2frQHb/N08ynKUniCB
1U76zgnG48Wkj08Sz6anRvER3dqEhzJgxJxpkW1UqoXFOSBQeeJZzZONuuUxYw3M
8JKSldwJVj/oLlvCOI6QO0Q9T+U4YS1gpNBfHbysPaJgZyqld5tXaElOo9k8P8pX
kAMhcvAn6FaXqkX5qJOAN+91M+CkQwQlWf16G7HKV0LcOvzCtGHYWVrxb7xWw9Em
JBZRsrdq4CaQc34D8GkBR14H6WGWkGR4OQSTqxshPv7x/S4u9vV8FQWIhLW2LToY
kw9ephtALgBj6D79R84K2DGlmZwPH2sunV3y9huDh3SNlR5dZg8=
=EEMR
-----END PGP SIGNATURE-----

--MEb6eXQ93P1+3Wd8--

--===============8134415186387671303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8134415186387671303==--
