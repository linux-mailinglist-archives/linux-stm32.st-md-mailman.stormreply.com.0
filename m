Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA2699CA2
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Feb 2023 19:50:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63EEAC6A5FB;
	Thu, 16 Feb 2023 18:50:33 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C571C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Feb 2023 18:50:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACE43B82951;
 Thu, 16 Feb 2023 18:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCEAC433D2;
 Thu, 16 Feb 2023 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676573430;
 bh=AImnf+2dqdDiUhTA+4XLQG6ccdNzGaAOj2rHAnNmR9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwn2YrfskMK7b8K/KimZBAxY/yyMR/7dHYwkZ62/Ai0XU+LFgqyfNyyeGPdpBVD/z
 L5tR6ut4sU5d0mPmnlz4O3RGW1dEEEeJyiVGZcmuEcDFtLfUYmMsbc7TzqPoodANtP
 hlNgL9cbxXz3nPmhgZoJsHw8Cy5xVuoVntsQFQ6gUp4p8vv50rlYukm/+dJLWsXO4+
 +BG8W2lJu5PqVhOQHPmkCR52mXRI0bIV8ckrCigczowbjO0Q2bcMVpdbKMbf+/eUYw
 MWuW3ALreFOeCyBrbqK6ki6aic8OAe4gScHw7OhlSTUzSD/6Vqo+dHijYTR0D/n+rN
 58PVJwgvIXBGA==
Date: Thu, 16 Feb 2023 18:50:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <Y+567t+kDjZI+fbo@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, daire.mcnamara@microchip.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 04/12] soc: sifive: ccache: Add
	non-coherent DMA handling
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
Content-Type: multipart/mixed; boundary="===============7635392284811172547=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7635392284811172547==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dCe6axd58RjANF5F"
Content-Disposition: inline


--dCe6axd58RjANF5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil,

+CC Daire

On Sat, Feb 11, 2023 at 05:18:13AM +0200, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add functions to flush the caches and handle non-coherent DMA.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> [replace <asm/cacheflush.h> with <linux/cacheflush.h>]
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

> +void *sifive_ccache_set_uncached(void *addr, size_t size)
> +{
> +	phys_addr_t phys_addr =3D __pa(addr) + uncached_offset;
> +	void *mem_base;
> +
> +	mem_base =3D memremap(phys_addr, size, MEMREMAP_WT);
> +	if (!mem_base) {
> +		pr_err("%s memremap failed for addr %p\n", __func__, addr);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return mem_base;
> +}

The rest of this I either get b/c we did it, or will become moot so I
amn't worried about it, but can you please explain this, in particular
the memremap that you're doing here?

Cheers,
Conor.


--dCe6axd58RjANF5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+567gAKCRB4tDGHoIJi
0isoAQCgGCQCl64HiPsxg1E4/GDsGMTIJGdrEEQIXQCaEdTjeAD9Hv8l410SaOFy
q5SvBa8IxUyuUjr2p8ixdFb2JfHoEAk=
=7P7u
-----END PGP SIGNATURE-----

--dCe6axd58RjANF5F--

--===============7635392284811172547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7635392284811172547==--
