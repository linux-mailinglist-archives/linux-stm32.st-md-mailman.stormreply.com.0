Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71CAB8272
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 11:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93EA6C7A844;
	Thu, 15 May 2025 09:24:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCA60C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 09:24:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52EE35C10B1;
 Thu, 15 May 2025 09:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28A3C4CEE7;
 Thu, 15 May 2025 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747301096;
 bh=JZp32cGnARt5v5SngWT8bwZW1Jh8iJC7PUvH3dlXTsI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A7mU282LSWsGdpwJ5DOiLTIAyqVyxqrlhiVc/v/e9xV8IF8oplET2K7F1vaW9ndS9
 Tlas2OXmX6IsN+pRPlTSwvSVtCP/Cw8hsCLXnTBqvAPakVN7aP6hBug3Z5jAfSXubn
 ZZrk7AA4uR2EeRexTRs3IkByDiF4sfYVO8tBjoHvFYBpCuapOsYHAbkzEnbptayKPG
 MaoK0JqisvSZA0NJiNex8WCJ8Q3RnsW2nI/+VLG9cLM4obd3XEaUHaDi8QTplnEc1M
 321EnbfQT9BLZhjy61zQ22mIKJpakf9bnmHCgr0tDdiOLD7gc8Vv4jdSy+oggRK3O8
 BkvdzdvjkhAOg==
Date: Thu, 15 May 2025 11:24:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <5ui74qlssllgn4h34by5jcpi5g6rknziclcsh4w27tjvznynsv@lcjtjxn6rovl>
References: <20250110091922.980627-1-fabrice.gasnier@foss.st.com>
 <20250110091922.980627-5-fabrice.gasnier@foss.st.com>
 <4b641513-ff2e-43ab-8074-ba6b521875e2@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <4b641513-ff2e-43ab-8074-ba6b521875e2@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
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
Content-Type: multipart/mixed; boundary="===============4812244379265439488=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4812244379265439488==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dxezo4t7v65ydh54"
Content-Disposition: inline


--dxezo4t7v65ydh54
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/8] pwm: stm32: add support for stm32mp25
MIME-Version: 1.0

Hello Fabrice,

On Wed, May 14, 2025 at 11:30:26AM +0200, Fabrice Gasnier wrote:
> On 1/10/25 10:19, Fabrice Gasnier wrote:
> > Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> > new features along with registers and bits diversity.
> > The MFD part of the driver fills in ipidr, so it is used to check the
> > hardware configuration register, when available to gather the number
> > of PWM channels and complementary outputs.
> >=20
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> > ---
> > Changes in v2:
> > Address Uwe review comments:
> > - Make MAX_PWM_OUTPUT definition less generic: STM32_PWM_MAX_OUTPUT
> > - No need to initialize 'npwm'
> > - refactor code, for *num_enabled to use same code path
> > ---
> >  drivers/pwm/pwm-stm32.c | 42 ++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 35 insertions(+), 7 deletions(-)
>=20
> Hi Uwe,
>=20
> I think this patch still miss some reviews.
> The first patches of this series have been merged.
>=20
> Is it ok for you to merge, or shall I resend separately ?

I have it still on my radar, no need to resend. I just have to find the
time to look into it in more detail.

Best regards
Uwe

--dxezo4t7v65ydh54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmglstgACgkQj4D7WH0S
/k7tvQgAr0tuQYW7a8kZHG4D+r8Ju5Etk+73ekoD+5NJcmpwe6C8Nye8E3mKfgS6
bWCXuQS9aBsBvnmwFzIV9jkcwJrdeejQfv46EJ0IOZZFloj7b/vB3K/L/dzS3Ray
XkPiy+M1R1rGt5B5X1U2gyUK6QRCE4KOMquhXMRCQxO7zqXlozUOk2rcmcAzgGMV
tpQY/lDPoA9V6k4R6WL4yGAzwybvl+ASbzdrDmsjuIcW9On5Y5xDzkeVH9RSU5P0
apvIu6hfS3bj3LvTF8QiT9emDOMQJAMU0J5t2YOeazfw/A7rFfqFQl7FA4Z2nDGZ
wxTfL+UCcOGnVPHKb0fByZ5OKLMqrA==
=ZB/v
-----END PGP SIGNATURE-----

--dxezo4t7v65ydh54--

--===============4812244379265439488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4812244379265439488==--
