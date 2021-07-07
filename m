Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DECB73BE047
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jul 2021 02:28:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99155C57B5B;
	Wed,  7 Jul 2021 00:28:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A6E5C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jul 2021 00:28:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so2532875pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jul 2021 17:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wgMqBY62hL/9zc2/Y9RJScdFpoJ7MDAsy5QSUueWpmQ=;
 b=cDMJD5q1dceLz4P4a4N1PWPbj3mpKCyHl+kpmuFvBSFCLjxJhTu83hIsv9j0g7WNjt
 Ha5rraiLkj9M2ZepNiX9oUxJ7OcOz0tSY00XoutscCtagvsbYk6MI5/YILSNojz/bqF2
 1Qrsm4Kj0OnJpFvdCLLfxL1LDXLpu5ximyhL/IgMUmUrLn70Di23tlAKRml1sYMZlnWG
 oUcvZ4oRK2y0K8XEg509UdXAZftNPlIGd3cFjof+q3/5KnF1Htm88ueE4LAzrq8uhPYW
 4vfFEidyMKlJ3qumCNjW62GIxYmZ5ECj+csgHpDGiadmWY3zozzKRWRT7xOqxj/7NVQ0
 ko3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wgMqBY62hL/9zc2/Y9RJScdFpoJ7MDAsy5QSUueWpmQ=;
 b=PLqK3zIu0sksYqhQ2YmtxoDbfCa2R6bkduBRO3sIsn/saR8LQVBrHvQL7qWUb5J0In
 Y2uvFOK/yye58G07Dn2GmXR40hMAE3w8dRYGmGkiB7i7nEUYltzDOpaR+DB1tgVnNYVA
 ODJFjXnv8Zh4K0v/CsqmVewM/ecMWoprTPUGpLY+Jxd5bOCX6ZKhyiW4DcV6gMwSh5UT
 mV5zvMdlEumi7aOcURzik+BWkuEPEym9iaEUDqx1zjqDr8ZMWn89UIbedsDZqC75mq0m
 sT7JuCVvsQKs22nQApui5M3h4zMhhMqYuSuHfRXD2twNBK7jhULuA6LvWmAG10MpOoup
 yoVA==
X-Gm-Message-State: AOAM533lpDmM/FK+otXsufkCSSo4qGgO6SyMXgjsdFGbxea2mIHXHvzP
 UX1MdJqFObrEtr5Q5YnjFg0=
X-Google-Smtp-Source: ABdhPJwyOfj2zNPpVkjW7izeLTHLXWRgoCKm6b8nqpc4pgmLX5lWGHIprfF5CJaY5N2CsLka8JsAxw==
X-Received: by 2002:a17:90a:e7c4:: with SMTP id
 kb4mr2943529pjb.43.1625617723085; 
 Tue, 06 Jul 2021 17:28:43 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id j6sm16042192pji.23.2021.07.06.17.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 17:28:42 -0700 (PDT)
Date: Wed, 7 Jul 2021 09:28:35 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <YOT1M1qcfHC2PpuF@shinobu>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <5bdd9ee6-86af-3bcc-43ff-418fd1a2e3e8@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <5bdd9ee6-86af-3bcc-43ff-418fd1a2e3e8@linux.intel.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 00/17] Introduce the Counter character
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
Content-Type: multipart/mixed; boundary="===============6756115410301526327=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6756115410301526327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9KoXz8sgYVDVTxwl"
Content-Disposition: inline


--9KoXz8sgYVDVTxwl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 02:40:01PM +0300, Jarkko Nikula wrote:
> Hi
>=20
> On 7/5/21 11:18 AM, William Breathitt Gray wrote:
> > To summarize the main points of this patchset: there are no changes to
> > the existing Counter sysfs userspace interface; a Counter character
> > device interface is introduced that allows Counter events and associated
> > data to be read() by userspace; the events_configure() and
> > watch_validate() driver callbacks are introduced to support Counter
> > events; and IRQ support is added to the 104-QUAD-8 driver, serving as an
> > example of how to support the new Counter events functionality.
> >=20
> I quickly tested this set on top of linux-next next-20210706 and didn't=
=20
> see any issue with intel-qep.c. However I noticed two mutex issues in=20
> patch 15/17. Perhaps visible due the CONFIG_DEBUG_MUTEXES=3Dy etc. I have=
 on.
>=20
> I'll be out of office next few weeks so cannot test if you have a new=20
> version meanwhile but wanted to share no show stopper from intel-qep.c=20
> and those two mutex warnings.
>=20
> Jarkko

Thanks, these seem pretty straightforward to fix so I'll wait a week or
so to see if any other issues pop up before making a v13 submission.

William Breathitt Gray

--9KoXz8sgYVDVTxwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDk9TMACgkQhvpINdm7
VJL/+A/8DfP+wFOuOhzB4lVMNXXWQgDSk/bZskGmbS2ZZLobkAQ260t+W1F8L7vj
q9ghHKWyLScDZ6EnRxY+1CdtT4eYXUcDeqJ0H0uLROcluzVYgBw7ZiJdt1nrEjmz
abeflZ2T0hz1/fsX5zfUDRE2gdjjhdK/92iMmdiYXhOav8y3LyaAhmlN6d5Vqob4
NwPZlf46LbvG3N0ExnT0ZP2B8q0LDJBXdxJbe4QoHY8239xFfins+2AhdhHAGfE6
nAszv/Bq1igVzQ04M+MbvMbVf6zPlyphAudOa9pi5+up2fB/dBGVIE5hrZ4LHlQn
chEpoCZ5/ZI3ZuEN3OoFuiiCDdbT06Pvn71x7Fm5Oio51JkFa8AysnEbGTr9k/NX
9/FERGf+fQBSGou1XO1ujPFLtZxwYyvUE/a/Kw2AdLDVLBoQ6AqF3m6s/wP/vGlE
tbrqdNkucZ9tMWJQGCM/528XztqDayILvKSkTS+RwkoBdv9G3HzKejW8EOkneTEp
/5QAODb+TuvGMtvFyDuKxHkbZ1WA3ps6mgwguS5BaUkcnatur8s8JBT/IRR9WUxn
5PLXV6+HGVoTu6Z179l2D7msc2iXwiETZEZjdVkMIrmQ+xgb+MhUUHeyZX4FLD+s
pYmZ10G+ccSpXQucUP0hKygdkXjX7ZwTB1oT+9EG4t5aYu3e/FY=
=xXkJ
-----END PGP SIGNATURE-----

--9KoXz8sgYVDVTxwl--

--===============6756115410301526327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6756115410301526327==--
