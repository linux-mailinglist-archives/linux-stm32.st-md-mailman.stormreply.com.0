Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4B13F3A4E
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Aug 2021 12:52:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A3B7C58D58;
	Sat, 21 Aug 2021 10:52:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDB26C57B5F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Aug 2021 10:52:36 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id j187so10918670pfg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Aug 2021 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7GHZ71vn1IOyEe5RXN4R0wAt4wO6jCQIg+NGEUM1G7w=;
 b=E77GypFj7f0d6klY5ylnID+eWbmqIPQxTnRVeVE4YvqcbIa6kRk+AjA6qoJk6HL6fV
 Hm5RNXXE6JYNRLCtkAM4jL6KHsPLU8zvZKrKDL+KQI8mLnTn8KE3P+nK6GkDhOA3Q29k
 GhxcruQtC246xFx7P8sfiQ6SzJvnqVYKDWAYM4DkkYtmTC0217zSA5lSZa/zM/8dxTxz
 8XPDcxtevNOq4LNMoY91V0hUz7MFLXSg6O2EnrKBSXVy8T8ushel5tgWQNr/E+nCjQDV
 EWm+V6BOo5NGC1dPEKmuKEGVUu93UfyT2mKpGu6TV5+Rw9E1HO7eo3cXffsy6QbFLtOs
 hHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7GHZ71vn1IOyEe5RXN4R0wAt4wO6jCQIg+NGEUM1G7w=;
 b=DsWsVp5njArpgiidMQTWvKvrC1AFlrNKypVeWgNBXD32rRbEljKS1/K6RNnHHY+f63
 r5uXCvV0/sm4RpjT+2GXgJBan8kGBKW0EZ0sXIq+qDeF3Acv+/ImJE1sEzpsrp+KibM5
 JUGoJIW5s93OtVMX598Zi9EVVQcHmmbaaYR2WmExEa7+p1Rf5TqFftjDpw+gVKt4XDP3
 lGIizyZ74+cU8QlALtIGClI5rNX8rX4aLOFwlNr4ogZrTulV0QNI9P9PcnwB108sJ6uG
 SW5P/OD2xFI/VPzofn5V62h5OrqfONa5WrxdpjpsoKpsevvasEdEMP0a1AduvXZpz7JE
 dH8w==
X-Gm-Message-State: AOAM5326ZQi6xZmYgXq5gm2wm87Yud+W5VSJLjny3daYRHNyglZvNvQl
 4A4+CnbdtjspDUdtjbHRhyk=
X-Google-Smtp-Source: ABdhPJwU1O/fyQ1CgvrQNT+/7EUp2HR/Zk2LYQNY8wRyENOHx6pzwRrzfuDSMopQdhJywkaK95asLQ==
X-Received: by 2002:aa7:9e5d:0:b029:3e0:46a2:1dea with SMTP id
 z29-20020aa79e5d0000b02903e046a21deamr23891279pfq.77.1629543155036; 
 Sat, 21 Aug 2021 03:52:35 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y4sm8740382pjw.57.2021.08.21.03.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 03:52:34 -0700 (PDT)
Date: Sat, 21 Aug 2021 19:52:27 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <YSDa667n6pi4O8iT@shinobu>
References: <cover.1628511445.git.vilhelm.gray@gmail.com>
 <a6f7be32b8ff7cc1e8e416599820a30fa9aab9f5.1628511445.git.vilhelm.gray@gmail.com>
 <20210815175102.4a10a28f@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20210815175102.4a10a28f@jic23-huawei>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v15 07/13] docs: counter: Document
 character device interface
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
Content-Type: multipart/mixed; boundary="===============8732919950873677502=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8732919950873677502==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FonV+Z3EdOcq0SvO"
Content-Disposition: inline


