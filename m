Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D72DF6EC
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Dec 2020 22:44:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92E31C56611;
	Sun, 20 Dec 2020 21:44:07 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B821C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Dec 2020 21:44:06 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id 19so7310912qkm.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Dec 2020 13:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zHVLZgXZIM4TmTpEy58xQ29e7tTOwbkWogxRTq7+Q/4=;
 b=PuMdkLqUKZ7QZHpvt4nWcW+HrLc96qLy/8UkSDe3ajBfbYuow3YExknr6ih5JNDi9p
 vYGezxmrwWzS5aqS9bUaeKJn66HRIRIcbQNLkMs+tipN3nbBRqxJK3EbCAEhTwQff72V
 iagOBZ4hMRcstIZ2s1ql3ZI0dyx0H6xrz+u0fHilm95zqkmbHh21UNwsyg/m62s0qyrZ
 gY41nsVQBw2sIpzAs6607Du2ihwHJVvAgt7q6XW1TlnxQmWdHMjUPPEkAheWfsC/LMUx
 iG2UR2o99G0lH4FHk9lOtf6WujCJV8r3UdmeKtZOS2NQxyk1ljUuIzZc9CmMHGGtLdQY
 INdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zHVLZgXZIM4TmTpEy58xQ29e7tTOwbkWogxRTq7+Q/4=;
 b=hc+BwZaBOHY2TdhKOC4Dj+BEJn298bnY/7sJLzRl1VeC0SqRVTU6/rTxqwZhcAGQ37
 169/vsUgGjyzISLjr6rXO/qNnUMzVWHcZBE1wctl/tkMo3FkX45lJ4IkOIgRHm0FZAjs
 9n63weJByUkQhYhitw3eANRVRlX0nlyIts71s+ZhI15XPmrq9zMrr+7slMBIRLhCcbE8
 5BGhk1VohVt/z/4AIGXcRDnXnSmVKDm7mRUDADZ1S38fK91V8zy6AzlQmr7ieNB8PYwa
 EgP3TFX3mlw6NkrFBcmmVXR/rwyh/G5tjN7dN+SSaTvpXwUpcRB1t1CbBAZ4uFR9/jfe
 UF+Q==
X-Gm-Message-State: AOAM5339Z0OmtqXIseqy5kw2e+J7QnIeDc2wVWOH5bzWDEmIrWqbssqo
 hqE/xGaUEn2KzB8jq8JvcL8=
X-Google-Smtp-Source: ABdhPJxQYKDnKqi5QQeQYX5N/kXcW237Lj96UfceqIIDhm6a0q6YtWQykgru6JIZT8IKLM6tWGgyBw==
X-Received: by 2002:a37:a342:: with SMTP id m63mr15005445qke.120.1608500645040; 
 Sun, 20 Dec 2020 13:44:05 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id d190sm10151158qkc.14.2020.12.20.13.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 13:44:04 -0800 (PST)
Date: Sun, 20 Dec 2020 16:44:01 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>, David.Laight@ACULAB.COM
Message-ID: <X9/Foc6wGl5dR1yK@shinobu>
References: <cover.1606075915.git.vilhelm.gray@gmail.com>
 <6f0d78ae-9724-f67f-f133-a1148a5f1688@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <6f0d78ae-9724-f67f-f133-a1148a5f1688@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 0/5] Introduce the Counter character
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
Content-Type: multipart/mixed; boundary="===============7651916509686096094=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7651916509686096094==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D0h9yNnjO8W6xx5O"
Content-Disposition: inline


--D0h9yNnjO8W6xx5O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 13, 2020 at 05:15:14PM -0600, David Lechner wrote:
> On 11/22/20 2:29 PM, William Breathitt Gray wrote:
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
> >     used by driver authors to implicitly cast these values via the driv=
er
> >     callback parameters.
> >=20
> >     This question is primarily addressed to David Lechner. I'm somewhat
> >     confused about how this setup would look in device drivers. I've go=
ne
> >     ahead and refactored the code to support u32 enums, and pushed it to
> >     a separate branch on my repository called counter_chrdev_v6_u32_enu=
m:
> >     https://gitlab.com/vilhelmgray/iio/-/tree/counter_chrdev_v6_u32_enum
> >=20
> >     Please check it out and let me know what you think. Is this the
> >     support you had in mind? I'm curious to see an example of how would
> >     your driver callback functions would look in this case. If everythi=
ng
> >     works out fine, then I'll submit this branch as v7 of this patchset.
>=20
> I haven't had time to look at this in depth, but just superficially looki=
ng
> at it, it is mostly there. The driver callback would just use the enum ty=
pe
> in place of u32. For example:
>=20
> static int ti_eqep_function_write(struct counter_device *counter,
> 				  struct counter_count *count,
> 				  enum counter_function function)
>=20
> and the COUNTER_FUNCTION_* constants would be defined as:
>=20
> enum counter_function {
> 	COUNTER_FUNCTION_INCREASE,
> 	...
> };
>=20
> instead of using #define macros.
>=20
> One advantage I see to using u8, at least in the user API data structures,
> is that it increases the number of events that fit in the kfifo buffer by
> a significant factor.
>=20
> And that is not to say that we couldn't do both: have the user API structs
> use u8 for enum values and still use u32/strong enum types internally in
> the callback functions.

