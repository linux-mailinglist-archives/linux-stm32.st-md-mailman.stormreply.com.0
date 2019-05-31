Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89C57E7D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76A50C57B5E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:48 +0000 (UTC)
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDFBDC07317
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2019 09:30:53 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 3CE6F80225; Fri, 31 May 2019 11:30:43 +0200 (CEST)
Date: Fri, 31 May 2019 11:30:52 +0200
From: Pavel Machek <pavel@denx.de>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190531093052.GA23111@amd>
References: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:47 +0000
Cc: Sasha Levin <sashal@kernel.org>, Pavel Machek <pavel@denx.de>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: fix irq = 0 case
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
Content-Type: multipart/mixed; boundary="===============2847957382312156437=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2847957382312156437==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-05-31 11:18:15, Fabien Dessenne wrote:
> Manage the irq =3D 0 case, where we shall return an error.
>=20
> Fixes: b5b5a27bee58 ("media: stm32-dcmi: return appropriate error codes d=
uring probe")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

Acked-by: Pavel Machek <pavel@ucw.cz>
Reported-by: Pavel Machek <pavel@ucw.cz>

:-).
								Pavel

> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1702,7 +1702,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  	if (irq <=3D 0) {
>  		if (irq !=3D -EPROBE_DEFER)
>  			dev_err(&pdev->dev, "Could not get irq\n");
> -		return irq;
> +		return irq ? irq : -ENXIO;
>  	}
> =20
>  	dcmi->res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzw9EwACgkQMOfwapXb+vI91gCgrymhw+fLQG9ycygMMLdOh9Mv
Ao8AoKLSVLOH71CRZXNcxqg8QDUQpczh
=7mwO
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

--===============2847957382312156437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2847957382312156437==--
