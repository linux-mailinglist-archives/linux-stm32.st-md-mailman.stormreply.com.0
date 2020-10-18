Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5329186D
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Oct 2020 18:58:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF839C3FAE3;
	Sun, 18 Oct 2020 16:58:28 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB96FC3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 16:58:26 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id b11so1914967qvr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HJanRkOnYDRWWUUxMT+SX3xeE/WoWNZDclqoOIIZ6ik=;
 b=fvbVbd6bP0z7Vuuq+jqTEeUxxfKwXFaectxEGgR9FBXrWbQRPTqxDDp12hv7pyjgny
 pVkvJW2CkducvZ6zcT1Qg0RHQcsGRQ0FhijtX46wCeavXfhFRtyCnOyLjRs5MWQ9WPvQ
 gg5G9PlVyumf0QRB680kMp51sPQ6IHY4uqL2GYT6DCGRgnVz0RzxExcK+XR6LftDCd0U
 YJFevQR8R/XSy5mGZ+5t5z5pBJ23cZlNqC/oAw11/HkRs75AFqDH8WxVaKZqsErwqASc
 TwBvFGoV/fp1AX7pspMG1+psZXZFyGFkHafZmjY71NNHWOOGsyPr7xn5psISVrrjxveJ
 xJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HJanRkOnYDRWWUUxMT+SX3xeE/WoWNZDclqoOIIZ6ik=;
 b=iQY9ndOBbnOyTJZjgb5EptQgD3zwPupYo0NefDkWsDcMbm/HF7xFoThk92WK7VUvdJ
 glQcmt7B1zYXv0DSsutwJ7KQZQ2c5HTGTgnt9YmcjoLOddv2RaOOm+Zi187yguflqWbO
 6Hf2eFSFqk4qz9EDQBo/2mdKqANJOMwJJMBUAal3qd7720UWZ9LRX2yp9JywG+x5NIWm
 YWMbIIm8lQnz5doqIbkQOo3LMVoMIt2VlvezHik372hdB5rBzP8iqyz4Z5tia6CbpG+G
 zZbtjYwg7rL72qLffXmtqH1F2Ol3iyikJrpyrmrEX9ixny3oG9INIUiLxl5qCXDIUzAd
 /XJA==
X-Gm-Message-State: AOAM530uyqYaww6fKJVA8gQ8qETmDhSR60z5hhiDLEjNC9cJEUZDhyfE
 LW4S7OcHEthng40mRdtsKXU=
X-Google-Smtp-Source: ABdhPJxjcZwbX9ypE+uUB13PJDlMX4ZiI7bkB4E/9sDUMmaq7Hljo6yZcmPmqM5wbZ5FOb82iKUy0w==
X-Received: by 2002:ad4:43e5:: with SMTP id f5mr13696233qvu.12.1603040305761; 
 Sun, 18 Oct 2020 09:58:25 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id g5sm3325325qto.39.2020.10.18.09.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 09:58:24 -0700 (PDT)
Date: Sun, 18 Oct 2020 12:58:22 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201018165822.GE231549@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <00be1fccc672c5207f3b04fe4cc09c29e22641f4.1601170670.git.vilhelm.gray@gmail.com>
 <cc1f7e4d-18d1-bc28-8ce3-e3edcd91bcab@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <cc1f7e4d-18d1-bc28-8ce3-e3edcd91bcab@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 3/5] counter: Add character device
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
Content-Type: multipart/mixed; boundary="===============2636203982808741498=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2636203982808741498==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 05:40:44PM -0500, David Lechner wrote:
> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> > +static ssize_t counter_chrdev_read(struct file *filp, char __user *buf,
> > +				   size_t len, loff_t *f_ps)
> > +{
> > +	struct counter_device *const counter =3D filp->private_data;
> > +	int err;
> > +	unsigned long flags;
> > +	unsigned int copied;
> > +
> > +	if (len < sizeof(struct counter_event))
> > +		return -EINVAL;
> > +
> > +	do {
> > +		if (kfifo_is_empty(&counter->events)) {
> > +			if (filp->f_flags & O_NONBLOCK)
> > +				return -EAGAIN;
> > +
> > +			err =3D wait_event_interruptible(counter->events_wait,
> > +					!kfifo_is_empty(&counter->events));
> > +			if (err)
> > +				return err;
> > +		}
> > +
> > +		raw_spin_lock_irqsave(&counter->events_lock, flags);
> > +		err =3D kfifo_to_user(&counter->events, buf, len, &copied);
> > +		raw_spin_unlock_irqrestore(&counter->events_lock, flags);
> > +		if (err)
> > +			return err;
> > +	} while (!copied);
> > +
> > +	return copied;
> > +}
>=20
> All other uses of kfifo_to_user() I saw use a mutex instead of spin
> lock. I don't see a reason for disabling interrupts here.

The Counter character device interface is special in this case because
counter->events could be accessed from an interrupt context. This is
possible if counter_push_event() is called for an interrupt (as is the
case for the 104_quad_8 driver). In this case, we can't use mutex
because we can't sleep in an interrupt context, so our only option is to
use spin lock.

William Breathitt Gray

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+MdC4ACgkQhvpINdm7
VJKtZA/+NKz/zDPUYG1k3eRF+qrTFSszN6ZaQVFDVW2dNUUxCvZtcCZ8x2hZx/n9
1hWhczCgYYpeYM6ahWC+JRwebm1vUqc/U3KbKRXVpJVg4dot5+A9jqiXtevPA99D
RctZMaJLJ/1UGh2R4Pkiew5YtStfcqMlblDrIBCZiwCEY5mIs+6kR0CgaQUwG/sx
M777scU4ixIM+o5m6XJoLkgh9Lv89KnESESl/XBBYXfcN7zYBXtEcmf4ixQhuO+Y
ehpfmgpCcuBhrOVYjqzDN4h+dopSUVpI8QzTTe9Rpu8FgpoONnPm9O5cpD2rFvlL
AVCEi9U+OCkiWvh5WozChmBVSkvnzRgQe6y2silU47bGfFumj9LSgb/QMLKNCXpz
VgI4psvFiUPq17+PMXeNUH3+1v5FEaVjOQ1gBgl1Er9KPP2u9ixifrTkkssBzFAI
luF4Z0nsEkK+ezF5oDT1IlSIZILChd8Lb2IGkXSebNQ/SQ2bAom+QNd8Spo1tIJR
C2inE32wpPyUniISW+Hl6rxjM/uUKYiUh6WPjYx98u4tCrcHkBtZ5N3Pq59HrS5s
tD6kyEScmGR+R/x6uvkdkgxSRSScFItkDFI8fo6765W3Fb7GAK9B8Clt//SMxgct
NJDo7dKl/bsALJyLe2s/bHJNteD0o5S0jlU8fedIrB819/lqF54=
=oUCr
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--

--===============2636203982808741498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2636203982808741498==--
