Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E57BB438
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 11:30:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21758C6C836;
	Fri,  6 Oct 2023 09:30:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16903C6C835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 09:30:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 983FB61CD6;
 Fri,  6 Oct 2023 09:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5D0C433C7;
 Fri,  6 Oct 2023 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696584606;
 bh=X+gyCNuttx65afYQmM1XbC4BVY4NKTMe7P7eG20cYvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oV7nJE7trH7bHWGst1p5CracmcgyV+yxJgvIYJjBvDO+4wbhBd7cmRmCODWBswK5X
 hZMVnT4NSmZcMTMfN1i9In0nTOV8vBcqJdmE2edGy5146U4TdBL1EFFqzAPZWB/Ahr
 r2xFiy8FBjjokRqDZ3PQQqXmLFIv6dePXvvAZ9hZlfOy7AXtAw5+PsqcZtPOAFFePk
 nn3XUUtKP6sl0Stg6kzdKCk6eXcHDBejQdpvoo0MERUO3ScnWJKgzxum7iG4mxNmF+
 CfYWAcfvLgppuNGExUmaTGQGAmoKMmP0pK6LR87zJANzr58PbEnPVkwVgcH3yiIJfv
 N9FrwDLLqUk/w==
Date: Fri, 6 Oct 2023 10:30:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe ROULLIER <christophe.roullier@foss.st.com>
Message-ID: <20231006-storable-smugness-6a6820ebb6cf@spud>
References: <20230928151512.322016-1-christophe.roullier@foss.st.com>
 <20230928151512.322016-3-christophe.roullier@foss.st.com>
 <20230928-ruse-parsnip-ce691bd4d0c9@spud>
 <85e3b93c-36b2-cb4c-9438-ad05d24b3332@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <85e3b93c-36b2-cb4c-9438-ad05d24b3332@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 02/12] dt-bindings: net: add new
 property st, ext-phyclk in documentation for stm32
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
Content-Type: multipart/mixed; boundary="===============7838391422791871939=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7838391422791871939==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XWEolTRpRQdNMg4C"
Content-Disposition: inline


--XWEolTRpRQdNMg4C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2023 at 11:03:43AM +0200, Christophe ROULLIER wrote:
>=20
> On 9/28/23 19:17, Conor Dooley wrote:
> > On Thu, Sep 28, 2023 at 05:15:02PM +0200, Christophe Roullier wrote:
> > > Add property st,ext-phyclk to manage cases when PHY have no cristal/q=
uartz
> > > This property can be used with RMII phy without cristal 50Mhz and whe=
n we
> > > want to select RCC clock instead of ETH_REF_CLK
> > > Can be used also with RGMII phy with no cristal and we select RCC clo=
ck
> > > instead of ETH_CLK125
> > > This new property replace st,eth-clk-sel and st,eth-ref-clk-sel
> > I don't really see a response to Rob's comment on v2, either here or in
> > a reply to his email on v2:
> > | Certainly 1 property is better than 2 for me, but carrying 3 is not
> > | great. I don't understand why the we need a new property. What can't =
be
> > | supported with the existing properties?
> >=20
> > A sentence saying explaining exactly what the old properties do not
> > support that this one does, would be very helpful.

> I understand your remarks, the goal of the new property is to be more sim=
ple
> for customers/users
>=20
> with old properties we have lots of support to explain which one to use in
> which cases, now only one property to use (regardless of mode)

I'm inclined to say "that's tough" & that the existing property
descriptions should be improved rather than adding yet a third one.
Maybe you're lucky and Rob disagrees with me :)

Thanks,
Conor.

> > > Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> > > ---
> > >   Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 9 +++++++++
> > >   1 file changed, 9 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b=
/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > index ca976281bfc22..67840cab02d2d 100644
> > > --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > @@ -78,12 +78,21 @@ properties:
> > >         encompases the glue register, the offset of the control regis=
ter and
> > >         the mask to set bitfield in control register
> > > +  st,ext-phyclk:
> > > +    description:
> > > +      set this property in RMII mode when you have PHY without cryst=
al 50MHz and want to
> > > +      select RCC clock instead of ETH_REF_CLK. or in RGMII mode when=
 you want to select
> > > +      RCC clock instead of ETH_CLK125.
> > > +    type: boolean
> > > +
> > >     st,eth-clk-sel:
> > > +    deprecated: true
> > >       description:
> > >         set this property in RGMII PHY when you want to select RCC cl=
ock instead of ETH_CLK125.
> > >       type: boolean
> > >     st,eth-ref-clk-sel:
> > > +    deprecated: true
> > >       description:
> > >         set this property in RMII mode when you have PHY without crys=
tal 50MHz and want to
> > >         select RCC clock instead of ETH_REF_CLK.
> > > --=20
> > > 2.25.1
> > >=20

--XWEolTRpRQdNMg4C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZR/TlwAKCRB4tDGHoIJi
0htAAPoDIpGKoxqgwmpbLaqFYFbJoORCve21nUaBMeoV7oXrnwEA7WAWoOsddrra
Y6AaAwcSOdndS0cRdxGuTlwC24VpXQs=
=i9+i
-----END PGP SIGNATURE-----

--XWEolTRpRQdNMg4C--

--===============7838391422791871939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7838391422791871939==--
