Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9617831CB6
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jan 2024 16:41:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A1F0C6DD6E;
	Thu, 18 Jan 2024 15:41:49 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FFB0C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jan 2024 15:41:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6910BCE1EA5;
 Thu, 18 Jan 2024 15:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C458EC433F1;
 Thu, 18 Jan 2024 15:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705592503;
 bh=0dg8gCi027aqyQkkdyqr608rsf8Hv67e4dEkXVJeqxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L0nRYpd9cOsm7r31YagIZUvR8FTkySKaPHDBJqnK76TqU1UKU3eRdYsu/R/CfUrqS
 CCu5nmKhV+qK982KagjBWwwFot8c6UBgEEdbYnlr/0rZ8CC5g0iFYwir6RQ+iI/JAY
 baeS58GFSqHw14sHSJ9oOg9LRMi11VqzaESfa94e/ecW9L3EYRKhRl+vqCv2s1OC+X
 voa8yOOLT5sQ7Bx4tbEDCUlHta+b0Ru1UQb5kR8ls06RhpviHg/72xuDmV/R2kN5ez
 MZjXYSLysNVASVpXbgT6uKLt2rPFIuu3g33U2zk0n9ZkLby4QZBmpsgMMisOC8wSx5
 Xdj76HCdDDLDA==
Date: Thu, 18 Jan 2024 15:41:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
Message-ID: <20240118-sitting-stuffy-e0f6cfd9d0fa@spud>
References: <20240118091135.3314330-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240118091135.3314330-1-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: serial: stm32: add
	power-domains property
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
Content-Type: multipart/mixed; boundary="===============3134003268279731859=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3134003268279731859==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HsMrVQe1C4uOpd/T"
Content-Disposition: inline


--HsMrVQe1C4uOpd/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 10:11:35AM +0100, Valentin Caron wrote:
> STM32 serial may be in a power domain.
> Allow a single 'power-domains' entry for STM32 serial devices.
>=20
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--HsMrVQe1C4uOpd/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZalGsgAKCRB4tDGHoIJi
0kt1APoDLR0MN3FkK9xP/tGCyevBFisonRXWwOKvEjAyfkyBJwD/dm0PHjL1cCO8
0TyopCnBHeVYPHZhAt0+epTcY057qwI=
=Z8Oa
-----END PGP SIGNATURE-----

--HsMrVQe1C4uOpd/T--

--===============3134003268279731859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3134003268279731859==--
