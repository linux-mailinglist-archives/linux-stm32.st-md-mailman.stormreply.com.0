Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1878213E3
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jan 2024 15:04:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1870DC6C83C;
	Mon,  1 Jan 2024 14:04:51 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32442C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jan 2024 14:04:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39385CE09EA;
 Mon,  1 Jan 2024 14:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050A9C433C8;
 Mon,  1 Jan 2024 14:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704117885;
 bh=FzuSWwWvpBgAC2NCSRqKQPffhPoMdS2sf1padg0K5bU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAn69pGUv+pGF4zzLDwLCXkfDc6iP8o0G2HVNKYRg6RbrALO1++9Gq52fyGml9R1h
 m9EGtgOERHhJJ56d9v9WtrcdMj6BEX0cPBTo6IUTP7ICfu4ukMtVVfasKfUgHKH3Cm
 DiJNihltvI4Ia5/rU1Ef/s5vU9F5avo8qo8g5ytrW31H+tV6+/nV9Vay0jw1O3/sV/
 8rX0F2Q/0YZc+mX30esK99HeNrLfAG4aq9XGnKDF0SmeCIqSrhKNyVfPRzE/v8BpEu
 6PFNawN8NyAbANhNLbBPnfksQtGVnPK/Fq5GDsU+9jNmbFXNletNrACYJ/agFQi0T3
 SVg1PfcWdsEDw==
Date: Mon, 1 Jan 2024 14:04:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240101-devouring-anointer-d6da59bd872b@spud>
References: <20231229135154.675946-1-dario.binacchi@amarulasolutions.com>
 <20231229135154.675946-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20231229135154.675946-2-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/8] dt-bindings: mfd: stm32f7: Add
 binding definition for DSI
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
Content-Type: multipart/mixed; boundary="===============7293901289749519457=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7293901289749519457==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RloIUIyV6rC2Sjnj"
Content-Disposition: inline


--RloIUIyV6rC2Sjnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 29, 2023 at 02:51:16PM +0100, Dario Binacchi wrote:
> Add binding definition for MIPI DSI Host controller.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--RloIUIyV6rC2Sjnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZLGeAAKCRB4tDGHoIJi
0k/vAQC1vXTxuphnM+TaXni2YgUQ1I4XsaY5LnyNMwJoGnGxGgEAnwat9dn5e+ne
g1K7ezWGpq/8RjqpyLPfsx47gcHaYgs=
=aG3R
-----END PGP SIGNATURE-----

--RloIUIyV6rC2Sjnj--

--===============7293901289749519457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7293901289749519457==--
