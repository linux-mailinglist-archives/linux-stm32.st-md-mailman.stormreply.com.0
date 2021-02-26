Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A790D325A7F
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 01:04:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F400C57B59;
	Fri, 26 Feb 2021 00:04:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 513BBC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 00:03:58 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id t29so4760842pfg.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 16:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6xnb86RhPkQovrbj87oZceQLnvq33XU1nv/cjwf3XRI=;
 b=DrisM3vA7nmsgSAqf45LxyW9UBp3YtQu+vV1WkifsIIv2wfd27mahTLSXUhGQqV8+K
 5RV9E9FIopEmwr1/v7ECuDr94o02uI+7bfAbnxjrgDE/nFvGiamir5Cqv3+ElwV8AHRM
 N1m58ZzinCQ9L5faX9r+B4X0vkG8IzMOt2KJSxK2u5b7vb+EeS3blgIePawlve4ok82B
 cz5rkhtvRUmMMUxiKjtus32eUZjnvUOaPN0m45XrNDZ7A8tli04CPo4RjT9dK+dFt2Iz
 9hlhiaiMmYx1nc51OCVmegDB0dGGAZMqxaw60qoY87nqWqfWZHQzEL0JX7MYS6z7dQBt
 lpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6xnb86RhPkQovrbj87oZceQLnvq33XU1nv/cjwf3XRI=;
 b=oXCyx9CvAQpCsb6uFpN1E3Q+Y7gtVLH/OxxZVR+4WoLDu7lrTKX5MkgB2jyjlmdALe
 E0Qtqv2bSGTvNdXoo30zb1d7WsTFvEPl72w77b7F5wVCZ+PVA9Gf6mP/tcMRfhYGXGfX
 uNzhs/U4XHfMVZFQupaWDcjDnOzPu6P2lWHPpYWnmx22gyScvbW2b15vOPcUGxVW24U7
 2xNxNFVqMyUUjdH7rWRSNYY/WrxEImCXecEOBEf3OJLPTX2yPn2e+MnnLUKloh8b5SN9
 AoHGcnW4tdbLQWc08JUwu5TPI9GryxQRAhbb4Ug1WbgRDLFkbLMcMQSiNZRr0qyBhJs/
 lBxQ==
X-Gm-Message-State: AOAM5324ogws72zdaynKY8SxeNjiQaa892RahYJrrvruGm1aiHTb1qGW
 quU8Drq4RVtDwm/0UfbN/uc=
X-Google-Smtp-Source: ABdhPJyZR4ptosE9/NEaiXfthCao0Ri2ZmlqXid10F65SCpm3hmdwAM1dqRgjqlvxTmVJyK0f7qWJQ==
X-Received: by 2002:aa7:9595:0:b029:1ee:8:2b76 with SMTP id
 z21-20020aa795950000b02901ee00082b76mr224566pfj.57.1614297837209; 
 Thu, 25 Feb 2021 16:03:57 -0800 (PST)
Received: from shinobu (113x37x72x20.ap113.ftth.ucom.ne.jp. [113.37.72.20])
 by smtp.gmail.com with ESMTPSA id a19sm6965305pff.186.2021.02.25.16.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 16:03:56 -0800 (PST)
Date: Fri, 26 Feb 2021 09:03:48 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YDg65OmLa05g53qc@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <013b2b8682ddc3c85038083e6d5567696b6254b3.1613131238.git.vilhelm.gray@gmail.com>
 <20210214181146.66d43da7@archlinux> <YC5CMLuKnXbkZond@shinobu>
 <20210221155140.3e1ef13c@archlinux>
MIME-Version: 1.0
In-Reply-To: <20210221155140.3e1ef13c@archlinux>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 20/22] counter: Implement
 events_queue_size sysfs attribute
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
Content-Type: multipart/mixed; boundary="===============5740147734144175963=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5740147734144175963==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76Dn/TuCDFUTSoIf"
Content-Disposition: inline


