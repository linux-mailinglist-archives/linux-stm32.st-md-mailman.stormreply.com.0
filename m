Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C25960538
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 11:11:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1CD8C6DD9A;
	Tue, 27 Aug 2024 09:11:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BDD7C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 09:11:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3718ca50fd7so3245729f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724749910; x=1725354710;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1Rxz/g5Udp2ISvezkDRJmTgXbSVsaowIQmp3KwcELt0=;
 b=XOTl93utRnQsZwqdguwNFw+94tAa+PKP/9ZJzL0XOhbQGvbN9noItY4ya4yfqFIZ+z
 q1WA4AGUl7dSHh7KiI+Fv9uUOoGjDED+uLs0zwyAD9hgN3HICexWR9wt7JEAs7VjLyjN
 S5ojyJJT7M/bBHZn2yDcCYAts9Zt1+RppxOZp8Q5HCBAMRgob9lzs5jvXIIrD54BwofG
 gk/UduGUnUMaxO3A8dwNL23twOqNILwv8BRoobXmX4UQtMuAJjrJPLlzwImQSuJdKXNR
 uAWhdtY1s4T+pA/bOnLYIL8xVNhsWZhvdwNANZRnj/YLCdkqBjgN38jGO4lQv72lhwZ5
 05nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724749910; x=1725354710;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Rxz/g5Udp2ISvezkDRJmTgXbSVsaowIQmp3KwcELt0=;
 b=t2Rc7Vt7tXYOs9tHrLH1UZSj5WMDpU8FOntmirp8Belf6LrEC/j7d5KZbLkbj1BOPX
 9u+/YOLT80lFXpdWx9YVMPaXeIAjFg8ldPZm0xcjRrM0rk2rNp4reHZWdPHTB9sJ8ilj
 fXY80Mcm1GOm95/Se8414HijStNq93OhMn5eK81B5Sfd4AK/Nle5ZZCohnn3nnKI4F4I
 fBxU2eEtjmtEVvx37VOca1QpVgoo91zLMzWmts1SSp9nd+P/mz59TiXGaU+MYbHK8izo
 V1jZil3MvMo9XW8ZS8VTrx/ZI3821PYWKOBOTxohUt3eGcb46h18DrD/VfSFW5ot1jD7
 VdLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKr230Hl9YMa9niyidl+oHCfpCb41eh96hE8wi0SMJzA6VgPPU+JAumgCH6N3ke1iuIUvfU5DQJxqKWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6qvu6eRgHmmq8Ky78hFX+gb9DNj4t0UHTUaFzldP2oWU0pIrM
 eF/cyWzdZ5/658GnRJhkVyJ4RR5JEYyRC/8Xz0dFsW7qz5HMOXce
X-Google-Smtp-Source: AGHT+IH3gY0tZL9/MUxL78mjhBtGph009hNLuaNSVh3LSVf/dDBE7UBi2zVopRKHMDZ+B1HvKipI4w==
X-Received: by 2002:adf:fc8e:0:b0:368:12ef:92cf with SMTP id
 ffacd0b85a97d-3748c817d8fmr1533232f8f.48.1724749909408; 
 Tue, 27 Aug 2024 02:11:49 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730815b7eesm12514046f8f.54.2024.08.27.02.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 02:11:49 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:11:47 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <6tiwlvikgfwp46dy6jufoxskxp3ndcsjfvjqpqu3j7ktjm7zfr@jd7rjcsfexbf>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
 <20240816-cleanup-h-of-node-put-memory-v2-10-9eed0ee16b78@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-10-9eed0ee16b78@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH v2 10/13] memory: tegra30-emc: simplify
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
Content-Type: multipart/mixed; boundary="===============6347473386658273694=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6347473386658273694==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="npgtoufzpxnz3e6o"
Content-Disposition: inline


--npgtoufzpxnz3e6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 12:54:34PM GMT, Krzysztof Kozlowski wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--npgtoufzpxnz3e6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbNmFMACgkQ3SOs138+
s6HZKBAAweJ23g0Fgjxik4RTRQirppSjP+1/HUTFqkM+1Wup7yNmgLutgDnHlyzw
U8Cs3CK104JEX4gYdN5KutBlaCM+ADq04RW5sYf2D2RGdyu2HEcTswlwqUbcOTps
QB+IIekuf3xrMaOgyL9j/9Q3ghWUXaEf2EKxrg3F67BmifqfCSPIFV6ZgrS27x1O
WGVsPjuRYMSKNmwAtT5thCWT6Ujr8QGg6RgBU7WqqqMHdhWBuZDSgZtaYh2nwAtf
BHUAIaCid9Y/McKi/FboEgv+b+tvLS+Ujxet1TfzaKklC6e0blujbX4Dest+DVSj
ydabhmn9BkC/yEH10EnSPIM+8EyzDGAyF7HLr7dcrmm0S7EqBklOc3jxCzcx8Kl/
Yb/Lea+tOERjM51xtklh5yaPocs7CjOy9fSKGIcTOrurMH9rH4y8VEKuqhTkvRbX
Z0e0g676EgAELmhF1Ky6wSqm4cRMyXzdn983y/JCskuxHAzi/3L2fHRl7X+/VnJu
8Qn7+eXQMJNBHWtJcvCMUGvSFcDv73WBQ/kp3Yydbs3lCZCzftuhWWYUmvqnpBgk
HNrC+c5AW41evENmQrz15UVgiI8FyxXZB0GiiClU2c2VKoIQ+C6+LgWlFLtDCqh/
ljBi8YicXk1zDiVrMt7OSzuDNmEIe2A9TnU1O8b6OOIgmWRtJ/w=
=N5M7
-----END PGP SIGNATURE-----

--npgtoufzpxnz3e6o--

--===============6347473386658273694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6347473386658273694==--
