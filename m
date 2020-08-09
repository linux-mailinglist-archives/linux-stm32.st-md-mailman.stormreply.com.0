Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6023FF9B
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 19:51:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D83A1C36B26;
	Sun,  9 Aug 2020 17:51:51 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C699C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Aug 2020 17:51:50 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id x6so3200944qvr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Aug 2020 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n0x8YNxsCm7bGHeqbF8zvvR+sEvGuDkwyk/DAgXQhHw=;
 b=S3Iu1VC36rllT2s/b3IGvShcgQCYwpTombmTvT1JjcO53Se++BrGPfwLnk2xaZHEF9
 DxK+kzM6G3uurL1qyVeBfPOcgCIGYORyMsExe0q8yvod6CSnZ/71K9Rvupf2a/KmqMhF
 RRzFBT0+FCutZXj9u5OeN1fYhxoAm56KD7n5MZssC1kSSMWq4mEMrrOIkQp1dxZ3PJIB
 OpMB8TtMAHOXKlBcb/zL6xNtjRLq6Ic+zjKgLYayJCfHHdtF6CNam+3owtyNvqVH1k30
 GRG6Tz5HILGt1L8kx1TSRiBn9/5ZHwXpiSXbLJkvTOobQBq7R0qvY6mmyc/2VSBQ1XUS
 f7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n0x8YNxsCm7bGHeqbF8zvvR+sEvGuDkwyk/DAgXQhHw=;
 b=FUnwi4TmGCxe/NJWKFWD+AjQLNRGkowphUDKSx87ye2AJvbLqp+CxTscD5jQHXEmUH
 uRKaaSlkaqHy9Nl6+j8RtKYq3TE2/FPEyfEMgB+5enOpFo/gexLg0ounzAMSbmp/OPiJ
 xcczTPviC47PrNCBwTqVx8rLPB1mtXTcARnyR6k7GoTI8YEexhMy/0zuSylqbygO6ufG
 fUjp7he1upNQdKFn3c5s2F/f+GW7GLdzNy7RBBP+RH41feasSLQr3e0Rrp5uwSDkrTrk
 xrJLwqC+C+iyIzJCP2TAap2X9ohArddEGzUGb1UNQxk7aZK6hBZhCGGPU8VIDdbcJDl/
 jz/w==
X-Gm-Message-State: AOAM5317nLvQsoogi82HLZtIWcrpb/e8ClYuX/exQ0nm2gpllnTbqPrz
 N77jEuaGWtW20Pyvd5V1D9o=
X-Google-Smtp-Source: ABdhPJz12sgXjE+X2nALn9osOEpYrHt9vHeEldiICmpuV68vmmG56WGukiYmWeKacikankoCPBRBtw==
X-Received: by 2002:a0c:d64b:: with SMTP id e11mr18066172qvj.169.1596995508936; 
 Sun, 09 Aug 2020 10:51:48 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id i18sm13211332qtv.39.2020.08.09.10.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 10:51:48 -0700 (PDT)
Date: Sun, 9 Aug 2020 13:51:45 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20200809175145.GB6542@shinobu>
References: <cover.1595358237.git.vilhelm.gray@gmail.com>
 <20200809144800.6b067dea@archlinux>
MIME-Version: 1.0
In-Reply-To: <20200809144800.6b067dea@archlinux>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/5] Introduce the Counter character
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
Content-Type: multipart/mixed; boundary="===============1469065497510540483=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1469065497510540483==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2020 at 02:48:00PM +0100, Jonathan Cameron wrote:
> On Tue, 21 Jul 2020 15:35:46 -0400
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> > The following are some questions I have about this patchset:
> >=20
> > 1. Should I support multiple file descriptors for the character device
> >    in this introduction patchset?
> >=20
> >    I intend to add support for multiple file descriptors to the Counter
> >    character device, but I restricted this patchset to a single file
> >    descriptor to simplify the code logic for the sake of review. If
> >    there is enough interest, I can add support for multiple file
> >    descriptors in the next revision; I anticipate that this should be
> >    simple to implement through the allocation of a kfifo for each file
> >    descriptor during the open callback.
>=20
> What is the use case?  I can conjecture one easily enough, but I'm not
> sure how real it actually is.  We've been around this question a few
> times in IIO :)
>=20
> Certainly makes sense to design an interface that would allow you to
> add this support later if needed though.

