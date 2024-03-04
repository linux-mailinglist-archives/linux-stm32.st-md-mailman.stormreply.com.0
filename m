Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E18728702B0
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 14:28:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91899C6B45E;
	Mon,  4 Mar 2024 13:28:22 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08825C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 13:28:21 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-472b77fd2c3so123013137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Mar 2024 05:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709558901; x=1710163701;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NjMraSVWoQYij9IimFaQDDJ/jZpfa59SCn64UX2Kn1w=;
 b=Cu2J/VpmVcQRfdRxvXNOn5x9mU9643hS4a9QWf0YTJF61Q4ab+59ajZqxjaWlef2u6
 jh/Pvs0AvPnsAvYztVgi2G0AuC1OeypGPqmNhNqVleuwIS65Cg+TuCW5qM/KdVBK2BFe
 oCyXqvvrexIAvpldGGiwgWFaSp48cx3X6N8xAV2j8DK/qPE5aQQM8FUCD4q4dnNrocpF
 rezFMH2ACjkHjH8MoCrZTir2ccZJ7ZF20UpiLpS9eNNRZ7e8q2ZT9U+BqDgFeM4HrIPN
 CoGmz+4ofQUKgeJjnid+Ij3r6M1neaiOASnWDScaDW+5qdGWwoKZ0NioGWZ4ebfBIVp8
 UAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709558901; x=1710163701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NjMraSVWoQYij9IimFaQDDJ/jZpfa59SCn64UX2Kn1w=;
 b=brpC1d/QtwUV5779ZrUpAjVt1lvZtXkSPPl/uncl9qqY5TKL7d2D0rPMPZMobY8YYG
 XiJkAFurTbsNJJsKajWLhDbSJoA6UE2zNY9WLfspR7o74+3gqzX+WNpKi/JHtcQkIPgC
 mnhyL7MsFbB7YcvenqPedWN5O8wBh8/PFvgWFpDXaXBTCeBv2gDx4qP0EFOwst81e8/b
 g59mzA6amiSnml8tBEJdjN4y2pHjKmuy5VI91bZRS+sWzcgvAVeNi+9k+gWcfL4CX9Ts
 iA695NdM5o1y3Zfc4zW5+l6ZzZl+WuT+MrAAFsvprVGMpJB0J7UCX5iicXV0VsogHQl+
 ME1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+sr8OhhZzjXlNj9VWmtxbiFLmUestZu6w6O7Gq2gNjQqAwwxZdT0IInosI0l9PFcSE2L2+mO9rxISsj0AG9XihRHfsg5aXPs23EsgqImuuJxDUCeI94BX
X-Gm-Message-State: AOJu0YxcCSaJ06jI9Z9yUHhynXOsdiVszJCUHyYroyohKedrSRJlO9mW
 gW5EPR5/7OrLkeKGMub9tbOl1xYaJUk/0VDUX5TxKEoLmYB2QXW1o53p6iISSPM=
X-Google-Smtp-Source: AGHT+IFNUcp5lCuJw/WrmiIEhGGpeoh92Mwt0K7neBcsKMFMWsKmNTMDAXJGVmmNz1sh8R24IW8udQ==
X-Received: by 2002:a05:6102:35a:b0:471:f1a2:13c8 with SMTP id
 e26-20020a056102035a00b00471f1a213c8mr5222143vsa.11.1709558900667; 
 Mon, 04 Mar 2024 05:28:20 -0800 (PST)
Received: from ishi (072-189-067-006.res.spectrum.com. [72.189.67.6])
 by smtp.gmail.com with ESMTPSA id
 fv5-20020a0561301a8500b007da5d981866sm1279109uab.31.2024.03.04.05.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 05:28:20 -0800 (PST)
Date: Mon, 4 Mar 2024 08:28:17 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZeXMcUW6_rxcT1wd@ishi>
References: <20240301102505.591918-1-fabrice.gasnier@foss.st.com>
 <ZeH6e02zzfAjw-sd@ishi>
 <562cdbfe-9353-4f5d-a804-34e158a190a7@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <562cdbfe-9353-4f5d-a804-34e158a190a7@foss.st.com>
