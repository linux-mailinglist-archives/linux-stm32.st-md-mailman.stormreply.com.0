Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F50202C81
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2020 21:54:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6875C36B0C;
	Sun, 21 Jun 2020 19:54:06 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6D18C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2020 19:54:03 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x62so7827335qtd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2020 12:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zCFSA8R6Mu2tBej0AZQDGdVlC3nnom3RSF27/2f2JVI=;
 b=QijiS3zdJInlFU5TaBWKHg5ziGqcLjzAPNnFJz5G+PZeKkliwgv4UYZi7joN378q8k
 2B7fb24f9e2KPWgE5wICkdORER+as77nbKu5HEA8h4n/PRU+d59T7n/nfrisiGFAjTjC
 BBi33GbY4vRR5XyF1mCwZnMfhfyJtquLqWQE44uAQyp4xRpi8cvxDWk1SS4fUV3EU5Jl
 6ydhz+ikJmN6iyoFx2/zvqX5p0MSK7DzKd0EtdFvKTziJeBERvhSJjkwLs2EZI5MbRJF
 ljZNj2IwEtgeXwpMNslcrisrVF/IUmHXzmPgi5sPVZ7iQVU4tOOIIFOdvQKvPr8nhtvH
 G8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zCFSA8R6Mu2tBej0AZQDGdVlC3nnom3RSF27/2f2JVI=;
 b=OnfT8ixnf2ZRVDSkk6rZQdACvbjvfb4v04YeXzf4309R3xN3dyrtlKDohXJnS6uDNx
 Hwez9X7eJG7nRfUzDfVKdBoqAY3SA4uLSmOVIoWyEMRj+RhRvC5H2iUYOGeWdlrIg+DI
 bxLufYF8Ftb3JlIpkg7wa65UmXjuieCnALLdC2c6GeuNZFsNEsfTneuznnmFPD+YdGZJ
 SBwy5PkhPr6L8Gav4wEKOyFxedI3JGUr1jjc2XT9v8ZDjGDgMI5UdzsxJxujpUeA9QrO
 pZBSDbjGVZWXM1euXOO3K86iZx5uieL6XFZdQkX9nE/4DZzzqpR5+tYimkw+XY+cnx4K
 Mr3w==
X-Gm-Message-State: AOAM533T6GZEwBFL5HA3vUUv2fKCFjqcuuprF6R1Lt/JG9lEGNlNht/N
 YAZeO0y8gMkMyId9VNKKw8Y=
X-Google-Smtp-Source: ABdhPJz5NVAQ/KmIdk9corCWpRAmzwMEaXLV0LavY2pJYYtKR6Y2avrojLjlSCatmYIaqHlod68QEg==
X-Received: by 2002:ac8:3129:: with SMTP id g38mr5956438qtb.92.1592769241703; 
 Sun, 21 Jun 2020 12:54:01 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id a1sm11535151qkn.87.2020.06.21.12.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 12:54:00 -0700 (PDT)
Date: Sun, 21 Jun 2020 15:53:47 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20200621195347.GA59797@shinobu>
References: <cover.1592341702.git.vilhelm.gray@gmail.com>
 <afe40ef2e24ecaca44fc229f7983cf4cde3374a8.1592341702.git.vilhelm.gray@gmail.com>
 <8fae0659-56df-c0b5-7c0d-220feefed2b4@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <8fae0659-56df-c0b5-7c0d-220feefed2b4@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/4] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============7061246024341615274=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7061246024341615274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2020 at 01:50:59PM -0500, David Lechner wrote:
