Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D0ABF92C
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 17:26:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4AB5C7A826;
	Wed, 21 May 2025 15:26:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5163EC7A825
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 15:26:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7E94C5C5BC3;
 Wed, 21 May 2025 15:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A09C4CEE4;
 Wed, 21 May 2025 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747841162;
 bh=MDKD9lGxNck7Ne+uaSDs1WAO4Wl3ZxiYCJEk3xlWYQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=auaZZXT2l+8GZIC3AVHmxcjl3G5L1QU1tF1rtJddcr3k9zk+gLZ3cWQZj5r0CsoMM
 5XjsDeAruOgf8HOM39k3Js/2MTXoag2DC7QRlBXns0wht6SverBWuDxTQQRxg6iCWx
 OHmdPkPhWg/5ik1rUC9kR6vZzfMD0CJ5aV9+1JNNHFE8FqmBufF/I1rL4iTtrZr14h
 E7jOM1LoGi9VvH5QMA+Cp9UoiWpE9jvTRXoUQ2G/9XjaVtk1saH1Q9BikwRvmFWQ9v
 mve1aET3ZhOq+JhKSOkp177mxeQDegQ7GAJf4pGQwzwisC044XScvPLJX1KOCnCpjS
 rZuHwpVW+zCUQ==
Date: Wed, 21 May 2025 16:25:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Message-ID: <20250521-quantum-flashily-611a7d5f4f06@spud>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-1-cac9d8f63d20@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250521-upstream_rcc_mp21-v3-1-cac9d8f63d20@foss.st.com>
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/3] dt-bindings: stm32: add STM32MP21
 clocks and reset bindings
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
Content-Type: multipart/mixed; boundary="===============7774590949030278712=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7774590949030278712==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DDoC0JY4QW9yHonk"
Content-Disposition: inline


--DDoC0JY4QW9yHonk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 02:38:49PM +0200, Gabriel Fernandez wrote:
> Adds clock and reset binding entries for STM32MP21 SoC family.
>=20
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp21-rcc.yaml           | 199 ++++++++++
>  include/dt-bindings/clock/st,stm32mp21-rcc.h       | 426 +++++++++++++++=
++++++
>  include/dt-bindings/reset/st,stm32mp21-rcc.h       | 138 +++++++
>  3 files changed, 763 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yam=
l b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d41f0b963aceee534acea77bc=
9d276fd0c9b1548
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp21-rcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP21 Reset Clock Controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The RCC hardware block is both a reset and a clock controller.
> +  RCC makes also power management (resume/suspend).
> +
> +  See also::

I believe you missing some comments from Rob about removing the :: from
here, and from the source you copied it from (if one exists).

Otherwise,

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +    include/dt-bindings/clock/st,stm32mp21-rcc.h
> +    include/dt-bindings/reset/st,stm32mp21-rcc.h

--DDoC0JY4QW9yHonk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3whQAKCRB4tDGHoIJi
0gw7AQDclF/KssvPyuRlJxORbowXvNW9eQ2qNLO+ANWJeMmAqgEA0ulde5mpAGbH
AZx6s03+erRmI/Hkhg+AZke5WIMQmQ0=
=YaFH
-----END PGP SIGNATURE-----

--DDoC0JY4QW9yHonk--

--===============7774590949030278712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7774590949030278712==--
