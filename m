Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4E3E9063
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 14:20:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFA67C5A4CD;
	Wed, 11 Aug 2021 12:20:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F28E1C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 12:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B97746023B;
 Wed, 11 Aug 2021 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628684414;
 bh=Jkyif3d4kFjhIKg6jx01Qag1Q6rqMPw9mCrQuXo745E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNw8VvFtn2G6ichHLHzmKNVwo6zy4RUIiOQNdZ58LxRx4M0kZ/kbsqVo+69ZfFnYq
 O7gtmpGM+7ggMv4dLWanhE2b/VUAAF/8/jdr0Cda3Kvo7bFiridVaJ1BMUNrLC7C5R
 TvHjDuz9GEh+yy+9m88QpYPNsZEeKP9nkTvQqKcKCNzrByKXs4BDtKTPn6WDwN3585
 ENA73ygZZww79IlugxoI8udwiCRua7z7AHjyJV7cZafQR53Kz9IMxy3LJypQaMDawe
 ZNZMliSWXYEEZDeSy2GzO3YRBOGag0WywFgncn/WH2uJmZvGzrcTNwudz2Cm60HWlK
 JvPShRDkBHfyw==
Date: Wed, 11 Aug 2021 13:19:55 +0100
From: Mark Brown <broonie@kernel.org>
To: tangbin <tangbin@cmss.chinamobile.com>
Message-ID: <20210811121955.GD4167@sirena.org.uk>
References: <20210811115523.17232-1-tangbin@cmss.chinamobile.com>
 <20210811115846.GC4167@sirena.org.uk>
 <7ddb13ee-2ca6-bf8d-2a83-9896d29176c5@cmss.chinamobile.com>
MIME-Version: 1.0
In-Reply-To: <7ddb13ee-2ca6-bf8d-2a83-9896d29176c5@cmss.chinamobile.com>
X-Cookie: To stay youthful, stay useful.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 arnaud.pouliquen@foss.st.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: spdifrx: Delete unnecessary
 check in theprobe function
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
Content-Type: multipart/mixed; boundary="===============7995910590896042799=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7995910590896042799==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2021 at 08:09:00PM +0800, tangbin wrote:
> On 2021/8/11 19:58, Mark Brown wrote:
> > On Wed, Aug 11, 2021 at 07:55:23PM +0800, Tang Bin wrote:

> > > The function stm32_spdifrx_parse_of() is only called by the function
> > > stm32_spdifrx_probe(), and the probe function is only called with
> > > an openfirmware platform device. Therefore there is no need to check
> > > the device_node in probe function.

> > What is the benefit of not doing the check?  It seems like reasonable
> > defensive programming.

> I think it's unnecessary, because we all know than the probe function is
> only trigger if

> the device and the driver matches, and the trigger mode is just Device Tree.
> So the device_node

> must be exist in the probe function if it works. That's the reason why I
> think it's redundant.

I see why it is redundant, I don't see what problem this redudnancy
causes.

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmETwGoACgkQJNaLcl1U
h9Cj4Af/azfVQM3xU3CdmasVulqZpZWu39+iv+ISKhYAhqPkrw6tq6sFFfpDAAQX
BAs2T83O5CvB4peKwgBRLs6paHkWbWnftWMLCVrUfMzEBfRRq6T/wLfQxmDA3o89
YRiXxOjTeZFwiWxRT+jVLh6S3QATZQBdoXU7jbqQH4rRIod5FXh8wdftLQQWm459
WmIQLpypjSCZYPpeCs+UdYs/TatHQdXD0ssS3k5m+Hq3MufufSDUgIpNJUA0aTf5
TfMTW+hMNnz9apT/9bVopicIh6Cf29Mr+O8gr9E7tdQYxNXIZD/MkcjucV8yW+Cu
QFGgT4FSUrecnNJrnFUV8P39wsYkUQ==
=f9BL
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--

--===============7995910590896042799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7995910590896042799==--
