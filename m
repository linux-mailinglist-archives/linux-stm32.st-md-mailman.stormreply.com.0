Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB35931F612
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Feb 2021 09:51:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57842C5719E;
	Fri, 19 Feb 2021 08:51:51 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF3A5C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 08:51:47 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id o38so3412015pgm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Feb 2021 00:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZX/0vn+4d0GadCfE6C+zcMHKBe8kMLF0TT0FFLEZWko=;
 b=gp4UIalZOAkD+9D6/YZrYAsj+BWkWdjYpymhbfYsJdSc12qD46kAFL5uvCxfrFjTbW
 NcDYnMQx1ZWnR3ySqHQa3vtiWKgIcZVF3XZJd9w4bkUwiOdkKPZoLlLMmOW2vIDLKfzb
 7zjfoWmNZG7CeLrWRX09+llAZjfJqGUvPME8IT+n631hYDJmWqsMDAvgJSUKgioqBMOT
 /tI+Jdo3RCp3jQ4QioB0NrgHMFA9A8XPPgvDv9Ey+E4FLGUribU3P8NorDCvTXkE9wyx
 1Je/Gw/CDt2XdROS6IEmxswI4ITvAXcHy9uCGGxcdokOtjn7yP4hUSA9rOFvAZFnsTgp
 I22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZX/0vn+4d0GadCfE6C+zcMHKBe8kMLF0TT0FFLEZWko=;
 b=TTG78/UbReYpvOjY0ZYVbK2woZf4NQt5L/Z7qqSBEYDhkiK3SM/PClyHMC2OKA98s2
 wTg+eFgFLO+dEkNUICW5x1F9jMVs2bWu9T6kwIjuwBxEY7HKmyBrZEc+27dAXrEdw+Zn
 3fqj+MVBydenXmy3Eb3rWk1llG+d7u9x8EESYxqqjxCby/mpUk+9S7PfREQ0VkZawjot
 5wxzUS/jFRWhtaO89AitKHtNgt8YROR8gkD6xWTl8i1kgjIh0HkMBL3yL7nxPeLwCcN3
 r7E4F7TaWzNF3Aw5fLS9eOc3zSqFWLEKG2EPCVcm1UGnfoCkQwbXjs7deUSrmTl2Pn+i
 7RDw==
X-Gm-Message-State: AOAM530Y2Qa8WvGUuuoJvVvVZpv3Wd4F5veMvMUQDpbrYj5zePlqzwqx
 TgJPD+sRJGTfUDL1xIi1jqc=
X-Google-Smtp-Source: ABdhPJz1tkjQ5wEB6PWfTQeIvZWmVYTed76QBMR8Bc1Hd5itPLBAQDEmnH8GyFqWxdto3uAN+Stk0g==
X-Received: by 2002:a63:ca45:: with SMTP id o5mr7730598pgi.48.1613724706449;
 Fri, 19 Feb 2021 00:51:46 -0800 (PST)
Received: from shinobu (113x37x72x20.ap113.ftth.ucom.ne.jp. [113.37.72.20])
 by smtp.gmail.com with ESMTPSA id u20sm8301896pjy.36.2021.02.19.00.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 00:51:45 -0800 (PST)
Date: Fri, 19 Feb 2021 17:51:37 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YC98GTwzwt+pkzMO@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <c9b55d1cff6acac692a7853b0a25777ecf017b12.1613131238.git.vilhelm.gray@gmail.com>
 <20210214180913.05bd3498@archlinux>
MIME-Version: 1.0
In-Reply-To: <20210214180913.05bd3498@archlinux>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 19/22] counter: Implement
 extension*_name sysfs attributes
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
Content-Type: multipart/mixed; boundary="===============5064598525157843460=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5064598525157843460==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z+ATVKzf56OJTET9"
Content-Disposition: inline


--Z+ATVKzf56OJTET9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2021 at 06:09:13PM +0000, Jonathan Cameron wrote:
> On Fri, 12 Feb 2021 21:13:43 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > The Generic Counter chrdev interface expects users to supply extension
> > IDs in order to select extensions for requests. In order for users to
> > know what extension ID belongs to which extension this information must
> > be exposed. The extension*_name attribute provides a way for users to
> > discover what extension ID belongs to which extension by reading the
> > respective extension name for an extension ID.
> >=20
> > Cc: David Lechner <david@lechnology.com>
> > Cc: Gwendal Grignou <gwendal@chromium.org>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-counter |  9 ++++
> >  drivers/counter/counter-sysfs.c             | 51 +++++++++++++++++----
> >  2 files changed, 50 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentatio=
n/ABI/testing/sysfs-bus-counter
> > index 6353f0a2f8f8..847e96f19d19 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-counter
> > +++ b/Documentation/ABI/testing/sysfs-bus-counter
> > @@ -100,6 +100,15 @@ Description:
> >  		Read-only attribute that indicates whether excessive noise is
> >  		present at the channel Y counter inputs.
> > =20
> > +What:		/sys/bus/counter/devices/counterX/countY/extensionZ_name
> > +What:		/sys/bus/counter/devices/counterX/extensionZ_name
> > +What:		/sys/bus/counter/devices/counterX/signalY/extensionZ_name
> > +KernelVersion:	5.13
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Read-only attribute that indicates the component name of
> > +		Extension Z.
>=20
> Good to say what form this takes.

Do you mean a description like this: "Read-only string attribute that
indicates the component name of Extension Z"?

William Breathitt Gray

--Z+ATVKzf56OJTET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAvfBkACgkQhvpINdm7
VJIzrRAAiZ+eMLbJ0vaW9ezjJpkSnHfiyB5JKIbYfzn7RticBncbdaXLrFHbq9y/
cWxBrgijMQ9h2SwX8gW+ovh6u7cfCW+FFvLtS9UAb9jiM/jTangdAASyMmjLTFDb
04zodzHmS88tT+Wd5AQICiAR3MRAglHfyED3Utq2DSDvSkgB6vMo3JfuVrdQaKaS
haOt0+djMIYtjoqk6HuvokA3Fwq4SBh2Ey8miBy9TXedsiMpeEMv7BO/rOoMIyJH
OsKqnvQVR0OncdCYzWL1ENnu8NQo/4GIgDrwHTQXMTYXune1u8oM8vAkLXeJ8tlU
TLUBRTjQaHt5E5Qz+vyxYsahSyZ6G/qDJ4oDRApSpfHhXuZmF4a1yqzzWOoFviuh
kqubzCcDzYb5svEbp1T5N9Wqi1Q4By8r2Y3JQA6kt4Y0YGqlRZP5uMbwS0kvplYS
AMqnslpxOWbEBQgxpjEHhAP3iB1yHmopGBvBWJX4X2oTOslVK9tv3BpRXIHDOCz4
1+cxy4DNAS0KdskIv0jOhEfbyPzEYi7n424aA+Mhgs0LSgkDjCXw4WqPmJX2CS+Q
pCgwMJfgqW61pZBeMfv6HaqKw1DKzESf1DUrqgWry1zvdO43xozbqdvat8iAJO/N
UIm9sFwsQDTAym3cvbPuNCePtvb0rqN7Wo4QnZfOBHBa+9Oifgc=
=Rifk
-----END PGP SIGNATURE-----

--Z+ATVKzf56OJTET9--

--===============5064598525157843460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5064598525157843460==--
