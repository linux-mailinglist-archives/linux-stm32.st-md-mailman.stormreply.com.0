Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066F325ABC
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 01:22:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE233C57B59;
	Fri, 26 Feb 2021 00:22:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41096C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 00:22:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id b145so4849868pfb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 16:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZVtO34Fx9melQ0RWvhpWiLfdRsyQLrEZC9+0oz/pBCg=;
 b=QMZhOIHxXA/kBocqfbWdY2dYr/m6PygIkF+5u20h1H77dag6zzIRQMCx6Y5DPZ5Z6a
 6U1xHCxmtXo5Qb0PUjeKz3/e7Gq2rMYOQnB8Q+DEPi51Rim8t8A0XmtEjC0im9wg2MhZ
 kzXKMETO4NtDA7NpALgW8b0FpajSkU4FmQ0h5QeGKs6EJXCcbNAs21+Y2U/r4JRx10PO
 hgbwbXyEzwQ0P0kp2ztfR8qcXCN8T4GW0lVwZPVIu8TS5gUOD5OmM2/t9H/yLW8eoZE6
 pGzzacFLIll58j2FcSXNuCpiAsAMj+ERnxQtZHOKxsiSrmUw4BX8+XSh68WBUa+sTfj4
 KN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZVtO34Fx9melQ0RWvhpWiLfdRsyQLrEZC9+0oz/pBCg=;
 b=iEzol6nzQFmgiXnsZxCBagDqmQmVrgGW5Y1MPnBfjGTVorlS+1KN39lNVz5xVPDDyI
 JNGJEequBnJHy71hAX2WR+b3yP+j+hzcEMj5Kix84+OgM4S7ZqAHPTWekOU1jxwaG5gp
 XPoVIQ3ZZxiI3hMVcZSfFNxGwVUgLCUUZPq+v2zGmUcZsj/I5zNTms6TLkd2sZkG2VNJ
 lShk8+iLJt7iNOgFL+/jkBRRm352ZcfJe6/yvDMQxpmPOPci9nMnTKSrOkA5X6qQQ7HQ
 AXUzoHEuLs++L1bmQig/YRo/XqLPHqH9WL4Yrgn4BYGAAT7KbM5/xNzB++/XEoxhYhUH
 tWyg==
X-Gm-Message-State: AOAM531GIso+dzZp1dJytV3vntLGqQWtc+XnQtHFD/Q6BulEUUUNaeSG
 BYICZF7JyQfe5iAvONk3jAU=
X-Google-Smtp-Source: ABdhPJyqGNMQQGRUV3Qe+b/FrEpmOQL3L7BckY16TDFD0R43dWxrlIng89+q7mVXPBY86h6nDo+TgQ==
X-Received: by 2002:aa7:9298:0:b029:1ed:fd64:e6b7 with SMTP id
 j24-20020aa792980000b02901edfd64e6b7mr314338pfa.5.1614298962406; 
 Thu, 25 Feb 2021 16:22:42 -0800 (PST)
Received: from shinobu (113x37x72x20.ap113.ftth.ucom.ne.jp. [113.37.72.20])
 by smtp.gmail.com with ESMTPSA id ml17sm8323428pjb.45.2021.02.25.16.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 16:22:41 -0800 (PST)
Date: Fri, 26 Feb 2021 09:22:33 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YDg/SUicfRz75W67@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <350cafba81d3220b64efdb019bd76c08eb1e5d10.1613131238.git.vilhelm.gray@gmail.com>
 <20210214174819.6757e2b0@archlinux>
MIME-Version: 1.0
In-Reply-To: <20210214174819.6757e2b0@archlinux>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 18/22] docs: counter: Document
 character device interface
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
Content-Type: multipart/mixed; boundary="===============0824267660002145351=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0824267660002145351==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kgh9PI3Omt/Nk1A9"
Content-Disposition: inline


