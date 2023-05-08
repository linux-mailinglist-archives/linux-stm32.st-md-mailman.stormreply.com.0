Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA36FB5D7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 19:20:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA913C6A606;
	Mon,  8 May 2023 17:20:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BCB0C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 17:20:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw4W8-0003gl-9t; Mon, 08 May 2023 19:19:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw4Vw-00231L-LY; Mon, 08 May 2023 19:19:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw4Vv-002VQ3-NG; Mon, 08 May 2023 19:19:07 +0200
Date: Mon, 8 May 2023 19:19:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Peppe CAVALLARO <peppe.cavallaro@st.com>
Message-ID: <20230508171907.4pi6xztf6qfa4zwm@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
 <20230508142637.1449363-2-u.kleine-koenig@pengutronix.de>
 <PAXPR10MB5056E934F4E1D730C03D3C6985719@PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <PAXPR10MB5056E934F4E1D730C03D3C6985719@PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Simon Horman <simon.horman@corigine.com>, Eric Dumazet <edumazet@google.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/11] net: stmmac: Make
 stmmac_pltfr_remove() return void
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
Content-Type: multipart/mixed; boundary="===============0533057808161459654=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0533057808161459654==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rsjjsoecsye26qx7"
Content-Disposition: inline


--rsjjsoecsye26qx7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 08, 2023 at 02:47:36PM +0000, Peppe CAVALLARO wrote:
> Thx for this patch train, maybe I missed the cover letter. In my
> opinion the proposed change is intrusive but I can accept. It could be
> great to enhance the platform remove functions to fail in case of an
> expected case occurs.

Not sure I understand what you want. platform_remove() (i.e. the caller
of the remove callback) emits a warning if .remove() returns an value !=3D
0.

In the Linux driver model remove functions are not supposed to fail. The
most usual case for a driver unbind (aka remove) is that the device in
question disappeared (think hotplug). There is no value in failing, what
should happen if the driver fails? There is no chance to reenter
=2Eremove() as some resources might already be freed.

> +	.remove_new =3D stmmac_pltfr_remove,
>=20
> To be honest, I do not like to see: ".remove_new" as hook

=2Eremove_new() is not here to say. Once all drivers are converted,
=2Eremove() is changed to get the same semantics as .remove_new() has now
and then after all drivers are converted back to .remove() .remove_new()
will be dropped. See 5c5a7680e67ba6fbbb5f4d79fa41485450c1985c for some
more details.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rsjjsoecsye26qx7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRZLwoACgkQj4D7WH0S
/k5oqAgAtZbDz/JeywtQRweJp39ep72ljsut8JZVkM24C3EP+ndMdqeXr30Dv4uo
vo9g8mcVmtlq7WYyBRaOL6ldTe+RFapVrMZmG6bkkaVk/ahEPiL1SZXFfDWcIglC
A93oYYeoykVQYWi9CGMED6w7bOBy0NDQmSpd5VSI9YKEQKbcqs9I4agXs9quOSKi
IZgd0msErY4ovsypqIZqOlHlfyc8rHFcZbD2avv39x6Pffsx0tgPDNMGcjL6u0aH
ICgqBivvxKkrFvu738mc55TnrEmLb4295TpcCYUnqWOGJg9V/HchwkMPSn6gGxjs
7Lc0UrM3XiGMumkkfRWnv/QWi0wAHw==
=ZQ11
-----END PGP SIGNATURE-----

--rsjjsoecsye26qx7--

--===============0533057808161459654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0533057808161459654==--
