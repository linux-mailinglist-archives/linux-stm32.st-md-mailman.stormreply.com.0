Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D24B5A444E3
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 16:47:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80863C78F9C;
	Tue, 25 Feb 2025 15:47:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21899C78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 15:47:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso35775805e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740498436; x=1741103236;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RL7ikpdpwTIHUvgLFfPq1GGLDdUjM4D8YM1CAoVeQq0=;
 b=Zt2C9ykcWHX2rACvjCp83cLO4FF53jBWvfaUCVPpTnkXhtK3I1zatVln5ESH5higuA
 tsHqAfcLIJ7YMe6CbhKwtV4GlmSvRi8sAc9zWXLEcF03o8yrjrm+I3VkmQC/B61yVIqY
 SroPdGAjQMq+InyvudwJPI40QWuzZfSVC4IqvJB5sLmVSMUohgxq6FjhH0GwwrarNzmy
 waLcn+vsSlOa9V7zs2C0a0PZ3odt4StZCM6u7spJW4i8QM1RXjpQO3X4BMOKl+ZlkBjJ
 DoThLVvhG25eMJLITdC1Hhy1/Z+8QPwyCwWU4iAMy2R3M1DkHziOgdhhheh+sDzn7NQp
 KSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740498436; x=1741103236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL7ikpdpwTIHUvgLFfPq1GGLDdUjM4D8YM1CAoVeQq0=;
 b=DO8uf9PymgmK4SNg1vSk4QBBnlL0fjeEi1D/TSavKNUQ8hGyrlHQllwU0LRO1ZZgW0
 l7w3I7+jz9YMDFWcBnX3c7/IVjF/g+Hpp7CGqcMvAn2vmetY8B43KUWmxy9pWgmADtK7
 LGYu318lkaP3ecaAO4kMBHhv+6MBYt9WfBDinOhHEooNVphKEeGUQnWbq674rume0mYO
 Tr+TEzy5XB1FlVJjACfffWPjXtUPVe4TudMRLMvTzmH6G0D+fk+roiKcXqSa6qwgZU72
 Lxi8afB3bp8U+pxTqP8n/pB8tg5uLzVM99ydmRbFtEeOw/7YJiufpx69Jb4ljB174xrH
 ZEUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnDgdPobu8wsosKmUTeENWba5B9kNOhyqNKLPRSy9eLxABaQTmJauIEnvG7Kk4R2nOYi9FTE/zwEw/FA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwYgJPwoCgP0ItcsJ/rYnMkgXxX+eQa9u8DQ5/QgfX/hxpdGgKn
 hveP/cEsMBIRB52xYc/pl4itwHYhSOPOsn0ivwSmuQd5NK5C0+c5KqC+KB6fA14=
X-Gm-Gg: ASbGncu2zvl631g36X3ym7bkBdCkED/V/Tu3x1QGaLNQHzM32LX9nRL4YSHJ0cVtU32
 IHmVJKxVUlv6Dn3RNr0AcCBWqCd1cmSkw02vSRI2Mv0nxuQPuEMZTR2Qi+XDFrE6quT4ewTH6tz
 RgeVGLJP8KeIFZnzY1xhGqFVtkS7enQl7YeqhkecALECVRqTXSsvQTZysHRXaDUvyjOyrNZUBm3
 VH4uCANRJpbGB+Ux1ie4Gckgjx+douCSuKlGYAsO8HjR63Wln7+UVNkJ0Y2FudlY8/UnZDDGT2n
 c0Wuc4Fc3b3VK75Fc2t7FXIanhFHq0eZHG15sYFsiAfn/gjQW+ZutYZjMqP3t9Bm4i8i
X-Google-Smtp-Source: AGHT+IHtPuDfuhLmrc1DEpJvBrIbtOvABx17RUyOzeb8wjvJkw062EMza3VLmzP2KVFZ1hOuW1Hblw==
X-Received: by 2002:a05:600c:4753:b0:439:a1ef:c238 with SMTP id
 5b1f17b1804b1-43ab0f3cc86mr32918495e9.13.1740498436294; 
 Tue, 25 Feb 2025 07:47:16 -0800 (PST)
