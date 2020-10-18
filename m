Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BAD2917ED
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Oct 2020 16:49:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EB25C3FAE3;
	Sun, 18 Oct 2020 14:49:09 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01C3CC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 14:49:05 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id y198so5983039qka.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 07:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2maPjMmKBO3qJ6bj1ZIa+1fen/LaHDMz2hjlt9FyXpM=;
 b=edJ76NFhzlLWq4H5mSoCVT3A4RvvvjDB6Y8RN1FPfruryMA0JG3jdQwm4GX2wjTtwk
 1JP17TlZMkcSrV5F9kL8us5xOVeMCF1pNtk0kdUK2tQ+zV3gBTNmP7i7F1DG6pVKHwjz
 lVPAKKXnOeguxignj6FcqpP75KmNmRWpV+05v9SPCOIUrQg8+mF/RAfOzvVgc0BG3wk3
 8jKDO4b/+Y+4lu5Uj+XwW55qjt5FpIigYFxQ+aVAGh6CNqQO4pg5JIH+fsIR3g0jtZN2
 q4fybDMigAFCikAu3niYmfIwCKv4JU6tfsbPRzCDoo2C5K2QUZnRZxMSNnHgonreyFrF
 uOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2maPjMmKBO3qJ6bj1ZIa+1fen/LaHDMz2hjlt9FyXpM=;
 b=kZK15vehgG1IGrWCxZDtyR5maWQjCRwd0VzjguHXZjFLDmZCsJgqMAITJooQcBBduk
 m1NosEUpzP8uSi+xME2flx50c52k0z/PA77iLzAxX1VL0rP0FuNqQFEpq4/zeAJxd1I7
 1D5Qi/yBUtiGolNtC6W3f8F9Ct6PEA6vkqYBmlP9z8g3Cb4GrpFITdtNAb5Nt+vpf3et
 2gAEIRQ9Bop/j1aLyC3z3PsVLNxEtUpSgz6kwUBw+9efaBuSe/WRJ+2e7w/tSIR3iG6K
 jdXlM5biVWygxAj/kUV8yGs1GdfqGCtnGYRNe3AEmMCkKJNnwtmr59vr4eFx5RmZ8ZOQ
 QHgQ==
X-Gm-Message-State: AOAM531dGSlSXTpVD4jOyK2Q7YAJ2q5MjKEcH24Ob2K1pxHja4MhUcs1
 vB3YCbKjdvTBWbAq8ht+0sE=
X-Google-Smtp-Source: ABdhPJxfNufcArwekK4WupgO67MI7ytQp56+WBT8GVqq/2Q0K9iOmMl1ClyTr5Q0NwnGIFfLbbMtRw==
X-Received: by 2002:a05:620a:2054:: with SMTP id
 d20mr12155152qka.175.1603032544414; 
 Sun, 18 Oct 2020 07:49:04 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id 6sm3175635qkj.75.2020.10.18.07.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 07:49:03 -0700 (PDT)
