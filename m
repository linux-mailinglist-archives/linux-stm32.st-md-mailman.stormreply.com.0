Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC61E014B
	for <lists+linux-stm32@lfdr.de>; Sun, 24 May 2020 19:55:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F9C8C36B24;
	Sun, 24 May 2020 17:55:01 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7144DC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 17:55:00 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s1so15676809qkf.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 May 2020 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0dgnh/XaZsnwacjqggM181DcBPrR3laf+TeiM8m7vqk=;
 b=tsOKr5FfJxEh2gzdUpv24NISVHfQ2j1WR3SZdntX/h7WRh5Gs4tMpF25dx49rQXWNb
 kZqb9z0kKpbiBFEJ9zrft2UW4uufA6T3hQMyp3kqrgm1H1aZGuaS7iZdcRCgtMnYD4sk
 r96cJeD24+Bwk6Zlbb2Pf7XKsiNvA0CORJvZftpLgSja+S4/YRnd3m0+k1W21riWv+73
 4unw5UlpO2MDuwfohYX+dsO6N6CgtnV+B9vD9DlHTj0yUZlHPKDIR0oCWNn3y1lFdPjh
 wNT66bj2zbO8imR0HNJjMKZ31b1XU8hJGb0y+YplK7p3SwUCJseQJgfAQcwVngI+Q70A
 wHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0dgnh/XaZsnwacjqggM181DcBPrR3laf+TeiM8m7vqk=;
 b=iUXmXJY0v8wN/gDAj7R177FrD1lN5jCIY5esoELzJ5S6zBb/LD9Vv14KLEfP+8jzNT
 KsM1k0yoWOTw029x9LFtbHvu7fKw6raGPxoMJH5M+onozK0BNeADvxEZVV9gMnTbe27G
 74f9VOwT+wbsiTvRy/oFHsktBvdxofshBiPer6i3btn3I8InuGuKJAzeLtgWjXDz6bbN
 w+9fMEn43E0wzl5lVbi0J2E0d+O4nZFN5w77K2qnT1Ra3f/rxBvj887LglYTVyOhoU11
 Zp2bhW7Ga6mMVHAtW/HI4XKbaXmQRgiQRs76OrdY3xUDXxRLKMep5xRgXfF6g0fSVEA6
 jT/w==
X-Gm-Message-State: AOAM531PNyg3qZ+gakYjimLToheChbE+gWYpnauGj4ffFAXIdA4FIOBp
 mI2s+k/aeLpTHF3wifrq7RM=
X-Google-Smtp-Source: ABdhPJw399VHSye1og2c9do32sx6Q/O+ccUqQyDmSrToFChiVuUNCU93D5mCvyjzW90eCmvsfRAwTw==
X-Received: by 2002:a37:e101:: with SMTP id c1mr9554151qkm.433.1590342899068; 
 Sun, 24 May 2020 10:54:59 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id x2sm8339443qke.42.2020.05.24.10.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 10:54:58 -0700 (PDT)
Date: Sun, 24 May 2020 13:54:39 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <20200524175439.GA14300@shinobu>
References: <cover.1589654470.git.vilhelm.gray@gmail.com>
 <20200524172542.31ff6ac7@archlinux>
MIME-Version: 1.0
In-Reply-To: <20200524172542.31ff6ac7@archlinux>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] Introduce the Counter character
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
Content-Type: multipart/mixed; boundary="===============1605239013709408890=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1605239013709408890==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2020 at 05:25:42PM +0100, Jonathan Cameron wrote:
>=20
> ...
>=20
> > The following are some questions I have about this patchset:
> >=20
> > 1. Should the data format of the character device be configured via a
> >    sysfs attribute?
> >=20
> >    In this patchset, the first 196095 bytes of the character device are
> >    dedicated as a selection area to choose which Counter components or
> >    extensions should be exposed; the subsequent bytes are the actual
> >    data for the Counter components and extensions that were selected.
>=20
> That sounds like the worst of all possible worlds.  Reality is you need
> to do some magic library so at that point you might as well have ioctl
> options to configure it.   I wonder if you can keep the data flow
> to be a simple 'read' from the chardev but move the control away from
> that.  Either control via some chrdevs but keep them to the 'set / get'
> if this element is going to turn up in the read or not.  You rapidly
> run into problems though, such as now to see how large a given element
> is going to be etc.  Plus ioctls are rather messier to extend than
> simply adding a new sysfs file.  Various subsystems do complex
> 'descriptor' type approaches to get around this, or you could do
> self describing records rather than raw data - like an input
> ev_dev event.

