Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7CF319737
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Feb 2021 00:56:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A21AC57B57;
	Thu, 11 Feb 2021 23:56:20 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DFFDC57B52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 23:56:16 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d3so5533905qtr.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Feb 2021 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Fn9ECLUi2tPSHi7X9/WE7UqWMZvrqWVcR0Z02vtxJFM=;
 b=REJNTNOWdXeu6f7LaWhf4cwIC55Mp0Qq8gBt7jCVoL6KCO1/EAgCoGXxCqBOqz0R7n
 ZGIOkeZwLsQiEcXJN2Mjl9w/ExaghyhnqMXFeteGj0ofoZc9cl0dBp/HPLIuA0aITzZp
 NhR175zCa86KTLhRczWqtxri9/wYrpL7n8PRcor6nF2/BlN7BPqG1ifNJnDSNEWI/NKw
 AWIfMLGk9ZbaEFUXj6jhTCoHD8zQ/Q+VyM53pYwVRHTpYUUOj72MMNQluSvV8JIif/HR
 FpWiVfomx1VKHmtNFqAOoClRumweAZLsUn4VsRl4Gt+VQkhkKM+F3FGHuexGnjTrdSGh
 PhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fn9ECLUi2tPSHi7X9/WE7UqWMZvrqWVcR0Z02vtxJFM=;
 b=kPLYzIKbwY8D88k3z3lMzTRtTU215RcQk2Hd8JGmG619OgkkM7BZzNKXqULhHlMJyh
 Ks/NqbKs/7LMEtztYhVwLXQaihDrIEghuagfg3wLWYOsmuEaMnXfIk/zGeLPfcKbojvY
 tcBE6AxJa6Ot9YZv3CGsAjW8LWgKTZFzSF2UEC8Il7CoEcMlApR/cuvM84UrO8sbSvu8
 ilyoUjHsAP9FO9rvvVOEb8e5mhNvGQdX/vEao7E7ZHXXTym9nLJo9zMyJ+qvApEgQP/V
 v4fliZ0fmxJGonTBmVWMdSP5HfaKcdMOYAKuMFH+BX7QiC8+v99xsuvAFdD3Y5QoPrG+
 eF7A==
X-Gm-Message-State: AOAM530aa9q3UxHsDeQzJDSBrOyLjxZPCSb2EBUaNvZ2AOaKs/wqjgeI
 vPrkQ+vygGL3dxNfsL0/I5o=
X-Google-Smtp-Source: ABdhPJyuiD3jKQsR4lp7R1jCbPxoM1hsEvSszFs2HWKuwJSZ2Og5Sp0UmJRyNNsX1qJjFZf+0wYnTg==
X-Received: by 2002:ac8:498e:: with SMTP id f14mr215580qtq.286.1613087775410; 
 Thu, 11 Feb 2021 15:56:15 -0800 (PST)
Received: from shinobu ([193.27.12.132])
 by smtp.gmail.com with ESMTPSA id l66sm5143121qkd.21.2021.02.11.15.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 15:56:14 -0800 (PST)
Date: Fri, 12 Feb 2021 08:56:04 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <YCXEFMJOoOhyhfBu@shinobu>
References: <cover.1608935587.git.vilhelm.gray@gmail.com>
 <bb2db54669ef27515da4d5f235c52e0b484b5820.1608935587.git.vilhelm.gray@gmail.com>
 <7a78ad95-9eba-277d-25da-ddf68357b969@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <7a78ad95-9eba-277d-25da-ddf68357b969@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v7 5/5] counter: 104-quad-8: Add IRQ
 support for the ACCES 104-QUAD-8
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
Content-Type: multipart/mixed; boundary="===============0337982217160188162=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0337982217160188162==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7kKPpmXtdPwRZVn"
Content-Disposition: inline


