Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C18245175
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Aug 2020 18:33:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41FD9C36B26;
	Sat, 15 Aug 2020 16:33:32 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5782AC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Aug 2020 16:33:30 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c12so9298904qtn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Aug 2020 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UdXi5X9JdCDwyXidCVEz2m+8ZLjKmBUqZLTQciSb2xE=;
 b=VeyC3/j14NqkY/CTqvegy+SlcVkPkObQSuCMJPNHGh6GOlJ9veJftRkGQKz6KX0dAg
 8GCa9k16hpbcwcrA3S/Iu06iEPUkIza6fv4M4jYFDFr3wvRgAc+EfVs+QcsHLF2xIq0h
 yvgdHUMc3dZod9aBh4QRs4uXGSAzRUvcOGhtx1xy8mmsQU6cjqKju41+vtxG1uMQYIlX
 8r4BVaKyjzM9+gATHvwhVMrKqSXiJg5hybVAHxwOlDcMf2Q5Gh+qqKZGxD2N9HHl95eW
 97HJDB8pUBwklrkKvtYRuPYz4uaU9LGil+TeuWihYkvuNVzjhbwV7wVuDBReEwoxdlNu
 XNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UdXi5X9JdCDwyXidCVEz2m+8ZLjKmBUqZLTQciSb2xE=;
 b=fIveIKmQsG4XrmcFSqIeZ3QwaHrd2eMuo0XSe5NHjOxQyIK8i3GMsX+w1lq0Sbdrqe
 UIZ8kAAgJlK997cOsJyUJT+6Oj98MMSfAcShzTxoNUNQTTgsgVzudZoIPFuEp7KJPOzl
 WKoCYnNxf/znyJWU86LhRf2NOK+38lwN7K0cSTX6qGaRnZsmA03aATSFwQgxWXCd4+ZM
 U8BrKP3GNfQbHTvFCiWJQm/7QCyfPzB/7WvauIMPJaFD9bOQBkQQN9lvG/WJEN2FbhVb
 4klcyTmJgwQDgqcVgkWfZDoiWXEewjgFQ/5pV5vKVOuLLeQbkVFsP6VeYLY2Xj2bicGn
 Bb0g==
X-Gm-Message-State: AOAM532qPy7QevB1/gQ0AleuGuWi7VNMxopLnxRxiMbf7rhSRK18nbsL
 Tdh2LaKQOIT9Rta02wpzyko=
X-Google-Smtp-Source: ABdhPJyas3G6c7pqXG85ao3UCV84kja33y6oh2GPi3FAyAoVakAfHZOXxJf6Mg0auBHpyf4tO4inpg==
X-Received: by 2002:aed:3728:: with SMTP id i37mr6901689qtb.347.1597509209094; 
 Sat, 15 Aug 2020 09:33:29 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id r18sm14063798qtc.90.2020.08.15.09.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 09:33:28 -0700 (PDT)
