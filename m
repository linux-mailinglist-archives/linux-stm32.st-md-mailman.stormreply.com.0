Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F21168EE0
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Feb 2020 13:35:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4801C36B0B;
	Sat, 22 Feb 2020 12:34:59 +0000 (UTC)
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42F97C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2020 12:34:58 +0000 (UTC)
Received: from localhost (p5486C6B7.dip0.t-ipconnect.de [84.134.198.183])
 by pokefinder.org (Postfix) with ESMTPSA id F30102C07F9;
 Sat, 22 Feb 2020 13:34:57 +0100 (CET)
Date: Sat, 22 Feb 2020 13:34:57 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Alain Volmat <alain.volmat@st.com>
Message-ID: <20200222123457.GG1716@kunai>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
 <1579795970-22319-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
In-Reply-To: <1579795970-22319-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] i2c: i2c-stm32f7: disable/restore
 Fast Mode Plus bits in low power modes
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
Content-Type: multipart/mixed; boundary="===============2019455156912522680=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2019455156912522680==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IuhbYIxU28t+Kd57"
Content-Disposition: inline


--IuhbYIxU28t+Kd57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

thanks for the patch. A few comments:

> @@ -303,6 +303,8 @@ struct stm32f7_i2c_msg {
>   * @dma: dma data
>   * @use_dma: boolean to know if dma is used in the current transfer
>   * @regmap: holds SYSCFG phandle for Fast Mode Plus bits
> + * @regmap_reg: register address for setting Fast Mode Plus bits
> + * @regmap_mask: mask for Fast Mode Plus bits in set register
>   * @wakeup_src: boolean to know if the device is a wakeup source
>   */
>  struct stm32f7_i2c_dev {
> @@ -326,6 +328,8 @@ struct stm32f7_i2c_dev {
>  	struct stm32_i2c_dma *dma;
>  	bool use_dma;
>  	struct regmap *regmap;
> +	u32 regmap_reg;
> +	u32 regmap_mask;

Is this really a descriptive naming? From looking at the code,
'syscfg_reg' or 'fmp_reg' sound more suitable to me?

> +{
> +	if (i2c_dev->speed !=3D STM32_I2C_SPEED_FAST_PLUS ||
> +	    IS_ERR_OR_NULL(i2c_dev->regmap)) {
> +		/* Optional */
> +		return 0;
> +	}

No brackets needed here.


> -	ret =3D of_property_read_u32_index(np, "st,syscfg-fmp", 2, &mask);
> +	ret =3D of_property_read_u32_index(np, "st,syscfg-fmp", 2,
> +					 &i2c_dev->regmap_mask);
>  	if (ret)
>  		return ret;
> =20
> -	return regmap_update_bits(i2c_dev->regmap, reg, mask, mask);
> +	return 0;

Can be shortened now to
	return of_property_read_u32_index(...);

> +		ret =3D stm32f7_i2c_write_fm_plus_bits(i2c_dev, 1);

The type of the last parameter is bool, so using 'true/false' instead of
'1/0' is a tad more readable, I think.

Regards,

   Wolfram


--IuhbYIxU28t+Kd57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5RH/EACgkQFA3kzBSg
KbavNg/9GAfGIB4N92n2trj9XDA9COdUjFm1R4Ll9GV1q55OEyFvjsYjVYJ7HNaV
oRJWmf+gP9YqJ3UAkTLLSSxtL5fzy6qZA7AK8is3x4ujhLJSUgUladxMDj2iYdeu
jkcCBpz7qVEJuHmfUb+E+7jtTLDhYPiaWMuYcZxu56lOCRfyS9eQNXUXneYkRxZf
S3WC9j9/6ePMl/GzT5bR9xDdEsyfH34NgPuDKS4Q/ctEJIvprOKZ3rx8ydOiK5Xt
kTTvH27KzoAmUpB7uvMCiedvHDqe2n3iApM1J5A4b9InH+2bLq0TbzDNFHYxDGZL
BH6HGMKyMBSRejbY52ZKD8ppwgE5QSl1/S12801F1HDNV37gjkh+1j163+x8Km0w
yb/erg1hXCvgE8z6KT7ulFDp6PCvhbaMG7c1mQFfut5Uc+ZRNSVqkEMgoxhCV39/
U8IfeO9dd6Sa3oPgCH7MH5SXw4887sSgj+6n4Ft1UX2rIC1UPyx2l0mPo0Y458ZT
0zEAGlOoStKH9JlcHzZFRppTBQXgg64DG7DzdBNFR/+ZVlp6jKHosOn3cpCvtIVG
VwlK16wVO0I7Iy4Jffm+VTlycexDet7pNK+GeD3VCQEk65/gJSh5Tq5tnEfTY8/g
DFM/GdKlFVSM/CN9PZKD/tTpTlNh2k5MSmmrjLY8A+vnpERPKpU=
=KSsS
-----END PGP SIGNATURE-----

--IuhbYIxU28t+Kd57--

--===============2019455156912522680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2019455156912522680==--
