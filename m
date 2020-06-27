Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A558720C373
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jun 2020 20:18:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AA9AC36B0D;
	Sat, 27 Jun 2020 18:18:07 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36EBDC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jun 2020 18:18:05 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id el4so1860374qvb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jun 2020 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZfS1zQEXxVr5pDKOKLlkhLbHYnS+buWmBwUy/Xrx/Oc=;
 b=qu6vSC1jPfgHL/kV3nJFd5+olf7eZKNmjbYU0fJa1IPH8AxS/ZUX/2wraYWI9Kb2ms
 9Z4+5PDUboqbXOUl4wIJFt2wIEw0lAKftDi58QttIO7NhJb9VvpG36vh2DpAb17mLCen
 oSWct2KXoEYkp7FODSeUDpNfg42A01s37GDHJmkCPyXHnVVCM4ftSqFala09wf1llGrG
 1sglbZr7hbHa4jayiLzxcCan3DdTmZdBUbI3knR3Xs4AmJg+x4qR9KNQqqnEiV7+cK89
 b0IRVHbDtZ0mGk0OfGYi4VS/kvdp15b+dsGQDVdbKd9MO3aqZt9d0GQk58BLaeG5oMNX
 H0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZfS1zQEXxVr5pDKOKLlkhLbHYnS+buWmBwUy/Xrx/Oc=;
 b=DwXD0/0ttW7ai9m4ac8ctHtYnMeSCislrc1mK/GzjEKvX+AzdNgdXEtiEpWbx1V7V3
 yJp86XAIAPUEmylpqwCG24U3c3vhtoDcOqTB9MigGExgtmom5eczAccRQHtS8ehT5PHL
 WjYAqEbrznIl2yznJSCvW86CcVAPCFcsgHHAWMkP7bVioSJdVc+zo7rCnN1OyTmSdrqX
 Vl+ToA4qbIreKqSRXqvdRRshqcJxVvIP0ZZTSxUVw8486nKWsimBk1fwlO4MdKVi/Q/O
 yQoQlV8L46FTVOXtBs3ydurqNxAvWOoGNNSZSM+YjcO6MSxx1A/S+z4ROLedUzQNpn3Y
 eo6A==
X-Gm-Message-State: AOAM533ha+flpGmHhbd8CcstjbI/oCURBG8OM//FMzuQedOr3MkkNacK
 2mZj+BoYmJKmY1NmuyWf9bE=
X-Google-Smtp-Source: ABdhPJx01oRpIQIb8KuN+kaIF5K7gUAF7wqHvbJFPlNJV6vCemc2pGIggoC1p7UfEgH0kZZlDSFKkg==
X-Received: by 2002:ad4:57b2:: with SMTP id g18mr8452730qvx.207.1593281883789; 
 Sat, 27 Jun 2020 11:18:03 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id q47sm13053073qta.16.2020.06.27.11.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jun 2020 11:18:02 -0700 (PDT)
Date: Sat, 27 Jun 2020 14:17:48 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20200627181748.GA8254@shinobu>
References: <cover.1592341702.git.vilhelm.gray@gmail.com>
 <afe40ef2e24ecaca44fc229f7983cf4cde3374a8.1592341702.git.vilhelm.gray@gmail.com>
 <8fae0659-56df-c0b5-7c0d-220feefed2b4@lechnology.com>
 <20200621195347.GA59797@shinobu>
 <47ad15e7-05ce-d463-b6af-406365b3c3b4@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <47ad15e7-05ce-d463-b6af-406365b3c3b4@lechnology.com>
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
Content-Type: multipart/mixed; boundary="===============7944466510865503696=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7944466510865503696==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 09:08:48AM -0500, David Lechner wrote:
> On 6/21/20 2:53 PM, William Breathitt Gray wrote:
> > For example, in the dual-axes positioning table scenario, a user
> > application would likely want to know the exact X and Y position at the
> > time of a given event -- that means an event should provide two Count
> > values (and possibly associated device flags) when it occurs. I'm not
> > sure yet how the struct counter_event should be defined in order to
> > support this; we will need to indicate the format of data as well as
> > provide the data itself. Perhaps, we can handle this by providing an
> > unique id field so that only a single datum (e.g. a single count value)
> > is provided via the value field, but subsequent struct counter_event
> > items share the same id so that the user knows that a particular datum
> > is part of a larger group of data for a specific event.
>=20
> The timestamp could act as the "id" to correlate multiple values of a
> single event.

