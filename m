Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131E96052D
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 11:11:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D78BDC6DD9A;
	Tue, 27 Aug 2024 09:11:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5374C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 09:11:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-371a92d8c90so2738828f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724749874; x=1725354674;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0I/JpqJzipAkXM6wL+TWfoJdVWaz6dbadmPUfGMsRt4=;
 b=DOGEeE6gQf06ZgoRxwTJyyRStkDRhHc5htupnbVAKqZT//m5q1yzK7w3wVGGMMavL5
 udlGppnSBi+FH3UeU8ZusOGbd5DGOHMiL/oVv9vU3xm095xas7wHGxjcXXi8xK6KetMp
 Xoo7zkqpFRafy+bAhf3LDILw/smGxthANi2GIZ3/7/Fnw+DsKPKt2Z31LHuzlIcwh3lC
 a6231m8f3dOCIF8Aq9J9j1lEI4NxW1GL0KCWgaeZXa9B9MAU4q9jysBMIcLMQW0KehKx
 3l92NW9YCe6YwX6FHnocLC6MyWaHbq4FKF0TBo+l0PpdQxanJzkacaW21LoAFay2lYWq
 Vb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724749874; x=1725354674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0I/JpqJzipAkXM6wL+TWfoJdVWaz6dbadmPUfGMsRt4=;
 b=kJ5bSykMbsHvTeL9ZmY8oXZPC+nxS3lxvxB4y7dRkT7v5p3kPwXse2qetMDueFHsCp
 lWbMd58gG/GX5RLqs2BWCXt1HDt2DTnrkphI8gmHpfPJvt3I0XlBCncrkePE950xzLti
 bf61ifhNoYVM41XqENJaznFoq/HVJ3DvoITwXhrPT62XD0bUidHKGQt6eaPs5wbgGbJy
 B1a90Aee9HogGwrS7MfDuPZr64yDsg5aDkLjR83v/5XIScAXSPgci0WTuKG/09LHHHAW
 +DSfb/8LxZIG5bGb6CY4/mrfxAOnZ2YYeyXdw41JZYDYCRn1UZ1l7ey4Jjkoj7Fo1qmg
 EJ7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy4S+tnCaap703kIe/nsIDfYPLmW19J9kX70ArDDgxcKefcRSXAs3rcDvbebt7zgopSSpgkFOT1psCFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxwLGy+aIsEl4YMiRMpvF2cpPdH1hpN1uWwvFHXR/CWl5nMXfeb
 5UFDscLAFYuAwO2mXpfi7tV20D6D5POYjoZi6OSF3Bycod9QruXn
X-Google-Smtp-Source: AGHT+IHOiX4Tzf1QO9DjykBfyZbDvLfL/SobHET/spkyu7r14E9kiKLxT5XWL3vDXYgDgUX6AnUsGA==
X-Received: by 2002:a5d:6885:0:b0:371:8bc9:1682 with SMTP id
 ffacd0b85a97d-3748c7dcc10mr1403639f8f.33.1724749873613; 
 Tue, 27 Aug 2024 02:11:13 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abee86df3sm216660775e9.14.2024.08.27.02.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 02:11:13 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:11:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <jrj5ymf6vc3my2dhjsl6g3jaseandjxrikzrjsqzcd4ajgw4zx@fh5habb3q3fr>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
 <20240816-cleanup-h-of-node-put-memory-v2-8-9eed0ee16b78@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-8-9eed0ee16b78@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v2 08/13] memory: tegra124-emc: simplify
 with scoped for each OF child loop
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
Content-Type: multipart/mixed; boundary="===============1577266292852601852=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1577266292852601852==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bumvdn2lofdrx2cq"
Content-Disposition: inline


--bumvdn2lofdrx2cq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 12:54:32PM GMT, Krzysztof Kozlowski wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bumvdn2lofdrx2cq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbNmC8ACgkQ3SOs138+
s6F5dg/9HZ95wNQyti4jz540muOA32uILZ+MyqPBkamtGTM/oa4DJwzf8P+LuwFW
9HM+43nKflFfKLrEK9OCf/0vqBOuFWcP3wTIXGvXXK9gH6Id/IUc3fzkDmVTRW3E
aoQ+3eu98h8XjDuerN7Q58l7vUmabCpsNohrs0S+wvUj072jqZnLStIVJITVV3p9
DQK1jt1AnA/iveWm2YaFNJXpVaw6hsHKeLH5Ge5hJR/mRJ23PxiTyVo/ThC5ztA+
z0joYHmoR5+voCZrFWquBjYcD77fe9k+jrzAq2HNesgp7aPAsdTPo0kl4mMyHS4t
tHsl7Ubzmq3AebiVgujulJusn4RYQiKKLlydDZci+1v4qq3+77WETU04ZscR8t+1
NALeYcc+2ULOsOgjPQjhrXCKTqWvuRi5xaFBvHvshuN9MZAOpe5W2ZG70rf1b2wi
yUh1U8LvcGGXX/D/GKfzzEiZn6m0TbKFFFA/R2XIQkM/34ibUCU4jJJCNXjBMSVG
9CBh9lurYwkPHvoI2aE+Xr5B8D57UezTJKKUOBA5VnfjmltMwDBrSdXxV1cs2PGf
A+R1lT7Pz1kz3WGVzgL9M84MmUAF2iRLcCk7mVXN6INzJROkGiI8T3/WnTdmJ18I
e1N0hilhIhW65jF03zOcpGSiSEe8lnmSpE3OO4IqrIxYx+8iCAs=
=1QP7
-----END PGP SIGNATURE-----

--bumvdn2lofdrx2cq--

--===============1577266292852601852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1577266292852601852==--
