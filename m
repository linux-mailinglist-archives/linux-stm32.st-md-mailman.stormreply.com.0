Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC39325A35
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 00:33:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0FB9C57B59;
	Thu, 25 Feb 2021 23:33:11 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 419FCC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:33:10 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id e9so4569104pjj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 15:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bryi5nIeAqPN6gv7PQEAJOmSmh8foFZDgMCzK44/Hyg=;
 b=iqG/f6sZQa2houoo+VxHHF5MXsX3q6ya/wwhRKCc0jn/JbAnFB2nwn6AcRC+SMb8by
 TtrQtNyfQLBdLC/7ipEnKQMfykNO7XppSRejPMrIAI42mzlddkR4Va38kmWC/dOZB9Q3
 yQW81DF+qMabSjoY3OIDOsEtdv9q8R5ISUZ9OWeos27i6/ounQu/uOVvTXEUVN5hmqY6
 d7ndpm/Mvctmq5r6ewk5IAPWvqhsrbrcnnwAI4QZ2AVAD6mAjTOtd1//QPmJGUZkOJ+N
 a5X290eJgasRN/rkCxp055Hbb+DIQOTEEP2DFwWZomTMZQIT6OT5ZWNwn0wLIwQHwHVL
 oT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bryi5nIeAqPN6gv7PQEAJOmSmh8foFZDgMCzK44/Hyg=;
 b=jt1AOz5b1T4ACsAFAfAXF5cUuC6L/fhAzSotK+DsKXzf1voJdx84Gr/ItUBFaPyy0q
 gJWRwkIlrhAvrY6JQBLutiwl3FnmpIMBA25k6krQrnDSK136ksrBY9pPOmM/3Hl7fIEW
 TRdDvWo2AWsyxPRHh7LhfNjCkkEzvJ15mAY5pW0qKRTJ6XNMUagS5Tr/uXli/H+w7gtE
 sYjoPKTibHlQUCU9H0wGqicoX08Lr1vwZrGGxURwPXY2bih4xVrBslMnsR35l8qHIh+d
 Q0oUWyoKFxpJiKvKpBSYrsjlWiaq7ozTp0m+GZ+ChxKgTJlwVyWP6dvCnZsAtz8eg7H7
 EzMg==
X-Gm-Message-State: AOAM533ig4xle147C/kMjmCqEnw42sPjGVp6XdnimndX0aEROofZkrTI
 R/BleMdS/nkTqpmSlo5RuIc=
X-Google-Smtp-Source: ABdhPJxMEOKq3iRqEYUSu0q+taLEkz0dkFYCzdzEkJXmSR/VAt/A+73uvo8HhMqtFBoeA3pTOYRZhQ==
X-Received: by 2002:a17:902:c407:b029:e3:cfa7:e300 with SMTP id
 k7-20020a170902c407b02900e3cfa7e300mr203101plk.49.1614295988431; 
 Thu, 25 Feb 2021 15:33:08 -0800 (PST)
Received: from shinobu (113x37x72x20.ap113.ftth.ucom.ne.jp. [113.37.72.20])
 by smtp.gmail.com with ESMTPSA id 8sm7577762pfp.171.2021.02.25.15.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 15:33:07 -0800 (PST)
Date: Fri, 26 Feb 2021 08:32:59 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YDgzq6t5YRm6cFvO@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <c9b55d1cff6acac692a7853b0a25777ecf017b12.1613131238.git.vilhelm.gray@gmail.com>
 <20210214180913.05bd3498@archlinux> <YC98GTwzwt+pkzMO@shinobu>
 <20210221140507.0a5ef57f@archlinux>
MIME-Version: 1.0
In-Reply-To: <20210221140507.0a5ef57f@archlinux>
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
Content-Type: multipart/mixed; boundary="===============8360103093578994160=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8360103093578994160==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g5C8206GHyZn93ao"
Content-Disposition: inline


