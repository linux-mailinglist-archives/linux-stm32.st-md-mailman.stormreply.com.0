Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4ED041E9
	for <lists+linux-stm32@lfdr.de>; Thu, 08 Jan 2026 17:01:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72996C8F284;
	Thu,  8 Jan 2026 16:01:46 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 524CFC8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jan 2026 16:01:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EF516439A1;
 Thu,  8 Jan 2026 16:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71169C116C6;
 Thu,  8 Jan 2026 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767888103;
 bh=sxqTloeRRUJ6OTAy8ylqgLk5rTozFp8ZfC7yqvSuiZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flWD6jlR1Z44zvUG/fL3f5FNu3EI/1cBSatqAL5XBmWvlKYlOi9c0pe35AK4vYMsd
 4lumye5+L76U5O9nywXUC+l6xYjFiW9WX0nUeDQ4ETPhbSI7kBEnnRrwoGhGVqTbXc
 TOQfNxtoAI634qY14nkDUQKKZEe6LIA0Ot6ncS0oUUZstX651CNuNWOmVRf/z7V6So
 O0hsgiB5CgKvWJfkuQWydML0rll3BwyNvU/r4+oljTNHHaj5oeECVrXJS2rcwmMHU2
 Gj1KDqk+MMdmKD1x+cTqJNzyZosjq4qxjqkCmUlv51VKwqolgrFaKKk17fE7CEh6aJ
 Dxw+C9qou+kNg==
Date: Thu, 8 Jan 2026 17:01:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sasha Levin <sashal@kernel.org>
Message-ID: <j7qywnmejd4v2tez77hxmjnq7pavmaoed7z4aoelsbfdyt4qyx@7jawgsz2kfy7>
References: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
MIME-Version: 1.0
In-Reply-To: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
Cc: linux-pwm@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] pwm: stm32: Always program polarity
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
Content-Type: multipart/mixed; boundary="===============5357276263229619177=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5357276263229619177==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6bapewmlqmprl67v"
Content-Disposition: inline


--6bapewmlqmprl67v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: stm32: Always program polarity
MIME-Version: 1.0

Hello Greg,

On Thu, Jan 08, 2026 at 01:45:23PM +0100, Sean Nyekjaer wrote:
> Commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling") triggered a
> regression where PWM polarity changes could be ignored.
>=20
> stm32_pwm_set_polarity() was skipped due to a mismatch between the
> cached pwm->state.polarity and the actual hardware state, leaving the
> hardware polarity unchanged.
>=20
> Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")
> Cc: stable@vger.kernel.org # <=3D 6.12
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Co-developed-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

> ---
> This patch is only applicable for stable tree's <=3D 6.12

Can you please apply this patch to v6.12.x and older? The problem fixed
here doesn't happen in mainline since commit deaba9cff809 ("pwm: stm32:
Implementation of the waveform callbacks"). That mainline commit however
is too intrusive to backport it to stable, not even considering its
dependencies (e.g. 17e40c25158f ("pwm: New abstraction for PWM
waveforms")).=20

I assume such an exception to the sable process is ok and the patch is
simple enough to be easily reviewable? If not, tell me, then I can apply
the patch and merge it (with `-s ours`) into my next PWM pull request to
Linus :-)

Best regards
Uwe

--6bapewmlqmprl67v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlf1NoACgkQj4D7WH0S
/k6OqQf9FV+4wHydQ1d2QmXQkObz1Jz2DRvaFNGUHj2G6fyzrdXWZdOhetkguAQ9
b/pP0M15fUph3X2jzWn9/ftG1C4xzCJFzDEbxu2nZAoQy3lhZwIKq0IfiueG7eHZ
8jg1wcUZRgJPc3fVp3KFr0w8s+pAq5m4RCX+EAeG/3rZyLKV2zpPNOOXq2kVRm8Y
VnevGuGZk/U1CkgI3wSpXmd8/ueQTPOHh3fO/an9mB6xjSPNHJ/NClILhzYHAR9i
FyxIQm+py1G/cPfbmFNSfNKniIiDSNZHj2Z/bsv/R8SiHEn3pqThTGdZShy3z4uF
jCCjRCfUrPQ+/OqPwN20f/16HMtR7g==
=WGlv
-----END PGP SIGNATURE-----

--6bapewmlqmprl67v--

--===============5357276263229619177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5357276263229619177==--
