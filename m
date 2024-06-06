Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E298FDB60
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2024 02:21:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF6FCC71293;
	Thu,  6 Jun 2024 00:21:40 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13D62C6DD67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2024 00:21:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1FEBBCE1877;
 Thu,  6 Jun 2024 00:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EADC2BD11;
 Thu,  6 Jun 2024 00:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717633289;
 bh=0eqwJwhSDudfIsQGh0ug1pR2nn0XzPNrcqHG9ZVooZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CNpBr32h9yuMuy3yQWmdzA992nM0YscVDDU+fePYeKMrz2XPrvz4qpbbfaNBylmgu
 UAry4ljCEaibcrHuCEk8Skkox4YS3ZiSOietntDckKfJl09TEridoFIwLY2PM5/qvd
 gG4S4EHeSk/MBknaSFI35L2z1nIX52XM8yEV5KovqZokvsnewF1cdQYxGNds73KqLO
 18eDogdGvH82Z25Toi2xnVkES985Zln1jJwUprn4jTfsjNqUpSw5O8/isPmLYcRu+Y
 P3v1mCugSqAMB2EA43vZH25iEdtBNi5+qlMcW7qqvFuD5kh+YbaHKLKWtvW0bjq73v
 eiW3dDWgagiGA==
Date: Wed, 5 Jun 2024 18:21:26 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20240606002126.GA3496044-robh@kernel.org>
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
 <20240604143502.154463-2-christophe.roullier@foss.st.com>
 <067d41e5-89cf-45eb-8cfa-b6c3cd434f76@linaro.org>
 <70b66190-2c55-4228-8c31-f58a05829d8b@foss.st.com>
 <c6ff5778-f928-4a65-8a32-a3582d9d8f94@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6ff5778-f928-4a65-8a32-a3582d9d8f94@linaro.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe ROULLIER <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 01/11] dt-bindings: net: add STM32MP13
 compatible in documentation for stm32
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Jun 05, 2024 at 01:46:33PM +0200, Krzysztof Kozlowski wrote:
> On 05/06/2024 11:55, Christophe ROULLIER wrote:
> > =

> > On 6/5/24 10:14, Krzysztof Kozlowski wrote:
> >> On 04/06/2024 16:34, Christophe Roullier wrote:
> >>> New STM32 SOC have 2 GMACs instances.
> >>> GMAC IP version is SNPS 4.20.
> >>>
> >>> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> >>> ---
> >>>   .../devicetree/bindings/net/stm32-dwmac.yaml  | 41 +++++++++++++++-=
---
> >>>   1 file changed, 34 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b=
/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> >>> index 7ccf75676b6d5..ecbed9a7aaf6d 100644
> >>> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> >>> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> >>> @@ -22,18 +22,17 @@ select:
> >>>           enum:
> >>>             - st,stm32-dwmac
> >>>             - st,stm32mp1-dwmac
> >>> +          - st,stm32mp13-dwmac
> >>>     required:
> >>>       - compatible
> >>>   =

> >>> -allOf:
> >>> -  - $ref: snps,dwmac.yaml#
> >>> -
> >>>   properties:
> >>>     compatible:
> >>>       oneOf:
> >>>         - items:
> >>>             - enum:
> >>>                 - st,stm32mp1-dwmac
> >>> +              - st,stm32mp13-dwmac
> >>>             - const: snps,dwmac-4.20a
> >>>         - items:
> >>>             - enum:
> >>> @@ -75,12 +74,15 @@ properties:
> >>>     st,syscon:
> >>>       $ref: /schemas/types.yaml#/definitions/phandle-array
> >>>       items:
> >>> -      - items:
> >>> +      - minItems: 2
> >>> +        items:
> >>>             - description: phandle to the syscon node which encompase=
s the glue register
> >>>             - description: offset of the control register
> >>> +          - description: field to set mask in register
> >>>       description:
> >>>         Should be phandle/offset pair. The phandle to the syscon node=
 which
> >>> -      encompases the glue register, and the offset of the control re=
gister
> >>> +      encompases the glue register, the offset of the control regist=
er and
> >>> +      the mask to set bitfield in control register
> >>>   =

> >>>     st,ext-phyclk:
> >>>       description:
> >>> @@ -112,12 +114,37 @@ required:
> >>>   =

> >>>   unevaluatedProperties: false
> >>>   =

> >>> +allOf:
> >>> +  - $ref: snps,dwmac.yaml#
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - st,stm32mp1-dwmac
> >>> +              - st,stm32-dwmac
> >>> +    then:
> >>> +      properties:
> >>> +        st,syscon:
> >>> +          items:
> >>> +            maxItems: 2
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            enum:
> >>> +              - st,stm32mp13-dwmac
> >>> +    then:
> >>> +      properties:
> >>> +        st,syscon:
> >>> +          items:
> >>> +            minItems: 3
> >> I don't think this works. You now constrain the first dimension which
> >> had only one item before.
> >>
> >> Make your example complete and test it.
> >>
> >> Best regards,
> >> Krzysztof
> > =

> > Hi Krzysztof,
> > =

> > "Official" bindings for MP15: st,syscon =3D <&syscfg 0x4>;
> > "Official" bindings for MP13: st,syscon =3D <&syscfg 0x4 0xff0000>; or =

> > st,syscon =3D <&syscfg 0x4 0xff000000>;
> > =

> > If I execute make dt_binding_check =

> > DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/net/stm32-dwmac.yam=
l with:
> > =

> >  =A0=A0 For MP15: st,syscon =3D <&syscfg>; =

> > =3D>bindings/net/stm32-dwmac.example.dtb: ethernet@40027000: st,syscon:=
0: =

> > [4294967295] is too short
> > =

> >  =A0=A0 For MP15: st,syscon =3D <&syscfg 0x4 0xff0000>; =

> > =3D>devicetree/bindings/net/stm32-dwmac.example.dtb: ethernet@40027000: =

> > st,syscon:0: [4294967295, 4, 16711680] is too long
> > =

> >  =A0=A0 For MP13: st,syscon =3D <&syscfg 0x4>; =3D> =

> > devicetree/bindings/net/stm32-dwmac.example.dtb: ethernet@5800a000: =

> > st,syscon:0: [4294967295, 4] is too short
> > =

> >  =A0=A0 For MP13: st,syscon =3D <&syscfg 0x4 0xff0000 0xff>; =3D> =

> > devicetree/bindings/net/stm32-dwmac.example.dtb: ethernet@5800a000: =

> > st,syscon:0: [4294967295, 4, 16711680, 255] is too long
> > =

> > So it is seems good :-)
> =

> Code is still incorrect, although will work because of how schema parses
> matrix. But even by looking it is not symmetrical between allOf:if:then
> and properties:. Make it symmetric - apply the number of items on the
> second dimension.

It looks correct to me. But it could also be like this:

st,syscon:
  items:
    - minItems: 3

Either way works. Is that what you are asking for? I'm just happy when =

folks can write a working schema.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