--g5C8206GHyZn93ao
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 21, 2021 at 02:05:07PM +0000, Jonathan Cameron wrote:
> On Fri, 19 Feb 2021 17:51:37 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > On Sun, Feb 14, 2021 at 06:09:13PM +0000, Jonathan Cameron wrote:
> > > On Fri, 12 Feb 2021 21:13:43 +0900
> > > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> > >  =20
> > > > The Generic Counter chrdev interface expects users to supply extens=
ion
> > > > IDs in order to select extensions for requests. In order for users =
to
> > > > know what extension ID belongs to which extension this information =
must
> > > > be exposed. The extension*_name attribute provides a way for users =
to
> > > > discover what extension ID belongs to which extension by reading the
> > > > respective extension name for an extension ID.
> > > >=20
> > > > Cc: David Lechner <david@lechnology.com>
> > > > Cc: Gwendal Grignou <gwendal@chromium.org>
> > > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > > > ---
> > > >  Documentation/ABI/testing/sysfs-bus-counter |  9 ++++
> > > >  drivers/counter/counter-sysfs.c             | 51 +++++++++++++++++=
----
> > > >  2 files changed, 50 insertions(+), 10 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Document=
ation/ABI/testing/sysfs-bus-counter
> > > > index 6353f0a2f8f8..847e96f19d19 100644
> > > > --- a/Documentation/ABI/testing/sysfs-bus-counter
> > > > +++ b/Documentation/ABI/testing/sysfs-bus-counter
> > > > @@ -100,6 +100,15 @@ Description:
> > > >  		Read-only attribute that indicates whether excessive noise is
> > > >  		present at the channel Y counter inputs.
> > > > =20
> > > > +What:		/sys/bus/counter/devices/counterX/countY/extensionZ_name
> > > > +What:		/sys/bus/counter/devices/counterX/extensionZ_name
> > > > +What:		/sys/bus/counter/devices/counterX/signalY/extensionZ_name
> > > > +KernelVersion:	5.13
> > > > +Contact:	linux-iio@vger.kernel.org
> > > > +Description:
> > > > +		Read-only attribute that indicates the component name of
> > > > +		Extension Z. =20
> > >=20
> > > Good to say what form this takes. =20
> >=20
> > Do you mean a description like this: "Read-only string attribute that
> > indicates the component name of Extension Z"?
>=20
> My expectation would be that the possible strings are tightly constrained
> (perhaps via review). So I'd like to see what they are and a brief descri=
ption
> of what each one means.
>=20
> Jonathan

Okay I see what you mean now. These names will match the sysfs attribute
filenames. So for example, if Extension 9 of Count 2 of Counter device
is /sys/bus/counter/devices/counter4/count2/ceiling, then the attribute
/sys/bus/counter/devices/counter4/count2/extension9_name will hold a
value of "ceiling".

The idea is that the user walks down through each extension*_name to
find sysfs attribute name for the Extension that they want. When they
find the desired Extension name in say sysfs attribute extension9_name,
then they know 9 is the ID number for that Extension.

There is an alternative design I was considering: instead of
extension*_name attributes, we could have each Extension sysfs attribute
have a matching *_extension_id attribute which provides the respective
Extension ID. So for example, using the same Extension as before:
/sys/bus/counter/devices/counter4/count2/ceiling_extension_id will hold
a value of 9.

Do you think this alternative design would be more intuitive to users?

William Breathitt Gray

--g5C8206GHyZn93ao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmA4M6EACgkQhvpINdm7
VJIBCg/+JWYA6xMb2Q9RpprWLkpN2p4IE7zL9kEZE+WzE6aHG1+usGMbF3AQMIO9
LqssPDGtbchunSQk7RHkT8OMuUXIRaiIl1tE1Lefh+Tylaf4+VLbJo1t+I21MmLr
LZDV8vnQnwFjhZhPgfOJo+dnOY1SldnRcZzfER607uWOb3xtVpHsdpWaS+IMwt6e
Yn0Qe8URcv05YGrw4N2re9HtNU01hwlMTyKst7pNyY15MRwmPI7c9sBWC8nWKaCZ
butQTV3VGDUA3VZ/DVwo0aOZ8HFbWsOpZKGII2IGNIvVgXBCKrkIw1W9wX9mHi4t
s5uuIW0XBys3SzaxqV/zzV2jtQy/TexhjLMBELX+4M4WMeAbAGoHUA337QoI3EP1
Z0b28249Cax2iddXR90cisXqYMd8F/9fCaMzgR3lQF/pC3wB9LCk9JhCPaogtRRC
ZleiZZA3/cgnYFiUlOcb4mfQGlxOSk2fs/EoXdfKVbmuxaHddiqFZJxImv0TnrWg
Gag0WcYipOglgAQyJUwP36FBerkcqUc463KF7BtSp3in5YMPhR5xgOxS3nlK2rKO
ySKzH/JjLsIQ1vaKb/Z42sPNJ+7XANxp+Wuoz2kKwHWevljJybwJG+AAIwMlyrqc
osUnIPljV010+LeG2LU9AS7tdrN3l49nDY6XS4ITC3HXeTHIzuo=
=IeB7
-----END PGP SIGNATURE-----

--g5C8206GHyZn93ao--

--===============8360103093578994160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8360103093578994160==--
