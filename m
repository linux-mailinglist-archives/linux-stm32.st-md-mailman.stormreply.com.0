Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5906326AB4
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Feb 2021 01:20:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B818C57B59;
	Sat, 27 Feb 2021 00:20:59 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18079C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Feb 2021 00:20:58 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id l15so5665969vsq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 16:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MDe5+O2spJHSt6JrFGkCdGoYYocliObqhGtzWKjr3VY=;
 b=BidCqg9ZIdNd1XcUAlLWvwsWoDJUE+PSJFh5ja/DAiY0yeLnijRL1NIDyEtLZ9KYyS
 BTapOMCIIcCjvpEEI3gWSYrnA/qLpM2TLVNRJHlOXRRuQ+WLd9LNEJ3Rr/KWKayjgbPx
 GYe3InfVTKvg88hc1weU4Gcl4F+iTLwKbWR2sU1DIZARNX4TKcpLK842su6EVqYyF9Xr
 cA7jEIf4Jwz8/DKl/PIuDhRb7Rsn63hUzE3gQ8tuLaTCWG6ctToQO5p0KBDJ7VVO3ojG
 JUUc/5sRw19x7C133UvnKJ/t6qZuSeZBeFvPijn++PhzC0E22esEne7CxUPBugN9Rbgt
 lqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MDe5+O2spJHSt6JrFGkCdGoYYocliObqhGtzWKjr3VY=;
 b=ht9gueQZtUN9POJBpmOqCleE8b+k4uFmm6IY5KxBvEt+4XHbq+twg1va1DhHs2kgtm
 2o+F62DOCBzULn/5x5w3esa/4Dn80dbAIugUYdwarhsUCrm/JO1EUoFOHSv9vPfWCbA/
 JNyAhTJxUoyIH5ERZIHcXQpdGe1WV5nFVS5kAhG+cetV0TdBnLlkUkuNAwCgYPmN7ljZ
 WLXVnwW4WRyO0Tj/BAF+H3Tjya8439Tzr9AEGUyGUDeSLWSWZbqBh6d5DykPotdAcNeh
 rQ/H7aqkcIas/LPP6fDSN5jLWEOAPwKdbw1Dc9Iesf+XnUzMswijRWUh4wDscgW2Lr/8
 lvcw==
X-Gm-Message-State: AOAM531gDjdzJYe+wFSNl8dI+Z5U8asm9tCsgAj3sQH8bIcI8m03pheh
 BSZMjbWCZyDi1pCFWLr8pGg=
X-Google-Smtp-Source: ABdhPJwzdyZ/ny9vR8ICikk+Ze2fTUzs1GlD+G4s/w+njrYAF+YzoIOUmTGTciaz0G/5xSWIx/6HxA==
X-Received: by 2002:a67:a85:: with SMTP id 127mr3432003vsk.16.1614385256799;
 Fri, 26 Feb 2021 16:20:56 -0800 (PST)
Received: from shinobu ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id t6sm1267925vke.13.2021.02.26.16.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 16:20:56 -0800 (PST)
Date: Sat, 27 Feb 2021 09:20:48 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <YDmQYK1lWXl7H5lm@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <013b2b8682ddc3c85038083e6d5567696b6254b3.1613131238.git.vilhelm.gray@gmail.com>
 <20210214181146.66d43da7@archlinux> <YC5CMLuKnXbkZond@shinobu>
 <20210221155140.3e1ef13c@archlinux> <YDg65OmLa05g53qc@shinobu>
 <37ea96a2-d4a1-7d4c-a68a-8dc82896e86c@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <37ea96a2-d4a1-7d4c-a68a-8dc82896e86c@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>,
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
Content-Type: multipart/mixed; boundary="===============3180689973713729558=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3180689973713729558==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/fFfRNp8huk1mEVl"
Content-Disposition: inline


