Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0139E576DE0
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jul 2022 14:25:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0748C64101;
	Sat, 16 Jul 2022 12:25:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F11F7C640F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jul 2022 12:25:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4CA560BFF;
 Sat, 16 Jul 2022 12:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490FBC34114;
 Sat, 16 Jul 2022 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657974306;
 bh=b73l71pfnctP3sh0f5boOKGEDg8OKCQBQOgeRaAVgNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iW0CN0q4wN/okmwYfRluhoDdZYpd5Y6pNUH5aP58Qaae1FlVkDwPCfKpPgIWYYxrU
 EtTR4Vm5ndWS0ZA+5QNKeAzT2NjbvwBpc5N0NACj9DucAn31jITzzQeAKBFdqpm5b9
 yEf8MMtAKfHNc/XiUWDdn5DBzBgc5/o3GmJCGNDJDuy8ynHcS3M4M1/74r39zxqX/s
 4k9QLbHlJYex4LHxYzxdbtApCQLfxUpKyV+EMhQrz+UwrTKSnVncw2KyZnJMew+A95
 UCTfRJDvgcY3CXXx1IqvFlLhAdz0CwrOjtwFdqKr7Drr/pNT8dex3c7LrYnX5mWUu4
 YNNGH0ItxHH2w==
Date: Sat, 16 Jul 2022 14:25:01 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YtKuHdUjtBvqagfT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, pierre-yves.mordret@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <20220707074402.2429786-1-alain.volmat@foss.st.com>
 <20220707074402.2429786-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220707074402.2429786-2-alain.volmat@foss.st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: i2c: st,
 stm32-i2c: add entry for stm32mp13
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
Content-Type: multipart/mixed; boundary="===============4017127367935471919=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4017127367935471919==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XpthpirdDmCJyjsk"
Content-Disposition: inline


--XpthpirdDmCJyjsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 07, 2022 at 09:44:01AM +0200, Alain Volmat wrote:
> Add the new compatible for the stm32mp13.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--XpthpirdDmCJyjsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLSrh0ACgkQFA3kzBSg
Kba3jA/9GtapGevKUWhLHwFzzZUXb1n9jcmDm79L2zwP6UeNj6q+N5X3ELVst0BG
QaX0t6+JrvgxqDJteIx38X6UsCfxXW6I1RLJKqSRthuGa47YImufQrk0RFitTwXA
ybUB+Q3o58vOEIFcRE0AGM2NXhK/9+hUxzzDEtLK5BOkVu3U3bduSOzGDFpbSL+Z
M78hijbwnahYBXrZqRbzF+HZhWjw65+E5HIuEfPBpzOW1aHrCol5AjPziVNhKKt6
15oE/k7k5Zeb+pKD+G/kQENM3yqN0OjFh9tElb+Xj1cFRO43x0gVsqLgBABCB6bq
d0BZ4I0pan5IAkFhcBmslbdMmA6R6rLTifOm4MGF8A8LWAXwPVBqFaMjWgJEpE60
SzWioUyTm3poCHEN5r0XKxMz7qvbfnNZQY3D+YLtR2pNsU6unLblVs5A59sFC4Gu
y34tmmtF3oXvIi+9oQdeifo/t8fKd+hsRfIGYQv7/iI42IsD+9kKL+QeT6bQy81D
dZEsUQREkzNok/yjEa1LbWM26aGexztubystFdR3Ol2iPlBc5se1BuvTvJM+zPBz
jAi6jqWJ69+EBAuVHfGGc/a2v5o0c2b2bwrel1vbXvQ0L1qBzuJ6Dbw9Aqc9qcoy
6CGRGLRWWSBj9Sn7ObY6UNjg46KvSm45V1r27dHaayKGmco6EB4=
=zQzc
-----END PGP SIGNATURE-----

--XpthpirdDmCJyjsk--

--===============4017127367935471919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4017127367935471919==--
