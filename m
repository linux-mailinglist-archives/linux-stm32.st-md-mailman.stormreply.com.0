Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC209E7F17
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Dec 2024 09:46:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51E68C7802D;
	Sat,  7 Dec 2024 08:46:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC000C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Dec 2024 08:46:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBD715C4A53;
 Sat,  7 Dec 2024 08:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDEEC4CECD;
 Sat,  7 Dec 2024 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733561168;
 bh=Wb2cgo90VM0BZt3RlHOwC/RhEANvPqgEySvUWJGLHNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rtLrQ+Rd+OhhRS4PtLyFkT1tEKWKZi1Q9Sx3ugJpZjnt1T+VqisNUYf5+KlvWwYdw
 XXvWQuFrevcUihZySaOXd3jF6YjssUqhHbtJIynYz8PtGI5k/vpyZMizToFTEM3t01
 nYMlEclv0vuS9WJtSFINB7e4dWb5JnkUQ+a+LyHH/wbYuoDeGoZhzSzA9H6s6pnHOq
 iGw9IEqC5GY45RlBJsVrtXsgiQ8sUSYO/hrgK7/Vd9v0edhF9gD0kVjbVMSbfRW7vj
 Iq/ykxKp4ZcEW2eldtsR5TpKxkI2PhKE1/jFN0GGtrEzauIK4l6mB7o2FbHAuW2ekh
 gTEZr7fBefx3g==
Date: Sat, 7 Dec 2024 09:46:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Message-ID: <4wcwxgo5irzfvyec537ucm4e276fqq36hhw3l64qmoj43hjnmv@byi5mvb2wc2b>
References: <20241206215318.3402860-1-zmw12306@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241206215318.3402860-1-zmw12306@gmail.com>
Cc: linux-pwm@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, hierry.reding@gmail.com,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] pwm: stm32-lp: Add check for
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
Content-Type: multipart/mixed; boundary="===============1473666280431420434=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1473666280431420434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oj4rdulsaiobcffa"
Content-Disposition: inline


--oj4rdulsaiobcffa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

Hello,

On Fri, Dec 06, 2024 at 04:53:18PM -0500, Mingwei Zheng wrote:
> Changelog:
>=20
> v2 -> v3:
>=20
> 1. Add tool name in the commit log.

Thanks.

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

=2E

Best regards
Uwe

--oj4rdulsaiobcffa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdUC0oACgkQj4D7WH0S
/k6mqQf+JDo1gcCBjg9efkJzxZYhmArKsOw3oPJMdypsvvMVg3jtShekC41O0nIT
HRSguGN0MitOyEYsGAV/ZMKr/NiKM8oxOrSa+PNzhikAhjPHpqrfvYAcVqcjtDla
JSnwYVFDfNiI0BUs5ZEHLmB6KAwdiFJS80GumePqh8zQUfIrn55DIZWzpvg0ScAL
Nv8FLKz7o+tO+OiZXSuKwqhl7JCaVh9zQXV5KZoMidQV9WTrmAEiC2HllMDQy+79
Voekd71JC+DB3nE5NSlNEZTEAr5M6/GCgnd5KV+Sme4gK3tT+DFMF+AZuFSYCRlt
g8UEcIcpkdOcrnXnfZ/7jepGVxRwhQ==
=fMTD
-----END PGP SIGNATURE-----

--oj4rdulsaiobcffa--

--===============1473666280431420434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1473666280431420434==--
