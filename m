Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE33091ED
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jan 2021 05:59:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B27DC57183;
	Sat, 30 Jan 2021 04:59:46 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0988BC56639
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jan 2021 04:59:43 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id q20so7529884pfu.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Jan 2021 20:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iuWsF8GDl/hi9MxuXzy2n4gX9Xml0dieu92Tb2P0Obw=;
 b=uuAZ7w9gMS/po3hziG54J7JhVOhSPc9YguELWtu4lK2bZIBX1QQHUlgf8TfbqITj+W
 +X+I/w+67aHJClZC/822/6x3fYwgBvw61vF9dzhyJrxTPuRGG1Nlc8/T1aZsuT2aU/u5
 pfcT72QnFyByl1pftmipjHpIGilcjirPJ76LYLqVcLRiTyatBfAyqAFBg5rI4VqBR660
 QNCIb8Z+osMJ1XZYYuCgiel8pgG3HASC8VlubOLBXtOE0FfTFVvJsom4zocaWLNPGCJN
 ZlOIeqkc4Y7GXPNO4Q/lxT3DcVEfZ4Dhe/auKmkOlunOB+uLfSmtyI/urM3IpYX49kz6
 96Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iuWsF8GDl/hi9MxuXzy2n4gX9Xml0dieu92Tb2P0Obw=;
 b=AR1cKFlOVIBhr8VqOtUIglZ2pF/OkYGsA27v71JfHgdtklDqGftpyhcS7WUefo4agH
 3gFy52GzkqvGJRbsZALv5knO2zdMERcxIRGndLpLbJQP1yvvaBH0dn3rXZDlYcAZ5ICK
 litaIwtePWDLYkrnfQWYX3i5YZHtr5KXL3H7g4DrATX5nhgilvJiGf87GMjxKp7Pjaw1
 R7HMnwuDbkSAPb7PHSfR+owXHTiWxQ/QNILLzbT5S6BEOW+ToG1v2ITVs1aVo0Cof6Bs
 9l05XyaLy04ljqiwmhypMxL40XL7RpQE1xseN6L9EM7Jr8/iKX5Il/2XRGGunovSuvoN
 kHeA==
X-Gm-Message-State: AOAM530wzEVbjO5NoO+jRh4wIvLcHvxX+f0sizkoRDN+zZZ8oAi5r5Ek
 WeK+C4YKLEL0o+M06A6d9OA=
X-Google-Smtp-Source: ABdhPJwKSxuQV6xtbs3H20e4fo5ykBo6wQEM2X4e8TrZUG+ZaQQVEgQZpBjCyI1pZchR5sLW4mv+rA==
X-Received: by 2002:a63:33c4:: with SMTP id z187mr7777053pgz.312.1611982782449; 
 Fri, 29 Jan 2021 20:59:42 -0800 (PST)
Received: from shinobu (113x33x126x33.ap113.ftth.ucom.ne.jp. [113.33.126.33])
 by smtp.gmail.com with ESMTPSA id
 l2sm9463930pju.25.2021.01.29.20.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 20:59:41 -0800 (PST)
Date: Sat, 30 Jan 2021 13:59:31 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <YBTns6IzaNUrMSsq@shinobu>
References: <cover.1608935587.git.vilhelm.gray@gmail.com>
 <57bc509273bf288d74835e6ebdaebf27b4991888.1608935587.git.vilhelm.gray@gmail.com>
 <e9102ed7-d4e1-0c81-96f3-8d3c297d037f@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <e9102ed7-d4e1-0c81-96f3-8d3c297d037f@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
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
Content-Type: multipart/mixed; boundary="===============1240868016978892997=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1240868016978892997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ELMJ14pDjrGcIjMp"
Content-Disposition: inline


