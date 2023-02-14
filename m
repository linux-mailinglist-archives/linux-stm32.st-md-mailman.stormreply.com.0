Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7FB6977F7
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2E1CC6B44F;
	Wed, 15 Feb 2023 08:18:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C995C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 18:17:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 093BE617F0;
 Tue, 14 Feb 2023 18:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7666CC4339B;
 Tue, 14 Feb 2023 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676398672;
 bh=zSduewvCgVEnuzhr9XpZepyB0TgJiJb9HvA+avKQf58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iTl9UVRqG8j3RhpI2HJze1aWHJj8me3Ri764XwYKLpgwBJZ59y6ovgSUZ0D101V+O
 ujek8v+GWtvYHcsqrEAX/dS2DmfCwbRFP5yM6afFIKheTBIeg9dR8zpoXJAQ3VhDyN
 YsPvol5yku2yUzQz10PsqRom5gHgdaIIVdKxiD8wvIRUlrm5LHxm14nqG3ooUoRsAS
 R0BR/jyYj9Pgr5fgYSj5+xRbNPUmlB0JABQ7DJoamkuLE6rngih0UjXQ2iahNC7Q59
 U4aK+R4ErdePpmSQJDR6OcIP4uUAj7a8DOnzX/VtFELirqIp59mzX6hEYwQo8UtDwl
 jjt+X3f8ouzvw==
Date: Tue, 14 Feb 2023 18:17:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <Y+vQScKTumiXe8n3@spud>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-6-cristian.ciocaltea@collabora.com>
 <f1a6c357-b7e0-2869-72e0-e850b63e6ca9@codethink.co.uk>
 <3256853a-d744-4a41-41b6-752b5c95eedc@collabora.com>
MIME-Version: 1.0
In-Reply-To: <3256853a-d744-4a41-41b6-752b5c95eedc@collabora.com>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:40 +0000
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
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 05/12] riscv: Implement non-coherent DMA
 support via SiFive cache flushing
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
Content-Type: multipart/mixed; boundary="===============3194929164843452412=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3194929164843452412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dFnVpkuOuLY3tqvx"
Content-Disposition: inline


--dFnVpkuOuLY3tqvx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023 at 08:06:49PM +0200, Cristian Ciocaltea wrote:
> On 2/13/23 10:30, Ben Dooks wrote:
> > On 11/02/2023 03:18, Cristian Ciocaltea wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>

> > > diff --git a/arch/riscv/mm/dma-noncoherent.c
> > > b/arch/riscv/mm/dma-noncoherent.c
> > > index d919efab6eba..e07e53aea537 100644
> > > --- a/arch/riscv/mm/dma-noncoherent.c
> > > +++ b/arch/riscv/mm/dma-noncoherent.c
> > > @@ -9,14 +9,21 @@
> > > =A0 #include <linux/dma-map-ops.h>
> > > =A0 #include <linux/mm.h>
> > > =A0 #include <asm/cacheflush.h>
> > > +#include <soc/sifive/sifive_ccache.h>
> > > =A0 static bool noncoherent_supported;
> > > =A0 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum dma_da=
ta_direction dir)
> > > =A0 {
> > > -=A0=A0=A0 void *vaddr =3D phys_to_virt(paddr);
> > > +=A0=A0=A0 void *vaddr;
> > > +=A0=A0=A0 if (sifive_ccache_handle_noncoherent()) {
> > > +=A0=A0=A0=A0=A0=A0=A0 sifive_ccache_flush_range(paddr, size);
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0 vaddr =3D phys_to_virt(paddr);
> > > =A0=A0=A0=A0=A0 switch (dir) {
> > > =A0=A0=A0=A0=A0 case DMA_TO_DEVICE:
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ALT_CMO_OP(clean, vaddr, size, riscv_cbom=
_block_size);
> > > @@ -35,8 +42,14 @@ void arch_sync_dma_for_device(phys_addr_t paddr,
> > > size_t size,
> > > =A0 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 enum dma_data_direct=
ion dir)
> > > =A0 {
> > > -=A0=A0=A0 void *vaddr =3D phys_to_virt(paddr);
> > > +=A0=A0=A0 void *vaddr;
> > > +
> > > +=A0=A0=A0 if (sifive_ccache_handle_noncoherent()) {
> > > +=A0=A0=A0=A0=A0=A0=A0 sifive_ccache_flush_range(paddr, size);
> > > +=A0=A0=A0=A0=A0=A0=A0 return;
> > > +=A0=A0=A0 }
> >=20
> > ok, what happens if we have an system where the ccache and another level
> > of cache also requires maintenance operations?

TBH, I'd hope that a system with that complexity is also not trying to
manage the cache in this manner!

> According to [1], the handling of non-coherent DMA on RISC-V is currently
> being worked on, so I will respin the series as soon as the proper support
> arrives.

But yeah, once that stuff lands we can carry out these operations only
for the platforms that need/"need" it.

Cheers,
Conor.


--dFnVpkuOuLY3tqvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+vQJgAKCRB4tDGHoIJi
0gRfAP9Kmf+N7QG3K6IM9+MnqN+wCycLzbKArvQrKfMwajqFCwD5ATnEt/GZfG+F
/C7JzGrUamjvpgCT+vvFkXYMT/CFAgg=
=DgMQ
-----END PGP SIGNATURE-----

--dFnVpkuOuLY3tqvx--

--===============3194929164843452412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3194929164843452412==--
