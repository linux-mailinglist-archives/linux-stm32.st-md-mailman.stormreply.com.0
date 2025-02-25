Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F7A44C54
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 21:17:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 946F5C78F9B;
	Tue, 25 Feb 2025 20:17:41 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CDA8C78F6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 20:17:40 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5dc89df7eccso10805041a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 12:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740514660; x=1741119460;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=;
 b=mLLvR2AyQvuM2LVGWl3V7MFaw9r41ok69l6xoVq8wHOQxqLtEbkI8TvMiw0lnTgAOo
 1WBNAQdpQQgEZiZrz/uI/3c0t4VQgVeKxNyX343xN9pmcbRN4RdoPPnzRVPyOztkWarB
 RRGdXiVUV440gA1askYThOQ5OhmaiPhGYwV2ryyHlLo9lewzM5WSe9b7UOBVR0E6bI/D
 TbFChXvQoRb4+WOQzrss+QgKSeHz9AoXEGQD7rZlboyUCzrVj1mffxnxWcjflgBfjZY2
 8bwjfL8dshvDBJsbBitE8nvcuRmcIiij0ZKtLZI9CGmSbtRQrlt3VWEnmmpoV//NmnE6
 9+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740514660; x=1741119460;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oqKP1MS3Cu+ZpN/VBDxQixq+TL+46JCnPqhnNV9a8M=;
 b=Lake80TifLejid3GJLmGiA+BMl3UAhhEp+ld8YUiXYp+apcLn8QyS0WWjFBbgboZ6S
 ddk1MkTBvyPjfxvPaMdPeElACD23upuxCk6XuReLpXN1hLCCr8M/pXrVRc46MqJ1P3I0
 hrRodpEQ/rdArNJ4p0x2KWvLik/ofCaRGvIbb9EHn156t/45M1taqXhEQoKHXulSvVor
 xF0q+cG9jSHhkhFSa2UZuf4/FM8vfA0u/CbnuBDzkpSq6MwI5G1zjfbK0beQXedYFKsZ
 OxnVixJmmK72sA6CBF9Lq0HMt/JMya8pfWAH+Hx+p6wPJUDwYbtDq6k/syyzYnQIdlj/
 eXYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbTT0mDOBLcZvpvwilzubwRurjghL8j4lVJWjbryv1X0RcaOxFhcp6Rj8xlD8w9L3aW2wZvaDyxX1g7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw/N89h+j/U1P4SorjSx5PQ/VB5AdVh28zkez5zt4x0Ccr4qEW4
 fJWSr1g1IF2b85K50EaM2re8eppysNLK+fAn7t/QVgsqyS7ifOpPh9ALYv87R3U=
X-Gm-Gg: ASbGncuEvuOoWclfX7Zi98YPZzZJ/yho2Q/EFOH1fHT61SFUiv46N5GfvbfL27YHzWb
 JNGbP2zToXPeWoHPBZQCImAh5L67Eo4kYbGuQPudHnWuWu9aoCHyDYPARkvGrwdl308U/GlgiQq
 spiHEvkJmENGIwkRs0mbAYQZ/gLWB0qFR+rCdy71yLN19Mchy+Xv+OxpvUN719WnL/X3tkL1aiu
 lapWDqXnGdRftICkVGwStZXB5UbkN7E41jr+vyS4KF1qmApMT/Hee1xxKOj7Ckv+1gprSioGFAa
 03iXONPbM4QSKquolI0XPEgpw5qK/m8=
X-Google-Smtp-Source: AGHT+IEP4H83eueMuTFXJWlrHU2PDik7Lal5HqZTmunkxw5tmpnhf4TdWmcw3iZXzovmtEQLvNVBdA==
X-Received: by 2002:a05:6402:50c8:b0:5d9:a62:32b with SMTP id
 4fb4d7f45d1cf-5e44448118fmr4326163a12.7.1740514659840; 
 Tue, 25 Feb 2025 12:17:39 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e4518460dcsm1697685a12.0.2025.02.25.12.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 12:17:38 -0800 (PST)