--Kgh9PI3Omt/Nk1A9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2021 at 05:48:19PM +0000, Jonathan Cameron wrote:
> On Fri, 12 Feb 2021 21:13:42 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > This patch adds high-level documentation about the Counter subsystem
> > character device interface.
> >=20
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> > ---
> >  Documentation/driver-api/generic-counter.rst  | 243 +++++++++++++++---
> >  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
> >  2 files changed, 203 insertions(+), 41 deletions(-)
> >=20
> > diff --git a/Documentation/driver-api/generic-counter.rst b/Documentati=
on/driver-api/generic-counter.rst
> > index f6397218aa4c..3be109dc81bb 100644
> > --- a/Documentation/driver-api/generic-counter.rst
> > +++ b/Documentation/driver-api/generic-counter.rst
> > @@ -223,19 +223,6 @@ whether an input line is differential or single-en=
ded) and instead focus
> >  on the core idea of what the data and process represent (e.g. position
> >  as interpreted from quadrature encoding data).
> > =20
> > -Userspace Interface
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -Several sysfs attributes are generated by the Generic Counter interfac=
e,
> > -and reside under the /sys/bus/counter/devices/counterX directory, where
> > -counterX refers to the respective counter device. Please see
> > -Documentation/ABI/testing/sysfs-bus-counter for detailed
> > -information on each Generic Counter interface sysfs attribute.
> > -
> > -Through these sysfs attributes, programs and scripts may interact with
> > -the Generic Counter paradigm Counts, Signals, and Synapses of respecti=
ve
> > -counter devices.
> > -
> >  Driver API
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =20
> > @@ -388,16 +375,16 @@ userspace interface components::
> >                          / driver callbacks /
> >                          -------------------
> >                                  |
> > -                +---------------+
> > -                |
> > -                V
> > -        +--------------------+
> > -        | Counter sysfs      |
> > -        +--------------------+
> > -        | Translates to the  |
> > -        | standard Counter   |
> > -        | sysfs output       |
> > -        +--------------------+
> > +                +---------------+---------------+
> > +                |                               |
> > +                V                               V
> > +        +--------------------+          +---------------------+
> > +        | Counter sysfs      |          | Counter chrdev      |
> > +        +--------------------+          +---------------------+
> > +        | Translates to the  |          | Translates to the   |
> > +        | standard Counter   |          | standard Counter    |
> > +        | sysfs output       |          | character device    |
> > +        +--------------------+          +---------------------+
> > =20
> >  Thereafter, data can be transferred directly between the Counter device
> >  driver and Counter userspace interface::
> > @@ -428,23 +415,30 @@ driver and Counter userspace interface::
> >                          / u64     /
> >                          ----------
> >                                  |
> > -                +---------------+
> > -                |
> > -                V
> > -        +--------------------+
> > -        | Counter sysfs      |
> > -        +--------------------+
> > -        | Translates to the  |
> > -        | standard Counter   |
> > -        | sysfs output       |
> > -        |--------------------|
> > -        | Type: const char * |
> > -        | Value: "42"        |
> > -        +--------------------+
> > -                |
> > -         ---------------
> > -        / const char * /
> > -        ---------------
> > +                +---------------+---------------+
> > +                |                               |
> > +                V                               V
> > +        +--------------------+          +---------------------+
> > +        | Counter sysfs      |          | Counter chrdev      |
> > +        +--------------------+          +---------------------+
> > +        | Translates to the  |          | Translates to the   |
> > +        | standard Counter   |          | standard Counter    |
> > +        | sysfs output       |          | character device    |
> > +        |--------------------|          |---------------------|
> > +        | Type: const char * |          | Type: u64           |
> > +        | Value: "42"        |          | Value: 42           |
> > +        +--------------------+          +---------------------+
> > +                |                               |
> > +         ---------------                 -----------------------
> > +        / const char * /                / struct counter_event /
> > +        ---------------                 -----------------------
> > +                |                               |
> > +                |                               V
> > +                |                       +-----------+
> > +                |                       | read      |
> > +                |                       +-----------+
> > +                |                       \ Count: 42 /
> > +                |                        -----------
> >                  |
> >                  V
> >          +--------------------------------------------------+
> > @@ -453,7 +447,7 @@ driver and Counter userspace interface::
> >          \ Count: "42"                                      /
> >           --------------------------------------------------
> > =20
> > -There are three primary components involved:
> > +There are four primary components involved:
> > =20
> >  Counter device driver
> >  ---------------------
> > @@ -473,3 +467,170 @@ and vice versa.
> >  Please refer to the ``Documentation/ABI/testing/sysfs-bus-counter`` fi=
le
> >  for a detailed breakdown of the available Generic Counter interface
> >  sysfs attributes.
> > +
> > +Counter chrdev
> > +--------------
> > +Translates counter data to the standard Counter character device; data
> > +is transferred via standard character device read calls, while Counter
> > +events are configured via ioctl calls.
> > +
> > +Sysfs Interface
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Several sysfs attributes are generated by the Generic Counter interfac=
e,
> > +and reside under the ``/sys/bus/counter/devices/counterX`` directory,
> > +where ``X`` is to the respective counter device id. Please see
> > +``Documentation/ABI/testing/sysfs-bus-counter`` for detailed informati=
on
> > +on each Generic Counter interface sysfs attribute.
> > +
> > +Through these sysfs attributes, programs and scripts may interact with
> > +the Generic Counter paradigm Counts, Signals, and Synapses of respecti=
ve
> > +counter devices.
> > +
> > +Counter Character Device
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +
> > +Counter character device nodes are created under the ``/dev`` directory
> > +as ``counterX``, where ``X`` is the respective counter device id.
> > +Defines for the standard Counter data types are exposed via the
> > +userspace ``include/uapi/linux/counter.h`` file.
> > +
> > +Counter events
> > +--------------
> > +Counter device drivers can support Counter events by utilizing the
> > +``counter_push_event`` function::
> > +
> > +        void counter_push_event(struct counter_device *const counter, =
const u8 event,
> > +                                const u8 channel);
> > +
> > +The event id is specified by the ``event`` parameter; the event channel
> > +id is specified by the ``channel`` parameter. When this function is
> > +called, the Counter data associated with the respective event is
> > +gathered, and a ``struct counter_event`` is generated for each datum a=
nd
> > +pushed to userspace.
> > +
> > +Counter events can be configured by users to report various Counter
> > +data of interest. This can be conceptualized as a list of Counter
> > +component read calls to perform. For example::
> > +
> > +        +~~~~~~~~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~+
> > +        | COUNTER_EVENT_OVERFLOW | COUNTER_EVENT_INDEX    |
> > +        +~~~~~~~~~~~~~~~~~~~~~~~~+~~~~~~~~~~~~~~~~~~~~~~~~+
> > +        | Channel 0              | Channel 0              |
> > +        +------------------------+------------------------+
> > +        | * Count 0              | * Signal 0             |
> > +        | * Count 1              | * Signal 0 Extension 0 |
> > +        | * Signal 3             | * Extension 4          |
> > +        | * Count 4 Extension 2  +------------------------+
> > +        | * Signal 5 Extension 0 | Channel 1              |
> > +        |                        +------------------------+
> > +        |                        | * Signal 4             |
> > +        |                        | * Signal 4 Extension 0 |
> > +        |                        | * Count 7              |
> > +        +------------------------+------------------------+
> > +
> > +When ``counter_push_event(counter, COUNTER_EVENT_INDEX, 1)`` is called
> > +for example, it will go down the list for the ``COUNTER_EVENT_INDEX``
> > +event channel 1 and execute the read callbacks for Signal 4, Signal 4
> > +Extension 0, and Count 4 -- the data returned for each is pushed to a
> > +kfifo as a ``struct counter_event``, which userspace can retrieve via a
> > +standard read operation on the respective character device node.
> > +
> > +Userspace
> > +---------
> > +Userspace applications can configure Counter events via ioctl operatio=
ns
> > +on the Counter character device node. There following ioctl codes are
> > +supported and provided by the ``linux/counter.h`` userspace header fil=
e:
> > +
> > +* COUNTER_ADD_WATCH_IOCTL:
> > +  Queues a Counter watch for the specified event. The queued watches
> > +  will not be applied until ``COUNTER_ENABLE_EVENTS_IOCTL`` is called.
> > +
> > +* COUNTER_ENABLE_EVENTS_IOCTL:
> > +  Enables monitoring the events specified by the Counter watches that
> > +  were queued by ``COUNTER_ADD_WATCH_IOCTL``. If events are already
> > +  enabled, the new set of watches replaces the old one. Calling this
> > +  ioctl also has the effect of clearing the queue of watches added by
> > +  ``COUNTER_ADD_WATCH_IOCTL``.
> > +
> > +* COUNTER_DISABLE_EVENTS_IOCTL:
> > +  Stops monitoring the previously enabled events.
>=20
> Is there a way to remove a watch?=20