--ELMJ14pDjrGcIjMp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 03:36:35PM -0600, David Lechner wrote:
> On 12/25/20 6:15 PM, William Breathitt Gray wrote:
>=20
> > diff --git a/include/uapi/linux/counter.h b/include/uapi/linux/counter.h
> > new file mode 100644
> > index 000000000000..7585dc9db19d
> > --- /dev/null
> > +++ b/include/uapi/linux/counter.h
> > @@ -0,0 +1,123 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + * Userspace ABI for Counter character devices
> > + * Copyright (C) 2020 William Breathitt Gray
> > + */
> > +#ifndef _UAPI_COUNTER_H_
> > +#define _UAPI_COUNTER_H_
> > +
> > +#include <linux/ioctl.h>
> > +#include <linux/types.h>
> > +
> > +/* Component type definitions */
> > +enum counter_component_type {
> > +	COUNTER_COMPONENT_NONE,
> > +	COUNTER_COMPONENT_SIGNAL,
> > +	COUNTER_COMPONENT_COUNT,
> > +	COUNTER_COMPONENT_FUNCTION,
> > +	COUNTER_COMPONENT_SYNAPSE_ACTION,
> > +	COUNTER_COMPONENT_EXTENSION,
> > +};
> > +
> > +/* Component scope definitions */
> > +enum counter_scope {
>=20
> Do we need COUNTER_SCOPE_NONE to go with COUNTER_COMPONENT_NONE?

COUNTER_COMPONENT_NONE alone should be fine because it already indicates
that the 'component' member of the struct counter_watch is to be ignored
(i.e. type, scope, etc. will not be evaluated and that section of code
is bypassed).

> > +	COUNTER_SCOPE_DEVICE,
> > +	COUNTER_SCOPE_SIGNAL,
> > +	COUNTER_SCOPE_COUNT,
> > +};
> > +
> > +/**
> > + * struct counter_component - Counter component identification
> > + * @type: component type (Count, extension, etc.)
>=20
> Instead of "Count, extension, etc.", it could be more helpful
> to say one of enum counter_component_type.

Ack.

> > + * @scope: component scope (Device, Count, or Signal)
>=20
> Same here. @scope must be one of enum counter_scope.

Ack.

> > + * @parent: parent component identification number
> > + * @id: component identification number
>=20
> It could be helpful to say that these id numbers match
> the X/Y/Z in the sysfs paths as described in the sysfs
> ABI.

Ack.

> > + */
> > +struct counter_component {
> > +	__u8 type;
> > +	__u8 scope;
> > +	__u8 parent;
> > +	__u8 id;
> > +};
> > +
> > +/* Event type definitions */
> > +enum counter_event_type {
> > +	COUNTER_EVENT_OVERFLOW,
> > +	COUNTER_EVENT_UNDERFLOW,
> > +	COUNTER_EVENT_OVERFLOW_UNDERFLOW,
> > +	COUNTER_EVENT_THRESHOLD,
> > +	COUNTER_EVENT_INDEX,
> > +};
> > +
> > +/**
> > + * struct counter_watch - Counter component watch configuration
> > + * @component: component to watch when event triggers
> > + * @event: event that triggers
>=20
> It would be helpful to say that @event must be one of
> enum counter_event_type.

Ack.

> > + * @channel: event channel
>=20
> It would be useful to say that @channel should be 0 unless
> a component has more than one event of the same type.

I'll make this clearer.

> > + */
> > +struct counter_watch {
> > +	struct counter_component component;
> > +	__u8 event;
> > +	__u8 channel;
> > +};
> > +
> > +/* ioctl commands */
> > +#define COUNTER_CLEAR_WATCHES_IOCTL _IO(0x3E, 0x00)
> > +#define COUNTER_ADD_WATCH_IOCTL _IOW(0x3E, 0x01, struct counter_watch)
> > +#define COUNTER_LOAD_WATCHES_IOCTL _IO(0x3E, 0x02)
> > +
> > +/**
> > + * struct counter_event - Counter event data
> > + * @timestamp: best estimate of time of event occurrence, in nanosecon=
ds
> > + * @value: component value
> > + * @watch: component watch configuration
> > + * @errno: system error number
> > + */
> > +struct counter_event {
> > +	__aligned_u64 timestamp;
> > +	__aligned_u64 value;
> > +	struct counter_watch watch;
> > +	__u8 errno;
>=20
> There are error codes larger than 255. Probably better
> make this __u32.

Are error codes larger than 255 actually useful in this case? I noticed
the exit() function will only return the least significant byte of
status to the parent: https://man7.org/linux/man-pages/man3/exit.3.html

William Breathitt Gray

--ELMJ14pDjrGcIjMp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAU57MACgkQhvpINdm7
VJJRZRAApPY7C5W6wFI/RES8FynKQPvVbA8y2f9aCWjF2ir1uxdCF/vQQXNDxa46
O06eBUhB6NWeXG8bKWvCnQ+84mBbnH+v9wlXiX0NbYUhQ44kKSVcJ26n+78Vj5l0
tJTPLtIgtQktPuu8Uuqtzxh4LAvSd/vn2exidqqLfpsF3EwucLRQa/++j+/uXUTu
fPp0zi9sLUUcohSDAgf404mllaRTyeivwHyqRoztLUN/QDWI42UakQYGmg1gRItu
v3UHxYKh+mFpfWM28fJQXvqsErUZQpEfu3zwddn3rVSLpW/9Ja28NCPfIqR0dlhB
19OhtYT0MmfLpmuR+E+2M0ht41F2gJadXp7+/c8dZ3LsnOM7eqKZlH8/mgTlLRmm
tphEIh/uAIN8jm7SACr2bH4VbjoTRfug56k5X25APg4TEYmRvrEBXlkOU7hOAKvx
UA+7c5ql0QpeGRNQtztn7Cxt6agQNoZScmQ6y3wc2pWfC+dOZwiw/A+u1BrhrQ0Y
gfFwZ2A/X8Q+oevhNzmwPq/zqiEyr60gmLPvt2RzznnjkzyCPq3EceHKe5DGGEA1
Vzo6UIaAihwYAB1nivmVg7wzMRnMf/mdTzkLjBrlkoZ6aGZBQV0BJAvXaYOsToV4
7SRyLCgmHi9e758Vdo6CH4B/k9wRoOQ0da6epTmoYDkp9u0hsTE=
=zNAQ
-----END PGP SIGNATURE-----

--ELMJ14pDjrGcIjMp--

--===============1240868016978892997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1240868016978892997==--
