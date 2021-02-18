Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F0131E879
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Feb 2021 11:32:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1E17C5719D;
	Thu, 18 Feb 2021 10:32:29 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 469C5C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Feb 2021 10:32:26 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id z6so447920qts.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Feb 2021 02:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QBpF/UnYAHGf5ye3tF7er160fB31uR/wphWC4wYVvOY=;
 b=hdp5dGdccPpZBRsGUZfrcOO1t19DF1z6ve2rfVbio4eLyNcgMasMEDVu1LWtiXlMHU
 VM/WGerj+KIm+dyw2tbDSldipRhpx4ZHmCIR82MXX57YshOieVIWl6Y2v1+e3TJXu/5H
 E6SmMEVSpeVRPKGL/tUxgJzuSsM/XmQDDu1ntbEPNNJwTVu62ngo8pBMP/M+Tb19PO0c
 BJuM9Ev2dclumrqD7SFsm8f8s22/4M1/sH3zT/Zd1UJRPVlBQHRW+f9Y2E4rcruLdqDR
 rptDH3qeEniByvKgWDgrh442PAu5CmA+yMHL2qAK5ujh+CjH7hVUWH7aBc89sCgpAWPa
 HJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QBpF/UnYAHGf5ye3tF7er160fB31uR/wphWC4wYVvOY=;
 b=IRr5g7IDBEOGHRtB7WPdhS/VyFJV1ckbTiUKmaf78zsGoz2P3eweafHgigpT1wNGas
 KFdXIJTTvDxsJesNJgrQ+QRH21VuDzvXXI0oIa/kJtC86kmCehwEK5aW0cjg45R4QZfA
 VDoDenUXT52giMlK2bSHRB/PALfX94WRZ9YlVaPMh4P2ULmqseoLkDtP45pe9mpg1PwC
 bjn9ybCNbmyPbAFqVg5jIoH6SbUL91YSX3emEeVuIP3hgf5zYY/ccVePe3orUDNmAOyt
 haOX/Y1lyN/EI2zN+Q7zx08tH6GAZVHGOC2xLVVvYSFNfFWfXfziHiOkO614zp6Xi70T
 u9hA==
X-Gm-Message-State: AOAM530yAEkjBKU6NS0fymCPr0DAK1logP4VZYv4q6fZZELC0UzNJvGm
 VcVBxQeB2cWSurp53mfIBCY=
X-Google-Smtp-Source: ABdhPJxpeJvOxn5+wkohLMk++QGjYXEV+m6sdsuoygdRkAHpXCY4e6XA3/Ti9BNHd5lPJ3ItEYOTOg==
X-Received: by 2002:aed:38e3:: with SMTP id k90mr3438649qte.119.1613644345405; 
 Thu, 18 Feb 2021 02:32:25 -0800 (PST)
Received: from shinobu ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id g20sm3090235qtq.35.2021.02.18.02.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 02:32:24 -0800 (PST)
Date: Thu, 18 Feb 2021 19:32:16 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YC5CMLuKnXbkZond@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <013b2b8682ddc3c85038083e6d5567696b6254b3.1613131238.git.vilhelm.gray@gmail.com>
 <20210214181146.66d43da7@archlinux>
MIME-Version: 1.0
In-Reply-To: <20210214181146.66d43da7@archlinux>
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
Content-Type: multipart/mixed; boundary="===============3592084393812822179=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3592084393812822179==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9db4GuH0vsB+CvNJ"
Content-Disposition: inline


