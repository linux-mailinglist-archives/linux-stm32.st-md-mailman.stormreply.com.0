Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDE2982F6
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Oct 2020 18:53:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4C90C35E3C;
	Sun, 25 Oct 2020 17:53:41 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 482F9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Oct 2020 17:53:39 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h12so5145065qtu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Oct 2020 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WnvTU6VDuLEf+Rt2Zn1Gdt5ZWfNTNLLVWS72IF0h6Yk=;
 b=PqE+NIkCpidtvg9ccnzTZ8R6ZKaslUFa6jUfX78jzuqP4FeCXm1ehopZIeOpEIGvfV
 zUwuE0941wfby2vncTggj2xmv+C0VoORDdNOy4uXuo6t84MB+9Jla4/6B2D3nBcAmUlC
 aGa8wseNCWKTJIvsysxLs50d+eJ1g55WHEfTD7j9cwtlAf88IIkv6OPx1cr9xuFcHk+b
 5mSZhYaceFpLEH7rkUNZgE5+zS/aHWq0j4XV3a8tEOAtltuqSLK1g4N62B+dBd1H+EAK
 Mi0g35eg6z2LdugxurSJut//sA73JpywiRfozrHFzOXvzEr3jekwqHflohiZowC6/zua
 ofvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WnvTU6VDuLEf+Rt2Zn1Gdt5ZWfNTNLLVWS72IF0h6Yk=;
 b=UuEeAlANxfo/7zVONEFIhKGB8d9e3KUSjzZ4yQ+ja4bjeO0PvFT8XLPIThvBABBH6p
 c57cdsfwH4vACevNQEZA64Nu7BHvSzyZO4MrHcFAzIz1+f7LofKVygPTWOo1+JFGiDLz
 dL0ke6qt2s4e98KF6H5MWmkyQ9XkIFyXcfHFc+EUiIBXFUIq2ghRREZXu6Lar1hq75kn
 NApD4t1VXGxrf9PUOwFl+HD5Tk4jLy1+EfngALGkPgz19X5/HkT7sXS+AgLtFjRfZ2vu
 MHa2+kGBiUDT0K4gzjNmaw09tklv7kdtGXZ940NTXRfVunFW5bkIcoXfj0E0EeUxOt0h
 9/+g==
X-Gm-Message-State: AOAM532xy7e2B9r29ac65iB+8ipPHmnCnqSi1LNq5NsGSV4hWQGuZETA
 bPpwHSVSAzd3fulir2WPU2c=
X-Google-Smtp-Source: ABdhPJzNvr9/llgZ98dNMu3rcpa5WW5aUblpGe3+LAoh76G4bw+2TtSIZwfILvnr82QMbJLFomHv6A==
X-Received: by 2002:ac8:7c97:: with SMTP id y23mr13455309qtv.48.1603648418004; 
 Sun, 25 Oct 2020 10:53:38 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id k64sm4949218qkc.97.2020.10.25.10.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 10:53:36 -0700 (PDT)