> On 6/16/20 8:40 PM, William Breathitt Gray wrote:
> > This patch introduces a character device interface for the Counter
> > subsystem. Device control is exposed through standard character device
> > read and write operations.
> >=20
> > A /sys/bus/counter/devices/counterX/chrdev_format sysfs attribute is
> > introduced to expose the character device data format:
> >=20
> > * Users may write to this sysfs attribute to select the components they
> >    want to interface -- the layout can be determined as well from the
> >    order. For example:
> >=20
> >    # echo "C0 C3 C2" > /sys/bus/counter/devices/counter0/chrdev_format
> >=20
> >    This would select Counts 0, 3, and 2 (in that order) to be available
> >    in the /dev/counter0 node as a contiguous memory region.
> >=20
> >    You can select extensions in a similar fashion:
> >=20
> >    # echo "C4E2 S1E0" > /sys/bus/counter/devices/counter0/chrdev_format
> >=20
> >    This would select extension 2 from Count 4, and extension 0 from
> >    Signal 1.
> >=20
> > * Users may read from this chrdev_format sysfs attribute in order to see
> >    the currently configured format of the character device.
> >=20
> > * Users may perform read/write operations on the /dev/counterX node
> >    directly; the layout of the data is what they user has configured via
> >    the chrdev_format sysfs attribute. For example:
> >=20
> >    # echo "C0 C1 S0 S1" > /sys/bus/counter/devices/counter0/chrdev_form=
at
> >=20
> >    Yields the following /dev/counter0 memory layout:
> >=20
> >    +-----------------+------------------+----------+----------+
> >    | Byte 0 - Byte 7 | Byte 8 - Byte 15 | Byte 16  | Byte 17  |
> >    +-----------------+------------------+----------+----------+
> >    | Count 0         | Count 1          | Signal 0 | Signal 2 |
> >    +-----------------+------------------+----------+----------+
> >=20
> >    The number of bytes allotted for each component or extension is
> >    determined by its respective data type: u8 will have 1 byte allotted,
> >    u64 will have 8 bytes allotted, etc.
> >=20
>=20
> Instead of the proposed character device, I would really rather have one
> that gives past events instead of the current state.
>=20
> I have thought about some of the suggestions from previous version of
> this patch series and I'm starting to think something similar to the
> input and gpio subsystems would work fairly well.
>=20
>=20
> There would have to be a fixed size event data structure:
>=20
> struct counter_event {
> 	/** Best approximation of when event occurred in nanoseconds. */
> 	__u64 timestamp;
> 	/**
> 	 * Description of the synapse that triggered the event and the
> 	 * signal/counter that the value represents.
> 	 */
> 	__u64 descriptor;
> 	/** The signal/counter value recorded when the synapse fired. */
> 	__u64 value;
> };
>=20
> The descriptor field would actually probably be a union of __u64 and a
> struct with its own fields to describe the synapse and signal or count.
>=20
> If a synapse involves more than one signal or count, then there would
> be multiple events with identical timestamps.
>=20
> Userspace programs should be able to enable only the events/synapses they
> are interested in and then the poll() the character device to wait for
> events in an efficient way instead of having to constantly read - which
> could still miss events.
>=20
> ---
>=20
> Real world use case - measuring the speed of a motor:
>=20
> At low speeds it is more accurate to measure the time difference between
> count events. In this case we would want events from two synapses. One
> triggered by the rising and falling edges of signal A and one triggered
> by the direction signal. The magnitude of the speed is calculated by
> taking the difference in timestamps between signal A events and the +/-
> sign is determined by the direction signal.
>=20
> At high speeds a different configuration is needed. Assuming the counter
> has a timer clock signal a synapse would be configured to fire every 10
> or 20 milliseconds. This would trigger an event that contains the count.
> The speed is calculated as the difference in counts divided by the fixed
> time interval.
>=20
> Some applications may need to do both and be able to change the
> configuration at runtime. It may start out in the low speed configuration,
> but as the speed increases, events triggered by the change in count will
> need to be disabled to prevent being overwhelmed with too many count
> events. But if the speed drops low again, the count events will need to
> be turned back on.
>=20
> ---
>=20
> Regarding the implementation, the character device can be backed by a
> kfifo. Interrupts from the counter hardware push events to the kfifo
> and reading from the character device drains the kfifo.
>=20
> drivers/gpio/gpiolib.c could be a good example to follow.
>=20
> If we only want to allow one consumer to open the chardev at a time,
> then enabling/disabling events via sysfs would probably be fine since
> we are already sort of doing that anyway to enable/disable counters.
> But if we need to allow multiple consumers per chardev that would each
> want different events, then configuring via ioctl would be required so
> that per-file descriptor configuration could be done (each call to open()
> would create a new kfifo and ioctl would configure what gets pushed to
> that kfifo).