Cc: vigneshr@ti.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jpanis@baylibre.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5] counter: Introduce the
	COUNTER_COMP_FREQUENCY() macro
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
Content-Type: multipart/mixed; boundary="===============3547142711365275216=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3547142711365275216==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Mh9QAouw/rxE4EG"
Content-Disposition: inline


--/Mh9QAouw/rxE4EG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 09:41:14AM +0100, Fabrice Gasnier wrote:
> On 3/1/24 16:55, William Breathitt Gray wrote:
> > On Fri, Mar 01, 2024 at 11:25:05AM +0100, Fabrice Gasnier wrote:
> >> Now that there are two users for the "frequency" extension, introduce a
> >> new COUNTER_COMP_FREQUENCY() macro.
> >> This extension is intended to be a read-only signal attribute.
> >>
> >> Suggested-by: William Breathitt Gray <william.gray@linaro.org>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> >> ---
> >> Changes in v5
> >> - "frequency" extension is read-only, so there's no need to provide
> >>   a write parameter.
> >> - patch sent separately from "counter: Add stm32 timer events support"=
 [1]
> >> [1] https://lore.kernel.org/lkml/20240227173803.53906-2-fabrice.gasnie=
r@foss.st.com/
> >> ---
> >>  include/linux/counter.h | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/include/linux/counter.h b/include/linux/counter.h
> >> index 702e9108bbb4..0ac36f815b7d 100644
> >> --- a/include/linux/counter.h
> >> +++ b/include/linux/counter.h
> >> @@ -602,6 +602,13 @@ struct counter_array {
> >>  #define COUNTER_COMP_FLOOR(_read, _write) \
> >>  	COUNTER_COMP_COUNT_U64("floor", _read, _write)
> >> =20
> >> +#define COUNTER_COMP_FREQUENCY(_read) \
> >> +{ \
> >> +	.type =3D COUNTER_COMP_U64, \
> >> +	.name =3D "frequency", \
> >> +	.signal_u64_read =3D (_read), \
> >> +}
> >> +
> >>  #define COUNTER_COMP_POLARITY(_read, _write, _available) \
> >>  { \
> >>  	.type =3D COUNTER_COMP_SIGNAL_POLARITY, \
> >> --=20
> >> 2.25.1
> >=20
> > Hi Fabrice,
> >=20
> > Setting the structure members directly works, but why not use
> > COUNTER_COMP_SIGNAL_U64("frequency", _read, NULL) instead to keep the
> > code more succinct?
>=20
> Hi William,
>=20
> I originally wrote it this way, but I had a doubt since some macros use
> the structure members directly.

Ah yes, the macros that use the members directly are typically the ones
that are unique for their particular type. For example, the enum
constant type COUNTER_COMP_COUNT_DIRECTION will only ever be used with
the COUNTER_COMP_DIRECTION() macro.

For macros that are based on general types such as COUNTER_COMP_U64,
it's better to use the respective base macro such as
COUNTER_COMP_SIGNAL_U64(). Not only is this more succinct and clearer of
the intent, if the need arises in the future it allows us to upgrade the
the underlying base macro and have those changes propagate to the macros
that utilize it.

>=20
> I can update to use COUNTER_COMP_SIGNAL_U64() instead, that will spare
> few lines.
>=20
> Please let me know what you prefer (I guess your proposal above ?).
>=20
> Best Regards,
> Thanks,
> Fabrice

Update to use COUNTER_COMP_SIGNAL_U64() instead, and I should be able to
pick it up quickly.

Thanks,

William Breathitt Gray

--/Mh9QAouw/rxE4EG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZeXMcQAKCRC1SFbKvhIj
Kzu7AP9WkIVlQ1Jh+lBJDYsKAObw8kanQFNcLxQXqxQ3J9C7vgEAgbCKLZ/Qmpz7
xlUG50p0PKnSqTAKM66jyp3VikL6xAY=
=7J/c
-----END PGP SIGNATURE-----

--/Mh9QAouw/rxE4EG--

--===============3547142711365275216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3547142711365275216==--
