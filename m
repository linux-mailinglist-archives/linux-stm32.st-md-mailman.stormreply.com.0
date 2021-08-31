Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 057943FCA6E
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Aug 2021 16:56:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A21DDC57B7A;
	Tue, 31 Aug 2021 14:56:03 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 881A4C5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 14:56:02 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 7so15146444pfl.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RNp457MB/vxzZEKURYpzK+PHbxVwBG4M79IfgemcDRc=;
 b=eDsC58O1F1Nbv6+V1Y+NmGiEg8L5nkeOfNp4pqRuRjW5yD2qP/D438x3rsBdqHp+Ne
 mYQ/J3/KTItVLEzfPnLOrzVA8PhmXuHLWRPKC3w2FAM36tA5ewbByMTkDuAgYw2fQbd4
 uAfNEmItehTal7iBkNM2BRB7DIEmV3hjSt8wd1lfIGyoz7R0CqCEJOyuqq4yCnxDRi0N
 DApe4eCo/ZmMhhlCAUAsifJjSATsOn+aROaN6EixUPgU/lMY5YqK9kauVzQ5ORW3QEoW
 Ogt4DRQRFOVR+Cajo37IbcJKB0JXivAge9CaLFNZiIVYvEanhlmrVdiSaUD0j8tY/GmI
 MCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RNp457MB/vxzZEKURYpzK+PHbxVwBG4M79IfgemcDRc=;
 b=nUzkjyzFzhKDVjPI+ZcInmKCprGJ6EdfYNpEOUpLCx8Zn22NfTkdbGoxiS+oPIRvvy
 9a30N8Z1CSY/Z7Fu28g36LL0BXwCz8lNn9L/0iaVSmMZYUB4cs3VCgfxuoA7xfmSGzBx
 XqyHQaW6SpKMcj8W8o0Q7gTiBxTk7hUZX0u9hFYfEUUn+5CnJLpg11rLugXnLJNs5wLK
 0TkP4bEaLWZ5yqqnjRyNTdZk6FSvG05yY+2XX05L6jN2wnrDNf4d4l7tv+k2bXED2lJ4
 r/EoW1T9SlSMEpJL+s0/n5NIfTW/SMbgJqNciI8QLFL9Y90/ipZJMlvwfQgJniklJCQ6
 FdfQ==
X-Gm-Message-State: AOAM530WTQZGlHJY6UUVLrGLfulfiXk9O8slLgSXcmP/WkUf9sn/Lnb9
 X5tmBw54Cp6FeT85Wbq8moM=
X-Google-Smtp-Source: ABdhPJz6KuDG5RnjA5Rj0MKW+mijQXIj5E4Xtn0IdEcRtNDO4gG1DjkmYZUvENNfmmXrcxL4yaIB7g==
X-Received: by 2002:a63:230f:: with SMTP id j15mr939761pgj.9.1630421761139;
 Tue, 31 Aug 2021 07:56:01 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id z17sm10544496pfa.125.2021.08.31.07.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 07:56:00 -0700 (PDT)
Date: Tue, 31 Aug 2021 23:55:53 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YS5C+cr1TRhqkCkU@shinobu>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
 <c68b4a1ffb195c1a2f65e8dd5ad7b7c14e79c6ef.1630031207.git.vilhelm.gray@gmail.com>
 <fcff44a7-5ac2-a510-ee9b-85ef7e2e29ef@foss.st.com>
 <YS452wJ+IHs9R0FC@shinobu>
MIME-Version: 1.0
In-Reply-To: <YS452wJ+IHs9R0FC@shinobu>
Cc: linux-arm-kernel@lists.infradead.org, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com,
 Dan Carpenter <dan.carpenter@oracle.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com, kernel@pengutronix.de,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v16 03/14] counter: Internalize sysfs
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
Content-Type: multipart/mixed; boundary="===============6674987801817218919=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6674987801817218919==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Eu0c7fx1a/C8FgI+"
Content-Disposition: inline


