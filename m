Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CFB23FFCC
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 21:15:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F29BEC36B26;
	Sun,  9 Aug 2020 19:15:07 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E7D9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  9 Aug 2020 19:15:04 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b79so6530470qkg.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 09 Aug 2020 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yDepS+KNni4D9Wqzm+7nhq5Jmy8AX47xYOD/iCyDI3w=;
 b=FQWEljDjpMn55Bbu/BY3UEFT/Lu0e5RrVjPmmk5YIpE6AB+oy++waq+aBhGOZcPegt
 nbJyvazjyauoFkqrBtAxB/4dSKYmUvJK/+bO1C63BNhEQIu7yyWYMaOT930r7ApL/Tix
 Ok2B/xMM9FlOSwOY+BeipOxpNDAJLxwogpmHE9iUlal+f8h6hhulfTAUdemfNg2zExgi
 WTl1DWJLbHCtE91aMv0vWDF6Eo+ynumQmRt2wWYgQu5oGNyb0JwR44IEuGP9mv9TNq6k
 mYgdwvLnX2TZ2mK/T1ln0HWNE4ML1I1Q45p0sIshatdCW1X8/psIKKNulM2xsOXxMYOX
 JCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yDepS+KNni4D9Wqzm+7nhq5Jmy8AX47xYOD/iCyDI3w=;
 b=ck0oBGv9Ujlphk0mUhIrXyUgTgPYXc/6KWQShbTmTscqNo3nGXLV0Y37qw38RXOk7a
 KUajKKGXF10T8LBRG7SJxl5B33Ro1a0C7mtLYlYOObTpwMpvWdM0Iu0YHre2uHVkB+ke
 dvH705bZwyMBLZxZRhszaSjsCC3gol6PRzcKWJ0Jg2D3ZfjGLLEL8c5dCl2kEvNi1COt
 SJpNN7wwyxyrDJwEwhOk/VbYy9gxM1fTnSgZCiqF04oplNLeye3FE0NEeI648xCStgHe
 rQtgQ6h61YJde0O91u7IfX059llwCuC8/1lCNxG+esfyPZk8gRDNPKHrBl2RMBObc07/
 s2QA==
X-Gm-Message-State: AOAM530U7uuCXPa0vrVI9DvDX7j6kO+3FkSzSqr/W+tDw5DMLi0uz0aR
 JkYsd7ue3rI6xNi+M5NMwFI=
X-Google-Smtp-Source: ABdhPJynwoAgK1rNt9SoKhVFE2PPezdyaW5pGfYZ8GICn+tO5eFlV/LO4ny0JsomLkVqrQMvJvmQfg==
X-Received: by 2002:a37:3c1:: with SMTP id 184mr22557339qkd.312.1597000503192; 
 Sun, 09 Aug 2020 12:15:03 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id r6sm13541177qtu.93.2020.08.09.12.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 12:15:02 -0700 (PDT)
Date: Sun, 9 Aug 2020 15:15:00 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20200809191500.GC6542@shinobu>
References: <cover.1595358237.git.vilhelm.gray@gmail.com>
 <e13d43849f68af8227c6aaa0ef672b459d47e9ab.1595358237.git.vilhelm.gray@gmail.com>
 <7209ac3d-d1ca-1b4c-b22c-8d98b13742e2@lechnology.com>
 <20200802210415.GA606173@shinobu>
 <4061c9e4-775e-b7a6-14fa-446de4fae537@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <4061c9e4-775e-b7a6-14fa-446de4fae537@lechnology.com>
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
Content-Type: multipart/mixed; boundary="===============5375571671873506245=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5375571671873506245==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 03:00:49PM -0500, David Lechner wrote:
> On 8/2/20 4:04 PM, William Breathitt Gray wrote:
> > On Tue, Jul 28, 2020 at 05:45:53PM -0500, David Lechner wrote:
> >> On 7/21/20 2:35 PM, William Breathitt Gray wrote:
> >>> This is a reimplementation of the Generic Counter driver interface.
>=20
> ...
>=20
> >>> -F:	include/linux/counter_enum.h
> >>> +F:	include/uapi/linux/counter.h
> >>
> >> Seems odd to be introducing a uapi header here since this patch doesn't
> >> make any changes to userspace.
> >=20
> > These defines are needed by userspace for the character device
> > interface, but I see your point that at this point in the patchset they
> > don't need to be exposed yet.
> >=20
> > I could create temporary include/linux/counter_types.h to house these
> > defines, and then later move them to include/uapi/linux/counter.h in the
> > character device interface introduction patch. Do you think I should do
> > so?
>=20
> Since this patch is independent of the chardev changes and probably ready
> to merge after one more round of review, I would say it probably makes
> sense to just leave them in counter.h for now and move them to uapi when
> the chardev interface is finalized. This way, we can just merge this patch
> as soon as it is ready.

