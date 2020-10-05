Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C728397E
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 17:26:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E9FDC32EA7;
	Mon,  5 Oct 2020 15:26:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E4CC32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 15:26:35 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF67920637;
 Mon,  5 Oct 2020 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601911594;
 bh=1DFlxAOneU1Q7X7FCOfNZN0wL4ZzNAHWNDg5k6DPbvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LKTs78TRI/ttvaaeCdTLErmQurihH/lZPa2pf/cRUYJ/NoWFTXpoeqenTFihjHDjw
 cDcWWlcfcDiaXxdXS0+mmlbURBNIbho4R6fXjY6Wtgl2QcGyAKywRKhLJas6BExYVe
 13K6pesTw94jy7i2ZnJvW5SrtsyYgk+c6alMbo58=
Date: Mon, 5 Oct 2020 16:25:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier MOYSAN <olivier.moysan@st.com>
Message-ID: <20201005152531.GE5139@sirena.org.uk>
References: <20201002152904.16448-1-olivier.moysan@st.com>
 <20201002154107.GC5527@sirena.org.uk>
 <4e7fb9c0-84ea-ba01-cea8-8044d6ff60de@st.com>
MIME-Version: 1.0
In-Reply-To: <4e7fb9c0-84ea-ba01-cea8-8044d6ff60de@st.com>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "perex@perex.cz" <perex@perex.cz>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "arnaud.patard@rtp-net.org" <arnaud.patard@rtp-net.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] ASoC: cs42l51: add soft dependency
	declaration
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
Content-Type: multipart/mixed; boundary="===============1518664919024715640=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1518664919024715640==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 03:01:23PM +0000, Olivier MOYSAN wrote:
> On 10/2/20 5:41 PM, Mark Brown wrote:
>=20
> On Fri, Oct 02, 2020 at 05:29:04PM +0200, Olivier Moysan wrote:
>=20
>=20
> When configured as module, CS42L51 codec driver uses two modules
> snd-soc-cs42l51 and snd-soc-cs42l51-i2c.
> Add soft dependency on snd-soc-cs42l51-i2c in snd-soc-cs42l51,
> to allow smart module dependency solving.

Please fix your mail client, the formatting is completely broken -
there's nothing distinguishing quoted and new text and you've got lines
well over 80 columns.

> Doesn't the userspace tooling usually manage to figure this out from
> symbol usage?

> cs42l51.c does not use symbols from cs42l51-i2c.c, so cs42l51-i2c does no=
t appear
> as a software dependency of cs42l51, for tools such as depmod.
> (cs42l51-i2c.c uses symbols from cs42l51.c,
> so there is a dependency in this way, but this does not help here)

But that's the dependency that exists and we want - the I2C driver is
what has the bus bindings in it and will be what we decide to load to
instantiate the device, that will then pull in the core code that it
needs.

> When enabling a sound card based on cs42l51, all required modules are loa=
ded automatically,
> excepted snd-soc-cs42l51-i2c module. This one has to be inserted explicit=
ely.

Whatever is going on here this patch is not addressing it.  Most likely
some ID tables are in the wrong file.

--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97OuoACgkQJNaLcl1U
h9C2zQf+I6U/7Ee6oL1ZwLeSOSKeU3K681e5iVm0pg2A50BBNhVRhyzrxhdUeHvs
zKwL+iBsoTqtW1U1iy8atRxhgWr37zShQox1w4JCpiNxN0SdqLdtACtaHM5V5/3O
YlbH254TyscAiUEKyU4cmx3ncjyZ660doyFbdXtRGP0yJCDdLqGfC0avHkhcuRi7
hNwpL+zleSMQ4K9hDh2AC2OD+XCeEJEaW707sSrBZVBk+ZeXT3sgIk8TaUOu+vMf
vxVrOdcxo5EEVE40ZcF3KM7mlgBZ47TKgdSTIXQ12HDTiykM0MORQcElsjudCnQ8
GzkgSwHvDBwdRjhQIDKZO3VJMoLqtw==
=A6ZW
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--

--===============1518664919024715640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1518664919024715640==--
