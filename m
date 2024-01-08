Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C50827543
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 17:34:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75D5FC6DD66;
	Mon,  8 Jan 2024 16:34:15 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD55FC6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 16:34:13 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4676a37e2c4so441373137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jan 2024 08:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704731653; x=1705336453;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fHFnMSPKJS+MsU+LmkMOjkcyVfbo7MPduwk+npNeGQg=;
 b=NFE6uq8LSMr0LXLjbK5PrR8n9DAL2scBo9ZiKXe4Z37ftVdHAYJGoM1Vc/XjT17zhV
 gAS9XSeC2NoaSJn/qh+AN8id0La+ghHomyS7ylblCp8cJhaSop0XDaj+VmmoWdWWFUd0
 CAzgmx/iqxYp/IJBsNRuOLWHOZnHg/o1CKXK3PBpLs7bErfkDobrmmCGkq4jFfo0J13w
 y0NWPZ5LfDodqsI/A1OkkvzXpdP5C32MvEWWdFOACBg2ELXo84PRMQDioTC8LVh38Qd3
 DSw31IJbIvOcndcSsB5pNwslmrKcaNT1uXYd4VCzZ2ipUUGDO7Hb/5lq3EhMIL5LL0rh
 GB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704731653; x=1705336453;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHFnMSPKJS+MsU+LmkMOjkcyVfbo7MPduwk+npNeGQg=;
 b=mlot28S+c7oK+s3gvoX4WwLCFa253skrVgkfOOKhOtZwbc8dLClwalyuNQ1QsxeDNB
 Ty0NbLMJrd1XKcEwJBQjXr2zM65knvMIMPjjjibOfacxHTU+D4IQ4TYkXI0RT/xNofsb
 wP465/FPhYlocGDBV/ocvB7Pih1FGYvyeAlAk62LNg3m9hr73lqdKdbTdxLn5KjhTwtT
 EW1RmMrSxc65iozHRmeKnfNPD6H/aW9kHSCMrLTtSPtVEYJRLSY0fhh2AgjA4tX0VsUt
 IA6AFNu5DWCcqEUOXRnszXC33Yq0Swq7vI/f5wBO5U5c40v/eFcCFgkM2Mppa0owVxFy
 emGA==
X-Gm-Message-State: AOJu0YyATN0A7/kb+Vw1wiEqQ7XTwNum7NJWbkJcd8rB/M9hIRYs9c3j
 A7u0oQLDp/AOIBg3fSMKwyPkT0HyZS1Vbw==
X-Google-Smtp-Source: AGHT+IGJc4KJIdikcnB6yTrThRooVa+lQXzg0GhWaOLz2a4/SoKrdlHZ09f6kAqhm9yd20QGRd/2Rw==
X-Received: by 2002:a05:6102:32c4:b0:466:a788:3b3d with SMTP id
 o4-20020a05610232c400b00466a7883b3dmr2320170vss.5.1704731652489; 
 Mon, 08 Jan 2024 08:34:12 -0800 (PST)
Received: from ubuntu-server-vm-macos (072-189-067-006.res.spectrum.com.
 [72.189.67.6]) by smtp.gmail.com with ESMTPSA id
 ia8-20020a0561024b0800b00467c8a9ed3fsm24646vsb.15.2024.01.08.08.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 08:34:11 -0800 (PST)
Date: Mon, 8 Jan 2024 16:34:09 +0000
From: William Breathitt Gray <william.gray@linaro.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <ZZwkAR/DD2yElYQk@ubuntu-server-vm-macos>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20231220145726.640627-3-fabrice.gasnier@foss.st.com>
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 02/10] counter: stm32-timer-cnt: rename
	counter
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
Content-Type: multipart/mixed; boundary="===============3972836562504962971=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3972836562504962971==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r0P87XSHUG2RZJfY"
Content-Disposition: inline


--r0P87XSHUG2RZJfY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 03:57:18PM +0100, Fabrice Gasnier wrote:
> The STM32 timer may count on various sources or channels. The counter
> isn't specifically counting on channe1 1. So rename it to avoid a
> confusion.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Reviewed-by: William Breathitt Gray <william.gray@linaro.org>

--r0P87XSHUG2RZJfY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZZwkAQAKCRC1SFbKvhIj
KwTdAQDOmsC43umCubyDQb5Ham5tg3Vf+30AuOL1mI8YBRV0/gEAvHWZZ5yKsL0W
4K7YQWzO4KZhEeu7cam2sUxteRvhTAs=
=wZZQ
-----END PGP SIGNATURE-----

--r0P87XSHUG2RZJfY--

--===============3972836562504962971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3972836562504962971==--
