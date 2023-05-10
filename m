Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA96FE2ED
	for <lists+linux-stm32@lfdr.de>; Wed, 10 May 2023 19:02:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87FD7C69053;
	Wed, 10 May 2023 17:02:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0140AC6904E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 May 2023 17:02:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D682563F2F;
 Wed, 10 May 2023 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0CEC433EF;
 Wed, 10 May 2023 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683738129;
 bh=lotOX4b7zrwUZyultRVZKebXpnW0zUfr/QizPj7LoDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DA1HfDlqPzbwUs7qeCL2ZApnhrOk+VviUystpCSedzJh4elZ18Fh0eTfZtXkplioH
 1AYC6h8AawtSTXHcJjUapzPAZhS7RUHJgq8PXBkWYypS2AxGJU8QmAljnTfyZNBGTH
 wFOgSv/kze540CrHr3gz+UPlrArdjJpCGSAvhFTYAhrqJ/Fxly0H7/1/UHIFThpi9F
 6fMH88N9Dwn7/P+1sAdNsv6/+Kgdvl0Qgnw06B4+cbWt6+vydnIpPZah/EnJykhuqV
 NwiHBaC0iXqaX14GB7a6gPPxxtSugqvQ+VnzeG+w81nB6sh5bXOQQYf1sbvGVa7fOS
 W4I3tbMsE6B1g==
Date: Wed, 10 May 2023 18:02:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230510-cornball-compacter-39e57a5c1906@spud>
References: <20230510184305.v2.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
MIME-Version: 1.0
In-Reply-To: <20230510184305.v2.1.I417093ddcea282be479f10a37147d1935a9050b7@changeid>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-clk@vger.kernel.org, gabriel.fernandez@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: rcc: stm32: Sync with
 u-boot copy for STM32MP13 SoC
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
Content-Type: multipart/mixed; boundary="===============1214741661814025041=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1214741661814025041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k4ry2CHnyg+ELMZR"
Content-Disposition: inline


--k4ry2CHnyg+ELMZR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 06:51:40PM +0200, Patrick Delaunay wrote:
> Minor cosmetic change, aligned with files in U-Boot:
> - change obsolete SPDX id : GPL-2.0+ and use the same license
>   GPL-2.0-only for the 2 files
> - use correct mail address gabriel.fernandez@foss.st.com
> - remove extra space

Rob's comments on v1 were about $subject, which you've fixed, although
the second prefix is a bit odd (I assume since you're changing clock and
reset headers) and about the change in license to "or-later" for the
resets header, which you've changed too, so...
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>=20
> Changes in v2:
> - Change title "Fix STM32MP13 include file"
> - Use the same license for the 2 files GPL-2.0-only as recommended
>   to avoid check-patch issue on next
>=20
>  include/dt-bindings/clock/stm32mp13-clks.h   | 6 +++---
>  include/dt-bindings/reset/stm32mp13-resets.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bind=
ings/clock/stm32mp13-clks.h
> index 02befd25edce..0bd7b54c65ff 100644
> --- a/include/dt-bindings/clock/stm32mp13-clks.h
> +++ b/include/dt-bindings/clock/stm32mp13-clks.h
> @@ -1,7 +1,7 @@
> -/* SPDX-License-Identifier: GPL-2.0+ or BSD-3-Clause */
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */

=2E..since Gabriel does appear to be the only author of this file:

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--k4ry2CHnyg+ELMZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFvOCwAKCRB4tDGHoIJi
0nzKAP9Q3RQ8cCCJ0u7zvdfKzBAtWVV74cClqrvrHvOX/dPoCgEA8ZSZ26rKzZ58
mifcHLYL8KXB19Ms7tHVYatW5g/hgQw=
=E1Wj
-----END PGP SIGNATURE-----

--k4ry2CHnyg+ELMZR--

--===============1214741661814025041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1214741661814025041==--
