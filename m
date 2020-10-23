Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6E29701D
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Oct 2020 15:13:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B322FC424B3;
	Fri, 23 Oct 2020 13:13:14 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11103C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Oct 2020 13:13:13 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id h12so844150qtu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Oct 2020 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dKwShB7j5WEHxhR5oiuUjAihJ9isJepwJWV2MacDLa0=;
 b=c5u1/fdRe1TryIt+dk0dVaKDNfWt+3dershqJRZzHxVUllML0+fzPGPT7XanYwSKAX
 trRk5Vj2Hm6ZHq+TscRkPU6FTz96pb3cjlPk6CwtjR+RSvXOOcpRpqe5ukB58ZDniE3A
 6gB/+XGqW4VNURSHlpdhnCGXsknxtffvoqL2rl6GlI9l26ii/WG3QGLmRK9b7O+Jzhbi
 EB3Fg9wg6hBTG30K1WmJfKQazw6uoJLHyy1Bw8dGGKUAnKCJKlYx6rN6+4lbzZxfrQvV
 Byy+BHg/1778XnpFE6i8Ip/qsue53auGy7ek0p68fTWD/WyHjGZNEGKcgXM8lxZgNbTY
 kxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dKwShB7j5WEHxhR5oiuUjAihJ9isJepwJWV2MacDLa0=;
 b=BARTqftDCqfdUY3f4WqqBD/t3gSLLaMi82TC9IXpFe3IzLcCGO7U/0B9IRAWjwnkzq
 /7VBEk8vMX7HAJWXckWAGJQ2SXp2ucfg81UN0SppGECLnvrystM0ucIZoiBWyLuwVcZi
 eB0YsHAsPbWPqP5FRpXDv7JysI9geu+Ajca/Dc0N2cSV+AEsLqev1P0gnQS1STrwUiTB
 qD+oj1nyHLRHHvbVd3wNRM0eg5fCU0DQ3tB0y9M54YABPGNQj5Ln+7F3viE7l2CY4xr4
 6AfdW1ndfLFtilfun6TbyX5ZQNCYCBohg6SK4UwgqPkVzt20XzKzqazUFJlBN45nbCSs
 R8EA==
X-Gm-Message-State: AOAM5304uZlIE7uOwJpPu8gQjs6Set9buXbrIdsxAuLkWraZFnFIVGy/
 6xTuD8Eskzsd+jTCt2lHg2U=
X-Google-Smtp-Source: ABdhPJz5xgI/Vu6FALA7961ba27Gp5lHM6yAaQbHJCStwgE42CvcxLM7krpHPQWY+++yowlF8XxNrQ==
X-Received: by 2002:a05:622a:1c4:: with SMTP id
 t4mr1963479qtw.147.1603458792636; 
 Fri, 23 Oct 2020 06:13:12 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id u11sm805404qtk.61.2020.10.23.06.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 06:13:11 -0700 (PDT)
