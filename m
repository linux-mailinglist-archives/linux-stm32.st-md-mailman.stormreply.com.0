Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F9331C54D
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Feb 2021 03:16:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97E7AC5718D;
	Tue, 16 Feb 2021 02:16:13 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D640C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Feb 2021 02:16:12 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id a4so3716142pgc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Feb 2021 18:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lb/pFWHszNknFvlysVhnuzVrA5hrw2/iv1f49uuCHHc=;
 b=JI8bTZ/ZGvq50e31unyKdwZwCoOB4y8l9dgZK/MuqjfNS6yi/nhSsRotwpkjqroAOQ
 7ZizadhCd0etnXIkksrH6rBq1MPC5tg8tKoHMMHhha1LV6RDNUSxMocBxKX+6yCBlB9i
 CF2WblOFfA4PuN39N3WBdcIJX4KtMTduaEG6IXYuRwMeZRSmjGcIlDaA+PVs1qZ8DFOX
 F05hvCPi8IwGPxfPLvPw+juA884nIzZhOfS+Ha+VGwQa4X0cyPhF9Eqs5rt4f9VawxwV
 1FGYJoJilbIXAYyAAbgXEpC2arpzt44bEoS6FWlXno5q/jhS+2VjSfeBfgP10ihDRUt9
 MeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lb/pFWHszNknFvlysVhnuzVrA5hrw2/iv1f49uuCHHc=;
 b=dDdz1Uw8i485l2dYq/akaYV5Y+2E8XpdBW97tHGFhh7/Uo3nIJ0h7gWZLy9LoiEHps
 D0QyUgyCXfGDnjrTJyBdSry15w921YVVci8iGtLnT3Nx1lGCSGzXgdZcKY7cmyszV0sM
 W3nxuXfEMFOjPzyZ/TODKK2r0P1AujyvJpd7qTn1w23BBLvlfgvRUY+oxwYPTKuXSP9q
 Q73zjsXUlv2hb3kjeIo+ikSue5rOybXfVsd2xuWQBnOrv8onixegRRphWD1n03tek3mT
 vVew4JVjA3vKvenTCmyQgc5+5azVLFKsQ/F+DITPb3b6hbx9Ry+o6boeXpM9GGg5KEiH
 duYw==
X-Gm-Message-State: AOAM5332kze96flpYsSeP10gaJC76f0bZmh2IeFSQOeJWlDqvcr37zAz
 O/lDmOLTiL7vVVpiyuKke5E=
X-Google-Smtp-Source: ABdhPJzp7SNhYqSVr36CPjTlOyyOihZNlM6Knf+LNC3ReY54DeKBGRIElDZZIw4HLFNecR6kVUhd0g==
X-Received: by 2002:a62:c719:0:b029:1ec:c587:3c5a with SMTP id
 w25-20020a62c7190000b02901ecc5873c5amr1320838pfg.27.1613441770889; 
 Mon, 15 Feb 2021 18:16:10 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id b17sm18608375pfl.190.2021.02.15.18.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 18:16:10 -0800 (PST)
Date: Tue, 16 Feb 2021 11:16:03 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YCsq42hXqdRWrSEd@shinobu>
References: <cover.1613131238.git.vilhelm.gray@gmail.com>
 <d2e72eac404ca5b7c99d8a642f2c07ebb2eb240a.1613131238.git.vilhelm.gray@gmail.com>
 <20210214181946.1d2f7e78@archlinux>
MIME-Version: 1.0
In-Reply-To: <20210214181946.1d2f7e78@archlinux>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v8 21/22] counter: 104-quad-8: Replace
	mutex with spinlock
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
Content-Type: multipart/mixed; boundary="===============0478926268899087327=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0478926268899087327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HfLQjWKfp3+aIQDU"
Content-Disposition: inline


--HfLQjWKfp3+aIQDU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 14, 2021 at 06:19:46PM +0000, Jonathan Cameron wrote:
> On Fri, 12 Feb 2021 21:13:45 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > This patch replaces the mutex I/O lock with a spinlock. This is in
> > preparation for a subsequent patch adding IRQ support for 104-QUAD-8
> > devices; we can't sleep in an interrupt context, so we'll need to use a
> > spinlock instead.
> >=20
> > Cc: Syed Nayyar Waris <syednwaris@gmail.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>=20
> Why do these need to be raw_spin_locks?
> Normally only need to do that if in code related to interrupt chips etc,
> not their use.
>=20
> Jonathan

This lock can be taken in an interrupt context in a subsequent patch:
counter_push_event() called by quad8_irq_handler() can end up calling
the Counter component callbacks which take this lock. We can't use a
mutex nor a regular spinlock because those can sleep on RT setups [1]
which would result in a deadlock due to the interrupt context here -- so
therefore we're left with using raw_spin_lock.

[1] https://lwn.net/Articles/367219/

William Breathitt Gray

--HfLQjWKfp3+aIQDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmArKuMACgkQhvpINdm7
VJKp3BAAlS2Vs6gAvh5SArki6q5IaQsXcy9P9ApPJpGXN1aw41Ww/OOyJ8HutGNE
jzKXcr4QxWrtrHBeM4S9hz9R4Wo3M+LbGSu8HUz/MY5DyGGglcI6PAb5LDoQS7vQ
4/N1ymMuu5Pmht/uA4ZWA6ZeU54Y0Dor+IXmit1BPBwo7ooYctbNvh+vdoNlZSxg
0sWQPD9m95Vd3FwCuhQ4vzyZXy/FEr5PFiyy0fwa+5Wndof9DbA+5VYcrRBZdB7v
a1xiIT8B+0eq7eElaAYM3clZdJwF9utTYMi6oqkrZCU6iMYLZD+W0BhyOcxA4LTO
s7KjhqBwS7sDObxEx0JD5OHh+mGU8h7QzZ3hF9o2git8cL3Y22bKMMamTnJRGWay
vlU5B7KF8l6Rg8Hf8cfspWC6cwp0iXhA/fNCIjxVDikQr/GxqdkMDHvIxzz7KID5
YCWz1UCBRxOe9hBOBPSa7p/QbPKnk2DFP3RSgwEknaRZag0/6PO4aou0yxFSsGJO
f0bI3cp64xK5sE74Mv5T0OFNPdcgtftKi1hES711uJZwyWdoIdz7T4mikmVt2r7D
0N1oeEckjiFzF4wzvMU4KX2NImw/8ef0Dz/XTvSvI6Ae1FVnshCj7sZ4RfrO9W/L
4x84eyP5JTdZeLHhH7M8Fuw2XOYmF/+8Jeye5Os7njSB4+DU6Ig=
=Zljx
-----END PGP SIGNATURE-----

--HfLQjWKfp3+aIQDU--

--===============0478926268899087327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0478926268899087327==--