Yes I agree, I don't think combining nondata with data is good design --
it's better if users are able to simply perform read/write on the
character device without having to keep track of valid offsets and
controls.

After giving this some more thought, I believe human-readable sysfs
attributes are the way to go to support configuration of the character
device. I am thinking of a system like this:

* Users configure the counter character device via a sysfs attribute
  such as /sys/bus/counter/devices/counterX/chrdev_format or similar.

* Users may write to this sysfs attribute to select the components they
  want to interface -- the layout can be determined as well from the
  order. For example:

  # echo "C0 C3 C2" > /sys/bus/counter/devices/counter0/chrdev_format

  This would select Counts 0, 3, and 2 (in that order) to be available
  in the /dev/counter0 node as a contiguous memory region.

  You can select extensions in a similar fashion:

  # echo "C4E2 S1E0" > /sys/bus/counter/devices/counter0/chrdev_format

  This would select extension 2 from Count 4, and extension 0 from
  Signal 1.

* Users may read from this chrdev_format sysfs attribute in order to see
  the currently configured format of the character device.

* Users may perform read/write operations on the /dev/counterX node
  directly; the layout of the data is what they user has configured via
  the chrdev_format sysfs attribute. For example:

  # echo "C0 C1 S0 S1" > /sys/bus/counter/devices/counter0/chrdev_format

  Yields the following /dev/counter0 memory layout:

  +-----------------+------------------+----------+----------+
  | Byte 0 - Byte 7 | Byte 8 - Byte 15 | Byte 16  | Byte 17  |
  +-----------------+------------------+----------+----------+
  | Count 0         | Count 1          | Signal 0 | Signal 2 |
  +-----------------+------------------+----------+----------+

* Users may perform select/poll operations on the /dev/counterX node.
  Users can be notified if data is available or events have occurred.

The benefit of this design is that the format is robust so users can
choose the components they want to interface and in the layout they
want. For example, if I am writing a userspace application to control a
dual-axis positioning table, I can select the two counts I care about
for the position axes. This allows me to read just those two values
directly from /dev/counterX with a simple read() call, without having to
fumble around seeking to an offset and parsing the layout.

Similarly, support for future extensions is simple to implement. When
timestamp support is implemented, users can just select the desired
timestamp extension and read it directly from the /dev/counterX node;
they should also be able to perform a select()/poll() call to be
notified on new timestamps.

So what do you think of this sort of design? I think there is a useful
robustness to the simplicity of performing a single read/write call on
/dev/counterX.

> >=20
> >    Moving this selection to a sysfs attribute and dedicating the
> >    character device to just data transfer might be a better design. If
> >    such a design is chosen, should the selection attribute be
> >    human-readable or binary?
>=20
> Sysfs basically requires things are more or less human readable.
> So if you go that way I think it needs to be.
>=20
> >=20
> > 2. How much space should allotted for strings?
> >=20
> >    Each Counter component and extension has a respective size allotted
> >    for its data (u8 data is allotted 1 byte, u64 data is allotted 8
> >    bytes, etc.); I have arbitrarily chosen to allot 64 bytes for
> >    strings. Is this an apt size, or should string data be allotted more
> >    or less space?
>=20
> I'd go with that being big enough, but try to keep the expose interface
> such that the size can change it it needs to the in the future.

Following along with the separation of control vs data as discussed
above, we could support a more variable size by exposing it through a
sysfs attribute (maybe a chrdev_string_size attribute or similar).

>=20
> >=20
> > 3. Should the owning component of an extension be handled by the device
> >    driver or Counter subsystem?
> >=20
> >    The Counter subsystem figures out the owner (enum counter_owner_type)
> >    for each component/extension in the counter-sysfs and counter-chrdev
> >    code. When a callback must be executed, there are various switch
> >    statements throughout the code to check whether the respective
> >    Device, Signal, or Count version of the callback should be executed;
> >    similarly, the appropriate owner type must match for the struct
> >    counter_data macros such as COUNTER_DATA_DEVICE_U64,
> >    COUNTER_DATA_SIGNAL_U64, COUNTER_DATA_COUNT_U64, etc.
> >=20
> >    All this complexity in the Counter subsystem code can be eliminated
> >    if a single callback type with a `void *owner` parameter is defined
> >    for use with all three owner types (Device, Signal, and Count). The
> >    device driver would then be responsible for casting the callback
> >    argument to the appropriate owner type; but in theory, this should
> >    not be much of a problem since the device driver is responsible for
> >    assigning the callbacks to the owning component anyway.
>=20
> Whilst its more complex for subsytem I think it's better to keep everythi=
ng
> typed if we possibly can.  Always a trade off though, so use your discret=
ion.
>=20
> Jonathan

