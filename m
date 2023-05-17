Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9BC7070C2
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 20:29:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10469C6B442;
	Wed, 17 May 2023 18:29:39 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3F35C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 18:29:37 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1pzLtz-0000Pe-TX; Wed, 17 May 2023 20:29:31 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id CB9A51C7510;
 Wed, 17 May 2023 18:29:29 +0000 (UTC)
Date: Wed, 17 May 2023 20:29:29 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230517-doing-humorous-ee72fbcf740c-mkl@pengutronix.de>
References: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
 <20230427204540.3126234-6-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20230427204540.3126234-6-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] ARM: dts: stm32: add CAN support
	on stm32f746
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
Content-Type: multipart/mixed; boundary="===============7253325823321485499=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7253325823321485499==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dfmegg2limou4kpi"
Content-Disposition: inline


--dfmegg2limou4kpi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.04.2023 22:45:40, Dario Binacchi wrote:
> Add support for bxcan (Basic eXtended CAN controller) to STM32F746. The
> chip contains three CAN peripherals, CAN1 and CAN2 in dual peripheral
> configuration and CAN3 in single peripheral configuration:
> - Dual CAN peripheral configuration:
>   * CAN1: Primary bxCAN for managing the communication between a secondary
>     bxCAN and the 512-byte SRAM memory.
>   * CAN2: Secondary bxCAN with no direct access to the SRAM memory.
>   This means that the two bxCAN cells share the 512-byte SRAM memory and
>   CAN2 can't be used without enabling CAN1.
> - Single CAN peripheral configuration:
>   * CAN3: Primary bxCAN with dedicated Memory Access Controller unit and
>     512-byte SRAM memory.
>=20
>  -------------------------------------------------------------------------
> | features | CAN1              | CAN2               | CAN 3              =
 |
>  -------------------------------------------------------------------------
> | SRAM     | 512-byte shared between CAN1 & CAN2    | 512-byte           =
 |
>  -------------------------------------------------------------------------
> | Filters  | 26 filters shared between CAN1 & CAN2  | 14 filters         =
 |
>  -------------------------------------------------------------------------
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I initially upstreamed this patch as 0920ccdf41e3 ("ARM: dts: stm32: add
CAN support on stm32f746"), but it depends on "dt-bindings: mfd:
stm32f7: add binding definition for CAN3" [1], which is missing in
net/main, resulting in parsing errors in the "stm32f746.dtsi".

This patch is reverted by [2], so please upstream it via the platform
maintainers.

regards,
Marc

[1] https://lore.kernel.org/all/20230423172528.1398158-2-dario.binacchi@ama=
rulasolutions.com
[2] https://lore.kernel.org/all/20230517181950.1106697-1-mkl@pengutronix.de

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--dfmegg2limou4kpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRlHQYACgkQvlAcSiqK
BOjyEQf/aWrP70IM+PLkOxyyzdSFXZNts5KYn9gvAzbtWKcHJv25ppouGeg4aTxz
gye9TQwUmW8hfzy6geTXaLuQmefpCUvBg+yESzHFHL6jLXM2gwzkhenwdTDeSow5
JoEAOmQR9gl5W+vK8o9MtMmOsoQ574crp2UV3Xn4tBP9xDBqVUxXla4RQpTsx6Db
OJMnWAYl6mheQsIkPwfxuafXkVvu2yH1ah89dPko0oQeCZFMOpnLorKUG9SAzOEV
LUKzryIlvWpklji2KpLf1RTqrUUTEcMmPaBKEM99QhR/51yr3pLPgKHTMJwpbvJz
abfH52OdzM13H/oBWKxLuHHzseSgeg==
=O32s
-----END PGP SIGNATURE-----

--dfmegg2limou4kpi--

--===============7253325823321485499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7253325823321485499==--
