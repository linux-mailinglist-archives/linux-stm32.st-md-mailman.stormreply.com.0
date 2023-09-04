Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCB791DB3
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 21:34:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 227F5C6B455;
	Mon,  4 Sep 2023 19:34:52 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55329C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 19:34:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id ABAC3CE0FC0;
 Mon,  4 Sep 2023 19:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58D5C433C9;
 Mon,  4 Sep 2023 19:34:45 +0000 (UTC)
Date: Mon, 4 Sep 2023 15:34:43 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZPYxUxW9xw0J5ogm@ishi>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
 <20230829134029.2402868-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20230829134029.2402868-6-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/8] counter: stm32-timer-cnt: rename
	quadrature signal
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
Content-Type: multipart/mixed; boundary="===============0475819267726327411=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0475819267726327411==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NMsfRSzMtjBFjRBJ"
Content-Disposition: inline


--NMsfRSzMtjBFjRBJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 03:40:26PM +0200, Fabrice Gasnier wrote:
> Rename "Channel 1 Quadrature B", as it corresponds to timer input ch2.
> I suspect it referred to the (unique) counter earlier, but the physical
> input really is CH2.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 6206d2dc3d47..eae851f6db2c 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -283,7 +283,7 @@ static struct counter_signal stm32_signals[] =3D {
>  	},
>  	{
>  		.id =3D 1,
> -		.name =3D "Channel 1 Quadrature B"
> +		.name =3D "Channel 2 Quadrature B"
>  	}
>  };
> =20
> --=20
> 2.25.1
>=20

If these signals are going to be named after their channels, then I
prefer we just remove the "Quadrature A" and "Quadrature B" conventions
and leave the signals named "Channel 1" and "Channel 2" respectively.

William Breathitt Gray

--NMsfRSzMtjBFjRBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZPYxUwAKCRC1SFbKvhIj
KwlZAQC5qqbW6yuzMVoOIa81HPFtxG55puiquwVLPEVVevubkgD/WDPQp5tCGI/7
SRz862UcpUqXwnje45wjxncgmbRXLgQ=
=+OS/
-----END PGP SIGNATURE-----

--NMsfRSzMtjBFjRBJ--

--===============0475819267726327411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0475819267726327411==--
