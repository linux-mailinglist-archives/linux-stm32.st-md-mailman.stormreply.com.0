Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCBA0944E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:52:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECDA8C78F6F;
	Fri, 10 Jan 2025 14:52:48 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D105AC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:52:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 521DAA4214C;
 Fri, 10 Jan 2025 14:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C0AC4CED6;
 Fri, 10 Jan 2025 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736520760;
 bh=aNCFEV4RXYP85CjPd7vNqTGzYYPEBIBQoTBIen40yHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gLi8UcH9DGe79azEcqPclXToIx5qw10enSJS5mjJaQRBBZ+5CLBrfh7Mpi7iMW0TO
 A/rbMrNTS+PA9NpBPcVMM2z4ku1oxppk3W6llOIBhZvOuDHhGVRljWiAOR1U+h7yFg
 tOqGBw0ZgHBSqZRgs8RWqGihl1fJ89d10Xtujow1iFSpmcSQgrYpctK/HiN6tIbDI+
 n5yG5j4ZixygYt6rjBddVkMwyc9Hf5TbHnNKtMpk9hIBLXmn5EBUF3ghvXFuOE1FRu
 mrmh66XV3EANLgY1TKzwxSp7POGpX7PmaPlVbxRNm2IDDx7avzqsmJ+qIFj+4ZvpJn
 l1C5E9zSehWHg==
Date: Fri, 10 Jan 2025 14:52:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <c9043531-c733-4153-a814-79aab387883e@sirena.org.uk>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
 <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
 <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
 <87tta6ag5b.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <87tta6ag5b.fsf@bootlin.com>
X-Cookie: RELATIVES!!
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
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
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
Content-Type: multipart/mixed; boundary="===============3187042497295994173=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3187042497295994173==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D5dtr3CwiZ2FNoyO"
Content-Disposition: inline


--D5dtr3CwiZ2FNoyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 03:37:52PM +0100, Miquel Raynal wrote:
> On 10/01/2025 at 12:42:47 GMT, Mark Brown <broonie@kernel.org> wrote:

> > This breaks the build:

> > /build/stage/linux/drivers/spi/spi-mem.c:580:5: error: conflicting type=
s for =E2=80=98spi_mem_calc_op_duration=E2=80=99; have =E2=80=98u64(struct =
spi_mem_op *)=E2=80=99 {aka =E2=80=98long long unsigned int(struct spi_mem_=
op *)=E2=80=99}
> >   580 | u64 spi_mem_calc_op_duration(struct spi_mem_op *op)

> Crap, that's a fixup that landed in the wrong commit (mtd: spinand:
> Enhance the logic when picking a variant). I'll fix it.

Please only resend that patch - the rest builds and tests fine in my CI,
I'm just checking a merge fixup.

--D5dtr3CwiZ2FNoyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBNC0ACgkQJNaLcl1U
h9DAqAf/Qrz25ymjeY3vF9YJzCAUUyBS18sTyjX0LHFtT3TgKFe5BYRlKvM8thbH
laiQ60LjJlTDfHpTNzluTCzAgMXm72nOcj/jI4aNjM++Vr/I/xwvVZWbnIH6eZXN
/6oik+AWx+8+dkg/KM9xeJmz1c7efDMcu1KPjM4jv1cuGHe/SMAy0HroYpo6o1+d
WMMbRDqbjT+aZF/9ZnqhOxl1+UaPqyhWYWMlmrT0HbsD+DGGfSXjiPKYVe3+gv7s
n3Oxrkni3O74YgOIN1Tg924Beg9+V7xFVjC+xdzZ0l/uY22fPkMHM+lVFwz9Qy0r
ZmvCpIfRn+q++xWYtiLBpITHKteMvw==
=Dk/0
-----END PGP SIGNATURE-----

--D5dtr3CwiZ2FNoyO--

--===============3187042497295994173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3187042497295994173==--