I'm including David Laight because he initially opposed enums in favor
of fixed size types when we discussed this in an earlier revision:
https://lkml.org/lkml/2020/5/3/159

However, there have been significant changes to this patchset so the
context now is different than those earlier discussions (i.e. we're no
longer discussing ioctl calls).

I think reimplementing these constants as enums as described could work.
If we do so, should the enum constants be given specific values? For
example:

enum counter_function {
	COUNTER_FUNCTION_INCREASE =3D 0,
	COUNTER_FUNCTION_DECREASE =3D 1,
	...
};

>=20
> >=20
> > 2. How should we handle "raw" timestamps?
> >=20
> >     Ahmad Fatoum brought up the possibility of returning "raw" timestam=
ps
> >     similar to what the network stack offers (see the network stack
> >     SOF_TIMESTAMPING_{RAW,SYS}_HARDWARE support).
> >=20
> >     I'm not very familiar with the networking stack code, but if I
> >     understand correctly the SOF_TIMESTAMPING_RAW_HARDWARE timestamps a=
re
> >     values returned from the device. If so, I suspect we would be able =
to
> >     support these "raw" timestamps by defining them as Counter Extensio=
ns
> >     and returning them in struct counter_event elements similar to the
> >     other Extension values.
>=20
> Is nanosecond resolution good enough? In the TI eQEP driver I considered
> returning the raw timer value, but quickly realized that it would not be
> very nice to expect the user code to know the clock rate of the timer. It
> was very easy to get the clock rate in the kernel and just convert the
> timer value to nanoseconds before returning it to userspace.
>=20
> So if there is some specialized case where it can be solved no other way
> besides using raw timestamps, then sure, include it. Otherwise I think we
> should stick with nanoseconds for time values when possible.

Given that the struct counter_event 'timestamp' member serves as the
identification vessel for correlating component values to a single event
(i.e. component values of a given event will share the same unique
timestamp), I believe it's prudent to standardize this timestamp format
on the kernel monotonic time as we have currently done so via our
ktime_get_ns() call.

There are cases where it is understandably better to use a timestamp
provided directly by the hardware (e.g. keeping timestamping close to
data collection). For these cases, we can retrieve these "raw"
timestamps via a Counter Extension: users would get their "raw"
timestamp via the struct counter_event 'value' member, and just treat
the 'timestamp' member as a unique event identification number.

William Breathitt Gray

--D0h9yNnjO8W6xx5O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl/fxZgACgkQhvpINdm7
VJKLehAA5cAgHtNTbv7O2gXXtw1DlrdZsdHggtenoS1MP01cKBNxOAoZSvV8+jUf
OUZ1CQWVyuP8IA70XOx9q/JDQ1+mRCvU8YXTNdyy5tF378AU9runStnq2N1Yrnb0
UOidB1F0M5+Nd2p59+ePtte8gCW+7sUrhoXbssGVegyvciLEiR191JiPU5xEjnJD
R78myGve1R68FqlkRXyWVKjQU3INmjfGEmgSs/v2fi1/sNq/0iGqEVn6Vi3EAmBN
BTYSqnoq8QT8H495CshmKjiPg5WBfBYv02+WadJXGlr+uIReW3rSaV2aTk8XEvsv
i37GBFfnJxtAlXiGGe6g/7d0NwARYXQedD2TQYAsiAu6QmE3FCwKczOTcNjOyxmC
WIRMCnw79VJQVLqTSiBoHY6zD3RGVFIWeBLY/nRb6jo0p690suctgj/dpwRGNZgc
GxQQKq3mU4YC2CBg4lYGn0H9X8XpvDSbBS3ibDqKHrjIDCog7By0aodY399D3FI/
OSp+jN16FWMZEz8wUJO9wfheAEX74TqlsZkT+Oobqq9xzQ9lGKxrLXh9X9wbjBsH
u4vzW7ghGq0fItqt4v3iQePX7/KAUqoVpr7xG2vP+pjhC+wPGcLa7DHtQDcdPa4P
2ogQ7O7FGU8ZrAV3+EOomqlsSbrze8zgkBgKJ6Y3omO/0ef0oyk=
=7e/y
-----END PGP SIGNATURE-----

--D0h9yNnjO8W6xx5O--

--===============7651916509686096094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7651916509686096094==--
