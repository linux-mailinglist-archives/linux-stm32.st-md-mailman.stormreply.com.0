Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7F3A19E4
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jun 2021 17:36:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDFFDC58D5C;
	Wed,  9 Jun 2021 15:36:32 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D58F5C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jun 2021 15:36:30 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id k15so18659063pfp.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Jun 2021 08:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=neZ2e107rW6u5+BVpWqPAvfyZBtmzgP4djPpeqRyQ04=;
 b=p3oEZTsxgUaXISabfNCfwlDjRW2XZRlWVv0TCVqelJkHJNM3/EWJSwsue6tjO4/hhn
 /vfNCoDxpC6LKITX/NHS/uCxfh+V81P01S14Ux2ihYwvi4a1qnhCxbdaRZR0jv5VBvbi
 hbUFaLZ/uic5TZYxY6VhezmmWDxp+UqJiwAD8WYYjHJw0KqJYn4RK4RvLppFNGu6LjAW
 caaZ7rG/9S5XC2gNOEnbbDa8h79L/6/RGaWH0OezCFC/+2HVQ7I4gDWY1Oy0b2KM+Fhy
 cND97zONfQd+t3dc0lti732r5qaX34Uf33Qtn2mMRUWrtTJl/us2WvKy2aPm6FXKTxzV
 FzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=neZ2e107rW6u5+BVpWqPAvfyZBtmzgP4djPpeqRyQ04=;
 b=BxTY7uRTa13sKvm8nkJigE7yzISVESiZZbIIjIkYDEhZYc6miRJoxiYAMMsVmRNxyu
 8qqFee7YBwIO/GqrVHMQ6AY8J4+eKNBmLoX6Hsq8kU3vDCjhsjBNhom64w3I25IAJhd1
 627vAtzQ8byJ9r3ifvNIpnpf9B45lThPE8VKW7HybnZJ/fG3SqgYwopEw74S/9gZFkTA
 sT0ItpbDJ1L25zpComgEZR1BmhkQY7vihk1+EDH4Jxo+64xV9fYQB7EDk7T8M6JXtPZP
 Owrb709qYoFyQVucbMGAaRUpPiQhErAejqS9IfksxQPxRHeOI9sYfhQyODA/QYhn3/k8
 wj8w==
X-Gm-Message-State: AOAM530nEz+4kDrequbuPeus58DtGfPB91nCPYLOQ26DthA3konsOOai
 2bpqjsiXpMsmu7mlmXYTEWE=
X-Google-Smtp-Source: ABdhPJwyxxyPeyzTzDbknC8LuuZIDpubLWJAJOncQpZ+ccwe7qvp01K7EbRKkr59WznDo/R+ekfEDg==
X-Received: by 2002:a63:ad0f:: with SMTP id g15mr248776pgf.415.1623252989343; 
 Wed, 09 Jun 2021 08:36:29 -0700 (PDT)
Received: from shinobu ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id u12sm50028pfm.2.2021.06.09.08.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 08:36:28 -0700 (PDT)
Date: Thu, 10 Jun 2021 00:36:22 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: o.rempel@pengutronix.de
Message-ID: <YMDf9tDbPg/PxVxh@shinobu>
References: <cover.1623201081.git.vilhelm.gray@gmail.com>
 <a3bdffbe7c38eb95ea692ed30aeb50dbb65c9e6f.1623201081.git.vilhelm.gray@gmail.com>
 <20210609162942.6bdc6d63@jic23-huawei>
MIME-Version: 1.0
In-Reply-To: <20210609162942.6bdc6d63@jic23-huawei>
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
 Jonathan Cameron <jic23@kernel.org>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v11 14/33] counter: interrupt-cnt: Add
 const qualifier for actions_list array
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
Content-Type: multipart/mixed; boundary="===============8672447057828229128=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8672447057828229128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bM5rh64AbDYaJ0MC"
Content-Disposition: inline


--bM5rh64AbDYaJ0MC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 04:29:42PM +0100, Jonathan Cameron wrote:
> On Wed,  9 Jun 2021 10:31:17 +0900
> William Breathitt Gray <vilhelm.gray@gmail.com> wrote:
>=20
> > The struct counter_synapse actions_list member expects a const enum
> > counter_synapse_action array. This patch adds the const qualifier to the
> > interrupt_cnt_synapse_actionss to match actions_list.
> >=20
> > Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> > Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> Naming looks unusual...
>=20
> > ---
> >  drivers/counter/interrupt-cnt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrup=
t-cnt.c
> > index 827d785e19b4..0e07607f2cd3 100644
> > --- a/drivers/counter/interrupt-cnt.c
> > +++ b/drivers/counter/interrupt-cnt.c
> > @@ -77,7 +77,7 @@ static const struct counter_count_ext interrupt_cnt_e=
xt[] =3D {
> >  	},
> >  };
> > =20
> > -static enum counter_synapse_action interrupt_cnt_synapse_actionss[] =
=3D {
> > +static const enum counter_synapse_action interrupt_cnt_synapse_actions=
s[] =3D {
>=20
> actions?
>=20
> Perhaps good to fix that whilst we are here.
>=20
> >  	COUNTER_SYNAPSE_ACTION_RISING_EDGE,
> >  };
> > =20

Hi Oleksij,

Would you take a look at this driver and let us know whether the two 's'
at the end of this symbol is intentional?

Thanks,

William Breathitt Gray

--bM5rh64AbDYaJ0MC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmDA3+UACgkQhvpINdm7
VJJDog/7BWfRthJW0ybnlLsxDyqpvnBx92k2hiBaXR2DX8siYjVeWomh7OpLXzwf
C84Ze4rdn8H6/Dpc3wA8vDiUUHX9VwIcACOpOh2KJ2IoF5AdrOzLjS9b+a+ZFusC
mpbvfXz6/VxKgqjQY8JY+dgTFiROGNnJrllDaCV1sNPRPa/WwmGVSgh8b/+UMeBd
e3QOQ5JG77FfWwzV0jjSw9Tq1e7fr+qbtg0v0Nvz74AGePCEsetIxQyA13HWyaEP
qlMDIi0yrsbveBx+uUyhJ64hulLu9xRLuGFdtvdICP+b8WohDzykuVTPqHk4z9Ki
hNTDtA7qZIZTDlBMVlC3XNGiEfd/B5CIktmatlQVmDmpOF/FaJmF/UyUFXJxG+IE
ZH7AuxS8lNtxetA/AAM8ED82WJZ2BWLPW6OZc1HUt41r2eJNsqeCA/fCzrvdEeHg
FcSnqxuAwWI9TZ4w1jiaiVTV6N4Z4aNsH9uoX4MSHp/y0obm1hQh2tBZc55DG1Nn
0skswdQVV8k5mjJO4fTMZF8H9N+026UpRZ8bnoO7XkeIs39sPSSmVJo6r3ZDoxiL
Rlsd3zp2ByCk5+DfeZLaBCpNWwwndrx2SSq/EN9pKDq3OnkwXs37T8Arql2zfP31
xaeIQUCVKnZE3q7xJV+4EL38BTDw1n8QzrLylft6fViv6xNVAR8=
=0g9k
-----END PGP SIGNATURE-----

--bM5rh64AbDYaJ0MC--

--===============8672447057828229128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8672447057828229128==--