Date: Sun, 25 Oct 2020 13:53:22 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201025175322.GA14219@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <00be1fccc672c5207f3b04fe4cc09c29e22641f4.1601170670.git.vilhelm.gray@gmail.com>
 <cc1f7e4d-18d1-bc28-8ce3-e3edcd91bcab@lechnology.com>
 <20201018165822.GE231549@shinobu>
 <f2bac8b2-108d-fa4c-cb63-8ff85ce04d1f@lechnology.com>
 <20201025131809.GB3458@shinobu>
 <e0b7989f-6a99-0fae-471c-8d06c8e951b0@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <e0b7989f-6a99-0fae-471c-8d06c8e951b0@lechnology.com>
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
Content-Type: multipart/mixed; boundary="===============0595176671579809188=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0595176671579809188==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2020 at 11:34:43AM -0500, David Lechner wrote:
> On 10/25/20 8:18 AM, William Breathitt Gray wrote:
> > On Tue, Oct 20, 2020 at 11:06:42AM -0500, David Lechner wrote:
> >> On 10/18/20 11:58 AM, William Breathitt Gray wrote:
> >>> On Wed, Oct 14, 2020 at 05:40:44PM -0500, David Lechner wrote:
> >>>> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> >>>>> +static ssize_t counter_chrdev_read(struct file *filp, char __user =
*buf,
> >>>>> +				   size_t len, loff_t *f_ps)
> >>>>> +{
> >>>>> +	struct counter_device *const counter =3D filp->private_data;
> >>>>> +	int err;
> >>>>> +	unsigned long flags;
> >>>>> +	unsigned int copied;
> >>>>> +
> >>>>> +	if (len < sizeof(struct counter_event))
> >>>>> +		return -EINVAL;
> >>>>> +
> >>>>> +	do {
> >>>>> +		if (kfifo_is_empty(&counter->events)) {
> >>>>> +			if (filp->f_flags & O_NONBLOCK)
> >>>>> +				return -EAGAIN;
> >>>>> +
> >>>>> +			err =3D wait_event_interruptible(counter->events_wait,
> >>>>> +					!kfifo_is_empty(&counter->events));
> >>>>> +			if (err)
> >>>>> +				return err;
> >>>>> +		}
> >>>>> +
> >>>>> +		raw_spin_lock_irqsave(&counter->events_lock, flags);
> >>>>> +		err =3D kfifo_to_user(&counter->events, buf, len, &copied);
> >>>>> +		raw_spin_unlock_irqrestore(&counter->events_lock, flags);
> >>>>> +		if (err)
> >>>>> +			return err;
> >>>>> +	} while (!copied);
> >>>>> +
> >>>>> +	return copied;
> >>>>> +}
> >>>>
> >>>> All other uses of kfifo_to_user() I saw use a mutex instead of spin
> >>>> lock. I don't see a reason for disabling interrupts here.
> >>>
> >>> The Counter character device interface is special in this case because
> >>> counter->events could be accessed from an interrupt context. This is
> >>> possible if counter_push_event() is called for an interrupt (as is the
> >>> case for the 104_quad_8 driver). In this case, we can't use mutex
> >>> because we can't sleep in an interrupt context, so our only option is=
 to
> >>> use spin lock.
> >>>
> >>
> >>
> >> The way I understand it, locking is only needed for concurrent readers
> >> and locking between reader and writer is not needed.
> >=20
> > You're right, it does say in the kfifo.h comments that with only one
> > concurrent reader and one current write, we don't need extra locking to
> > use these macros. Because we only have one kfifo_to_user() operating on
> > counter->events, does that mean we don't need locking at all here for
> > the counter_chrdev_read() function?
> >=20
> > William Breathitt Gray
> >=20
>=20
> Even if we have the policy that only one file handle to the chrdev
> can be open at a time, it is still possible that the it could be
> read from multiple threads. So it I think it makes sense to keep
> it just to be safe.

All right, I'll keep the locks in the code for now to keep it safe in
case we have multiple threads reading.

William Breathitt Gray

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+Vu3IACgkQhvpINdm7
VJL6Gg/+Mlx2N3lg0kRzevbHYdReGI0UFjEyLqM3u6BmeS5zhbkHY+/QYF9Ak2Th
AEe1tI0KJ3KrTiPRH8oEkbZ5f1eY58AovHPYByxzOBMDHx9Z2PUtRmdDF9jqU1mA
kw0x/SMHc/Rznkzu44VHl1vLTRxpPDJ3a91PmuKEe5prF0BufeCh+4WdMpwQq1yH
RmeaXWg5aKjQtIpjVFivkLjp5sBlP2dh51r34bEd1LA9wQ1FcSdoDe3Jxwwt8Wnx
wySRy7nh/RIDp0CkgxdtJfNgSskJ+m/5/bVWCIqKcRkVJCApndX5N02c7C0573so
biLq7YKWbF27KjMIyl22XwPxdhBW0CfN+nXGDM0rv8WtzE2qqtEbRe1t3oYGfMZK
6CtXjDL03JyGVIaZCT8XyeAkHhUJM5gxGKygfCRq+O1ftVdzsnDtlhxnmm4Wtn44
YKJvjN2Na66BN1jObZZvfaCSU+iaBqNapkcImB1BHGo6uiAjo/u63ZZNYDABvbbK
corwSbj3kgu3kHXgnX9u6sR2pSMZeqcGT+uBNXt3F8tPkDd7UwSNjKswADQrY5GN
bNIeee2fI5kmxdqitRPqCYSM4OgB4P/WsI7KgLcLsbH3uFRpb2rIIHGRgdfnWCc5
t/T9hQH0gczN1Beuyj+8MPM657zoQojz9l39rY1XA9dJ5iXhZuM=
=gnpW
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

--===============0595176671579809188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0595176671579809188==--
