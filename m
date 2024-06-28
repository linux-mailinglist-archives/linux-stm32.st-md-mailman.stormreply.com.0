Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6239F91BC7F
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 12:16:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AE8EC71289;
	Fri, 28 Jun 2024 10:16:35 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 707EAC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 10:16:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1sN8eH-0000jO-2V; Fri, 28 Jun 2024 12:16:09 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mkl@pengutronix.de>)
 id 1sN8eF-005a41-1j; Fri, 28 Jun 2024 12:16:07 +0200
Received: from pengutronix.de
 (p200300cb5f450e00b3b76ff7b19af51f.dip0.t-ipconnect.de
 [IPv6:2003:cb:5f45:e00:b3b7:6ff7:b19a:f51f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 37BED2F5B46;
 Fri, 28 Jun 2024 10:16:06 +0000 (UTC)
Date: Fri, 28 Jun 2024 12:16:05 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <20240628-awesome-discerning-bear-1621f9-mkl@pengutronix.de>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <Zn6HMrYG2b7epUxT@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <Zn6HMrYG2b7epUxT@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 Julien Stephan <jstephan@baylibre.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-spi@vger.kernel.org,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, T.Scherer@eckelmann.de,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Martin Sperl <kernel@martin.sperl.org>, David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/5] spi: add support for pre-cooking
	messages
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
Content-Type: multipart/mixed; boundary="===============4884033427964306899=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4884033427964306899==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5ugtvmixttbihsx"
Content-Disposition: inline


--w5ugtvmixttbihsx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 28.06.2024 11:49:38, Oleksij Rempel wrote:
> It seems to be spi_mux specific. We have seen similar trace on other syst=
em
> with spi_mux.

Here is the other backtrace from another imx8mp system with a completely
different workload. Both have in common that they use a spi_mux on the
spi-imx driver.

Unable to handle kernel NULL pointer dereference at virtual address 0000000=
000000dd0
Mem abort info:
  ESR =3D 0x0000000096000004
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x04: level 0 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
  CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
  GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000046760000
[0000000000000dd0] pgd=3D0000000000000000, p4d=3D0000000000000000
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: can_raw can ti_ads7950 industrialio_triggered_buffer kfi=
fo_buf spi_mux fsl_imx8_ddr_perf at24 flexcan caam can_dev error rtc_snvs i=
mx8mm_thermal spi_imx capture_events_irq cfg80211 iio_trig_hrtimer industri=
alio_sw_trigger ind>
CPU: 3 PID: 177 Comm: spi5 Not tainted 6.9.0 #1
Hardware name: xxxxxxxxxxxxxxxx (xxxxxxxxx) (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
pc : spi_res_release+0x24/0xb8
lr : spi_async+0xac/0x118
sp : ffff8000823fbcc0
x29: ffff8000823fbcc0 x28: 0000000000000000 x27: 0000000000000000
x26: ffff8000807bef88 x25: ffff80008115c008 x24: 0000000000000000
x23: ffff8000826c3938 x22: 0000000000000000 x21: ffff0000076a9800
x20: 0000000000000000 x19: 0000000000000dc8 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff88c0e760
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: ffff8000815a1f98 x10: ffff8000823fbb40 x9 : ffff8000807b8420
x8 : ffff800081508000 x7 : 0000000000000004 x6 : 0000000003ce4c66
x5 : 0000000001000000 x4 : 0000000000000000 x3 : 0000000001000000
x2 : 0000000000000000 x1 : ffff8000826c38e0 x0 : ffff0000076a9800
Call trace:
 spi_res_release+0x24/0xb8
 spi_async+0xac/0x118
 spi_mux_transfer_one_message+0xb8/0xf0 [spi_mux]
 __spi_pump_transfer_message+0x260/0x5d8
 __spi_pump_messages+0xdc/0x320
 spi_pump_messages+0x20/0x38
 kthread_worker_fn+0xdc/0x220
 kthread+0x118/0x128
 ret_from_fork+0x10/0x20
Code: a90153f3 a90363f7 91016037 f9403033 (f9400674)=20
---[ end trace 0000000000000000 ]---

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--w5ugtvmixttbihsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmZ+jWMACgkQKDiiPnot
vG9eTAf9Ex8vUqqElTcG0woxjhCZvA7UgAAlCJye+UQRedbmMLm9YgmvSXG8PwnT
aBJZdof3Wg8wcU4w7fpYKdyYHly22kN0MixT5zEkQSSfLH2FDB7r0kwA3pLjPo0k
j9L7II3idEFC3PURB99Lm+F5IqAyR1EKXxlBw7ETsg6IZ4wREMPmqSphtqa0Jcth
X+yub9Gkzc7Tr9tSwNorky4C9wBjEwev/Ux6Cp4wB2eartdebOrcI0yOsPZ9rnqh
7WZLpJgCOya15LDdX0Ql69179iItbmNYp8feHrmYbAHnXrwHTJ2XFgzUlQnhTA0T
O5QKJX5UYStEzNavkGkXH34aE7BLAQ==
=EDL7
-----END PGP SIGNATURE-----

--w5ugtvmixttbihsx--

--===============4884033427964306899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4884033427964306899==--
