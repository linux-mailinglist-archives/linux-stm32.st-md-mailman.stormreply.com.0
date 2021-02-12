Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2483199F0
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 07:32:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 981BEC57B5A;
	Fri, 12 Feb 2021 06:32:25 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8DE2C5718A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Feb 2021 06:32:23 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c5so6065074qth.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 22:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YpdyqTTIfUaE/xKGvquExFqY3IIyGF7XvCEZZkDqm0w=;
 b=PEH3n7H2JHE0OeIyomMC7MNrnsAxMbGOwkycCmXW/v3qNAp3iTb4TfnNqEoN8jyLWr
 mfJ8wNJQ4B9+ZCZToBFIQdiCoKaxFPboLOXn98qaa9v7HnkLNBMpPitjD2CrgPyStlID
 sQsB9255hKAk/1JqRwZ3x1c7qQdG42kykUjQydNQrYVByw+IH0ApseMNrUG/7kGyTKsj
 BfkvbnEJg2GAbj6dOU/2uQk94Fz9HbA+Bzl0VvFlE2NXsuyikuHMkP7harjuy/CT3sxi
 zpr7WqIFGxCdDj25y73SLgIC/Lt/JJPogNXF4N2K5Ntv+8pxh88/fGwXWX9GJxX+emy/
 j6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YpdyqTTIfUaE/xKGvquExFqY3IIyGF7XvCEZZkDqm0w=;
 b=rpVQX46slpopQhFXxPGdMIEmLrGO98J+6+g7W5JZjXz6+Fsgl5nYnWIO7apHuVpW+8
 CzTNOuc21raNqHhUs6i3Da/2iTm9ijx9UyMjOXsQoa/EItsHtcie+nqIBUMAHHg5ndpG
 N+iHEcOunbt/h2HG5JZVnEt6wi1ksn1GXdVj4LleIcy6/eTEXbTJfDB1wJj6oLrRZSdr
 jrhXJN00fR0sE95IRdmB+9aZ4G0THVcuwon9n9xRO5sMyN3Qkp9dwYLFOz7cguMvxFZE
 Miubm4bRBGcBaVnRQQtK/kTfiBZzm9u/E2maU5jpxFVgkcom9isYbfG14Tk3Bn9Ru4hW
 GtAQ==
X-Gm-Message-State: AOAM530Xirhl1xwcUBDAdEHGYx/VW960n5BZY+0Z7+gsXySQxpoM/pHe
 aaBiYZ/XUndtSbterndFmyk=
X-Google-Smtp-Source: ABdhPJykoum8SlFYEq4qIDiUVmjCNungJ8LPedsQkCkS86BCab+ez01mnwN1qgig72D9vAhu2LiZVQ==
X-Received: by 2002:ac8:1494:: with SMTP id l20mr1260768qtj.151.1613111542162; 
 Thu, 11 Feb 2021 22:32:22 -0800 (PST)
Received: from shinobu ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id v30sm5016239qte.26.2021.02.11.22.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 22:32:21 -0800 (PST)
Date: Fri, 12 Feb 2021 15:32:12 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YCYg7Eiu4u1t9VxE@shinobu>
References: <cover.1608935587.git.vilhelm.gray@gmail.com>
 <57bc509273bf288d74835e6ebdaebf27b4991888.1608935587.git.vilhelm.gray@gmail.com>
 <20201230150440.0723cab9@archlinux>
MIME-Version: 1.0
In-Reply-To: <20201230150440.0723cab9@archlinux>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v7 3/5] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============5132850980905182458=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5132850980905182458==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmunDh9PKWC61MXK"
Content-Disposition: inline


--nmunDh9PKWC61MXK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 03:04:40PM +0000, Jonathan Cameron wrote:
> On Fri, 25 Dec 2020 19:15:36 -0500
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > This patch introduces a character device interface for the Counter
> > subsystem. Device data is exposed through standard character device read
> > operations. Device data is gathered when a Counter event is pushed by
> > the respective Counter device driver. Configuration is handled via ioctl
> > operations on the respective Counter character device node.
> >=20
> > Cc: David Lechner <david@lechnology.com>
> > Cc: Gwendal Grignou <gwendal@chromium.org>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>=20
> There are a few things in here that could profitably be pulled out as pre=
cursor
> patches.  I don't really understand the connection of extension_name to t=
he
> addition of a chardev for example.  Might be needed to provide enough
> info to actually use the chardev, but does it have meaning without that?
> Either way, definitely feels like it can be done in a separate patch.

