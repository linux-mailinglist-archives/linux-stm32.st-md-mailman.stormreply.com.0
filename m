Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7CADB5B6
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 17:44:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 796F2C35E00;
	Mon, 16 Jun 2025 15:44:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E40C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 15:44:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A33DF43BFF;
 Mon, 16 Jun 2025 15:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1237C4CEEA;
 Mon, 16 Jun 2025 15:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750088663;
 bh=zMy+y5c/8mfi8FAA89LQATnBS6oZZIjVu32K5ipEiDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pNxQ978VmTyHAQQ9sM1UZUhVQbkOiaADT141E3DfFXEwOcwu4qEMxMTh1IVstEQGt
 3PAOJqTKVY8HfvN8cTN+fK2oxDoJ5AkhIlaCRGObXvujSzMrFcaJcYwLfG+Trvg6w4
 j921Hfcu+9Nad7s08+IUQFyT3vv1PWMl9FhwEnuqJUBBkMYATf9ppHtqBITbPsM6GW
 GeYE5rVpfhm4iainanvkEnHIJwvNF5wE41xpDPrJNfogRb8E6LNirFmNMK9YjpYFnn
 p4RkLzn4dxmNQis5Lpyt2r5WaU8IX0y2FEu0CFHx0mShhxY9FLCXOesN5eMnYGP5KQ
 EpOZ60DvuS6BQ==
Date: Mon, 16 Jun 2025 17:44:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <hsmkc6ydsyjgyq7dkhvcytqrn6uu7ezngknetshkf4kj4mjt3i@3hgg42aq3sd5>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/8] pwm: stm32: add support for
	stm32mp25
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
Content-Type: multipart/mixed; boundary="===============1403156720302347042=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1403156720302347042==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ezyzxvlev7k4prvr"
Content-Disposition: inline


--ezyzxvlev7k4prvr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/8] pwm: stm32: add support for stm32mp25
MIME-Version: 1.0

Hello Fabrice,

On Fri, Jan 10, 2025 at 10:19:18AM +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> new features along with registers and bits diversity.
> The MFD part of the driver fills in ipidr, so it is used to check the
> hardware configuration register, when available to gather the number
> of PWM channels and complementary outputs.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks for your patience
Uwe

--ezyzxvlev7k4prvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhQO9IACgkQj4D7WH0S
/k5Gygf9Gy+dDmATpLY1NSgEaVsqseEX8U1OK8Qr0hXVS6DWdx1yiKu/usPB/Ns8
KlFNa+c0Yd/lDEYjkvaLr0FmmGazj3yReZB7iuTBjo42rR4ZMg70Ch92UmhZL4JQ
jWYv+ZLzvdDvyEN1mtPizoYrwazqtK+9ajkbSgIWORogLWD2ieG12tfwpE0FjPjB
IkdnMX9NbFB777pXHx8JZTux0YzwmZ9Y6grswoV2Rdlor2xxm/atUWqAE0g8qRzM
QFCOVen4t50xS6ptchwAsDwMRIrDfmVaiMg3T8tC55Fpix5GOkkzFfunE33BqDhi
kt5RKeBIclzLIGFvx72daCwUDZqidg==
=4Cak
-----END PGP SIGNATURE-----

--ezyzxvlev7k4prvr--

--===============1403156720302347042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1403156720302347042==--
