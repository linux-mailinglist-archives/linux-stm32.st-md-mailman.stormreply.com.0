Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C15D3E3E99
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Aug 2021 06:00:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1558EC5719E;
	Mon,  9 Aug 2021 04:00:03 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F426C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Aug 2021 03:59:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id a20so15020447plm.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Aug 2021 20:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=huBmT+vdBjrwVWilCqXL6rx7BEc09+TQvNlDSLTvyYc=;
 b=o6+gPEDyHCHlsv0UWmII2zuXCO2LW5HGKNXARkp8ylVEyBip1wD+RFJIBaK5Ibq3E6
 cPYKgloC6oBDsotA9rbrUWaX+9Rc+IZI8Kvs0xtx/LoxaZA1vG1MBBn8crsZSefm3OMH
 p7NekJ5negQrpgKjweAolkTnLXH2vn/LJcK4R29JmnZfWBbmFzX5qSxH1mO3IwXNJAM6
 9bjUA3bZWQQX/tsyI5wcftqTWBF1lB6jI/F9+7mD3xhkZz5yRV3E93AK2PGLp4f6ezGp
 AIefgb+pnmGn0nSCfDLghi2vdfgr1zWwI4mJUeb8lkLxj68BRd0aWCAHVlxpFThoKR8g
 kxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=huBmT+vdBjrwVWilCqXL6rx7BEc09+TQvNlDSLTvyYc=;
 b=NhKqXPGs6WzJoFW4WWfuqbD4i82CglVeSM2gGAky1Uz8qnZe5m8WvMJPZEiSyPJGzK
 mLoU3+DCiU6hKtOLt6QY+CI4o0QowUC+y6TQ6yhKhH2BIYc4Zu0Dk76FqhhE7GoKbsP4
 1UHK2VhX49rFGoc86gTRnHsx0G7AkRXgbJhvlD5AymIhe5E4kGms4wlgHCYsC/ZR6SqG
 abmzuO6DjojCzT48J57LCYlMAj8t167pdKKXTDKnicDVMFA9ybDRUa1mexaslYcVxtG2
 HZLsYiE7znlLTdY+vOfQhYwqxJPu9TIBxy2XjpaSBFa8GUDJl7eK4vSONAtZbc+GLw9v
 Q6Dw==
X-Gm-Message-State: AOAM533iC0kwtdwoEFkZFVjjcqTaf3r7NRQrXJM5tnTKzBXdtydraFD0
 CpBVdCjBQSMcVD8SXgp7bJM=
X-Google-Smtp-Source: ABdhPJxUtculMvo1JuMsCJMNSb91gtHhTpWLPUuzRf3axe2sIXlYQQn1YEgipZJKnwPln7oSQWNvAg==
X-Received: by 2002:aa7:93b1:0:b029:3c0:a7b7:3db0 with SMTP id
 x17-20020aa793b10000b02903c0a7b73db0mr16353553pff.40.1628481598479; 
 Sun, 08 Aug 2021 20:59:58 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id n17sm20868257pgj.93.2021.08.08.20.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 20:59:57 -0700 (PDT)
Date: Mon, 9 Aug 2021 12:59:51 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YRCoN5YZhytejzFh@shinobu>
References: <cover.1627990337.git.vilhelm.gray@gmail.com>
 <2df092636a9eea5a3ddae1e9a6429e32b51284f7.1627990337.git.vilhelm.gray@gmail.com>
 <20210808182325.2620de00@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20210808182325.2620de00@jic23-huawei>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v14 06/17] counter: Internalize sysfs
	interface code
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
Content-Type: multipart/mixed; boundary="===============1759397293717887739=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1759397293717887739==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A01f2o0U0ch3O7vQ"
Content-Disposition: inline