--FonV+Z3EdOcq0SvO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 15, 2021 at 05:51:02PM +0100, Jonathan Cameron wrote:
> On Mon,  9 Aug 2021 21:37:32 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > This patch adds high-level documentation about the Counter subsystem
> > character device interface.
> >=20
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>=20
> Hi William,
>=20
> Trivial probable typo inline.
>=20
> I'm struggling somewhat with these interfaces because I simply don't know
> enough about how people use counters to know whether they provide everyth=
ing
> people will want. They feel similar to the event handling type functions =
you
> can set up in motor drives, so they may well make sense, but ideally
> we need review from someone (other than yourself!) who actually uses this
> stuff on a regular basis.
>=20
> If we don't get any additional review I guess we go ahead anyway
> next cycle.
>=20
> Jonathan
>=20
> > ---
>=20
> > +
> > +Counter events can be configured by users to report various Counter
> > +data of interest. This can be conceptualized as a list of Counter
> > +component read calls to perform. For example:
> > +
> > +        +-------------------------------------------------+
> > +        | COUNTER_EVENT_OVERFLOW | COUNTER_EVENT_INDEX    |
> > +        +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> > +        | Channel 0              | Channel 0              |
> > +        +------------------------+------------------------+
> > +        | * Count 0              | * Signal 0             |
> > +        | * Count 1              | * Signal 0 Extension 0 |
> > +        | * Signal 3             | * Extension 4          |
> > +        | * Count 4 Extension 2  +------------------------+
> > +        | * Signal 5 Extension 0 | Channel 1              |
> > +        |                        +------------------------+
> > +        |                        | * Signal 4             |
> > +        |                        | * Signal 4 Extension 0 |
> > +        |                        | * Count 7              |
> > +        +------------------------+------------------------+
> > +
> > +When ``counter_push_event(counter, COUNTER_EVENT_INDEX, 1)`` is called
> > +for example, it will go down the list for the ``COUNTER_EVENT_INDEX``
> > +event channel 1 and execute the read callbacks for Signal 4, Signal 4
> > +Extension 0, and Count 4 -- the data returned for each is pushed to a
>=20
> Count 7?

Looks like my finger slipped on my numpad and hit 4 when I intended 7.
I'll fix this for v16, thanks.

William Breathitt Gray

--FonV+Z3EdOcq0SvO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmEg2usACgkQhvpINdm7
VJLlrBAA5ef/1u/fl55aa7bo8Y2TRZq13h+0JMoMFw+JkZff7ubiQ0NaVAfOZNQN
zG9PNIwOsfw0dhWrWhPgyyQDtXewP27ISLqBjKvlXStIT6gaE/RL1IqAdR2b7PXn
oK1LOh89aAWmD6fWX4qB/NABJ0gUnrHi7AfWU9TKfbCyYfCt6GCCvXovaol0OVLY
9/ZZo6vgE0leqpkIYDEWUEUdVMz48GNEWlKHfRE3ajwyHVXkUKoIAVvzP+Bdo7ON
Cwu3GdFpSGzG/f6tvOlQN3+HTyiO8F5TOe954tCCpSY27N2GLBgF3s93mFJtmYmy
sAdtyEgEj6GhWF12gQKcnvcVt08uC1eSbg1Gh7ZUiZ9F3v4cyLUqHhTFPtxM+PyH
flghDGTfyHgcBD3Zt66cVBJvN1v29hQVc4/Q+x7q4YDXYk5c5LKBUNThfdVsAR+x
475bGsvth6Uq4qzOdOPfdMh8+IHJ3x6JygmxvyGdWiDaBGWk5XrgilEkVUdsf4NR
cFvlEv7ElzQpNjsm3atDkSTYKw29QiTZzAihXPbB1WXMbGEA2B5n6wuPUFF5tgrR
0nFVsG84EleG+u/KwZkIMWhlRpEl8e1OiJETtlObjMvwybwNn5JLlnsFvTWnsVq6
4j4EBNsdllCs2NPTQVa5eJRXa7WsChfEYegahqRQCB0fqNQnGVg=
=glsn
-----END PGP SIGNATURE-----

--FonV+Z3EdOcq0SvO--

--===============8732919950873677502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8732919950873677502==--
