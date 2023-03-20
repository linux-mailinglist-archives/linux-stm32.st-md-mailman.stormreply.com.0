Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF876C10E5
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 12:37:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2557AC6A5EF;
	Mon, 20 Mar 2023 11:37:00 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8793EC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 11:36:59 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1peDmk-0005Mb-3u; Mon, 20 Mar 2023 12:34:42 +0100
Received: from pengutronix.de (unknown
 [IPv6:2a00:20:c04b:45e4:1953:f0f4:6a85:b0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 05ADB19732D;
 Mon, 20 Mar 2023 09:23:50 +0000 (UTC)
Date: Mon, 20 Mar 2023 10:23:49 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Message-ID: <20230320092349.7eqjqiblksjpw3fb@pengutronix.de>
References: <20230317233605.3967621-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tobias Waldekranz <tobias@waldekranz.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 UNGLinuxDriver@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Wolfgang Grandegger <wg@grandegger.com>,
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-can@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Jeffery <andrew@aj.id.au>,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: Drop unneeded quotes
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
Content-Type: multipart/mixed; boundary="===============4098180046616073929=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4098180046616073929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5rfbuzw7ieky3r2g"
Content-Disposition: inline


--5rfbuzw7ieky3r2g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.03.2023 18:36:03, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
[...]
>  .../devicetree/bindings/net/can/xilinx,can.yaml    |  6 +++---

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for bindings/net/can

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--5rfbuzw7ieky3r2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmQYJiIACgkQvlAcSiqK
BOhjVQf/acPAkVlZAgSx2EeDlEf8hS1lf2sRkjDcvxt3kTD2h5jAh5U3kLV5DTD4
MjEV9UTZecOll5eioSnCl1DrrqCemegxaoOeML/pQDa4hNYWmm5JHZFLOKdQbL0T
B9Jl3hxOtVzm95NTggCnKp31A7Q7ft8wfQgSN//1++W90f7Yot/HEv/oPR68ElzX
J2GyX741B6AfKBqEztJ6OYDWiB2lHw6zzIxacqqM+zn9vjVteFg2FsbKvCRAbUCV
Bxg0WyzixKLhUf2Of1QOnEW70UfVtICWJ25BjPXp9+WGomovd5nb0MbV+2lou9kk
0u595tSMCR5sWDa8jKOahMLP+4ZClA==
=xkke
-----END PGP SIGNATURE-----

--5rfbuzw7ieky3r2g--

--===============4098180046616073929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4098180046616073929==--