--76Dn/TuCDFUTSoIf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 21, 2021 at 03:51:40PM +0000, Jonathan Cameron wrote:
> On Thu, 18 Feb 2021 19:32:16 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > On Sun, Feb 14, 2021 at 06:11:46PM +0000, Jonathan Cameron wrote:
> > > On Fri, 12 Feb 2021 21:13:44 +0900
> > > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> > >  =20
> > > > The events_queue_size sysfs attribute provides a way for users to
> > > > dynamically configure the Counter events queue size for the Counter
> > > > character device interface. The size is in number of struct
> > > > counter_event data structures. The number of elements will be round=
ed-up
> > > > to a power of 2 due to a requirement of the kfifo_alloc function ca=
lled
> > > > during reallocation of the queue.
> > > >=20
> > > > Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > > > ---
> > > >  Documentation/ABI/testing/sysfs-bus-counter |  8 +++++++
> > > >  drivers/counter/counter-chrdev.c            | 23 +++++++++++++++++=
++
> > > >  drivers/counter/counter-chrdev.h            |  2 ++
> > > >  drivers/counter/counter-sysfs.c             | 25 +++++++++++++++++=
++++
> > > >  4 files changed, 58 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Document=
ation/ABI/testing/sysfs-bus-counter
> > > > index 847e96f19d19..f6cb2a8b08a7 100644
> > > > --- a/Documentation/ABI/testing/sysfs-bus-counter
> > > > +++ b/Documentation/ABI/testing/sysfs-bus-counter
> > > > @@ -212,6 +212,14 @@ Description:
> > > >  		both edges:
> > > >  			Any state transition.
> > > > =20
> > > > +What:		/sys/bus/counter/devices/counterX/events_queue_size
> > > > +KernelVersion:	5.13
> > > > +Contact:	linux-iio@vger.kernel.org
> > > > +Description:
> > > > +		Size of the Counter events queue in number of struct
> > > > +		counter_event data structures. The number of elements will be
> > > > +		rounded-up to a power of 2.
> > > > +
> > > >  What:		/sys/bus/counter/devices/counterX/name
> > > >  KernelVersion:	5.2
> > > >  Contact:	linux-iio@vger.kernel.org
> > > > diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/cou=
nter-chrdev.c
> > > > index 16f02df7f73d..53eea894e13f 100644
> > > > --- a/drivers/counter/counter-chrdev.c
> > > > +++ b/drivers/counter/counter-chrdev.c
> > > > @@ -375,6 +375,29 @@ void counter_chrdev_remove(struct counter_devi=
ce *const counter)
> > > >  	cdev_del(&counter->chrdev);
> > > >  }
> > > > =20
> > > > +int counter_chrdev_realloc_queue(struct counter_device *const coun=
ter,
> > > > +				 size_t queue_size)
> > > > +{
> > > > +	int err;
> > > > +	DECLARE_KFIFO_PTR(events, struct counter_event);
> > > > +	unsigned long flags;
> > > > +
> > > > +	/* Allocate new events queue */
> > > > +	err =3D kfifo_alloc(&events, queue_size, GFP_ATOMIC); =20
> > >=20
> > > Is there any potential for losing events? =20
> >=20
> > We take the events_list_lock down below so we're safe against missing an
> > event, but past events currently unread in the queue will be lost.
> >=20
> > Shortening the size of the queue is inherently a destructive process if
> > we have more events in the current queue than can fit in the new queue.
> > Because we a liable to lose some events in such a case, I think it's
> > best to keep the behavior of this reallocation consistent and have it
> > provide a fresh empty queue every time, as opposed to sometimes dropping
> > events and sometimes not.
> >=20
> > I also suspect an actual user would be setting the size of their queue
> > to the required amount before they begin watching events, rather than
> > adjusting it sporadically during a live operation.
> >
>=20
> Absolutely agree.   As such I wonder if you are better off enforcing this
> behaviour?  If the cdev is open for reading, don't allow the fifo to be
> resized.=20
>=20
> Jonathan

I can't really think of a good reason not to, so let's enforce it: if
the cdev is open, then we'll return an EINVAL if the user attempts to
resize the queue.

What is a good way to check for this condition? Should I just call
kref_read() and see if it's greater than 1? For example, in
counter_chrdev_realloc_queue():

	if (kref_read(&counter->dev.kobj.kref) > 1)
		return -EINVAL;

William Breathitt Gray

--76Dn/TuCDFUTSoIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmA4OswACgkQhvpINdm7
VJI4LBAApcdc9OT2tNICqKgjdL9fnN1UvMR4Mymto4r9OKzes/KKt7jFjbmqsaPU
IpFVtpG2apdrK7LcCnvxnSAxCwOIkM1r0TOUQjiiWKggpibCOJCXcI1UWu6FTxtX
3FcYUZZMmjFWvijm0LG3I/7UEo+wf3BcatoYSEERpok3IiPhzag+bG1WQhoirpbK
3UdOHyRkYN8kyU4pfFK+T6A2pHO09fFmSJJB2oQ9d90avrJikMkBGQp6/qpIvhPM
gMxbYwDxuSG7zCqkIU/GW22VvwhehfGQaoc5u/WlCks271YWPNcMyq94479EM7q7
SP5STZczS/Jxc5Wq5HHuFsCQaSGTJ6uFIqjey88gjlkyvJ+Vzznj6OfBBRFFPPPe
KL8UUXk7E9AM17u+Zoj8xV3NnBKixWTKcUnazPsM7QZSPH3fvLmdUbODFhU20gkf
yYLSMZgxvkZSe3jHwaQn92MRCMPgqK2vDUIGVnvAYi+nmPQ/ly4VHwcpRi0iS2Pd
p95tFoo2gD8vCwoUm4qm/h+n3WYbQZ44D53fUSAR4yQfdntmCueSFKQ1Cty/03uL
BVDbwQs+GfKzPttZoChC2I4oNAyjnqrS861Q0Uz5Go1aqFE5GvfJluSrmsIYNf0u
XiuOzzN/i9NOBe4GaeCeaaVQAznfbfat6Ym4nuXMOu4sV5twIJg=
=vTG+
-----END PGP SIGNATURE-----

--76Dn/TuCDFUTSoIf--

--===============5740147734144175963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5740147734144175963==--
