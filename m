Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FC53A172E
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 16:26:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D982C58D58;
	Wed,  9 Jun 2021 14:26:20 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7765FC57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 14:26:17 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id k5so1446626pjj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Jun 2021 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hp5U48n4wg9mZ0AYRVRn+zgfrqRQSHiITR3eP7pEJMg=;
 b=bs9FGwM1j7QUlNYWptvyG6/EezinJo5RlgC44qFmqjqP+qFgx1Jl1TXJRcfraB4I9c
 WdCiV6OkuU50XRwsGHCjfO1VSlNZKkCqfJvwauma5L0Dq3E+0KNDgEtU0H9pyBwSIsg1
 ccbQeuaqmqxyeQZhBeQVe3iFe4dgQ8NNqmkgM8o+IoL6GGkS8BtIw4yhsIZgIRzPaXvA
 0c3RStQ+XQLXnSYyKaU5IcxqQabqCHJs/fa0fOEEzKC4GS3w1wxGHDm84VJw6G+8dHuX
 A2xGfue8uihkueL4RxhN2XFKWvH4idOuuc0ORi6mCkNB5mW5Hf6LW81L5cYvGpfZMguC
 kjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hp5U48n4wg9mZ0AYRVRn+zgfrqRQSHiITR3eP7pEJMg=;
 b=aulHPK5O5nZZsmeGgz+9xUnALJCOJE+4Uez8VhDwyqLaV+zm8uAkJdpzbMMNzMH3bw
 934K3vuMYxI+pHqLUyJhC5VZXGfAkZ+56cR7CuAmYJHbGP86sG87KvEY7WraMc5G9tIj
 EaZd2O0h74omUBzZctakNNKoKC6ChesBvv/e9ifalLI4nyzj8hGclNZC0TsU1Ercto3B
 5R68lK9DOUaNtADTLSgLSxehlzaktvrPrwgiUOee9t1DZGTRhVoLQiJ48GMT43k0CeV+
 Les94H3FqC9vrTlr23gqNhl5ern9oVFBI/vtlWt0iUjZuusASJUChO88f7WvoayG/a5x
 O1UA==
X-Gm-Message-State: AOAM533XtGtMZjspHKQuvn9Q00oZv6RLVX9QWzYOqtOo+oB3EdftQVMy
 qjC39Twee/Fzn1lhuThMnVo=
X-Google-Smtp-Source: ABdhPJzpJsV/R5ZXCR2Bzf4vXC4Otslvg433qXauhn4Nd1J36dS84pYzA04daAmtODElupg5m/16Zg==
X-Received: by 2002:a17:90b:1d02:: with SMTP id
 on2mr10851104pjb.128.1623248775940; 
 Wed, 09 Jun 2021 07:26:15 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id s29sm39329pgm.82.2021.06.09.07.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:26:15 -0700 (PDT)
Date: Wed, 9 Jun 2021 23:26:08 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Message-ID: <YMDPgGHRP/rUTBAm@shinobu>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
 <20210609145951.000005dd@Huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210609145951.000005dd@Huawei.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v11 00/33] Introduce the Counter character
 device interface
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
Content-Type: multipart/mixed; boundary="===============1029297291844060594=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1029297291844060594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1vaXBG1dwQTa2gEo"
Content-Disposition: inline


--1vaXBG1dwQTa2gEo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 02:59:51PM +0100, Jonathan Cameron wrote:
> On Wed,  9 Jun 2021 10:31:03 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > Changes in v11:
> >  - Migrated Intel QEP to new interface
> >  - Context adjustments made for documentation
> >=20
> > I pulled out a lot of bits and pieces to their own patches; hopefully
> > that makes reviewing this patchset much simpler than before. This
> > patchset is also available on my personal public git repo for anyone who
> > wants a quick way to clone:
> > https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v11
> >=20
> > The patches preceding "counter: Internalize sysfs interface code" are
> > primarily cleanup and fixes that can be picked up and applied now to the
> > IIO tree if so desired. The "counter: Internalize sysfs interface code"
> > patch as well may be considered for pickup because it is relatively safe
> > and makes no changes to the userspace interface.
>=20
> Let us aim to do that in the interests of cutting down on the volume for =
future
> versions!
>=20
> However, it is made tricky by the fact patch 22 hasn't made it to me or
> lore.kernel.org.  Could you send that one again.  Hopefully the in-reply-=
to
> will ensure it's correctly threaded.
>=20
> Jonathan

I think patch 22 just took a while to be processed by the servers
because of its size; I went ahead and submitted a RESEND of it
regardless just in case. You should be able to access both on
lore.kernel.org:

https://lore.kernel.org/lkml/87dec6c889e40068ed27cbb3e66a6376856e2267.16232=
01082.git.vilhelm.gray@gmail.com/
https://lore.kernel.org/lkml/20210609141145.Ci-kBe7zxq4hPKS98nEi0JK7WOv0DHL=
OIm8pmrIDvVY@z/

Let me know if you encounter any other problems.

William Breathitt Gray

--1vaXBG1dwQTa2gEo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDAz4AACgkQhvpINdm7
VJKzUw/9HA1egC/vNivHLayOweGIxZCvXJaAlFM32hu+mSsfgpz/ghluquiCWNQZ
y2+70dUOmATlZn3YQaUKxmo1nrXJxbemSt9oh8u4Drtu5rrnUbYsMFL7vS4pWknX
LhKeusDBtXHEu9FvVbOxHSdNkEZcB/XPSqmu2Ln8Gz+7X8NNcBkMs8I6mT9HTZlu
AWQM8prHkZkNlEyqSH9LZ5xhnxEr3JHZ94jJl56nTuCFrNBwLcRlbuF74/dvjxNv
czoM00eQEHfxKBnBRcIJMQaidUm/8IaOj+ddt9vGLPGVp6tJdcjXPGysea+ZPozm
JG+AdQIMSh6U3bIwfPOzLZqYcM28iQnsnRX0WDOUg+m8p80tsCdJO26mKDN0V4aY
J7IJLJ/vjgRwgV7bV9BKfLgrHsVGHpP8J4kGJzS4Q3fJzABOY2wlEBrRqI9NOB7I
XhlEX4HG1hsxXvGZZrzbNsjG0Nn5H9PSnX2C+EazmKvIybIVVqbKJ0Xq1ETaZhkG
MyZQisp7J8t5Nio84Uqnu5hUaTCuH2QK8dwtTZOUohz4rjCkVGhADweuahFy71r9
0/GK4Tz1A/F8ltgK+svLuDqjNTmeWhUtrClav36hWtgUR3rOg++MzHiPWXVLErs1
pa8nwusWFQe+/VYlnjfMDApok1bf6UDGRA8Frcv8AmkPNYfVGBQ=
=fj6m
-----END PGP SIGNATURE-----

--1vaXBG1dwQTa2gEo--

--===============1029297291844060594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1029297291844060594==--
