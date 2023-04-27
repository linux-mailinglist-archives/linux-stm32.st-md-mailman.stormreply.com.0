Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB166F0D9E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 23:09:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DDE6C6A5E6;
	Thu, 27 Apr 2023 21:09:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2276FC69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 21:09:22 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1ps8rO-0005ET-LI; Thu, 27 Apr 2023 23:09:02 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 0E20B1B936F;
 Thu, 27 Apr 2023 21:08:57 +0000 (UTC)
Date: Thu, 27 Apr 2023 23:08:57 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230427-retaining-deeply-fcff70098e7e-mkl@pengutronix.de>
References: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/5] can: bxcan: add support for single
 peripheral configuration
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
Content-Type: multipart/mixed; boundary="===============6150107902642583022=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6150107902642583022==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzyuuy6jlpbsjjmh"
Content-Disposition: inline


--nzyuuy6jlpbsjjmh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.04.2023 22:45:35, Dario Binacchi wrote:
>=20
> The series adds support for managing bxCAN controllers in single peripher=
al
> configuration.
> Unlike stm32f4 SOCs, where bxCAN controllers are only in dual peripheral
> configuration, stm32f7 SOCs contain three CAN peripherals, CAN1 and CAN2
> in dual peripheral configuration and CAN3 in single peripheral
> configuration:
> - Dual CAN peripheral configuration:
>  * CAN1: Primary bxCAN for managing the communication between a secondary
>    bxCAN and the 512-byte SRAM memory.
>  * CAN2: Secondary bxCAN with no direct access to the SRAM memory.
>    This means that the two bxCAN cells share the 512-byte SRAM memory and
>    CAN2 can't be used without enabling CAN1.
> - Single CAN peripheral configuration:
>  * CAN3: Primary bxCAN with dedicated Memory Access Controller unit and
>    512-byte SRAM memory.

This really looks good! Great work! Who takes the DT changes? I can take
the whole series.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--nzyuuy6jlpbsjjmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRK5GYACgkQvlAcSiqK
BOjH2gf/btmb76HmGphNPuGDwudwcjt004XQ1d8nxWuWd74zEwD/+Oz6W9hbZzox
eshaIvJODyWw6Qgj+FKc+86AZvperVx+8T+Ia5PvPY8mXt0Mbh+aFM2XVTo9qXtk
brvJPXZU/gkwFYafQeOINt2rohkeXwN+JV3s2cfj0a2b6FKUgR8a1S7DxjQdimIK
0psXmV4IKyxQq6b2O7j5r99KYDbeokkzwOrowghxt+2JK6uwI9Fea1iOziE9JPUT
A/mhaieHgpv4KhI4uJBxFoCOn+LPIMT54J8dT3CmChIdYYavdruibezAUvZjtDix
IVqNdP1EjNlpTWRvNh9cIcwt6NWXrA==
=/Q1q
-----END PGP SIGNATURE-----

--nzyuuy6jlpbsjjmh--

--===============6150107902642583022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6150107902642583022==--
