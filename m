Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42111CADF7E
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Dec 2025 19:14:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A6DC57B72;
	Mon,  8 Dec 2025 18:14:20 +0000 (UTC)
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F6BC1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Dec 2025 18:14:18 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 4B6571F8005E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Dec 2025 18:13:59 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id A5791B121BF; Mon,  8 Dec 2025 18:13:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
 autolearn=disabled version=4.0.0
Received: from shepard (unknown [192.168.1.1])
 by laika.paulk.fr (Postfix) with ESMTPSA id 74EE8B121BB;
 Mon,  8 Dec 2025 18:13:53 +0000 (UTC)
Date: Mon, 8 Dec 2025 19:13:50 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aTcVXrUXVsyjaT22@shepard>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
MIME-Version: 1.0
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============5529956758356124792=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5529956758356124792==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z9eEZ2V8rb9VqsSG"
Content-Disposition: inline


--z9eEZ2V8rb9VqsSG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=3D216748
>=20
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that we=
re noise).

[...]

> DRM_KMS_DMA_HELPER ---
> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER

For these two, the symbol was removed in commit
09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
missed by the batch rename or were introduced a bit later.

Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
drivers), it should be replaced with DRM_GEM_CMA_HELPER.

Are you expecting to craft a patch for fixing this or should I do it myself?

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--z9eEZ2V8rb9VqsSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmk3FV4ACgkQhP3B6o/u
lQxHMA/9EINPzAC/mNsqKqe+ejzVAFDvbkqgtj46jdHchIRyg5QqUNEoQvUKACwR
bZftHenlJS3ho4n0eejvmJG9LkV6HYA4X0vXrPKGJTBCMgy1CUl7j7v8ZFn7qhcc
KmyK3klG9hxRNAFrMTlxaE3uzNZWaZ56eEINuq5RkJWv5ieiadTkXR03L4x2l++z
B1RqTh3yh5d57Ckfs7lLGfmiDUQAkhdAm1CASv6bO1jKRiyhuSN95aOZFZ94DV+m
oV44vbSx4aXyh1lb07PxtPMa+WITGI6/mW0+TKhRNd0eAoO19K0zkSNA18KjgiOw
3m/4Vs1pdWSKCTDIgtcymufTpdjqWt5LEpxEuzLprgUXrpoQbS7paAfhB4Ex6yIR
CcQfarVp0SM0/OI5kZc40xoz6UEHrCjw7+loxHuUV+2KHAhfRlQhLcScrQXUO/X3
L2vzAFURuGyVpPbZnq2ftkMT4h6o+W93ZtKP8vIHJjDijdwM3NAt90FT9byKXAYP
AvVBPERmf9+savPI0eDYuO825wAcF3D2rvF4ZElPj4+OD6sq93Z52bDN3CUFHsMD
tKp3GKwBxZ0ENUxQZvrIINzLx40EXOq/MDI1JZd4Nl89W5BBk6QGIRE4hj0FNctf
+4gCjq9z339Ik0u6aVtzq/jdewPuTo2wZ5DVPxsH1RyPX2cBWAg=
=azY3
-----END PGP SIGNATURE-----

--z9eEZ2V8rb9VqsSG--

--===============5529956758356124792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5529956758356124792==--
