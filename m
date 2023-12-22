Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0276981C86D
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 11:45:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA6F0C6C855;
	Fri, 22 Dec 2023 10:45:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF1C2C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 10:45:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7F84EB81CAC;
 Fri, 22 Dec 2023 10:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA81C433C8;
 Fri, 22 Dec 2023 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703241909;
 bh=M71MUxo5tOWJH2JovLHaHBk3D0hqx5xBSMLAXH+CgJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=luyCg5jY398Wphp7QI+jDrP903U0YGhFldIIezTNBNPJD3xC9Ul5W5cyHmEJHrRZa
 N+3D2T7Y4np0/k8Bpcn1RcW4Eg38nWhIRoMs5LPdg9US5muuetfF+motAajufngBTj
 XW1am0cGyE/2mSZSgipYZF4ougJ07duN606vjcdtu01MYBST11MntHcoQPWT8tZNgr
 cF38YUTVg1Y+Eu4DmqK9Ry91rhvD3vX1MQlr8oiQDfOtWXkF6YxmG60RPkvEp/Ke4y
 hKZejDTQkvM5cbYtbozyxu8kH+1tlyOr8fqnpv3f/1tnVSULO9+Pwfw0Uy1RK9/M3O
 zNDMxOIPTXOeg==
Date: Fri, 22 Dec 2023 11:45:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZYVosiRTD2w9sVV+@shikoro>
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
 <20231215170617.95868-4-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231215170617.95868-4-alain.volmat@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/9] i2c: stm32f7: simplify status
 messages in case of errors
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
Content-Type: multipart/mixed; boundary="===============2594103214765728248=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2594103214765728248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0h9cSmyPzHBl4aQv"
Content-Disposition: inline


--0h9cSmyPzHBl4aQv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 06:06:07PM +0100, Alain Volmat wrote:
> Avoid usage of __func__ when reporting an error message
> since dev_err/dev_dbg are already providing enough details
> to identify the source of the message.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, thanks!


--0h9cSmyPzHBl4aQv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWFaLIACgkQFA3kzBSg
KbYybRAAlzcv6iwM7R/6fGGyGIucoS8nhhjUkg1kFZ/ZwN98KTomRZY3deDkq5We
7h5K9er1K+2KnJE1ovtmM0E4yYP6leoAx2yv3NKIIrMT1X0QysIXGDVf3wm+FjeQ
9jIE7k+bUj4oxY3bKqT5rqTEqtWCdZ1ltecyCoSRvM6UhOAbOlBW+Bk9CKER/5gx
mtF+JWCLqC6U33zO5OGnZMTclr3SfV26E4VqQtExORkoSxicualxoLdU3kC3tPBs
pDi00odfa/Nb7S5djvMnbgezc2BcsD1SzdW/Vl7glrQqmeF9t5Q0IsuxgM0tUnHt
zMhFlNBOY06GNF4y7iGngh63zdUkCGNj92zHnB2aauK6P8nOQ3pjb+lRU2xhu+6g
M0XAhSgGa/2qS7rEoAWujdsCwXDoatv37zMaw5vWMQyCOduMfPAHH1JtA4/AQVH/
qZ0nMBkhY+uG/PjgmZ8P28ZM+/nZDa29C/+bXdkkcWa7Jef1V0LR/iBq53/KM8Ma
xRvXYxf04nWxcArowzTLzqY9YEXUAuPGZI6UtMCY3+Atykro2G5y4HKfHtZNyPn+
UQuILDFRyg3c4iMipjENfEKa1FzU1WPQ/e1vQDmVz7KJ/Xnd9fUMQKG4sx1dE7gf
WaMILCi9lHuX7wj/+PBwAEh0n5ObCrUDJyAZh/oICwJ4emylSaM=
=OmYE
-----END PGP SIGNATURE-----

--0h9cSmyPzHBl4aQv--

--===============2594103214765728248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2594103214765728248==--
