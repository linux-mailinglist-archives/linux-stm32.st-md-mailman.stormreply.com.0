Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D279328E6E1
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 21:05:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9590AC424AF;
	Wed, 14 Oct 2020 19:05:44 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43A50C32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 19:05:42 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id i22so379471qkn.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 12:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6wjqxwtbzgIHiDQg99WolaTB10lGIX9ridUr1LerSto=;
 b=C4cJ+6ikED4y7sddfCSWORNVTWuC5T2E3whaMK6+cusw1l8WOeKtareV0Byt1OQtyk
 z2Gb2+3ge3KpfVTMHbAiiPsAR2O1n9HsO1EZ9tlgCaQf4HXgwLoDnWK9vNrkBQA5MGlO
 /4JFHF7Prlrc1a3zs26OMnayCe7V6fG1ZMh3uxT2JZfiwhmeR9sSpP1ZiCRkHkhUF9Ug
 ldlxUnytAhsdqz5mHhxIRRHa/+lGCRUNX6bOTeRAW+scdQdLyf1nSMDRFwFXjjnkRmLS
 tANYv3DYEOm07stB54QrMNQ60nzuKDFeeU7evQOo5HlH2c1ietMjAmNmbT4hLpSgTE+1
 7Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6wjqxwtbzgIHiDQg99WolaTB10lGIX9ridUr1LerSto=;
 b=DIEVsn9X7ePiTflJBt5DGPpBie0LeINdtaj9qUjUu59Q+tvUMTuDe0Cr7phupMZBob
 0LjXyrK6CkShMuVOnqcdbEHYSG1YUHTAt+y48MrU9/78S4HnBPI3vgHSXj71sBjwYuLJ
 3PBvvhmpnJdY7qk1zn0rJX82BqR56IiDc4JsvXpW+UyM82hnfuoLMUcZ+i8BA8tdVzFO
 18yHDLmfdwRnyGb/hg5Ry7fbpPYYgOcc8mBgTE40djriHiqR7Cz0SxqCisUFp53YXIfI
 k9y2wDnmMU+BTiJCZmCGesRR/1OiLeClMu44++f8NXscrB9kdV6eXCISkNRDBbiJ/YKg
 iXcg==
X-Gm-Message-State: AOAM532s7ITnARH6V5yo2ZOoA0y6FyObDMsLUVdfI6AzTexRSaWuSVO9
 sEEvvhthWDoVIEhoW+EHmu8=
X-Google-Smtp-Source: ABdhPJxtNMA2dHYbfdwX/cS1+k4VNViVtwLuSPBAgvxVBiNRGxKjZbeYrm37jqFJYa3DXkpMUa+hDw==
X-Received: by 2002:a05:620a:152:: with SMTP id
 e18mr465193qkn.365.1602702341697; 
 Wed, 14 Oct 2020 12:05:41 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id u4sm238508qkh.106.2020.10.14.12.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 12:05:40 -0700 (PDT)