--Eu0c7fx1a/C8FgI+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 31, 2021 at 11:16:59PM +0900, William Breathitt Gray wrote:
> On Tue, Aug 31, 2021 at 03:44:04PM +0200, Fabrice Gasnier wrote:
> > On 8/27/21 5:47 AM, William Breathitt Gray wrote:
> > > This is a reimplementation of the Generic Counter driver interface.
> > > There are no modifications to the Counter subsystem userspace interfa=
ce,
> > > so existing userspace applications should continue to run seamlessly.
> > >=20
> > > The purpose of this patch is to internalize the sysfs interface code
> > > among the various counter drivers into a shared module. Counter drive=
rs
> > > pass and take data natively (i.e. u8, u64, etc.) and the shared count=
er
> > > module handles the translation between the sysfs interface and the
> > > device drivers. This guarantees a standard userspace interface for all
> > > counter drivers, and helps generalize the Generic Counter driver ABI =
in
> > > order to support the Generic Counter chrdev interface (introduced in a
> > > subsequent patch) without significant changes to the existing counter
> > > drivers.
> > >=20
> > > Note, Counter device registration is the same as before: drivers
> > > populate a struct counter_device with components and callbacks, then
> > > pass the structure to the devm_counter_register function. However,
> > > what's different now is how the Counter subsystem code handles this
> > > registration internally.
> > >=20
> > > Whereas before callbacks would interact directly with sysfs data, this
> > > interaction is now abstracted and instead callbacks interact with nat=
ive
> > > C data types. The counter_comp structure forms the basis for Counter
> > > extensions.
> > >=20
> > > The counter-sysfs.c file contains the code to parse through the
> > > counter_device structure and register the requested components and
> > > extensions. Attributes are created and populated based on type, with
> > > respective translation functions to handle the mapping between sysfs =
and
> > > the counter driver callbacks.
> > >=20
> > > The translation performed for each attribute is straightforward: the
> > > attribute type and data is parsed from the counter_attribute structur=
e,
> > > the respective counter driver read/write callback is called, and sysfs
> > > I/O is handled before or after the driver read/write function is call=
ed.
> > >=20
> > > Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > Cc: Patrick Havelange <patrick.havelange@essensium.com>
> > > Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > > Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Alexandre Torgue <alexandre.torgue@st.com>
> > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
> > > Reviewed-by: David Lechner <david@lechnology.com>
> > > Tested-by: David Lechner <david@lechnology.com>
> > > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > > ---
> > >  MAINTAINERS                             |    1 -
> > >  drivers/counter/104-quad-8.c            |  449 +++----
> > >  drivers/counter/Makefile                |    1 +
> > >  drivers/counter/counter-core.c          |  142 +++
> > >  drivers/counter/counter-sysfs.c         |  849 +++++++++++++
> > >  drivers/counter/counter-sysfs.h         |   13 +
> > >  drivers/counter/counter.c               | 1496 ---------------------=
--
> > >  drivers/counter/ftm-quaddec.c           |   60 +-
> > >  drivers/counter/intel-qep.c             |  144 +--
> > >  drivers/counter/interrupt-cnt.c         |   62 +-
> > >  drivers/counter/microchip-tcb-capture.c |   91 +-
> > >  drivers/counter/stm32-lptimer-cnt.c     |  212 ++--
> > >  drivers/counter/stm32-timer-cnt.c       |  179 ++-
> > >  drivers/counter/ti-eqep.c               |  180 +--
> > >  include/linux/counter.h                 |  658 +++++-----
> > >  include/linux/counter_enum.h            |   45 -
> > >  16 files changed, 1949 insertions(+), 2633 deletions(-)
> > >  create mode 100644 drivers/counter/counter-core.c
> > >  create mode 100644 drivers/counter/counter-sysfs.c
> > >  create mode 100644 drivers/counter/counter-sysfs.h
> > >  delete mode 100644 drivers/counter/counter.c
> > >  delete mode 100644 include/linux/counter_enum.h
> > >=20
> >=20
> > Hi William,
> >=20
> > For the STM32 drivers, you can add my:
> > Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> >=20
> > Thanks,
> > Fabrice
>=20
> Hello Fabrice,
>=20
> I noticed the stm32-lptimer-cnt.c function_write() and action_write()
> callbacks do not appear to write the desired function/action
> configuration to the device. Would you check whether the device actually
> supports this functionality or if these callbacks should be removed from
> this driver.
>=20
> Thanks,
>=20
> William Breathitt Gray

Nevermind, I see that these configurations are sent to the device via
stm32_lptim_setup() when the counter is enabled. So that setup should be
fine after all.

Thanks,

William Breathitt Gray

--Eu0c7fx1a/C8FgI+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmEuQssACgkQhvpINdm7
VJKk7xAAle4yE4cmZdHYt/2PVJ1C5dMMRKmZ3HFyB8zckzEqpV1ElqkAGevVyYSw
Vf3dKfMeCy+eOGMoOs2f5VFrSwJkqCZMx1RmdRdPZbcUu8kupH/709oaSUZ7UEeK
T/oMcnoezNeyLkiqHE7Rvln/huzcoc0pJgtDOjTI1ZsAtr7ft0X/dzAF4rxMABgh
nQ1vRTze7+K+ArLAWHZ3dC2b/j+MJN4Z3OoOk0Y2R1vB8aM+Jam2Q8b+QgBFKOyH
O7wSx8kCRBYzwGQLlEYqJgUwJKfy1E6fzX3/k16esbEKrbXSvZhFTLtPXc9QvTY5
rHoK4FQZC42vxMq5qeGY2/P4liItgmUPGuK9yk/7uDH5N8VTi4KW1tvv4k1mfe6D
RsEsBF0D3m2bek0tyo+jfvp4uPF092aY7JAqxjSLkgJphkXtztol3+bFoff/H6Je
JaSsyqgFXfrXkjmXPQNCzHub4y1lTL/uawB6UdaXC9UiBc5GB14t7LspagHF3qHc
zWIRT5I6TLoUsoV0fqLWiA+JLgmbOizzCUFxwIeOD3YfBsMT8ntBj5YJc9CEKEAA
gdjKV0CEFyCtxeddec/wTHdMX/WzMctyfEo1ePgNKTxIyBh9Xe3Z2jAeng4tlpx8
DDztX70QETwxRwXtOHRc61VJscixJ+lKhwqE9NGpvn4o9YAvI6o=
=gyQI
-----END PGP SIGNATURE-----

--Eu0c7fx1a/C8FgI+--

--===============6674987801817218919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6674987801817218919==--
