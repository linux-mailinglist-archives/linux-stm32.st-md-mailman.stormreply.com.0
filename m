Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B662EB983
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Jan 2021 06:31:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B343C56638;
	Wed,  6 Jan 2021 05:31:13 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87763C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 05:31:11 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id z12so990808pjn.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Jan 2021 21:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rjwtCC4s5qF5toeFU9GqGpGwIgLC0h9CcPJ0B42v4CQ=;
 b=RccYso2/RvfnZPsOPln1soDDi57lHypQ9ziIwjDaB1mI1AtFwVwLmUpLhmiCyQ8SY5
 XLT1LEBooSNcVA/pX9ZggD/PtJZABE7GjlpTMzgfrii4pVTQgdFWVGnXUUcHDC1olw7w
 xrKu6zO8tWzeWJHbNvBOowUQubckFC0G/ax3ER44SmtxJ2tKZY20yInAzCjdM1nq7zWW
 gQKZeIYTVfPq6/4mLomEL0VSXyNfKs2l8EjJugp8NBcHcBP+hZndk7IeZWxsxQcXi0f4
 RWFL6eZmWdYlUEz6WIbEWf5rg5ez52VptftTN4H/TYBYop0Hl2jgRiiPP18DemXCRyt5
 rTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rjwtCC4s5qF5toeFU9GqGpGwIgLC0h9CcPJ0B42v4CQ=;
 b=q7LOt5mj0y0ubtBkioL4HK2THc3hTBdpf27vdDnrFRsxufQprJYvz6lcKavZu9IKbI
 3FQ5LclLNavVt9Mq4RHlrAzLuwHr/dQgv5CBhT2eMIX27Khc6vAMWtbCMYIm6dmSJM1h
 SVXfRPe7gy/sJevpDYWTsm5PlJZA9WPjHnRaonVgPZJGOmUb2CtvLqTvt0Z9QvKxKsD5
 UqIqHF0LZ2tG6Js01jthFbVip0FvurbvB6LqFz7+MVcOZkO6/qWLK4fEoZVo4lStXi0M
 bUHyvFI5QJu4WFj/1/hfmYZGcldgd4u7d/LSaxiEgNHggAIROfVAhzs1MJVYMH7BzFoN
 5Tig==
X-Gm-Message-State: AOAM530wfC9UzDdGyjuNgmf+R/U7AAEIWgeicENzCnkEWEkPbcmv6skV
 YHAYCiwOcOYfpcyiwkUr/PM=
X-Google-Smtp-Source: ABdhPJzePowiEcDtoDOO8mVrej19Pwo3YcDLae7GCXSALEteC7xAeNRoG2w+P4XOe/IgaZlQxsHmNQ==
X-Received: by 2002:a17:902:cb95:b029:dc:3a38:c7df with SMTP id
 d21-20020a170902cb95b02900dc3a38c7dfmr2906008ply.49.1609911069942; 
 Tue, 05 Jan 2021 21:31:09 -0800 (PST)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id u12sm978052pgi.91.2021.01.05.21.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 21:31:09 -0800 (PST)
Date: Wed, 6 Jan 2021 14:30:59 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <X/VLE0wPPifNZFhT@shinobu>
References: <cover.1608935587.git.vilhelm.gray@gmail.com>
 <fc40ab7f4a38e80d86715daa5eaf744dd645a75b.1608935587.git.vilhelm.gray@gmail.com>
 <2f950b79-fb83-9800-2690-ec81c6be6348@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <2f950b79-fb83-9800-2690-ec81c6be6348@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Dan Carpenter <dan.carpenter@oracle.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v7 1/5] counter: Internalize sysfs
	interface code
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
Content-Type: multipart/mixed; boundary="===============7085141063155021723=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7085141063155021723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TS0nwI4oX3M9MM/u"
Content-Disposition: inline


--TS0nwI4oX3M9MM/u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 30, 2020 at 05:24:34PM -0600, David Lechner wrote:
> On 12/25/20 6:15 PM, William Breathitt Gray wrote:
>=20
> > diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
> > index a60aee1a1a29..6c058b93dc98 100644
> > --- a/drivers/counter/ti-eqep.c
> > +++ b/drivers/counter/ti-eqep.c
>=20
>=20
> > -static ssize_t ti_eqep_position_floor_write(struct counter_device *cou=
nter,
> > -					    struct counter_count *count,
> > -					    void *ext_priv, const char *buf,
> > -					    size_t len)
> > +static int ti_eqep_position_floor_write(struct counter_device *counter,
> > +					struct counter_count *count, u64 floor)
> >   {
> >   	struct ti_eqep_cnt *priv =3D counter->priv;
> > -	int err;
> > -	u32 res;
> >  =20
> > -	err =3D kstrtouint(buf, 0, &res);
> > -	if (err < 0)
> > -		return err;
> > +	if (floor !=3D (u32)floor)
> > +		return -ERANGE;
> >  =20
> > -	regmap_write(priv->regmap32, QPOSINIT, res);
> > +	regmap_write(priv->regmap32, QPOSINIT, floor);
> >  =20
> > -	return len;
> > +	return 0;
> >   }
>=20
> This will conflict with 2ba7b50893de "counter:ti-eqep: remove floor"
> (in Jonathan's fixes-togreg branch) which removes these functions.

Ack, I'll rebase and remove these changes.

William Breathitt Gray

--TS0nwI4oX3M9MM/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl/1SxMACgkQhvpINdm7
VJKIcw/+LDra2XrlrRaFeux8tWBB93EDHYQEEzd7WeMlC09xQ0aZwEeUojZtJ5/E
IV1ZeWHxVRikgxL9GMBjwLO+IAg2fsiko74ruXbmylQad1AOuI/MDCLfN7Z6vSXW
BMYXiXq5bH/cKGRLf0bqRWJNRCUPvd7wrh4G3l8Q91BsKWeUNAxypwVjmfFtpspJ
7Y0EqvmDD890fNFPZOajKU8EbGEBzfUt+mDuFNXkkhM38bhGT+8PQ6APoaA1OQ3W
xhpjtzW4mEg0V8DnMFdpmeI0MHsV6yYM8tnK+NvY/EbbGRQbfy5x1tqnjSR+KKZm
TIlYCJnI/95mdjEmNL0qvC7K8gypB6F1ScmNZ2LiaNqT4ztoJebFXIpqVhiWl9X1
j7pGX+0xGHiLBKJ+1cubpuyoqoYWLWKzZuxv5GAAQ7BYP4b02iaUqmahKciQlrGX
cieLke92Mhi6YOQf3/FA+kw1wOGtIOTBbHc3Ng4fL7JYztKSg7FQ48H1jnLKhlNe
QOHBVz7tXasa2GxtDAYKa1fPLXv9Hz8pADP105UJEDaLDoSggWwnrItGvXT5CBjM
1+VTNc9PR5kqyo5yDRe3fIBHn1+GOCwNBDZcF85RQcccwYce6s3WmHe77IK24Kgy
TIeVZYUz5l7HWnI3eM4hl0PCL2yHFj4lLPkiVnQ8Qg3MoPm+JSE=
=iNKk
-----END PGP SIGNATURE-----

--TS0nwI4oX3M9MM/u--

--===============7085141063155021723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7085141063155021723==--
