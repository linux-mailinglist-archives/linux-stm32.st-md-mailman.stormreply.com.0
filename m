Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7D812DE9
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 11:59:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DFA1C6B47D;
	Thu, 14 Dec 2023 10:59:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3C57C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 10:59:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F6A161F60;
 Thu, 14 Dec 2023 10:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B8BC433C7;
 Thu, 14 Dec 2023 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702551539;
 bh=h2n9sJgI7iecPTEQJF6qBmcxxJPpJSZTHnxzEJ3wKwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dIA3oV97KFWRFsEPwjeyn3J35QSEO6UN5RWwt/J0MR8rIRq9TXVhwNs7XiK/XlTOM
 SAxhoDPSc/4clfeAXwme6dgXy0SYjx0Xjw/QArY5oEy4kspN9xcctNVqYQ3hmyKui8
 PzrsChKQfy6/WuX/Q66xTO0RNQ46fSdny9B1uumqtrMcqKhA4tFYyTs4TQrgG7NExL
 UlFyJMT4E4IEQJsyS4m/S9KREaarZKUwiaScxpUwTd8IdMW7z+3ZOA1FidIlHy2YEg
 z4q1cNV3Ypdi7eL1hMvxtm90sUpvmTdn6BKbHGLaTPlV/a9+UGGVnZ2Z8wSixpU9AR
 mSDui60YU0AMA==
Date: Thu, 14 Dec 2023 10:58:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <58897511-3187-4583-bf29-11871dd4d136@sirena.org.uk>
References: <20231204202055.2895125-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
In-Reply-To: <20231204202055.2895125-1-ben.wolsieffer@hefring.com>
X-Cookie: The Moral Majority is neither.
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: use runtime PM to
	enable/disable controller
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
Content-Type: multipart/mixed; boundary="===============8205805315581248427=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8205805315581248427==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DT9MugTfRVMgx60Z"
Content-Disposition: inline


--DT9MugTfRVMgx60Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 04, 2023 at 03:20:55PM -0500, Ben Wolsieffer wrote:
> Instead of disabling the SPI controller between each message, do it
> as part of runtime PM.

This doesn't apply against current code, please check and resend.

--DT9MugTfRVMgx60Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV63+0ACgkQJNaLcl1U
h9AFDgf/ccmdPjsD5WeSY9MvAPkSdAwIv0/d3yGNyZY8qdHL+ljsOPGKyoF26FeU
DE5beBpTNPTh7y+JLF+Zb4UrC4a2hvEHpVJ99B7AZIde+tgNkPA3JIapbwh7ehoR
a100WtJV5+KG4bFtuw9CJRepYBqaaaLjrv7euCJHgmwsJNb1OiPV+RPe5qiWN3vJ
PPJwY9HUiY7svi9F0sgYPdISw2DJw3syj1KIC92TpFeBz6L9tWhdeD5tGxkC3mDt
4EOJ61cfkbwEm7xasmlAgQHz4/+VV0Lps/kS+hyeKvpOVnCaKQeotrm5QJFJ04ne
GsI1cdjsw1qc2v8sjwCr688sRVeJCw==
=HXyo
-----END PGP SIGNATURE-----

--DT9MugTfRVMgx60Z--

--===============8205805315581248427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8205805315581248427==--
