Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D92A03C341D
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jul 2021 12:25:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78F95C57B60;
	Sat, 10 Jul 2021 10:25:14 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07BC1C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 10:25:11 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id v13so6362464ple.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 03:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=s3K7cyJqM4WJugi4DmW1RD2TxhgR0DsWB9WQsLATqDc=;
 b=ZGFHnsYRUwQe5Ay7MfHDsNZfSvN/VTHWfQ94xs6Wozy8q0UU39EFODLjxHxUrTz222
 HUrJqsvW3W9qzqDnWuCfiliQDTFpLZEbJRf5bKPMIeVu/QcGXV1ymctouEv/Tug16M6+
 UupJ7OpN4uMc9u6BmXzWoPoi7X+F3mZ+tMxi307Z5Tkq0iDgcOwou7U2862lBK2tN4DD
 8WVObLr7uUQ8p2qrHT54mE5mSb/EbjBWIDGgyXvsrD7XvL3CA0OeauuDXIXkRmzUOHq5
 d51kBTWHsClyLimYIMhpUcg3WAXVhRflMfDPZqodE3RL3335wad2vTsnd/Hr5txTY586
 rWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s3K7cyJqM4WJugi4DmW1RD2TxhgR0DsWB9WQsLATqDc=;
 b=s9swAS/8UkrTEJ009lgLRaCnnsoLa/EMRE+6KOZ3I7zf8bojQRUId4z+I9uR75nqMp
 VOv9R+1ddhc3ZtD1u7g/FQUDjwAYplgGxK4Wm6z2BHhlC56TOHxadlzsKP8RdviF8/JI
 1Hr4CNN1sUC1GKf0oKvZ/6n6sdqUE/oyZDi93ESz8QS4oDGmA7iG8gBXSW/HRF7TMFWp
 3TrY5FvHdBZe8cdrIUAA9XmxBMFBelaOrgwkLRf03k538uxK2E93yXlzKZFYNcHrJwGd
 dnehbda1+75gs9j+H1O/L7l9KaagXmg/+ycZNkVmitXcdL5eWMCFcJaYwNec3wv3w3gC
 lzug==
X-Gm-Message-State: AOAM530Re7odE/zCwOmy4BLxP68wWXLE5vnByhSjDz3bzuyVZL8oaZ7f
 geKtmQkW93wWhxVpuKCgiOo=
X-Google-Smtp-Source: ABdhPJxhut2gmoBN83bbMurV/qFa/FqRd+/9jUgBNIuzHsCcfe8rBuc7cj1+VcYwB0vmpv3WahbU/A==
X-Received: by 2002:a17:902:a983:b029:129:c270:9222 with SMTP id
 bh3-20020a170902a983b0290129c2709222mr17267265plb.78.1625912710273; 
 Sat, 10 Jul 2021 03:25:10 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id g3sm15258021pjl.17.2021.07.10.03.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 03:25:09 -0700 (PDT)
Date: Sat, 10 Jul 2021 19:25:02 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <YOl1frCrophjhk7y@shinobu>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <e298043c880b350a42bdc40452376a3708bf533b.1625471640.git.vilhelm.gray@gmail.com>
 <1a624011-0b43-ac42-be53-a42f81923e5a@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1a624011-0b43-ac42-be53-a42f81923e5a@linux.intel.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
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
Content-Type: multipart/mixed; boundary="===============0084730977653583924=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0084730977653583924==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/692ujiEW8lbLS+a"
Content-Disposition: inline


--/692ujiEW8lbLS+a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 02:40:13PM +0300, Jarkko Nikula wrote:
> Hi
>=20
> On 7/5/21 11:19 AM, William Breathitt Gray wrote:
> > The events_queue_size sysfs attribute provides a way for users to
> > dynamically configure the Counter events queue size for the Counter
> > character device interface. The size is in number of struct
> > counter_event data structures. The number of elements will be rounded-up
> > to a power of 2 due to a requirement of the kfifo_alloc function called
> > during reallocation of the queue.
> >=20
> ...
> > diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter=
-chrdev.c
> > index 92805b1f65b8..13644c87d02a 100644
> > --- a/drivers/counter/counter-chrdev.c
> > +++ b/drivers/counter/counter-chrdev.c
> > @@ -323,6 +323,9 @@ static int counter_chrdev_open(struct inode *inode,=
 struct file *filp)
