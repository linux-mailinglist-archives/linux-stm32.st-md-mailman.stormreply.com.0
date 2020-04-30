Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB6A1C02A1
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Apr 2020 18:35:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0A9EC36B0E;
	Thu, 30 Apr 2020 16:35:04 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C9A9C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 16:35:04 +0000 (UTC)
Received: from localhost (p5486CDDB.dip0.t-ipconnect.de [84.134.205.219])
 by pokefinder.org (Postfix) with ESMTPSA id A47D92C08FC;
 Thu, 30 Apr 2020 18:35:03 +0200 (CEST)
Date: Thu, 30 Apr 2020 18:35:03 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <20200430163503.GA15047@ninjato>
References: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1588261401-11914-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: fix missing pm_runtime_put_sync in
	i2c_device_probe
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
Content-Type: multipart/mixed; boundary="===============8835976049841763220=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8835976049841763220==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 05:43:21PM +0200, Alain Volmat wrote:
> In case of the I2C client exposes the flag I2C_CLIENT_HOST_NOTIFY,
> pm_runtime_get_sync is called in order to always keep active the
> adapter. However later on, pm_runtime_put_sync is never called
> within the function in case of an error. This commit add this
> error handling.
>=20
> Fixes: 72bfcee11cf8 ("i2c: Prevent runtime suspend of adapter when Host N=
otify is required")

Adding the patch author to CC.

> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/i2c-core-base.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 139aea351ffb..2e4560671183 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -338,8 +338,10 @@ static int i2c_device_probe(struct device *dev)
>  		} else if (ACPI_COMPANION(dev)) {
>  			irq =3D i2c_acpi_get_irq(client);
>  		}
> -		if (irq =3D=3D -EPROBE_DEFER)
> -			return irq;
> +		if (irq =3D=3D -EPROBE_DEFER) {
> +			status =3D irq;
> +			goto put_sync_adapter;
> +		}
> =20
>  		if (irq < 0)
>  			irq =3D 0;
> @@ -353,15 +355,19 @@ static int i2c_device_probe(struct device *dev)
>  	 */
>  	if (!driver->id_table &&
>  	    !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
> -	    !i2c_of_match_device(dev->driver->of_match_table, client))
> -		return -ENODEV;
> +	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
> +		status =3D -ENODEV;
> +		goto put_sync_adapter;
> +	}
> =20
>  	if (client->flags & I2C_CLIENT_WAKE) {
>  		int wakeirq;
> =20
>  		wakeirq =3D of_irq_get_byname(dev->of_node, "wakeup");
> -		if (wakeirq =3D=3D -EPROBE_DEFER)
> -			return wakeirq;
> +		if (wakeirq =3D=3D -EPROBE_DEFER) {
> +			status =3D wakeirq;
> +			goto put_sync_adapter;
> +		}
> =20
>  		device_init_wakeup(&client->dev, true);
> =20
> @@ -408,6 +414,10 @@ static int i2c_device_probe(struct device *dev)
>  err_clear_wakeup_irq:
>  	dev_pm_clear_wake_irq(&client->dev);
>  	device_init_wakeup(&client->dev, false);
> +put_sync_adapter:
> +	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
> +		pm_runtime_put_sync(&client->adapter->dev);
> +
>  	return status;
>  }
> =20
> --=20
> 2.17.1
>=20

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q/jMACgkQFA3kzBSg
KbbwFBAAhtQzzNeB/GCaKLSF1bZD7pXmWBQHwK11H0kJO7UkmEVuRuLNCn250MMa
AOmgf8Y27Ij/cb5xcnLfWYpf/c8EKB68QnOawPIpu7P2loT3VwEOcbn3to8yi0WU
42ZJmWshB26DyiqaH6IWbqRNVL5t6qhPtnIbOU84pO5FExppXlB63kShSUKO2gXi
kehrRerP6h8hZFYlz0wYSVgBpL/2B4BOydkCGlK4INoGtgIVGPwcrqP557ulqXe4
kTlu3uCeo3aZFfzmoeui+SoXvBPA1PdHOT4HZRs6Pcw1FFOed95JyrVJxSSiKK35
zGBOFjDTA9ZbfROzK3YHZR525uEQkceqGJHrRSpxqrM3o02sZXO/W2j359TbEHB2
PQncp1GAXNePayRakxrd9q8MpBoFRtiRiaGPZVuF9lCof+DERo27cpnINOc4E+Te
WnW7QRxjyDguqkDdUZEdDGJ9nX6BO+Yg1OhoBQdjZ9vvnqrYMmRZZCDYNAU13ZLi
lzR3mLPoyJMIj2c251mWUaNrm0nHZrw2PAmrNwygyu4MTmaZGxECu725lRNajqeu
1SuXby3l59NU+yKTze5oOhRvsjTP55mgDRVxzTbtnmZNDkE6EgKLsSvHG3PX6wAB
YMBYlbSH6QxZ338/XA0Cvkbc4zn5vScALsa0lT6l69wtPPP6obk=
=lXSI
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

--===============8835976049841763220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8835976049841763220==--
