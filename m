Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F88740A2
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 20:41:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78B02C6A613;
	Wed,  6 Mar 2024 19:41:13 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6022AC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 19:41:12 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-472640aba12so29168137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Mar 2024 11:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709754071; x=1710358871;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KKJXr/IAgS9AlJDdgpqcbHwwmBwIbrtKq+tJPd0RqcE=;
 b=C1qaCup8L/4ShMci33g4RFBsgz6w8mj3d55oxWWVJMu63NK3SEJcy1RvQXP12LWDIM
 zXSV5TToctxbRo8Afv1MkObfeDpfcldzhlUd0TiXo9xHHsuWFKchXRyVrp8XpLXvw0zB
 YlMaVsbJTP1cgax+sHKMfykCKMvYs0WFYqBYWWcx6GSWgewMaQPscR3h3z890C1EhHik
 MFOorlKFiR7cIuJ10xikW20DBs1BRNuDhwQejf7udMDdCbkELCCylO4LFPdc5ZNng77U
 tb/7De2Iy/ezSni9KEP/aqbyM+hTP4szFts1Aexz/SPkonNUF+9t/V2PIyQNB5x+OExF
 7RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709754071; x=1710358871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKJXr/IAgS9AlJDdgpqcbHwwmBwIbrtKq+tJPd0RqcE=;
 b=YdG1IlilvARi6o/qmJyc99jZvN4u/RUZY10eDvzruzJO238oKQrzWrVnZl/VnCwZtZ
 swCvaTy7NldmXoLUCG2yFHy1H+TSPLxhYQgNu029f7Xhc/n2kdPEjbSNKF0wGI7wYUxc
 YdBmnvNiYDO72nCIsl/lYeu7C1X52lgXJ/yJ/xyIDbbxAMKuNxfNfpbDDXYEYXf62ctS
 YirwCSNwAvLDOUx1qgFBCcZPv7eOyJTFEK7itjMcoZZLSIcnuAE3hd0RqvH/NdZyd7iC
 VR8i9AKQBbDADkeo+flP8kZ/9B2oQsru3gpY3bk9TEIjbJZb1BPmrQYXlIYFPgkBT+q4
 mLyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkJ9OFVWjqTPC5Y596o4meSB6RpITx1FQ1trnFtiyIDG2coTq9DLcs5bmJM4zlsbSFZkDyKoEJJt0ojXPAbOjLH0yn8QcjyoHrjpdmcWYnVHE9dIayjY8N
X-Gm-Message-State: AOJu0YzyrHY+l7ejUYCnAKB9xZndg9KHrPlY+ArumEt2qxti6ppvlk5F
 ZaZ/bStWzkKrN+gRPRPwL1zXGsB7Ow2mTROtVeoi2kmfjzpKAasnF6rolYeIr88=
X-Google-Smtp-Source: AGHT+IFO+ljYLVgCOupSmKdJuFOFah4rKhUWFVzXldvgD/GHMK/C9G/U7YhQ9LS9dryw7WNrKrcxug==
X-Received: by 2002:a67:ee52:0:b0:472:5960:9e9b with SMTP id
 g18-20020a67ee52000000b0047259609e9bmr5925192vsp.29.1709754071236; 
 Wed, 06 Mar 2024 11:41:11 -0800 (PST)
Received: from ishi ([185.243.57.249]) by smtp.gmail.com with ESMTPSA id
 dg17-20020a056102571100b0046ee0e665ffsm2323364vsb.2.2024.03.06.11.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 11:41:10 -0800 (PST)
Date: Wed, 6 Mar 2024 14:41:08 -0500
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZejG1BJlT2BTL44G@ishi>
References: <20240227173803.53906-1-fabrice.gasnier@foss.st.com>
 <20240227173803.53906-12-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20240227173803.53906-12-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 11/11] counter: stm32-timer-cnt: add
 support for capture events
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
Content-Type: multipart/mixed; boundary="===============2004766184589341443=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2004766184589341443==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/7E2qpchrMeFZ+eS"
Content-Disposition: inline


--/7E2qpchrMeFZ+eS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 06:38:03PM +0100, Fabrice Gasnier wrote:
> Add support for capture events. Captured counter value for each channel
> can be retrieved through CCRx register.
> STM32 timers can have up to 4 capture channels (on input channel 1 to
> channel 4), hence need to check the number of channels before reading
> the capture data.
> The capture configuration is hard-coded to capture signals on both edges
> (non-inverted). Interrupts are used to report events independently for
> each channel.
>=20
> Acked-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--/7E2qpchrMeFZ+eS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZejG1AAKCRC1SFbKvhIj
K3DwAP9JgKrctTyHYndvFGfvRBz7a0xr6aDBY7DMfn5Cd+yMRgEAtVnZbcuUt76/
QGXXSQ+ceWI8oq9r9tubyWD2rrCO7wI=
=CNt0
-----END PGP SIGNATURE-----

--/7E2qpchrMeFZ+eS--

--===============2004766184589341443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2004766184589341443==--