Date: Sat, 15 Aug 2020 12:33:11 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20200815163255.GA6974@shinobu>
References: <cover.1595358237.git.vilhelm.gray@gmail.com>
 <e13d43849f68af8227c6aaa0ef672b459d47e9ab.1595358237.git.vilhelm.gray@gmail.com>
 <7209ac3d-d1ca-1b4c-b22c-8d98b13742e2@lechnology.com>
 <20200802210415.GA606173@shinobu>
 <4061c9e4-775e-b7a6-14fa-446de4fae537@lechnology.com>
 <20200809191500.GC6542@shinobu>
 <ca6337f5-b28b-a19e-735c-3cd124570c27@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <ca6337f5-b28b-a19e-735c-3cd124570c27@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, David.Laight@ACULAB.COM,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] counter: Internalize sysfs
	interface code
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
Content-Type: multipart/mixed; boundary="===============2497953038071377934=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2497953038071377934==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2020 at 05:48:07PM -0500, David Lechner wrote:
>=20
> >>>>>    =20
> >>>>>     CPMAC ETHERNET DRIVER
> >>>>>     M:	Florian Fainelli <f.fainelli@gmail.com>
> >>>>> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-qua=
d-8.c
> >>>>> index 78766b6ec271..0f20920073d6 100644
> >>>>> --- a/drivers/counter/104-quad-8.c
> >>>>> +++ b/drivers/counter/104-quad-8.c
> >>>>> @@ -621,7 +621,7 @@ static const struct iio_chan_spec quad8_channel=
s[] =3D {
> >>>>>     };
> >>>>>    =20
> >>>>>     static int quad8_signal_read(struct counter_device *counter,
> >>>>> -	struct counter_signal *signal, enum counter_signal_value *val)
> >>>>> +			     struct counter_signal *signal, u8 *val)
> >>>>
> >>>> I'm not a fan of replacing enum types with u8 everywhere in this pat=
ch.
> >>>> But if we have to for technical reasons (e.g. causes compiler error =
if
> >>>> we don't) then it would be helpful to add comments giving the enum t=
ype
> >>>> everywhere like this instance where u8 is actually an enum value.
> >>>>
> >>>> If we use u32 as the generic type for enums instead of u8, I think t=
he
> >>>> compiler will happlily let us use enum type and u32 interchangeably =
and
> >>>> not complain.
> >>>
> >>> I switched to fixed-width types after the suggestion by David Laight:
> >>> https://lkml.org/lkml/2020/5/3/159. I'll CC David Laight just in case=
 he
> >>> wants to chime in again.
> >>>
> >>> Enum types would be nice for making the valid values explicit, but th=
ere
> >>> is one benefit I have appreciated from the move to fixed-width types:
> >>> there has been a significant reduction of duplicate code; before, we =
had
> >>> a different read function for each different enum type, but now we us=
e a
> >>> single function to handle them all.
> >>
> >> Yes, what I was trying to explain is that by using u32 instead of u8, I
> >> think we can actually do both.
> >>
> >> The function pointers in struct counter_device *counter would use u32 =
as a
> >> generic enum value in the declaration, but then the actual implementat=
ions
> >> could still use the proper enum type.
> >=20
> > Oh, I see what you mean now. So for example:
> >=20
> >      int (*signal_read)(struct counter_device *counter,
> >                         struct counter_signal *signal, u8 *val)
> >=20
> > This will become instead:
> >=20
> >      int (*signal_read)(struct counter_device *counter,
> >                         struct counter_signal *signal, u32 *val)
> >=20
> > Then in the driver callback implementation we use the enum type we need:
> >=20
> >      enum counter_signal_level signal_level =3D COUNTER_SIGNAL_HIGH;
> >      ...
> >      *val =3D signal_level;
> >=20
> > Is that what you have in mind?
> >=20
>=20
> Yes.
>=20
> Additionally, if we have...
>=20
>=20
>        int (*x_write)(struct counter_device *counter,
>                       ..., u32 val)
>  =20
> We should be able to define the implementation as:
>=20
> static int my_driver_x_write(struct counter_device *counter,
>                               ..., enum some_type val)
> {
> 	...
> }
>=20
> Not sure if it works if val is a pointer though. Little-
> endian systems would probably be fine, but maybe not big-
> endian combined with -fshort-enums compiler flag.
>=20
>=20
>        int (*x_read)(struct counter_device *counter,
>                      ..., u32 *val)
>  =20
>=20
> static int my_driver_x_read(struct counter_device *counter,
>                              ..., enum some_type *val)
> {
> 	...
> }

Regardless of endianness for pointers, will targets that have
-fshort-enums enabled by default present a problem here? I imagine that
in these cases enum some_type will have a size of unsigned char because
that is the first type that can represent all the values:
https://gcc.gnu.org/onlinedocs/gcc/Structures-unions-enumerations-and-bit-f=
ields-implementation.html

What I'm worried about is whether we can gurantee u32 val can be swapped
out with enum some_type val -- or if this is not possible because some
architectures will be built with -fshort-enums enabled?

William Breathitt Gray

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl84DkcACgkQhvpINdm7
VJIMkxAAqCR+3cgDGKBMJ0a2SGKYclj8fhdGCxcN4vBaX7BTLdGt9uTejIBoMp4q
1IUyEoXhgzQbwAU19ZXovtu0qVd6YZSYOIPfHcG63QgWClFbsrF1KQVcDryJkdlL
mSap7y7MAP8XvawxmUUUQ5hYQYkgT41o1KilQYTcBe4uiyhICTA2ZIl07b1y2ZyC
u/ZayKBLY37P2P2T07W6HU3mIIuPTiJEXFzHrrSCB6DnzhtDxzwqbaUAjM6gLpGg
aRsUBKnbs7bxO4SiQVq1kFkm9TGRnqwXI0JZq8dZ7UdT49CqkocJKPWvBYsW2hGw
Dx8nrlIdN6XOokcHlWhRKXg5SanuqCJqjuHvCM+/PfohLfteT6NOkDkGdUtrS5w5
7KGn5BLGiC1trXIBsZtKThSJNniQC2GXDuTZrqHWgNW6Lb9dGQWAwaHtvv4ngd26
n6f4kfmQGrTf/DQ8B34z3pYxVmPrSYVNYFYwRzGSkoeBc9HGIU+X68RrHnVzQY8N
HWsluxVlBD2Zt8vK/+W2sG5gQXr1R2PFXPYsn/dm3zDYWlhqoOK1nGuJXbrwvI8f
QBelsICf3bQcObF3kvOFV7QtWS0u36IjjsMunzUVsY6fCHomfsijIFcCmN8ui2mw
HBZ7enuTvV7dX0u7yxvce7gRlTuGjEzRXik9kf6p+NsTKpwNgus=
=ZYDv
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

--===============2497953038071377934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2497953038071377934==--
