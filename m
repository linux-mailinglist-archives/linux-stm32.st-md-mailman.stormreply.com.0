Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F44C2B5F0E
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 13:25:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 140A6C3FADD
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 12:25:54 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA90EC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 12:25:50 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id z17so10409249qvy.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 04:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gADBUQ9Hae6TrHG2WXhgqR0ilSCLKu5qzspZRGuFCcQ=;
 b=HHVpgSwES/RzV9qCoD3T83yzWbkiPtbDhJRgKOEfJ1Naefp+wXOgfWt3XJpD4cxIpk
 IZHMpD6GIYaSSU1BSWdqJapoZ0P9cDGQti8jTPZuR3oIQgBssK3U710v8byPOEvxqZjZ
 elouPSvf3pIcX7Rc24n+vVIXHgEhKLey9DCDZTneSDaXzriFnucGq3RkbbfUie4rppDB
 XGZYRKK1RymTzcwjGATzo5rYJfIgKKJlPG2veMWcDxZ0y3yvEywQRp8UrABZHjuyJI/3
 c5XSpdC1NEDezXjfMW+5b2FN4GCDIDXD3atxefmpIf0GgyjvUxe1RNnacjzbeYsl/eaq
 QNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gADBUQ9Hae6TrHG2WXhgqR0ilSCLKu5qzspZRGuFCcQ=;
 b=Vnau9L/P/+T/AtfYTeAt6xNvqRM0cljHnVKi7yuboKrdAKG6hlgQvWtr3dF34NCnxI
 es8YuE/RVt9HYMkphm0QDT5xUATPVaaJsJ83jivOX1Zv+MlboV55yuXo9SzKrMlMgdMA
 E3W1KxqNerZnwrM/akEy01/UrvARZ/ED3RDzgns3dforVWx4Ekq5f/44ewgnoBz5baK+
 ShA/d75tc8km5CsaQOab0oOkWNCHnh17fKw5NBZiJPw2ahs1LqK51skF4L3mnsPO7g+Q
 ///5bDLAXMSqMeANiKCa6+wtPQoCIaJnAa/UF3rkFWIv5380JkNnFBpluRMhIZ7Ryejj
 U0tQ==
X-Gm-Message-State: AOAM530iU7gUgdBGPP6ZY2ajQQ54UFCMn84bUK7DKfvrtqMdRaFzmSws
 H23+q1BK1SeRijXBxhrNZ9s=
X-Google-Smtp-Source: ABdhPJzYEZOOf689Mkp2upgEYPTg01QHMBm5QpPlHo+8aWErAi8apOAd/F7uFNJ+JxnjH6eMtJy38A==
X-Received: by 2002:a0c:ab1e:: with SMTP id h30mr20453703qvb.55.1605615949545; 
 Tue, 17 Nov 2020 04:25:49 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id f202sm13683253qke.112.2020.11.17.04.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 04:25:48 -0800 (PST)
Date: Tue, 17 Nov 2020 07:25:41 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <X7PBRc1e/TbOPYmT@shinobu>
References: <e8c99989-f018-dd90-2144-e09c05a3731b@pengutronix.de>
 <20201106124217.GA4015@shinobu>
 <0fa25b7a-92f9-8eb7-088e-2ef3a2edf2a0@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <0fa25b7a-92f9-8eb7-088e-2ef3a2edf2a0@pengutronix.de>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>, linux-iio@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] Counter device Interface for reading out input
	capture
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
Content-Type: multipart/mixed; boundary="===============4676977997437863104=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4676977997437863104==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nSRaz29Y8MvsNho9"
Content-Disposition: inline


--nSRaz29Y8MvsNho9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 11:54:17AM +0100, Ahmad Fatoum wrote:
> Hello William,
>=20
> On 06.11.20 13:42, William Breathitt Gray wrote:
> > On Thu, Nov 05, 2020 at 07:46:14PM +0100, Ahmad Fatoum wrote:
> >> It doesn't look like the counter device API is yet made to support such
> >> an input capture mode (latching a counter value on an external event, =
e.g.
> >> to timestamp incoming rising edges to measure jitter between pulses).
> >
> > Regarding the Counter subsystem, I'm developing a Counter character
> > device API that supports timestamps for counter devices:
> > https://lore.kernel.org/linux-arm-kernel/157d1edf-feec-33b5-7ad5-94f993=
16ca6e@lechnology.com/T/
>=20
> Any chance we could have a "raw" timestamp as well like the network
> stack offers (cf. SOF_TIMESTAMPING_{RAW,SYS}_HARDWARE)?
>=20
> The API currently only exposes a ktime (i.e. CLOCK_MONOTONIC), which the
> raw timer count can't be readily converted to. For our use case of
> measuring jitter, the raw value is sufficient.

Sure, we can add support for a "raw" timestamp. I can see how this could
be more useful in certain circumstances rather than the ktime value.
I'll open a discussion about it when I submit the next revision of the
Counter character device patchset. :-)

William Breathitt Gray

--nSRaz29Y8MvsNho9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+zwTAACgkQhvpINdm7
VJJYTQ/+PfehxFKZUm1Zo/rIlQG7MY2iPsOOAwVrwt/jAl0dIRd68h/68ZFoT0/p
+hVVClbTv/TwNIAyJLgFHS6UNAJlYx9pU1sbVtyzzGDD4H83u1lfdUeO+9t3DvBy
qRmlVZrv2Shl9eIJvChVPupOv8E+DYyG8uIIXKzAakF8bQeFGiI611mV3s4rDDEW
1MiygpAN81LZmTP3h3wVV4uClvI+MliGBCGPv5BjYjSl3tnqAvSjFjsOiNovD9ue
OFQUkZQbpEBaQWuIpGL5i6YZEfpYp084AWoXhOiIhQjAQTY+V2RQ4ADp4wsLNodf
kEBdZ0FLJx1rrhm4iDAaWMxs7vCo/pVH0bB2ZNv2vqbAUjIM5+g0rRgGdvd53DMI
1Y8+l+DFPraDB7mbM6Gp36pQIABzQc/0K9oq++g4h12q8H/gmsEb004C0GMP1fsF
zosN+xYqGvBjiwq7Doq4n8mU3Batwz5+WxtoKBM7m3TX/OykSbB3ne0yGPjGGM1u
SepLf4E+GLNqHHdmbXj6/Vsq4qaeEk7vDUs12BPNvrX/AnfLzLcdCBI21Ln0sv8B
UbKYOghdfjA31mRltI4tDtpujgm1euhDDGE+ebZK/JcYzoBfl9tpPtd1dDrp3Qx5
IOc7cqPKybWsTDiwuWw/l31953+aX9hYZsHs6b0PpdKhBN7bN7w=
=lBqg
-----END PGP SIGNATURE-----

--nSRaz29Y8MvsNho9--

--===============4676977997437863104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4676977997437863104==--
