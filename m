Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD73A1A19
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 17:48:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC7CBC58D58;
	Wed,  9 Jun 2021 15:48:22 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8E15C57B79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 15:48:20 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id k5so1587496pjj.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Jun 2021 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vyDVyLfPuRvXW3psMvZrGfoYLzSaxY+80nkzI+WIEzE=;
 b=PucRjujR5+uxNW2fJVOa9kbmJrNpVaZIPswxY7Ka6pj99DjNm2EHCwpbLk1u3/IWu2
 uOL8lFiT/VGSKYWcqw9moHzqwv3aiB2d1XZ5+JmzsrP3GBL65uAn6Ao2MynTCM1sCzZ8
 2Zr01Mr2Wt9qtRWNCr42VQ3lw4kNNt2PIj7xW+JNejMN6JJ1zC0o5niyCk/Z3nAWWvVj
 OHgZA3Gx/eLzkn3PCWRc3J2pFc4LALQ9qLiAy1j4KyPkQ+yROrkJi3K186md29/4KBuz
 9BLbi5rrcFxb6fVQQE0IbbuIeN4ns1tqKv9rdmqHsCgMByl8m+MfHl9G64aUO/Kk/6ND
 UC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vyDVyLfPuRvXW3psMvZrGfoYLzSaxY+80nkzI+WIEzE=;
 b=gf5BEWZsaqXvHtKRFa5MJOZh1/HRS37UI3mmWrVlvFnmPDYMKehybsUDxbCqQxeIe1
 0mtym9qqz+9132I8Gak3pn5ig2hSXr4MTqZc9K+Y30i9zmUBPbzafJWLizHLAJvuorRl
 31p1wwJTAJ3zahHeqIxXzXHrXKu2ooByFi5Ulp5po3D4lvKG8mF5EM8fI5+F1KD0DhdR
 4yYfGkkCO9rYq8Uww9j4YVNenDbEjFcPR8LGUl2ER5JsKMw+b+VNB48gT5ENToMDg0mH
 sqKy9ec/EcxSlLabrAbcUuxIA2nvHAEVvfRYTrVibifN6rLdKFPU38jPUOIC8X4ml7UZ
 dR9A==
X-Gm-Message-State: AOAM531c+An7xwkbX8dihIf5JYdQtG0z8RUd4MTs4rb3N97mCwBA4VFU
 C/JFthe0kgyF9oCTY5Djozo=
X-Google-Smtp-Source: ABdhPJxh5GLIqWkiRPPzW4Lzh/aEcbyNHtsNthc3er14l4v+e0TkJxr2O5pS0qkS61zBXhjW9z8dzQ==
X-Received: by 2002:a17:90a:c8b:: with SMTP id
 v11mr4532868pja.114.1623253699327; 
 Wed, 09 Jun 2021 08:48:19 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id q23sm213042pgm.31.2021.06.09.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:48:18 -0700 (PDT)
Date: Thu, 10 Jun 2021 00:48:12 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: syednwaris@gmail.com, Jonathan Cameron <jic23@kernel.org>
Message-ID: <YMDivMBOuhg98oAM@shinobu>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
 <538122752d61df30dd450276b87df606a17ac4c7.1623201081.git.vilhelm.gray@gmail.com>
 <20210609161236.52b2d99f@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20210609161236.52b2d99f@jic23-huawei>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, kernel@pengutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v11 04/33] counter: 104-quad-8: Return
 error when invalid mode during ceiling_write
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
Content-Type: multipart/mixed; boundary="===============7983841780159567673=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7983841780159567673==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HwSslquuWeRs22J3"
Content-Disposition: inline


--HwSslquuWeRs22J3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 04:12:36PM +0100, Jonathan Cameron wrote:
> On Wed,  9 Jun 2021 10:31:07 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > The 104-QUAD-8 only has two count modes where a ceiling value makes
> > sense: Range Limit and Modulo-N. Outside of these two modes, setting a
> > ceiling value is an invalid operation -- so let's report it as such by
> > returning -EINVAL.
> >=20
> > Fixes: fc069262261c ("counter: 104-quad-8: Add lock guards - generic in=
terface")
> > Acked-by: Syed Nayyar Waris <syednwaris@gmail.com>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
>=20
> We seem to have some inconsistency in the driver about whether
> we hold the priv->lock when calling quad8_preset_register_set()
>=20
> Can we look to make that consistent?

We do need to hold the lock when calling quad8_preset_register_set()
lest priv->preset goes out of sync with the device state.

Syed, if you have no objections I'll adjust this in the next version.

William Breathitt Gray

> > ---
> >  drivers/counter/104-quad-8.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
> > index 4bb9abffae48..233a3acc1377 100644
> > --- a/drivers/counter/104-quad-8.c
> > +++ b/drivers/counter/104-quad-8.c
> > @@ -714,13 +714,14 @@ static ssize_t quad8_count_ceiling_write(struct c=
ounter_device *counter,
> >  	switch (priv->count_mode[count->id]) {
> >  	case 1:
> >  	case 3:
> > +		mutex_unlock(&priv->lock);
>=20
> Probably swap this line and the next one...]
>=20
> >  		quad8_preset_register_set(priv, count->id, ceiling);
> > -		break;
> > +		return len;
> >  	}
> > =20
> >  	mutex_unlock(&priv->lock);
> > =20
> > -	return len;
> > +	return -EINVAL;
> >  }
> > =20
> >  static ssize_t quad8_count_preset_enable_read(struct counter_device *c=
ounter,
>=20

--HwSslquuWeRs22J3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDA4rwACgkQhvpINdm7
VJKcxRAA2lDJEsRamD6ptPESbNoCgjVVQCRWJX7wfOydG31YyVXdbmR22IhLx02N
KKYKMtnDY5oeGqszRcdJzLS+N/i8TuDtWmmFmWJrAUICaf/rHcyLVNuO1qy0VEQM
oe5xjSegTK8NPDvWxp9Z9zWmSlseO9QccbMyjm8fhHMAuHt1F0PE0ua3S1ttHQz8
2VnVALRTWZfl8nEMr+5Mjs6x+9U5o3oGQ5Xh4BlVFN7wmDsoSmMTgjTx8fBpzrRq
/IVS+xDKCJa12JcucBr+dk1TROTFQoLLfL2MEJHfdbfGfnjfSPMgdY/dnsviAxLn
JZAEdoEGhvFHi/zlFqG+zTXry1rRFPoye2nImJt/sb8sj57qlm3jbJneLUtNjswW
qjrb9IhXdsKcPen/chKRoavCmlvbsbT9+ob0OajQmCp55MaWmhWMiLpIXyE00Srb
7F1qKB2G87eF3i1Wjgc2j9YEIgsgVkF95wJZXZ1fr7Qd2VIWT//tyIBGjyewwX2a
mCjVFX6epV2CMf8AiMS0KGyP8kRfeWr9nNN27cOtR5plvEN/kFp7uaibI8W/7A1d
iFYXeoTy0u1jt46np6EXG/FfiQ38nKikSxkLqOu2pvJLDlQ9j0CQ0D40rDG0B//d
5RywU+DSHx6rtYQJmQZFPJiXecM4wVpqHKmmPFv3IuNJHthtmVM=
=u514
-----END PGP SIGNATURE-----

--HwSslquuWeRs22J3--

--===============7983841780159567673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7983841780159567673==--
