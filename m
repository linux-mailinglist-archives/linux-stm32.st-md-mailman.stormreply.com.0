Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1FB84B20B
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 11:09:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1208C6907A;
	Tue,  6 Feb 2024 10:09:06 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B1A0C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 10:09:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB4F0CE0E1E;
 Tue,  6 Feb 2024 10:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491BEC433F1;
 Tue,  6 Feb 2024 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707214141;
 bh=6eh7rugcdTI/j4n4bbvxX9jPn6+zlru65TEB6aU9mAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B6GlnIVkN55eTnQsnXVV1Si9JIdYeZaBygDWpnXhaezs6c7BhJwZwHqcjdzHvuocJ
 X1FnvRTTBZX6c6ttOzlVw4itRhxFNPOCpQUmN0QNaiLeH4vQQvGX5nG5AU/LyBSend
 TViEnaFWX/KpNu7lERTnW/qbWoacNCoLcrNd8RD7g31DXTpAHbJ3VLGlWodRdbnJAS
 z3eAv9N4JX5MkvD1SHm0z/+1tLxXXHyc/a54hzirjx3iPiq7uP29rhC6F62uwbU9QL
 s7dksCpA1frqw8e+hDrOd1nquIxZ+D91Cpe3oSfkvHoloeEKy/Pq2KyVitDrezj+bt
 yjPw0QYmMG5cQ==
Date: Tue, 6 Feb 2024 10:07:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <ZcIE/RMTq34TgpQt@finisterre.sirena.org.uk>
References: <20240206071314.8721-1-liubo03@inspur.com>
 <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU7fYCsNT9ditqJ-saUsRm9J2zLh=-q-zmExhBRJeE8NQ@mail.gmail.com>
X-Cookie: You might have mail.
Cc: neil.armstrong@linaro.org, ckeepax@opensource.cirrus.com,
 support.opensource@diasemi.com, mazziesaccount@gmail.com,
 linux-kernel@vger.kernel.org, lee@kernel.org, rf@opensource.cirrus.com,
 linux-renesas-soc@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, Bo Liu <liubo03@inspur.com>,
 patches@opensource.cirrus.com, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 marek.vasut+renesas@gmail.com
Subject: Re: [Linux-stm32] [PATCH 00/18] mfd: convert to use maple tree
	register cache
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
Content-Type: multipart/mixed; boundary="===============1594476017447669269=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1594476017447669269==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tKV0MZVgabPsZSl"
Content-Disposition: inline


--3tKV0MZVgabPsZSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 06, 2024 at 10:33:22AM +0100, Geert Uytterhoeven wrote:

> If all of this is true, is there any reason to keep REGCACHE_RBTREE
> around?  If not, perhaps REGCACHE_RBTREE should be treated as
> REGCACHE_MAPLE in the regmap core code first, followed by a single
> tree-wide patch to replace REGCACHE_RBTREE?

There is a very small niche for devices where cache syncs are a
particularly important part of the workload where rbtree's choices might
give better performance, especially on systems with low end CPUs.

--3tKV0MZVgabPsZSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXCBPwACgkQJNaLcl1U
h9AzsQf/fvluGCbAx/aIe1RLZpmbVAXZdaP3edZ9jN+FzV+ub/6qY0iiPxN0esI5
jpGS40Z27yNHgk1JIpJR/ZoCUrjeuLDekUhJmu87yhqnK3p+DsT/zfnbqbeSdKXz
FuOUu8Kh+hH4bdbyjTMNvTAzzuPUwgE7DRFGAlu3tPkZXEFtMzpSCImrqxIrsKao
Z7quNE+m6pc4MyiQ09p0cOAK8fjnSHuFNn2wjZX2GgAGnLEYkKrpQwYgkrDRlHqc
C7Cb1gOefwAx/I8mYuP+2TJNV/XVUKWJ0Od8KZ+MVbxaEslqAJaCvMSXzgkj/dqU
ssEshBmXp9EzMJKlUQ967sIEsiM4OQ==
=DPIT
-----END PGP SIGNATURE-----

--3tKV0MZVgabPsZSl--

--===============1594476017447669269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1594476017447669269==--
