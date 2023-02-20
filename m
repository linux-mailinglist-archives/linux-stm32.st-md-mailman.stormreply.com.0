Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A36E69CA11
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Feb 2023 12:44:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 045B5C6A5EA;
	Mon, 20 Feb 2023 11:44:31 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6C4DC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Feb 2023 11:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1676893469; x=1708429469;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZayuAzOXe/D7OzJt6Sr2ehYXR3td2/xneVeLxCWKj5Q=;
 b=0+mehNBqF8C6V+G8Lb2nH1b/Dh/LZod7m6nz4C8DeeJTHmDum33kY/BN
 SDWJzkhQy8gzfOQi7+4Km9rdbG6P7k33X3ikfy7kDHTIV/9GszKnxSMI0
 W7zWh6MMBGPc8t1Ayg+bpCC53CTENylC4Y8Iqy49kWDsylqjL5W3gSzuW
 x6dfhvTYJoATyOmGGzRDOWzh2Np1g67Z1Wq8ttxEUM9N6bm6VxVn1HBOI
 swLYxRTfpx3gT+qGStkN+76t2DC0BFlzAjQOofYjj58fDFRbJs8x3OdDf
 pF1/wCTD7Cq1lfBdKz+p0OzTKFi+0rORqsPFLZhxZSNAbASMIvwuEZ1xe A==;
X-IronPort-AV: E=Sophos;i="5.97,312,1669100400"; 
 d="asc'?scan'208";a="201419788"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Feb 2023 04:44:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 20 Feb 2023 04:44:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 20 Feb 2023 04:44:21 -0700
Date: Mon, 20 Feb 2023 11:43:54 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Message-ID: <Y/Nc+u2tP07zjdn5@wendy>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
 <Y+567t+kDjZI+fbo@spud>
 <CAJM55Z_poY3dVu9fQ1W1VQw3V=8VdVKc1+qUcdHduM1aAveJUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_poY3dVu9fQ1W1VQw3V=8VdVKc1+qUcdHduM1aAveJUQ@mail.gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, atishp@atishpatra.org,
 Eric Dumazet <edumazet@google.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, daire.mcnamara@microchip.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
Content-Type: multipart/mixed; boundary="===============7890803986295488002=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7890803986295488002==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wykLVd+P9f03SVcb"
Content-Disposition: inline

--wykLVd+P9f03SVcb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2023 at 10:32:52PM +0100, Emil Renner Berthing wrote:
> On Thu, 16 Feb 2023 at 19:51, Conor Dooley <conor@kernel.org> wrote:
> >
> > Emil,
> >
> > +CC Daire
> >
> > On Sat, Feb 11, 2023 at 05:18:13AM +0200, Cristian Ciocaltea wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >
> > > Add functions to flush the caches and handle non-coherent DMA.
> > >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > [replace <asm/cacheflush.h> with <linux/cacheflush.h>]
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > ---
> >
> > > +void *sifive_ccache_set_uncached(void *addr, size_t size)
> > > +{
> > > +     phys_addr_t phys_addr =3D __pa(addr) + uncached_offset;
> > > +     void *mem_base;
> > > +
> > > +     mem_base =3D memremap(phys_addr, size, MEMREMAP_WT);
> > > +     if (!mem_base) {
> > > +             pr_err("%s memremap failed for addr %p\n", __func__, ad=
dr);
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > > +     return mem_base;
> > > +}
> >
> > The rest of this I either get b/c we did it, or will become moot so I
> > amn't worried about it, but can you please explain this, in particular
> > the memremap that you're doing here?
>=20
> No, I can't really. As we talked about it's also based on a prototype
> by Atish. I'm sure you know that the general idea is that we want to
> return a pointer that accesses the same physical memory, but through
> the uncached alias.

Yah, I follow all the rest of what's going on - it's just this bit of it
that I don't.

> I can't tell you exactly why it's done this way
> though, sorry.

I had a bit of a look on lore, but don't really see anything there that
contained any discussion of what was going on here.

Adding Atish in the off-chance that he remembers!

--wykLVd+P9f03SVcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/Nc+gAKCRB4tDGHoIJi
0n3EAQC515OeaFPBk3H9xce8itMQVAnTfSS/l42S5WPB4nRjrgD/Yk2YSzjgst9w
Ar7d60/RFJU1Ww58YHGgX9z2WqxXHg0=
=+rbV
-----END PGP SIGNATURE-----

--wykLVd+P9f03SVcb--

--===============7890803986295488002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7890803986295488002==--
