Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 418902981DB
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Oct 2020 14:18:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7409C35E3C;
	Sun, 25 Oct 2020 13:18:15 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 891FEC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Oct 2020 13:18:14 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id t128so911265qke.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Oct 2020 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MO3IwgFsTuuAQb69apcANcklu+gz2Tub8fis0XXwpSs=;
 b=LlUxpVS1OaD+CeUBXrHMQWS+9BXnKIfgj5wmrUKZT5pL+Y/rDiYUzqZN7mkbI83bDM
 pO12lEGNkAYK2ITrMnQPoJUxojGxCJM9uXUJjfOPGP3olHT8+ZfFhq4g9m1UO6WUqhRq
 skojFLE08/yUGaP9dAdnYgCVWLYuZe8/nOtl/fyM4ycl4dwkXroiB3VWnYfaZ2iO8QzM
 3zKdF4u3wMKG1JSAVnQRznN46F0cTTIU78q4NsUxbgBNYIaZ015R50+Vf1xQpeD+xbZB
 NnRqiHY8uCsBhaUymXn8u9VZZFwOpOsA+luVzJ6FQcKxSsfbG9R4CjzuB/kjYLN3l4L0
 fL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MO3IwgFsTuuAQb69apcANcklu+gz2Tub8fis0XXwpSs=;
 b=E/yzOKcxwKF9cuLuqXvy4lagECaJpP/TS/2btEcGvB8zedVONiFuupeiG/pQDAutX1
 RsZyT0P68fR27C5saVUjL5o2q3xj2HH8MJ7CbSlXctWzJ/eBThSgZXsMA0FsXbnn/+du
 2jVhOxP3MScOvmaARKC+D76HnXwuPg4JgHhVpPdUEb0/+fnkyJw2PHbsSe2/UEmtM+cc
 DfmnuQhG2HVDTBF4wf9QY++YshDnwoqt27PaycqzsZyq3q7nJ1+VTqqLcIpDaGjyMIPb
 LWytEdL6dO3SIr1DVPYGBIVFi52F6UK/Y53BuawBkN2ecX1osB769A2pFNoh93p8yIeP
 d/xQ==
X-Gm-Message-State: AOAM531N98HPb9yOWvsLAKoeICDUhPyph77Fm5NEOf0nL0OtkTJrQbUD
 vojDzzJkQBANHxmtb7CLCEU=
X-Google-Smtp-Source: ABdhPJyXtkIjzFGKZ/fvA7asDRtn9qRjAGXlMjQJcK/CHKeVOyeYYuoPCcNoY09Y9eflMTPcCm3SuA==
X-Received: by 2002:a37:a407:: with SMTP id n7mr11745316qke.248.1603631893378; 
 Sun, 25 Oct 2020 06:18:13 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id 19sm4563158qki.33.2020.10.25.06.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 06:18:12 -0700 (PDT)
Date: Sun, 25 Oct 2020 09:18:09 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201025131809.GB3458@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <00be1fccc672c5207f3b04fe4cc09c29e22641f4.1601170670.git.vilhelm.gray@gmail.com>
 <cc1f7e4d-18d1-bc28-8ce3-e3edcd91bcab@lechnology.com>
 <20201018165822.GE231549@shinobu>
 <f2bac8b2-108d-fa4c-cb63-8ff85ce04d1f@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <f2bac8b2-108d-fa4c-cb63-8ff85ce04d1f@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 3/5] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============1448538770629237331=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1448538770629237331==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 11:06:42AM -0500, David Lechner wrote:
