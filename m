Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2537D42D2CE
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 08:38:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C19B7C5C837;
	Thu, 14 Oct 2021 06:38:47 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B7A1C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 06:38:46 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id q12so1675156pgq.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Oct 2021 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0yvGAdlGwGjmIyVzlCTH27Niw9ewJoOJO9bhBri9ypA=;
 b=eT60p1AkePaLtDwuzgcfn7CjUMUZJZ2jz79ThxLTJFLdKYKpSSjImi+t6K1d8UZsVn
 uh8juQTXYfJASrN8UFVn9HENYga/fwSoWafGhwR6nGEMzEXz+sAPdLnpD2nXqQrpYJEM
 XF3i188QUXOui+Lw5tZFrhVNxN80QpTyvN8nypoLdc2iuJHLrsC/RbflIODKY5MA3eBr
 KhSE0ymdhusVh/aZMmax8X5D8//UQ1DzvuvnQCNqPMmy1zg4Zsx+28MdA1ZHOItAPztO
 o6xGPPcoZs3S37j2KbGLhkVlDF5TF49BUfuG3m+bl6Z9by7R2iZgXUrrJRXZdKvlDbX5
 s9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0yvGAdlGwGjmIyVzlCTH27Niw9ewJoOJO9bhBri9ypA=;
 b=MMf5z4e0RoKbtolqj6ImgwxHZS41Zjj2rxeN1EqAxvDweJFeUSDshjGrjF6DXAy3rQ
 R/5VRg68ewrS0APq4Ia07yVKmk/Lp9rypcMPpi3NX3AFVGZNbdSck6VKycE9DONJdaWe
 eFk6d4htebC3PuBCmmOi+OwMqcb76rVIXizkr1vzphiT48c02/91IaaGcXqxWqBnmWlK
 UW+5alHteLt7PtOSz+j36uTwiMa5tTowFpDbe6Sz9EV7aKyMzoLMo7btiUZX9Tba6KRg
 DdlMlAjr5OrUvPSZVWFXqv6kTOc8qLLgNtv3MhR5QdA7+xrLrA2dLO0GPxNMEREGuzIJ
 TPHg==
X-Gm-Message-State: AOAM533MYDDsmBMCNAsy1twldJGjEy73XjpbWeptRWpI5mA5+Q6LnHAN
 2qXOPsy1CaJ3F5L3fPYR2oU=
X-Google-Smtp-Source: ABdhPJztN0xFF3yKFMz/iJDeoME1t7GYr6HJYejtr0V32bNkr135zb/V7OOaeOdel1mLvwEq9lSfdw==
X-Received: by 2002:a63:3748:: with SMTP id g8mr2923207pgn.102.1634193524819; 
 Wed, 13 Oct 2021 23:38:44 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id s2sm1379433pgd.13.2021.10.13.23.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 23:38:44 -0700 (PDT)
Date: Thu, 14 Oct 2021 15:38:39 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Qing Wang <wangqing@vivo.com>
Message-ID: <YWfQb6O+HYGZf4iE@shinobu>
References: <1634095619-4174-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
In-Reply-To: <1634095619-4174-1-git-send-email-wangqing@vivo.com>
Cc: linux-iio@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: replace snprintf in show
 functions with sysfs_emit
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
Content-Type: multipart/mixed; boundary="===============7491820081428860637=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7491820081428860637==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/acL0IA0evwDpukR"
Content-Disposition: inline


--/acL0IA0evwDpukR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 08:26:59PM -0700, Qing Wang wrote:
> coccicheck complains about the use of snprintf() in sysfs show functions.
>=20
> Fix the following coccicheck warning:
> drivers/counter/stm32-lptimer-cnt.c:265:8-16: WARNING: use scnprintf or s=
printf.
> drivers/counter/stm32-lptimer-cnt.c:176:8-16: WARNING: use scnprintf or s=
printf.
>=20
> Use sysfs_emit instead of scnprintf or sprintf makes more sense.
>=20
> Signed-off-by: Qing Wang <wangqing@vivo.com>

Hello Qing Wang,

Thank you for your submission. I believe these warnings are already
resolved by commit d70e46af7531 ("counter: Internalize sysfs interface
code") in the linux-next tree. Would you verify whether that is the case
or if we still need to fix this?

Sincerely,

William Breathitt Gray

> ---
>  drivers/counter/stm32-lptimer-cnt.c | 2 +-
>  drivers/counter/stm32-timer-cnt.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-=
lptimer-cnt.c
> index c19d998..6f1113a 100644
> --- a/drivers/counter/stm32-lptimer-cnt.c
> +++ b/drivers/counter/stm32-lptimer-cnt.c
> @@ -262,7 +262,7 @@ static ssize_t stm32_lptim_cnt_ceiling_read(struct co=
unter_device *counter,
>  {
>  	struct stm32_lptim_cnt *const priv =3D counter->priv;
> =20
> -	return snprintf(buf, PAGE_SIZE, "%u\n", priv->ceiling);
> +	return sysfs_emit(buf, "%u\n", priv->ceiling);
>  }
> =20
>  static ssize_t stm32_lptim_cnt_ceiling_write(struct counter_device *coun=
ter,
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 603b30a..e772586 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -173,7 +173,7 @@ static ssize_t stm32_count_ceiling_read(struct counte=
r_device *counter,
> =20
>  	regmap_read(priv->regmap, TIM_ARR, &arr);
> =20
> -	return snprintf(buf, PAGE_SIZE, "%u\n", arr);
> +	return sysfs_emit(buf, "%u\n", arr);
>  }
> =20
>  static ssize_t stm32_count_ceiling_write(struct counter_device *counter,
> --=20
> 2.7.4
>=20

--/acL0IA0evwDpukR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmFn0GIACgkQhvpINdm7
VJLiwxAAuzG/hybrpcaFNKO86nfLbe6lfxCeppv2YSTC+n8uuTMaltvBqX7+y5Vo
HLpnhgSqSQnBUy9lHzILySxYhgMEWjnoWKwakwmk1JMMV6odHcnCQZT5dgs+zihZ
UJqk4iKIZkhWdCxVF/BBtiPSrIvUE+NyJr+GSBwRrWofyiAfl3leI0fURiNscpPZ
tZGZqQ4wL2H46QowHRpXeK7jkg7S97v5llXJPnHjvVsaBVAfEs1wH0Qcv95eMV3M
YeZKe+4I7bne7k65821EkChZdVWBwXgJtefT9mLqmOBxt8B5Bl4YVFvFxpbKU+cX
XIUSq4pod6ywfBHTIUG3F9uD8/rNU9nGvYOLWxdD2wpFu16eFtJ0j6GIxzmEvEi4
wuH34aNLuyx62/MGwmnq3Z55SszgzgfxmTCHQetPajLgryV8m+4iTA+AVthtwVjA
6RL53DX3IhYNINspBdU0JcZcEGMlq8k33t6aBWnUxyv/4dBIdczIBH9lJJnyEUbQ
K9WnWLrj6e2/2IIJZAmVk8hSaMfm2+R0QvrZrGugK8k7JlWt1QGLkLyE2R5pfJvh
+CifKG7/hFrSEABvzi2TPjL3FHFR7XVRcPqV/AnfsvVKSbohx86mDymqwdXbad18
5PsGTsXrSCrZkC2pLBoyydMP4OtMxEqQPgcr1Uvzj0vIkUJXKIg=
=bXhQ
-----END PGP SIGNATURE-----

--/acL0IA0evwDpukR--

--===============7491820081428860637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7491820081428860637==--
