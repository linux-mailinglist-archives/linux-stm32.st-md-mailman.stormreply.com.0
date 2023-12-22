Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5F881C875
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 11:45:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5B1AC6C841;
	Fri, 22 Dec 2023 10:45:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA9AFC6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 10:45:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3A63ECE20CE;
 Fri, 22 Dec 2023 10:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97A6C433C8;
 Fri, 22 Dec 2023 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703241930;
 bh=5MLgpsJTYLuqYRrWpxRsWF1/TFK8+CG7MDHyVoSKsoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XPKPh2hI3QHdMEB76+M0JQZ+MWd6lohMTxUY+JzFqI67ED3EhuNKax9NrQy992QXz
 GvjEbocXBA2+AMv5FH2V9QODoDXBV0HI3rc7dRG7s6uRcijx0WOqrrxV81wAlXmaUI
 EOoLrIw1lNe08PbUVcwcSc1aXCdb7WNW+2vfq0bFHADRcI13ipjCPDcj2hpxoNGTwP
 Gy3o5pTYx5V1QXHMi5vBXUnoO8f/mbOgj7P1VHVLeBvbjMwNMMsx4HHAxUduRenfxa
 5FE+t6CLO9CRUM5xeT+9pzb5HhpYyJDdT4QddL80UpuElvHJIuHz7fQzLTUI7ZUKB9
 szezi2UuaqLDg==
Date: Fri, 22 Dec 2023 11:45:27 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZYVox185zFjRZUJ4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231215170617.95868-1-alain.volmat@foss.st.com>
 <20231215170617.95868-6-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231215170617.95868-6-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 5/9] i2c: stm32f7: perform I2C_ISR read
 once at beginning of event isr
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
Content-Type: multipart/mixed; boundary="===============3550968411826820995=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3550968411826820995==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/SE4QN9cT3rppdLX"
Content-Disposition: inline


--/SE4QN9cT3rppdLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:09PM +0100, Alain Volmat wrote:
> Move readl_relaxed of I2C_ISR register at beginning of event isr
> so that it done once for both master & slave handling.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--/SE4QN9cT3rppdLX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaMcACgkQFA3kzBSg
Kba4Gg/7BkltCTe7oP8JOFK7FbYBVgFF1OLvT02kjyOP/I30dy+XGdXXMHfDdtnO
KGsvZ9RGX8tnpUBaPKnqt/BKBkic3uwkCTIt2fSM64qLtrHmpDESkGY+Nxrjaz7i
/cGk4/2PEFniKLUJ6BgQ273UUz9kDCzVRJ1UjSUfFeg/BxTYR4pHEDTMFSpR0ZGV
9QcjsIoq1rvaIthBlm8ZYf9AoAsIQrpYQzlespfiJotVXzKwRr7W0EOojYZWOzSp
k/LQVcX1pFsfzSZUgg9niClPFSdpBl7a2vYSvx/FEhKcxO/is7TZ28Y8e6kZU3b5
HoBOuzcv/OUXqDCUag0RE4uvqwk8dvVfE888Zzqt/YO0OxbtX7e5FbK+wL4jzNg+
zTBQJfYQwmGmrQqLCVzo0nPh58IsS+gwFdHbKXSiRKM5CfDJRpIpFSVGss01RKVi
PDe1g/1nFNnDa772zvC4v/LvQqWD1qu4e4IxkyxexXDvMk1HnlWcNp7vx0FYbDsE
r8tR/XBbMrJ50QX0wjXXseLBKBOO92hau6aLacK7Cg0CTKB2Wn9cDC/iVgJhjwKu
qLUxSIrbK6vW1Rx7poH3uylk/ICR6+1udzFnPoRXMiUw1R9kewQKjdl/y7Iajq1T
/yodi9NiR5H/KLQcRevPGTqXkn42zR6o9ZtK7s1H5HUlR+qU57M=
=FAWm
-----END PGP SIGNATURE-----

--/SE4QN9cT3rppdLX--

--===============3550968411826820995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3550968411826820995==--
