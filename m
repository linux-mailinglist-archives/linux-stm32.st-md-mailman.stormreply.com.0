Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA2D8275A8
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 17:46:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4075AC6DD66;
	Mon,  8 Jan 2024 16:46:43 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1722EC6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 16:46:41 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-46788b25f95so258772137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 08:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704732400; x=1705337200;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v86cSdeLVN4Eor53KHOEZU66rYPCIfEGIjL+hEGlyNA=;
 b=V3S2yjqXwIaIFjKm3xOjxXD/d92BgTbEocanUITUr8vZ+lM/2KiuwmGt2nV2TRRny2
 yLrlEwMSSUkRlXzddqXpB+8vxh7OtuUMRFhVBrifI8e0ZzvqPb1JAASw+wI8CEbEqpkw
 dZ8w+YQEZXyFAkV8Y0QxUWfvLc2+FZy6Bjqbaw4PyC8ND8LBR3EBlOVH7Wn6+vAq3azt
 JOFw/BOcMxYqpCIONcclm67axCi4RHT9oUSVfm93+kmImaM/uGfPxhTqb7FjQEG8gugW
 D+9t45gW45TEwgy4C3w0FgTQSuiIirQDr4Xakr15O9zP47VRf5wwEOpTEnPPw/PR5RVA
 6zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704732400; x=1705337200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v86cSdeLVN4Eor53KHOEZU66rYPCIfEGIjL+hEGlyNA=;
 b=f44Vr2TQwomwEkiC4gLEmYfTBeL1faMv8OcoI5K8chz+jJcVre5ZrPqChSrEq3DR23
 7B7ycvwLttSH5kyqq74TN1FHtRcl5bCb7Ec/m/vlHzDOYM41LqnF70yOdZNQ2KbpENT/
 yazqKXCoHsdCyd+9R5hCXNxm9A9gYm1qpDmpOQmE1aJk8LduLDSaYb7ttW1OwU3VkxA4
 bmmONqCesfmSdfvoY26Xfqt3vJzIwuHgtdltlDNVhgW0cxuE5AGguKNHemy85HTalJTx
 k+hIOOQ9UXOl94tP+QGEG/7+41VstHNB2arfLdwWel9xU+zN/ZfP5S6QkBli6YPvSPk/
 xdUQ==
X-Gm-Message-State: AOJu0YyyRu0yBwwYNtnpRGSkudAem0UvZd8tBFLFBVeZpWsz+cfxzEXL
 U1DrIBkRVbyeQt5VEs52smDF5us0jhhYww==
X-Google-Smtp-Source: AGHT+IFDHtN0shChS/FabzBprTpMRYYx1/bf2NeDqz0LAzczeUWPYsOkVksyLMdiy/L1EaVaq6GIxA==
X-Received: by 2002:a67:e687:0:b0:467:a189:2f51 with SMTP id
 hv7-20020a67e687000000b00467a1892f51mr1623827vsb.66.1704732399907; 
 Mon, 08 Jan 2024 08:46:39 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 hx6-20020a67e786000000b00467be2e0fa1sm26884vsb.25.2024.01.08.08.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 08:46:39 -0800 (PST)
Date: Mon, 8 Jan 2024 16:46:37 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwm7ZyrL7vFn0Xd@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-5-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 04/10] counter: stm32-timer-cnt:
	introduce clock signal
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
Content-Type: multipart/mixed; boundary="===============6289870365202350377=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6289870365202350377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FfZYnz6NI7seIHjE"
Content-Disposition: inline


--FfZYnz6NI7seIHjE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:20PM +0100, Fabrice Gasnier wrote:
> Introduce the internal clock signal, used to count when in simple rising
> function. Also add the "frequency" extension to the clock signal.
>=20
> With this patch, signal action reports a consistent state when "increase"
> function is used, and the counting frequency:
>     $ echo increase > function
>     $ grep -H "" signal*_action
>     signal0_action:none
>     signal1_action:none
>     signal2_action:rising edge
>     $ echo 1 > enable
>     $ cat count
>     25425
>     $ cat count
>     44439
>     $ cat ../signal2/frequency
>     208877930
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

The code is all right, but some minor suggestions below.

> +static struct counter_comp stm32_count_clock_ext[] =3D {
> +	COUNTER_COMP_SIGNAL_U64("frequency", stm32_count_clk_get_freq, NULL),

It might be worth introducing a new COUNTER_COMP_FREQUENCY() macro now
that we have a second driver with the 'frequency' extension
(ti-ecap-capture also has 'frequency'). But it's up to you if you want
to add a precursor patch to this series, or I'll introduce it separately
myself in a independent patch.

> @@ -287,7 +321,13 @@ static struct counter_signal stm32_signals[] =3D {
>  	{
>  		.id =3D STM32_CH2_SIG,
>  		.name =3D "Channel 2"
> -	}
> +	},
> +	{
> +		.id =3D STM32_CLOCK_SIG,
> +		.name =3D "Clock Signal",

The word "Signal" feels unnecessary to me when both the sysfs path and
data structure will have 'signal' already. Do you think "Clock" by
itself is clear enough?

William Breathitt Gray

--FfZYnz6NI7seIHjE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwm7QAKCRC1SFbKvhIj
K9HkAP9p5tjj9d7bEok5P8rHe8XAO3QFNKaXaaEcdc+BJgMHqAEA2FngXSvqxRzd
DSkZbpLR+ErJlXMCYj6LMcwcTUqC2Qk=
=D0v2
-----END PGP SIGNATURE-----

--FfZYnz6NI7seIHjE--

--===============6289870365202350377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6289870365202350377==--