--p7kKPpmXtdPwRZVn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 11:36:45AM -0600, David Lechner wrote:
> On 12/25/20 6:15 PM, William Breathitt Gray wrote:
>=20
> > diff --git a/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8 b/D=
ocumentation/ABI/testing/sysfs-bus-counter-104-quad-8
> > index eac32180c40d..0ecba24d43aa 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
> > +++ b/Documentation/ABI/testing/sysfs-bus-counter-104-quad-8
> > @@ -1,3 +1,28 @@
> > +What:		/sys/bus/counter/devices/counterX/countY/irq_trigger
>=20
> Do we really need this sysfs attribute? Shouldn't interrupts be configured
> _only_ by the chrdev interface?

I think this attribute can go away because we can implicitly figure out
the correct IRQ configuration from the struct counter_watch data when a
user executes a COUNTER_ADD_WATCH_IOCTL ioctl command.

However, I need some help deciding on an appropriate behavior for
conflicting counter_watch configurations. Let me give some context
first.

The 104-QUAD-8 features 8 channels (essentially 8 independent physical
counters on the device). Each channel can independently issue an event,
but any particular channel can only be set to a single kind of event
(COUNTER_EVENT_INDEX, COUNTER_EVENT_OVERFLOW, etc.).

The purpose of the irq_trigger sysfs attribute I introduced in this
patch is to allow the user to select the event configuration they want
for a particular channel. We can theoretically figure this out
implicitly from the struct counter_watch request, so this sysfs
attribute may not be necessary.

However, how do we handle the case where a user executes two
COUNTER_ADD_WATCH_IOCTL ioctl commands for the same channel but with
different event selections? I'm considering three possible behaviors:

* Fail the second ioctl call; event selection of the first struct
  counter_watch takes precedence and thus second is incompatible.
* Issue a dev_warn() indicating that the second struct counter_watch
  event selection will now be the event configuration for that channel.
* Don't notify the user, just silently reconfigure for the second struct
  counter_watch event selection.

I'm suspecting the first behavior I listed here (ioctl returning failed)
is the most appropriate as a user is explicitly made known of this
particular device's inability to support more than one type of event per
channel.

What do you think?

William Breathitt Gray

--p7kKPpmXtdPwRZVn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmAlxAMACgkQhvpINdm7
VJJejBAAzJHKhvvQx5+lsNzKsvoLOZi+R4kk9Amkh2HH90O+UyagdXEHac++XOto
K9fWenvVvr9x4XVCxB62Z65YkRnQDNdWdrZ7WLNkk1L5a/RL7ePJiozsjuaWAXVQ
j6/uKv7ho45A5d5vQsdhdwBxfwNIRDQDqYqrLo8NYsl9ScBGQ1Wq1cYDWKG1HGuJ
Is72OgyL3Mf2U5JSHIv/jk5Ox9YMLnJwr8XSQCZKldS42ieddRxd7vyxYJ4ePr9m
Z/jhjczp0TVuXw7Ika0G1IreRwEfxWHqNJ9mtqFRbRzxLblcHqmMLcrNG4AUIMWN
doEozsnwAIldaAxDljw2f6ZPQ7b8hd0PK8bieb901oNvEFf7kv8G1cOwfsuHvzYs
GH/08NBtwvAk0RFiNQhrm6OowZmgUO2KAjWr9PQdXXOjit+1mgsvW1BdBEjO0i3D
DPDkb+I+ZrnB5VeRxqudTGakFmuE6YXGM2ubxtSx1otNi7TdZKJhsEUU9JzUkf1J
/BmOikFg/8yv/YoodDqCzymjOgxqUWSriQSIretaHz+rQR3/PD5xbqVnTe3pMUiR
LRUVcwil/5DIZV0NdHqzbip3DK2OIzoQjHp2sIH+evT5Z0XtWiSgiZAs1lX9vuT3
5KpsAcytNu5TUzaXnMZ9tAzAWZ3X0TQk4zc9KD+U3XdymZz97ys=
=O8ar
-----END PGP SIGNATURE-----

--p7kKPpmXtdPwRZVn--

--===============0337982217160188162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0337982217160188162==--