--A01f2o0U0ch3O7vQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 08, 2021 at 06:23:25PM +0100, Jonathan Cameron wrote:
> On Tue,  3 Aug 2021 21:06:16 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > This is a reimplementation of the Generic Counter driver interface.
> > There are no modifications to the Counter subsystem userspace interface,
> > so existing userspace applications should continue to run seamlessly.
> >=20
> > The purpose of this patch is to internalize the sysfs interface code
> > among the various counter drivers into a shared module. Counter drivers
> > pass and take data natively (i.e. u8, u64, etc.) and the shared counter
> > module handles the translation between the sysfs interface and the
> > device drivers. This guarantees a standard userspace interface for all
> > counter drivers, and helps generalize the Generic Counter driver ABI in
> > order to support the Generic Counter chrdev interface (introduced in a
> > subsequent patch) without significant changes to the existing counter
> > drivers.
> >=20
> > Note, Counter device registration is the same as before: drivers
> > populate a struct counter_device with components and callbacks, then
> > pass the structure to the devm_counter_register function. However,
> > what's different now is how the Counter subsystem code handles this
> > registration internally.
> >=20
> > Whereas before callbacks would interact directly with sysfs data, this
> > interaction is now abstracted and instead callbacks interact with native
> > C data types. The counter_comp structure forms the basis for Counter
> > extensions.
> >=20
> > The counter-sysfs.c file contains the code to parse through the
> > counter_device structure and register the requested components and
> > extensions. Attributes are created and populated based on type, with
> > respective translation functions to handle the mapping between sysfs and
> > the counter driver callbacks.
> >=20
> > The translation performed for each attribute is straightforward: the
> > attribute type and data is parsed from the counter_attribute structure,
> > the respective counter driver read/write callback is called, and sysfs
> > I/O is handled before or after the driver read/write function is called.
>=20
> Hi William,
>=20
> There are some issues with this even after I've fixed the merge conflict
> because of the earlier change..
>=20
>  DESCEND objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   CC [M]  drivers/counter/counter-core.o
>   CC [M]  drivers/counter/counter-sysfs.o
>   CC [M]  drivers/counter/104-quad-8.o
>   CC [M]  drivers/counter/interrupt-cnt.o
>   CC [M]  drivers/counter/stm32-timer-cnt.o
>   CC [M]  drivers/counter/stm32-lptimer-cnt.o
> drivers/counter/counter-core.c: In function =E2=80=98counter_device_relea=
se=E2=80=99:
> drivers/counter/counter-core.c:23:9: error: implicit declaration of funct=
ion =E2=80=98counter_chrdev_remove=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>    23 |         counter_chrdev_remove(counter);
>       |         ^~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:271: drivers/counter/counter-core.o]=
 Error 1
> make[2]: *** Waiting for unfinished jobs....
>   CHECK   drivers/counter/interrupt-cnt.c
>   CHECK   drivers/counter/104-quad-8.c
>   CHECK   drivers/counter/counter-sysfs.c
> drivers/counter/stm32-timer-cnt.c:55:9: warning: implicit conversion from=
 =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_funct=
ion=E2=80=99 [-Wenum-conversion]
>    55 |         STM32_COUNT_SLAVE_MODE_DISABLED,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/counter/stm32-timer-cnt.c:56:9: warning: implicit conversion from=
 =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_funct=
ion=E2=80=99 [-Wenum-conversion]
>    56 |         STM32_COUNT_ENCODER_MODE_1,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/counter/stm32-timer-cnt.c:57:9: warning: implicit conversion from=
 =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_funct=
ion=E2=80=99 [-Wenum-conversion]
>    57 |         STM32_COUNT_ENCODER_MODE_2,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/counter/stm32-timer-cnt.c:58:9: warning: implicit conversion from=
 =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_funct=
