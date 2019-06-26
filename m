Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5D56B01
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 15:45:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1804BC10C84
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2019 13:45:37 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55A24C10C82
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2019 13:45:36 +0000 (UTC)
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
 by pokefinder.org (Postfix) with ESMTPSA id 00AF52C0114;
 Wed, 26 Jun 2019 15:45:35 +0200 (CEST)
Date: Wed, 26 Jun 2019 15:45:35 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20190626134535.GN801@ninjato>
References: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1559654451-26612-1-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: i2c-stm32f7: Add
	I2C_SMBUS_I2C_BLOCK_DATA support
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
Content-Type: multipart/mixed; boundary="===============1433365546619745364=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1433365546619745364==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8MZM6zh5Bb05FW+3"
Content-Disposition: inline


--8MZM6zh5Bb05FW+3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 03:20:51PM +0200, Fabrice Gasnier wrote:
> This patch adds the support of I2C_SMBUS_I2C_BLOCK_DATA transaction type
> for the stm32f7 SMBUS Controller.
> Use emulated I2C_SMBUS_I2C_BLOCK_DATA transactions as there is no specific
> hardware in STM32 I2C to manage this (e.g. like no need for PEC here).
> Emulated transfer will fall back calling i2c transfer method where there's
> already support for DMAs for example.
> So, use the I2C_FUNC_SMBUS_I2C_BLOCK in stm32f7_i2c_func(), and rely on
> emulated transfer by returning -EOPNOTSUPP in the smbus_xfer() routine
> for such a case.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Maintainers?

> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index 48337be..68a751e 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -953,6 +953,9 @@ static int stm32f7_i2c_smbus_xfer_msg(struct stm32f7_=
i2c_dev *i2c_dev,
>  		cr2 &=3D ~STM32F7_I2C_CR2_RD_WRN;
>  		f7_msg->read_write =3D I2C_SMBUS_READ;
>  		break;
> +	case I2C_SMBUS_I2C_BLOCK_DATA:
> +		/* Rely on emulated i2c transfer (through master_xfer) */
> +		return -EOPNOTSUPP;
>  	default:
>  		dev_err(dev, "Unsupported smbus protocol %d\n", f7_msg->size);
>  		return -EOPNOTSUPP;
> @@ -1803,7 +1806,8 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *ada=
p)
>  		I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
>  		I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
>  		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL |
> -		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC;
> +		I2C_FUNC_SMBUS_PROC_CALL | I2C_FUNC_SMBUS_PEC |
> +		I2C_FUNC_SMBUS_I2C_BLOCK;
>  }
> =20
>  static struct i2c_algorithm stm32f7_i2c_algo =3D {
> --=20
> 2.7.4
>=20

--8MZM6zh5Bb05FW+3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0Tdv8ACgkQFA3kzBSg
KbY34A/8CYpfe2MHsAqTGHO1tyGPc3Fuatefa6I/N/YHYLpWoSl3mpGia6mLK7s7
gpUm/ClB+7Sl5KKdUaQ2zbvDtBPKQHfpZ/2QAYgBIoTVpf+snQLYRv4I5EiDD9Hs
EAD+2gH3nxPCHu4q/J97lT/wq4o5IxeyzsLHxeRnnBB+Ziov+9Zoad5ug3f6jRTp
KcL9B7T1Is0CU4xlqO/m3sHiRgfzIjovv7l6UIWd4JgRCiXerqkDuaZ7kp/rin5h
4JQplk9UxamamgkjDexY/CE1Jk2ZN1NYLck574DAFO2J0CpGsYYu+ykC046A1H2i
1yPfuLWy6Ie3IHHmf0CWJOw9h0o0oxmZQkTiX8WoXwUAozrodjbHo5asLK8V+F+z
mjv8YhvXjbZRePtqpusnwtU7p4kXNhfi2skCNUPMqEQlAMgHecagto0+rDcfy6qI
icB1x3LegvBoO1wWRilTvjYAYC5/gFLSdqppZVYGF5kEEzmJ1Q/Tv+Ekb3fUbgEz
50riYWCnCoOdCs6S2XNb8/aSgHkU+6sjRNA7hCJCNNLPxcMobmUCk5V2R56GWjPW
4z30wWy4vO3eo4CtH7WDUsMDnxiNK4lxqMkiPZPXgcJRl+SDnIPsyWrQKN9CCNoq
c2br40VJ1gnvj0OX0TSKItNmxc5K4Q1iQWGiEwmA7DMumfDW9Kw=
=as2l
-----END PGP SIGNATURE-----

--8MZM6zh5Bb05FW+3--

--===============1433365546619745364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1433365546619745364==--
