Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D144CB1DB6A
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 18:13:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2351C36B15;
	Thu,  7 Aug 2025 16:13:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2CD9C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 16:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B259C601BB;
 Thu,  7 Aug 2025 16:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4429FC4CEEB;
 Thu,  7 Aug 2025 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754583196;
 bh=IQPqKFUBZOqlBbuHBV2txu01LxbimFRPE66N8YJtaCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kb8C12SRmA/TCjvwM17rooJf+h6BfX17To5G2qICOvSQ7rgY6iEy5iB2BdNO6I+wg
 QtiKQCPlMs2wxf0Fk0XeV8vRqHdGuzaPcWd98lPlVLbDVtFwUNHfQtYctPTwKpYuOn
 zHXhgN5/QlqEgt8DAwYUJkk7sppkZBMn31yWzntAkQi8rhE6H6W4pIRZfAZ2Pf6wJx
 0RnqGxEA2h3hPkrWxlLGFxkIHy+6sPVXfB9x3J3DiprbAUxRJGPltD8buyC+KpAWeF
 AZVKC2TgRR6e6YaEPpN0ELZfPbXVN+bQiEQjyjzftbEkAVp7tQyDsOWE9oh0FhGLRs
 yHwPnjRhXpK3Q==
Date: Thu, 7 Aug 2025 17:13:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <20250807-polar-ruse-b30ef402c9fa@spud>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
 <20250807-stm32mp15-m_can-add-reset-v2-1-f69ebbfced1f@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20250807-stm32mp15-m_can-add-reset-v2-1-f69ebbfced1f@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@pengutronix.de, Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-can@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-binding: can: m_can: add
 optional resets property
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
Content-Type: multipart/mixed; boundary="===============5921888465076789107=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5921888465076789107==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="95eIz5YQcH/glHyT"
Content-Disposition: inline


--95eIz5YQcH/glHyT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 08:09:30AM +0200, Marc Kleine-Budde wrote:
> The m_can IP core has an external reset line. Add it to the bindings
> documentation.
>=20
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--95eIz5YQcH/glHyT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJTQlgAKCRB4tDGHoIJi
0kUJAP9nSDad7BkpEvlqTnkas2ereywm7R/blr7FIwjgf3067AEA/KXy2nxKIAPs
Jh3qLPDZl+RhlWwEh2w4flquuzXXAgU=
=gIXt
-----END PGP SIGNATURE-----

--95eIz5YQcH/glHyT--

--===============5921888465076789107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5921888465076789107==--
