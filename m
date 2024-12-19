Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942589F73B9
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Dec 2024 05:35:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FFFDC7801F;
	Thu, 19 Dec 2024 04:35:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 112D7C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Dec 2024 04:35:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D63E85C663E;
 Thu, 19 Dec 2024 04:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDF5C4CED4;
 Thu, 19 Dec 2024 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734582940;
 bh=hV9rPYBMtv6zYearTenprodqq3vw1d5TA0nxIP3JZ6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmhVPEXtShJus3vwjeSG5S4LQfWCt0QUciQanZHZtLfx25uODBbaAxOiV+xmD4P0x
 lSLGwwOECXwwtM3TDH3rIlzn2tlT2Lnoe/55j6VRDIUE/fD9aYWQa4y8PFX6p7Fqbq
 wnJOpU+wB0MBZO2Y/mjlnvnQSMPRpT1w8BYg8o7GsVeUxmfVTs4pBCG8C8M0tIBpJ5
 R9h50P2Aw6FyTHvqUpO/UPwkMAzNE1FD2azO36OG3hFzIXcNFzx3w76X0f/psjKfT2
 BDvxuEKi0B1KhVZNDMGrTkA8HshT2oSa8zUyE+H2Q1dCK1cyYiifZ+j5igGoNhlanf
 PHN6ALlKl3X+g==
Date: Thu, 19 Dec 2024 13:35:35 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <Z2Oilz0GECUbovtN@ishi>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
 <20241218090153.742869-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20241218090153.742869-5-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/9] counter: stm32-timer-cnt: add support
	for stm32mp25
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
Content-Type: multipart/mixed; boundary="===============8746290755994642929=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8746290755994642929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iv0TR1n6hMiqaW6j"
Content-Disposition: inline


--iv0TR1n6hMiqaW6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:01:48AM +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. There are new counter modes that may be
> implemented in later. Still, use newly introduced compatible to handle
> this new HW variant and avoid being blocked with existing compatible
> in SoC dtsi file. Modes supported currently still remains compatible.
> New timer 20 has encoder capability, add it to the list.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: William Breathitt Gray <wbg@kernel.org>

--iv0TR1n6hMiqaW6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ2OilwAKCRC1SFbKvhIj
K6GkAQD+kR7xgAP18OR+NrSPlqcTp3zBvvvPdQkB+Hg+9YasgQEAoM1u+U2lGv6Q
2ZQAnG3TGdEj7O7hRpdM5mQ3nywuYQo=
=GExD
-----END PGP SIGNATURE-----

--iv0TR1n6hMiqaW6j--

--===============8746290755994642929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8746290755994642929==--
