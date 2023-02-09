Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6C0690197
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 08:52:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D20BC6A5EA;
	Thu,  9 Feb 2023 07:52:08 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6E40C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 07:52:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQ1ie-0005N9-MB; Thu, 09 Feb 2023 08:51:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQ1ia-003gys-PY; Thu, 09 Feb 2023 08:51:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pQ1ia-00240p-Vh; Thu, 09 Feb 2023 08:51:44 +0100
Date: Thu, 9 Feb 2023 08:51:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230209075144.cuw3xsxa6qgbttgq@pengutronix.de>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230127164040.1047583-6-gatien.chevallier@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 davem@davemloft.net, jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 5/6] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP15x boards
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
Content-Type: multipart/mixed; boundary="===============4676489891958822679=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4676489891958822679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rrndckfqklirsafz"
Content-Disposition: inline


--rrndckfqklirsafz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jan 27, 2023 at 05:40:39PM +0100, Gatien Chevallier wrote:
> The STM32 System Bus is an internal bus on which devices are connected.
> ETZPC is a peripheral overseeing the firewall bus that configures
> and control access to the peripherals connected on it.
>=20
> For more information on which peripheral is securable, please read
> the STM32MP15 reference manual.

it might be naive, but I somehow expected that when showing at the
resulting commit with git show -b that the patch gets quite small.

Is it really intended that &etzpc (which has reg =3D <0x5c007000 0x400>;)
is the parent bus of the devices with feature-domains =3D <&etzpc XX>; even
though their addresses are out of &etzpc's range? Doesn't a bus usually
have a ranges property and a base address that matches its contained
devices?

Looking at imx6qdl.dtsi there is:

	aips1: bus@2000000 { /* AIPS1 */
		...
		reg =3D <0x02000000 0x100000>;
		ranges;

		spba-bus@2000000 {
			...
			reg =3D <0x02000000 0x40000>;
			...
		};

		...

		sdma: dma-controller@20ec000 {
			...
			reg =3D <0x020ec000 0x4000>;
			...
		};
	};

and the registers configuring the aips1 bus are (I think) in

                        aipstz@207c000 { /* AIPSTZ1 */
                                reg =3D <0x0207c000 0x4000>;
                        };

Maybe this change could be made less intrusive by using a similar setup
here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rrndckfqklirsafz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPkpg0ACgkQwfwUeK3K
7AksRQf9F2+KOgguGN2yi9XyRsBKfGbuiPgheWhbrhFSDynHAiY9Vv7o2H4D4McR
pltFJO2P6dZafbgaKfqXJfojGBSHGhddpq//TudL3GZJ5SCmvPH6Hwpj+KObv8fl
vr3Yr2Z6m1sM5BR8Wx+m2Ev6K3OiZ49XhPZTwS+T1Jw6FH0Qm1DI638WfGa82www
XPFPQ68rp5Bh+oubZp+j4V/wFfOP9w7ABboCF3mAu7Gll5s/u+4GX0E9oUOKfn+3
94L3SE5TRfyJhOWLT4Ey1lQjHMfBKq63QJNgEzxbDO6Qc7lh632SfVzMkJvYlw7N
AprqHfYbaB04DMpwuVGIzEGqeIhJ5Q==
=Fi/Q
-----END PGP SIGNATURE-----

--rrndckfqklirsafz--

--===============4676489891958822679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4676489891958822679==--
