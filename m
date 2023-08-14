Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413F77BCC7
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Aug 2023 17:14:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D940C6B472;
	Mon, 14 Aug 2023 15:14:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B0BBC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 15:14:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C41D665613;
 Mon, 14 Aug 2023 15:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE040C433C8;
 Mon, 14 Aug 2023 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692026077;
 bh=PG6FtD1ip+pZiry2bEeVhermxO5kKOn73yucbpsIIp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aVDJxDqL7+401wcZju/POHlqg9F9YqVMYGW5xd+DUPLFFjkDUSWm8Bi/xD1l9fYdn
 NB2Dt3dy2dq6v0I3Qy2zszNUqovD0H5xuP5OcrG/PFpzpFzteCK91W11xc1tApeZMN
 yJaeyrBZs855MlSQ9NJz9EjQsKIrB/N5Ml8Xj/tNPQK6/0txdSsMVk+GdIpGC3ZLKG
 LRj8js/aCi1jldCTxN8sfNsb1YrBvRLwKJuJvR99vmCxsaMnaSFi3F7yh7KVu7wN31
 1U8aCP2m7SzxNPofg7eSTijvDvQ83ZXnUVXswS6ZNtLB8uBmh6o5qHL+uYkUqmtAxb
 k4UuK0TNa7caQ==
Date: Mon, 14 Aug 2023 17:14:34 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Message-ID: <ZNpE2g9682EmYPa3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, pierre-yves.mordret@foss.st.com,
 alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 Ruan Jinjie <ruanjinjie@huawei.com>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
 <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
MIME-Version: 1.0
In-Reply-To: <169119887102.1781235.17733733758389845864.b4-ty@kernel.org>
Cc: Ruan Jinjie <ruanjinjie@huawei.com>, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] i2c: stm32: fix the return value
 handle for platform_get_irq()
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
Content-Type: multipart/mixed; boundary="===============1660098684150725226=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1660098684150725226==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9JuskXm4Fm5kE6Gm"
Content-Disposition: inline


--9JuskXm4Fm5kE6Gm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 05, 2023 at 03:29:12AM +0200, Andi Shyti wrote:
> Hi
>=20
> On Mon, 31 Jul 2023 19:27:55 +0800, Ruan Jinjie wrote:
> > There is no possible for platform_get_irq() to return 0,
> > and the return value of platform_get_irq() is more sensible
> > to show the error reason.
> >=20
> >=20

Applied to for-next (via Andi's branch), thanks!


--9JuskXm4Fm5kE6Gm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTaRNoACgkQFA3kzBSg
KbZxPg//cstfDoCoeK3xgIuYxr57m0cxTCegkyg7J6+tO9hhH/P4ato9olYv3PnU
+lEPi5ajeqSVH66PUlh90WfJByukSOSFsavghRphoDd97G0FhPE6kEMwsNADJJt2
M8Bw/6IGhEgJNvP40ubaqiYHhijynPCO+NCZxAya8onaY0DXTBH7PztcL6IT3r+S
Z8Dek67bQ+WyDsroN1ci9LVD7Dr3maoqZOqnRHUJfa6jyglM/KcX0DWpSAMjhbJ2
WLWqClq/UPC6ASylVZnE96mRpj9kby0D+moJQ/SNHisv0GMYGajYSF9yMT48Dk7u
P4/9pusNYTEF8xVzyn57yFXCn19AvyCF95gBkB47uYyhw11FYoChCysUBqdo8P/m
y6fcoQi/Kd0sqC2WxKIeDUwKllhfozgf3uZILRZwlAVduuGFbDNEUBYC2TYy7xbX
N0GEUnW/AoQsDiiG5Shz/IzpURC4enEzo3xYJTyCfJ/AESHFSx0Fl0qxdQwShhYE
j06+QPHVDIDihV9fyDBwXjVgZlm8dEYocXNR4UCHcmvqo/gL6Gx3XAA6JbxiTEWJ
EbdV2ckFohH7s5/nPKHJ1NzC7Zl+7J78hBMM2mBgEXT8H37YJw7F+R0rGFebk3Il
7VcssKFMMHiEuZO5eqpV9Y60jku05aUn+uS8nT0iWzyyuAD8gf0=
=ySOT
-----END PGP SIGNATURE-----

--9JuskXm4Fm5kE6Gm--

--===============1660098684150725226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1660098684150725226==--