Date: Sun, 18 Oct 2020 10:49:01 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201018144901.GB231549@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <e38f6dc3a08bf2510034334262776a6ed1df8b89.1601170670.git.vilhelm.gray@gmail.com>
 <157d1edf-feec-33b5-7ad5-94f99316ca6e@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <157d1edf-feec-33b5-7ad5-94f99316ca6e@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/5] counter: Internalize sysfs
	interface code
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
Content-Type: multipart/mixed; boundary="===============4256288477387650281=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4256288477387650281==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 09:15:00PM -0500, David Lechner wrote:
> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> > This is a reimplementation of the Generic Counter driver interface.
>=20
> I'll follow up if I find any problems while testing but here are some
> comments I had from looking over the patch.
>=20
> > diff --git a/drivers/counter/counter-core.c b/drivers/counter/counter-c=
ore.c
> > new file mode 100644
> > index 000000000000..987c6e8277eb
> > --- /dev/null
> > +++ b/drivers/counter/counter-core.c
>=20
>=20
> > +/**
> > + * counter_register - register Counter to the system
> > + * @counter:	pointer to Counter to register
> > + *
> > + * This function registers a Counter to the system. A sysfs "counter" =
directory
> > + * will be created and populated with sysfs attributes correlating wit=
h the
> > + * Counter Signals, Synapses, and Counts respectively.
> > + */
> > +int counter_register(struct counter_device *const counter)
> > +{
> > +	struct device *const dev =3D &counter->dev;
> > +	int err;
> > +
> > +	/* Acquire unique ID */
> > +	counter->id =3D ida_simple_get(&counter_ida, 0, 0, GFP_KERNEL);
> > +	if (counter->id < 0)
> > +		return counter->id;
> > +
> > +	/* Configure device structure for Counter */
> > +	dev->type =3D &counter_device_type;
> > +	dev->bus =3D &counter_bus_type;
> > +	if (counter->parent) {
> > +		dev->parent =3D counter->parent;
> > +		dev->of_node =3D counter->parent->of_node;
> > +	}
> > +	dev_set_name(dev, "counter%d", counter->id);
> > +	device_initialize(dev);> +	dev_set_drvdata(dev, counter);
> > +
> > +	/* Add Counter sysfs attributes */
> > +	err =3D counter_sysfs_add(counter);
> > +	if (err)
> > +		goto err_free_id;
> > +
> > +	/* Add device to system */
> > +	err =3D device_add(dev);
> > +	if (err) {
> > +		put_device(dev);
> > +		goto err_free_id;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_free_id:
> > +	/* get_device/put_device combo used to free managed resources */
> > +	get_device(dev);
> > +	put_device(dev);
>=20
> I've never seen this in a driver before, so it makes me think this is
> not the "right way" to do this. After device_initialize() is called, we
> already should have a reference to dev, so only device_put() is needed.

I do admit this feels very hacky, but I'm not sure how to handle this
more elegantly. The problem is that device_initialize() is not enough by
itself -- it just initializes the structure, while device_add()
increments the reference count via a call to get_device().

So let's assume counter_sysfs_add() fails and we go to err_free_id
before device_add() is called; if we ignore get_device(), the reference
count will be 0 at this point. We then call put_device(), which calls
kobject_put(), kref_put(), and eventually refcount_dec_and_test().

The refcount_dec_and_test() function returns 0 at this point because the
reference count can't be decremented further (refcount is already 0), so
release() is never called and we end up leaking all the memory we
allocated in counter_sysfs_add().

Is my logic correct here?

> > +	ida_simple_remove(&counter_ida, counter->id);
>=20
> In the case of error after device_initialize() is called, won't this
> result in ida_simple_remove() being called twice, once here and once in
> the release callback?

I hadn't considered that. I suppose the ida_simple_remove here is not
necessary because we will always call ida_simple_remove() in
counter_device_release() when we call put_device(). I'll remove this
ida_simple_remove() from counter_register() then.

> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(counter_register);
> > +
> > +/**
> > + * counter_unregister - unregister Counter from the system
> > + * @counter:	pointer to Counter to unregister
> > + *
> > + * The Counter is unregistered from the system; all allocated memory i=
s freed.
> > + */
> > +void counter_unregister(struct counter_device *const counter)
> > +{
> > +	if (!counter)
> > +		return;
> > +
> > +	device_unregister(&counter->dev);
> > +}
> > +EXPORT_SYMBOL_GPL(counter_unregister);
> > +
> > +static void devm_counter_unreg(struct device *dev, void *res)
>=20
> To be consistent, it would be nice to spell out unregister.

Ack.

> > +{
> > +	counter_unregister(*(struct counter_device **)res);
> > +}
> > +
>=20
> > diff --git a/drivers/counter/counter-sysfs.c b/drivers/counter/counter-=
sysfs.c
> > new file mode 100644
> > index 000000000000..e66ed99dd5ea
> > --- /dev/null
> > +++ b/drivers/counter/counter-sysfs.c
>=20
> > +/**
> > + * counter_sysfs_add - Adds Counter sysfs attributes to the device str=
ucture
> > + * @counter:	Pointer to the Counter device structure
> > + *
> > + * Counter sysfs attributes are created and added to the respective de=
vice
> > + * structure for later registration to the system. Resource-managed me=
mory
> > + * allocation is performed by this function, and this memory should be=
 freed
> > + * when no longer needed (automatically by a device_unregister call, or
> > + * manually by a devres_release_all call).
> > + */
> > +int counter_sysfs_add(struct counter_device *const counter)
> > +{
> > +	struct device *const dev =3D &counter->dev;
> > +	const size_t num_groups =3D counter->num_signals + counter->num_count=
s +
> > +				  1;
>=20
> It is OK to go past 80 columns, especially for just for a few characters.

Ack.

> > +	struct counter_attribute_group *groups;
> > +	size_t i, j;
> > +	int err;
> > +	struct attribute_group *group;
> > +	struct counter_attribute *p;
> > +
> > +	/* Allocate space for attribute groups (signals, counts, and ext) */
> > +	groups =3D devm_kcalloc(dev, num_groups, sizeof(*groups), GFP_KERNEL);
> > +	if (!groups)
> > +		return -ENOMEM;
> > +
> > +	/* Initialize attribute lists */
> > +	for (i =3D 0; i < num_groups; i++)
> > +		INIT_LIST_HEAD(&groups[i].attr_list);
> > +
> > +	/* Register Counter device attributes */
> > +	err =3D counter_device_register(counter, groups);
>=20
> This function name is a bit misleading. At first I though we were registe=
ring
> a new counter device (struct device). Maybe counter_sysfs_create_attrs()
> would be a better name? (I wouldn't mind having all functions in this
> file having a "counter_sysfs_" prefix for that matter.)

Good point, I'll rename these to make it clearer.

> > diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
> > index 1ff07faef27f..938085dead80 100644
> > --- a/drivers/counter/ti-eqep.c
> > +++ b/drivers/counter/ti-eqep.c
>=20
>=20
> > @@ -406,7 +414,7 @@ static int ti_eqep_probe(struct platform_device *pd=
ev)
> >  =20
> >   	priv->counter.name =3D dev_name(dev);
> >   	priv->counter.parent =3D dev;
> > -	priv->counter.ops =3D &ti_eqep_counter_ops;
> > +	priv->counter.parent =3D &ti_eqep_counter_ops;
> >   	priv->counter.counts =3D ti_eqep_counts;
> >   	priv->counter.num_counts =3D ARRAY_SIZE(ti_eqep_counts);
> >   	priv->counter.signals =3D ti_eqep_signals;
>=20
> This looks like an unintentional change and causes a compile error.

Yeah, it was an unintentional change. I'll fix this. :-)

> > diff --git a/include/linux/counter.h b/include/linux/counter.h
> > index 9dbd5df4cd34..132bfecca5c3 100644
> > --- a/include/linux/counter.h
> > +++ b/include/linux/counter.h
> > @@ -6,417 +6,195 @@
> >   #ifndef _COUNTER_H_
> >   #define _COUNTER_H_
> >  =20
> > -#include <linux/counter_enum.h>
> >   #include <linux/device.h>
> > +#include <linux/kernel.h>
> > +#include <linux/list.h>
>=20
> struct list_head is defined in linux/types.h. Is there something else
> we are using from linux/list.h in this file?

I think this was left over from when I had list_add() in this file in an
earlier version; I'll remove this header now since it doesn't look
necessary.

> >   #include <linux/types.h>
> >  =20
>=20
>=20
> It would be helpful to have kernel doc comments on everything in this fil=
e.

Ack.

William Breathitt Gray

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+MVcoACgkQhvpINdm7
VJKPlQ//fPGvfc3H6TKRGzQSDSpXJW4bTJ29II448RW8Pz/tigHvfZwfxjGY4t0f
2smaXA9xC//7Ss7xgW+hNNP54v+eQxzOoRlnqwoYiT9lTnELiEmIGmneP+ThGVk/
0zx4xGwcTrQgsxoTlkyyg27uSL3w4a6/CFwmaI0LLNWBiYTmE5osD7s/rbP6gm6J
oJWWeoJXwI3ky9hqvVUE4hpPiJQz4GAwFKULMzVfCiR9lG9IaUVFfOLzryByuHEx
2W5ffOsJ1nyeCY4A9+fme7/dJG/gRJxvGnaCqDwLMHEHgI30p2ZBjvX1gjhRTUlN
cFPIi4JhbI0J0hfBbglAU7SB/ZqfqzfNVw233j6CH0LL+tJCiJPl+goafx7iyQ4+
D/856GZDG+Ns7NZjoAemw85owD/p63Jjx0h5OCchBhE6hhvty1fleeV5WPc7ayU0
wcUHCUdRU3Vq7hpkFqClXU928vTHXR15yi+Ieo3IPiMMiMgq4ovdCsQbeHs489fT
C1EpMnPo0vpPA59SOXKLht8fCS02yw2IqnjwfePOs00hl59sQc4blJe7eEN7J7s4
wAgHnARxaQ12lhAa8n8E8jZmyGSSPSm4U/0d//RLz5G4DDrCsOhL7d6PjFp6HdHp
qaAdI6nIiDV3rVzUCDA5G92YLxd6ZHFychfbgbEjkXT/wI99yfk=
=Xn8e
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--

--===============4256288477387650281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4256288477387650281==--