> On 10/18/20 11:58 AM, William Breathitt Gray wrote:
> > On Wed, Oct 14, 2020 at 05:40:44PM -0500, David Lechner wrote:
> >> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> >>> +static ssize_t counter_chrdev_read(struct file *filp, char __user *b=
uf,
> >>> +				   size_t len, loff_t *f_ps)
> >>> +{
> >>> +	struct counter_device *const counter =3D filp->private_data;
> >>> +	int err;
> >>> +	unsigned long flags;
> >>> +	unsigned int copied;
> >>> +
> >>> +	if (len < sizeof(struct counter_event))
> >>> +		return -EINVAL;
> >>> +
> >>> +	do {
> >>> +		if (kfifo_is_empty(&counter->events)) {
> >>> +			if (filp->f_flags & O_NONBLOCK)
> >>> +				return -EAGAIN;
> >>> +
> >>> +			err =3D wait_event_interruptible(counter->events_wait,
> >>> +					!kfifo_is_empty(&counter->events));
> >>> +			if (err)
> >>> +				return err;
> >>> +		}
> >>> +
> >>> +		raw_spin_lock_irqsave(&counter->events_lock, flags);
> >>> +		err =3D kfifo_to_user(&counter->events, buf, len, &copied);
> >>> +		raw_spin_unlock_irqrestore(&counter->events_lock, flags);
> >>> +		if (err)
> >>> +			return err;
> >>> +	} while (!copied);
> >>> +
> >>> +	return copied;
> >>> +}
> >>
> >> All other uses of kfifo_to_user() I saw use a mutex instead of spin
> >> lock. I don't see a reason for disabling interrupts here.
> >=20
> > The Counter character device interface is special in this case because
> > counter->events could be accessed from an interrupt context. This is
> > possible if counter_push_event() is called for an interrupt (as is the
> > case for the 104_quad_8 driver). In this case, we can't use mutex
> > because we can't sleep in an interrupt context, so our only option is to
> > use spin lock.
> >=20
>=20
>=20
> The way I understand it, locking is only needed for concurrent readers
> and locking between reader and writer is not needed.

You're right, it does say in the kfifo.h comments that with only one
concurrent reader and one current write, we don't need extra locking to
use these macros. Because we only have one kfifo_to_user() operating on
counter->events, does that mean we don't need locking at all here for
the counter_chrdev_read() function?

William Breathitt Gray

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+VexEACgkQhvpINdm7
VJICoBAAw8HLhwVk1o7CRK0hVoeMc0fdPh59yHCvT33kbxnA92J0zxnjH+MuGVAJ
kOWu3CLQ1s0+qhTGMmSfGUUCODAsN9+2IE+it0LnW1cbHw0xw7MBK0vaIkyAKNG4
T3eWQCUYGEwDFWRqSvSCIUBJlAEQPVKcgyntEdgPASaWheL4Do/iGg6QvV3KRVb2
gnzdcQO5sgN+2YVVlhoB3KoeJRVTgskq+S/9b7tw3yDxtyxMCX8huiKXsm0jHMiZ
fX8pxf0ni/ht/RLcpTjX7r0n34aL8HU3Owfqkq8DGsYiQ5Jc8AdJ6OAI2hgPifpZ
NzwyeFfxAtohot+GZa5RsXewEK8M0kHxnO2MyaxUTrVNZ623p6aWm3h3gNiwpuFg
2V+mDCSTPN5y0q0Bg0k6n3c7cGWnItY9/UJnNJiUg8zinEzWfM5jwcM6LAOVj5pS
EEdlzXu6IFR+T16m7N2bdR1EcAyB95OFkFL0IX9oOLcXYRmWRHQIBiFoEJXitNYQ
X7ZXuKQmQpNoFP6kR4oRkvT/SQlt/jXJMw745PJKOgnQnOpV0dGYt8CMZnjI350k
WJzvTVmWLSq3xzuXzB7egNqDUzl3u3GZiYBU7PkzTRAmxM3ZcCcKbntbMwOshYZz
NKIcZpApO1tXWlSfm3A81N+heHtPlKFgxjHqxsQPbRaWzm1h5MU=
=jRkJ
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--

--===============1448538770629237331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1448538770629237331==--
