Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E690754FF1
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Jul 2023 19:02:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1452C6A603;
	Sun, 16 Jul 2023 17:02:46 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8C12C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Jul 2023 17:02:44 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1qL58u-0006CV-5l; Sun, 16 Jul 2023 19:02:44 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 1B66C1F1E34;
 Sun, 16 Jul 2023 17:02:35 +0000 (UTC)
Date: Sun, 16 Jul 2023 19:02:33 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230716-stout-grudging-1f91d771de85-mkl@pengutronix.de>
References: <20230714174809.4060885-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-omap@vger.kernel.org, Alex Elder <elder@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Douglas Miller <dougmill@linux.ibm.com>, Daniel Golle <daniel@makrotopia.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>, linux-wpan@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouille r <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chris Snook <chris.snook@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>, wcn36xx@lists.infradead.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-can@vger.kernel.org,
 Cla udiu Manoil <claudiu.manoil@nxp.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Mirko Lindner <mlindner@marvell.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, UNGLinuxDriver@microchip.com,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Tara s Chornyi <taras.chornyi@plvision.eu>, linux-wireless@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Andreas Larsson <andreas@gaisler.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-tegra@vger.kernel.org,
 ath10k@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Shenwei Wang <shenwei.wang@nxp.com>,
 Samin Guo <samin.guo@starfivetech.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 ath11k@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, John Crispin <john@phrozen.org>,
 Salil Mehta <salil.mehta@huawei.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Timur Tabi <timur@kernel.org>,
 =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 linux-sunxi@lists.linux.dev, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Alexander Aring <alex.aring@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 George McCollister <george.mccollister@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Keyur Chudgar <keyur@os.amperecomputing.com>,
 DENG Qingfang <dqfext@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Stephen Hemminger <stephen@networkplumber.org>, Vinod Ko ul <vkoul@kernel.org>,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 linuxppc-dev@lists.ozlabs.org, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH] net: Explicitly include correct DT
	includes
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
Content-Type: multipart/mixed; boundary="===============7959968105186833539=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7959968105186833539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5fw27woy7qbit6d"
Content-Disposition: inline


--g5fw27woy7qbit6d
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vxeub4efr4nku2wd"
Content-Disposition: inline


--vxeub4efr4nku2wd
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2mmyiduer253ii4f"
Content-Disposition: inline


--2mmyiduer253ii4f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14.07.2023 11:48:00, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/net/can/bxcan.c                                 | 1 -
>  drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
>  drivers/net/can/m_can/m_can.c                           | 1 -
>  drivers/net/can/m_can/m_can.h                           | 1 -
>  drivers/net/can/rcar/rcar_canfd.c                       | 1 -
>  drivers/net/can/sja1000/sja1000_platform.c              | 1 -
>  drivers/net/can/sun4i_can.c                             | 1 -
>  drivers/net/can/ti_hecc.c                               | 1 -

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for drivers/net/can

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--2mmyiduer253ii4f--

--vxeub4efr4nku2wd--

--g5fw27woy7qbit6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmS0IqYACgkQvlAcSiqK
BOhfLQgAnOPxJiYWHd0YYYBr6D5Xvaa7YD/llBx5YeP2Eol6zKlE5NW1xdwBoHP/
oxs3PENqI/mVuAtWhs6sNCSEtOEssWtUWrx23I9bxRa2AE/DUWfpg/NP/sy3ZVsV
sYgzGHOJqf+S+OMzalvZ9hIDu+a6xxhA9rUTaK2lNn0nBeWxEf92JhPV+nGREldR
CHY3WW/trL1qHxxtn7ZWhI2IVounTWpkXZnJz9DRocIQrm1mPmNz5lcwkr+ST1th
C92e2GJEahuxXdOMXfuuGMUSGzFqGZRtKT3WAx9/8l/lUsyKZ9Jhn1Rv7NE9zNPG
R640Tfvr5cFRQIVusYrKVMlQ8URlUg==
=ICgU
-----END PGP SIGNATURE-----

--g5fw27woy7qbit6d--

--===============7959968105186833539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7959968105186833539==--
