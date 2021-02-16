Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D601B31C52F
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Feb 2021 02:53:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C1E5C5718D;
	Tue, 16 Feb 2021 01:53:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A6F5C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Feb 2021 01:53:16 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id s16so755454plr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Feb 2021 17:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3Z9fQxyTq8wZx7TxGYyTLeA7qeXg7RbpnEvNBDuqSeU=;
 b=B6H+rtngp5Ub6P7PakgDyMgHLMSFW3CXCwi7xKpx+HOjYnyvKM7HSlwfA95mkNKG4p
 H6+ziozELER4v/UR2ZoBPLf+kJdhsgYeHVCxbqGHZX53Lu/iglnQ2LsDkxH1SUBQknOW
 lnoIq4mgym/IU63GuzQtLykc/x/mW3NFDRhyOmr/+Af23Qu77unqcAppvFqaq3XYDsB+
 0s3iWUlvx3hmeITiQ5mat6MQ1wlL8ZIwBmgsvqk+IL6WMtu2tnOj9rUU8jy7DGfgcfLw
 iL/+WuBuHzJEVj+JYCStZAKIufq+25xZlYspAyYuSISJvC9ce+SRhGbnd4FEiu2ctoCC
 ONYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Z9fQxyTq8wZx7TxGYyTLeA7qeXg7RbpnEvNBDuqSeU=;
 b=qlCTAjPcqYHVGtP37iSwGozC67uu9qRmPbk1k6fCrjpqRuqa0BkonF0pBu+I8tTD2Z
 jX9HoCY/dd+shk21Du6N2THnxniDWcDw1ndtspbiB+u1y3LdQ/iZSMBDGvs4TnRB8p4n
 atueu7A4gZ8VlcW1k4EOQ3fQtj+DGi17cQLsXbVN9IatHJAkXzPO11zgFZ0hQkJk5Nfb
 twmHNlOcVVImZfQJzJkCiVN+Bmp9Pda8SOj7uq7c6qxOZ5pMJY5xRT8tbOWZZkvV/zC9
 HKrcyepRIibbxcaqjFNHg4Rd2ozlUTM0SUaUKtI/XviX6+VW640KcJkkOICWaqRzcgVm
 c9pA==
X-Gm-Message-State: AOAM532ZGuNCXO1O/REkx/cf5PT0B6umQ5zaZysa20BuAHAYncdQfj8v
 U/rpsbYIKr5byGBf7Vbzf5E=
X-Google-Smtp-Source: ABdhPJysymyLyn+YYqU+KN7674VkmclJov3EAACVxq+13r1TVdkYZg6vIBxVI9ozXtcGE1mPeQqyXA==
X-Received: by 2002:a17:902:e847:b029:e1:52b9:d81b with SMTP id
 t7-20020a170902e847b02900e152b9d81bmr17553849plg.82.1613440394610; 
 Mon, 15 Feb 2021 17:53:14 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id ga22sm691114pjb.34.2021.02.15.17.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 17:53:13 -0800 (PST)
Date: Tue, 16 Feb 2021 10:53:07 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <YCslg5i+U0M8Cn82@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <720278e3aaf3f249657ec18d158eca3f962baf8e.1613131238.git.vilhelm.gray@gmail.com>
 <20210215092412.ptbngqge7m7nyivp@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210215092412.ptbngqge7m7nyivp@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com, kernel@pengutronix.de,
 jic23@kernel.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 17/22] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============7011586902016126993=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7011586902016126993==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EWkdL/PqLMg68rsd"
Content-Disposition: inline


--EWkdL/PqLMg68rsd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 10:24:12AM +0100, Oleksij Rempel wrote:
> Hi William,
>=20
> On Fri, Feb 12, 2021 at 09:13:41PM +0900, William Breathitt Gray wrote:
> > This patch introduces a character device interface for the Counter
> > subsystem. Device data is exposed through standard character device read
> > operations. Device data is gathered when a Counter event is pushed by
> > the respective Counter device driver. Configuration is handled via ioctl
> > operations on the respective Counter character device node.
>=20
> .....
>=20
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
> > +	/* Could be in an interrupt context, so use a raw spin lock */
> > +	raw_spin_lock_irqsave(&counter->events_list_lock, flags);
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
>=20
> To cover my "interrupt-counter" use case, I added following line here to
> convert the tail drop fifo to the head drop fifo:
>=20
> +       list_for_each_entry(comp_node, &event_node->comp_list, l)
> +               to_copy +=3D sizeof(ev);
> +
> +       while (kfifo_avail(&counter->events) < to_copy)
> +               kfifo_skip(&counter->events);
>=20
> May be it make sense to make it optional and integrate in to you patches
> before it goes mainline?
>=20
> Regards,
> Oleksij
> --=20
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Hello Oleksij,

I appreciate your suggestion, and I'm excited about your
interrupt-counter driver -- it looks like the Counter character device
interface will be central for that driver. However, I want to hold off
on adding further functionality to this patchset so that we can stablize
it enough to merge.

Once the Counter character device interface is merged, please send your
changes again as a patch and we can review it further then.

Thank you,

William Breathitt Gray

--EWkdL/PqLMg68rsd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmArJYMACgkQhvpINdm7
VJKmiRAA4DZryRZBEwsPxRbFl4Mq1+SDKR8yQSfXW6ddho5xEp8qj+fGp6RaimIm
Zz9YLNH7/VQvEDeX5o6swntVlq3HT+C8VSp2sNPEIKIduNy114kx4qTE0L238nGq
cSOiY7rO78BKcbZ1zGfg1waRZWXuAsTu0F8xC5zrjYbjN+OEohUjmzMYsJoNbmq8
pVMuSiwbx2V4sBysgnKffP5ZfEsNVJocVbt7u3NPsadMMn9CVswtqqY6RVn8GdF9
KSTSomqzlL8OnnbodjuFM5CjvECVp3HVMUYd5R9hJAAQOCMds3j4nq1dD/qY78RB
UeD7+SuQBAPWi517V/tTezbal7HloM7AYNwwG9oyu27DEy+t49fd+p/cahBRhhHi
YY97IZyTk0WeJh7sX4Z2kNkgEj5KQljlxy6iX6UnToDaM1AF0Ezx+v6f+lUsRZ8c
l/zFYc74ZoVbP4TcO535pbyh6AleOkeZRBxJYsu1N+c96JzcrftFAhk0Gkbo52rA
DKSdh2qvELlJlYQf77EQh39yLvnluacqm3oUoHpXnp2hrIZMyZGo0/82eFlM+Ue+
xoeQCy2FiKOmkE9s1l0S7JvqkPTLpALDvFWm7FGWhBqpAZm/gdSRph/RumyccYIE
3fHlmlJOh4aa712C+b+K2zkKEXMhD/Bn1y4i8XZv7N8qq4cbyLQ=
=JYlU
-----END PGP SIGNATURE-----

--EWkdL/PqLMg68rsd--

--===============7011586902016126993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7011586902016126993==--
