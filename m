Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F7806A10
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 09:49:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45832C6C841;
	Wed,  6 Dec 2023 08:49:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0029C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 08:49:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAnaR-0008Hv-Nf; Wed, 06 Dec 2023 09:48:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAnaP-00Dv9l-Vn; Wed, 06 Dec 2023 09:48:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAnaP-00FLpK-MD; Wed, 06 Dec 2023 09:48:53 +0100
Date: Wed, 6 Dec 2023 09:48:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <20231206084853.q4dfbp5twpe235se@pengutronix.de>
References: <20231206083142.1476340-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231206083142.1476340-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, kernel@dh-electronics.com,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp15x: Consolidate
 usbh_[eo]hci phy properties
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
Content-Type: multipart/mixed; boundary="===============3425998521303139431=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3425998521303139431==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vjysfoxx6gqhdnxk"
Content-Disposition: inline


--vjysfoxx6gqhdnxk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Dec 06, 2023 at 09:31:43AM +0100, Uwe Kleine-K=F6nig wrote:
> diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dt=
s/st/stm32mp15xx-dkx.dtsi
> index 511113f2e399..704c0d0cfe5f 100644
> --- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
> @@ -680,8 +680,6 @@ &usart3 {
>  };
> =20
>  &usbh_ehci {
> -	phys =3D <&usbphyc_port0>;
> -	status =3D "okay";

the status property must be kept. I will wait a bit for further review
and then resend (unless this patch is picked up with this issue fixed
up).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vjysfoxx6gqhdnxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVwNXQACgkQj4D7WH0S
/k5LAwf/R63YIxQTUMQX36387ftQFvDu9pWrekfpEgkzt332+TG1cDswi9gemhoI
mtPdZV/rj+5cZtBz/lLauP1gCRVe1Zln/8vC2fG9kn6fSlQ4q2/MmZquYqXmBEYl
Yt8jQKwr8txr88BjFhxMyKL5MqGlIXZmJQD+RqBTmMuAyc/FvFjQo0pPCJSA+aK0
nI3w7N35WVlZ3xnFBjslGXPUk8Zlz1Ku0ZcYJBF/dlTO0nI/tJ6rbNGshhpz1xdU
zFnz/WhwwZdLUdSxR7OSgGy8cKG1NFkskknCIqKuorV3gCjAnLvKmimqco8DOQpB
lAITDmbEe/aNUpQXFp7iUm/nc/xt6A==
=k9ak
-----END PGP SIGNATURE-----

--vjysfoxx6gqhdnxk--

--===============3425998521303139431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3425998521303139431==--
