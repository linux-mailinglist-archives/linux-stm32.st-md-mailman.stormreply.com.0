Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8E291874
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Oct 2020 19:00:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 024DAC3FAE3;
	Sun, 18 Oct 2020 17:00:55 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB4A8C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 17:00:52 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id ev17so3349776qvb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Oct 2020 10:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yujdBFkB3q9BJOlLyxki4mfbDVMsL1vTCbWLy+8lBMI=;
 b=ckCk2q5o7v5szVHaKyMuoygGUpGpXeHpABpm15X5HGebGvr8zNeCDhewOPLjOW8A5b
 A5x/7L8hq2WdlVgKkh1UYfhHANwghKNGHSIOyJhNTyFsieNldRv21X+BdSfHRSu5M7mN
 3ggajcXaSDzRot4fErq7UAhFR+sdjSiUEtSFhuUIDMlYSlPa6gr1pSRDZADp/WZr8Rdm
 jig16l6Ayiq0oia9m3BHJFZfxWFbwXlcwQmw/7pqh0p23TbDwQyI7WLXrPxw4zxWTv/2
 AP/Ouj31L1EjMIVL+jzKE2F1VC6mRA9gT4+h/wDfiwsz3aSkifcJGxq8g6+/wpzeR0A2
 vxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yujdBFkB3q9BJOlLyxki4mfbDVMsL1vTCbWLy+8lBMI=;
 b=sKYfTaMQlME/kJzsmaCcNWAwheXCwoHZpGN6JMMR6zAd+WKPEYLRuCF/280+kvPo1j
 nw5ddb8L18pBqEXVG6gzvJVVe5G2kqYbaSbTCAm2lWaERMHPtMWJxebxFQwD34zYro+D
 QBtElpYIC9CqLNYBux7OOZc0+RnWV+6kGvNpWt8YFWbxnng5Aw+SYthZC34rjqI9p5rl
 ZekGa92K8pER8Ogown8AQEQfBKwuC+fiVUZ6jOzkRsVhIaD2RAbY6jMiRIXVbhWGvz79
 45P/Ap3rX+SzYXkMT5KsmR4+V81PulX0KkJ4sWaPOZaPoX1DexwkO23KANYhv/GRBzBf
 T0Cw==
X-Gm-Message-State: AOAM531bXkkM/iKZnn5d1wDvpAB1ph9kUHa3oIsqS95gMWnzp872Aft2
 nHFas2s14wJCQ1lWE5VyxPo=
X-Google-Smtp-Source: ABdhPJxNlnIU6xr+cJt+OBz08lremIvgnYee2WsNAYN7ymK0uJnexErasR91ZvKozAYXToooGtHP/w==
X-Received: by 2002:a0c:b902:: with SMTP id u2mr12852355qvf.7.1603040451750;
 Sun, 18 Oct 2020 10:00:51 -0700 (PDT)
Received: from shinobu (072-189-064-225.res.spectrum.com. [72.189.64.225])
 by smtp.gmail.com with ESMTPSA id k17sm3334285qki.5.2020.10.18.10.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 10:00:50 -0700 (PDT)
Date: Sun, 18 Oct 2020 13:00:48 -0400
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: David Lechner <david@lechnology.com>
Message-ID: <20201018170048.GF231549@shinobu>
References: <cover.1601170670.git.vilhelm.gray@gmail.com>
 <e38f6dc3a08bf2510034334262776a6ed1df8b89.1601170670.git.vilhelm.gray@gmail.com>
 <17c22445-d523-07f8-d1ff-59e8dbc73cc8@lechnology.com>
MIME-Version: 1.0
In-Reply-To: <17c22445-d523-07f8-d1ff-59e8dbc73cc8@lechnology.com>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 1/5] counter: Internalize sysfs
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
Content-Type: multipart/mixed; boundary="===============6377183359546956664=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6377183359546956664==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Content-Disposition: inline


