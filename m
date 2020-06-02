Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC61EBF4A
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 17:46:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29E59C36B21;
	Tue,  2 Jun 2020 15:46:44 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61DD7C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 15:46:42 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id fc4so1995575qvb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Jun 2020 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qzSEuCpyscmKEcqXp1a7EbLdA2hmWwk/OzqJUNtkEjE=;
 b=fYWMOkvOHbZel3XZmvxrN5Glw2gpYA1wRb8wfd7mkJlG3OO0PQYyYtwAdyUDVHSWRX
 GuvfsCuJyJ80lxs3We0lAJYHzMLQ4PyU8imyQvB53L2EYY9r72CEyoFZ2WTo0HwkmzDd
 787UFM7zLfmhgQYYEu0CXW6prlVh0RrDsh9Dos4pF8AoypQb7dBUjIfNRrOj6fJZDtOL
 nwQfGSlGsl9YIO7RDBK8kVLGIGXNurmcRQImUI2D7DNYeTwfZKRzPpXkxI168UwrGddt
 j+Qybk/9l7xHzO8zYtMuZLrrdGgWKxiE7cm66AKK8FHw3hWPVmyNJqa1GQDOKpyzIGwo
 5pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qzSEuCpyscmKEcqXp1a7EbLdA2hmWwk/OzqJUNtkEjE=;
 b=nfMBu471FOneBunqPXnk8eWXT/zQ2TIHzwK/cS78pCarSny7cB6j9mYaJXNyvEGo6m
 XnseY2G0B4tnTxtk2ZCwUYejCDYhYuxdW69bgu5J083JYxJUt2KlLGT+y4EgXwvsuECH
 hrsfeI3NJ3nVA3yDKLakvUPs0y1h1CB/yo5tlK+Eur6FKP2r/Ax3YcQo/Vn0AIVSe9Gq
 93cNgpHzNgIQ8m+DM0ic4DRhItBwdI7XFTPdNmAf1Kpf2WXogHQCS0V79ifMUlqhqBr3
 cZZlm07G7Y1VSXpwtVroabNd2uBEWSYuqwpqqYlTYW4JEQJVpsFw524BabA1JdAHe7l6
 2n/A==
X-Gm-Message-State: AOAM531Ifi992dUHN2N3VDo2NYGXNASQgfH8lyDvFYyO4oRU9QBNjg4j
 gt5ZyDw8aoijmy5rbBZ8V1s=
X-Google-Smtp-Source: ABdhPJw7LGOlr2xz60gu8um0AANDyr0R16BDgMgY1Hm2PlzxLQfK3UQtshToBzP2YwPv56kOjyJaSA==
X-Received: by 2002:ad4:4b25:: with SMTP id s5mr11431931qvw.212.1591112801117; 
 Tue, 02 Jun 2020 08:46:41 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id w94sm2899533qte.19.2020.06.02.08.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 08:46:40 -0700 (PDT)
Date: Tue, 2 Jun 2020 11:46:26 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20200602154626.GA5082@shinobu>
References: <cover.1589654470.git.vilhelm.gray@gmail.com>
 <20200524172542.31ff6ac7@archlinux>
 <20200524175439.GA14300@shinobu>
 <20200531161813.658ffdfb@archlinux>
 <20200531171351.GA10597@shinobu>
 <ac473c9a-f9cd-21ae-8f8f-d5181df2c134@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <ac473c9a-f9cd-21ae-8f8f-d5181df2c134@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] Introduce the Counter character
	device interface
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
Content-Type: multipart/mixed; boundary="===============7350247256682515461=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7350247256682515461==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 10:18:07AM -0500, David Lechner wrote:
> On 5/31/20 12:14 PM, William Breathitt Gray wrote:
> > Yielding the following /dev/counter0 memory layout:
> >=20
> > +------------+-----------------+------------+-------------------+
> > | Byte 0     | Byte 1 - Byte 8 | Byte 9     | Byte 10 - Byte 17 |
> > +------------+-----------------+------------+-------------------+
> > | Boundary 0 | Count 0         | Boundary 1 | Count 1           |
> > +------------+-----------------+------------+-------------------+
>=20
> A potential pitfall with this sort of packing is that some platforms
> do not support unaligned access, so data would have to be "unpacked"
> before it could be used.

Since the user defines the format of this data, they could reorganize it
to a more streamline alignment; for example:

# echo "C0 C1 C0E0 C1E0" > counter0/chrdev_format

Yielding the following /dev/counter0 memory layout instead:

+-----------------+------------------+------------+------------+
| Byte 0 - Byte 7 | Byte 8 - Byte 15 | Byte 16    | Byte 17    |
+-----------------+------------------+------------+------------+
| Count 0         | Count 1          | Boundary 0 | Boundary 1 |
+-----------------+------------------+------------+------------+

In the future, we could also define a padding argument to give users
more control over the exact offsets:

# echo "C0E0 P7 C0 C1E0 P7 C1" > counter0/chrdev_format

Yielding the following /dev/counter0 memory layout instead:

+------------+-----------------+------------------+------------+
| Byte 0     | Byte 1 - Byte 7 | Byte 8 - Byte 15 | Byte 16    |
+------------+-----------------+------------------+------------+
| Boundary 0 | Padding         | Count 0          | Boundary 1 |
+------------+-----------------+------------------+------------+
+-------------------+-------------------+
| Byte 17 - Byte 23 | Byte 24 - Byte 31 |
+-------------------+-------------------+
| Padding           | Count 1           |
+-------------------+-------------------+

I not sure it's best to introduce padding support with this patchset
given how much is already changing, but I don't anticipate packing
alignment to be something difficult to support in the future with this
interface.

William Breathitt Gray

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl7WdDsACgkQhvpINdm7
VJLCEhAArR5Z9rXla2JfgRiAGmqDThaapfbMiWbFcBbq6mdhn4a4+7+xcqkJIC+L
kBzFsq8MLeKihP8osMCt2Oct25/39Ica1qQEa0CsrzQ8xA2hM1+6oKBeOICpbd9r
HbPi2UlQajM63wey38/tJM3Nqwtz1ADdyNjXSHDXsUQTsx9GaB2pYD9qE1CkTGbU
9KDLIF7lX6olggVMKe9eyZY5MfsyeNVlGaMG/xZtaCehGCFDk9011mF5zVHrV9ya
79X5Gqm19BXFvnoEh2qbFkOMxUirIGEDZszdZtwMHKofYziL4QLAoSfEHrS/8GCL
8/SMpjuPi9WIMRA70htNgdsKEKsykx8d6rV8eASLIVqX8OrF4lfpTg7caWLWfVSM
2eRxRoyWICYfUPO5SMKKQoj+sBZxaM0GtgJecbt5Z5glRbYxODzkBHufffioIBU8
eNyA7mgtYi3ElWeQL2sxOV2UNHDwLzrouB2TBOM2ycNY7Mfo37tqt2MO7YdoGMi3
deUo9zeAgxbLyIx8YlDeQ1CdrSzAPpl3pPmkZG8zGf553Dyyww8AE+b87fyMcMkC
gAx+JnFU4ujy9DRE9mlcavropCZt4BLCtOs7EW7JqqUDXxoCcSnKugOmbWwEA18q
gcEbKztvUIOAelXICTgen8AqPt0nvI9R0/cF876yspBg/sw5e/I=
=Uj3v
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============7350247256682515461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7350247256682515461==--
