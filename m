Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37A3A0EBB
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 10:28:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F1B8C57B79;
	Wed,  9 Jun 2021 08:28:25 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75A54C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 08:28:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso3219701pjx.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Jun 2021 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=puGwaOMDT26719cQFE7/Yjic9yAlIAlsYvRcNj+B5nU=;
 b=BZ4TybxfQj4ufSrSUmRlBSZpJgceWCA7FM7IAgOG2x74ABWeWB+Sj7LoXEnnIS1bZI
 7TqLriNnLkeDalM1/nkxCX1NSrDQrsB4Z5CxsESxAQMUD9FoE51E64h6XJAE9am9Zdch
 8OHOezAljyLgPURvrgg8hDcu+DzdgiMIJvr3yyU25lUhuAhEwKMH3l15ShpeuQBdwSe3
 0yM+NxbC1qC0LjQlwgCmBh65z3bAH8qPU7vH1xY8u5RGr8Y7rVBDQTOmi/GOh2HZhA7x
 JJMThyiFy3RntW0SQx6tA6xKA5EXRhbHSQ6hHjEnASssA3REtoTgCOuddVlgh/B48gBC
 wBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=puGwaOMDT26719cQFE7/Yjic9yAlIAlsYvRcNj+B5nU=;
 b=I0MF5YNU3c+Sb4dKsvOB3FQxRX6fdWUtEW8kJR7TB1YDZba8iPRchS/bS8eIm/P+aE
 x9qQdqCGd/WS85gT1dcxoeYHfmAPE0YpmnRfroBze7EJPvx7XdIINDHeNLpuoIOjVzS6
 Zy5ZH4fKm2FyBjPe7IwPOpXuWYcEXE6kG9vSlUEY7zAw7eRqa/jUD43FothTaT4yWT8D
 rgKGKeUfLWWsaflJ2x8oj25mJSvkm9FDAAPf/ZhQoQ0AnhFnLAad/8cYyA95rSCgrRUe
 ylW8b9VQ6aVpWdnCcbiwArlMI6y++dRojAzNmkftyPMLRM3L3D2zOPrAxurNWKWb2Tqc
 +KtA==
X-Gm-Message-State: AOAM532g1SnH1McEhLuyP05xlHgLlQBN83UUwesax8gyHC01JXIuq71j
 A02g7MOUJi/sKLXsbHZXwUw=
X-Google-Smtp-Source: ABdhPJyhu5I84q3D44AwVRdsKNxgLUGoLOqz7ZrLc2Vp/RCdPXk302yCQG0QbUolnPmW9yvqV8MjHQ==
X-Received: by 2002:a17:90a:6305:: with SMTP id
 e5mr9406398pjj.232.1623227300895; 
 Wed, 09 Jun 2021 01:28:20 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id q24sm13728484pgk.32.2021.06.09.01.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 01:28:19 -0700 (PDT)
Date: Wed, 9 Jun 2021 17:28:10 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <YMB7mq0LHqmyAAzb@shinobu>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
 <2b9526ab7f2de91bb867cbd3b12552c77c00b655.1623201082.git.vilhelm.gray@gmail.com>
 <20210609080708.GL10983@kadam>
MIME-Version: 1.0
In-Reply-To: <20210609080708.GL10983@kadam>
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
Content-Type: multipart/mixed; boundary="===============0649241639184348905=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0649241639184348905==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9wrHIhMj6VuHeXH8"
Content-Disposition: inline


