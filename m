Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E589664A0
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 16:55:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 638C4C6C841;
	Fri, 30 Aug 2024 14:55:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2DCCC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 14:55:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 81786AE4A82;
 Fri, 30 Aug 2024 14:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5EBC4CEC2;
 Fri, 30 Aug 2024 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725029711;
 bh=9FTsVXS5gV6o6qLuJP6JjRydy1fTYjBjAK227EtLTU4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jirIoIPPFjw0IxjqZulDpWUEt/3grrBuV0v1E14wpzj/zCAEfRFvyhY0fH0O0Lf6X
 +6ct6fwCyeyB9w/6Dj3WMPPDyiz/0KyznuwmrF0LnpgBa8KRJrFewbCUWY4Dz88oek
 SW49Ir10VIuF7QnQDv3IGxSD/HzVRgo6WRtUSLoq/qJz7J06aT6G1v9cmRXKZXJ74+
 bTl5DGpLduY5VJJRcW7nD3y2QZcm4k/tEYhiVe01uNv1Ay3Wrn0BvvqwWUL7LyZlRK
 mQWyH9R/Y7wpFz7Ov4eCgtuUxMtmOkKFjgyDw/JzzdMggIHLE+trhFO0fsCRRry+vY
 FAcW/g8m/fmAw==
Date: Fri, 30 Aug 2024 15:55:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20240830-jumbo-wriggly-39c84108371b@spud>
References: <20240828143452.1407532-1-christian.bruel@foss.st.com>
 <20240828143452.1407532-2-christian.bruel@foss.st.com>
 <20240828-handsfree-overarch-cd1af26cb0c5@spud>
 <005a2f7d-ab46-46c8-a0cc-b343685caf7c@foss.st.com>
 <20240829-manifesto-tray-65443d6e7e6e@spud>
 <777a92d9-ed52-4fa1-b235-e3a4a6321634@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <777a92d9-ed52-4fa1-b235-e3a4a6321634@foss.st.com>
Cc: kishon@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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
Content-Type: multipart/mixed; boundary="===============4180965054774352148=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4180965054774352148==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vp/iFskmsMfOFY45"
Content-Disposition: inline


--vp/iFskmsMfOFY45
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 02:53:15PM +0200, Christian Bruel wrote:
>=20
> On 8/29/24 18:44, Conor Dooley wrote:
> > On Thu, Aug 29, 2024 at 01:06:53PM +0200, Christian Bruel wrote:
> > > On 8/28/24 18:11, Conor Dooley wrote:
> > > > On Wed, Aug 28, 2024 at 04:34:48PM +0200, Christian Bruel wrote:

> > > > > +  st,syscfg:
> > > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > > +    description: Phandle to the SYSCON entry required for config=
uring PCIe
> > > > > +      or USB3.
> > > > Why is a phandle required for this lookup, rather than doing it by
> > > > compatible?
> > > the phandle is used to select the sysconf SoC configuration register
> > > depending on the PCIe/USB3 mode (selected by=A0xlate function), so it=
's not
> > > like a lookup here.
> > If "syscon_regmap_lookup_by_phandle()" is not a lookup, then I do not
> > know what is. An example justification for it would be that there are
> > multiple combophys on the same soc, each using a different sysconf
> > region. Your dts suggests that is not the case though, since you have
> > st,syscfg =3D <&syscfg>; in it, rather than st,syscfg =3D <&syscfg0>;.
>=20
> I didn't get your suggestion earlier to use "syscon_regmap_lookup_by_comp=
atible()".
>=20
> We have several other syscon in the other. That's why we choose a direct =
syscfg phandle

In the other what? SoCs?

Way I see it, if you're going to support different socs in the same
driver, it's almost a certainty that the offsets within a syscon that
particular features lie at are going to change between socs, so even if
you have a phandle you're going to need to have the offsets in your
match data. And if you're going to have offsets in match data, you may
as well have the compatibles for the syscon in match data too.
If the layout of the syscon hasn't changed between devices, then you
should have a fallback compatible for the syscon too, making
syscon_regmap_lookup_by_compatible() function without changes to the
driver.

If you do have multiple syscons, but they do different things, they
should have different compatibles, so having multiple syscons doesn't
justify using a property for this either in and of itself. If you have
multiple syscons with the same layout (and therefore the same
compatible) then a phandle makes sense, but if that's the case then you
almost certainly have multiple combophys too! Otherwise, if you have one
syscon, but the controls for more than one combophy are in it, then
having a phandle _with an offset_ makes sense.

If you know there are other SoCs with more than one combo phy, do they
use different syscons, or is the same syscon used for more than one
combophy?

--vp/iFskmsMfOFY45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtHdSgAKCRB4tDGHoIJi
0pGbAQCKAWCZmjg06h86FVbvpXKdo/qvENzO4ym5L15FMJIkNAEAtFIoyWzGJo7B
vhqqrWfJ39dnSjvWdg+xaa8Og8rsAgM=
=DAUE
-----END PGP SIGNATURE-----

--vp/iFskmsMfOFY45--

--===============4180965054774352148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4180965054774352148==--
