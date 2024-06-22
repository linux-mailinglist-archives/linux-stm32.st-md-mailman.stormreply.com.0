Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3D91345D
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jun 2024 16:08:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C9BEC6DD9B;
	Sat, 22 Jun 2024 14:07:59 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58E86C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2024 14:07:52 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57d15b85a34so3239033a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jun 2024 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719065272; x=1719670072;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BK0EhhhBCYtUMCJbzDEEL4WU+z+5yU92rq6hn7UNZ24=;
 b=zzgaLyzTlbz7UXeAkukkpU2x+hx7ekQa/IADmGkbUwXXbElXzLA8woFNlGCrFlp6Kl
 S8X6K1kOFufmKmhu69VWvCnw+f3QR6Q54JQhu+X1oVKSxT1yjACuQvko9GF84OlnxCWh
 tPzg3hd3nhZk8x3C6h4yJQhoPZu8xCKjyCq9XxxvlZEnuQLdTmcz2mb7JDijBq84HDhr
 zj+sVM0CfQDSOsx3urZz4821WZuV287GzER4xTLdtG0dmPRIUyZA+rr67xHQooSSXtOL
 GDKvJ7jpYPZ0zU8s7DNHvcQzZ3kz/jtdQ7OHLyYPuCyvFXdlyXgnflVzYr/wd7nDY0Mk
 vY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719065272; x=1719670072;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BK0EhhhBCYtUMCJbzDEEL4WU+z+5yU92rq6hn7UNZ24=;
 b=r+rwUbI1hQPAdRTUW3sD6bTt8DuJIeN2N+7tt6hTL3KLqpwFQCDgiTTV2YptW/GUva
 6kssRYLEqYfX7uLmu6l/wKFYN/KwpFiylHRtulKq49KP5O9VXAwRfl+VBF7yab2jE3KX
 Lty/XhzAhxWwPGnHw71chdjklDJhzNj1kbGmSjA2tF8GbFAutSK/XvJjrqjxenquzZIf
 zrR59Yo6G+9/vyzNkMsjb+ErwGqPWR8it94G4vEMQ7ioBWi8LjpiaobOM/CCBVVubKVj
 +SDKRD6kGOb1C1PXj5YqmqepugViLNiaj7h7972zHMA6X6hxXusnNp5LDElQrHge5J4m
 3LjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQrZPjT9+kWBDNee+L3UFcxG4abQs3TD0J23/LcvfKr1mBcyAwUMF87CpSNUuZClaRumN81bgR2jK1AhV88cs4WRMLvOCQEwuvkWnlHfIfjmAvDypXCkIn
X-Gm-Message-State: AOJu0YzToleJtxyqbowIQETssUCIGP/tq6Z0fNwynF53LKDA3kK7G7kr
 N8B4VtWGZu2PBJwVY7Zex8QM3yi5TiHlnrqsM66f3AqCuMCRzrnk7bXB4RyoulQ=
X-Google-Smtp-Source: AGHT+IHwluZDp5WwQw/tD8WvRLjvWrGRufevjUZLgIGvFz6tE8OA3yqVKBnNAzr1zNc4P+Xkq4NUBw==
X-Received: by 2002:a50:d7d4:0:b0:57c:7599:2c67 with SMTP id
 4fb4d7f45d1cf-57d4580ac7dmr693637a12.37.1719065271532; 
 Sat, 22 Jun 2024 07:07:51 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d303d7cdesm2387852a12.7.2024.06.22.07.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 07:07:50 -0700 (PDT)
Date: Sat, 22 Jun 2024 16:07:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Lee Jones <lee@kernel.org>,
 Thierry Reding <treding@nvidia.com>
Message-ID: <xg4lozixh2ovalz74a7ijvjvj3x3nd3eqllup7m7fdq7xzgaql@sl74jicch5a7>
References: <cover.1718979150.git.u.kleine-koenig@baylibre.com>
 <b4d96b79917617434a540df45f20cb5de4142f88.1718979150.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <b4d96b79917617434a540df45f20cb5de4142f88.1718979150.git.u.kleine-koenig@baylibre.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/3] pwm: stm32: Fix calculation of
	prescaler
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
Content-Type: multipart/mixed; boundary="===============3763427021661866641=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3763427021661866641==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7lyhdyhwialvkaa3"
Content-Disposition: inline


--7lyhdyhwialvkaa3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Dropping Benjamin Gaignard, his address doesn't work]

On Fri, Jun 21, 2024 at 04:37:13PM +0200, Uwe Kleine-K=F6nig wrote:
>  	prescaler =3D mul_u64_u64_div_u64(period_ns, clk_get_rate(priv->clk),
> -					(u64)NSEC_PER_SEC * priv->max_arr);
> -	if (prescaler > 0)
> -		prescaler -=3D 1;
> -
> +					(u64)NSEC_PER_SEC * (priv->max_arr + 1));

priv->max_arr + 1 needs a cast to u64 as max_arr is an u32 that for some
hardware is 0xffffffff.

I fix that when applying.

Best regards
Uwe

--7lyhdyhwialvkaa3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ22rIACgkQj4D7WH0S
/k707wf9EYl9VJK32e45RKA2u+UltCCD+nktNjN9VBiS2/HF+EOoHRqhaNs0x0Go
2xSr7aY3QdATUVkJbvr3L4uCV0TDRxmYUHPSx7qsno5gvZNkJ6HCKbKh4ELg5P3b
xkXfQ/7ja4W3I9NF9iGQ9hp5Z8VPvepyj2F4a6l0d856oqQSylaqGiVUBs9nX5eY
4Q1nhMIhbjVsirVT2mHnTZX1Z050XylfAOnqObF5RsbpG2EueadCL4OUV7wtKYbd
9EMou0ykxA5XmaQZECtU4MhZutMGYxTqr5aP4lKZx1QOxIjx7GQ6N4+fB+QNIwRk
UxBpZV4ZHBwRjrbESc1lCzQuBNhOtQ==
=1r5L
-----END PGP SIGNATURE-----

--7lyhdyhwialvkaa3--

--===============3763427021661866641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3763427021661866641==--
