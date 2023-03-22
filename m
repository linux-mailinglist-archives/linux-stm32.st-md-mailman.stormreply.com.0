Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B86C584C
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 21:59:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A890C6A602;
	Wed, 22 Mar 2023 20:59:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CD6FC65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 20:59:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf5YW-0005rt-9F; Wed, 22 Mar 2023 21:59:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf5YU-005zzw-Eb; Wed, 22 Mar 2023 21:59:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pf5YT-0078Fw-PF; Wed, 22 Mar 2023 21:59:33 +0100
Date: Wed, 22 Mar 2023 21:59:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230322205933.saslubwinqm47esk@pengutronix.de>
References: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
 <20230312154210.ovm54x2qtcv7fp7r@pengutronix.de>
 <74309bed-e46c-69fc-e0c7-6d06c30fbc4f@linaro.org>
MIME-Version: 1.0
In-Reply-To: <74309bed-e46c-69fc-e0c7-6d06c30fbc4f@linaro.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] pwm: rcar: drop of_match_ptr for
	ID table
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
Content-Type: multipart/mixed; boundary="===============4925780357106890479=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4925780357106890479==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="676sr5ayrq6huzkl"
Content-Disposition: inline


--676sr5ayrq6huzkl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Wed, Mar 22, 2023 at 07:12:08PM +0100, Krzysztof Kozlowski wrote:
> On 12/03/2023 16:42, Uwe Kleine-K=C3=B6nig wrote:
> > Hello,
> >=20
> > On Sun, Mar 12, 2023 at 02:51:19PM +0100, Krzysztof Kozlowski wrote:
> >> The driver can match only via the DT table so the table should be alwa=
ys
> >> used and the of_match_ptr does not have any sense (this also allows AC=
PI
> >> matching via PRP0001, even though it might not be relevant here).  This
> >> also fixes !CONFIG_OF error:
> >>
> >>   drivers/pwm/pwm-rcar.c:252:34: error: =E2=80=98rcar_pwm_of_table=E2=
=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >=20
> > Hmm, I wonder what else is required here to trigger that warning. On
> > amd64 I also disabled CONFIG_MODULES as otherwise rcar_pwm_of_table is
> > used by
> >=20
> > 	MODULE_DEVICE_TABLE(of, rcar_pwm_of_table);
>=20
> 1. x86_64 allyesconfig, remove CONFIG_OF
> 2. Build with W=3D1 (this was GCC)

Ah right, it's not that CONFIG_MODULES must be unset, but the driver
must not be configured as module. So I suggest

	This also fixes the compiler warning

		drivers/pwm/pwm-rcar.c:252:34: error: =E2=80=98rcar_pwm_of_table=E2=80=99=
 defined but not used [-Werror=3Dunused-const-variable=3D]

	for builds with CONFIG_OF=3Dn, CONFIG_PWM_RCAR=3Dy and W=3D1.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--676sr5ayrq6huzkl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQbbDQACgkQj4D7WH0S
/k5vkwf/VfSDx0uwwyfdw08DuNrDF4Mi8n9gNP3Wdjlk+PBoIRLFRO1DpA/O4Wu0
OEocITy3TYc8o5gYSM6SjZ239My3Is0zgB2pZyXXkCD5hpP/RMEVv5k4L60wfjj8
Ay0KI8qFx8CwNTWLq/ipFUMAvoXA44z9MfsU9sGITN3rVdvMyPlMI6V5ESndSuzV
x5t+ZmkxTMoh3zZFQZjBUymmwbRHTtno8bccgJNB0fcmQA5gRiXsBcjCvJZQJg9E
E6ocyw3Jd/rtEtdc/Url44Y05hvpNNST+MRKlq+8le633fRHFl8a4osdNbPCxceF
5QtGpfDt4ihJm/SeCWwjJuJSHvKFQw==
=mK6h
-----END PGP SIGNATURE-----

--676sr5ayrq6huzkl--

--===============4925780357106890479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4925780357106890479==--
