Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 574F76D5EF1
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Apr 2023 13:28:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1343CC6A614;
	Tue,  4 Apr 2023 11:28:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76669C6A612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Apr 2023 11:28:36 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1pjepm-00043P-Ln; Tue, 04 Apr 2023 13:28:18 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 42D791A6300;
 Tue,  4 Apr 2023 11:28:13 +0000 (UTC)
Date: Tue, 4 Apr 2023 13:28:12 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230404-postage-handprint-efdb77646082@pengutronix.de>
References: <20230328073328.3949796-1-dario.binacchi@amarulasolutions.com>
 <20230328084710.jnrwvydewx3atxti@pengutronix.de>
 <CABGWkvq0gOMw2J9GpLS=w+qg-3xhAst6KN9kvCuZnV9bSBJ3CA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABGWkvq0gOMw2J9GpLS=w+qg-3xhAst6KN9kvCuZnV9bSBJ3CA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>,
 devicetree@vger.kernel.org, linux-can@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 michael@amarulasolutions.com, netdev@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v10 0/5] can: bxcan: add support for ST
	bxCAN controller
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
Content-Type: multipart/mixed; boundary="===============2079016361509634955=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2079016361509634955==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrolgxtwhc7crda5"
Content-Disposition: inline


--vrolgxtwhc7crda5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28.03.2023 11:28:59, Dario Binacchi wrote:
> > Applied to linux-can-next.
>=20
> Just one last question: To test this series, as described in the cover
> letter, I could not use the iproute2 package since the microcontroller
> is without MMU. I then extended busybox for the ip link command. I
> actually also added the rtnl-link-can.c application to the libmnl
> library. So now I find myself with two applications that have been
> useful to me for this type of use case.
>=20
> Did I do useless work because I could use other tools?

systemd-networkd also supports CAN configuration, but I this will
probably not work on no-MMU systemd, too.

Then there is:

| https://git.pengutronix.de/cgit/tools/canutils
| https://git.pengutronix.de/cgit/tools/libsocketcan

that contains canconfig, but it lacks CAN-FD support.

> If instead the tools for this use case are missing, what do you think
> is better to do? Submit to their respective repos or add this
> functionality to another project that I haven't considered ?

Yes, go ahead and upstream your changes!

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vrolgxtwhc7crda5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmQsCckACgkQvlAcSiqK
BOiwvQf/bknW5120duEvKB4vzq6g1FE4pHri1PUIfK32NY2ZntW/rs/zYYH5KMTC
A3DRsT4CsHVSXNDvW7JNgHJIxIZ8kFQGiAIfOv/a7OOYXZocvfBMW9yxgRqDlese
N9BqaRggCBDhP829laPpXYntgW6k8lTMpWI7C6ANyis9tbKJ68Ut0d7bZ4eiYGme
+R4neMSudT1l+tzSobkBpDrXloivl9uXhme25xmFTtQeokwCaXSZ7CFDpNcTV2zw
3wq4YYs3fnoxUbIauVk4mDGyoJTB0ZzDee5Kp8+ucH1+eukInkeHk37RerOpc4Wv
Gl61KK/5ijUZNnIHiOJIS9C8Sv6kSQ==
=L7qt
-----END PGP SIGNATURE-----

--vrolgxtwhc7crda5--

--===============2079016361509634955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2079016361509634955==--
