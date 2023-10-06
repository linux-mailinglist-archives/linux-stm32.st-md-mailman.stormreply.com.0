Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB44D7BB521
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 12:27:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 845F6C6C836;
	Fri,  6 Oct 2023 10:27:56 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A770C6C835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 10:27:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso353648466b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 03:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696588074; x=1697192874;
 darn=st-md-mailman.stormreply.com; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9Fc0FVBGB2O2+FJ3vPJiIICpzRP6mifN4XxO0k9PQQ=;
 b=ExASJje7SogOFpWaByD2bL4Q6fPcTa5zn1I8XCXINwVpLwczkqpjG0bBTEWh5LouBS
 kky0fGwQXtkXSc0Gt8Fp/0zzs0YSwkV/UAyuzc8UndhP2FRfOC9kHPEgXzjrCidpJIrN
 /SdCzR3px6bQn9IjUYb/F2ZlxiGRtfNpXxsxh3S6d6JYDVZruKlXrQEAre92sGqp2p67
 zqNZ+NuFU9GvOIseCOfYXWvfC02f3vY/aesEvL44eg7f7UleHvHMwon2XEexDygpP9Ro
 h0Urtf8nPwSm7PtZNOU8LINNJxodqBG53WX3QRoTqwZSqnbYVDjDhh1PWSaiBuMjvbNV
 fG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696588074; x=1697192874;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9Fc0FVBGB2O2+FJ3vPJiIICpzRP6mifN4XxO0k9PQQ=;
 b=H2La2HMSh/9wEqrXSffJo7MGOoqSuAS+Z8HNttRCnEfrBwHKSNVhCajKIdvx60KNte
 ubk6BeqFhiNsOqImGwCkM/BAjnD70jAktTMLVsIcp6sYZTvfavpc4kmNaRp/WyrbLW95
 gc6ruvmIL4Wcrq+lxkAVV3V2jGtq/8P369ufBc+A78y7cKlt+Qw6q4r1j4tlfjRfRt3V
 DvR+GQNpr/Nik0wJzyOQHE0OnYjnm6yEvE3W8+UbEBdPJBBSy05TLCwOJDg8YC3GUjRx
 bZL/RCJiL8B31RIMbxXgrQ+y78k8lMX1ViHgMD4d1jqW4hgg2jypOfxUdtBDvA8gypde
 +7Ow==
X-Gm-Message-State: AOJu0Yy7vVmv0ErF30XDbeNgPGsYmuoi7Fci6LOGUD0llAxlRLlaNqkW
 O9F8gUWt1fULrMNYjcT45i4=
X-Google-Smtp-Source: AGHT+IE/s3qAxgyljikxvjg80luFhar2eIhtc4hXlIZiE/53LwAa/wMyWOcQaAwad6HOJwQdJ6c/EQ==
X-Received: by 2002:a17:907:72c1:b0:9ad:7d5b:ba68 with SMTP id
 du1-20020a17090772c100b009ad7d5bba68mr8214636ejc.32.1696588074415; 
 Fri, 06 Oct 2023 03:27:54 -0700 (PDT)
Received: from orome.fritz.box
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 fi10-20020a170906da0a00b009ad8796a6aesm2627941ejb.56.2023.10.06.03.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 03:27:54 -0700 (PDT)
Date: Fri, 6 Oct 2023 12:27:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZR_hJ05h5O6SpM_D@orome.fritz.box>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sean Young <sean@mess.org>,
 Daire McNamara <daire.mcnamara@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: make it possible to apply pwm
 changes in atomic context
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
Content-Type: multipart/mixed; boundary="===============0910280118975190220=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0910280118975190220==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BBvlNbMNXcP/VVb9"
Content-Disposition: inline


--BBvlNbMNXcP/VVb9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2023 at 11:59:20AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Sean,
>=20
> On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index dc66e3405bf5..d9679ae5b2be 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -505,7 +505,7 @@ int pwm_apply_state(struct pwm_device *pwm, const s=
truct pwm_state *state)
> >  	 * is a bad idea. So make it explicit that calling this function might
> >  	 * sleep.
> >  	 */
> > -	might_sleep();
> > +	might_sleep_if(pwm_can_sleep(pwm));
> > =20
> >  	if (!pwm || !state || !state->period ||
> >  	    state->duty_cycle > state->period)
>=20
> I'd like to have a mechanism to catch drivers that missed to set
> .can_sleep. The best idea I currently have for that is to disable
> preemption if IS_ENABLED(CONFIG_PWM_DEBUG) && !pwm_can_sleep(pwm) while
> .apply() is running.
>=20
> > diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> > index b7c6045c5d08..b8b9392844e9 100644
> > --- a/drivers/pwm/pwm-fsl-ftm.c
> > +++ b/drivers/pwm/pwm-fsl-ftm.c
> > @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *pd=
ev)
> > =20
> >  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
> >  	fpc->chip.dev =3D &pdev->dev;
> > +	fpc->chip.can_sleep =3D true;
>=20
> As .apply() being callable in non-sleepable context only depends on
> .apply() I think a better place for this property is in struct pwm_ops.

What about drivers for devices that can be either sleeping or not? There
are things like regmap which can abstract those differences away, so you
could have a driver that works on both types of devices, so setting this
in ops wouldn't be correct all the time. I think can_sleep needs to be
per-chip rather than per-driver.

Thierry

--BBvlNbMNXcP/VVb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUf4SUACgkQ3SOs138+
s6Hgnw//ccRZMpPdmSrNh4HxesaeJ6IDlrZScm72UvWlvlUAATBRaIcrFiy1VnCC
WRKKcuPsxwg26Zy8KPZ2IijwVz1zNEQtEtOE53pVnCvcF3rcVBdIZlkPqJjO9Zcc
0azGAvZ4E9ExFnxycj1GpI475JXS2UkZ98rObXv53zzOVAxBdsyzhOWj9shXxPh5
d5tQj65dx5EtNFzmuo/lBfG/G8Xpqv5p8gXhWnv80xSdUcWHjhIGoJYVPrqtOXjC
dvedwv/bL55kMiymSn0oKln/X37KXdRxtHVaHXOCbGZ79kNxipW5x/+7Kuz95wTt
+JA5eClBpGErs/qCJ0JQmgo7H/0gG5CtUQPOMnWfbC5qxDO4ZL2eonCyIcV6JBEO
i/Scpl+4A24euVRkE1vyXNpihMm3svCEcbviq9aQ75UHL0cjGz9FHeGb0ACo1c6p
hSA4l+cuSY7dRgNMqcWrxkKDJNE0/hlK1LzcfxskL9jpGgvFfPbrUDKqKOQ0lDFA
fy8gReA/eA6E0jWgnbDpCs5wukqBFSXcodjz/L4POhL2dpE93MfLpFzAOQZipBD6
6FNT5jDjZC27gI000KEp5TTiPYEOiRocARTyBEQ7Rnq8UolMPGDxVEZilhRWhxzL
h8mjM8w60+lKYDG77xjN7M4cLEcOVRzxxVpjaJ0khqMaHxhZdlo=
=bA40
-----END PGP SIGNATURE-----

--BBvlNbMNXcP/VVb9--

--===============0910280118975190220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0910280118975190220==--