The extension_name attributes are needed so chrdev users have enough
info to identify which extension number corresponds to which extension.
I'll move this to change to a separate patch and provide an appropriate
explanation there to make things clearer.

> > +static long counter_chrdev_ioctl(struct file *filp, unsigned int cmd,
> > +				 unsigned long arg)
> > +{
> > +	struct counter_device *const counter =3D filp->private_data;
> > +	unsigned long flags;
> > +	int err =3D 0;
> > +
> > +	switch (cmd) {
> > +	case COUNTER_CLEAR_WATCHES_IOCTL:
> > +		return counter_clear_watches(counter);
> > +	case COUNTER_ADD_WATCH_IOCTL:
> > +		return counter_add_watch(counter, arg);
> > +	case COUNTER_LOAD_WATCHES_IOCTL:
> > +		raw_spin_lock_irqsave(&counter->events_list_lock, flags);
> > +
> > +		counter_events_list_free(&counter->events_list);
> > +		list_replace_init(&counter->next_events_list,
> > +				  &counter->events_list);
> > +
> > +		if (counter->ops->events_configure)
> > +			err =3D counter->ops->events_configure(counter);
> > +
> > +		raw_spin_unlock_irqrestore(&counter->events_list_lock, flags);
> > +		break;
>=20
> return here.=20

Ack.

> > +static int counter_get_data(struct counter_device *const counter,
> > +			    const struct counter_comp_node *const comp_node,
> > +			    u64 *const value)
> > +{
> > +	const struct counter_comp *const comp =3D &comp_node->comp;
> > +	void *const parent =3D comp_node->parent;
> > +	int err =3D 0;
> > +	u8 value_u8 =3D 0;
> > +	u32 value_u32 =3D 0;
> > +
> > +	if (comp_node->component.type =3D=3D COUNTER_COMPONENT_NONE)
> > +		return 0;
> > +
> > +	switch (comp->type) {
> > +	case COUNTER_COMP_U8:
> > +	case COUNTER_COMP_BOOL:
> > +		switch (comp_node->component.scope) {
> > +		case COUNTER_SCOPE_DEVICE:
> > +			err =3D comp->device_u8_read(counter, &value_u8);
> > +			break;
> > +		case COUNTER_SCOPE_SIGNAL:
> > +			err =3D comp->signal_u8_read(counter, parent, &value_u8);
> > +			break;
> > +		case COUNTER_SCOPE_COUNT:
> > +			err =3D comp->count_u8_read(counter, parent, &value_u8);
> > +			break;
> > +		}
> > +		*value =3D value_u8;
> > +		break;
> > +	case COUNTER_COMP_SIGNAL_LEVEL:
> > +	case COUNTER_COMP_FUNCTION:
> > +	case COUNTER_COMP_ENUM:
> > +	case COUNTER_COMP_COUNT_DIRECTION:
> > +	case COUNTER_COMP_COUNT_MODE:
> > +		switch (comp_node->component.scope) {
> > +		case COUNTER_SCOPE_DEVICE:
> > +			err =3D comp->device_u32_read(counter, &value_u32);
> > +			break;
> > +		case COUNTER_SCOPE_SIGNAL:
> > +			err =3D comp->signal_u32_read(counter, parent,
> > +						    &value_u32);
> > +			break;
> > +		case COUNTER_SCOPE_COUNT:
> > +			err =3D comp->count_u32_read(counter, parent, &value_u32);
> > +			break;
> > +		}
> > +		*value =3D value_u32;
>=20
> Seems like a return here would make more sense as no shared stuff to do at
> end of the switch. Same in other similar cases.

Ack.

> > +		break;
> > +	case COUNTER_COMP_U64:
> > +		switch (comp_node->component.scope) {
> > +		case COUNTER_SCOPE_DEVICE:
> > +			return comp->device_u64_read(counter, value);
> > +		case COUNTER_SCOPE_SIGNAL:
> > +			return comp->signal_u64_read(counter, parent, value);
> > +		case COUNTER_SCOPE_COUNT:
> > +			return comp->count_u64_read(counter, parent, value);
> > +		}
> > +		break;
> > +	case COUNTER_COMP_SYNAPSE_ACTION:
> > +		err =3D comp->action_read(counter, parent, comp->priv,
> > +					&value_u32);
> > +		*value =3D value_u32;
> > +		break;
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * counter_push_event - queue event for userspace reading
> > + * @counter:	pointer to Counter structure
> > + * @event:	triggered event
> > + * @channel:	event channel
> > + *
> > + * Note: If no one is watching for the respective event, it is silently
> > + * discarded.
> > + */
> > +void counter_push_event(struct counter_device *const counter, const u8=
 event,
> > +			const u8 channel)
> > +{
> > +	struct counter_event ev =3D {0};
> > +	unsigned int copied =3D 0;
> > +	unsigned long flags;
> > +	struct counter_event_node *event_node;
> > +	struct counter_comp_node *comp_node;
> > +
> > +	ev.timestamp =3D ktime_get_ns();
> > +	ev.watch.event =3D event;
> > +	ev.watch.channel =3D channel;
> > +
> > +	raw_spin_lock_irqsave(&counter->events_list_lock, flags);
>=20
> For a raw spin lock, we definitely want to see comments on why it
> is necessary.

Ack.

> > @@ -650,7 +670,7 @@ static int counter_count_attrs_create(struct counte=
r_device *const counter,
> >  		return err;
> > =20
> >  	/* Create Count name attribute */
> > -	err =3D counter_name_attr_create(dev, group, count->name);
> > +	err =3D counter_name_attr_create(dev, group, "name", count->name);
>=20
> This refactoring could also be pulled out to a precusor patch.

Ack. This will be part of the extension_name patch.

> > @@ -319,12 +315,21 @@ struct counter_device {
> > =20
> >  	int id;
> >  	struct device dev;
> > +	struct cdev chrdev;
> > +	struct list_head events_list;
> > +	raw_spinlock_t events_list_lock;
> > +	struct list_head next_events_list;
> > +	DECLARE_KFIFO(events, struct counter_event, 64);
>=20
> Why 64?  Probably want that to be somewhat dynamic, even if only at build=
 time.

Ack. This will be dynamically configurable via sysfs attribute in v8.

> > +	wait_queue_head_t events_wait;
> > +	struct mutex events_lock;
> >  };
> > =20
> >  int counter_register(struct counter_device *const counter);
> >  void counter_unregister(struct counter_device *const counter);
> >  int devm_counter_register(struct device *dev,
> >  			  struct counter_device *const counter);
> > +void counter_push_event(struct counter_device *const counter, const u8=
 event,
> > +			const u8 channel);
> > =20
> >  #define COUNTER_COMP_DEVICE_U8(_name, _read, _write) \
> >  { \
> > diff --git a/include/uapi/linux/counter.h b/include/uapi/linux/counter.h
> > new file mode 100644
> > index 000000000000..7585dc9db19d
> > --- /dev/null
> > +++ b/include/uapi/linux/counter.h
> Small thing but I would have been tempted to do a precursor patch to the
> main change simply putting in place the userspace header.
>=20
> Classic Nop patch that makes it easier to focus on the real stuff in this
> patch by getting that noise out of the way!
>=20
> Jonathan

Ack.

William Breathitt Gray

--nmunDh9PKWC61MXK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAmIOwACgkQhvpINdm7
VJLTlw//cJaxYjnD+n4pnRnze6CezjGL0dEENF8QzlY3ren7gJXOTJgkwHVWzYd5
sq7WaVSZUoxkug07sYTckZQq2mohvTQQE6BhUv51lM+rkkoVhnvMzDWdB3ygyur9
d+rssNdhUMg0RrXdxRi4gH0hh23K1SQAI5/Choecz1YoGPMCSBh+0zTOkJ+UDszN
hjaYmdVGnc2hxMuoZLoM0twTkmTJWXyvHRQqCbDgWlc4cUEyziTjldqyklJTSSqK
ovJxjA6NXmEh3/zWJeFwKLsnYe+eqsv3S9CHg6B+gVWnIiE7VyDkv6vh2s2wE7cg
r67ebRddj7MBqrAq34G6xN4W0wqhWSAQZ4xUYSRzIgzUwnAl1umZb2Qi5Un4bPtk
BHNCYB6GnBLETxmIRSUDLMbaUe8XJjQXc7ogLc8qimN4oRmN4fByhuiKM5wirCAv
jq6UXRPHv1SI+00SgzVj0yPKPVFv5raZvEjwErekjNFoq7JNhdWkZ59eS0xHwLNZ
82TbRtwZvM78g+fHFCTgcgAkk2l3cJ4Kx/PNJ/J6kb+8ahTMtd89K6S0hZ/w6zCo
xCxYYV6q5FXQMr6siKpCxyI4fGORc7vqlPX8xnZJi/aREc4cVhKxGEWPqp8yqRkG
zVots+ppRy1D262LDn7OBsAqg52fLigQDw+WX+t3o/GuVaUBzRE=
=x9JT
-----END PGP SIGNATURE-----

--nmunDh9PKWC61MXK--

--===============5132850980905182458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5132850980905182458==--
