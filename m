Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FFE616FC2
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Nov 2022 22:30:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F62C04003;
	Wed,  2 Nov 2022 21:30:12 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 900F0C03FD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Nov 2022 21:30:10 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id e15so13394365qvo.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Nov 2022 14:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NnhizWAIbi5qruvOMfkQD7JHf83kJnMNlqaH+GW5Vh0=;
 b=QDdBEz1O25l6wo9j8kV5Sjmnbo1c3FXDV4OHpi1WeilJLJ5Z+VOzqW0FQ5cxaWwPp+
 rrfQWNepZUUXSyKd1X8Hu8Eqi0blhQGKXmerRF4DuU6AQ3b/jqUcMkOyfVbsPhYnGKLs
 1nK2/BEq403NTL0VW9SFzDitWTyJmAlcXR/QlT7KsSNC/xqEoTxG5VdewkDFCIp9q+K1
 h81ZawANVfE0Ip2sP3p34JTqN+d1FE9G7pXbs7cO2NGWjJYZuvrLuwgNjpuhsOzOsXKw
 qm82J9JF8p5KKnkvgDteUXWfixnKplnTEYOL2UgFW1Vv4P3WapBiGCT5xFdPB4ZdnzJ1
 T9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnhizWAIbi5qruvOMfkQD7JHf83kJnMNlqaH+GW5Vh0=;
 b=NmKpDiNK3CS/mDKP518tqH1pJIVK3RBS+m/O8Qkjz0W8I+JMiSFO3T/s1E9oxlL7uD
 NdMEEAKi71kyn3rS2bfSetDHIiSmFuoVmWbVTqTVWWNqR1ImH0Du2c0o6zE+kRJKmjbS
 Bdmaf77DqFQ5H5I41Xp19kwYmVFMpDL/DXKOTMu2/OMb0665f9kYL02CpklddpsucZFV
 6Sc75LlaTdiO7X5E76sm/IklB33JAwNtWPiT4Ei45AdGYNtKpdOVv0IyxVfiGVgfCbA+
 jcOLvSwgs0/+815O4xVXHO230Ix9SS3fKr8QT1jLx0yYT5EjgXG5J7cqBh2DO7tMu0vk
 bU5w==
X-Gm-Message-State: ACrzQf2GgjTG6T/PPhcQA8XmB++sTDCLUALBlZrHMTgWMH0oILLMQxHV
 AhkCJ2vqHvQsH6Nk8Qwnw+hg+A==
X-Google-Smtp-Source: AMsMyM5b+7hwrgJkxmNhxObQT8swErvoEdNYJyoRn824mVM6oOxzwoYl3T/uGWd8STZXh4U9qyFLdw==
X-Received: by 2002:a0c:9c8b:0:b0:4b1:ac82:5c50 with SMTP id
 i11-20020a0c9c8b000000b004b1ac825c50mr24036814qvf.15.1667424609463; 
 Wed, 02 Nov 2022 14:30:09 -0700 (PDT)
Received: from fedora (69-109-179-158.lightspeed.dybhfl.sbcglobal.net.
 [69.109.179.158]) by smtp.gmail.com with ESMTPSA id
 m11-20020ac8688b000000b0039a610a04b1sm7195595qtq.37.2022.11.02.14.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 14:30:08 -0700 (PDT)
Date: Wed, 2 Nov 2022 17:30:06 -0400
From: William Breathitt Gray <william.gray@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Message-ID: <Y2LhXqZgOAxL47AT@fedora>
References: <20221102172217.2860740-1-nathan@kernel.org>
 <202211021216.FF49E84C69@keescook>
 <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
Cc: linux-omap@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 Julien Panis <jpanis@baylibre.com>, David Lechner <david@lechnology.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] counter: Adjust final parameter type
 in function and signal callbacks
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
Content-Type: multipart/mixed; boundary="===============0435125021715438215=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0435125021715438215==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HEJ7wVOWhWkBpraW"
Content-Disposition: inline