Date: Fri, 23 Oct 2020 09:12:56 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201023131256.GA30908@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <e38f6dc3a08bf2510034334262776a6ed1df8b89.1601170670.git.vilhelm.gray@gmail.com>
 <157d1edf-feec-33b5-7ad5-94f99316ca6e@lechnology.com>
 <20201018144901.GB231549@shinobu>
 <d2418c64-f1c7-810d-b80e-91155e0aaffd@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <d2418c64-f1c7-810d-b80e-91155e0aaffd@lechnology.com>
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
Content-Type: multipart/mixed; boundary="===============6953515641378581669=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6953515641378581669==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2020 at 10:38:43AM -0500, David Lechner wrote:
> On 10/18/20 9:49 AM, William Breathitt Gray wrote:
> > On Mon, Oct 12, 2020 at 09:15:00PM -0500, David Lechner wrote:
> >> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> >>> diff --git a/drivers/counter/counter-core.c b/drivers/counter/counter=
-core.c
> >>> new file mode 100644
> >>> index 000000000000..987c6e8277eb
> >>> --- /dev/null
> >>> +++ b/drivers/counter/counter-core.c
> >>
> >>
> >>> +/**
> >>> + * counter_register - register Counter to the system
> >>> + * @counter:	pointer to Counter to register
> >>> + *
> >>> + * This function registers a Counter to the system. A sysfs "counter=
" directory
> >>> + * will be created and populated with sysfs attributes correlating w=
ith the
> >>> + * Counter Signals, Synapses, and Counts respectively.
> >>> + */
> >>> +int counter_register(struct counter_device *const counter)
> >>> +{
> >>> +	struct device *const dev =3D &counter->dev;
> >>> +	int err;
> >>> +
> >>> +	/* Acquire unique ID */
> >>> +	counter->id =3D ida_simple_get(&counter_ida, 0, 0, GFP_KERNEL);
> >>> +	if (counter->id < 0)
> >>> +		return counter->id;
> >>> +
> >>> +	/* Configure device structure for Counter */
> >>> +	dev->type =3D &counter_device_type;
> >>> +	dev->bus =3D &counter_bus_type;
> >>> +	if (counter->parent) {
> >>> +		dev->parent =3D counter->parent;
> >>> +		dev->of_node =3D counter->parent->of_node;
> >>> +	}
> >>> +	dev_set_name(dev, "counter%d", counter->id);
> >>> +	device_initialize(dev);> +	dev_set_drvdata(dev, counter);
> >>> +
> >>> +	/* Add Counter sysfs attributes */
> >>> +	err =3D counter_sysfs_add(counter);
> >>> +	if (err)
> >>> +		goto err_free_id;
> >>> +
> >>> +	/* Add device to system */
> >>> +	err =3D device_add(dev);
> >>> +	if (err) {
> >>> +		put_device(dev);
> >>> +		goto err_free_id;
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +
> >>> +err_free_id:
> >>> +	/* get_device/put_device combo used to free managed resources */
> >>> +	get_device(dev);
> >>> +	put_device(dev);
> >>
> >> I've never seen this in a driver before, so it makes me think this is
> >> not the "right way" to do this. After device_initialize() is called, we
> >> already should have a reference to dev, so only device_put() is needed.
> >=20
> > I do admit this feels very hacky, but I'm not sure how to handle this
> > more elegantly. The problem is that device_initialize() is not enough by
> > itself -- it just initializes the structure, while device_add()
> > increments the reference count via a call to get_device().
>=20
> add_device() also releases this reference by calling put_device() in all
> return paths. The reference count is initialized to 1 in device_initializ=
e().
>=20
> device_initialize > kobject_init > kobject_init_internal > kref_init

You're right, I completely overlooked this: kref_init() initializes the
reference count to 1. Therefore, the get_device() call is incorrect and
should be be removed.

> >=20
> > So let's assume counter_sysfs_add() fails and we go to err_free_id
> > before device_add() is called; if we ignore get_device(), the reference
> > count will be 0 at this point. We then call put_device(), which calls
> > kobject_put(), kref_put(), and eventually refcount_dec_and_test().
> >=20
> > The refcount_dec_and_test() function returns 0 at this point because the
> > reference count can't be decremented further (refcount is already 0), so
> > release() is never called and we end up leaking all the memory we
> > allocated in counter_sysfs_add().
> >=20
> > Is my logic correct here?
>=20
> Not quite. I think you missed a few things I mentioned above. So we never
> have a ref count of 0 until the very last call to put_device().

Ack.

William Breathitt Gray

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+S1s0ACgkQhvpINdm7
VJIUCA/9H4U4VQUw5cCxP0N7nT9UimOljvgGcou0GNnv1ZB9gg52QQfWXvkIXZmL
2TT15CA+RE3truIWSgJtVOQq2Jir59zh57EamE3ZUtmmZRVwraN2Ne42cx6gj/Th
q8xfynbUJIZ8LGGNsFp34K5dk1ME7w68/5c880HTdcroadW2XZkkrwzzw8d4vde/
eDDv9yCRbZsrVAFTfrdNEGajJktiZfTjWy+XQZcrjZl5No/zoO4wuXwGAGorxUkt
DlC594HMJAsjDI+6DcswkjcvYNrSE+T5iKbp+J5wW86jBoHcaz9MrXH26sRsCpGx
RJ0vUzDtpqFpaM2s6x+yG8Lb4M0kJYe8wGQH1meXL2ypppmJ9Fa3yu1MZ4Ic6aOT
5GZnVzzvpjZoamOjoCTVPUl4AC+rC/bo+bNfPydUsriow41augsH2TIs9MioYSem
KirIumFrBMh/ZYc4IGxO3quJoneinz5evcradtjX0vj5YWxeNrfk5l5Bo9onjYWx
iJXz+o4TghJNxC4vzBngE1TwhI3343GUHIESA6I0BvHpiW/ZXFfAg0d8VPvzAElD
rXzva+ZtzlwrC46iDoeyDTG/5/aqCdUctD82TGORH9yvQfW6AQXur+auEjHHai+q
5PjM/uVDiFEZntsV9ucuj/q4Cf71dHrQ+1TMy55P1iO56+siZCM=
=dPgv
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============6953515641378581669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6953515641378581669==--
