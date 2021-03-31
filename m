Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8234FAEF
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 09:58:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54917C57B5B;
	Wed, 31 Mar 2021 07:58:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB2AAC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 07:58:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68C39619CD;
 Wed, 31 Mar 2021 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617177534;
 bh=vgQBx2ORhS5/dtv75ETYToNzAEU+oY+GHEUm8HioiyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXXvB3m/aOgAblpPVfPEfvXqOXrG37h6/lI2IVFdOQlqNSFZcfo/7x6KKPNB7kRch
 PxaRdNBtK2HkyfNK+ifSkK4IrmXfJYlPUHI+8WS4MCiYZpxn1mvX7xd9SzweydUt7B
 XrYoQjKlVOZofChvhSHBr6avHOfYRtRKyluHIzeNp3URZwAcmXszC0K38HqBVKxvm9
 +5Q8Qe9UFIc9Xmg2+T/TXZVzpl1PWfP60VZBVN0ZjOmVUjlsQ3pHYcuJCxIvQDAzeh
 w5984JK2071ioAfLFjN8xZpyNmRC+8WjhxgdDoVkCa0ZJEw7fGOWFa4gGk/Ut6BAWb
 7ucM4x5ro9ySA==
Date: Wed, 31 Mar 2021 09:58:50 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tian Tao <tiantao6@hisilicon.com>
Message-ID: <20210331075850.GG1025@ninjato>
References: <1616673872-4382-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
In-Reply-To: <1616673872-4382-1-git-send-email-tiantao6@hisilicon.com>
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, christian.koenig@amd.com,
 linux-i2c@vger.kernel.org, p.zabel@pengutronix.de, alain.volmat@foss.st.com,
 sumit.semwal@linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Remove useless error message
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
Content-Type: multipart/mixed; boundary="===============7784968212210086033=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7784968212210086033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
Content-Disposition: inline


--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 08:04:32PM +0800, Tian Tao wrote:
> Fix the following coccicheck report:
>=20
> drivers/i2c/busses/i2c-stm32f7.c:2032:3-10 : platform_get_irq :
> line 2032 is redundant because platform_get_irq() already prints an error
>=20
> Remove dev_err() messages after platform_get_irq() failures.
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> Signed-off-by: Zihao Tang <tangzihao1@hisilicon.com>

Applied to for-next, thanks!


--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkK7oACgkQFA3kzBSg
KbYU3A//aYETbukMWqd7KQ3XMbTjXZhuBIETfTQDPGtJdEeyDOK+1ygGgWM2YQ8E
VT1m5t1LfVjYSXUzMtu6I2HMeHgKav9ABetMc7FyCUKZJ8HIJ7J3Al0ENqmahnVG
ocBltTUUJGDFam/A6Z8c9voM+go/6zi0lzPdY3a/nrWVpsM3V/0ADJHSX573M8Av
WblJl0Aq7BwqUaDwnUVpfWx8BQ/eZKt1rBWuh7WObShT2HazJDuh43/sNFRuAM4N
QUiQUFIdtqplsYM9GD8cUDRCH1h0M3gY7JUznV2gu/WGU+yjLcsV9GL74/WBqxtB
4GveX077OCIGUi8k/Y5vUzHH7XixrBycE6CXB+UZLuIlI0LriP5WIh8IwpBQAck1
EhuqtngLQg2gX8gmFyU8rGTzZipT1GsPQ1bJdD+0Y/dtkfyxJo5kb6GGV3QeziqB
QabOqGVUQRFZy1n9Hcr/rLuJjyiU3CFasoOboRfbnwOWjE6Vds8XyKPdvSf4IoJR
0qZzK3IocLJ38knmNChkBqevZnCz/NFGYyEUSFIoZ6DzVG0hV2KiyjmKRUbE4RDO
gHw/SfPzF5elJxWmNJrJ3aU25D9N4h6aBG89d9O2I4/xpB7iqWAD+lQ3sOfRUxz6
wyny5ML0wY7dw+ZCCdWcKa8fvw0+jirkYAHt9eKs/+asBCh7YvQ=
=l5p0
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--

--===============7784968212210086033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7784968212210086033==--
