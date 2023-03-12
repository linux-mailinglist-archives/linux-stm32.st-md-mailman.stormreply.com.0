Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E76B6798
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 16:42:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E99F0C69073;
	Sun, 12 Mar 2023 15:42:24 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DB2CC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 15:42:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbNpx-0004iu-Dx; Sun, 12 Mar 2023 16:42:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbNpv-003eWq-3a; Sun, 12 Mar 2023 16:42:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbNpu-004Jch-3M; Sun, 12 Mar 2023 16:42:14 +0100
Date: Sun, 12 Mar 2023 16:42:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230312154210.ovm54x2qtcv7fp7r@pengutronix.de>
References: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
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
Content-Type: multipart/mixed; boundary="===============0787839901585850741=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0787839901585850741==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dzhk73rozkcsmxbj"
Content-Disposition: inline


--dzhk73rozkcsmxbj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Mar 12, 2023 at 02:51:19PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).  This
> also fixes !CONFIG_OF error:
>=20
>   drivers/pwm/pwm-rcar.c:252:34: error: =E2=80=98rcar_pwm_of_table=E2=80=
=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Hmm, I wonder what else is required here to trigger that warning. On
amd64 I also disabled CONFIG_MODULES as otherwise rcar_pwm_of_table is
used by

	MODULE_DEVICE_TABLE(of, rcar_pwm_of_table);

With that I have:

	uwe@taurus:~/work/kbuild/amd64$ make drivers/pwm/pwm-rcar.o=20
	  GEN     Makefile
	  CALL    /home/uwe/gsrc/linux/scripts/checksyscalls.sh
	  DESCEND objtool
	  INSTALL libsubcmd_headers
	  CC      drivers/pwm/pwm-rcar.o
	uwe@taurus:~/work/kbuild/amd64$ make drivers/pwm/pwm-rcar.i
	  GEN     Makefile
	  CALL    /home/uwe/gsrc/linux/scripts/checksyscalls.sh
	  DESCEND objtool
	  INSTALL libsubcmd_headers
	  CPP     drivers/pwm/pwm-rcar.i
	uwe@taurus:~/work/kbuild/amd64$ grep rcar_pwm_of_table drivers/pwm/pwm-rca=
r.i
	static const struct of_device_id rcar_pwm_of_table[] =3D {

=2E.. some time later ...

ah, you also need W=3D1 to get that warning because of

	# These warnings generated too much noise in a regular build.
	# Use make W=3D1 to enable them (see scripts/Makefile.extrawarn)
	KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-but-set-variable)
	KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-const-variable)

in the toplevel Makefile.

I guess that explains why there is no previous report by one of the
build bots about this issue.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dzhk73rozkcsmxbj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQN8s4ACgkQwfwUeK3K
7AmBVgf7BWzGBbyB5eY9U2UaqiiAl/c9xENIkpkw2tYuoglHWE09cMrY/hlqK09q
vcHFteBiC+YSGAU7zSFi32vQlMtsKfryHrjIviXMzpBIFoILcElV2F+YsLz9hjj7
eq1q3DWTzmpQRGSi931BW1CnCTuVg63WwxEUPXyN25CijA/jnsiiiZUIMmxqcCso
KAai0pDUEn+K2KCxU3Tl89cghJu3Ov7J5teDsbqwlmkpywi3Uc7EblFTnjI5Cb6x
6GHENVTVp2R6Tignc+6O8V8ne1DEdBkMmZp19Cf+g1bdWNWBjvYOFmcaJdYHqPTX
bfpswuOSYEJEHycPG8AcCJls5KbKpg==
=7TYH
-----END PGP SIGNATURE-----

--dzhk73rozkcsmxbj--

--===============0787839901585850741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0787839901585850741==--
