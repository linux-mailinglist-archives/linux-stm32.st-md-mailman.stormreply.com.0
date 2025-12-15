Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4EACBD2BE
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 10:32:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B774C35E2B;
	Mon, 15 Dec 2025 09:32:22 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F02EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 09:32:21 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6499159273dso3903574a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 01:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765791140; x=1766395940;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pMgRQp2NAuNDw0Pr8DKsFpJ1DQmsliJUNJj+b1nHdRA=;
 b=Pu1WZkQmBzMPeomfd6nWqt4ZyJ0NMBkOeAJ6VLX2GeEAl1/WuDFITOZgBM3THFVPDI
 kplaAqWmUuHSisLd1YwAgmg8idDB+ytbosMqO5kRrkhl2vnWGaAnH5NH2jEpmXbjsKTu
 IRNHntFHgSMdruIwQUzDw/BHWmEo0hYxO/r40IQDQuI82toXSWPh1Cc5mc5MZx7b1yNG
 BqgxR4ZeRTBlxvgKAYsMeUNZ2h0QMbpIy1fQn3sHKY2OJVuz7mgXLLA5ZMRt4ZdxnLZE
 qF7I9nFbTkkrPcqbKV7LSVwJd2JzL94vROYFnDQ1bGIJ3kIx79MpF9a60COkQO47fjXZ
 RuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765791140; x=1766395940;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMgRQp2NAuNDw0Pr8DKsFpJ1DQmsliJUNJj+b1nHdRA=;
 b=ETtIvajSMapx0PWrf52hwSR60X6Dt03b56CJimYWN2LurCaxn/X149rQoDx6lpwwAk
 91EQEV6PBShm201s2g8YPzUSxSBj5ToYo1gLiSSnyXEv7JGlu6qClIuaqBCyurmSLIMo
 U74QGkRgoWdtiDDOC0g71Iw61M9NNZ5YLSF3oD2kXa/LHSEt2qxVrIBXFFCiMXzWN9eq
 ay2ElMJ+6/wJEk8gK9F2qksB1lySlTG97y7NTgfuxvlmEmxiiG5rYWcS8/OZdRtsE9uW
 PN2o2SNfwtTro1XQHTnCWX2tELgIlrLak9fWuXVLv6K0uJtbQ9oAfIF8FXRxZTbUvFiT
 sGwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVQu9J3rx9M9gpxfQpfQ7q1oZyKtdd65OfD3Y/CZ0IEm5TEN3xz2QOG3PelAOcIvwKu9Zqq89iZIpZgw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyz0uSGtpY0RQrtvw9P0sABx2uW0Uc9fNPmGq7hEK+WSnOkP5r0
 2JFcArsNQ9zxGWV6VW96MRrIXpre/7bjCcowEhY734SKQyrLmQs0i5IkGljYr3ApEEI=
X-Gm-Gg: AY/fxX65AyxLTUdOY3/feY8Wp+MgxOnrhLBL4EW62MEVi/DT2aQ41IuXKHs1qLtZzb0
 xKpwZPnTOektUdiLrTuc2fWIF36N4QiXIIJgnI9nyMJnOLgINIA191LMYKsnY7TyZ2qyl3ZCSSa
 R3fAFkw7JEDPPdGgCOdzIPJ7dKEu29ilGo1vHcbghWPtY0M2BhF+h0Yo0ZyV/WuPj0YXObbjTZH
 hS7vCzkBgAACAEnh7+jQHmex+B1t3Wxz8BUunxIfDKU0+s3r1Uayx9gjtufV/gu6ggGcnnMqp9s
 EP9/7dkWbbt3l+bZH8Iicyir+qJlRQx6yruHNTKdgTobYWRwoLoCBHlBU1sXWIzee28UzgF3sKU
 IK9HJTLfOFud26vwfKa+uWKK9zE3f4EGjeFQrGdRkRmzuNDz5//XsBWSCCV72N3Y+wNlmZjTo1K
 e+XWT2qJ6kLZZAcRH6FyWSnrrwigJMAFycV5kUc0R3aNdSoFhBg+zmai7mu005xJgbHQ5L+uZGl
 B0=
X-Google-Smtp-Source: AGHT+IEaCg0quo15SNx/nGnta9oq72ocRWkg5l3SHsMTaK2wohhdkzDoQR/uDt0uWt8Scz8Vq184Fw==
X-Received: by 2002:a17:907:1c0b:b0:b7a:1be1:984 with SMTP id
 a640c23a62f3a-b7d23a912c7mr930197866b.64.1765791140272; 
 Mon, 15 Dec 2025 01:32:20 -0800 (PST)