--9wrHIhMj6VuHeXH8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 11:07:08AM +0300, Dan Carpenter wrote:
> On Wed, Jun 09, 2021 at 10:31:29AM +0900, William Breathitt Gray wrote:
> > +static int counter_set_event_node(struct counter_device *const counter,
> > +				  struct counter_watch *const watch,
> > +				  const struct counter_comp_node *const cfg)
> > +{
> > +	struct counter_event_node *event_node;
> > +	struct counter_comp_node *comp_node;
> > +
>=20
> The caller should be holding the counter->events_list_lock lock but it's
> not.

Hi Dan,

The counter_set_event_node() function doesn't access or modify
counter->events_list (it works on counter->next_events_list) so holding
the counter->events_list_lock here isn't necessary.

> > +	/* Search for event in the list */
> > +	list_for_each_entry(event_node, &counter->next_events_list, l)
> > +		if (event_node->event =3D=3D watch->event &&
> > +		    event_node->channel =3D=3D watch->channel)
> > +			break;
> > +
> > +	/* If event is not already in the list */
> > +	if (&event_node->l =3D=3D &counter->next_events_list) {
> > +		/* Allocate new event node */
> > +		event_node =3D kmalloc(sizeof(*event_node), GFP_ATOMIC);
> > +		if (!event_node)
> > +			return -ENOMEM;
> > +
> > +		/* Configure event node and add to the list */
> > +		event_node->event =3D watch->event;
> > +		event_node->channel =3D watch->channel;
> > +		INIT_LIST_HEAD(&event_node->comp_list);
> > +		list_add(&event_node->l, &counter->next_events_list);
> > +	}
> > +
> > +	/* Check if component watch has already been set before */
> > +	list_for_each_entry(comp_node, &event_node->comp_list, l)
> > +		if (comp_node->parent =3D=3D cfg->parent &&
> > +		    comp_node->comp.count_u8_read =3D=3D cfg->comp.count_u8_read)
> > +			return -EINVAL;
> > +
> > +	/* Allocate component node */
> > +	comp_node =3D kmalloc(sizeof(*comp_node), GFP_ATOMIC);
> > +	if (!comp_node) {
> > +		/* Free event node if no one else is watching */
> > +		if (list_empty(&event_node->comp_list)) {
> > +			list_del(&event_node->l);
> > +			kfree(event_node);
> > +		}
> > +		return -ENOMEM;
> > +	}
> > +	*comp_node =3D *cfg;
> > +
> > +	/* Add component node to event node */
> > +	list_add_tail(&comp_node->l, &event_node->comp_list);
> > +
> > +	return 0;
> > +}
> > +
> > +static int counter_disable_events(struct counter_device *const counter)
> > +{
> > +	unsigned long flags;
> > +	int err =3D 0;
> > +
> > +	spin_lock_irqsave(&counter->events_list_lock, flags);
> > +
> > +	counter_events_list_free(&counter->events_list);
> > +
> > +	if (counter->ops->events_configure)
> > +		err =3D counter->ops->events_configure(counter);
> > +
> > +	spin_unlock_irqrestore(&counter->events_list_lock, flags);
> > +
> > +	counter_events_list_free(&counter->next_events_list);
> > +
> > +	return err;
> > +}
> > +
> > +static int counter_add_watch(struct counter_device *const counter,
> > +			     const unsigned long arg)
> > +{
> > +	void __user *const uwatch =3D (void __user *)arg;
> > +	struct counter_watch watch;
> > +	struct counter_comp_node comp_node =3D {0};
>=20
> Always use =3D {};.  It's the new hotness, and it avoids a Sparse warning
> for using 0 instead of NULL.  #IDidNotTest #CouldBeWrongAboutSparse

Thanks for the heads-up! I think this is the only patch where I have
this, so I'll hold off submitting a v12 for just this change unless
something else comes up with this patchset (I can fix this spare warning
in a subsequent patch).

William Breathitt Gray

--9wrHIhMj6VuHeXH8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDAe4gACgkQhvpINdm7
VJL7BBAA3+1/yr5bhewW4LafcCUbzU1wyuT5jrmB1Ru3YTfniv9LBoq0EZCMkI+e
PzR5jkXM5cZK2CBE/byhsJPBQvJ1C0pNGi4jUDBbFPElYpkEB8cAOhskimabCkGF
pWghRQp5KQzl3GSgB+Jak/5Rt8IqWGtQ+8oK3hpP6oj5EFeXRO6NxgmjiUjrpEAp
DsFvizy3KVdLlQjfq1yxYlXkaz54zzndsXyWAw9LbGMs6ioRvmiFsqgK7beW6i4a
V9U9CPeda6HCeJ3nkPIorclXXc3m5OwbY2FuAewFVpy2fInsSeGjpcnfBIs1onMl
zkdIEKcjOi1v9g8IXdn5lgW8OPXc1IjaF1LZGQ939Iu0oiwYNC+g6ie/nQwM1ZqT
BJlurA8LdpNo+baCWNTZdPAAVQ6GMNCLilYUJmG99j8s7PzdAU12l/e1kjzv/M0O
wagcrNhCdkSSb0FyQjGc5CrQdNlpVNadk3dWhbO0eNEDJszZObBQRQzfe0k8lQPx
pKTpkA1q/R+9E0VD/K5IP0xuCIwW5QM6V57uG7EuP5rRRh686FeDeirvFuJXyVpG
vdWH2keUIRpuxmRd1PvOaA8d/USnzfXhoJyYt1vAyeb6HO8PjQV6zuhTsWzq36kG
TT925QHbUQH7t7b2/hmrLLPmsDKHwuTyGuW9gh+a3n49cEnqjXM=
=MpJ2
-----END PGP SIGNATURE-----

--9wrHIhMj6VuHeXH8--

--===============0649241639184348905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0649241639184348905==--
