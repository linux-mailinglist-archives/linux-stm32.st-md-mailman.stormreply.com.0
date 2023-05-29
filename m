Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE17714F23
	for <lists+linux-stm32@lfdr.de>; Mon, 29 May 2023 20:00:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE9BCC6A614;
	Mon, 29 May 2023 18:00:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C6A4C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 May 2023 18:00:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D88BA616E7;
 Mon, 29 May 2023 18:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAB3C433EF;
 Mon, 29 May 2023 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685383246;
 bh=vi2xctN3CK3uPsWaCuUocWHcD/LuyN1ltyEEPt3iNOY=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=YpX7Z6+GNRRHa1XHK4+nvJy/oOG9Ca4XgrTqwLjZPYo86MUn6ROeBFj9BABVJ5Dq9
 xhqtOKAdEXkCzmmZVZxLFkgthH1YI9AKA3Rfh7nl5sm0ii8+9pMIXSt5wFP4WcmHiW
 pdMTpPVetIiJZVhnlcyT3EDcVZTMKhnv4lx7iWwFh+exJigmHEBKfEswMNoxyg9hnD
 JwoetkaOGtJ6IHfzsM1MWNLJfAKdEagjv3PuDN5I+szw+zG8F/cLN0Eww6YWJIIWtZ
 lDxjMHl9TDGmAw5NoTIQe9DE0/wDMmAfPmBVhaPGeFzqsCdmBEjLG7AwyBQrljFgmt
 6pyXFbEhmmWSQ==
Date: Mon, 29 May 2023 19:00:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20230529-contrite-smoking-17248b00ae75@spud>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-2-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230529162034.20481-2-alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 01/11] dt-bindings: pinctrl: stm32:
 support for stm32mp257 and additional packages
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
Content-Type: multipart/mixed; boundary="===============7884525205998021827=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7884525205998021827==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+gGo4p1wZB1XxafT"
Content-Disposition: inline


--+gGo4p1wZB1XxafT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 06:20:24PM +0200, Alexandre Torgue wrote:
> Add support for st,stm32mp257-pinctrl and st,stm32mp257-z-pinctrl.
> Add packages AI, AK and AL (values : 0x100, 0x400 and 0x800)
>=20
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 1ab0f8dde477..2120ef71a78d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -27,6 +27,8 @@ properties:
>        - st,stm32mp135-pinctrl
>        - st,stm32mp157-pinctrl
>        - st,stm32mp157-z-pinctrl
> +      - st,stm32mp257-pinctrl
> +      - st,stm32mp257-z-pinctrl
> =20
>    '#address-cells':
>      const: 1
> @@ -56,7 +58,7 @@ properties:
>        Indicates the SOC package used.
>        More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [1, 2, 4, 8]
> +    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
> =20
>  patternProperties:
>    '^gpio@[0-9a-f]*$':
> diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bin=
dings/pinctrl/stm32-pinfunc.h
> index e6fb8ada3f4d..28ad0235086a 100644
> --- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
> @@ -37,6 +37,9 @@
>  #define STM32MP_PKG_AB	0x2
>  #define STM32MP_PKG_AC	0x4
>  #define STM32MP_PKG_AD	0x8
> +#define STM32MP_PKG_AI	0x100
> +#define STM32MP_PKG_AK	0x400
> +#define STM32MP_PKG_AL	0x800
> =20
>  #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
> =20
> --=20
> 2.17.1
>=20

--+gGo4p1wZB1XxafT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHToSAAKCRB4tDGHoIJi
0iyDAP9/JVSOQbuG+a+VQLRIv4gIrd2FEzYzb+RcrYSAtPyttQEA91RuoS1J3vTo
oGcXIU9YaSSWjOk8dr4JdUJYYLlmLQ8=
=mUUh
-----END PGP SIGNATURE-----

--+gGo4p1wZB1XxafT--

--===============7884525205998021827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7884525205998021827==--
