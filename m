Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA61BAB7A6A
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 02:16:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 664D4C7A828;
	Thu, 15 May 2025 00:16:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 432B1C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 00:16:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E928943AEB;
 Thu, 15 May 2025 00:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235B7C4CEED;
 Thu, 15 May 2025 00:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747268167;
 bh=uW+M74PgZ3HUM5ZEy0wgLlqjqjzVMkF8sZFdMOczPhU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RIuWhMx4JqXHZhe2E9bp6Vc1XY9dfVCBB++H6KbySgeSdUtzfusiMCGBnctJKEq3p
 17OVJRcKrv2iBQ8f6WfGuEeSn6Vy/jEoQFZcxtU2kn+skcX00xLYtYTpAi/hybtPIS
 X3UaDxNvm2qpl2xD6KAOWxCAIlGFxjtSrcEpS0oJ/oj/2Tfjwom7kTg9Dn1R5RBCq3
 qITvNErXeKTO1GYC85vUUhMll/tcXxP5SBQTIudYtKfUnacXiGcAMjoB123frXVFT3
 Z2vtEr/zZRnLe48T9ba+7n8l09dG8bcJ4oVK8+WonJCPkQsPmToFVoHNu51hP9sere
 ZW3DkRPAJx12Q==
Date: Thu, 15 May 2025 09:16:01 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <aCUyQbDj6pDdRYuL@ishi>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-4-fabrice.gasnier@foss.st.com>
 <euiZ0AkHt7QXbUa8SgT5b2zrUV2Ha-llURWKhlOUH0BhTlbbIBTELC3Uk_sQGpTMSy4vS3j66xs83vKXnJjrgA==@protonmail.internalid>
 <5268ec60-ae2e-425e-a4af-a55cb0c3a1f9@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <5268ec60-ae2e-425e-a4af-a55cb0c3a1f9@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/8] counter: stm32-timer-cnt: add
 support for stm32mp25
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
Content-Type: multipart/mixed; boundary="===============0499499969995612900=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0499499969995612900==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xd2tMiRaS48NlvBR"
Content-Disposition: inline


--Xd2tMiRaS48NlvBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 11:30:14AM +0200, Fabrice Gasnier wrote:
> On 1/10/25 10:19, Fabrice Gasnier wrote:
> > Add support for STM32MP25 SoC. There are new counter modes that may be
> > implemented in later. Still, use newly introduced compatible to handle
> > this new HW variant and avoid being blocked with existing compatible
> > in SoC dtsi file. Modes supported currently still remains compatible.
> > New timer 20 has encoder capability, add it to the list.
> >
> > Acked-by: William Breathitt Gray <wbg@kernel.org>
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> Hi,
>=20
> The first patches of this series have been merged.
>=20
> I'm not sure who shall pick this one ? (I think there's no dependency).
> Or do I need to resend it separately ?
>=20
> Please advise,
> BR,
> Fabrice

I don't know if anyone has already picked up this patch, but I'll take
it through the counter tree regardless. No need to resend.

Thanks,

William Breathitt Gray

--Xd2tMiRaS48NlvBR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCaCUyQQAKCRC1SFbKvhIj
K0SEAQCczNPjoor1o37cz8SqvsdN/7HtNNlaPrWLW1dpooqMnwEAgbin0MfIxTCj
Kw1ZtOOoP37+0SshTS2OcPlXqohQYAY=
=B/SX
-----END PGP SIGNATURE-----

--Xd2tMiRaS48NlvBR--

--===============0499499969995612900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0499499969995612900==--
