Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD8D88DF
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2019 09:03:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B72AC36B0B;
	Wed, 16 Oct 2019 07:03:27 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8693C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 07:03:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p14so26622578wro.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2019 00:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IGofv4/Ku/88kChkBC96+cWtPXeTqXT9jPete3VOo9U=;
 b=UJ2U78bnOcl8EaGyLODuQSbvDUBNAuvXv1Fmn9uD1LkQiVl/A7ek9KcBDLcZkFrdie
 oq184dD8fZLrrI18nRhQ9Nd5V8GfwWRR06B3gOk0izZ3ZzmMGC9Qcbq2HtJFEDa24ECn
 VtsTeWUF+RY8QHzNx5ecOGMcT3orKuTWjo0sDM6eX8+LcFp/hgYfUbUgyWqc/Fb3zVBk
 IHZ7YTcOqXtBXbUQQ6ybSst9J82WegzReDYIc30PH5TmkPkV9nge4un6wigJEcahw6iN
 WRzrDVexqDA65HlCTCe4QPouzqbFQ+eRAuvwSFaoou4db0l+m4IdJ1n9jSnue+c61r1H
 PBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IGofv4/Ku/88kChkBC96+cWtPXeTqXT9jPete3VOo9U=;
 b=Pq27KVIcrkW57iAJOJqS4xgmcIipX+g5r8WzntCvtXvh5uQEnRm/1HxBj8mzm/lc8A
 4apGVUk5IARjW/v1wmtKTJMXHPRms+XP2Y0UIKk4tx9w7GLwS3Qy5yvCWjkcNaquB/77
 oMxkydGeBqhzQRViauQa4ZC6nMkE1p9IyPw4GQuqLR4iBtt1725saVZRH9HWe+K39Yd4
 82GY4h8Gg6PZ7CGt8Rtv4OyKDJi9v1RaxfRKEpJUufrlD2UY/odYTIk6zfTANNeiy8LE
 AJehEKimcjAXWfnw+o3riHlHsGxa+YNce164vlnsn2bObUboO0FVL+eEU+SZyEmONxDm
 aTrQ==
X-Gm-Message-State: APjAAAXGOmjeNgQmPPMhQDWhsgjLHONX+gC6VeSKS18vCp5p5Eigpg1F
 V0/F2IT76Xedz8gR67PFelQ=
X-Google-Smtp-Source: APXvYqw7t9eK30PIU6CMnErqccHPXcX7RhVu2WwgEF8LtBGQ4aGys5/7upH8IoAYtGMNILl1csS96Q==
X-Received: by 2002:adf:f04f:: with SMTP id t15mr1256271wro.123.1571209406350; 
 Wed, 16 Oct 2019 00:03:26 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id e15sm27177088wrs.49.2019.10.16.00.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:03:24 -0700 (PDT)
Date: Wed, 16 Oct 2019 09:03:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <20191016070322.GB1296874@ulmo>
References: <1570193633-6600-1-git-send-email-fabrice.gasnier@st.com>
 <1570193633-6600-3-git-send-email-fabrice.gasnier@st.com>
MIME-Version: 1.0
In-Reply-To: <1570193633-6600-3-git-send-email-fabrice.gasnier@st.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 u.kleine-koenig@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] pwm: stm32: split breakinput apply
 routine to ease PM support
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
Content-Type: multipart/mixed; boundary="===============7402911913554730119=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7402911913554730119==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline


--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 02:53:52PM +0200, Fabrice Gasnier wrote:
> Split breakinput routine that configures STM32 timers 'break' safety
> feature upon probe, into two routines:
> - stm32_pwm_apply_breakinputs() sets all the break inputs into registers.
> - stm32_pwm_probe_breakinputs() probes the device tree break input settin=
gs
>   before calling stm32_pwm_apply_breakinputs()
>=20
> This is a precursor patch to ease PM support. Registers content may get
> lost during low power. So, break input settings applied upon probe need
> to be restored upon resume (e.g. by calling stm32_pwm_apply_breakinputs()=
).
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  drivers/pwm/pwm-stm32.c | 48 ++++++++++++++++++++++++++++---------------=
-----
>  1 file changed, 28 insertions(+), 20 deletions(-)

Applied, thanks. I've made some minor changes, mostly for consistency
with other drivers and the PWM core. See below.

> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index 359b085..cf8658c 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -19,6 +19,12 @@
>  #define CCMR_CHANNEL_MASK  0xFF
>  #define MAX_BREAKINPUT 2
> =20
> +struct stm32_breakinput {
> +	u32 index;
> +	u32 level;
> +	u32 filter;
> +};
> +
>  struct stm32_pwm {
>  	struct pwm_chip chip;
>  	struct mutex lock; /* protect pwm config/enable */
> @@ -26,15 +32,11 @@ struct stm32_pwm {
>  	struct regmap *regmap;
>  	u32 max_arr;
>  	bool have_complementary_output;
> +	struct stm32_breakinput breakinput[MAX_BREAKINPUT];
> +	unsigned int nbreakinput;

I changed these to breakinputs and num_breakinputs since they are
slightly more consistent with the naming elsewhere in PWM.

>  	u32 capture[4] ____cacheline_aligned; /* DMA'able buffer */
>  };
> =20
> -struct stm32_breakinput {
> -	u32 index;
> -	u32 level;
> -	u32 filter;
> -};
> -
>  static inline struct stm32_pwm *to_stm32_pwm_dev(struct pwm_chip *chip)
>  {
>  	return container_of(chip, struct stm32_pwm, chip);
> @@ -512,15 +514,27 @@ static int stm32_pwm_set_breakinput(struct stm32_pw=
m *priv,
>  	return (bdtr & bke) ? 0 : -EINVAL;
>  }
> =20
> -static int stm32_pwm_apply_breakinputs(struct stm32_pwm *priv,
> +static int stm32_pwm_apply_breakinputs(struct stm32_pwm *priv)
> +{
> +	int i, ret =3D 0;

Made i unsigned int.

> +
> +	for (i =3D 0; i < priv->nbreakinput && !ret; i++) {
> +		ret =3D stm32_pwm_set_breakinput(priv,
> +					       priv->breakinput[i].index,
> +					       priv->breakinput[i].level,
> +					       priv->breakinput[i].filter);
> +	}

I thought this was a little odd, so I changed it to explicitly check the
value of ret and return on error.

> +
> +	return ret;

And then this became "return 0;"

> +}
> +
> +static int stm32_pwm_probe_breakinputs(struct stm32_pwm *priv,
>  				       struct device_node *np)
>  {
> -	struct stm32_breakinput breakinput[MAX_BREAKINPUT];
> -	int nb, ret, i, array_size;
> +	int nb, ret, array_size;
> =20
>  	nb =3D of_property_count_elems_of_size(np, "st,breakinput",
>  					     sizeof(struct stm32_breakinput));
> -

Dropped this since it made the code look cluttered.

Thierry

>  	/*
>  	 * Because "st,breakinput" parameter is optional do not make probe
>  	 * failed if it doesn't exist.
> @@ -531,20 +545,14 @@ static int stm32_pwm_apply_breakinputs(struct stm32=
_pwm *priv,
>  	if (nb > MAX_BREAKINPUT)
>  		return -EINVAL;
> =20
> +	priv->nbreakinput =3D nb;
>  	array_size =3D nb * sizeof(struct stm32_breakinput) / sizeof(u32);
>  	ret =3D of_property_read_u32_array(np, "st,breakinput",
> -					 (u32 *)breakinput, array_size);
> +					 (u32 *)priv->breakinput, array_size);
>  	if (ret)
>  		return ret;
> =20
> -	for (i =3D 0; i < nb && !ret; i++) {
> -		ret =3D stm32_pwm_set_breakinput(priv,
> -					       breakinput[i].index,
> -					       breakinput[i].level,
> -					       breakinput[i].filter);
> -	}
> -
> -	return ret;
> +	return stm32_pwm_apply_breakinputs(priv);
>  }
> =20
>  static void stm32_pwm_detect_complementary(struct stm32_pwm *priv)
> @@ -614,7 +622,7 @@ static int stm32_pwm_probe(struct platform_device *pd=
ev)
>  	if (!priv->regmap || !priv->clk)
>  		return -EINVAL;
> =20
> -	ret =3D stm32_pwm_apply_breakinputs(priv, np);
> +	ret =3D stm32_pwm_probe_breakinputs(priv, np);
>  	if (ret)
>  		return ret;
> =20
> --=20
> 2.7.4
>=20

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2mwLoACgkQ3SOs138+
s6GHWBAAwHNWDi4qqGce8HzLiOPsZ7PV4JSn64OsoS8PfEcGLWagSsNg3JN4vG8S
Hl49Do93zxuquA7pQlxxphQZNfbg4scYnEWZdGN9NPI+HVUiWXxKyKG++k9ZJMR4
KRVmugkh/Qo+sQOAi5qgafxtj42xMnyGj0jp9FNLJ/ZiYAyTabxPalVbLoEOliPX
X3QXW/o9RCcqam/n8vyEj+rsAJj9vdctQJl2q20n3AYH/G6Ku1xbr5htG3aWhWG0
YyvuHEYsTOqo/08TIdbajpkcPzMGh1AjvXwZ6EcNCuM2mGimxv1MH6oWbXyhMO9d
6u2PP3ttwkni+ogoLaYzN7+7/elSNtP10DfThPDvp2SfS4RTOQ/MwJ3DP8+lbNbD
p27zLHY5SE3cSZV8RqXlGQ+IlIPThwG66HJNuLzsfbXCon6OXdzd/sw0s3j8tDwq
V5JEstiS3EDg9mHX7CBH1GWtNm5gYhxMwcWJ5x56yLF/oiHGb+S0MBRjAVjLid9y
JcmXdks8bCk5BieAkfYmhX6Pa3DVHjMrn+DTWfCb/P+J29woIodOkxwVu7IZdWw/
katw5Q+2qtuJsXxmgNUsxVABsaZk7Q9KPo1LNbiz4TsCvttRmRNptxSfC2Je6otM
TSj7eq8zzUcx6GdYGkC6snh+GbHMHn/DyMj+FhmTPdECcsDmiYM=
=ibpm
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--

--===============7402911913554730119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7402911913554730119==--
