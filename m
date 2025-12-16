Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD843CC2135
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 12:08:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8108DC87EDC;
	Tue, 16 Dec 2025 11:08:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA04CC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 11:08:41 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4779a637712so29871185e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765883321; x=1766488121;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JzbZNSoR9XV7c/fw2WEyAJLfwBQw/kZL/Ydt6MIWYlk=;
 b=hvBUjLFlOyr/UvoHpyU/iNJIDrYW87W4W6q+2MQnEK1ug/TnXkjXsMCUOw7MoKHN1o
 HZM13nqgFukUzhsixs1ZJBhHozexkogyRMijofYten5dv1dGesAVXZAe4l3DAOhbYcgM
 /KIITYtdlJbK95PknCLWXdMLHeipeOtIcOU9DC+ixr5P34wloF3nPG3t5+pjXE86IdD4
 fw5Rs85S5QhGhykVs1Htntpi0FSPR3yjMlWS+U4yDa1jYt5Oi3bjcWm4EdZxI1zgyw8r
 b7MHfBEJD4WeM6mCMrbYYUScMdnq9pROcf9P+KLJi8NeNIzebwErTonY5durVkSawmg6
 jilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765883321; x=1766488121;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JzbZNSoR9XV7c/fw2WEyAJLfwBQw/kZL/Ydt6MIWYlk=;
 b=kNzZUzdDx3hcvBnR+UbjUYCh6arfEyA/JByiy+T0a7VpdnEz+9CPKZRlETYkVm6dbo
 l5mpDbYKL213bsr7tMqPSXDxE3xYJrkS8gtX20Ld7mRhdSA/ghphhKNk1ztmgqkHbtvo
 JPJ2x620drm+4wr7xk96vuUqmS5eBCdKr1XTSpe1GkWQQAX7HhJitR4u12n0YQqbDLuC
 jXWcE7lapdJazOqjS6b4kZK8LXCB6/9FwdXcLrudH2mFZsNC2/y1RtO+8lZErN72FuvC
 K/iuHL0GEROWEnbxMyKDbwQkxfKyrdIyQtoSjEFvFyOJz8PtphZMlRyOJef2miovMxl3
 ACnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNNhfmsA2QaFmuPGR6T2GjPRUXodD33JyYDycrOvKwMI+RWdMDobCuDwDuLEeqbb6FzSF160MSsBV1hA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyRErGtWYLqegkeViVPhRUpEAoaGDccX3tMpfqABPxG6vn40I8b
 /XLdkhQMvVER28MjWiSfWU8hf6Ty0VpkUTSF8omqKHiWPxiV9N9gcH0xoVeph67NNaM=
X-Gm-Gg: AY/fxX6abpPYvuOmVNE6engBLYHCOnK4CZB9Ao/o9IO4BJKco3ELFVJEXQNemTYc2BE
 5pr+9ufae1Z+gTdApIdKkc6anXCLRFAWeKGL1GAErcwLYc65zuQRTu8wzkjzatY3KqEMziZ8VBM
 XU+iyUtuDlIcBKJoI9/5nO+rIqeVcjryLR73eDe3Xuanf6loP8rSfx559doQOh9LWMg8e9U6IHW
 auKRM7Upwh1qODNc2/i8q+I2RzMRmNt532TDBCxJpekEzD2OZ938RLPtK0+0uH34A6+4xsjRw+5
 mZmBGJGNWFijYMrWPHUqFxpYfK1qAOb6WKKevADymxFtfCwIinY13N39i2pjdKewiYylr2iPKVz
 EMctYW8q6vMJcCBdygoBFl6o5ktJIMk8YThyTkZDaiyEBBzPZF14DLa+lF8aCiIbDxh1rXTHtPe
 yCKIsifgP8c4LSUh91UAi4k/89tjvG+ZQON7X/TQia6o6EXUsvTeJ6+KVIhnJPhcoOV5vj6h/qf
 x0=
X-Google-Smtp-Source: AGHT+IFp5IncMGvMC+pwiacOOoEIbditx6SKu86limMmxyrWyAZX1pq9RrgklnX8yEKbt8tmwVfkyQ==
X-Received: by 2002:a05:600c:8288:b0:477:a1a2:d829 with SMTP id
 5b1f17b1804b1-47a8f8c0caamr134941025e9.13.1765883320955; 
 Tue, 16 Dec 2025 03:08:40 -0800 (PST)
Received: from localhost
 (p200300f65f00660852dfbbf029d2e03c.dip0.t-ipconnect.de.
 [2003:f6:5f00:6608:52df:bbf0:29d2:e03c])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47a8f4ace61sm233401395e9.7.2025.12.16.03.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 03:08:40 -0800 (PST)
