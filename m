Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D702917D0
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Oct 2020 16:14:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EC22C3FAE3;
	Sun, 18 Oct 2020 14:14:34 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76EC7C3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 14:14:32 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m65so4600017qte.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wQD8dvtVrq4V8MJl2t269P6nRY45qGQQwokAStwOkWk=;
 b=sLqkvqoYyL7bDoORzLgwtKjYTyFm2yH2VYX0ISHtpB70KxnqQaVk5WrYtFap5xmV3b
 zY2daPhUl7UyatttwIktfRPPwTwoHd9gmGawqyu2i2QuBbHMxpQ3ZBVOEF7FmMCkHyT6
 cdbagoqTqHTMKBxZO+s4jlaaavO63RA+5bbQEDVof6h93xRejTA8+O6c/gdGZpTkkoqi
 IU2LgK8+EhXpIgY98TCxaCpsCPY2KguBD2ab6lV6FXPk+BOgO2eIZDYgBzbEITGw7oa1
 SfnkVcR98W7rsML9bQ8Dkyfrpe4ZWn8bSKDlTNT+M6rUs7bZ2aiGIFhlhv99F8Oh+Ovo
 tZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQD8dvtVrq4V8MJl2t269P6nRY45qGQQwokAStwOkWk=;
 b=VZOXYSvmwLVMMcVsOWnj6DSKFi68jhcbJN57Qz1xBFQKBQGM/1WsneLjqvJqKDKZRC
 hImYZWNT/fGg2jdZ1LHspBEVzeBGLVUVAoZUgrdpTkBXYjaFj+07zwMY6bcmeb1ud/9O
 HlRED+1uRdNVaQexgu+sUgi4n3HKKwcAiRJlo+Ig5ubCmYp+TRSoMn9mgHF5JWyvrQbE
 J/kg34YE9C6c8NIBlSqjbxiodhKkQ0zaGr/7iGXqG36qlO2JhimheTGGUzABTxWsv0JX
 kHEwvruZMT6x07Q41fb/J5slosIOZRT9aLUn4olQGrg4ju6Qt0f8STAT4gfdhEljy4B+
 yH4A==
X-Gm-Message-State: AOAM5303MRKd1wf+qi/ElpCygIMZo0UX57SwVgziq3aNqsfM+MuPu7qc
 mfQOZSpK3xZhZUu8HpX0zoM=
X-Google-Smtp-Source: ABdhPJz8AqYMLj6JncUpgAzSEh01P1bIeDSVxq6zjSr5BxjFbB42zFfwuvL7QL1MnzhJ1uMLrHtPSQ==
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr11101920qtj.345.1603030471220; 
 Sun, 18 Oct 2020 07:14:31 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id g15sm1566143qki.107.2020.10.18.07.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 07:14:30 -0700 (PDT)
Date: Sun, 18 Oct 2020 10:14:01 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201018141401.GA231549@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <caeeb0b2-6b66-b623-98e3-acdc261ec20e@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <caeeb0b2-6b66-b623-98e3-acdc261ec20e@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 0/5] Introduce the Counter character
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
Content-Type: multipart/mixed; boundary="===============8355258289960519174=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8355258289960519174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 07:35:11PM -0500, David Lechner wrote:
> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> > The following are some questions I have about this patchset:
> >=20
> > 1. Should standard Counter component data types be defined as u8 or u32?
> >=20
> >     Many standard Counter component types such COUNTER_COMP_SIGNAL_LEVEL
> >     have standard values defined (e.g. COUNTER_SIGNAL_LEVEL_LOW and
> >     COUNTER_SIGNAL_LEVEL_HIGH). These values are currently handled by t=
he
> >     Counter subsystem code as u8 data types.
> >=20
> >     If u32 is used for these values instead, C enum structures could be
> >     used by driver authors to implicit cast these values via the driver
> >     callback parameters; userspace would still use u32 with no issue.
> >=20
> >     In theory this can work because GCC will treat enums are having a
> >     32-bit size; but I worry about the possibility of build targets that
> >     have -fshort-enums enabled, resulting in enums having a size less
> >     than 32 bits. Would this be a problem?
>=20
> We shouldn't have to worry about userspace programs using -fshort-enums
> since that would break all kernel interfaces that use enums, not just
> these - so no one should be using that compiler flag.
>=20
> So I am in favor of using strongly typed enums with u32 as the
> "generic" enum member type.

That reasoning pacifies my worries. I'll test out strongly typed enums
in the next revision of this patchset.

> >=20
> > 2. Should I have reserved members in the userspace structures?
> >=20
> >     The structures in include/uapi/linux/counter.h are available to
> >     userspace applications. Should I reserve space in these structures
> >     for future additions and usage? Will endianess and packing be a
> >     concern here?
> >=20
> Since there doesn't seem to be a large number of counter devices
> this probably isn't critical. Are there any aspects of counter
> devices in general that couldn't be described with the proposed
> structures? For example, could there be components more than two
> levels deep (i.e. it would need id, parent id and grandparent id
> to describe fully)?

I can't think of any devices that would require more depth, so we
probably don't need any additional members added to the userspace
structures. The current structure should be flexible enough for future
expansion, and any additional functionality we come across can be
handled by implementing new extension types as we have for the sysfs
attributes.

William Breathitt Gray

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+MTZ8ACgkQhvpINdm7
VJK9LBAAge9m8K8GflWtmFR6Fs3MjZ4VRmuFs6SXmkK0zYWPpaw0vy5Is6poej9f
p2hXz0EBxEVSdD+/hMmnyrz3VeLrRrSKN4iekMxGpScZoiyjeh0wy9J0kcv01zTd
jYR8Jm4lCJShMW20HFHUZXR3gUGTzXXB6jot2jDk+UMAkISYK7msNt4nmb6WsaU0
4QGpNZE0uznJN1PZ8pzv4NZ7LzZpf/HDDU6XgCIT9lWrQIbVXiOXG9aeXA0nL8cJ
WmBwtSZ5KQJo9Ijjo1Rn6zhNUoKMzF1wvGNEHvpvJDZ8n9x4ljyVh9FsEMUV9MC4
jWgJMA2+7vRbrheBqAuLTB2rC46xZuSr3cS7mu9sY+DO+LSNVafLWU8vjzzK5tfX
ahPxfm7Bz/lX8zhddNPWL1t7aNFMCJJdLAmRIlHewf9mdoE0n35ifyvOpgAACtIn
qFgr0TkpZdwq7TG3FCNqXRE80cw0YWZUIXeZr0MFoETzHPs50VvFDBQB/xKU1/wo
qdV2OZAn5bdfbk/DMqg9S61+H3KbujUgQZ+k+ANB4UMKYdo3QyNgBNUpFQgUqlp2
rqFuAZTNVG1VY2mJcA+8QJe4eQkn3oEGzgvK29ruiysk6nk/GjEhtJ8qJ+NLqw7q
HpTWR26ANLXz6Iy7izaSHM3jLiAp675Ej6bDzkZRf74d+RoKf5Y=
=oiqw
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

--===============8355258289960519174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8355258289960519174==--