Date: Tue, 25 Feb 2025 21:17:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <ccjng5mrvqngfg6eujq6mtl6dj2sz5vsqvjoqz6gm5ntcibduz@wqoc6zhchrvv>
References: <20250225145332.1116557-1-arnd@kernel.org>
 <6xoycaft6wnd4sm74f2o4koc7lvyl2mtxp2kc6lc4dzpjvby53@ejm5ssbfzbph>
 <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <a6d10d80-79d3-426f-9dc8-0ddab77e89d9@app.fastmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Yu Jiaoliang <yujiaoliang@vivo.com>,
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
Content-Type: multipart/mixed; boundary="===============4203901277211194420=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4203901277211194420==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f55raej2e5xwtv3g"
Content-Disposition: inline


--f55raej2e5xwtv3g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] [v2] Input: stmpe-ts - mark OF related data as maybe
 unused
MIME-Version: 1.0

Hello Arnd,

On Tue, Feb 25, 2025 at 05:25:05PM +0100, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 16:47, Uwe Kleine-K=F6nig wrote:
> > On Tue, Feb 25, 2025 at 03:53:26PM +0100, Arnd Bergmann wrote:
> >> diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touc=
hscreen/
> >
> > With=20
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 30e5b19bafa9..014f033ef1ba 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -250,7 +250,8 @@ extern void cleanup_module(void);
> >  extern typeof(name) __mod_device_table__##type##__##name		\
> >    __attribute__ ((unused, alias(__stringify(name))))
> >  #else  /* !MODULE */
> > -#define MODULE_DEVICE_TABLE(type, name)
> > +#define MODULE_DEVICE_TABLE(type, name)					\
> > +static const typeof(name) *__mod_device_table__##type##__##name##_ptr=
=20
> > __attribute__((unused)) =3D &(name)
> >  #endif
> >=20
> >  /* Version of form [<epoch>:]<version>[-<extra-version>].

Hu?

> > the warning goes away and stmpe_ts_ids isn't included in the .o file
> > without having to add __maybe_unused to the driver.
> >
> > I would consider that a superior approach.
>=20
> Not sure, I can see how this avoids some warnings, but this is
> currently the only remaining instance of this problem (I fixed
> another two recently), and in most cases a MODULE_DEVICE_TABLE()
> entry that is completely unused ends up pointing to a real bug,
> where there is a table but it's not also part of the
> device_driver definition.

It might be the only instance without __maybe_unused and so triggering a
warning. But there is also:

$ git grep -E 'of_device_id.*__maybe_unused' | wc -l
231

$ git grep -E 'mdio_device_id.*__maybe_unused' | wc -l
58

Best regards
Uwe

--f55raej2e5xwtv3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAme+JVwACgkQj4D7WH0S
/k74zAf/dGlacxqVy9vAqpyEEhNrerDYdon6jOL4XYedysGHXBDPOFK38QCnWC6d
19Lu/uVu0sftbAmTRLbUOjCAQ5sLlJLOYIsoeXm03OQ1u4DjDS12Xz43uphpMlBX
jl5NMQs6PApcy7z+KPjuc0mcHnhFse71fpWfNyCxN7l2KAIRkCRXqLWgZ8eJfeLV
pLvIN4/VkcCzIXXP7qLJrz4ZezjGkjvgxBaMVH2DVmkxHymmo0RycjP2QooDJAk7
S6iir9ZFD+UfFeujJBsx70rkrsJ3dXSGNn97DNiulacw7UwLU+aUxjs89g/DIsPA
9+qrSzSEFDXZZSOh2ocNUbgfzl9mPQ==
=d8EH
-----END PGP SIGNATURE-----

--f55raej2e5xwtv3g--

--===============4203901277211194420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4203901277211194420==--
