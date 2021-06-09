Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F33A16E7
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 16:17:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2AFDC58D58;
	Wed,  9 Jun 2021 14:17:11 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F614C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 14:17:10 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so1472774pjs.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Jun 2021 07:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xN7KEYZ9pR7gVi6zMi8zHdassp7hlEpZ4bgzEC5iNSM=;
 b=JT5NvdDCeF8FD9cSAojvj7dEMlD7WmGflpowWODnivNMkQhFDCtjpKfUboVhKpWi3b
 WQdWEQFanNvt30krx7BGnJ76Jq/kVa2FK40D6pZ93SRP42RoZ9LJhnFwi0MBQhs3ev54
 ycQNRTiQbLkhvFb4nUp/wAS6t2ui3TbkRXXjxtBqq/pi/ow34ShWIlPP/7zwVD9Cs1Px
 hPDayJokIL/fMFAKvUCu4d3qG/p+QXj0kYADNm3QlUKmNyzOsaxk/3zJpInw9LxPtpTz
 EuWm6QU0jNpCtvs/9SXpGIM43rtuh511BKbzNMmNfM0SfR1aAiMgx5QserN2lWowCpIw
 SJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xN7KEYZ9pR7gVi6zMi8zHdassp7hlEpZ4bgzEC5iNSM=;
 b=q35Z0IGIhLi8esVlsOcqbvnTGHeR8H9lp57rbTSSTWLpj0Osx7r9c/6rTQ9r7je1zD
 P/Y9Aoxmgj5KsadNP8OKl2ebwCELLk58EvJFBwZRA2fUQAgan4TDxDKl4UYQ0zTGagCT
 l7APfzjy86JYQL805TN8T0nB/D4yDrUGj7EB6jneORZog2+8GNA16pmzeQ2RCN32mI0k
 wx1h5yh+pYRrUcuF3ZNBWzr8XNHsW5rv/7MI0+VZ9WbIjXGgYvteyD8xrWgSgVtm1Okp
 jt1SeDxHtZFJYNdy+QtDr7MteEKdoygfUat3L+YREdUkCAbKvn12ns+W1+T2QrZTbv9u
 sZeg==
X-Gm-Message-State: AOAM531tbrswhFEoe3iljo60/IIOAi9TKP+QwB07SjObtFQL993nQAIu
 JQxXbR9J+aqJeHbbb1hl7sk=
X-Google-Smtp-Source: ABdhPJx8WT74WUiIhq3aCw/S7IQXfBAbEVnqK3qJ/M122pUIeNRqoLCbQcz0TIkpnYVL4dYWK3tylg==
X-Received: by 2002:a17:902:cec3:b029:105:fff1:74ad with SMTP id
 d3-20020a170902cec3b0290105fff174admr5119133plg.69.1623248228607; 
 Wed, 09 Jun 2021 07:17:08 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id s3sm27445pgs.62.2021.06.09.07.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:17:07 -0700 (PDT)
Date: Wed, 9 Jun 2021 23:16:50 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YMDNUrbUDtzaTjwA@shinobu>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
 <2b9526ab7f2de91bb867cbd3b12552c77c00b655.1623201082.git.vilhelm.gray@gmail.com>
 <20210609080708.GL10983@kadam> <YMB7mq0LHqmyAAzb@shinobu>
 <20210609085938.GM10983@kadam>
MIME-Version: 1.0
In-Reply-To: <20210609085938.GM10983@kadam>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v11 26/33] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============8403738942082906648=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8403738942082906648==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6W+PPeNZqxPVxyi9"
Content-Disposition: inline


--6W+PPeNZqxPVxyi9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 11:59:38AM +0300, Dan Carpenter wrote:
> On Wed, Jun 09, 2021 at 05:28:10PM +0900, William Breathitt Gray wrote:
> > On Wed, Jun 09, 2021 at 11:07:08AM +0300, Dan Carpenter wrote:
> > > On Wed, Jun 09, 2021 at 10:31:29AM +0900, William Breathitt Gray wrot=
e:
> > > > +static int counter_set_event_node(struct counter_device *const cou=
nter,
> > > > +				  struct counter_watch *const watch,
> > > > +				  const struct counter_comp_node *const cfg)
> > > > +{
> > > > +	struct counter_event_node *event_node;
> > > > +	struct counter_comp_node *comp_node;
> > > > +
> > >=20
> > > The caller should be holding the counter->events_list_lock lock but i=
t's
> > > not.
> >=20
> > Hi Dan,
> >=20
> > The counter_set_event_node() function doesn't access or modify
> > counter->events_list (it works on counter->next_events_list) so holding
> > the counter->events_list_lock here isn't necessary.
> >=20
>=20
> There needs to be some sort of locking or this function can race with
> itself.  (Two threads add the same event at exactly the same time).  It
> looks like it can also race with counter_disable_events() leading to a
> use after free.

All right, I'll add in a lock to protect this function so it doesn't
race with itself nor counter_disable_events().

> > > > +	/* Search for event in the list */
> > > > +	list_for_each_entry(event_node, &counter->next_events_list, l)
> > > > +		if (event_node->event =3D=3D watch->event &&
> > > > +		    event_node->channel =3D=3D watch->channel)
> > > > +			break;
> > > > +
> > > > +	/* If event is not already in the list */
> > > > +	if (&event_node->l =3D=3D &counter->next_events_list) {
> > > > +		/* Allocate new event node */
> > > > +		event_node =3D kmalloc(sizeof(*event_node), GFP_ATOMIC);
>=20
> Btw, say we decided that we can add/remove events locklessly, then these
> GFP_ATOMICs can be changed to GFP_KERNEL.

Because I'll be using a lock I'll keep these as GFP_ATOMICs afterall.

Thanks,

William Breathitt Gray

--6W+PPeNZqxPVxyi9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDAzUgACgkQhvpINdm7
VJKl3w/4kNd0eZ8gex7nYAbTKtDPuPZJ893YlJy3dyc8ONmPcLc6XqU7w9jBT68s
ak/7nQW+V685XxVMy/2MoHiEULP/GvWqAiTUJWomApJpSDWfDE70gjBT/70agL69
PprZ4wAoQoFIsVSRbsub57p8cwvuh0YGDyJUQ6+sAXmpi+zZw/RW9UB+WQnnXiye
s+DrdDez9PyLkE3hLC/1BNaD0mpcXulhesK7nu50C+FJ//QOUpIvRZwNaohw6hqQ
CWC7YsUdN9PwZHIC0BkwpediVffiVTBIgxK1Yqr3+j3kUyKbmY6iHb9PestK170W
Q3gHmTPPt0XPE6RnxYTh/Q7fyKbCyHgfBe+Gc8OSHF9pixs737xEKHZcZPX/Lvcz
4i06nJ0mtPSAXpp/9xGHa/+nd/owez2bO2P22v9d7TXcS58qNLbSdBf4/VNj4d4i
W2BKxNY0Xl0MOzMf5vWZ9b0ycW3ns9L4Ld0EvdoEba03MegzROrSwwcvcNZiI4jl
v3yE0U+GASUGcUiVPN4TH8Ep187XlJ2/klDXNYLSa9+D4zBaFDtPM+lIgc/ZHU8c
DKq9voEpZ84BloICz1QrJo5iLOSDzcKphh9ywYA/6Nshr1aoPy6i1jFHPc0Wby98
2CJ4Qa9sS+cRiRIcII1Ll50ofcdpcdivF1OaSmHEwuTIXKbzOw==
=d68x
-----END PGP SIGNATURE-----

--6W+PPeNZqxPVxyi9--

--===============8403738942082906648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8403738942082906648==--
