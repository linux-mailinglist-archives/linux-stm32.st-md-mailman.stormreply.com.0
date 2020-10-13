Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1B28D423
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Oct 2020 20:59:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9361C3FADE;
	Tue, 13 Oct 2020 18:59:00 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08508C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 18:58:56 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 140so756004qko.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 11:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iyujXSr66H0LW5PmWT8T15/LcpIBTSbnFu/C1AlCOfc=;
 b=lvVK1TFwKfNxF9xc4iZvsVlMWxR8Ae1ozwz1kQ5q+CJA6Xovr0KfDAeWJlRkLtUc3t
 BsdUdShrBeXn71nnu70CBOV5V1GsNEwmipJIvP/J07pHPyEOYxev9xLCfOf1rXxZKltb
 SlLI2EMczm1fB2Z1pXoK1I/ey2VEL76TjNwCjUYuLmWJWV9ER/RSqp5Ph+S/FBvqjxrG
 gpdQtYGcFFLqiChAEPCkaBbOl/fUeo9lSSFVK2K7uCfNECJZjUP+cNAixm/UklURrORN
 XQ5nn7ULklwfzPxE3AiMdlR9iorZCwxXXvq1ai5Aw/Z83DXd376JDnNwddF2B2xDjcrx
 CgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iyujXSr66H0LW5PmWT8T15/LcpIBTSbnFu/C1AlCOfc=;
 b=gzhW2gLGJx759BJ5Jga9Wc/xCgScY4CIgcQoxQHu9AkwNRZgmh5+hOiJtcUBmW3r+L
 zXsJQpY45jfYUNwxBUWCjVmJk+gZxZ0LN6KwlQEophT8uAkiyhxHKxD0c7+M3KEyc+NO
 0ZTR/jfvlbJxrUy0JQyco1YRromIpLQDnxg9n3EnV1nPBJXmcH6uwyIwRQFZ0NEu/8SM
 TKsCxWPZymopEMJlzu/aGO45ErXPeU617a6XwWh0xrfUtS+348bYYJZvb9/a73EAtRAn
 ru3zqHCTxUlAdJjbhe//zNTi8xBfR2MdTMeKgnr0mI25c46PfcHZCHc2f05HZYbtkYKN
 dZzw==
X-Gm-Message-State: AOAM5304tmFHN7GOu+u4Hy/flmkQo1T3bzNMWYoeW8hycHveQsoBhKtC
 +nEO2hZXIU/+Qif67i9J7DA=
X-Google-Smtp-Source: ABdhPJy21mJYiy7EaIls91cnRuzM/Lzc2HQ3ui5v5MtOMTOQcn9pm1msGFmuwGrb8IVsLmZedddmjA==
X-Received: by 2002:a37:8d82:: with SMTP id p124mr1436426qkd.371.1602615535426; 
 Tue, 13 Oct 2020 11:58:55 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id k15sm336858qtk.64.2020.10.13.11.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 11:58:54 -0700 (PDT)
Date: Tue, 13 Oct 2020 14:58:51 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201013185851.GB32722@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <54190f9875b81b6aa5483a7710b084053a44abb8.1601170670.git.vilhelm.gray@gmail.com>
 <20201008080909.GA31561@amd> <20201008122845.GA3314@shinobu>
 <d06d5e47-5776-85ee-0dc5-8b624e36d83d@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <d06d5e47-5776-85ee-0dc5-8b624e36d83d@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 4/5] docs: counter: Document character
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
Content-Type: multipart/mixed; boundary="===============9027145391660006882=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============9027145391660006882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 12:04:10PM -0500, David Lechner wrote:
> On 10/8/20 7:28 AM, William Breathitt Gray wrote:
> > On Thu, Oct 08, 2020 at 10:09:09AM +0200, Pavel Machek wrote:
> >> Hi!
> >>
> >>> +        int main(void)
> >>> +        {
> >>> +                struct pollfd pfd =3D { .events =3D POLLIN };
> >>> +                struct counter_event event_data[2];
> >>> +
> >>> +                pfd.fd =3D open("/dev/counter0", O_RDWR);
> >>> +
> >>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches);
> >>> +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches + 1);
> >>> +                ioctl(pfd.fd, COUNTER_LOAD_WATCHES_IOCTL);
> >>> +
> >>> +                for (;;) {
> >>> +                        poll(&pfd, 1, -1);
> >>
> >> Why do poll, when you are doing blocking read?
> >>
> >>> +                        read(pfd.fd, event_data,  sizeof(event_data)=
);
> >>
> >> Does your new chrdev always guarantee returning complete buffer?
> >>
> >> If so, should it behave like that?
> >>
> >> Best regards,
> >> 									Pavel
> >> --=20
> >> (english) http://www.livejournal.com/~pavelmachek
> >> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horse=
s/blog.html
> >=20
> > I suppose you're right: a poll() should be redundant now with this
> > version of the character device implementation because buffers will
> > always return complete; so a blocking read() should achieve the same
> > behavior that a poll() with read() would.
> >=20
> > I'll give some more time for additional feedback to come in for this
> > version of the patchset, and then likely remove support for poll() in
> > the v6 submission.
> >=20
> > William Breathitt Gray
> >=20
>=20
> I hope that you mean that you will just remove it from the example
> and not from the chardev. Otherwise it won't be possible to
> integrate this with an event loop.

Would you elaborate a bit further on this? My thought process is that
because users must set the Counter Events they want to watch, and only
those Counter Events show up in the character device node, a blocking
read() would effectively behave the same as poll() with read(); if none
of the Counter Events occur, the read() just blocks until one does, thus
making the use of a poll() call redundant.

William Breathitt Gray

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+F+OsACgkQhvpINdm7
VJJ1lg//TGZtaRf3xh7whlm0NHwwiJSzE2fLZr/QnuqTM2TtBfQz/Y0yV9tC4HW4
7OVcoyo3UwgjT93XmEaEJ13iTxYl0szn5s+5mBShLwlOB/4jHyXOLY+9EKdxhmWl
O801nR0pZuaIXM8BkiVMRWIMF7N2LHioVn4b0iRCeUidF5hVX9aSV1tvLuib+eW7
X9i6o16OUQcaaiSJlWKJhFfW1MnVTuEa4+h3IqfQQFN4Aq4gr34s5sJWOYiqEuSJ
NKSpA5Dl/MnTWEEVoTlvfdrBKKidHNGjNmagKfn9RRoh14b4s6PFTgR9/Pn1Xjjj
6e+odPB2i8AYiST6VCRdSYbDN0ExgS79aEDjW+jAdr7IzyYn9Ht7gkUnpBNO6WP4
QulAaXpuJbF9qUZx+iUK4ZRT5RJO9/d4HJLi96K5E38RAqdOX9OYXF0jikXFXTbG
ZrQFtlpKZQXNqNEMKkKf0/OqLJcSEUSNIRW+132Dhfe08Z72kpf9du2ez7bxK1w9
W8EYp27aq9LVbd1SZ4Bdv5WaEy5sJ2dhT6EVFjtFpZHvQXZusKscorXvDegY1fq1
4nqmg54U/w3TEKiL+J9TJGHsFd1OnB5yfQt8jWEff/HU5866byKuyT8+PtaB+hUA
VOHCJRXVah2sDh/js/6jgxQ8ZLW236o4SqHJDPlTeN0FfkDAAVg=
=bg3S
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--

--===============9027145391660006882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9027145391660006882==--