It would be good to isolate out that patch since it's so large. Okay
I'll put these defines in counter.h then and move them to uapi in the
later patch.

> >=20
> >>>   =20
> >>>    CPMAC ETHERNET DRIVER
> >>>    M:	Florian Fainelli <f.fainelli@gmail.com>
> >>> diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-=
8.c
> >>> index 78766b6ec271..0f20920073d6 100644
> >>> --- a/drivers/counter/104-quad-8.c
> >>> +++ b/drivers/counter/104-quad-8.c
> >>> @@ -621,7 +621,7 @@ static const struct iio_chan_spec quad8_channels[=
] =3D {
> >>>    };
> >>>   =20
> >>>    static int quad8_signal_read(struct counter_device *counter,
> >>> -	struct counter_signal *signal, enum counter_signal_value *val)
> >>> +			     struct counter_signal *signal, u8 *val)
> >>
> >> I'm not a fan of replacing enum types with u8 everywhere in this patch.
> >> But if we have to for technical reasons (e.g. causes compiler error if
> >> we don't) then it would be helpful to add comments giving the enum type
> >> everywhere like this instance where u8 is actually an enum value.
> >>
> >> If we use u32 as the generic type for enums instead of u8, I think the
> >> compiler will happlily let us use enum type and u32 interchangeably and
> >> not complain.
> >=20
> > I switched to fixed-width types after the suggestion by David Laight:
> > https://lkml.org/lkml/2020/5/3/159. I'll CC David Laight just in case he
> > wants to chime in again.
> >=20
> > Enum types would be nice for making the valid values explicit, but there
> > is one benefit I have appreciated from the move to fixed-width types:
> > there has been a significant reduction of duplicate code; before, we had
> > a different read function for each different enum type, but now we use a
> > single function to handle them all.
>=20
> Yes, what I was trying to explain is that by using u32 instead of u8, I
> think we can actually do both.
>=20
> The function pointers in struct counter_device *counter would use u32 as a
> generic enum value in the declaration, but then the actual implementations
> could still use the proper enum type.

Oh, I see what you mean now. So for example:

    int (*signal_read)(struct counter_device *counter,
                       struct counter_signal *signal, u8 *val)

This will become instead:

    int (*signal_read)(struct counter_device *counter,
                       struct counter_signal *signal, u32 *val)

Then in the driver callback implementation we use the enum type we need:

    enum counter_signal_level signal_level =3D COUNTER_SIGNAL_HIGH;
    ...
    *val =3D signal_level;

Is that what you have in mind?

> >=20
> >>> +		device_del(&counter->dev);
> >>> +		counter_sysfs_free(counter);
> >>
> >> Should sysfs be freed before deleting device? I think sysfs might be
> >> using dev still.
> >=20
> > I think it's the other way around isn't it? The Counter sysfs memory
> > should stay alive for the lifetime of the device. Once the device is
> > deleted, there's nothing left to access those struct attributes, so that
> > memory can now be freed. Correct me if my reasoning is wrong here.
>=20
> I think you are right. I was thinking that device_del() would free
> memory, but it doesn't. It also looks like other drivers call
> device_put() after this, so maybe needed here too?

Do you mean put_device()? Hmm, I think you might be right; the
documentation comment states that put_device() should always be used to
give up the reference after a device_add() call. At the very least, I
need to call put_device() after a device_add() failure.

> >>> +static ssize_t counter_data_u8_show(struct device *dev,
> >>> +				    struct device_attribute *attr, char *buf)
> >>> +{
> >>> +	const struct counter_attribute *const a =3D to_counter_attribute(at=
tr);
> >>> +	struct counter_device *const counter =3D dev_get_drvdata(dev);
> >>> +	const struct counter_available *const avail =3D a->data.priv;
> >>> +	int err;
> >>> +	u8 data;
> >>> +
> >>> +	switch (a->type) {
> >>
> >> I don't understand the use of the word "owner" here. What is being "ow=
ned"?
> >>
> >> Perhaps "component" would be a better choice?
> >=20
> > I wasn't too set on calling this "owner" either, but I'm not sure if
> > "component" would make sense either because I wouldn't label a device
> > attribute as belonging to any particular component (in fact it's quite
> > the opposite).
> >=20
> > Perhaps the word "scope" would be better. What do you think? Or would
> > that be too vague as well.
>=20
> "scope" makes sense to me.

Okay, I'll make this change then.

> >>> -/**
> >>> - * struct counter_signal_ext - Counter Signal extensions
> >>> - * @name:	attribute name
> >>> - * @read:	read callback for this attribute; may be NULL
> >>> - * @write:	write callback for this attribute; may be NULL
> >>> - * @priv:	data private to the driver
> >>> - */
> >>> -struct counter_signal_ext {
> >>> +enum counter_data_type {
> >>> +	COUNTER_DATA_TYPE_U8,
> >>> +	COUNTER_DATA_TYPE_U64,
> >>> +	COUNTER_DATA_TYPE_BOOL,
> >>> +	COUNTER_DATA_TYPE_SIGNAL,
> >>
> >> Does this mean signal name?
> >=20
> > This represents the signal values "high" or "low". With the introduction
> > of this patchset, these values are no longer strings internally so I
> > gave them their own data type here.
>=20
> Ah, OK. So maybe COUNTER_DATA_TYPE_SIGNAL_LEVEL would be a better name.

Sure, that name seems sensible to me.

> >=20
> >>> +	COUNTER_DATA_TYPE_COUNT_FUNCTION,
> >>> +	COUNTER_DATA_TYPE_SYNAPSE_ACTION,
> >>> +	COUNTER_DATA_TYPE_ENUM,
> >>
> >> Why do some enums get their own type while others use a common
> >> generic ENUM type?
> >=20
> > COUNTER_DATA_TYPE_ENUM is intended for driver-specific Counter enums.
> > This allows driver authors to define their own Counter enums so that we
> > don't pollute the Generic Counter interface with enums that are unique
> > to individual drivers.
> >=20
> >>> +	COUNTER_DATA_TYPE_COUNT_DIRECTION,
> >>> +	COUNTER_DATA_TYPE_COUNT_MODE,
> >>
> >> Would be nice to group all COUNTER_DATA_TYPE_COUNT_* together
> >=20
> > I assume you're referring to COUNTER_DATA_TYPE_COUNT_FUNCTION being
> > separate from these two. That's because a "count function" is actually
> > part of the Generic Counter paradigm: it's the trigger operation for the
> > Synapse.
> >=20
> > In retrospect, I should have named it "trigger operation" or something
> > similar when I developed the paradigm originally, but hindsight is
> > 20/20 (I'd probably rename "Synapse" to something else too if I could).
> > It's unfortunately too late to rename this because we've exposed it to
> > userspace already as a named sysfs attribute.
> >=20
> > Perhaps I can rename this enum constant however to
> > COUNTER_DATA_TYPE_FUNCTION, or similar, to differentiate it from the
> > Count extensions.
> >=20
>=20
> Yes, I think COUNTER_DATA_TYPE_FUNCTION would be sufficient and avoid
> confusion.

Okay, I'll make this change then.

> >>>    /**
> >>>     * struct counter_device - Counter data structure
> >>> - * @name:		name of the device as it appears in the datasheet
> >>> + * @name:		name of the device
> >>>     * @parent:		optional parent device providing the counters
> >>> - * @device_state:	internal device state container
> >>> - * @ops:		callbacks from driver
> >>> + * @signal_read:	optional read callback for Signals. The read value =
of
> >>> + *			the respective Signal should be passed back via the
> >>> + *			value parameter.
> >>> + * @count_read:		optional read callback for Counts. The read value o=
f the
> >>> + *			respective Count should be passed back via the value
> >>> + *			parameter.
> >>> + * @count_write:	optional write callback for Counts. The write value=
 for
> >>> + *			the respective Count is passed in via the value
> >>> + *			parameter.
> >>> + * @function_read:	optional read callback the Count function modes. =
The
> >>> + *			read function mode of the respective Count should be
> >>> + *			passed back via the function parameter.
> >>> + * @function_write:	option write callback for Count function modes. =
The
> >>> + *			function mode to write for the respective Count is
> >>> + *			passed in via the function parameter.
> >>> + * @action_read:	optional read callback the Synapse action modes. The
> >>> + *			read action mode of the respective Synapse should be
> >>> + *			passed back via the action parameter.
> >>> + * @action_write:	option write callback for Synapse action modes. The
> >>> + *			action mode to write for the respective Synapse is
> >>> + *			passed in via the action parameter.
> >>>     * @signals:		array of Signals
> >>
> >> Why not keep the ops struct?
> >=20
> > Defining static ops structures in the drivers seemed to have no
> > advantage when those callbacks are always used via the counter_device
> > structure. I decided it'd be simpler to just set them directly in the
> > counter_device structure then.
> >=20
> > I could reorganize them into an ops structure again if there's enough
> > interest.
>=20
> I've been working on really constrained systems lately where every byte
> counts, so this stuck out to me since there would be a copy of all
> functions for each counter instance. But probably not that big of a deal
> in the Linux kernel. :-)

I hadn't considered this before, but that's a decent point. In addition,
considering Jonathan Cameron's comments in the other message about the
benefit of security with making the function pointers build time
assignments, I think I'll bring back the static ops structure afterall.

William Breathitt Gray

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8wSyoACgkQhvpINdm7
VJJLsxAAjseWpoH1za7kSrk64fhqK6RAfBVZRfQi/bu+yQbfLYKLtyP+70kikhe6
t7iI4PgJHj/YNCUHypFaEw4gpl1nvzoNSe0VobsJsHLHLqcT0ON6jD6965VM23Xx
54rt6fXCw9TIpsRpdbh2xsFOB7RrJFaMLc7kb7110bdzrRu39SDGItFGE8tVJYwz
YGReaRbOMyo+UPFDD/TNhYmJWL79+3OpO1/yggw9L52QJJf1zFOkAOGp2hyfQ2OQ
6IomrfKYreWD+FXrOKYyXpDHWQCF5uBr5ZKzXjKA9Ns7yP9JT/VV+WMuTICQuzsc
qo8M6cqeDSEzPuZuhAHUL3RfbpjoWUHQ/swTpzPLZ2Q4/hfGEGtULeZ1fxUuWokv
wzCS7MQVwPYmm2X+cxj+Y0/9qY6G+YWi3cA9BuXgZxJXOz/KNf036xMt6zIvAwxc
+wFGkhwtcsMcXAepthlnqfNJfEvcTQ92EWt3U7xKCKoAS4WxUA88qIRQ7FeSqZBB
dkMLv0ogdrt7godo/iTkKOSVV6YK68rJUPWZzw7PRjXntICxJQTQVr0IaPf7HaZm
/mG1AxUGWdLimVvlk7IluF5Ge+P+kQ+ceFKR/jeLFImyaWkDXQL1UnN77sBMqpCr
s9/1/VTErs5nXve547+yTWJif4+iLItOo3f4Wi3r4/vA5JX/xwk=
=8b0Y
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--

--===============5375571671873506245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5375571671873506245==--