--HEJ7wVOWhWkBpraW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2022 at 01:23:51PM -0700, Nathan Chancellor wrote:
> On Wed, Nov 02, 2022 at 12:21:23PM -0700, Kees Cook wrote:
> > On Wed, Nov 02, 2022 at 10:22:14AM -0700, Nathan Chancellor wrote:
> > > The ->signal_u32_read(), ->count_u32_read(), and ->count_u32_write()
> > > callbacks in 'struct counter_comp' expect the final parameter to have=
 a
> > > type of 'u32' or 'u32 *' but the ops functions that are being assigned
> > > to those callbacks have an enumerated type as the final parameter. Wh=
ile
> > > these are compatible from an ABI perspective, they will fail the
> > > aforementioned CFI checks.
> > >=20
> > > Adjust the type of the final parameter in the ->signal_read(),
> > > ->function_read(), and ->function_write() callbacks in 'struct
> > > counter_ops' and their implementations to match the prototypes in
> > > 'struct counter_comp' to clear up these warnings and CFI failures.
> >=20
> > I don't understand these changes. Where do 'struct counter_comp'
> > and 'struct counter_ops' get confused? I can only find matching
> > ops/assignments/calls, so I must be missing something. This looks like
> > a loss of CFI granularity instead of having wrappers added if there is
> > an enum/u32 conversion needed somewhere.
>=20
> Right, I am not the biggest fan of this change myself and it is entirely
> possible that I am misreading the warnings from the commit message but I
> do not see how
>=20
>         comp_node.comp.signal_u32_read =3D counter->ops->signal_read;
>=20
> and
>=20
>         comp_node.comp.count_u32_read =3D counter->ops->function_read;
>=20
> in counter_add_watch(),
>=20
>         comp.signal_u32_read =3D counter->ops->signal_read;
>=20
> in counter_signal_attrs_create(), and
>=20
>         comp.count_u32_read =3D counter->ops->function_read;
>         comp.count_u32_write =3D counter->ops->function_write;
>=20
> in counter_count_attrs_create() are currently safe under kCFI, since the
> final parameter type of the prototypes in 'struct counter_ops' does not
> match the final parameter type of the prototypes in 'struct
> counter_comp'. I would expect the indirect calls in counter_get_data()
> and counter_comp_u32_show() to fail currently.
>=20
> I briefly looked at making the 'struct counter_comp' callbacks match the
> 'struct counter_ops' ones but the COUNTER_COMP macros in
> include/linux/counter.h made it seem like these callbacks might be used
> by implementations that might use different enumerated types as the
> final parameter. I can look a little closer to see if we can make
> everything match.
>=20
> I am not sure how wrappers would work here, I can take a look into how
> feasible that is.
>=20
> Cheers,
> Nathan

The intention of the code here is to treat the last parameter as an
makeshift generic; the u32 will always be some corresponding enum type
provided by the driver. The expectation is for drivers to define
components via respective COUNTER_COMP_* macros, such that the
assignments of the *_u32_read/*_u32_write callbacks are abstracted away
and the driver can treat the respective last parameter as of the desired
enum type.

For example, COUNTER_COMP_DIRECTION is expected to be used with enum
counter_count_direction, COUNTER_COMP_POLARITY is expected to be used
with enum counter_signal_polarity, etc.

What would be nice is if there is a way to ensure the enum type of the
last parameter of the callback provided to these COUNTER_COMP_* macros
matches the particular respective COUNTER_COMP_* macro's expectation;
e.g. we should get some sort of error if COUNTER_COMP_DIRECTION is used
for a enum counter_signal_level, etc.

William Breathitt Gray

--HEJ7wVOWhWkBpraW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCY2LhXgAKCRC1SFbKvhIj
K7ujAP4vYYp4QiiMKB8y1V9TP6m+SGeLI3IIjMY/y3kpizOZ5gD/XNnop9AeiGkp
N0Emw/FK2KiTf7jlxG8uhVJCVgkrKQ8=
=e2Hi
-----END PGP SIGNATURE-----

--HEJ7wVOWhWkBpraW--

--===============0435125021715438215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0435125021715438215==--