Perhaps structuring the interface around events would be a good approach
afterall. The way I see it is that we have two types of use cases to
support: those that are sensitive to latency and those that are not. Use
cases where latency is not a concern can simply use the existing sysfs
interface, so really all we care about in this discussion are the
latency-sensitive use cases.

If a user cares about latency, I think it's because their use case
involves some sort of realtime deadline. In this kind of situation, I
suspect they will not simply be checking the current count in a loop,
but rather design their system around interrupts from the counter device
to notify their application when some deadline or condition has been
met.

Because a latency-conscious user would be waiting on events, the Counter
character device interface should be structured around configuring and
receiving events with respective data. The user should be able to choose
which events they want to receive, as well as the particular data they
want when that event occurs.

Synapses simply indicate a change in a Count value; every signal Count
value change is not necessarily interesting, so Counter events would
likely be defined separately from Synapses. Regardless, users would need
the ability to choose the particular data they want associated with a
particular event.

For example, in the dual-axes positioning table scenario, a user
application would likely want to know the exact X and Y position at the
time of a given event -- that means an event should provide two Count
values (and possibly associated device flags) when it occurs. I'm not
sure yet how the struct counter_event should be defined in order to
support this; we will need to indicate the format of data as well as
provide the data itself. Perhaps, we can handle this by providing an
unique id field so that only a single datum (e.g. a single count value)
is provided via the value field, but subsequent struct counter_event
items share the same id so that the user knows that a particular datum
is part of a larger group of data for a specific event.

William Breathitt Gray

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl7vusEACgkQhvpINdm7
VJILCA//S2v9xXSyuHz8nVfrFq3H21sB14cd4j2TGPIpgILyiScLm0YNrNnhZlj+
aB6vFDpz5hd/cI/o6s+RPrCANATj9N5YJ+YXdwyojne2I5ByBntOsAAnalem3LdN
wkc6qW9CE1zpNz0oQhh58HDBkRGlMWf/nu8u+KdJkbky0ud2h633yZInbCxzK5/v
ksJrJCZ5gTB1RPWKbk9axW1nmicRq3i37yUk5sNKpCp2kUGCySshDkZmB1A2xcm/
G7rRdwc8iBdtY324dguPp9vqiGVMlGich0MFgh7/eyc7RHIx7wSF3pJDtGfZN/Iw
Pytg4hj6SOU+M8yBOmHei2vTkTVHL1Ao/WmkLrhd5M/ZHqQxM3sDdauzIBgBhQFd
KC48d4D/3wU2FgfClw3TKYTrp73HBCfb5urr/UvYTqLWd6hWzRR5qLhA6yWbVIsA
MNGMAx+9nNDb45mK6l6WTINkho2rxucUnnhXew4vai3eTUhyxSsFDHOzyEQXzgAn
pTJbrFqXl4UnSAZmUaUSgtlhSPqRlTqvA5S6PWoUJ+yCYzYxcf0H61KYoPF841PM
j7iShjUCgQpURDm+8Bm2Iky9PEwg5Taak7zZl/X1NUgwVDyecrB8gBTged9bUqqC
5yq5uZsCaetfOvpN8/0uBqGOKi3ZOgHVCmJcU5c5PB8KhnaOQ2A=
=g++y
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--

--===============7061246024341615274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7061246024341615274==--
