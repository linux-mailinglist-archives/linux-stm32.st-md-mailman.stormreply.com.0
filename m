Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D82E2C03
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Dec 2020 18:30:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 963BCC5717E;
	Fri, 25 Dec 2020 17:30:09 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECC9EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Dec 2020 17:30:08 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 19so4314707qkm.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Dec 2020 09:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6tNoeU4rdX0Rp7YesclVSlEoPPasvtmAb8rPCs2D1UA=;
 b=IIbk73+3Kn9m25AbiWeCyLcszXZliqbmEyDL1AOj0RVNhCQYa3sLxEQIqXZBW3Ypic
 DQ4wzgFr5B4rLcyjNdl29h0/7/ozhfpbDAocjKdrhtE2hO6WAEXbSpgu+JcR17vgO+sa
 rQhPpLky45RnexFX4O4NU7kW+Yu2yJBXHMJcLcGRrcFkuwEcTYEHk2G13VPL9sSen70j
 hSb/9en/J29uqP5MdAdokGjqlxKm4Dhuhv3vLtTcgjZkJhyIDqdlvQ02S5HhEn9hMPGO
 zktoLKSE4Re4ZHtqIBCUPKVtxs9/k+iyh7tTUzAe1vd+nBFPIspR9ejhvtS0sF/nfH/X
 gVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6tNoeU4rdX0Rp7YesclVSlEoPPasvtmAb8rPCs2D1UA=;
 b=t0+bgsO2qGTbRDwuIrrR8bQzgswWpp9zk4u+ArWRR5mVebnFEQ29C4u+ySWaSAWbqP
 K78Iukl2MtlXUJdUyKLZAd/Dycbg/13gkiFHoCrPhFc167DZAGDLQ4Wus+RdPeoO62eQ
 vAcZ2UkzCuHCGddRCMtctXOkcfx2VN91MIFS1s5bZ71LeyjGLlj38b8gHwD976NCXeRO
 QIXrLEGQvNmux1L00/KHI+FJL3o+wAXO/MwvmZhQO33brsM5UFAzmBK8yEKMEjQ0IJi6
 tjhIipeVbrBk77sDIteaEgUOXB22md6HlvDvJXrV5RNxwPR5X8RvHoR4rtG6zgalDI7q
 Dfaw==
X-Gm-Message-State: AOAM531XpDXZKqbaHYPWmfoFlZsYoqwKaFpEsid83J07wK4xx6iGtEP1
 5T1ikGOqNFi0OVHXDrx7r08=
X-Google-Smtp-Source: ABdhPJw0R+1fIgZCorc4miRt0cUFZr5DYuK5D7K1Bsb8++9DlhiEtxJFg2kyayH/6OeJ0qRyV9381w==
X-Received: by 2002:a37:a796:: with SMTP id q144mr35953703qke.38.1608917407683; 
 Fri, 25 Dec 2020 09:30:07 -0800 (PST)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id p34sm15771442qtd.62.2020.12.25.09.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 09:30:06 -0800 (PST)
Date: Fri, 25 Dec 2020 12:30:04 -0500
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <X+YhnDqLZ7Ad9b2O@shinobu>
References: <cover.1606075915.git.vilhelm.gray@gmail.com>
 <b52a62196399d33221f78a1689276ac193c10229.1606075915.git.vilhelm.gray@gmail.com>
 <b5d49a3a-99ab-e5c0-3f0b-601eed9b54f5@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <b5d49a3a-99ab-e5c0-3f0b-601eed9b54f5@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 3/5] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============4755858732841739837=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4755858732841739837==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bi9bW/svyG+8ZjzL"
Content-Disposition: inline


--Bi9bW/svyG+8ZjzL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

I agree with your suggested changes -- just a couple select comments
following below.

On Sun, Dec 13, 2020 at 05:58:26PM -0600, David Lechner wrote:
> > +static int counter_add_watch(struct counter_device *const counter,
> > +			     const unsigned long arg)
> > +{

[...]

> > +
> > +dummy_component:
> > +	comp_node.component =3D watch.component;
>=20
>=20
> In my experiments, I added a events_validate driver callback here to
> validate each event as it is added. This way the user can know exactly
> which event caused the problem rather than waiting for the event_config
> callback.

Yes, this is a good idea and I have use for this in the 104-quad-8
driver as well. I'm going to name this "watch_validate" however, because
I need to validate the requested channel as well as the requested event
here (both part of the struct counter_watch).

> > diff --git a/include/linux/counter.h b/include/linux/counter.h
> > index 3f3f8ba6c1b4..98cd7c035968 100644
> > --- a/include/linux/counter.h
>=20
>=20
> >=20
> > +/**
> > + * struct counter_event_node - Counter Event node
> > + * @l:		list of current watching Counter events
> > + * @event:	event that triggers
> > + * @channel:	event channel
> > + * @comp_list:	list of components to watch when event triggers
> > + */
> > +struct counter_event_node {
> > +	struct list_head l;
> > +	u8 event;
> > +	u8 channel;
> > +	struct list_head comp_list;
> > +};
> > +
>=20
>=20
> Unless this is needed outside of the drivers/counter/ directory, I
> would suggest putting it in drivers/counter/counter-chrdev.h instead
> of include/linux/counter.h.

The "events_list" member of the struct counter_device is a list of
struct counter_event_node. The events_configure() callback should parse
through this list to determine the current events configuration request.
As such, driver authors will need this structure available via
include/linux/counter.h so they can parse "events_list".

William Breathitt Gray

--Bi9bW/svyG+8ZjzL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl/mIZwACgkQhvpINdm7
VJIZxxAAhAKczPADq8u05OkOAmgVD7IeT9cUBIB/XnT0VVSVX46G473g78mZwlsx
qnfK1l4uDvwjAY+YFFKanUztxg/j60BzJOt9BK4NqWR4ic7J0FPj9i4YgN9J+9oo
JmFSjqT8Abo7rEdB426yT9Fof9cBU/oPdOpNSufDNidrxXnTIOKnjA9odG/vgOzl
mlXTQHs2glKeLrHIvJOnK7mwy3l11Ew2xhRvBEsMfbzXIYoOkVC8Ax146tHpqBVl
hN/vCEU49+JCbZrSOk9EmtjRZ7DiF8AoV7GFUjqGWxkECKx1ov2WeR62DFhUJMvI
qC/boNu0BZW2N8HgIvgsgKP0r/v0E+RuRFzcahpS/0YhsNh8fgEVfeIWS2ZaVXWT
7e4FZIOw4Vuk0E2DXw0rWRzvNCCstRsqY9fQ7ee1/WruCHRvZEeiifJADx7E7LBv
XwQynYXOgFe1hxXFejwSTgTCMl5y25CaT8JVU8GLYgHYnPKkIVSsOJ5dUgTbRCOu
RBbMgZbcBuB1tUy45SP6Rx8in4joA+AGAt6oj4kxrd+/+O2+uvUoNILqoYHAMyV6
EBP78O/sAHNObYnwVJNaM1Bc1VYIF7+pMjotOTtHmkZhs5Ac8qxXih4r+mIZgItu
yGeJ9cG82fkziDp+TtNuYXsfLQQhxtdicKmAqzZeg5VSyGQWkQY=
=vH3L
-----END PGP SIGNATURE-----

--Bi9bW/svyG+8ZjzL--

--===============4755858732841739837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4755858732841739837==--
