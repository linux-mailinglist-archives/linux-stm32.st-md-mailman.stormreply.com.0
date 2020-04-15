Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D311A9B9C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 13:01:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0145FC36B0C;
	Wed, 15 Apr 2020 11:01:47 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25CB0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 11:01:46 +0000 (UTC)
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
 by pokefinder.org (Postfix) with ESMTPSA id DB0512C1FF1;
 Wed, 15 Apr 2020 13:01:45 +0200 (CEST)
Date: Wed, 15 Apr 2020 13:01:45 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200415110145.GN1141@ninjato>
References: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1584642136-15418-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32: don't print an error on probe
	deferral
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
Content-Type: multipart/mixed; boundary="===============4779938125799732668=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4779938125799732668==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggdAeHltlv4tpqCr"
Content-Disposition: inline


--ggdAeHltlv4tpqCr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>  	if (IS_ERR(dma->chan_tx)) {
> -		dev_dbg(dev, "can't request DMA tx channel\n");
>  		ret =3D PTR_ERR(dma->chan_tx);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_dbg(dev, "can't request DMA tx channel\n");

dev_dbg for tx...

>  		goto fail_al;
>  	}
> =20
> @@ -44,8 +45,10 @@ struct stm32_i2c_dma *stm32_i2c_dma_request(struct dev=
ice *dev,
>  	/* Request and configure I2C RX dma channel */
>  	dma->chan_rx =3D dma_request_chan(dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
> -		dev_err(dev, "can't request DMA rx channel\n");
>  		ret =3D PTR_ERR(dma->chan_rx);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(dev, "can't request DMA rx channel\n");

=2E.. and dev_err for rx? Intentional?


--ggdAeHltlv4tpqCr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W6ZkACgkQFA3kzBSg
KbaJ5g//Z4m5gD84GPP6vg6sSjL/LyJ6CZd/w08+hP95Uk1K82LELeWPmlaK1ibg
vSJRO8GeZLYFOYY8LgLc7rzQkHpkvB9xN2TW1wzZlAycvsjBvQtg5Ka1hHfASRuW
vR90ZA8G9eV5x8mpjEzNLEshHh4vkQlQjzgoO80v/r9ssHKHLDCwn0LAVr0hUEtR
ewHUTG8UwBsUguxGbnOwmiSdICGw/F46P2i+9LHLgp/2r6QYnjA7f31dWZ8hTOsR
HExpW9MoEmA9Kz4WeiNrSof/YXKh8I2z1ONzyeRDk+0IuBpHdF9MmY/Lb3wuQB2t
k9Vx4MF+2uBYS8R/Tv2ivxjxFmh74Zo2tCMXAj1P/AXhXlMtABXTCWNnmREyz4pe
lgskBVxJtwgybB+2r9RjWBE1uysnlG6GEJe82JP+yhPZfA8huDIGSG63+t5KVE5Y
LpcWFfEtXiPio2dvsOYCif4kHaCM0eARpY+83NwAokleUbIsovR2jDvvX3IJMtRt
SZWbMsW99eClAhSfLpxxA24OpgJoXRyhrhKqLPPil9/NucxWNgU1SbRqdmaA4LK2
inY4gaMa7Nixi1+4efMZYKl+Jqm6z2ayVhjZqONCu57lpoHFx9/wzQtLoOihyBT/
kObtfYnDh30/N8/6Btj9vpb5pA3NBMLuOKacj9sKZXdA5ipEGNQ=
=mwAo
-----END PGP SIGNATURE-----

--ggdAeHltlv4tpqCr--

--===============4779938125799732668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4779938125799732668==--
