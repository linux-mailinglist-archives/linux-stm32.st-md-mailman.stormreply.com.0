Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B68C6A5C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2024 18:16:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 683AEC6B47A;
	Wed, 15 May 2024 16:16:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 910AEC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2024 16:16:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 786C5614C6;
 Wed, 15 May 2024 16:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6694DC2BD11;
 Wed, 15 May 2024 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715789761;
 bh=42K17Pixe7XXPK9EXtpix+bwi36V54XcX1AVcxIzguU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RUKFii8/7p0ye6uTbavZiSXtpCpADTjXNc4JuqYMXL/DWJGc+MaVAoHh2BtYnHktK
 ebx8rN0S1pcglDZdethKl1TgooFBCGDv4XtdhS61qPFk8Xo5+/i/IpB1Gc5Dq6hPFs
 p/CWoznIdWcyZHg5jwLtAI9f5GDEua76zMTefc6ogdMN1dE/YAT1Jek4WhZd1Brp+J
 kjx1sbCfPCuBGBjdgy5NYiGBo+MqCUQqoiNirM3Llho7IVYPTLEJnAdkCloARMHK16
 d7jct0ZrqUfh9w0D2cIZcbAgseOyyLsGUfUeUiSOf7Qd+bl7VYWp0hmBH7m+Ml/1c+
 V9spvA0Sfj0Eg==
Date: Wed, 15 May 2024 17:15:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20240515-edginess-evacuee-356bd6dd1dfa@spud>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
 <20240513-stabilize-proofread-81f0f9ee38b9@spud>
 <d73d4435-75d6-4cea-b38e-07c7ceae3980@foss.st.com>
 <20240514-entryway-idealize-fcd5ed0e1de7@spud>
 <0c97408c-422d-46b3-8017-da9ebb0767e1@foss.st.com>
 <20240515-monsoon-starfish-0dc59707e843@spud>
 <9de93cbb-5868-473e-8b32-a6b6f50e128e@denx.de>
MIME-Version: 1.0
In-Reply-To: <9de93cbb-5868-473e-8b32-a6b6f50e128e@denx.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Pascal Paillet <p.paillet@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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
Content-Type: multipart/mixed; boundary="===============4713980753425768015=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4713980753425768015==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vGXUQ+w0Hao4jwFN"
Content-Disposition: inline


--vGXUQ+w0Hao4jwFN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 05:37:49PM +0200, Marek Vasut wrote:
> On 5/15/24 5:35 PM, Conor Dooley wrote:
> > On Wed, May 15, 2024 at 04:33:22PM +0200, Patrick DELAUNAY wrote:
> > > with
> > >=20
> > >  =A0 compatible:
> > >  =A0=A0=A0 oneOf:
> > >  =A0=A0=A0=A0=A0=A0=A0 - items:
> > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: st,stm32mp1,pwr-reg
> > >  =A0=A0=A0=A0=A0=A0=A0 - items:
> > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: st,stm32mp13-pwr-reg
> > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: st,stm32mp1,pwr-reg
> >=20
> > Other than the extra ,s this looks okay, thanks.
>=20
> I think the extra ,s are actually correct, those are the ones from the
> original compatible which had TWO ,s (it does look a bit unusual).

Oh my bad then.

--vGXUQ+w0Hao4jwFN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTfvAAKCRB4tDGHoIJi
0p9iAPwN5XTdKgnKFAKBFLUCmGz50a3vlmMabr0JmpTLuLgpKAD/cZUlfPgi/276
T/QPKGx911es1Agw6CvtZIZoWgzNOgk=
=Bsop
-----END PGP SIGNATURE-----

--vGXUQ+w0Hao4jwFN--

--===============4713980753425768015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4713980753425768015==--
