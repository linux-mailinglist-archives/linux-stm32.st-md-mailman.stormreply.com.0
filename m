Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7E3977A4C
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Sep 2024 09:49:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65517C78017;
	Fri, 13 Sep 2024 07:49:58 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08987C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2024 07:49:52 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so707701a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2024 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726213791; x=1726818591;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wa1ITqdE5/BK8kA3fdLjh8dVT7wr8VufQbhlGlfKuFA=;
 b=grtyXp05CjZcSkO3Fgoljqk9Hk9wETnXSvLlhFU0DAlMbZNEOdQT6XN7P2eaIQS2N6
 iFt2jIntLg/vKxPMSlc+Nb1DmTDHRn9rONsMxh5b82da9Cxksjmm2Qqub2V46PL1viaM
 kOyD09tYNIMfLVl0t2TPKlAyBnFuTeWYKVXfqQ83QpfTvAkr8Zjb7vTE3FQWNOYKuPGX
 IVMcu4s8owwSe4irAwJJ/MC9bSFOO2blFSpmpEAql6RY32L4K8CYORPRAfjxmQPGesEe
 GA0WBsR7zVxpyCG/7C2831Wgo1DM/IEoKLNgh5Xr5uvXDBtFW8TCK23//j0XPCA3/Atl
 o7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213791; x=1726818591;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wa1ITqdE5/BK8kA3fdLjh8dVT7wr8VufQbhlGlfKuFA=;
 b=I5y1pAifC5GajefEfJGB6v0pr007scUGzpTClX2gEtCAhiMH7/VOa+rfzS2P52AzEA
 1N2WM28k06wkCL0HG0t54KhrXRLK9gkzfWOm3eY439yWSiK5zKl0lji1/vGdcjKgqB7z
 sAxD9DobN30oiB0ySFGNKS6d5fHX2qCobNaVlQPBypekazRVEQaH+nhzhJY5yG89muJv
 ev4/71d07QbJ/yZHKXq++FPBXoraJUrD+atqADHfGH8AcVSKUDWuWlQ6Uvnfz2jUwQkq
 zSbZlvCv6dxwAhXAMVR5orS/4RXuFQanrBP3rsRLgHfM0iHT7QwC4TZe6M//a2GpQxc3
 gzdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvglzA7xri7WayDDKXF8wUHbYgPm+KOAAL0EXVAqxxKwBh9sULuYpBXN7FgkYSTpSEOfRGSBNacCfGWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0WrI2gyEtWHWDkhpJmu5Wd9fIylqWCHVzpUJKEF589U42FgfB
 9IDCh6xjHmfUtjxeNtG7uBGOFG3VXQFmbmzaR5LtyyU6TeqoQj/tujrRIN0mJmU=
X-Google-Smtp-Source: AGHT+IGNol1Ptrv5HMztO+XGTt6sF30N0ildaSdHGkDcLQdc26QC+9nMuku9fBuokfORM931FkSPTw==
X-Received: by 2002:a05:6402:1e90:b0:5c2:4dcc:b911 with SMTP id
 4fb4d7f45d1cf-5c41e1b2531mr1444970a12.26.1726213791184; 
 Fri, 13 Sep 2024 00:49:51 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd42620sm7231754a12.20.2024.09.13.00.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:49:50 -0700 (PDT)
Date: Fri, 13 Sep 2024 09:49:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrew Kreimer <algonell@gmail.com>
Message-ID: <hecpzmymii2aoqc5lgkycmxojin7gmrtyd3wnmhxcgeklnioky@vjkxayxmswzc>
References: <20240912124944.43284-1-algonell@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240912124944.43284-1-algonell@gmail.com>
Cc: linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Fix a typo
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
Content-Type: multipart/mixed; boundary="===============0434587204365577510=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0434587204365577510==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="332t5ftlx4yomxqi"
Content-Disposition: inline


--332t5ftlx4yomxqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 03:49:34PM +0300, Andrew Kreimer wrote:
> Fix a typo in comments.
>=20
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>  drivers/pwm/pwm-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index f85eb41cb084..eb24054f9729 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -222,7 +222,7 @@ static int stm32_pwm_capture(struct pwm_chip *chip, s=
truct pwm_device *pwm,
> =20
>  		scale =3D max_arr / min(max_arr, raw_prd);
>  	} else {
> -		scale =3D priv->max_arr; /* bellow resolution, use max scale */
> +		scale =3D priv->max_arr; /* below resolution, use max scale */
>  	}
> =20
>  	if (psc && scale > 1) {

Oh, that's an old one introduced in commit d66ffb91c374 ("pwm: stm32:
Improve capture by tuning counter prescaler") in 2018.

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Best regards and thanks
Uwe

--332t5ftlx4yomxqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbj7pkACgkQj4D7WH0S
/k6oEwf+LVChmqpZHYi9IgqxWAzp4xco9NwQ1aT4QyzvcrFPgE7d19tn9zTdxMzg
o3OTYwnhSwgIXfYNGkvu4OOjjhuivZqLJTgvv8W6foS+s1unjMbD65u+nxfy7ih6
YBFF1s5RYjPvVYh3cOhdwQ7HDR0V70ROQzOMtMvOlSqvS4b4zqYKY6GvxOW5cxsz
5285CZZJAZK0dH9W4W0DDk9vkcfflnGeqeBFzL50iFf7cssTGobrJ+Unyrx2LmSx
RiULRREupUOiCtD7FC3b1deLpNTzkLuoq8VSldVbFDfCvtR8zMUoJUm9BbiyoJFC
IyL+b/z5ypu86BarN8XpL25to2cg2w==
=8Lhz
-----END PGP SIGNATURE-----

--332t5ftlx4yomxqi--

--===============0434587204365577510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0434587204365577510==--
