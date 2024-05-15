Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580E8C69D6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2024 17:35:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 120A6C6B47A;
	Wed, 15 May 2024 15:35:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7380CC030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2024 15:35:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 077D3614C5;
 Wed, 15 May 2024 15:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6B6C116B1;
 Wed, 15 May 2024 15:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715787312;
 bh=mFPp89JBP13RP40YmDW6PgfDx4xfBMuoJNU3Pvo3lPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TwnoZinfDQsP+m0lTu3G2vz/ndIu67rdNHIyrnbBkM2FgZxv4tDrte3dOZZO76PHf
 M8Z3D7Y9GoMyrleamOzdVl2trMR/gXwDsdPLKL6u42kYeIO8deSPr3B6FZxPXUkG8F
 Z35LRSO2qIWfUchrt/ROI0BYTxPn5qJaNpzw7hDZjbV00lsL6rIRgZzwf8LkIZ35sP
 ArSrc0qg6WLww+/dBRmiQdF0MPqPkklMKy+tH7E53uZqO50pLUlLDNd6xi9tCv8Hd9
 qFtkXA6M7yu9j+LS2T6JW9sJI2w+B73PkeeUEDsPshndxh9yS5GI+AVrc35UobrrvE
 QqMPYYoLRvfDg==
Date: Wed, 15 May 2024 16:35:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20240515-monsoon-starfish-0dc59707e843@spud>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
 <20240513-stabilize-proofread-81f0f9ee38b9@spud>
 <d73d4435-75d6-4cea-b38e-07c7ceae3980@foss.st.com>
 <20240514-entryway-idealize-fcd5ed0e1de7@spud>
 <0c97408c-422d-46b3-8017-da9ebb0767e1@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <0c97408c-422d-46b3-8017-da9ebb0767e1@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============6385145357188235569=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6385145357188235569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JkKRkMhRtnwamX99"
Content-Disposition: inline


--JkKRkMhRtnwamX99
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 04:33:22PM +0200, Patrick DELAUNAY wrote:
> with
>=20
> =A0 compatible:
> =A0=A0=A0 oneOf:
> =A0=A0=A0=A0=A0=A0=A0 - items:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: st,stm32mp1,pwr-reg
> =A0=A0=A0=A0=A0=A0=A0 - items:
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: st,stm32mp13-pwr-reg
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: st,stm32mp1,pwr-reg

Other than the extra ,s this looks okay, thanks.

--JkKRkMhRtnwamX99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTWKwAKCRB4tDGHoIJi
0kUTAP9I0to3ssOtvgcT5/L329easVlA8psjlud98+mrtpVugQD/Y946XMX4gg7A
wxrHcdLedP6hua+tppsYB4CaczHmqwQ=
=igsK
-----END PGP SIGNATURE-----

--JkKRkMhRtnwamX99--

--===============6385145357188235569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6385145357188235569==--