Both COUNTER_ENABLE_EVENTS_IOCTL and COUNTER_DISABLE_EVENTS_IOCTL remove
the watches -- the only difference is that COUNTER_ENABLE_EVENTS_IOCTL
will also swap in a new set of watches. The watches are also removed if
a user closes the cdev.

If you mean whether there is a way to selectively remove a single watch,
then the process for that would be to generate a new set of watches
using COUNTER_ADD_WATCH_IOCTL and then swap them in by using
COUNTER_ENABLE_EVENTS_IOCTL. This swap happens atomically so there's no
risk of missing an event. The user should already know the current
configuration of watches because they are the ones who added them after
opening the cdev, so we don't need to worry about dealing with an old
unknown watch configuration created by someone else.

> > +
> > +To configure events to gather Counter data, users first populate a
> > +``struct counter_watch`` with the relevant event id, event channel id,
> > +and the information for the desired Counter component from which to
> > +read, and then pass it via the ``COUNTER_ADD_WATCH_IOCTL`` ioctl
> > +command.
> > +
> > +Note that an event can be watched without gathering Counter data by
> > +setting the ``component.type`` member equal to
> > +``COUNTER_COMPONENT_NONE``. With this configuration the Counter
> > +character device will simply populate the event timestamps for those
> > +respective ``struct counter_event`` elements and ignore the component
> > +value.
> > +
> > +The ``COUNTER_ADD_WATCH_IOCTL`` command will buffer these Counter
> > +watches. When ready, the ``COUNTER_ENABLE_EVENTS_IOCTL`` ioctl command
> > +may be used to activate these Counter watches.
> > +
> > +Userspace applications can then execute a ``read`` operation (optional=
ly
> > +calling ``poll`` first) on the Counter character device node to retrie=
ve
> > +``struct counter_event`` elements with the desired data.
> > +
> > +For example, the following userspace code opens ``/dev/counter0``,
> > +configures the ``COUNTER_EVENT_INDEX`` event channel 0 to gather Count=
 0
