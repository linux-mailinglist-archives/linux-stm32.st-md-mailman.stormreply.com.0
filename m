Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1833091F9
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jan 2021 06:15:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 140B2C57183;
	Sat, 30 Jan 2021 05:15:45 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8393C56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jan 2021 05:15:42 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r38so8008995pgk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 21:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DajhKcQbvSudZ+FOJNrz2aW0zOcE1tiQUOXaXnxB8PI=;
 b=A2wpAIaWTg4pDD9bNSTe4FEpzxuaqCYRaCVihvKx9wk4a53sZUM30exdllaZC+58wB
 DcS/Eju4Mj+AWigJelaiXevcBUWJgdFgRGpphd01ISsYAwKghf1M6aksu+BlnwN6eX8w
 2LctfS3dvly0L7a/zRbjYVfOCKG0X2vW3nIh5bYs0+u4Y4OZ6ZoeUJaKj9qOUh7XeBoL
 RsILgZWUtTyoktjsIFoSGaxIv5MTTFaN4KJSZe5FBaZV5hTghnl1KrHqz1cmWfdOB+EH
 +x1t/hUWbaWdRZGKDmXZMXVrYhScbRb2bbsA1he8ykO28gGC1Dn0efZe94Q/Xan9wJEq
 elPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DajhKcQbvSudZ+FOJNrz2aW0zOcE1tiQUOXaXnxB8PI=;
 b=sA79PeP9BUe5VaQ6BNCqolGv/omCAa0JPXOyofBegmSMjuNbBWKRvFQP1/MErpq9qb
 7xD53WmLSgjz4EDQYrxGIMXyaHvs4SDM8WFQiipM34fuyKKPmYeipiNjj76IZQ4F+rRx
 bLP0oFk5MPuIQiL9gJA0nwk2qIX6WU0ncwGBnJc5K2NSRGZD47Py+TeDu8SDoJxU30aq
 Svs9PIKKNCUIW0NYmcwc/djmee5IEoYEsEoLUNU4CtYWzRytNXgwOtBNGFPLYu4h67Cg
 TuUjzzMLP/YSGJGknEEuHRoVzk8W2gW9uH9HhbB7eIvuP5WJm91z1a/YXKb6hb4i3Q3U
 C7Fg==
X-Gm-Message-State: AOAM530xUtU5TrcKujj3NAPOh/6urk/+vF1oMJgtnkiFR8aV0p0kfGGI
 NXQ9Tl7npofM7h+9VQh0D8M=
X-Google-Smtp-Source: ABdhPJz3xXOhtRoebqWMcQVAVlzvOHOj3KQTzng9Dt2tFdWx6XxcAnUKxQc98am3f2V4rV+jkl4rog==
X-Received: by 2002:a65:62cd:: with SMTP id m13mr7931884pgv.108.1611983740662; 
 Fri, 29 Jan 2021 21:15:40 -0800 (PST)
Received: from shinobu (113x33x126x33.ap113.ftth.ucom.ne.jp. [113.33.126.33])
 by smtp.gmail.com with ESMTPSA id
 v8sm10269068pfn.114.2021.01.29.21.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 21:15:39 -0800 (PST)
Date: Sat, 30 Jan 2021 14:15:29 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <YBTrcYgbXfKYaQnX@shinobu>
References: <cover.1608935587.git.vilhelm.gray@gmail.com>
 <57bc509273bf288d74835e6ebdaebf27b4991888.1608935587.git.vilhelm.gray@gmail.com>
 <20210128090113.GA8734@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210128090113.GA8734@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com, kernel@pengutronix.de,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v7 3/5] counter: Add character device
	interface
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
Content-Type: multipart/mixed; boundary="===============7073698075783637836=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7073698075783637836==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYrx736tSU4e+spo"
Content-Disposition: inline


--mYrx736tSU4e+spo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 10:01:13AM +0100, Oleksij Rempel wrote:
> Hello William,
>=20
>=20
> On Fri, Dec 25, 2020 at 07:15:36PM -0500, William Breathitt Gray wrote:
> > This patch introduces a character device interface for the Counter
> > subsystem. Device data is exposed through standard character device read
> > operations. Device data is gathered when a Counter event is pushed by
> > the respective Counter device driver. Configuration is handled via ioctl
> > operations on the respective Counter character device node.
> >=20
> > Cc: David Lechner <david@lechnology.com>
> > Cc: Gwendal Grignou <gwendal@chromium.org>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> ...
> > +struct counter_event {
> > +	__aligned_u64 timestamp;
> > +	__aligned_u64 value;
> > +	struct counter_watch watch;
> > +	__u8 errno;
>=20
> This variable clashed in user space, as soon as you include errno.h,
> with the libc's "magic" definition of errno. What about "err" instead.
> I'm not sure it an __u8 is the proper type, IIRC usually it's an int.
>=20
> Regards,
> Oleksij
> --=20
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Sure, I can rename this to avoid a possible clash with libc's errno.
Maybe "status" would be more apt to indicate that this is an exit status
for the event -- the code returned may simply be a warning and not
necessarily a critical error.

Regarding the datatype for this value, I've opened up the discussion in
my reply to David Lechner [1], so perhaps we can continue it there.

[1] https://lkml.org/lkml/2021/1/30/5

William Breathitt Gray

--mYrx736tSU4e+spo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAU63EACgkQhvpINdm7
VJLsxRAAhlCPUhj65vzfuqQStMkmCoKCekEBmx0CS9yJR2Ilrcqm0yvEZdq5q/c4
/FjnucZRerDshexfeRaaDg4h8guEXzp8YcmM74NTEn8tpsvwNVFWFcbwbePlvHTt
VtU6qRRN8Bu50wVwdqchRiMuJA9jcAR/5YcfGslq7bxGcvEhQgNvlrjI+NG9tNUU
smKjjeqBW1AMMFs7CQ4i2QwNA+Vdfy3/Fun9Qsx41zMHAV8/c7UVbIBF3XsqdJHl
AAphNutr43FIjqrvb3MMVrk06sQ0f8SjEjypX6jODB0dzug5JDtnt1/MdvBO5gSN
e6/QLq4wgz8Rvl6YECPFBZvt9Bk31tmPWsUg6JQduASolLoM7kCW4XDIGzeHBEiT
ESipbOGVVeM3WQlON5+bf9li7ARIPEFajcOViw1R8LbASwSXv1MOuDoLHHHfVRg4
kVFJCD0K/g635AkOHB/Nve9ju0x15u7aJOibOzU6YyyuY+kkj1Yir8QMYf2IBUvA
CMHkZwxt2uSIFvjVdXrOFuHCoqQnRSIL+USgBk3T/NtCMrGDaPd2RDEE0VL2+O0Z
T2Dwuzzd1QnCYrZWQFgjaPOgUIPYf1sRWUpkr4s1//RQN+kLCEepauTHgApP9+4m
7peK1qgaGSNZYjq7lcdzv8J410JU6D9ZgIGe3BpUhLqGGBDHQcE=
=9dBE
-----END PGP SIGNATURE-----

--mYrx736tSU4e+spo--

--===============7073698075783637836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7073698075783637836==--
