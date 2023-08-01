Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40B76A949
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Aug 2023 08:38:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 755B6C6B45A;
	Tue,  1 Aug 2023 06:38:53 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49C3BC6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 06:38:52 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qQj0d-00070v-4I; Tue, 01 Aug 2023 08:37:31 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 76E8C20035C;
 Tue,  1 Aug 2023 06:37:21 +0000 (UTC)
Date: Tue, 1 Aug 2023 08:37:21 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20230801-portside-prepaid-513f1f39f245-mkl@pengutronix.de>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-2-shenwei.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20230731161929.2341584-2-shenwei.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: imx@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
 Eric Dumazet <edumazet@google.com>, linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Wong Vee Khee <veekhee@apple.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 net 1/2] net: stmmac: add new mode
 parameter for fix_mac_speed
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
Content-Type: multipart/mixed; boundary="===============2059707017453988417=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2059707017453988417==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bosuzfm7oov47gw7"
Content-Disposition: inline


--bosuzfm7oov47gw7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31.07.2023 11:19:28, Shenwei Wang wrote:
> A mode parameter has been added to the callback function of fix_mac_speed
> to indicate the physical layer type.
>=20
> The mode can be one the following:
> 	MLO_AN_PHY	- Conventional PHY
> 	MLO_AN_FIXED	- Fixed-link mode
> 	MLO_AN_INBAND	- In-band protocol
>=20
> Also use short version of 'uint' to replace the 'unsigned int' in the
> function definitions.

There are not many users of 'uint' in the kernel and it's not used in
the stmmac driver so far. From my point of view I would not introduce
it and stick to the standard 'unsigned int'.

Just my 2 cent,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--bosuzfm7oov47gw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTIqBwACgkQvlAcSiqK
BOi7Jgf/UaTFYSC4IuXT7k8VsP0wkBG1kcRP+yNZbLdHhdJNmRn2K0iTpv82c/8q
ZYpLreaQqEKOb7TszFXyDCSS1Mssv66nj047Dc6LHrnW2VbY7P9LSCMsnSUaoh0a
lkOknimCFo9HKbYqND+gh1y/o6Wz5PO36qbaBR1giHbUdB9+Ow0AlTR3V9KeMOb4
OsXSR2ihf5LYXebKvn8StZSwICnzZ78eLFZJsxu0oEMJDnaxIM5VQb9MaCfPbZv8
/Bco4yUWkcOqrMmHnL9TSVvgaNJLzxowhcbwA9rucxpS314AJAqil34OSnmnQeGW
1+lihD2B9mQqxq0drsTeFh5UBcLxNA==
=DXrv
-----END PGP SIGNATURE-----

--bosuzfm7oov47gw7--

--===============2059707017453988417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2059707017453988417==--
