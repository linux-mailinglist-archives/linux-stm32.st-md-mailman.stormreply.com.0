Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2B384B884
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 15:55:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E86EC6B476;
	Tue,  6 Feb 2024 14:55:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C800DC6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 14:55:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8BF4D6154A;
 Tue,  6 Feb 2024 14:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3A3C433F1;
 Tue,  6 Feb 2024 14:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707231318;
 bh=rC14wVFYqy4h/Awdz20rT2AXbkytWG1Up7dvXS+wKTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKPMwO3zpuufaHVwrevb03P/7KzYU8fGHI9AvBbZ+BUm6dQJOkhg4xx3hAPXMtvd4
 3knWHB0o9HPhdijomX7dJQuwP/kMbs0o3Ymjwenj3p3oNkQcgeqq7iIteAPRPH3yPA
 zg2o7DS/BiHmYC9YrHDwkC+KC47/bmtCXatzb7+WZlBMSZw2EobSXhBqJzB1oKSb9y
 kzqUF6X6bBtmcWRypHZe1Szgl68JfDev8cJmc6dt4Bd+o+Rd7HsUfunMRlQEzDpYQa
 /hbgYLE9FHo3ImSOy1YdZhPoqS5CNuxiPZbSXwPokiidMIIYtARn399TV1MnJc9mS9
 bI0g1oIfIvdog==
Date: Tue, 6 Feb 2024 14:55:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20240206-retail-thicket-75e6e0b1fe45@spud>
References: <20240206-lvds-v4-0-98d5f9af399d@foss.st.com>
 <20240206-lvds-v4-1-98d5f9af399d@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240206-lvds-v4-1-98d5f9af399d@foss.st.com>
Cc: dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/3] dt-bindings: display: add STM32
	LVDS device
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
Content-Type: multipart/mixed; boundary="===============4349210481542967586=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4349210481542967586==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O7hGylNQGhupJghO"
Content-Disposition: inline


--O7hGylNQGhupJghO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 12:33:16PM +0100, Raphael Gallais-Pou wrote:
> Add "st,stm32mp25-lvds" compatible.
>=20
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--O7hGylNQGhupJghO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcJIUAAKCRB4tDGHoIJi
0ioEAQDsRUQ93I+XdwHLaxkV5SJzSoKt5JQzOfsQK+/3zHdkVAD+LY7mLq3aUNP+
xrS2FVr3QwhqlMobEa8ll1JafDbFTAI=
=OGHJ
-----END PGP SIGNATURE-----

--O7hGylNQGhupJghO--

--===============4349210481542967586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4349210481542967586==--