Received: from localhost
 (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f08:3b04::1b9]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f23c2sm147993495e9.17.2025.02.25.07.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 07:47:15 -0800 (PST)
Date: Tue, 25 Feb 2025 16:47:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
References: <20250225145332.1116557-1-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250225145332.1116557-1-arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Yu Jiaoliang <yujiaoliang@vivo.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [v2] Input: stmpe-ts - mark OF related
 data as maybe unused
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
Content-Type: multipart/mixed; boundary="===============8174817697909104979=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8174817697909104979==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bmiwcubc5vrvxiy6"
Content-Disposition: inline


--bmiwcubc5vrvxiy6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
MIME-Version: 1.0

On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> When compile tested with W=3D1 on x86_64 with driver as built-in:
>=20
>   stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunu=
sed-const-variable]
>=20
> Ideally this would be referenced from the platform_driver, but since
> the compatible string is already matched by the mfd driver for its
> parent device, that would break probing.
>=20
> In this case, the of_device_id table just serves as a module alias
> for loading the driver, while the device itself is probed using
> the platform device name.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/lkml/20240403080702.3509288-8-arnd@kernel.o=
rg/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/input/touchscreen/stmpe-ts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchsc=
reen/stmpe-ts.c
> index a94a1997f96b..3900aa2e3a90 100644
> --- a/drivers/input/touchscreen/stmpe-ts.c
> +++ b/drivers/input/touchscreen/stmpe-ts.c
> @@ -366,7 +366,7 @@ static struct platform_driver stmpe_ts_driver =3D {
>  };
>  module_platform_driver(stmpe_ts_driver);
> =20
> -static const struct of_device_id stmpe_ts_ids[] =3D {
> +static const struct of_device_id stmpe_ts_ids[] __maybe_unused =3D {
>  	{ .compatible =3D "st,stmpe-ts", },
>  	{ },
>  };

Following this we have

	MODULE_DEVICE_TABLE(of, stmpe_ts_ids);

=2E

With=20

diff --git a/include/linux/module.h b/include/linux/module.h
index 30e5b19bafa9..014f033ef1ba 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -250,7 +250,8 @@ extern void cleanup_module(void);
 extern typeof(name) __mod_device_table__##type##__##name		\
   __attribute__ ((unused, alias(__stringify(name))))
 #else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
+#define MODULE_DEVICE_TABLE(type, name)					\
+static const typeof(name) *__mod_device_table__##type##__##name##_ptr __at=
tribute__((unused)) =3D &(name)
 #endif
=20
 /* Version of form [<epoch>:]<version>[-<extra-version>].

the warning goes away and stmpe_ts_ids isn't included in the .o file
without having to add __maybe_unused to the driver.

I would consider that a superior approach.

Best regards
Uwe

--bmiwcubc5vrvxiy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAme95gAACgkQj4D7WH0S
/k41fAgAsiG8eMcqxYHNh+Ky669sked7nMyC/TQEQFV0SUv+wg92u8/vFDlkldP7
H6WjVz3r08uWIyg04k+7e2ybBjuwwbRgCfHMDsht96y2I0dFuviQ+krb4laT1lty
TJm0S+x18lKbJ+/wChNRi2JJ5NImAyjHS++f7KzDKWCo1pkNYk4R+mEUkdPeT1T7
EEY7bC3rgUELAmTkj2+wJCkXgXpLH98JXtQK8d5jjhouR1XpfsGFYf2dk+jKRG80
lZOE50QtJYOXkT9u0RLFU4R2dAMwsSEWB8lWbbBPiOY9dGdYvSb0+h6/4haQflbG
0i7od2UQ4QTAXLquHYDOUHpV3+yyuw==
=/Pv1
-----END PGP SIGNATURE-----

--bmiwcubc5vrvxiy6--

--===============8174817697909104979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8174817697909104979==--