Okay, I see how that can work. So the /dev/counterX character nodes
would return a stream of data structures that look something like this:

struct counter_event {
	/**
	 * Best approximation of when event occurred in nanoseconds.
	 * Same timestamp value indicates data is part of same event.
	 */
	struct timeval time;
	/**
	 * Type of event that triggered. This would correlate with the
	 * IRQ set up for the device.
	 */
	__u16 type;
	/**
	 * Type of data represented by the value member. This enables
	 * the user to extract the right datatype from the value field.
	 */
	__u16 code;
	/** The value recorded when the event fired. */
	__u64 value;
};

In fact, this data structure looks a lot like struct input_event; would
it make sense to use that for this? I suppose we can't because we need
to support 64-bit value for our use cases.

Userspace also requires a way to enable the events and configure them to
report the data it wants. So perhaps the following sysfs attributes
would accomplish such:

* /sys/bus/devices/counterX/eventY_enable:
  Users can enable/disable event Y.
* /sys/bus/devices/counterX/eventY_config:
  Data to get when event Y is triggered (e.g. Counts, extensions, etc.).

Here's another concern for latency-sensitive applications: should we
handle writing data to the devices? While we have real-life examples of
latency-sensitive read operations, I'm not sure if a user will ever need
to write to a counter device within some realtime critical deadline --
I think write operations are primarily done for the purpose of
configuring the device for operation rather than during it. So perhaps
we don't need to worry about this use case because users can write data
via the existing sysfs interface.

William Breathitt Gray

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl73jUQACgkQhvpINdm7
VJI+5Q/9F+iiZdKk+/Rbp7+DBs4MIahPcIfm80GiTAS9+CB5A6gewetdkCiG9NtJ
kFdOjw9wRUSdB+ah+o0t0zGLC1v4q069zwrbns6giE6KsbMHItihk/pEZ1A8mel2
+Mo56yo+7n5EkkQkmnYZLRwTm0P+bRpSHGN4p0JrTaiGfsZQYnZuJuyYDwFV3EoJ
QQQwlx+OmvpNXISugKy/t/BRJzcjWNKIIuxQC3ejk1y0LUqEkU5yh8g3z3foktWw
2vQJJtTVBQNpMncSbjCysK51oF9QE3W6merHqj8nzeMKBW336cqzySFD3pOagPe8
AolVMd7YnUQ1uylD5t1/ysYPiihGkvWNO+YED2JuU12Y8oldYjI7ELpjSNUBzvie
FeHu8v7w4fcQ1SY0xm1Y5XWdKJx0WOPjfqxmcSN2t9zb1Cc4Z4/7bpM4CvErusjR
PQEukMibjwj/T5BsfdutwhIX5GHT5SVYVUKoLhe0gI4n+y3lxn4jfS638lnDBhGg
NPwhHUVksRHEh/RXyleNz2Mopt/f3cUg48O1vQA8tLcZ7nxTU1GKDOvaZ8AevVa3
H+K8URgeKInEyhkt0px9H2x83aqEk921Czcxm15qE7RY4bfIU86lZEITRE4INnmy
Qd3Nf8tIjV6Pk5F7ZKjiFAUbhrcdFsCiXM5doYGkKcfLrZuVh1I=
=sQ+8
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============7944466510865503696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7944466510865503696==--
