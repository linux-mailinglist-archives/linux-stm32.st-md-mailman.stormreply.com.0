Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A3CA0404B
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 14:04:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E41C78022;
	Tue,  7 Jan 2025 13:04:37 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00DEAC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 13:04:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1tV9FZ-0003iC-6R; Tue, 07 Jan 2025 14:04:01 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1tV9FV-007Lc1-27;
 Tue, 07 Jan 2025 14:03:58 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id E073E3A08A6;
 Tue, 07 Jan 2025 13:03:57 +0000 (UTC)
Date: Tue, 7 Jan 2025 14:03:57 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20250107-cocky-industrious-hare-c508f6-mkl@pengutronix.de>
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, Brian Norris <briannorris@chromium.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Paolo Abeni <pabeni@redhat.com>,
 Dario Binacchi <dariobin@libero.it>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 linux-can@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 linux-amlogic@lists.infradead.org,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Scott Branden <sbranden@broadcom.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next] dt-bindings: net: Correct
 indentation and style in DTS example
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
Content-Type: multipart/mixed; boundary="===============2890695497987572064=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2890695497987572064==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vdg3z53mqf4igqc"
Content-Disposition: inline


--5vdg3z53mqf4igqc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style
 in DTS example
MIME-Version: 1.0

On 07.01.2025 13:56:13, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/can/bosch,c_can.yaml         | 10 +-
>  .../bindings/net/can/microchip,mcp2510.yaml   | 18 ++--

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for net/can

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--5vdg3z53mqf4igqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmd9JjoACgkQKDiiPnot
vG9NNgf/SxxAC8UsIuL4bDVaIUg+kAj0yKfrwEWjhutunUKK24lVKylz+/UY8+zv
3+LqniAsnEwHJPxLZ5S0rCe2+qZ6gsvXSBlQSqEJukZOzpWNVYECd8Wf8Q8dQzu+
qYoaEgvr5jcwNUr+cdrPvhyn4CXuNJCsdmwpfJn98S6XLhwSX+SxgiSUAkXpRmQn
EE2nnt52Dbrrk4CILlRtPPpd0/hsAXMEWGjIUBYW2f/FJqVNv+yPwZiEsIC2iDSG
V4fs/zJxh98GK89T2fN8fRzlMTG9pMPmWaQLbMPmVkHn5eJbX7LUoQzmSBe6Kgc3
I+WqIjPZzj6L9ubrNZg4MgJ3t+T4tg==
=gbSE
-----END PGP SIGNATURE-----

--5vdg3z53mqf4igqc--

--===============2890695497987572064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2890695497987572064==--
