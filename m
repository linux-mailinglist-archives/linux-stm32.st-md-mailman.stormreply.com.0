Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB49E7675
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 17:53:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96591C6DD9D;
	Fri,  6 Dec 2024 16:53:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB672C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 16:53:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C03DF5C5B4B;
 Fri,  6 Dec 2024 16:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2E6C4CED1;
 Fri,  6 Dec 2024 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733503991;
 bh=JpS/Zt5Xq9vuGvkn4jptuxcPyo4ktemXE6eY8TMimTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MHza94HH8zx5zpl+tyZniMpGI8BVsXN6Ue6b1SnP0Q2AeEPTMtSpePIt0PNJ7ln5e
 Bi8fql9veu1U3/o5xq0bkxI8FinVXnn5uxim3eo/IA2y/t3LGchsLlmh7Qm2s2qrae
 lDtyaJUupUDJ2Oxf7PNi68ZUKN5YK26EiBhd8DAxIYdWA8aBkLlkqpIppabcDR9PpU
 eBZ++wepN8+6I3qTEUj3RCuJmHq8Rjr/De8FAfTMIew/3IrS15ou8lfHgZQ0EHeed9
 llM9rjlFP/esIVb0Ef1TSlkYCbxvsJalbYZ/0bY5ZgOsEufHV9g6xvBhPzdJmLlhYW
 Ni3LPwqthYfyA==
Date: Fri, 6 Dec 2024 17:53:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Message-ID: <o6rh2bcxnnubhx6xem55otgequw5zrqmkretcgofohvcpbygdw@z3qagurhjyp3>
References: <20241206012605.2877412-1-zmw12306@gmail.com>
 <cim6rnzdvhik4kdibfmglf6jiky7xccynqwazmxmnr2f5fvu3f@lvoo3drlgaua>
MIME-Version: 1.0
In-Reply-To: <cim6rnzdvhik4kdibfmglf6jiky7xccynqwazmxmnr2f5fvu3f@lvoo3drlgaua>
Cc: linux-pwm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, hierry.reding@gmail.com,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2] pwm: stm32-lp: Add check for
	clk_enable()
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
Content-Type: multipart/mixed; boundary="===============3943640316041937491=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3943640316041937491==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvtle2mtnfezbcjm"
Content-Disposition: inline


--lvtle2mtnfezbcjm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

On Fri, Dec 06, 2024 at 08:12:57AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Dec 05, 2024 at 08:26:05PM -0500, Mingwei Zheng wrote:
> > Add check for the return value of clk_enable() to catch the potential
> > error.
> >=20
> > Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
> > Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>=20
> In reply to (implicit) v1 you wrote:
> > We detected this through static analysis, instead of actually hit.
>=20
> Would be nice to mention the tool that actually found it in the commit
> log.
>=20
> Otherwise I'm happy with that change now.
>=20
> Given the issue is old (the offending commit is in v4.14-rc1), I'd note
> send it as a fix before v4.14. I'd send it along however if something
> more urgent pops up.

I wasn't very attentive when I wrote that mail, what I meant was:

Given the issue is old (the offending commit is in v4.14-rc1), I'd not
send it as a fix before v6.13. I'd send it along however if something
more urgent pops up.

Best regards
Uwe



--lvtle2mtnfezbcjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdTK/IACgkQj4D7WH0S
/k42UAgAs6H2mPbme8oPwP5+Vo7po8iDZLSjx2VBZfboLqKgg60SSEgkWJDW3QRW
JSMgjh22hbHhuXTjBDM3281KZfebAxFyiVCUoLkFX4dxsP/HBJGb1VCovMAAIdzp
aKNyDDpyGzvbXv+rNdV8nIRLYooE0AxWuoZiQU5/54Zsg6BQOdRYOw/7NrUffYHx
Y4cuErXghldB8y6lDG86quZffAwnAp0BFuV55mixSpcV1MKiwiPWqRmr9w605/m3
e8V6BYUoh+IK/2hvFlcdl95pULgQjAtzaq+NNMQgBU3mT05sD5oOl6EAtvVbJEVd
fNXPXDr9aVWZWRuTWR8pnjJFn9t/wA==
=eYs8
-----END PGP SIGNATURE-----

--lvtle2mtnfezbcjm--

--===============3943640316041937491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3943640316041937491==--
