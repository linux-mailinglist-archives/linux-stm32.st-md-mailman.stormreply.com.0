Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE8301A41
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Jan 2021 07:52:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 206BEC56634;
	Sun, 24 Jan 2021 06:52:45 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93518C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Jan 2021 06:52:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id b8so5707818plx.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jan 2021 22:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pyjJjIjAwqBAqBYpe34f4z3YvzgZOMNZpkQlTpZrZjo=;
 b=amjcQpwaeLj47+mpTvIPl2m2jIFuGy2mpjtYqeJrGqQj8Ms03hkUPOtOoOfoX94uCo
 o9lG2QGUhsCoHTTzhy3saZ+Y2ItPWGttLcWUq6D2FAWOapo0XcOHulC3OOWhYlpSNwZv
 6dCb3cHbtos8Z735z0/lnqrn5MMSmqzBpCs+KvZZ2et7Okh+wbCkhNFe+eXGAiykVTDw
 4X1Gfm1vpa0icO0kdJNHo2TJpDRAhsTgQhwv/zAKi0AGVg5zb/m0gnWY0XuL/68ZXa+a
 HulmH4xJbHb6Ozj+Pq02UEczJVwcVI1F8/U7Q6wByfbjnd5oCx4okTlWw15qLlWGpN86
 wRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pyjJjIjAwqBAqBYpe34f4z3YvzgZOMNZpkQlTpZrZjo=;
 b=Ov3vhvwNhi6bwgIYhvujOrUngZxsbzmMQw+Q/AI3xfUim19lNXLUpCghqtPqMQe1DV
 PghGW/AgnkHxHs+Q61/ISxGvR65Tol8KYWGIL3/k25h9zDdIn9wE9ED0Lr8xEyGFQfPw
 ZI8BKbVdJ1NFvs5fBLnRhxq/FJXx9AuY/tZjaBzVWvcQdKgq0eAKkoO4IltrVUh7lib3
 Pc0P4rNBwsSc7BZrfcdyUq4U0j7QLsbywny92Zno98dBSmQBoUmKd8b9DVZAB9pi6rLc
 qbq9oCNyiidn8Qw7yVUcL1FCkLjw0Vko5QhXCVpz861e+Pv4axE88EgquzyEasc7BFdy
 EkAQ==
X-Gm-Message-State: AOAM531KnMyd5owqw/DGFG7paugGALqqqj5qh7Tbw5I+LIfpqTn5Bmj1
 PyZS4WRw4yWtijvPUNw2QIY=
X-Google-Smtp-Source: ABdhPJyxkV+O/+aWYQ10BwEq4a29+MEs/T0dQE+y09aAvRy0RqIED6p/FYfCfJQKuynTReotktv6Og==
X-Received: by 2002:a17:90a:5a03:: with SMTP id b3mr2385204pjd.1.1611471160359; 
 Sat, 23 Jan 2021 22:52:40 -0800 (PST)
Received: from shinobu (113x33x126x33.ap113.ftth.ucom.ne.jp. [113.33.126.33])
 by smtp.gmail.com with ESMTPSA id
 f15sm14172870pja.24.2021.01.23.22.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 22:52:39 -0800 (PST)
Date: Sun, 24 Jan 2021 15:52:31 +0900
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YA0ZL2g/qX7tigJa@shinobu>
References: <1611327803-882-1-git-send-email-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <1611327803-882-1-git-send-email-fabrice.gasnier@foss.st.com>
Cc: alexandre.torgue@st.com, linux-doc@vger.kernel.org,
 mchehab+huawei@kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, jic23@kernel.org, lukas.bulwahn@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-lptimer-cnt: remove iio
	counter abi
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
Content-Type: multipart/mixed; boundary="===============3952028261615768261=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3952028261615768261==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ifstk+I27HDRTTHT"
Content-Disposition: inline


--Ifstk+I27HDRTTHT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 04:03:23PM +0100, Fabrice Gasnier wrote:
> Currently, the STM32 LP Timer counter driver registers into both IIO and
> counter subsystems, which is redundant.
>=20
> Remove the IIO counter ABI and IIO registration from the STM32 LP Timer
> counter driver since it's been superseded by the Counter subsystem
> as discussed in [1].
>=20
> Keep only the counter subsystem related part.
> Move a part of the ABI documentation into a driver comment.
>=20
> This also removes a duplicate ABI warning
> $ scripts/get_abi.pl validate
> ...
> /sys/bus/iio/devices/iio:deviceX/in_count0_preset is defined 2 times:
>   ./Documentation/ABI/testing/sysfs-bus-iio-timer-stm32:100
>   ./Documentation/ABI/testing/sysfs-bus-iio-lptimer-stm32:0
>=20
> [1] https://lkml.org/lkml/2021/1/19/347
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

I'll also submit a patchset removing the IIO code from the 104-quad-8
driver and the rest of the IIO counter ABI documentation.

William Breathitt Gray

--Ifstk+I27HDRTTHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAmANGRkACgkQhvpINdm7
VJJ4Iw//fPBOTOQrrg//Y+6Qf3vPDPUfv4B2MY4bu5RIja9Hw6jqw1OWFxsYLFeX
TYm4Hl3K7RSsPfeWFcCgFdp/IvSK0CMH+nHuIPcwKxsE+E0cm4ExztexpmZUR5kD
znjePAQzo9H2kYJEmQ26Vb718AzdkaWVWOVX736TT7ecZOMKngyJg2tZ6qK+9uI2
KMRoJPzqfl1O3lVAWiCMI91fNggTxinxZyKKTMq15GTirPn2ZRbX8i9Nxxepskf0
QHdze2Gz+lgwDJxOLfzohpF64DG7NcMSYvMbg9EsXTBc5gL72Fmfk2wgHhx/aeUP
5byMCFTXfAZOQWaQN4CugKhcLy8Bxv/JAXH+BEqFeIt0PoJhPvJ0X62zTBmzswXS
8jvGq8OTGwvFisJxyx4vZk8ODxWkVNwch7ItXc8/oj6NdgDfYaYUQpEKHYEvggvn
73jVfSPFxAfouk5p8Lo2aFVokJ9lRn/rl/mW6Bwq0DS3nJ8vawX/PQfGx1y3MV/o
cKE7kdq8ZPjXnijG8heeehweI6eRFuV/bcnFvN3GxlIv/hkCWdhZ0b67ZEiUz4uE
yCp/WjCBBoQbkAwvf5Q+VWuycmFHVBRJ48I+PLOGKykeJO4C2Z5eQwEAnhaGcD9O
VJ85gCrUdvzODq0fhpFWY3fXT4Xm1b0FMWtY8w2rshsQ6GToxzY=
=WMsJ
-----END PGP SIGNATURE-----

--Ifstk+I27HDRTTHT--

--===============3952028261615768261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3952028261615768261==--
