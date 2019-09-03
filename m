Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D17A7234
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2019 20:05:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3126DC35E01;
	Tue,  3 Sep 2019 18:05:54 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DA9EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2019 18:05:52 +0000 (UTC)
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
 by pokefinder.org (Postfix) with ESMTPSA id 98A132C4F2F;
 Tue,  3 Sep 2019 20:05:52 +0200 (CEST)
Date: Tue, 3 Sep 2019 20:05:52 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <20190903180552.GI2171@ninjato>
References: <20190815055857.1944-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190815055857.1944-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Make structure
	stm32f7_i2c_algo constant
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
Content-Type: multipart/mixed; boundary="===============1721334585349612484=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1721334585349612484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jQIvE3yXcK9X9HBh"
Content-Disposition: inline


--jQIvE3yXcK9X9HBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 11:28:57AM +0530, Nishka Dasgupta wrote:
> Static structure stm32f7_i2c_algo, of type i2c_algorithm, is used only
> when it is assigned to constant field algo of a variable having type
> i2c_adapter. As stm32f7_i2c_algo is therefore never modified, make it
> const as well to protect it from unintended modification.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Are you guys okay with this patch?

>  drivers/i2c/busses/i2c-stm32f7.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index 266d1c269b83..d36cf08461f7 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -1809,7 +1809,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *ada=
p)
>  		I2C_FUNC_SMBUS_I2C_BLOCK;
>  }
> =20
> -static struct i2c_algorithm stm32f7_i2c_algo =3D {
> +static const struct i2c_algorithm stm32f7_i2c_algo =3D {
>  	.master_xfer =3D stm32f7_i2c_xfer,
>  	.smbus_xfer =3D stm32f7_i2c_smbus_xfer,
>  	.functionality =3D stm32f7_i2c_func,
> --=20
> 2.19.1
>=20

--jQIvE3yXcK9X9HBh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uq4AACgkQFA3kzBSg
Kbb8bA/7Bzcu4H+4vy+pN5u7/6dvt9U1m+nVCt4vcisCCui7/eCm99H3yyDexyt0
XfsNaP3kRsliO6VzsxJYKLmKwuoFhmweI+nDH+fTBzVproQhzrlGjcr1N+ZF3uvp
vYMOCk84pZZ8h7eAeQIxtw8FJKLX+1EOJJcG2w7APhQ+0YoJibSkz5yVasT1arNZ
t9wOQQki7S2HLK09QRYP1urT7dIbRvkcaFM9HQMBZdcsOCSa3SdnL52YjLTbgA3K
HAIt1QpAmbHanMgBOEM+FTDWSSWuZyea4t1oGBK21mHksjLP/+cmR8dUiRVkpEcU
HuJRmRE2STSo0GE8c06fiYIhNPNHUPy7M2B5LmAvEbmj9uEjElbJuzCXmY6sh2ka
NkQypuukYn9S3EdP6+zPCVgvdB3UxnuxhxX4exQiagOa4TsrXoPv/M85wQjU6h+k
SebrMybbLsyr57zYG77zUQxQPUGopl3gAmQrXk4C0AGDgGrGZHn5rgOIi0CqkR8Y
n2bgrd5sG04fLP0XrhFUeQFjXKBVAfAStse3VzHzt0GdXZ3FIbhyqn39982sM2xk
MhLO4UCcFyc3ebtcqHIZIkM23QwO/FGhSiGmwVci8EPS174rlH7G9hMvXfuMWrgc
uFx3t0vfZmx62RXhspKEEjsxe+/pGbtGOsJsRsEi4o96NRElfDw=
=fdQf
-----END PGP SIGNATURE-----

--jQIvE3yXcK9X9HBh--

--===============1721334585349612484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1721334585349612484==--
