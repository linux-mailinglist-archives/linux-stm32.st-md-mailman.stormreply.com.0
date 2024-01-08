Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED03827648
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 18:25:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4555C6DD66;
	Mon,  8 Jan 2024 17:25:53 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC6FEC6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 17:25:52 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-4b7b28211beso367972e0c.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 09:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704734752; x=1705339552;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WpCOTIlqbuft57aTYAHETU0NJnJb1485dKEn5DsMcpQ=;
 b=LFdANaQrozXH975/3ehiwTowaoDsXNrVFMrbZZ/2fQofy8xlsrH8VfFUtYbbwCkweK
 b7Xl0dSFYf/iKbnKyzlXrrP8ph0dUK1+vUsZ9GHvXGvUUlRCLv+CHy5WhkuGPVO8+PhL
 4hnY/BBuJD1BNQlcuPWqgXIkD9htIuTfkzsLV1uKeB4aB1KFpYzHAGL1IeRgzszkxbBJ
 Rlt28dx6NY8CDnS1yvDa08Js5Xbg5Bbxq+pIceMTcYiCLYGjlupdIC/pgkpmzVWIQhb3
 HU2M4HnY+u9UYTC1eD7HYiMCVSOYFw+kzzltXflXjtUD/EXntWA5nMjZoAE9DMBlTBDv
 x1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704734752; x=1705339552;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpCOTIlqbuft57aTYAHETU0NJnJb1485dKEn5DsMcpQ=;
 b=CG6ovOGuE/r03EvJehCbD7F3kggfXFcywSqoBgZKwNLjv3Q7zEKP3+ONrz80xwyWUN
 tDTARrJSKpcoC31sLPRhmDLR77fgFp1F1r2vs5FyDap/7q8ZglJv1ARxtjgSzTDTIupc
 4E17N96ONnjvqCHVgULyWAC6KuFMP9B3cFycvw+2E6dCyxekwXguPnK5oiwCq3pPuoMb
 BAQ/kIldHgoOOOwfnhUaZ47hsBYT6ssLGGDUu4g8psMSWJgRphH52D3MLMkJIeen8iDP
 UKvDt+KAHilBHMEGge4y17BYdTz/neR7PWkmbWKybv0P5bn2Y1P6GDivWu59kQTCjj6q
 CACg==
X-Gm-Message-State: AOJu0YwwwTe5iiHt+etLt14HYoQmK0l60uP4wQyRMtWKLc6k/lbtjGa9
 xxBl1VrTrYsMDLfJgiB6WUCkW2KEnUIrmQ==
X-Google-Smtp-Source: AGHT+IG2wN30jsYz+KEWDrzc7NDOQ+4R0TmDVrin5hgMKnBcVP6ilXtqIrxu9UxegoJmUGV8ikZUbQ==
X-Received: by 2002:ac5:ce15:0:b0:4b7:8196:7715 with SMTP id
 j21-20020ac5ce15000000b004b781967715mr1264348vki.14.1704734751758; 
 Mon, 08 Jan 2024 09:25:51 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 eo1-20020a056122388100b004b71620a7d5sm32298vkb.28.2024.01.08.09.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 09:25:51 -0800 (PST)
Date: Mon, 8 Jan 2024 17:25:48 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwwHBS224JXn2Hf@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-9-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-9-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 08/10] counter: stm32-timer-cnt: probe
 number of channels from registers
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
Content-Type: multipart/mixed; boundary="===============6109378466032756165=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6109378466032756165==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s+ElIGvTpO6OYXT3"
Content-Disposition: inline


--s+ElIGvTpO6OYXT3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:24PM +0100, Fabrice Gasnier wrote:
> Probe the number of capture compare channels, by writing CCER register bi=
ts
> and read them back. Take care to restore the register original value.
>=20
> This is a precursor patch to support capture channels.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v3:
> - New patch split from:
>   "counter: stm32-timer-cnt: populate capture channels and check encoder"
> ---
>  drivers/counter/stm32-timer-cnt.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 55eb6af34750..b5dc4378fecf 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -43,6 +43,7 @@ struct stm32_timer_cnt {
>  	struct stm32_timer_regs bak;
>  	bool has_encoder;
>  	u32 idx;
> +	unsigned int nchannels;
>  };
> =20
>  static const enum counter_function stm32_count_functions[] =3D {
> @@ -417,6 +418,20 @@ static struct counter_count stm32_counts =3D {
>  	.num_ext =3D ARRAY_SIZE(stm32_count_ext)
>  };
> =20
> +static void stm32_timer_cnt_detect_channels(struct platform_device *pdev,

Like stm32_timer_cnt_probe_encoder() in one of the previous patches,
this function uses 'pdev' only to access 'dev'. Pass a reference to
'dev' directly instead.

William Breathitt Gray

--s+ElIGvTpO6OYXT3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwwHAAKCRC1SFbKvhIj
K+NhAQD7UTpd7xtERic8jhg3U9gZyAlOd7tZl2JFUwCcjokjvgEA9zas8C7NQg1N
G9mPHn1XtkZXe31uApBNUsx9M6unJQE=
=3UXx
-----END PGP SIGNATURE-----

--s+ElIGvTpO6OYXT3--

--===============6109378466032756165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6109378466032756165==--