Date: Tue, 16 Dec 2025 12:08:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>
Message-ID: <ayebinxqpcnl7hpa35ytrudiy7j75u5bdk3enlirkp5pevppeg@6mx6a5fwymwf>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
 <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
 <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Peter Huewe <peterhuewe@gmx.de>, Ard Biesheuvel <ardb@kernel.org>,
 linux-rtc@vger.kernel.org, linux-security-module@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 James Morris <jmorris@namei.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Cristian Marussi <cristian.marussi@arm.com>,
 arm-scmi@vger.kernel.org,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, op-tee@lists.trustedfirmware.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sumit Garg <sumit.garg@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 Paul Moore <paul@paul-moore.com>,
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
Content-Type: multipart/mixed; boundary="===============5607567163280151998=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5607567163280151998==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="judjbtjlccebrcda"
Content-Disposition: inline


--judjbtjlccebrcda
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
MIME-Version: 1.0

Hello,

On Tue, Dec 16, 2025 at 01:08:38PM +0530, Sumit Garg wrote:
> On Mon, Dec 15, 2025 at 3:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> wrote:
> > On Mon, Dec 15, 2025 at 04:54:11PM +0900, Sumit Garg wrote:
> > > Feel free to make the tee_bus_type private as the last patch in the s=
eries
> > > such that any followup driver follows this clean approach.
> >
> > There is a bit more to do for that than I'm willing to invest. With my
> > patch series applied `tee_bus_type` is still used in
> > drivers/tee/optee/device.c and drivers/tee/tee_core.c.
>=20
> Oh I see, I guess we need to come with some helpers around device
> register/unregister from TEE subsystem as well. Let's plan that for a
> followup patch-set, I don't want this patch-set to be bloated more.

Don't consider me in for that. But it sounds like a nice addition.

> > Maybe it's
> > sensible to merge these two files into a single one.
>=20
> It's not possible as the design for TEE bus is to have TEE
> implementation drivers like OP-TEE, AMD-TEE, TS-TEE, QTEE and so on to
> register devices on the bus.

So only OP-TEE uses the bus for devices and the other *-TEE don't. Also
sounds like something worth to be fixed.

> > The things I wonder about additionally are:
> >
> >  - if CONFIG_OPTEE=3Dn and CONFIG_TEE=3Dy|m the tee bus is only used for
> >    drivers but not devices.
>=20
> Yeah since the devices are rather added by the TEE implementation driver.
>=20
> >
> >  - optee_register_device() calls device_create_file() on
> >    &optee_device->dev after device_register(&optee_device->dev).
> >    (Attention half-knowledge!) I think device_create_file() should not
> >    be called on an already registered device (or you have to send a
> >    uevent afterwards). This should probably use type attribute groups.
> >    (Or the need_supplicant attribute should be dropped as it isn't very
> >    useful. This would maybe be considered an ABI change however.)
>=20
> The reasoning for this attribute should be explained by commit:
> 7269cba53d90 ("tee: optee: Fix supplicant based device enumeration").
> In summary it's due to a weird dependency for devices we have with the
> user-space daemon: tee-supplicant.

=46rom reading that once I don't understand it. (But no need to explain
:-)

Still the file should better be added before device_add() is called.

> >  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister all
> >    optee devices in its error path (optee_unregister_devices())?
>=20
> This is mostly to take care of if any device got registered before the
> failure occured. Let me know if you have a better way to address that.

Without understanding the tee stuff, I'd say: Don't bother and only undo
the things that probe did before the failure.

Best regards
Uwe

--judjbtjlccebrcda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlBPbMACgkQj4D7WH0S
/k50zggAsVQDsAnPdX//uyplsEvssm5818ssVGID4+9TjkXIhLGs1HOk+Aj1Obfh
3kp723jXSfcxla/GVnutv+SGgjCbWQLat1zF3XNhzFZBDegNnPHffiYotY4NYV+x
z+cBC6Mgx1s9c5xNg134fGOJ+TxBlfUxarnCrkXKqWF+dVSwTe5Cv3f0SXlVU/7L
l/3T0OflRgILL2Y6wod6E9ydmYfiSapc79eKAzVY5jnUx1sGt7oLNYrjpHmJklBF
J4I7ToK96aPowluUQqNPzlS13OTb/sx00zg5CnrrGchqVR6i1kK71xhoszfQPcx5
IOs/eRzJsAmcF/JiN04ZsRRMrAvppA==
=QAXr
-----END PGP SIGNATURE-----

--judjbtjlccebrcda--

--===============5607567163280151998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5607567163280151998==--
