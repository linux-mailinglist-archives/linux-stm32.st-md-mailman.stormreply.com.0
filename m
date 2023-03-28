Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C46CB9C2
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 10:47:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8025EC6A5EF;
	Tue, 28 Mar 2023 08:47:37 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FC70C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 08:47:36 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1ph4z7-00020w-1P; Tue, 28 Mar 2023 10:47:17 +0200
Received: from pengutronix.de (unknown
 [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id EB51019E085;
 Tue, 28 Mar 2023 08:47:11 +0000 (UTC)
Date: Tue, 28 Mar 2023 10:47:10 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230328084710.jnrwvydewx3atxti@pengutronix.de>
References: <20230328073328.3949796-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20230328073328.3949796-1-dario.binacchi@amarulasolutions.com>
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
Content-Type: multipart/mixed; boundary="===============8153323449732462613=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8153323449732462613==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jrabto3ooziwdlnq"
Content-Disposition: inline


--jrabto3ooziwdlnq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28.03.2023 09:33:23, Dario Binacchi wrote:
> The series adds support for the basic extended CAN controller (bxCAN)
> found in many low- to middle-end STM32 SoCs.
>=20
> The driver has been tested on the stm32f469i-discovery board with a
> kernel version 5.19.0-rc2 in loopback + silent mode:
>=20
> ip link set can0 type can bitrate 125000 loopback on listen-only on
> ip link set up can0
> candump can0 -L &
> cansend can0 300#AC.AB.AD.AE.75.49.AD.D1
>=20
> For uboot and kernel compilation, as well as for rootfs creation I used
> buildroot:
>=20
> make stm32f469_disco_sd_defconfig
> make
>=20
> but I had to patch can-utils and busybox as can-utils and iproute are
> not compiled for MMU-less microcotrollers. In the case of can-utils,
> replacing the calls to fork() with vfork(), I was able to compile the
> package with working candump and cansend applications, while in the
> case of iproute, I ran into more than one problem and finally I decided
> to extend busybox's ip link command for CAN-type devices. I'm still
> wondering if it was really necessary, but this way I was able to test
> the driver.

Applied to linux-can-next.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129  |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--jrabto3ooziwdlnq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmQiqYsACgkQvlAcSiqK
BOgCXAf+NWJnGcM64I8QZW2GZ+4p1b5BV4hNDu4ehwwXOtajDqX0icFMJ+ADogBm
1OPOaNIWM5FLmL8Psn9S2O7DIH30kTJub7X58xxQl2vw9AVvg2ufgXFsrWrNcbR0
7lrbOzY4ghA7jXXWu7bya2sZ2OPp4xvF4zJRHF1axJ9Y4mWZ5UUomyhMc2It6nNV
MImbzZWnuFBLQxbUXefUz0CgEMCdi8N1hpJ2rHkNR0LPTVIGFDLtxBkj7rsvn/nj
eG2Q6WVQEFz/BWdc2e0xMjbvH5cWfp+tDDhh8UAwjSzUFCHm9sbZsXQQ5+j1S2kh
y2zuT0AX2HJPn+sJLsz9wM8SsswTmQ==
=7WBc
-----END PGP SIGNATURE-----

--jrabto3ooziwdlnq--

--===============8153323449732462613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8153323449732462613==--