ion=E2=80=99 [-Wenum-conversion]
>    58 |         STM32_COUNT_ENCODER_MODE_3,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/counter/stm32-timer-cnt.c: In function =E2=80=98stm32_count_funct=
ion_read=E2=80=99:
> drivers/counter/stm32-timer-cnt.c:97:27: warning: implicit conversion fro=
m =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_func=
tion=E2=80=99 [-Wenum-conversion]
>    97 |                 *function =3D STM32_COUNT_SLAVE_MODE_DISABLED;
>       |                           ^
> drivers/counter/stm32-timer-cnt.c:100:27: warning: implicit conversion fr=
om =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_fun=
ction=E2=80=99 [-Wenum-conversion]
>   100 |                 *function =3D STM32_COUNT_ENCODER_MODE_1;
>       |                           ^
> drivers/counter/stm32-timer-cnt.c:103:27: warning: implicit conversion fr=
om =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_fun=
ction=E2=80=99 [-Wenum-conversion]
>   103 |                 *function =3D STM32_COUNT_ENCODER_MODE_2;
>       |                           ^
> drivers/counter/stm32-timer-cnt.c:106:27: warning: implicit conversion fr=
om =E2=80=98enum stm32_count_function=E2=80=99 to =E2=80=98enum counter_fun=
ction=E2=80=99 [-Wenum-conversion]
>   106 |                 *function =3D STM32_COUNT_ENCODER_MODE_3;
>       |                           ^
> drivers/counter/stm32-lptimer-cnt.c:139:9: warning: implicit conversion f=
rom =E2=80=98enum stm32_lptim_cnt_function=E2=80=99 to =E2=80=98enum counte=
r_function=E2=80=99 [-Wenum-conversion]
>   139 |         STM32_LPTIM_COUNTER_INCREASE,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/counter/stm32-lptimer-cnt.c:140:9: warning: implicit conversion f=
rom =E2=80=98enum stm32_lptim_cnt_function=E2=80=99 to =E2=80=98enum counte=
r_function=E2=80=99 [-Wenum-conversion]
>   140 |         STM32_LPTIM_ENCODER_BOTH_EDGE,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/counter/stm32-lptimer-cnt.c: In function =E2=80=98stm32_lptim_cnt=
_function_read=E2=80=99:
> drivers/counter/stm32-lptimer-cnt.c:195:27: warning: implicit conversion =
=66rom =E2=80=98enum stm32_lptim_cnt_function=E2=80=99 to =E2=80=98enum cou=
nter_function=E2=80=99 [-Wenum-conversion]
>   195 |                 *function =3D STM32_LPTIM_COUNTER_INCREASE;
>       |                           ^
> drivers/counter/stm32-lptimer-cnt.c:200:27: warning: implicit conversion =
=66rom =E2=80=98enum stm32_lptim_cnt_function=E2=80=99 to =E2=80=98enum cou=
nter_function=E2=80=99 [-Wenum-conversion]
>   200 |                 *function =3D STM32_LPTIM_ENCODER_BOTH_EDGE;
>       |                           ^
> drivers/counter/104-quad-8.c:58: warning: Function parameter or member 'l=
ock' not described in 'quad8'
>   CHECK   drivers/counter/stm32-timer-cnt.c
>   CHECK   drivers/counter/stm32-lptimer-cnt.c
> make[1]: *** [scripts/Makefile.build:514: drivers/counter] Error 2
> make: *** [Makefile:1841: drivers] Error 2
>=20
> I could wait through these but it feels a little to likely I'll mess some=
thing up fixing things
> so please fix the errors and warnings this patch introduces
> with a W=3D1 C=3D1 build.
>=20
> Also, do a patch by patch build of the rest of the set in case there are =
any other cases
> like this hiding.  It's very easy for these to build up when you have a l=
ot of
> versions of a patch series.  I've been caught out a few times myself!
>=20
> In the meantime, I'll keep the first 5 patches on my tree unless you shou=
t otherwise.
>=20
> Thanks,
>=20
> Jonathan

Thanks,

I'll fix this up and submit a v15 to make sure these patches merge in
smoothly.

William Breathitt Gray

--A01f2o0U0ch3O7vQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmEQqC0ACgkQhvpINdm7
VJJKJBAAo3tu1brn+JfHvWL6H/3fa81diaOZ68AbGEP6Khs2Tv+DimgXDZjfkcwC
piMWD2t4wI6Px6ny6fIR83VQLRWAyT01yOjt4NZAJEP+1eJYsIifBASDS2C7pRbw
ewqC7YPqJGdRleJanoHtotD9N5QmpJsB38ieNYZbueRTe6A5CrkFd7j0A0ss5ZbM
vJEc8XtLfT2srddRjCfRawIA/2nMS4Wy1NwmJpBC84QYDYpIbTecVXREa9+N21iS
xVCdaBcW/wPIJVryQ0PEHYsJRhehZhVTWkDRUJu7lkpVKtYxGw9dR5tN8ZpYk7ih
Sxznei2mOEs3R3PxlidV/kgWma7ePSd9XTqeKXuMxkHyESR/+rRu7eoS++ElrBOW
NXDUkQiWC8VlNS5FJ6BWwwG2XXGIZJMhPfBCQdFwGsA2gMlVIuWa/GE1JHtxQS9A
xVxh0+uFUx6IyxXu5Wm6TGkONa3OLXDiTOLZGFmuNrkQ0OFqvSbf3WZXD4wDYn4K
X1o1MXTvvGC+1RWuL82FcaES5KwqRuFN5gSDjLwl7LFoyAkM8CDDV7Teac3bGwQm
do7IrRThaLnCe2rkuibqtyD0mv8eYsJG/+V2efQ25N8cI4CHIP3U2J/XlGsEhoii
aJ69LM9ysoeuVeEgdG/7MZ9TghxE8frfsmnzE3zEVUkPE8Kb6Hk=
=2iHg
-----END PGP SIGNATURE-----

--A01f2o0U0ch3O7vQ--

--===============1759397293717887739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1759397293717887739==--