--9db4GuH0vsB+CvNJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2021 at 06:11:46PM +0000, Jonathan Cameron wrote:
> On Fri, 12 Feb 2021 21:13:44 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > The events_queue_size sysfs attribute provides a way for users to
> > dynamically configure the Counter events queue size for the Counter
> > character device interface. The size is in number of struct
> > counter_event data structures. The number of elements will be rounded-up
> > to a power of 2 due to a requirement of the kfifo_alloc function called
> > during reallocation of the queue.
> >=20
> > Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-counter |  8 +++++++
> >  drivers/counter/counter-chrdev.c            | 23 +++++++++++++++++++
> >  drivers/counter/counter-chrdev.h            |  2 ++
> >  drivers/counter/counter-sysfs.c             | 25 +++++++++++++++++++++
> >  4 files changed, 58 insertions(+)
> >=20
> > diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentatio=
n/ABI/testing/sysfs-bus-counter
> > index 847e96f19d19..f6cb2a8b08a7 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-counter
> > +++ b/Documentation/ABI/testing/sysfs-bus-counter
> > @@ -212,6 +212,14 @@ Description:
> >  		both edges:
> >  			Any state transition.
> > =20
> > +What:		/sys/bus/counter/devices/counterX/events_queue_size
> > +KernelVersion:	5.13
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Size of the Counter events queue in number of struct
> > +		counter_event data structures. The number of elements will be
> > +		rounded-up to a power of 2.
> > +
> >  What:		/sys/bus/counter/devices/counterX/name
> >  KernelVersion:	5.2
> >  Contact:	linux-iio@vger.kernel.org
> > diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter=
-chrdev.c
> > index 16f02df7f73d..53eea894e13f 100644
> > --- a/drivers/counter/counter-chrdev.c
> > +++ b/drivers/counter/counter-chrdev.c
> > @@ -375,6 +375,29 @@ void counter_chrdev_remove(struct counter_device *=
const counter)
> >  	cdev_del(&counter->chrdev);
> >  }
> > =20
> > +int counter_chrdev_realloc_queue(struct counter_device *const counter,
> > +				 size_t queue_size)
> > +{
> > +	int err;
> > +	DECLARE_KFIFO_PTR(events, struct counter_event);
> > +	unsigned long flags;
> > +
> > +	/* Allocate new events queue */
> > +	err =3D kfifo_alloc(&events, queue_size, GFP_ATOMIC);
>=20
> Is there any potential for losing events?

We take the events_list_lock down below so we're safe against missing an
event, but past events currently unread in the queue will be lost.

Shortening the size of the queue is inherently a destructive process if
we have more events in the current queue than can fit in the new queue.
Because we a liable to lose some events in such a case, I think it's
best to keep the behavior of this reallocation consistent and have it
provide a fresh empty queue every time, as opposed to sometimes dropping
events and sometimes not.

I also suspect an actual user would be setting the size of their queue
to the required amount before they begin watching events, rather than
adjusting it sporadically during a live operation.

> > +	if (err)
> > +		return err;
> > +
> > +	raw_spin_lock_irqsave(&counter->events_list_lock, flags);
> > +
> > +	/* Swap in new events queue */
> > +	kfifo_free(&counter->events);
> > +	counter->events.kfifo =3D events.kfifo;
> > +
> > +	raw_spin_unlock_irqrestore(&counter->events_list_lock, flags);
> > +
> > +	return 0;
> > +}
> > +
> >  static int counter_get_data(struct counter_device *const counter,
> >  			    const struct counter_comp_node *const comp_node,
> >  			    u64 *const value)
> > diff --git a/drivers/counter/counter-chrdev.h b/drivers/counter/counter=
-chrdev.h
> > index cf5a318fe540..ff7fb0191852 100644
> > --- a/drivers/counter/counter-chrdev.h
> > +++ b/drivers/counter/counter-chrdev.h
> > @@ -12,5 +12,7 @@
> >  int counter_chrdev_add(struct counter_device *const counter,
> >  		       const dev_t counter_devt);
> >  void counter_chrdev_remove(struct counter_device *const counter);
> > +int counter_chrdev_realloc_queue(struct counter_device *const counter,
> > +				 size_t queue_size);
> > =20
> >  #endif /* _COUNTER_CHRDEV_H_ */
> > diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-=
sysfs.c
> > index 0cb3dba950bc..9abc821a3871 100644
> > --- a/drivers/counter/counter-sysfs.c
> > +++ b/drivers/counter/counter-sysfs.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/sysfs.h>
> >  #include <linux/types.h>
> > =20
> > +#include "counter-chrdev.h"
> >  #include "counter-sysfs.h"
> > =20
> >  /**
> > @@ -737,12 +738,30 @@ static int counter_num_counts_read(struct counter=
_device *counter, u8 *val)
> >  	return 0;
> >  }
> > =20
> > +static int counter_events_queue_size_read(struct counter_device *count=
er,
> > +					  u64 *val)
> > +{
> > +	*val =3D counter->events.kfifo.mask + 1;
>=20
> kfifo_size() rather than open coding it?

Ack.

William Breathitt Gray

> > +	return 0;
> > +}
> > +
> > +static int counter_events_queue_size_write(struct counter_device *coun=
ter,
> > +					   u64 val)
> > +{
> > +	return counter_chrdev_realloc_queue(counter, val);
> > +}
> > +
> >  static struct counter_comp counter_num_signals_comp =3D
> >  	COUNTER_COMP_DEVICE_U8("num_signals", counter_num_signals_read, NULL);
> > =20
> >  static struct counter_comp counter_num_counts_comp =3D
> >  	COUNTER_COMP_DEVICE_U8("num_counts", counter_num_counts_read, NULL);
> > =20
> > +static struct counter_comp counter_events_queue_size_comp =3D
> > +	COUNTER_COMP_DEVICE_U64("events_queue_size",
> > +				counter_events_queue_size_read,
> > +				counter_events_queue_size_write);
> > +
> >  static int counter_sysfs_attr_add(struct counter_device *const counter,
> >  				  struct counter_attribute_group *group)
> >  {
> > @@ -781,6 +800,12 @@ static int counter_sysfs_attr_add(struct counter_d=
evice *const counter,
> >  	if (err < 0)
> >  		return err;
> > =20
> > +	/* Create num_counts attribute */
> > +	err =3D counter_attr_create(dev, group, &counter_events_queue_size_co=
mp,
> > +				  scope, NULL);
> > +	if (err < 0)
> > +		return err;
> > +
> >  	/* Create an attribute for each extension */
> >  	for (i =3D 0; i < counter->num_ext; i++) {
> >  		ext =3D counter->ext + i;
>=20

--9db4GuH0vsB+CvNJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAuQjAACgkQhvpINdm7
VJLb4w//XoS0cfe5nK5uwMVsnyoHPugIaFvxzK5Bm+98z+78pkVC3MPScsWvip1T
thzsY6SVy1LnrYkIihPnyFMzs+xwg6B2uyViHdXBjlQyKbEyTBsMUpHJbCsqlJDU
I91rt3gP3SKYhg5e+bN0y2jFgXohy/3glP8vMoeWaUh7aJXsjnNUWNdvb4zJzn7A
RlnfRvL8q0E7cU/gZ7ra0GgdTyTTTIYzdIGPyf/W9BdJxdZsr8fUStaXDWD+vutF
7TgNBJ0dLnBJotIFe9CUegCn232vmpls68SCM2eRWoo9UOJIa+IzislxvQoVOj+w
gJOd1VKwmVphRc6j9myvqe8NlVeFt5bnkQdvw9Vle9qjerlUxkE5ObXH95H178uA
a6QrI5REZnRU5ggfQCF9kGqy49O0ealT/+fIvrkawdd8x7Km4/Ua5h1vxzZroW2x
J0P8j2+SQC0+ZiVryWAl8BL2ochZBaNdCulYAF+X5Na/ynw+WCZ8ds/dwAoY9M27
DJYvS2odf1RzZ7iOTA5l5QmFOx7r//n4eh9ViYYobB71rGDE0BYPFu+IhDod30wr
TopXRBcepDLGgCRaYcmrjmXUCqIKqBqX8tC7dJqMSAQiI59bTwqQtYeb9Z54g5GL
XeDYmgpZBmAp5qGgt0BMnglb/qemGvYEzqwXeOwkIe9iZoYTnW8=
=ARu2
-----END PGP SIGNATURE-----

--9db4GuH0vsB+CvNJ--

--===============3592084393812822179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3592084393812822179==--
