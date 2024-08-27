Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC78960532
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 11:11:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4D9FC6DD9A;
	Tue, 27 Aug 2024 09:11:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75D72C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 09:11:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-371941bbfb0so2953515f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724749890; x=1725354690;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oLL/OWzUKjTOsW0yhZt6S0dbj8tspxhqWujNdTE7Pg8=;
 b=AlenqpL7NnJVpjunkz0ZUj9YShvS7NihaDocgwb4oadobra6kv/165w0lJT1+GBm1f
 eHy7EsD3hqfq8g+8H9HNYQaqyP+UATtUIpHKQfMGVq7EbH3BXunDBpjL6RLFIk7Q3hjM
 q1Ce5YWuXaUsCsmlcalOWYCJ5z5WgnKuCnXNHdSGU94Qa3K0SM5yzppXOLYaUU0XTqtz
 s5Ua6hjBtCu5wVm4v9ZB0skL3oCOBmE1tA59j+jXJRxkkEWPwB+n2apRs+nQlzvzSbYa
 QJAYtH+vVPyp17gFuZ7X5t82+rIbMT/gStAgmeL3ZOQt1B4n1jX9evk5+wV68/UWJhhd
 r4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724749890; x=1725354690;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLL/OWzUKjTOsW0yhZt6S0dbj8tspxhqWujNdTE7Pg8=;
 b=v4Ox3xA01nACnTHri3gmKcvccGiYrqcu8wwIu1E+HrA1jsTACy05NHMjMGFe/v2cpp
 GiCA3Nc+5MFu1UYkxjf8XMBY/oA9hGFzuCA32BBmgO0hrqblfWIcLSknFHYZKD3qidJ8
 oMvSGkDQqM1qf1JIKX95p29b+B7Slwx9WUooONsXEduDcGlc78KqOB6C7zbEqYe6YqGD
 7oKcFI/5YhO33ryztEBmbJU/VlZ6sXlvqE3vQEOc8fCHkYK8Z/DzRkjXvdFIJPnfx0Cw
 rU3YdYMbvBBbV2c/r2Mbs48ThpInq9aYs+yL2QlQqTseImS6LKXBg78/CKIyjNBpAb1E
 fEPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Nmg9SQuN06wioxaAiyljb0C94VuxfO/cKypl4SDHiRg39MBqeA2lCcRSwblw7EFC2JmSiDx32a8WMw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyjMCg9A5DTmmLzrh9M6a2iM4x83/WNQ4jmsFOiWc5mzdPTKUzI
 bUyZranDlumUTmGuwPu3R2A2xRjxvxiwMu/iFvXFU/9O6ECYw6Jx
X-Google-Smtp-Source: AGHT+IFi85nyAehGj3iKq2A4If1iHsiwwJ1u4RTXxZEFEGwFqgGILvEaSLhsizpjLBZYAYs/BwQFkA==
X-Received: by 2002:adf:8b94:0:b0:368:3b83:65be with SMTP id
 ffacd0b85a97d-3748c7d4cddmr1676803f8f.26.1724749889341; 
 Tue, 27 Aug 2024 02:11:29 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-373081ff625sm12709306f8f.70.2024.08.27.02.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 02:11:28 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:11:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <42yb4atovunowsvkoamtazfoojhwpkyc6vwkrnfsgqcv67mafw@w4fdgm5svikk>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
 <20240816-cleanup-h-of-node-put-memory-v2-9-9eed0ee16b78@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-9-9eed0ee16b78@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v2 09/13] memory: tegra20-emc: simplify
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
Content-Type: multipart/mixed; boundary="===============2500345420852529910=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2500345420852529910==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bgt25yvt622okheh"
Content-Disposition: inline


--bgt25yvt622okheh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 12:54:33PM GMT, Krzysztof Kozlowski wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--bgt25yvt622okheh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbNmD8ACgkQ3SOs138+
s6EGGA/8CWaIIk0lQnkbDNlIU2D3Joik1HrBL/neYEtOa/brN+ATKxrFDTjKKzBk
wgjiFgo/omL+sQs2WKFPvWSlddttRCU2CnxJ6h0U5cnBc8lOWVe0n1Izp1XMxt5B
dPvYjVeWOmS37pouCUBw7GvMkjz79xNsH64PWmz7iwzbMwTCzejly3YlbapFMXCR
mqNOpPNOAY6jwWJK6I7Gz0mEE4MRMeUKsY/v1+vVpDn8bkMMG2e4xmpli93UAosk
gxa/Uf/T7jqpbtistI8d+zY8tLX4tOmzpIua7TeZauTMbwE+QI3bSEd9C0CRmITx
1RwI3bZTfWyqSQrJNp59x7VON2mA8mBe1kGpjxuLjnoTuLzZKu0eUGWGLbU+vJdM
TXjrJDuH98gdTLbHQtuy50Gnlwg44MuGccxy/sGd/6ozUjPy/Ya++yXsIwr2MPJe
2srxI+yWU8XtbXBH86XVlTa0Ao8XKoIEeQsYAaGQSlaQphHjfkEi8oS79Hp9W3fZ
91++lqyXleLXOBdT2KXP0VWTBObEz9DofoyKNsvdwz+vRXrZREHYavhr3uwUm6Sz
cmZ4IxbL2BD15ixS/YpP2hA2Au2nL2OfdFBnC4JbXXA0dQVgYJRvrzLIJSMHTXVk
WQNWu4Tzu91OvNjsPO5RYC2lDRHCm2jwEhfiwwZmjpTn0HizrIs=
=zKjD
-----END PGP SIGNATURE-----

--bgt25yvt622okheh--

--===============2500345420852529910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2500345420852529910==--
