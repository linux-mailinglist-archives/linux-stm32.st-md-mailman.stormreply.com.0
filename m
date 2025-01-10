Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1540A090DA
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 13:43:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DCC7C78F6D;
	Fri, 10 Jan 2025 12:43:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEC5CC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 12:42:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCE6B5C10C3;
 Fri, 10 Jan 2025 12:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0816AC4CEDD;
 Fri, 10 Jan 2025 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736512977;
 bh=jQisMlTjYfeo02yHCaf8/3pDTMXN8QMfrZ/MAhEXiCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KpD0sW7UIABuucxd/Qx8pWVveKRBTPjoee4MF0KjKw8i5YDBoDzL5JYvu4BaELO0t
 M/U8H/SXs0PIabw+VP/Wmcv2zkse9maGzd/9rSoZgJ6hC/Lu3TEGJ9VrLXjmmeRFg1
 vFZp71KV7rVxbfsUrwau0sxqutt53V+fSRgOWgFQTeVLDgWzOazdvg68BZ9FapN4Et
 JWbE4PuKzWFwlzYvCA+Uzkc1/eq5V73FfErBUEePlT0QeeVOCwHPXy/saY0DV/C3w1
 EubDaTDdWlxizzmd69Sr4YfE+GSogwgowB31K0GFRmk2/goQYinjInn1BjN5IFfOdI
 Cy3tqd/O7Qjaw==
Date: Fri, 10 Jan 2025 12:42:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
 <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
X-Cookie: Many are cold, but few are frozen.
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, Steam Lin <stlin2@winbond.com>,
 Tali Perry <tali.perry1@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Raju Rangoju <Raju.Rangoju@amd.com>,
 Benjamin Fair <benjaminfair@google.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Joel Stanley <joel@jms.id.au>,
 linux-rockchip@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jacky Huang <ychuang3@nuvoton.com>, Sanjay R Mehta <sanju.mehta@amd.com>,
 linux-mediatek@lists.infradead.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 20/27] spi: spi-mem: Estimate the time
 taken by operations
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
Content-Type: multipart/mixed; boundary="===============6194154748779989889=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6194154748779989889==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RVMhmV/ewGAzdaKp"
Content-Disposition: inline


--RVMhmV/ewGAzdaKp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 24, 2024 at 06:06:05PM +0100, Miquel Raynal wrote:
> In the SPI-NAND layer, we currently make list of operation variants from
> the fastest one to the slowest and there is a bit of logic in the core
> to go over them and pick the first one that is supported by the
> controller, ie. the fastest one among the supported ops.

This breaks the build:

/build/stage/linux/drivers/spi/spi-mem.c:580:5: error: conflicting types fo=
r =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct spi_=
mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem_op *=
)=E2=80=99}
  580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/drivers/spi/spi-mem.c:12:
/build/stage/linux/include/linux/spi/spi-mem.h:427:5: note: previous declar=
ation of =E2=80=98spi_mem_calc_op_duration=E2=80=99 with type =E2=80=98u64(=
struct spi_mem *, struct spi_mem_op *)=E2=80=99 {aka =E2=80=98long long uns=
igned int(struct spi_mem *, struct spi_mem_op *)=E2=80=99}
  427 | u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op=
 *op);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/linux/linkage.h:7,
                 from /build/stage/linux/arch/arm/include/asm/bug.h:5,
                 from /build/stage/linux/include/linux/bug.h:5,
                 from /build/stage/linux/include/linux/thread_info.h:13,
                 from /build/stage/linux/include/linux/sched.h:14,
                 from /build/stage/linux/include/linux/ratelimit.h:6,
                 from /build/stage/linux/include/linux/dev_printk.h:16,
                 from /build/stage/linux/include/linux/device.h:15,
                 from /build/stage/linux/include/linux/dmaengine.h:8,
                 from /build/stage/linux/drivers/spi/spi-mem.c:8:
/build/stage/linux/drivers/spi/spi-mem.c:593:19: error: conflicting types f=
or =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct spi=
_mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem_op =
*)=E2=80=99}
  593 | EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/include/linux/export.h:56:28: note: in definition of mac=
ro =E2=80=98__EXPORT_SYMBOL=E2=80=99
   56 |         extern typeof(sym) sym;                                 \
      |                            ^~~
/build/stage/linux/include/linux/export.h:69:41: note: in expansion of macr=
o =E2=80=98_EXPORT_SYMBOL=E2=80=99
   69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
      |                                         ^~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-mem.c:593:1: note: in expansion of macro=
 =E2=80=98EXPORT_SYMBOL_GPL=E2=80=99
  593 | EXPORT_SYMBOL_GPL(spi_mem_calc_op_duration);
      | ^~~~~~~~~~~~~~~~~
/build/stage/linux/include/linux/spi/spi-mem.h:427:5: note: previous declar=
ation of =E2=80=98spi_mem_calc_op_duration=E2=80=99 with type =E2=80=98u64(=
struct spi_mem *, struct spi_mem_op *)=E2=80=99 {aka =E2=80=98long long uns=
igned int(struct spi_mem *, struct spi_mem_op *)=E2=80=99}
  427 | u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op=
 *op);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~

--RVMhmV/ewGAzdaKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBFcYACgkQJNaLcl1U
h9BhIgf+KXE1JExJo+WBN7mYcyQ4HitVxI+rVexdbI+QMmjPpB2umRebJU2u0F2O
zJlk5R6eGXdOn3H83H0CacUm11VVNZmqP1yUSytO4sjiyHdh7Zp70UkidrhA0O9F
pRM9l9bBbWV3FzLgZCYjZ03y6A+A9CrIsGRVAuX/rAUHENGshIN+Wa1j4ZwRkI+u
Nid4YWfQkB1UjSFhcx6d9iDq65hTlrHDn5ThFmIDGZCTS8NRcUAevtkdwoU9thC7
1xTCkJ92ejUGQ3TTzVrlg6qsnSJTAARPhDZ8WasEfN+L/LWyRI181QAMRKG4oOOi
swVXAClyqCX9avFjDoBP8aArkjRb4A==
=qXZ3
-----END PGP SIGNATURE-----

--RVMhmV/ewGAzdaKp--

--===============6194154748779989889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6194154748779989889==--