--/fFfRNp8huk1mEVl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2021 at 06:14:12PM -0600, David Lechner wrote:
> On 2/25/21 6:03 PM, William Breathitt Gray wrote:
> > On Sun, Feb 21, 2021 at 03:51:40PM +0000, Jonathan Cameron wrote:
> >> On Thu, 18 Feb 2021 19:32:16 +0900
> >> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >>
> >>> On Sun, Feb 14, 2021 at 06:11:46PM +0000, Jonathan Cameron wrote:
> >>>> On Fri, 12 Feb 2021 21:13:44 +0900
> >>>> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> >>>>   =20
> >>>>> The events_queue_size sysfs attribute provides a way for users to
> >>>>> dynamically configure the Counter events queue size for the Counter
> >>>>> character device interface. The size is in number of struct
> >>>>> counter_event data structures. The number of elements will be round=
ed-up
> >>>>> to a power of 2 due to a requirement of the kfifo_alloc function ca=
lled
> >>>>> during reallocation of the queue.
> >>>>>
> >>>>> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> >>>>> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> >>>>> ---
> >>>>>   Documentation/ABI/testing/sysfs-bus-counter |  8 +++++++
> >>>>>   drivers/counter/counter-chrdev.c            | 23 ++++++++++++++++=
+++
> >>>>>   drivers/counter/counter-chrdev.h            |  2 ++
> >>>>>   drivers/counter/counter-sysfs.c             | 25 ++++++++++++++++=
+++++
> >>>>>   4 files changed, 58 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Document=
ation/ABI/testing/sysfs-bus-counter
> >>>>> index 847e96f19d19..f6cb2a8b08a7 100644
> >>>>> --- a/Documentation/ABI/testing/sysfs-bus-counter
> >>>>> +++ b/Documentation/ABI/testing/sysfs-bus-counter
> >>>>> @@ -212,6 +212,14 @@ Description:
> >>>>>   		both edges:
> >>>>>   			Any state transition.
> >>>>>  =20
> >>>>> +What:		/sys/bus/counter/devices/counterX/events_queue_size
> >>>>> +KernelVersion:	5.13
> >>>>> +Contact:	linux-iio@vger.kernel.org
> >>>>> +Description:
> >>>>> +		Size of the Counter events queue in number of struct
> >>>>> +		counter_event data structures. The number of elements will be
> >>>>> +		rounded-up to a power of 2.
> >>>>> +
> >>>>>   What:		/sys/bus/counter/devices/counterX/name
> >>>>>   KernelVersion:	5.2
> >>>>>   Contact:	linux-iio@vger.kernel.org
> >>>>> diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/cou=
nter-chrdev.c
> >>>>> index 16f02df7f73d..53eea894e13f 100644
> >>>>> --- a/drivers/counter/counter-chrdev.c
> >>>>> +++ b/drivers/counter/counter-chrdev.c
> >>>>> @@ -375,6 +375,29 @@ void counter_chrdev_remove(struct counter_devi=
ce *const counter)
> >>>>>   	cdev_del(&counter->chrdev);
> >>>>>   }
> >>>>>  =20
> >>>>> +int counter_chrdev_realloc_queue(struct counter_device *const coun=
ter,
> >>>>> +				 size_t queue_size)
> >>>>> +{
> >>>>> +	int err;
> >>>>> +	DECLARE_KFIFO_PTR(events, struct counter_event);
> >>>>> +	unsigned long flags;
> >>>>> +
> >>>>> +	/* Allocate new events queue */
> >>>>> +	err =3D kfifo_alloc(&events, queue_size, GFP_ATOMIC);
> >>>>
> >>>> Is there any potential for losing events?
> >>>
> >>> We take the events_list_lock down below so we're safe against missing=
 an
> >>> event, but past events currently unread in the queue will be lost.
> >>>
> >>> Shortening the size of the queue is inherently a destructive process =
if
> >>> we have more events in the current queue than can fit in the new queu=
e.
> >>> Because we a liable to lose some events in such a case, I think it's
> >>> best to keep the behavior of this reallocation consistent and have it
> >>> provide a fresh empty queue every time, as opposed to sometimes dropp=
ing
> >>> events and sometimes not.
> >>>
> >>> I also suspect an actual user would be setting the size of their queue
> >>> to the required amount before they begin watching events, rather than
> >>> adjusting it sporadically during a live operation.
> >>>
> >>
> >> Absolutely agree.   As such I wonder if you are better off enforcing t=
his
> >> behaviour?  If the cdev is open for reading, don't allow the fifo to be
> >> resized.
> >>
> >> Jonathan
> >=20
> > I can't really think of a good reason not to, so let's enforce it: if
> > the cdev is open, then we'll return an EINVAL if the user attempts to
> > resize the queue.
> >=20
> > What is a good way to check for this condition? Should I just call
> > kref_read() and see if it's greater than 1? For example, in
> > counter_chrdev_realloc_queue():
> >=20
> > 	if (kref_read(&counter->dev.kobj.kref) > 1)
> > 		return -EINVAL;
> >=20
> > William Breathitt Gray
> >=20
>=20
> Wouldn't EBUSY make more sense?

Yes, EBUSY would be better here because the operation isn't necessarily
invalid, just unavailable because someone else has the cdev open.

William Breathitt Gray

--/fFfRNp8huk1mEVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmA5kFEACgkQhvpINdm7
VJKsqw//XGoYUzTvd45HLoZSMeCbqIqTUfHfIWRim7jSN79aeGhCPltRc08n0OcW
23ZMcoib3ZEvpCheGx76fstTsNvWj+H+uMoB6Finr7ALskttCVzRlbYtYwk8eimX
/XyIpiF2g9I5movwM5+8AZWC5ZKnBCDhTHshzdiT8KUt4UbLSGz13kA0FUCFAk8Y
/fcF76ID+84EcC/fM/0+St6woF3nDUZ//VB50iYqOV5YPZSudDH093jsv+bNWjMr
1Y9sTajY48nSHoMeRjvul1UUxKVsagYprCD3UhlRZFCQhmF4zganDtSOcijCjPUJ
aD4ltmneDf9db1DU7WshKmQxwEyq+14J2Yvm93bowVTzcI2g3mqqDM1iCmk49AYD
tnfYCuRxCPmCRnXF1KHmb6Gfqx3tWAsTN3ArfhJE61cE8nyQxBTCbgWbrN6SC12z
1peklmfYc4aXq2bkn1/dGQvooZ6mXWJNABx7sxCBM/X9rvnBMwrdOIRuCTMFkM7U
UgenrI5Pa2pjKgpkmIQg/5+BnT3fK2q/U4vRGBTmIyxDnQwMEb4CNZPcQb4Wj2zW
9oNxnp00jD+/l41UJyFbwUAqOzgcPbymqzUaP5eOtjk1gYmnXJasVtRn9iKUjg1y
4gt+wYOnQum0khjg/a7uqEhTMEuILLBJy3tnxm6BxnvR5ieEyuY=
=P9yS
-----END PGP SIGNATURE-----

--/fFfRNp8huk1mEVl--

--===============3180689973713729558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3180689973713729558==--
