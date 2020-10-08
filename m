Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B28D287426
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Oct 2020 14:29:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CED7C32EA8;
	Thu,  8 Oct 2020 12:29:04 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5751AC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 12:29:02 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a23so6646999qkg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Oct 2020 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L+T+Mlm/JCxCYUqi0t2sTT67u00gxB27VW90eip5Nu4=;
 b=GWZH4Wsc2aHIRWPhTfI/wUW1Cvrdnj7YM0r+U76Azji2t1Q7bjTZ8EBdQEZps/R8EA
 ak/CwZurudp06MPVVduv2rKZzDw1sosX6CPZHd+gqkVcSi3gIMaUb+/yF/6Z5qU2vo//
 MCsjt1+d6bQLCFMXcs9wf9bCJJAi1UkxqjSsj+DD8ppuX2C8BwcCoDmCXYUZMooodgg5
 xKUUOZZYiqygUgjxAeHAzJZkoxLa0etoSJHbSVtyJxe+DcJo5fvgYgwzCSw4j93b1KDw
 ilYKaxchkMZMP4paXNLq+yefqbXz/vTQ1QXK9V6QV++9U8gyG3kbYrVLMs0YOZ/7PR/A
 sC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L+T+Mlm/JCxCYUqi0t2sTT67u00gxB27VW90eip5Nu4=;
 b=B67UKpKjplYEgjlm6JPn0SO1NLbdyq4vJOvjOJ+maUsl7jbHnFUngsp441jeYquItD
 mxr1JGKyBGXzk8N6I5HE+ozFrgVwN5ZwMtlWB0OFg64NKg8xhrw6zrVtFBZUVHRbjTB8
 OauCd4VEhyQ6B1ltSP8FjhEo8cO9ZZKv8AUyEdRYFRqlxW8mJXbbqhJF8fM2AHYTPQf2
 MZNvHwIgvQEHyK3I/YjUXpOC5BMO5svPX9AKbFSsEWh7+UPlQN99lCy0ubAoPneJHY9w
 1WRgb3nerRKPrXGt9K6DVkZe4NcpoBkqGQFnvc3APm5pvJzmj2fZI8KAB/4KkMFTfL/l
 dXLw==
X-Gm-Message-State: AOAM531Y5TUH2U+1O4p0HtwOF9Upa20jIFUN3IgyoqUYrjAs0amjUqSL
 bl7Ou5v0YS9DR6HcWxT8pfI=
X-Google-Smtp-Source: ABdhPJwUp1exFR9P/8N0SjYBSQyJ3/neiSlBncodafR8VBncaGZtGzbfV8NnSx5b2OLKgJHopawzIw==
X-Received: by 2002:a05:620a:99d:: with SMTP id
 x29mr1825111qkx.415.1602160141227; 
 Thu, 08 Oct 2020 05:29:01 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id 184sm27349qkl.34.2020.10.08.05.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 05:29:00 -0700 (PDT)
Date: Thu, 8 Oct 2020 08:28:45 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20201008122845.GA3314@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <54190f9875b81b6aa5483a7710b084053a44abb8.1601170670.git.vilhelm.gray@gmail.com>
 <20201008080909.GA31561@amd>
MIME-Version: 1.0
In-Reply-To: <20201008080909.GA31561@amd>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
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
Content-Type: multipart/mixed; boundary="===============5618662527454912864=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5618662527454912864==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2020 at 10:09:09AM +0200, Pavel Machek wrote:
> Hi!
>=20
> > +        int main(void)
> > +        {
> > +                struct pollfd pfd =3D { .events =3D POLLIN };
> > +                struct counter_event event_data[2];
> > +
> > +                pfd.fd =3D open("/dev/counter0", O_RDWR);
> > +
> > +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches);
> > +                ioctl(pfd.fd, COUNTER_SET_WATCH_IOCTL, watches + 1);
> > +                ioctl(pfd.fd, COUNTER_LOAD_WATCHES_IOCTL);
> > +
> > +                for (;;) {
> > +                        poll(&pfd, 1, -1);
>=20
> Why do poll, when you are doing blocking read?
>=20
> > +                        read(pfd.fd, event_data,  sizeof(event_data));
>=20
> Does your new chrdev always guarantee returning complete buffer?
>=20
> If so, should it behave like that?
>=20
> Best regards,
> 									Pavel
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html

I suppose you're right: a poll() should be redundant now with this
version of the character device implementation because buffers will
always return complete; so a blocking read() should achieve the same
behavior that a poll() with read() would.

I'll give some more time for additional feedback to come in for this
version of the patchset, and then likely remove support for poll() in
the v6 submission.

William Breathitt Gray

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl9/BfMACgkQhvpINdm7
VJLlWxAA6P8iWbbwKdj7bkiAQIaSMh8Os/F1sO6AcUBqYxmMS2284jYpB1PWYm86
WMOfpjzE1TL+qc8Zl0/McZydw2huS5HvhRq4++PM/W+5Ohv/uajZiQyoC5jlmBIF
7u4ewc+X37t0T7SSdtdOPM6+em8Qdq/8ghPEgEWGHfBe/ls/eTcD4I1IZikpHyft
PM776AufGoc8A/IIaLYtO5UEI1dNXmyRrK+GOZJft+lRtMZWTjd5j6nK+vfiCaw9
hS2dJofatgyjZBxvqD6t8D+PRhyebaeKyAaK0TQPtu9P+61cZcVcCJ6iKV7Ugh/T
41kYb7opP8j9gxv9HoJbBbYtTTB5yGGO8fRBQ1vO2pLXNXuaEE9v/w+LyagKi/Kh
j+crZFgPJIpvYcm6vi7Vr5KP+jl8Rbm1i4UjoAv4a07RR+D7H3c+v9jFAQDezB48
dIww19g41Yig28jQ7Un5n4drOxPbc4lIYJDYYncsHlJea6/I2K8eM8pTakOSiv9j
aBQSoG+PaDfQnsM462KMpgiNn25Nz/WLz2dbJP6phwRJGr5auPue8EbxW5m1Cu5y
KhX7B1QALpZWo76BFYcst6GMD/dz1T5XeGGCkGZvS/8RiIfRVMLefBc9DY0QPxJz
QPrc+N2DCihZhAKPQRtptqgh36cm37FZV0jAE3YGJH4AZOxEFjM=
=kkTp
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--

--===============5618662527454912864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5618662527454912864==--