I don't have any particular use case in mind, but I figured it would be
useful. For example, a counter device can have multiple channels with
their own events, but any particular channel might be counting the
signals of an independent device unrelated to the other channels; in
this scenario, two independent user applications might need access to
the same counter device.

Of course, supporting multiple file descriptors is something that can be
added later so perhaps it's best for us to wait until the need arises
with a real-life use case.

> >=20
> > 2. Should struct counter_event have a union for different value types,
> >    or just a value u8 array?
> >=20
> >    Currently I expose the event data value via a union containing the
> >    various possible Counter data types (value_u8 and value_u64). It is
> >    up to the user to select the right union member for the data they
> >    received. Would it make sense to return this data in a u8 array
> >    instead, with the expectation that the user will cast to the
> >    necessary data type?
>=20
> Be careful on alignment if you do that. We would need to ensure that the
> buffer is suitable aligned for a cast to work as expected.

That's a fair point. It's probably safer to continue with a union which
also has the benefit of making the possible returned types clearer to
see in the code.

> >=20
> > 3. How should errors be returned for Counter data reads performed by
> >    Counter events?
> >=20
> >    Counter events are configured with a list of Counter data read
> >    operations to perform for the user. Any one of those data reads can
> >    return an error code, but not necessarily all of them. Currently, the
> >    code exits early when an error code is returned. Should the code
> >    instead continue on, saving the error code to the struct
> >    counter_event for userspace to handle?
>=20
> I'd argue that errors are expected to be rare, so it isn't a problem
> to just fault out hard on the first one.

All right, that should help keep the error logic simple too then.

William Breathitt Gray

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8wN6YACgkQhvpINdm7
VJJS2A//eaJ/jtLitKdyaRHiFbB4//bIf3sPQQxG2eJSu3eztaFphLlkMxdDijrY
OiBq5wsBkHYvcpy/z2A+XqY/PFzCpMrr/tAyuxiEeKB95WjzTUZl59CbUDOqqtwz
8wx1DcymzHfvwun1AQDfXPyMXD/Np0zdQTaY2vmjyllC5otFSfW2VfFh/RIzxQ2A
FCtP9ogxam3Pl1GZ20e76C8f+tH8M25xP9Aj3h8R7XV2NiR6xE/WuhOlsmfAHyue
cvYBfyS8YnTvZaDu1L88kqgEoXqJXqTXKTfxRYLRgEQD0DN/i7IndPgApUoya93O
kBiGMexlfBeGOMaMgs29ZoFUflyg6ZjxcgrlCGt7jGHP8cmTex6TDw3f/BSGloPq
ED5rh5rPnYzWy0mqenPgZU2V6VCZeApcGwhakCpSYFVdM4Lp4yiktdFTpzC9LkXY
jeQvOXAespYNJH1llge4DfLwctqclMZVJg0flDDCUCQA75sy6vrPE73Nb+T3XChu
TEu+P8gRFJbxi9Rg/l/7p+P30s4e2a1YKJfWdYStcHSougEHJq+9x8zUaejWAMwo
YB8+NaDRnhUi6DVgTLwrib6uvwOyGj94P2qn8Y1RhkqUzQh0vSlG0z/gyss298H8
WCSZNFOLbS9pTLd77PpNxf7HkBCkg+/M14ZmjimDQMZwRMP0yGA=
=+ft6
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--

--===============1469065497510540483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1469065497510540483==--
