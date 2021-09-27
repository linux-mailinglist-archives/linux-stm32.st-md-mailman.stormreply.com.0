Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D77FC419222
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Sep 2021 12:21:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76622C5AB63;
	Mon, 27 Sep 2021 10:21:30 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1065EC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Sep 2021 10:21:28 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id h12so1751124pjj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Sep 2021 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G41HQyC4+WAMCW41WRWgfTs873BjVCWlDt89o58/vJo=;
 b=nBvTmXHxczG2DYg0EHyY/hzUWZIDU3s2oS4w+YfnM+0pIir8EFPTbTo82sCJT8PfjN
 jyamCnBGef6XaxzAhChbONRX7Drov0h3n5mUyw8nfTVLdm3BJGQnvcJx5oSbG0nKJpS7
 cbas5jd76l09vVxaBrm3RRUmdCn/amsS7Ml/stTzMVFsuKqo2A2d7aRT1LKR6EEFQTA7
 NhBknNwmgEf8cgZpDEDY2AwaFU8A5leRTWGWaMBeAaldoTk9qlghzAoKob0iHQzRjOae
 Lyxa4o42bKdxCCcDM5wDkziUcQ+qcruKSKOiSq1k87EUAjRJ542XOrfqtTDELEyLhz0v
 ZZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G41HQyC4+WAMCW41WRWgfTs873BjVCWlDt89o58/vJo=;
 b=eEr9VYeDuoQCfvDJe8zhR+70ZT53Eefu7+UXtG/e6KEY5uUzgM795x5S4h+xoEcaTv
 eVb44atl4EuxBVdYhYruJgq0m6Tu16ndmCNhhakFPa6KZYekrUeXmkySMKT/imhIHbIe
 pcvH2d7LP5HcqkIwtytQdlEBQ5mbRCQkUnF2ZS+DQZrm+997lwMgbM7AF9gnHAH5MK+k
 uE5Os14Y1PAh2bP0sXsfzpZEFkk71ELK93YQDbpEnajTcjQbyITri3HaQMvkFZCVaGze
 iGU5WfA4e9m4fm2OGEXc10xIm+JSkq61ixgvMypBfC+GrRFN1Kt3wJvfAUcDF9tZdzWu
 Kuhg==
X-Gm-Message-State: AOAM531KKPlozLJNj+tSsvoqazlyEsTP+m2HeLL1fmAo19ZFGBIZRiEb
 4bZXikScjpdS9HA9+6jvkMA=
X-Google-Smtp-Source: ABdhPJxK/GBjVs9Jg8V3mVZtN087n4n1ZFvm9LTibJZB6JAYGORREsIdHZXnK4+rdlB/+gNpTqGQaQ==
X-Received: by 2002:a17:902:7783:b0:13d:fee6:8095 with SMTP id
 o3-20020a170902778300b0013dfee68095mr12083247pll.7.1632738087193; 
 Mon, 27 Sep 2021 03:21:27 -0700 (PDT)
Received: from shinobu (113x37x72x25.ap113.ftth.ucom.ne.jp. [113.37.72.25])
 by smtp.gmail.com with ESMTPSA id q18sm16574471pfh.170.2021.09.27.03.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 03:21:26 -0700 (PDT)
Date: Mon, 27 Sep 2021 19:21:17 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YVGbHQnpBTQYm/7/@shinobu>
References: <cover.1630031207.git.vilhelm.gray@gmail.com>
 <422c765c91d060cdebc4f17f7aeb255d9c1a4e16.1630031207.git.vilhelm.gray@gmail.com>
 <20210912171821.54af145b@jic23-huawei> <YUhdyRdzuBtUxOzT@shinobu>
 <20210926161542.5cf99b58@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20210926161542.5cf99b58@jic23-huawei>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v16 07/14] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============0625960025467625345=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0625960025467625345==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H/MVuzPDD/iGErPz"
Content-Disposition: inline


