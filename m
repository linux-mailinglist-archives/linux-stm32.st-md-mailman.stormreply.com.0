Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B609C3E8FF0
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 13:59:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 402CCC5A4CD;
	Wed, 11 Aug 2021 11:59:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF9E8C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 11:59:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C2DA60E52;
 Wed, 11 Aug 2021 11:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628683145;
 bh=IkkHlU9gyrF2VazbtsaLiwbyE1P1jCc9g2qGG7Vx2x0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z/eT3CEyzCAb4UUxxRlFCF4wE1a0f+Ul0QA/HaUt8ZUFTRKGZfjVgfzbZQzoF4RFl
 3oY8FVhGbWpz6Jwr2JI3Qkg/j5/vDZRTNmIqaOwIvoufwPAUYS24r004JzFaAm6hHq
 mogXR0mIX753NB3w5I1s1yST1LBpVRQO5DTEqVKczhWwa4TO9xpRcSboeHRMtGGNDV
 S6bZUj88e5GTcUGOTM4i/O479H/7t0F84pLt9tqM51ClNhRcJMBVS3XaKXUt2oJyIt
 AyrdP4Z2q2Pv9/AMUnYw8KnTtOjUJLl7GS8Tm4M5s46xv9heMGF3iEbOkl6bxlHN3n
 qE0gCDOE7hBUg==
Date: Wed, 11 Aug 2021 12:58:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <20210811115846.GC4167@sirena.org.uk>
References: <20210811115523.17232-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
In-Reply-To: <20210811115523.17232-1-tangbin@cmss.chinamobile.com>
X-Cookie: To stay youthful, stay useful.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 arnaud.pouliquen@foss.st.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: spdifrx: Delete unnecessary
 check in the probe function
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
Content-Type: multipart/mixed; boundary="===============3144237539208697505=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3144237539208697505==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 11, 2021 at 07:55:23PM +0800, Tang Bin wrote:
> The function stm32_spdifrx_parse_of() is only called by the function
> stm32_spdifrx_probe(), and the probe function is only called with
> an openfirmware platform device. Therefore there is no need to check
> the device_node in probe function.

What is the benefit of not doing the check?  It seems like reasonable
defensive programming.

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmETu3UACgkQJNaLcl1U
h9ASJwf+LWfdLiXawrYtfjW25aPh7dylTBVdUi25A0M6PyTBOcrj0nbIhD5AJ0M2
Q32W/NV+nTugHYOK9xIu9sgwEaq4sZMPP2tM6A0+K4oX8RijtxygqBeZQ/AWUK7F
UPPJObcnC2TO65la2HxerkUZzyw7NtI4BAMAHNQrZKUxpNnAhkLYvsIHRU+MDOcV
u8oG0tc0ZHcTwcnidQGGZEBTvS/hNnwlXVr85jYT6ZmnscKT33+0sfzyw3Eb3YDK
epJ4LR9H0dOyjqF0ubhDtIStDbHDAKgZwZTsvY5rWyxITc4bhQsAbem9qPObI0m9
j7Zt/YqiCkLlbCHIj5djMnnAdIqL1w==
=J1OY
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--

--===============3144237539208697505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3144237539208697505==--