I'm going to keep it all typed for now since I don't want to make too
many changes at once. Since this is somewhat unrelated to the purpose of
introducing Counter character devices, I'll postpone the discussion to a
later date after the Counter character device interface is merged.

William Breathitt Gray

>=20
>=20
> >=20
> > William Breathitt Gray (4):
> >   counter: Internalize sysfs interface code
> >   docs: counter: Update to reflect sysfs internalization
> >   counter: Add character device interface
> >   docs: counter: Document character device interface
> >=20
> >  Documentation/driver-api/generic-counter.rst |  275 +++-
> >  MAINTAINERS                                  |    3 +-
> >  drivers/counter/104-quad-8.c                 |  547 +++----
> >  drivers/counter/Makefile                     |    1 +
> >  drivers/counter/counter-chrdev.c             |  656 ++++++++
> >  drivers/counter/counter-chrdev.h             |   16 +
> >  drivers/counter/counter-core.c               |  187 +++
> >  drivers/counter/counter-sysfs.c              |  881 +++++++++++
> >  drivers/counter/counter-sysfs.h              |   14 +
> >  drivers/counter/counter.c                    | 1496 ------------------
> >  drivers/counter/ftm-quaddec.c                |   89 +-
> >  drivers/counter/stm32-lptimer-cnt.c          |  161 +-
> >  drivers/counter/stm32-timer-cnt.c            |  139 +-
> >  drivers/counter/ti-eqep.c                    |  211 +--
> >  include/linux/counter.h                      |  626 ++++----
> >  include/linux/counter_enum.h                 |   45 -
> >  include/uapi/linux/counter-types.h           |   45 +
> >  17 files changed, 2826 insertions(+), 2566 deletions(-)
> >  create mode 100644 drivers/counter/counter-chrdev.c
> >  create mode 100644 drivers/counter/counter-chrdev.h
> >  create mode 100644 drivers/counter/counter-core.c
> >  create mode 100644 drivers/counter/counter-sysfs.c
> >  create mode 100644 drivers/counter/counter-sysfs.h
> >  delete mode 100644 drivers/counter/counter.c
> >  delete mode 100644 include/linux/counter_enum.h
> >  create mode 100644 include/uapi/linux/counter-types.h
> >=20
>=20

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl7KtNYACgkQhvpINdm7
VJL6uBAApyDsjTpq8KEtfp560Oeh/amS86UJ/m5tlErp6h4IqSqon8w297PHw+Lp
xOLagQqWRUHemDtlX/P8RkMjN4NR/wrMJ/m04qBHNKSrtlMHUxEvEKajt9AuPVQj
DBv3ZkJOMBXGFEvirzkKBpZANZ8zw1+9M1hg3Nf2NJX3IIQVtrO+NgS/6fHS9yAt
af9+IWXw0XkOVyThaDErjPEEihvKJhqIVjCObR4MtlnmRdwncVv5qbZDa4vMbQXc
2rCkKi23rc6lJ4zyLz+mwnoaPMmzqGg8/+TmUmCjUeh7V/nPbQAf+g4zgJzX3OJg
VH57Yt20bherWjVEOEjU/VhUleeg+RwB8sjMgU34c8bfDfoHCeO2108Wdza4WwO1
8p5DPYoeDiiY3FPzUwcA6Q3Mfj2dLFsUW9dVi+uwqT9FnWU9lg4M8dURZcGWF3TW
nnaprfVIeztWX3vuP3BCFSu8tdb8E8GsqA1g7nVlnx6NpHjM5BqjXxYIhlH+OaFs
FxdyUTwUbzVqWd2EHcYqh44TllbiQwcjhVvmGAgbdOU4DwHLVfBLMovwMHBvGtJm
k/SNtd23WGN++xjGePPM/1ASJ50iTQRV3czgErJ23AOPMdxuaAtKicGj2e3R+F/Q
64CRnMw5WpDBwRXXfzAwhPzR8N7zaue/Spceae/2IWxlYemyzMQ=
=LR3r
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

--===============1605239013709408890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1605239013709408890==--
