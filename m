Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB03C3B43
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jul 2021 11:12:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A715C57B6B;
	Sun, 11 Jul 2021 09:12:37 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D0BC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jul 2021 09:12:33 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id h5so8262260vsg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jul 2021 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DOZ/sOH8+Rsjf9K6KjxQGtE06rD3YjMce9ekhraHpxU=;
 b=raHJHXqXoadd7fB11PI/hhlLA5jkvLxzqckn09EqGMk9zwQ9Afw7soUgyZGaJbVTK7
 mJiAwhhPLcHUm3fS1dMHR+qHYCIMboe7z+C4hYDgjupKfwL2+H8eoBHm6V4P0Cqaqpdk
 a3j3AhhdRxMhx25uqvQJULvi5+YzZHR424jmJTperMKDtwFw/4mGBR6wM5pYYe2VQFYZ
 keLvgnIUg6yX9v5y44S7qLtsYCNYMkfkUeNtkTbrQ7/QBuWvImRkyuz5DZgyFiKI8A31
 K8TJ8aWz9W1t4LmIAjs7pp0AHyrVlk3EA3VhEUQl7OYPw0uhUWltdT3ETlakiU18auGv
 dQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DOZ/sOH8+Rsjf9K6KjxQGtE06rD3YjMce9ekhraHpxU=;
 b=lwzyXKdphZzxYKP30+VxLtiQpRH2dcPrjQ9Thx6JahB6gECsKLV/B+WnLbCs6C6o/j
 8qEVsOJYWBygVOe9PbunZnNlKqGu5Fsng3sYSCZyF/yr9uDIAXb4n4Dt9b4cAFyEhvaH
 qI+eCsq5b0zqLxWc1VOMqdcnLv6bI78UTtMHohDLOzynlxIcVHyE8VPqc5BzkP7q8Mpc
 UUupl9HobGzaO4IExlItUrkpmXwjno0XglWoBVAYD1gK7qbP//OfPL8CeQG3X/xXzXh1
 CbQ2tKrE6z4TeszQooJFJehssnzRAUBCmjbpFH92blXpcatRtrhlL5D7EhD0QYC+XXs5
 uSlg==
X-Gm-Message-State: AOAM5333Gt0an/xT+3kySF+EGT8CfLHAknPbfcRnDOPxr8UNQ20QL00z
 Kxgw6y1lq0Fxpk65ezJofvA=
X-Google-Smtp-Source: ABdhPJy4sYlbAvD925USY3o7g3cekIAiQWfPOcpJSUajkbSVOf7KKojVP1744YeqH/lV+OQ7fAEwHg==
X-Received: by 2002:a67:8013:: with SMTP id b19mr3288366vsd.33.1625994752311; 
 Sun, 11 Jul 2021 02:12:32 -0700 (PDT)
Received: from shinobu ([193.27.12.133])
 by smtp.gmail.com with ESMTPSA id e20sm1570374vsb.22.2021.07.11.02.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 02:12:31 -0700 (PDT)
Date: Sun, 11 Jul 2021 18:12:23 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <YOq19zTsOzKA8v7c@shinobu>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <e298043c880b350a42bdc40452376a3708bf533b.1625471640.git.vilhelm.gray@gmail.com>
 <1a624011-0b43-ac42-be53-a42f81923e5a@linux.intel.com>
 <YOl1frCrophjhk7y@shinobu>
 <fbf1ba4c-412b-fe22-0e79-76e968a00fb4@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <fbf1ba4c-412b-fe22-0e79-76e968a00fb4@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 15/17] counter: Implement
 events_queue_size sysfs attribute
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
Content-Type: multipart/mixed; boundary="===============5609221056577273358=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============5609221056577273358==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QSOFuI5CHXQO+dHV"
Content-Disposition: inline


--QSOFuI5CHXQO+dHV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 10, 2021 at 10:43:22AM -0500, David Lechner wrote:
> On 7/10/21 5:25 AM, William Breathitt Gray wrote:
> >> and after that
> >>
> >> [   16.564403] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >> [   16.570725] WARNING: lock held when returning to user space!
> >> [   16.577044] 5.13.0-next-20210706+ #4 Not tainted
> >> [   16.582198] ------------------------------------------------
> >> [   16.588507] cat/331 is leaving the kernel with locks still held!
> >> [   16.595214] 1 lock held by cat/331:
> >> [   16.599103]  #0: ffff888102bb3630
> >> (&counter->chrdev_lock){+.+.}-{3:3}, at: counter_chrdev_open+0x21/0x60
> >> [counter]
> >>
> >> Jarkko
> > I'm not sure how to resolve this warning. The purpose of this lock is to
> > limit chrdev to a single open at a time. To accomplish this I grab this
> > lock in counter_chrdev_open() and hold it until counter_chrdev_release()
> > is called. Is there a better way to accomplish this?
>=20
> How about using an atomic flag, e.g test_and_set_bit()?

Yes, I think this might work: atomically test and set the bit to lock
and atomically clear it to unlock. I'll replace the mutex with an atomic
flag.

By the way, what is the difference between test_and_set_bit() and
test_and_set_bit_lock()?

William Breathitt Gray

--QSOFuI5CHXQO+dHV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDqtfcACgkQhvpINdm7
VJJoJw/8DNxxfECJciiVQx9aysjKNMY0qReiNt0Ua1DGfW7g2h9MFwl+YZo/NqN0
JySbFvJ4DHIeUed1KOfr7bH4J0/PEG20xbEO14wHUyWBehXomn5/67lrDnzJ82Px
ih54U7JEEqdoda6eswt3U1dkvCwJF9lOzQDLe4xLFy127I/bctSDVncYpbFRcYlJ
VHf6EuD4Tu30IGYhLbDWIrZgv+nMXWzpx4m0cUPFhFJO2oW83GSYVKo0yB14NLJo
lmfzrmoX+9SPI3LLiu47yphY2nKSfvvb7Wi+ScOnUSvDd9a43Tb51tiZGoobbgGa
pWu5WXPnNcR5XYmIXx2vxxWx7XLAR+mxW85VO2MeQGQtsbiFeGUHuvbexqAu3JeA
EC6wySkTB35hgaesvsJMsBNfGdlQZjzydIidJqK0/uKEfqTL0+wJrnq5YsSkJ//o
DSRjEZor8+mYj6rDHLH2AIZRUKA7ddqzZWII693FJ6075iMWW2ptqznPx1ln/uiB
kXD3tuAuOv0fN4J7FJ+pOBWSszVUOIV26CoidHSmWXAKjdrx7HAwuYCgI/TaIgsy
G971rJubdTI0t/G1LOmQh0QvRcqeSiaOjMK8kbF1XGEJcRAOGM2ih8klUCZhDt6r
UyvmHW85UUQly1l4G7vtXa6X0cQ8sckFlwEQz1kjP/i3HAP/qbo=
=Lh1x
-----END PGP SIGNATURE-----

--QSOFuI5CHXQO+dHV--

--===============5609221056577273358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5609221056577273358==--
