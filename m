Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2D8CC6876
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 09:21:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 053A8C030AF;
	Wed, 17 Dec 2025 08:21:46 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56D75C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 08:21:44 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b79e7112398so1074750866b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 00:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765959703; x=1766564503;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b+Q8ghXVyCQDXjBoffiftwRpwO3ivtFGMCLgHbR9KKc=;
 b=HDCFC3PrRMfeb9nxhIaEGqthpFrfg72l3sJ/1RApVk/K/hFUBcqyAdsGSjqKDdTvq4
 oOywT7MGn9vl0uJw96ozVLA85xu8r87EvROQnoBUeJmj0IVhOkuJ0+EouHCD7sLvvVtZ
 PevvqcA0ntufjgpMWcNNSCyhuAFNAKDtjgikIhyjkpFXc2DPO4VTxxfLtg0qza03kulg
 a7PWFdrF6B7fa365FzAHeWwM3wH6IkB/csLkc1wm8gjG8SREbKCStHRXuu0zCVlRo1bz
 tdtDDFPEsIPY6zuNqf3OyLHoUAuDW3nrPU2V8hlYB3A+zn8e5yin3SFJraNuSs/jRwrb
 q3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765959703; x=1766564503;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+Q8ghXVyCQDXjBoffiftwRpwO3ivtFGMCLgHbR9KKc=;
 b=r1JBqTvfRv++n2TEAMfhes7gwgMUSLJfr36PomyDesqTfHuGlIS8GkioZvCd+R/rEO
 l6bkDAEDzpHTZd8p7jeJZfF+lLy/Whre9c1huNbZp9AIXKfofWvIuDJZiwUxbGuWY6gD
 AxK5n75rFviHuDfoRGv1dJyNT5mh61ty1Z21bp4RBqmBiqjTHYFnD8wuHdQhqJFDZ1Za
 LLt5UgSzSEaHg2HqAwrciaYGBZdDr45Fv0veeQzSPZ35KN+dfBDnIhxzM7jxlPqGiVR8
 wglyC/BTi6WZVR55fWv7vA+oFpuAwvWZH+r/vyr00bMfxWmJxwMGQpq7oiCaiQcCyqN7
 Uu4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSHb6xtx82UJhGSTFLSktihUCZq7XTgbF0ouYKJJLpM+llgX+Th2NpvOin+Avk04PaD4nec0CVH0aFpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyHTi/hImSmK7sz52qx/jK0t1rYMeA6t02D05bhnBRHxC8WiENl
 zAaFJpMWLIUscf/yHdmB1Bap1jZ1eMTuUijILFV7MzKCIdP27rsET1Srv+qFR49Q1D0=
X-Gm-Gg: AY/fxX57zDI85oEUavAy8+T68RU3RLLCdLL4R9aNSVHlNGINBU2jORUfpG86G5JON5f
 hOLke9nL1eGO8rBf5GrnxczgzABtFzJc6e2xfyWGjfLEDKjMC6auB0uzhOlXjfWRQy6nRYlp2B2
 W5SyNwNwpwuyqKTPicGHGG85cS6/4/0TxFjFHd9tzs/+tNwb8zpd9Wyt3NeZMU/xrabOaRqfUBy
 5fa/WDARgT6MvLqVjuLprhkpMpgPM8ohebYRtKWbOuKDzGhSCPDtFT2bFPjY65+j8UUTh/zJBBn
 jjY8IbpYHIa21pn7FGOIKhUaFX25Z5zx2+ZFyRf7YCUA8AaA2l5QOdampXtItnw4n37dnvdQVMP
 Zc8WUwzIgbYvMW78Iqjlw6JLrtslU57Htq7JqdRPaqeKHBFFjhe3kTe05HvBHje6NJQuvn/9zLT
 uBfj/pZ9QuOl/1+l8c
X-Google-Smtp-Source: AGHT+IFCoak6awfsvNzuanPNEFvtnm4npy82/7GDiD4hlE+WRwlv0VOch5efQB3V/p3Rq/g2NEI9Nw==
X-Received: by 2002:a17:907:d94:b0:b73:5f5e:574d with SMTP id
 a640c23a62f3a-b7d23a89c52mr1790501866b.59.1765959703434; 
 Wed, 17 Dec 2025 00:21:43 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b7ffacd9192sm337793366b.70.2025.12.17.00.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 00:21:42 -0800 (PST)
Date: Wed, 17 Dec 2025 09:21:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Garg <sumit.garg@kernel.org>
Message-ID: <max5wxkcjjvnftwfwgymybwbnvf5s3ytwpy4oo5i74kfvnav4m@m2wasqyxsf4h>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
 <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
 <aUJh--HGVeJWIilS@sumit-xelite>
MIME-Version: 1.0
In-Reply-To: <aUJh--HGVeJWIilS@sumit-xelite>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-rtc@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-security-module@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Olivia Mackall <olivia@selenic.com>, Michael Chan <michael.chan@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>,
 linux-integrity@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v1 00/17] tee: Use bus callbacks instead
 of driver callbacks
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
Content-Type: multipart/mixed; boundary="===============1286062967489339893=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1286062967489339893==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6kfp3quyfb6lwgz"
Content-Disposition: inline


--p6kfp3quyfb6lwgz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
MIME-Version: 1.0

Hello Sumit,

On Wed, Dec 17, 2025 at 01:25:39PM +0530, Sumit Garg wrote:
> On Tue, Dec 16, 2025 at 12:08:38PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Dec 16, 2025 at 01:08:38PM +0530, Sumit Garg wrote:
> > > On Mon, Dec 15, 2025 at 3:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > >  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister=
 all
> > > >    optee devices in its error path (optee_unregister_devices())?
> > >=20
> > > This is mostly to take care of if any device got registered before the
> > > failure occured. Let me know if you have a better way to address that.
> >=20
> > Without understanding the tee stuff, I'd say: Don't bother and only undo
> > the things that probe did before the failure.
>=20
> True, but this is special case where if there is any leftover device
> registered from the TEE implementation then it is likely going to cause
> the corresponding kernel client driver crash.

You are aware that this is racy? So if a driver crashes e.g. after
teedev_close_context() it might happen that it is registered just after
optee_unregister_devices() returns.

Best regards
Uwe

--p6kfp3quyfb6lwgz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlCaBIACgkQj4D7WH0S
/k7jZwf/S32gHxmpuL9ts6Dq9pI9CDW9KNDwfTzIptzaNQEofHnz2Ph9Ejs/bZAl
1skNWxxt2vGIVP016BxUqi9V0RyKNUV0GCk23ZMdeGE09A47y9N0bT00HDJrrZYp
FYCoNNwL8vICQzfAti/0+DHGI1uHwrXCwQWf/VaNggCAhb3eTCfcmUtogT7hhbtH
+6bLk0/LEYmrIg1pkq6m4Y4vxBOEwnSZVDa4/15mxJ7jExJeoQmha2Y2whq5WZtY
TEMgHL6KNg7ifbee+/Y0HUJizQ45rf4pJo2bvrbwXc+3KaEqfzNpD3jKVcKJSNBx
jL7uprws5c1kFtHG4vp8QjaZRNJtpw==
=trcC
-----END PGP SIGNATURE-----

--p6kfp3quyfb6lwgz--

--===============1286062967489339893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1286062967489339893==--