> > +and Count 1, and prints out the data as it becomes available on the
> > +character device node::
> > +
>=20
> Consider adding an example program under tools/

I can put this example program we have here below under tools/. I'd like
to create a more general Counter test program in the future, but I think
it will be a more involved project to undertake right now given the
differences between the possible configurations available and possible
for the Counter drivers we have.

> > +        #include <fcntl.h>
> > +        #include <linux/counter.h>
> > +        #include <stdio.h>
> > +        #include <string.h>
> > +        #include <sys/ioctl.h>
> > +        #include <unistd.h>
> > +
> > +        struct counter_watch watches[2] =3D {
> > +                {
> > +                        .component.type =3D COUNTER_COMPONENT_COUNT,
> > +                        .component.scope =3D COUNTER_SCOPE_COUNT,
> > +                        .component.parent =3D 0,
>=20
> Good to add comments on what these elements actually are?

Ack.

William Breathitt Gray

--Kgh9PI3Omt/Nk1A9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmA4P0kACgkQhvpINdm7
VJJxZxAA2ChLaU+4vaVqUf1Xzt/TxYrKTCOvBnQ8bj6rzu2urUDCmQkO0HolzvPm
Qetgfn61rH0vhqWugLVGFECKqYhX/4HUyvwbvNA6F/AR51cLqxFBtBvklg3bCgQj
pLbDWlukGb6pub7KgDggtujUE/phu/DKmPs2ulL5SO/JiSMmDw3CNrgkWGkFP5ej
RX0zvzR/bN7M7E6JarNgbmbdEPtbpzL14TTS53tK45hzWNoKmWnRJH91AENcCLwh
KsapKlOINkPS8pk0mDGOKtreMYuHcrSxkH6pAMvc+ECsejFE+CyBIERN8kXDz4hP
kc2y6m0WUdtNmFtu/R6uyrFNUsICRygSaRenT6vCLkDfY1E2XlsoHu/at/cg4LsV
JjTvpsfsJTISs8Ro1sDjOO4Lhid7GBmwPGXEW8iXpRZTAqneNsjvJGllXf7KjZ8x
WuG4qOCJXM0vVsyew7yfQhX/fJ+UqVT7zkmWBb8P7kt5L+tUbjBDUuxeHBPsVrba
oyrJAOmirG8atM1VgKHKIqbjiFBqFDeVzN/j2gDG6lD7xbWDglh5/dTPWKn1ThwT
6jpqDP4obzfxgWnrrjabRyxT+tP8BT20cCSYVOfNrUnA2022CpM8s1msg9dzSRlJ
h7tq76ZwlTDUz8ZICcn/2Vcx1yXxOmfcWhGq9U2wudR9CKx5Vcs=
=Bb7C
-----END PGP SIGNATURE-----

--Kgh9PI3Omt/Nk1A9--

--===============0824267660002145351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0824267660002145351==--
