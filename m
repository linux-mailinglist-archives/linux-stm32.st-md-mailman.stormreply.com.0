Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7435F2059
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Oct 2022 00:35:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24CC5C6410B;
	Sat,  1 Oct 2022 22:35:41 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20C57C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Oct 2022 22:35:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E9C1B80B05;
 Sat,  1 Oct 2022 22:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C7CC433D6;
 Sat,  1 Oct 2022 22:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664663738;
 bh=swneQQXOQAQ0Wdj3JPZ6GWV3p1eHW3tC1dAEqKMmuaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FN/w/UsqTzHQtetSNGrpk0tLzpOf9UiAqYXiiR4dlVu+HdPvOUEbPXos9PGL1bZrq
 OutAiAOS2TOpjU5kkOqjlEtJgAz/oEOyO33vrfYYezkqy6IKEoaBn6cCkHllhyY1Cn
 5mEpI5G4Cjs2BEY1ZFatmbEwgUDV0Z3Qbkn+RuLk3InW/y3Ou3sqAgFcoQOXTQaK3d
 J6x/GYkm3iZxbXBqDfO8Jk1DxUQ6BlE6QK6iHA/YXN5tgRhDq3oe57SOQQD++I+Uvv
 JV4mxkxUZWIdgJhVC7em4JMNIJqHyEaL8GZKefL83VxHEoaOB126Jq/VZap4Yi5k+9
 O8rha9OCDcQzg==
Date: Sun, 2 Oct 2022 00:35:34 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <YzjAtpv+DEuN0cn3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220926204653.381722-1-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <20220926204653.381722-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: i2c: st,
 stm32-i2c: Document wakeup-source property
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
Content-Type: multipart/mixed; boundary="===============0631902157548364433=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0631902157548364433==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ix0A9gtV74R/Odxm"
Content-Disposition: inline


--Ix0A9gtV74R/Odxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 10:46:53PM +0200, Marek Vasut wrote:
> Document wakeup-source property. This fixes dtbs_check warnings
> when building current Linux DTs:
>=20
> "
> arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: i2c@40015000: Unevaluated =
properties are not allowed ('wakeup-source' was unexpected)
> "
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied to for-current, thanks!


--Ix0A9gtV74R/Odxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM4wLYACgkQFA3kzBSg
KbZL1BAAjZo6/BDX8hm/eD9r6tlV4/e5VpfdUTfSK6gQtW1EXGzyfXzWjrh160S/
+VIejBWXHeB/XPuvSVfrbnJ+a5hV8HkjPKXMit49CoEYjtik1N9RPppxlzSoLofP
b1WAoGkO9g2oViNroZZMLSZnr6LJ+z0XZd8+SVpr0ocpyJFa+wzVxTFNUYfT/59b
iXyuiO6ze+HaAsYNq9UeWeXwyi7fmZaDGCRuMuUqUcxG2M8zCPTMzSdboAVwGLj7
wKfHRp+oYbJO4eSSg7lQ6pj9psSxgO4GBY9tUXQb2WaZr0P4hgk4HEjiaXo1FAyy
JKXOx7C5kGWEiFCSa+2moH8DzcWzbHhhRo7IEGHoFqFGWeeTGQNlJwASSQ9tdrYm
zt0t1fMbd/VZr7wsGLkDZ83cdqiZD0t4bPoZOhqJvhEvhwzWJ++V9H+ctjoX9F3h
US2YPc2B6ERQ/kFWPOcXiV4JXhXAjc9l0ryHfES/rtTfnIwPx9+4Nu4ETwaRbiWa
MIzRCrAapWn9qEyhO8EAQP3djyR5bt+AQipZk1ugr0pWERiRLzbOpQfWxDgZFpFP
6VzhcdJxrO9AyecojWhHnlkOtqbVchU8pUBtZKPobMCSFcU8OFzP5BryvLt6X2Pi
Lf2p38U5K4fhQ0S7ECX5hEKMUN5mfvXCnplTKGCGB0xAebJMc0o=
=YoX9
-----END PGP SIGNATURE-----

--Ix0A9gtV74R/Odxm--

--===============0631902157548364433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0631902157548364433==--
