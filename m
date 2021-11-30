Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7D462F94
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Nov 2021 10:27:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34DFCC5A4D4;
	Tue, 30 Nov 2021 09:27:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4306AC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 09:27:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 797C6CE1804;
 Tue, 30 Nov 2021 09:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BCEC53FC1;
 Tue, 30 Nov 2021 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638264469;
 bh=LmSuUa85V5nIs4IgnCRvSbXhiFQa4tEo1efwaS48oF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l1RzjZIgG6sEkIZpp03hE0TMDNof+ZS7walaROPkD70dyd8pdNbL72B+sRJdI6Odj
 BItlvEmoYwjKNbdBHgs2B4IgBU3fstJjClXxq4ldEsHomGE0hxx53XsCUMwjUgFNP7
 lS2TeZRqFkDpZiTpwCpJ0DYJibAo0YP8/5sd01rCD2829wI16zrUgu8hNmj/Q4+Dgw
 oaqJ2+q3o7RqUAD+I7ez131RGdrKEf7r1Ty19z6uzjE+vwGzfcCxUnQKAbO9vJmIJf
 VSOasaQvjLwtRI661SrhvwwvAF3oNpStdv0mteI3UuIrAGOjDwcaxJUqCG9yT1QIT8
 ZolfxDsWFpX2g==
Date: Tue, 30 Nov 2021 10:27:46 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <YaXukgow7K7J+oEP@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 pierre-yves.mordret@foss.st.com, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1632151292-18503-1-git-send-email-alain.volmat@foss.st.com>
 <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1632151292-18503-3-git-send-email-alain.volmat@foss.st.com>
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/4] i2c: stm32f7: recover the bus on
	access timeout
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
Content-Type: multipart/mixed; boundary="===============5487360429283973429=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5487360429283973429==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DtwuJVhEcNw6taPa"
Content-Disposition: inline


--DtwuJVhEcNw6taPa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:21:30PM +0200, Alain Volmat wrote:
> When getting an access timeout, ensure that the bus is in a proper
> state prior to returning the error.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!


--DtwuJVhEcNw6taPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGl7pIACgkQFA3kzBSg
KbbSqw//e76z0Lay2dQXXSOWBwCaNR8hQyOXqADYFwn2TJ6tr7ac32UTzhlyfbgJ
qL3AfvPikNHIqEJS0bdxi9MtgsyCXchDyAGQSWAwO0sTXHvbPIlwEPwozLVSFxLE
D7WC4W2jRcaiZups2Iav72wvPG2ZvLwLFPmsLhh51omi4WzPzKo0gCdtcBDotKvO
Oq2JginNTpnZszJYy5bl/nc/cJBu89VswrEgWFUVAZzB9BkJZNwQDa8Nh4xZo3XN
CePjacumKuryT7f70j+OwptSDc0nCEHldjb6Z93n80QLVSOqHAwij4L+DzzVZ7FG
QY8U7Xp1tCynvz4IyBj0A1CsiKuBZE1YM4izqDiKUP/pmkds9Z1KWfqQc1LRpbAj
/qZq/Xg4gTlF2wohFNSwro4qgcSKzUIozwLMB5oNDMaPbIiYtOL+3/Ud9JwtVTl7
SmwCsaVohgOwm1tqKHm8KuE9q8GG9A8206f5Q9FjFZumskGTsArpusrmxMnuh4lc
62EuQLd0mrBgfPghwqlYBglEg5hI5qqMaBe+TpS8IoWXGmBKv3dDDNiZaZfVVRvY
VD3YLPMWNIpaEe8RrDe/c4u+qDg+yu2+iCcfv9c5vzxiuKisVQFcPDnleoiC/U8K
Z5i9ASDLm+e3x66QoXJUDzl37dgESMDKNzcA8brIOTxyx5BVSqM=
=N4ki
-----END PGP SIGNATURE-----

--DtwuJVhEcNw6taPa--

--===============5487360429283973429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5487360429283973429==--