Received: from localhost
 (p200300f65f006608181e6e27368f7e86.dip0.t-ipconnect.de.
 [2003:f6:5f00:6608:181e:6e27:368f:7e86])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b7cfa56a7f9sm1329836266b.51.2025.12.15.01.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:32:19 -0800 (PST)
Date: Mon, 15 Dec 2025 10:32:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Garg <sumit.garg@kernel.org>
Message-ID: <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1>
MIME-Version: 1.0
In-Reply-To: <aT--ox375kg2Mzh-@sumit-X1>
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
Content-Type: multipart/mixed; boundary="===============6898308394212395835=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6898308394212395835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yi4htjinth7u7w6q"
Content-Disposition: inline


--yi4htjinth7u7w6q
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver
 callbacks
MIME-Version: 1.0

Hello Sumit,

On Mon, Dec 15, 2025 at 04:54:11PM +0900, Sumit Garg wrote:
> On Thu, Dec 11, 2025 at 06:14:54PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > the objective of this series is to make tee driver stop using callbacks
> > in struct device_driver. These were superseded by bus methods in 2006
> > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > methods.")) but nobody cared to convert all subsystems accordingly.
> >=20
> > Here the tee drivers are converted. The first commit is somewhat
> > unrelated, but simplifies the conversion (and the drivers). It
> > introduces driver registration helpers that care about setting the bus
> > and owner. (The latter is missing in all drivers, so by using these
> > helpers the drivers become more correct.)
> >=20
> > The patches #4 - #17 depend on the first two, so if they should be
> > applied to their respective subsystem trees these must contain the first
> > two patches first.
>=20
> Thanks Uwe for your efforts to clean up the boilerplate code for TEE bus
> drivers.

Thanks for your feedback. I will prepare a v2 and address your comments
(whitespace issues and wrong callback in the shutdown method).

> > Note that after patch #2 is applied, unconverted drivers provoke a
> > warning in driver_register(), so it would be good for the user
> > experience if the whole series goes in during a single merge window.
>=20
> +1
>=20
> I suggest the whole series goes via the Jens tree since there shouldn't
> be any chances for conflict here.
>=20
> > So
> > I guess an immutable branch containing the frist three patches that can
> > be merged into the other subsystem trees would be sensible.
> >=20
> > After all patches are applied, tee_bus_type can be made private to
> > drivers/tee as it's not used in other places any more.
> >=20
>=20
> Feel free to make the tee_bus_type private as the last patch in the series
> such that any followup driver follows this clean approach.

There is a bit more to do for that than I'm willing to invest. With my
patch series applied `tee_bus_type` is still used in
drivers/tee/optee/device.c and drivers/tee/tee_core.c. Maybe it's
sensible to merge these two files into a single one.

The things I wonder about additionally are:

 - if CONFIG_OPTEE=3Dn and CONFIG_TEE=3Dy|m the tee bus is only used for
   drivers but not devices.

 - optee_register_device() calls device_create_file() on
   &optee_device->dev after device_register(&optee_device->dev).
   (Attention half-knowledge!) I think device_create_file() should not
   be called on an already registered device (or you have to send a
   uevent afterwards). This should probably use type attribute groups.
   (Or the need_supplicant attribute should be dropped as it isn't very
   useful. This would maybe be considered an ABI change however.)

 - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister all
   optee devices in its error path (optee_unregister_devices())?

Best regards
Uwe

--yi4htjinth7u7w6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmk/1ZQACgkQj4D7WH0S
/k5/qQf+NMGu64faecGn5WH+D12Iy/zqcfwRwh4Jv5/z/9n8f9SRKuXtH6kM3hvA
3qOp/DbN1aDIomzFdgcPUq9OJEeC51ry33uJW7UWHl5lUk4UawAR28vX/1R3nV7t
tz6suQjR2YkY2a/sAxZTSKZZ/A6RTGDxePvozHzuElCmEYDDbNhZpHsvgsLqs3T+
Cso9zyEM2is8g673w2FcAnlW3JL/8jKClvZfcm9JEIRlx48uP6uCqbWeRcYS3rrt
JBUGmWSMNEfYbD3cQbhybixsTPLzfKqkGrbJSyVRkJ2AUAQuRS14sbv7uSGhFw3B
QWGugzTdTxcSdC0SqkOUZrCXgVUKmA==
=VNEB
-----END PGP SIGNATURE-----

--yi4htjinth7u7w6q--

--===============6898308394212395835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6898308394212395835==--
