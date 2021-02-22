Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE53213D0
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Feb 2021 11:11:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F86DC57B64;
	Mon, 22 Feb 2021 10:11:37 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DE00C57B58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Feb 2021 10:11:36 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 8B3741C0B7F; Mon, 22 Feb 2021 11:11:34 +0100 (CET)
Date: Mon, 22 Feb 2021 11:11:33 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20210222101133.GB14587@amd>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <350cafba81d3220b64efdb019bd76c08eb1e5d10.1613131238.git.vilhelm.gray@gmail.com>
 <20210214174819.6757e2b0@archlinux>
MIME-Version: 1.0
In-Reply-To: <20210214174819.6757e2b0@archlinux>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 alexandre.belloni@bootlin.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com,
 William Breathitt Gray <vilhelm.gray@gmail.com>, mcoquelin.stm32@gmail.com,
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
Content-Type: multipart/mixed; boundary="===============5003188818987491229=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5003188818987491229==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

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

Is there a way to eat all kernel memory and crash the system by adding
too many watches?

> > +For example, the following userspace code opens ``/dev/counter0``,
> > +configures the ``COUNTER_EVENT_INDEX`` event channel 0 to gather Count=
 0
> > +and Count 1, and prints out the data as it becomes available on the
> > +character device node::
> > +
>=20
> Consider adding an example program under tools/
>=20
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

> > +                fd =3D open("/dev/counter0", O_RDWR);
> > +
> > +                ioctl(fd, COUNTER_ADD_WATCH_IOCTL, watches);
> > +                ioctl(fd, COUNTER_ADD_WATCH_IOCTL, watches + 1);
> > +                ioctl(fd, COUNTER_ENABLE_EVENTS_IOCTL);

> > +                for (;;) {
> > +                        read(fd, event_data, sizeof(event_data));

If this goes to tools it really should have error handling and
handling of short read.

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAzg1UACgkQMOfwapXb+vJsaACffCOe28RqjxELfyTkP8K3Wy+h
SeYAn26EGcT9n9wUACiesQqsPDqCDl31
=ku3H
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--

--===============5003188818987491229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5003188818987491229==--