--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 08:38:40PM -0500, David Lechner wrote:
> On 9/26/20 9:18 PM, William Breathitt Gray wrote:
> > +static ssize_t counter_comp_u8_store(struct device *dev,
> > +				     struct device_attribute *attr,
> > +				     const char *buf, size_t len)
> > +{
> > +	const struct counter_attribute *const a =3D to_counter_attribute(attr=
);
> > +	struct counter_device *const counter =3D dev_get_drvdata(dev);
> > +	struct counter_count *const count =3D a->parent;
> > +	struct counter_synapse *const synapse =3D a->comp.priv;
> > +	const struct counter_available *const avail =3D a->comp.priv;
> > +	int err;
> > +	bool bool_data;
> > +	u8 data;
> > +
> > +	switch (a->comp.type) {
> > +	case COUNTER_COMP_BOOL:
> > +		err =3D kstrtobool(buf, &bool_data);
> > +		data =3D bool_data;
> > +		break;
> > +	case COUNTER_COMP_FUNCTION:
> > +		err =3D find_in_string_array(&data, count->functions_list,
> > +					   count->num_functions, buf,
> > +					   counter_function_str);
> > +		break;
> > +	case COUNTER_COMP_SYNAPSE_ACTION:
> > +		err =3D find_in_string_array(&data, synapse->actions_list,
> > +					   synapse->num_actions, buf,
> > +					   counter_synapse_action_str);
> > +		break;
> > +	case COUNTER_COMP_ENUM:
> > +		err =3D __sysfs_match_string(avail->strs, avail->num_items, buf);
> > +		data =3D err;
> > +		break;
> > +	case COUNTER_COMP_COUNT_MODE:
> > +		err =3D find_in_string_array(&data, avail->enums,
> > +					   avail->num_items, buf,
> > +					   counter_count_mode_str);
> > +		break;
> > +	default:
> > +		err =3D kstrtou8(buf, 0, &data);
> > +		break;
> > +	}
>=20
> In this function, return values are not always errors. So it would make
> sense to call the err variable ret instead and check for ret < 0 below.
>=20
> Setting enums to a value with index > 0 fails currently because of this.

Thank you for pointing this out, I'll fix this.

William Breathitt Gray

> > +	if (err)
> > +		return err;
> > +
> > +	switch (a->scope) {
> > +	case COUNTER_SCOPE_DEVICE:
> > +		err =3D a->comp.device_u8_write(counter, data);
> > +		break;
> > +	case COUNTER_SCOPE_SIGNAL:
> > +		err =3D a->comp.signal_u8_write(counter, a->parent, data);
> > +		break;
> > +	case COUNTER_SCOPE_COUNT:
> > +		if (a->comp.type =3D=3D COUNTER_COMP_SYNAPSE_ACTION)
> > +			err =3D a->comp.action_write(counter, count, synapse,
> > +						   data);
> > +		else
> > +			err =3D a->comp.count_u8_write(counter, count, data);
> > +		break;
> > +	}
> > +	if (err)
> > +		return err;
> > +
> > +	return len;
> > +}
>=20

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl+MdMAACgkQhvpINdm7
VJKeBw//TwierwwomvmWRWfZmlmzByWQ0Q7nkMtO2BRaENfqcAsKHsPcQL6HjwT7
73s0pwxRoUV/l2SXpb/YQCAGwVHdVLEDXPxYRIHFoC5dCV86zlQxztpNjYhQSi7E
z6ztS9vXxVr4zFxvcOErIujSx1OCfEFMuXNeM7jguaOdy0Pj0l0o8eJ+crxlOgsP
YfTSnWFCF99W/An/uealjV379jc+TywdEiWOHbtB5vLgvQZ/lpLSLLqypq1i+lXX
wcFeTJxqrjGRzbCX7wnK5OEqBMSCv8rSSM5/iSW82KPcN2bI+8GjlIbdOorgrQHy
+o3d0fEAgUU8F7twCEPtA08hZuEbtdlSC8R8aL7nAplRZ0TnLwv1W9VR7nwZ/X9Y
MD2nMl6BX8t4sbccQCa+RYhbgD8DuEeSBRqRPDORpljKF2S8i6yfDxqlXJPkZ3po
DvjaPhCJr9jVgb300ZFYhtELNkH1zrcvlY5l8QIX/WxDYmASg//h/+v4duOxBPuw
DYysQMzezGzsWuUzsJppcRsSyPFDFrBWo6s/irk8tn0rRkr54vLhMmvXWxa0G0fX
YdrtsY08lCP2LzAOQ51axaqq/w9xKZbfgq3efugA3lPdpvMsCR3Iivu10tdEcoaZ
APv6EFt2nxwgyWPIxmDBaSpl9jnTW1znv/KeDR9ZrA8Z/rvhAAI=
=rCo9
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--

--===============6377183359546956664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6377183359546956664==--
