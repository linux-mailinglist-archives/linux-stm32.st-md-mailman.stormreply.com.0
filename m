Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D4322519
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Feb 2021 06:14:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0136C57B59;
	Tue, 23 Feb 2021 05:14:51 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2FC6C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Feb 2021 05:14:49 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 75so11645100pgf.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Feb 2021 21:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Sv+2xHnuMxoZYHZzlSKqDTkD28ImMvhuxWF1qu/hw2M=;
 b=oF1hpcgZsgJA6Wz5ZkZHxTnYjw2yq4knr7L8Dr3qfv5V27hA1y1dFyuRPyBl9Ccb51
 Z0Zed4wnMmPLgjnjNfJTHiyWagan3uwpw4DxXtvv2huyGbqYU8eCt1WgOs4CgGlpGfDj
 PZclBXyUm5Cd6VWrcS0yrJlfB26onKqMJTIkyNOLBuP56+YGQwCGA62q93J8GAWGt6ll
 v4HQAGFTAT+f8K0jNfrp6110o0A7Wn1Pfi46UoDlD3CXobjF1DHA3lGsq5YXwKYFMuXi
 HTCTuK+CDmHoocyGsC4leG3Ot+cP+y//Pv60VgrfydmzlRFzZsuXWsx3gFpOcCB/6ie6
 wmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sv+2xHnuMxoZYHZzlSKqDTkD28ImMvhuxWF1qu/hw2M=;
 b=Jaq/Z6LtVMRVX4FHK7STXuTC3wKo97CjX6J2k770JqOKW2pewUDm6aS1BQ4QWke8Om
 24rhgVk1GjnOS7lB+gBoB8oy6aIsf/LMb309bmQJ/D2wpKfAFPS72SXUCq7ZSuLxBuQM
 dcGLBdFnxnFMvxH/DzD5KgUpYwFc9st4inzI9pdpAj+m5776LSaGAJT8R4wS9tNT5mHe
 /eQRp7wKpvHjxNT7AF1a1UPKUA8vAETy4kXxm4FHgiBq8GiDxnzo9eFDOwFO2P7BHOFH
 nO3zioCY/Jn8n0Zsf+WQKjb7gZWw1/Ye0TAhT8SFUueSjEoX1iAnX43ceoF1cfo+6g1b
 EaMA==
X-Gm-Message-State: AOAM531xyMzInuTLc/v0IwRo1q84q6VZUk6VsaGYMsGxBzhJhzWOq7ar
 H5s2jwnwyAfU7vDXobY5XRc=
X-Google-Smtp-Source: ABdhPJyyTbQX1xY/5LRGeepQyY86TC3qofoANb1P6IBA6o/d/HQnaXFWhWzu47ogWesSYM3SPOECmQ==
X-Received: by 2002:aa7:8b48:0:b029:1ec:a315:bdbd with SMTP id
 i8-20020aa78b480000b02901eca315bdbdmr708936pfd.51.1614057287907; 
 Mon, 22 Feb 2021 21:14:47 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id i2sm1233145pjj.35.2021.02.22.21.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 21:14:46 -0800 (PST)
Date: Tue, 23 Feb 2021 14:14:40 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <YDSPQFMd0sqUBUaq@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <355aaaaf44b36c5de1704e4074a4671abcb9699d.1613131238.git.vilhelm.gray@gmail.com>
 <20210214171340.3cc7b686@archlinux>
 <2b6913ac-0802-f83e-06ba-e89d5318dbd7@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <2b6913ac-0802-f83e-06ba-e89d5318dbd7@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 12/22] counter: Rename
 counter_count_function to counter_function
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
Content-Type: multipart/mixed; boundary="===============2970986344059531470=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2970986344059531470==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CvbW7fZyFWvbVNT8"
Content-Disposition: inline


--CvbW7fZyFWvbVNT8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 20, 2021 at 10:56:13AM -0600, David Lechner wrote:
> On 2/14/21 11:13 AM, Jonathan Cameron wrote:
> > On Fri, 12 Feb 2021 21:13:36 +0900
> > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >=20
> >> The phrase "Counter Count function" is verbose and unintentionally
> >> implies that function is a Count extension. This patch adjusts the
> >> Counter subsystem code to use the more direct "Counter function" phrase
> >> to make the intent of this code clearer. The phrase "Count action" is
> >> adjusted herein as well for the same reason.
> >>
> >> Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> >> Cc: Patrick Havelange <patrick.havelange@essensium.com>
> >> Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>
> >> Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> >> Cc: David Lechner <david@lechnology.com>
> >> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> >=20
> > I agree this makes sense in the counter core code, but in the drivers
> > it may not be quite so obvious we are talking about a counter function
> > given some of the bits of hardware do a number of other things.
> >=20
> > I guess up to the various driver maintainers on whether they
> > think the new meaning is clear enough!
> >=20
> > Jonathan
> >=20
>=20
> TBH, I think "counter count function" makes more sense to me.

That's a fair point. I'll revert this for the individual drivers and
leave it up to the maintainers if they want to adjust their namings.
Instead, I'll limit the name changes to the counter core code.

William Breathitt Gray


--CvbW7fZyFWvbVNT8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmA0jzYACgkQhvpINdm7
VJLBQg/9GFXoFuC1SgrhZBOf3aVmvp31oECQ/jZrZRo78seSdAy7lyxzby6V8asO
adikRiaumev/b4NJStCUMH9qZ7P+nGRI74Yhd0HFaowh3vHm4DKBZfxcwOuh9sL7
8AUUpqaWFYXPnTn7G/JJv2nVGGlFH8FecIqOjYroMHhI6b8PiueMgqhHnL4bxlyX
AP1zJYt+EztFOCiLB4hglEbc/qS8lTzqE0qcBwAF8RaUC+bqeiFNb3HrrnT7j1dw
j+4o9KyuJ8crppn81jlvU54MM457MMh01sAW6KnvFWxFaUXE7LI/jAV0v3vuX4yi
Ag9kSHRT8zTkPtcQSFApcjwaWRVC7bkvmOLuNl3X4JDJtqb5soVvf5vULzBiUcrf
DtwK3Xiw7LXV8stKJsz8Ot9xASj47e+R6tmJZFmCDvb/M4zK3CZOAmZvYGuxv81t
Mi3SM1MyIBZScC+5Pjydxf5kxpTKfcTYoKYaZ/szQtO3bQMP5iyuiKlInnvj0JSv
ZP89E8JBuihK3C0HGLx4vx3L8n8qaXzoBfkPijnZh+RD2FmTGHuws7YSVkbdApao
jhSh+GnWr6kc+sH/Jo3QhU7I/rwtscxPmtKuhrptLt1D6C9zR6AKgmNWgd8jb9pX
OfT2odtPtlnQZZONRO/UgPnQYk2rWTGvOaaz+gerWbsAzIHiEvM=
=tRzo
-----END PGP SIGNATURE-----

--CvbW7fZyFWvbVNT8--

--===============2970986344059531470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2970986344059531470==--