--H/MVuzPDD/iGErPz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 04:15:42PM +0100, Jonathan Cameron wrote:
> On Mon, 20 Sep 2021 19:09:13 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > On Sun, Sep 12, 2021 at 05:18:42PM +0100, Jonathan Cameron wrote:
> > > On Fri, 27 Aug 2021 12:47:51 +0900
> > > William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
> > >  =20
> > > > This patch introduces a character device interface for the Counter
> > > > subsystem. Device data is exposed through standard character device=
 read
> > > > operations. Device data is gathered when a Counter event is pushed =
by
> > > > the respective Counter device driver. Configuration is handled via =
ioctl
> > > > operations on the respective Counter character device node.
> > > >=20
> > > > Cc: David Lechner <david@lechnology.com>
> > > > Cc: Gwendal Grignou <gwendal@chromium.org>
> > > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> > > > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com> =20
> > >=20
> > > Hi William,
> > >=20
> > > Why the bit based lock?  It feels like a mutex_trylock() type approac=
h or
> > > spinlock_trylock() would be a more common solution to this problem.
> > > There is precedence for doing what you have here though so I'm not th=
at
> > > worried about it. =20
> >=20
> > Hi Jonathan,
> >=20
> > We originally used a mutex for this, but Jarkko discovered that this
> > produced a warning because chrdev_lock would be held when returning to
> > user space:
> > https://lore.kernel.org/linux-arm-kernel/YOq19zTsOzKA8v7c@shinobu/T/#m6=
072133d418d598a5f368bb942c945e46cfab9a5
> >=20
> > Following David Lechner's suggestion, I decided to reimplement
> > chrdev_lock as a bitmap using an atomic flag.
>=20
> Ok.  I'm not sure bit lock was quite what was intended (as there is only =
one of them)
> but I suppose it doesn't greatly matter.

It didn't cross my mind before, but would declaring chrdev_lock as an
atomic_t be a more appropriate solution here because we have only one
flag?

William Breathitt Gray

--H/MVuzPDD/iGErPz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmFRmx0ACgkQhvpINdm7
VJIHsxAA4vgQ2N9AG3JBKZ4fdy5G0HIRCQcAbW8p4y0pfsCmeJnK4A5gwyqDpE12
YZRactHayYy1wjbSUfNTV1cToHiN3XI4QXe+VcY8ybHEXHxuUxr9CH9edEXb22YQ
9r3SgyCNgK4f9duQ+gdFxtihSJPgTyQA3v8x2h5aR74AgLh2tLTaFIDS18Tc8/4A
sdp+3CfRTQ5/fxKhACQ9XgHt1qq8chNt9Fxd9UumXNv6x+ppesRx3+mcmP/SEtAd
Zx7TIRc837fgv6lWrY2x8EEkJXcOgMdJDAhTyHNZTG6/FqxZf9X83T0GekBFufz2
p1HjBNxHQNxwMG9A8MDT2vTH7AqBoWWeatmYnW43uPC38ADX3x/hsNBPOp3zoKPR
MjQIq2dJbVUAf5QOjpLxHYQYBw8tC668Bc76n7ut321CIVvv4/TVsqKpLN6zWnTW
bPhqMuzM3fNyMC9+q5tdHefns3yVBHWS10xoneRGYE/h7LrF8qjrFsL/ZVnrT8IB
RefwoLUEXS4+3Gt7pygyzLOuJE/ZciRUGzT5//UAP/D2hMp4oU5VxVCL7pQSMwVE
dLbp6+DbAZMMpNs87fNMUloxN4sRcwttunlaBChWslme1+0flWpfgFyMIbJI9fi8
31xRbk8ixMsFInEmjC9tNeD45FvMVNg8MoPUPtu8ZbzTvimD6Sw=
=Tugq
-----END PGP SIGNATURE-----

--H/MVuzPDD/iGErPz--

--===============0625960025467625345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0625960025467625345==--
