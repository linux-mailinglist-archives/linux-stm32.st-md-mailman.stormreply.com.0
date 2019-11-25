Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BAD109067
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2019 15:51:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3F77C36B0B;
	Mon, 25 Nov 2019 14:51:12 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28BEDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 14:51:11 +0000 (UTC)
Received: from localhost (x4e37056e.dyn.telefonica.de [78.55.5.110])
 by pokefinder.org (Postfix) with ESMTPSA id AED5E2C0456;
 Mon, 25 Nov 2019 15:51:10 +0100 (CET)
Date: Mon, 25 Nov 2019 15:51:10 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20191125145110.GB2412@kunai>
References: <1573546784-28182-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1573546784-28182-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: fix 10-bits check in
 slave free id search loop
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
Content-Type: multipart/mixed; boundary="===============0356811909767869845=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0356811909767869845==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 09:19:44AM +0100, Alain Volmat wrote:
> Fix a typo in the free slave id search loop. Instead of I2C_CLIENT_PEC,
> it should have been I2C_CLIENT_TEN. The slave id 1 can only handle 7-bit
> addresses and thus is not eligible in case of 10-bit addresses.
> As a matter of fact none of the slave id support I2C_CLIENT_PEC, overall
> check is performed at the beginning of the stm32f7_i2c_reg_slave function.
>=20
> Fixes: 60d609f30de2 ("i2c: i2c-stm32f7: Add slave support")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next (i.e. for 5.5.), thanks!


--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3b6l4ACgkQFA3kzBSg
KbbUUQ//XkHOnT0T9vDE7Y8UovQXc5YR15+7wcv4op1hXnAEnmpmlaTBwWPjHtWB
QQYri2zbtXiGGY9qrbe1l0fPNdDYJ3U2VpFbYZhpEMfjQoMgFaEykk5GTtkhlDnS
mOrQaHcQSMAznRqMUHT5LE0AnBDyflctVv85ZNgi2Ri/FXvrzq4CIMQlE6OL3VeT
Vi4cNJhPYJ2Wa0gdDBAqTiNF+mKN46aRGiIhP+ldQx2YWAwC5id1+ENaw8gQR+jk
koyxGKQppQ7aHHQvHm+0amaKULeWTG8Gh1K3h2NmwrQt6NxIIJRFKT0XE9FVZvIn
GKIrTea2r9FJrA+s3js5moVyT0cjBBXKOqWBAoLmm0ULe5y2WHXzz3J/uE2qQFBU
TAqz8irHuZquvVyvU9YVfFI+Wkoi67oRS1URjLdiAmbOgkOpQgRQzHmHvLWfveZg
k2Y9QkYfoT0fGzH7CJfBjbWrsCb19Vo7lP6JvY7+yJy7IP5J7Icrosnv5n5o4IhJ
2pobV+n1ziuZvDOAibeLBsGfXt2qjcFjkGjXeKSudsDuRSf0x0qpdH2l6zGfHKcv
WdsTM2+Eu8vXrBzhC6/Xj2IrTVcDA/7aONu7QSkPOLV2fo1nEZWfL8Ecm/lvYiXT
eKTKaGtlJIiLt7VIierHt7/xL3oDaseO7hFbGl5+h60aejhg1ys=
=SNme
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

--===============0356811909767869845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0356811909767869845==--