> >   							    typeof(*counter),
> >   							    chrdev);
> >  =20
> > +	if (!mutex_trylock(&counter->chrdev_lock))
> > +		return -EBUSY;
> > +
> >   	get_device(&counter->dev);
> >   	filp->private_data =3D counter;
> >  =20
> > @@ -339,6 +342,7 @@ static int counter_chrdev_release(struct inode *ino=
de, struct file *filp)
> >   		return err;
> >  =20
> >   	put_device(&counter->dev);
> > +	mutex_unlock(&counter->chrdev_lock);
> >  =20
> >   	return 0;
> >   }
>=20
> I got two separate mutex warnings from counter_chrdev_open() by doing=20
> blind "cat /dev/counter0". First one due mutex being uninitialized:
>=20
> [  441.057342] DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> [  441.057355] WARNING: CPU: 2 PID: 366 at kernel/locking/mutex.c:1416=20
> mutex_trylock+0xf2/0x130
> ...
> [  441.217331] Call Trace:
> [  441.220062]  counter_chrdev_open+0x21/0x60 [counter]
> ...
>=20
> which I fixed trivially by (please be free to use it)
>=20
> --- a/drivers/counter/counter-chrdev.c
> +++ b/drivers/counter/counter-chrdev.c
> @@ -364,6 +364,7 @@ int counter_chrdev_add(struct counter_device *const=
=20
> counter)
>          spin_lock_init(&counter->events_list_lock);
>          init_waitqueue_head(&counter->events_wait);
>          mutex_init(&counter->events_lock);
> +       mutex_init(&counter->chrdev_lock);
>=20
>          /* Initialize character device */
>          cdev_init(&counter->chrdev, &counter_fops);

Thanks, I'll add this line in.

> and after that
>=20
> [   16.564403] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> [   16.570725] WARNING: lock held when returning to user space!
> [   16.577044] 5.13.0-next-20210706+ #4 Not tainted
> [   16.582198] ------------------------------------------------
> [   16.588507] cat/331 is leaving the kernel with locks still held!
> [   16.595214] 1 lock held by cat/331:
> [   16.599103]  #0: ffff888102bb3630=20
> (&counter->chrdev_lock){+.+.}-{3:3}, at: counter_chrdev_open+0x21/0x60=20
> [counter]
>=20
> Jarkko

I'm not sure how to resolve this warning. The purpose of this lock is to
limit chrdev to a single open at a time. To accomplish this I grab this
lock in counter_chrdev_open() and hold it until counter_chrdev_release()
is called. Is there a better way to accomplish this?

William Breathitt Gray

--/692ujiEW8lbLS+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDpdX4ACgkQhvpINdm7
VJKdXg/+OTmIvRWcp6QRPVGTj4u5tXyU4dpSBNvwJhze9Dtx5IstS63x3eqVCdx9
pnzK7cfLGkCjzUS3tzjbYH/qebQ83C0awJeACn44zELCH0afP3jpN0Ewz6rYAAkn
IPNiUKtgebR8nADn5x5QiFnk0EA8SNAs6SvqDsO8NntuRmLEKgWTTOLGVLhntqaM
kOzwcjjyuv68CGvT8tc85ahJJ+7AaCSBLKBgOvPRid1GXOyX3LhN+GLVJGUbA+BG
HxpDBQ3rNEsIy0B8/v+XnlEscZM98BhhuLOPxpvoxZC/t1DWBMTqtfFLHM3v/qjx
aAupXfSmlYEidyspSWUzDHMKGWgpnMYmXd/X4fkFJy8BS/9aW+gr8emzdt/mVeuL
qz3MdcRD8+5DbBFTHH4jl/y/kaeZ9ztvnBG6Z3kGrnKkWWSDS+Ppu8R2YfuMvrtT
R3+c15C/QIc12pbpFx6OwJu9AssyYDWkQbgodIL8AUWU7F8lKXdB6n8arjuzHeYm
v4yQWQIPJ6Uv3g1Xt/KW71EEXQsHQJscC/NJU5VsKV2vxpiZLlyY1pQYz23wRVJB
iJ1OhTONcWwexJc3VLTv7yW1DTtesAnQHSOIHsRsWCDQJlZfVDgOg9koj0x89v1L
cGPfwuf8U9Nvq8sig2UMKqcoKuq2Js6gHZmV3DL8LF9PG4OGpwA=
=bdED
-----END PGP SIGNATURE-----

--/692ujiEW8lbLS+a--

--===============0084730977653583924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0084730977653583924==--