Date: Wed, 14 Oct 2020 15:05:26 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201014190526.GA13439@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <00be1fccc672c5207f3b04fe4cc09c29e22641f4.1601170670.git.vilhelm.gray@gmail.com>
 <67a0290e-731b-822a-5113-30b56bde6c88@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <67a0290e-731b-822a-5113-30b56bde6c88@lechnology.com>
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
Content-Type: multipart/mixed; boundary="===============0931250726810810282=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0931250726810810282==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 12:43:08PM -0500, David Lechner wrote:
> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> > diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter=
-chrdev.c
> > new file mode 100644
> > index 000000000000..2be3846e4105
> > --- /dev/null
> > +++ b/drivers/counter/counter-chrdev.c
>=20
>=20
> > +/**
> > + * counter_push_event - queue event for userspace reading
> > + * @counter:	pointer to Counter structure
> > + * @event:	triggered event
> > + * @channel:	event channel
> > + *
> > + * Note: If no one is watching for the respective event, it is silently
> > + * discarded.
> > + *
> > + * RETURNS:
> > + * 0 on success, negative error number on failure.
> > + */
> > +int counter_push_event(struct counter_device *const counter, const u8 =
event,
> > +		       const u8 channel)
> > +{
> > +	struct counter_event ev =3D {0};
> > +	unsigned int copied =3D 0;
> > +	unsigned long flags;
> > +	struct counter_event_node *event_node;
> > +	struct counter_comp_node *comp_node;
> > +	int err;
> > +
> > +	ev.timestamp =3D ktime_get_ns();
> > +	ev.watch.event =3D event;
> > +	ev.watch.channel =3D channel;
> > +
> > +	raw_spin_lock_irqsave(&counter->events_lock, flags);
> > +
> > +	/* Search for event in the list */
> > +	list_for_each_entry(event_node, &counter->events_list, l)
> > +		if (event_node->event =3D=3D event &&
> > +		    event_node->channel =3D=3D channel)
> > +			break;
> > +
> > +	/* If event is not in the list */
> > +	if (&event_node->l =3D=3D &counter->events_list)
> > +		goto exit_early;
> > +
> > +	/* Read and queue relevant comp for userspace */
> > +	list_for_each_entry(comp_node, &event_node->comp_list, l) {
> > +		err =3D counter_get_data(counter, comp_node, &ev.value_u8);
>=20
> Currently all counter devices are memory mapped devices so calling
> counter_get_data() here with interrupts disabled is probably OK, but
> if any counter drivers are added that use I2C/SPI/etc. that will take
> a long time to read, it would cause problems leaving interrupts
> disabled here.
>=20
> Brainstorming: Would it make sense to separate the event from the
> component value being read? As I mentioned in one of my previous
> reviews, I think there are some cases where we would just want to
> know when an event happened and not read any additional data anyway.
> In the case of a slow communication bus, this would also let us
> queue the event in the kfifo and notify poll right away and then
> defer the reads in a workqueue for later.

I don't see any problems with reporting just an event without any
component value attached (e.g. userspace could handle the component
reads via sysfs at a later point). We would just need a way to inform
userspace that the struct counter_component in the struct counter_watch
returned should be ignored.

Perhaps we can add an additional member to struct counter_watch
indicating whether it's an empty watch; or alternatively, add a new
component scope define to differentiate between an actual component and
an empty one (e.g. COUNTER_SCOPE_EVENT). What do you think?

William Breathitt Gray

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+HS+wACgkQhvpINdm7
VJLA6w/8C/7Kk5FVs4czCH9uMX3PWTVzLg32XilvtRndujXVCml9iLMADLvFVyIA
dEX7rmXz/bWYSzG99VkZyHCWCeQX8+roYFDhmqbD8hQyEkqQlhHFWGdAPqGPAYeH
cesBwsFdkB3yoc28HahJfV6c3HtuO3pLtsu7qKORwbhOupqzz6BBg/imzx04+8hh
LicqVk0uFKT/v5E9o5AfOV+9cbHgZWm+TusLYTwKZCrvDVmrWkxdppPC581ftd9Q
mrW/2qfj3ltcO4VoJ6JVZpKjcXJSak8V0l+A7dV2Hbp8dBGEhC+iODBfhhAUxTz5
NM/cw+L90slS7Yli2mf1aY4lYLNv+Ob17alTK4P1Gc1ekJ9yofNevJlb8xp55KxC
jY8rUWxEkS1y1h8K7wrPzwhMwk6Ab4psdUB+9+DClArQI5ZnimG1nJlSph9p1C24
VjR6Vi8qSyUlSKrr5vK1ac1s/EDoAxwJoMr+e3rbRqrz3kktAvSN0S0sPD+xoV87
iPjdASJa3YvBkS4v2o34XoNQnsVpdzUW3emUQ56qLf2yWVqbP8PkG5xhBRtfHvtI
3VRYrSJ2dgv1u2xvrFhFhr2g7DRA9XMDOgc/aiqRnD18MHWT57GBLakOIZAYG9g3
qbtBe6fEcVlUumDSKscRfWe6bsFhldy3v5FCMiY2JGZh689pwPM=
=EhIu
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============0931250726810810282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0931250726810810282==--
