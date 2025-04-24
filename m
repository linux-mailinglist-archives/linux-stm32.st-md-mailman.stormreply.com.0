Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6316AA9B1A7
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 17:07:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E6B3C78F70;
	Thu, 24 Apr 2025 15:07:03 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 137D2C7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 15:07:00 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so8220495e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 08:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745507220; x=1746112020;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tekmdgu4SmGOyXOMrvYH8AEv488OvXUmZd+ZMk/jzkg=;
 b=Ys37bMX74mg1ZhLbQLmELdhUyd7OuI2fTAc0fneSM5HaQtGr/czyKCLoSidOQcjJRM
 dGvP1OVZyssmLNQKIY4Eziuqw4D+i3v+E36aRRHXZ9FkxNiwHajhl8CAgoylYwXP/NaI
 uNUHbyA8JhzmmuTLaHsjvNJUZRyZSZR+Zq8jzCKcVolH1MFl3zgWfITPbu50sNDSp0VC
 9b78OjkK+OswU97n8l/PsdJAQlOd0YkpNk4bW7YwXVy5MiTluRhNAVhiHLWfvpfV8cQ2
 zQbk6gNX/xeEZodlqVoVhrq19Z55uUIGfciq4J96C2y+M8vZb76houecEWnpmwGqIEVo
 p39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745507220; x=1746112020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tekmdgu4SmGOyXOMrvYH8AEv488OvXUmZd+ZMk/jzkg=;
 b=aVb2w6h5mjA8vNWgswE8mG0oC9UNcB3YgE5suPFeDB4P6kHEpr+IQy+wZBofO0sdxa
 sawFP2z31EaAgBTTWnbhEF4SUDIqSwtwo1lb24pAZPbUe3hgrgNwTBM9oeqU5T5ZOa0G
 wN5amkkQY9KeJ0guMQXPy2/FG/xpAWVAqbBg4rlMcIfQlYKRxfc7VorN1X8674F0Q75K
 C1zVSUTTHJGik/7ciQQ9HwEwfpnQg6OH4wBCvlXWDL75IeZzBqf8X2htaZYEYP/G6Z/j
 HjR9nSqPmfqglgfcIdBkLcO+i6U+swb9nHIwcUaNVBPr7Xr3YBWet56D8XNV/fVq79OP
 uoYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeR/+NE6WpzGB7xp23djktn6NS9TitKrW63WTT64QDmZuY4NKnhYWs0j+Ya2KI9qYIaD4kHeHcxMIGog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjkEGRYsLJwNjgwB8rDzH6jYw9keqPbLWJKk6uFTBVCP5JLOcU
 54N0efEaVD/wDO92kNpytBOQEzg1zYnpPlEAQmd2g/2Mc9MbBYEB2WvR1OCbUiw=
X-Gm-Gg: ASbGncun0U83K+rUn1jkvdCLLzt7krRZlPEzdtCf29Z5jjb8cvfvlUuOvisvDzt6wai
 dQrvQWAcER5A5vue8T6hTth8LMVUFwKYcHnhWLu6HGCJNnq5YXwfE9QKP04cTF14sYX1F3TVKsp
 KA/st+6PlbQY1xVaWl0cBm6VQtB/JPFhMBN4fk2N+s3Cb6eOHpYI8LpwwD2aWXfoEhToqdhTInS
 3f9fobbPpF40g6zAf9id/j91l66x07aReQAn+aQstEgkn9Z3hq1GuzDq5TONVacq8PoG25w24/0
 jugnuBYux9MuFL68aPjSXLG8ZK/+Zj6ujUHzBpstI4Iqyi8vr+sXx2JcL9yTfIy87ydxPzzH4Zn
 ZHTzICqQ=
X-Google-Smtp-Source: AGHT+IFyIihiWZtzqCaT0+c5gR5qS0i6N2HGB8bIr4D+Ljl1JMZ+cLPlHv9drJDs1OWf2iLRUT3wng==
X-Received: by 2002:a05:600c:4e48:b0:43c:fceb:91a with SMTP id
 5b1f17b1804b1-4409bd21f8fmr30871065e9.11.1745507220162; 
 Thu, 24 Apr 2025 08:07:00 -0700 (PDT)
Received: from localhost
 (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f00:7808::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4409d2bfaf4sm24338135e9.36.2025.04.24.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 08:06:59 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:06:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
References: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add nvmem-cells to
 ethernet nodes for constant mac-addresses
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
Content-Type: multipart/mixed; boundary="===============2155328815152934254=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2155328815152934254==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jf4746uwztvxbhk3"
Content-Disposition: inline


--jf4746uwztvxbhk3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for
 constant mac-addresses
MIME-Version: 1.0

Hello,

On Fri, Mar 28, 2025 at 06:14:05PM +0100, Uwe Kleine-K=F6nig wrote:
> The efuse device tree description already has the two labels pointing to
> the efuse nodes that specify the mac-addresses to be used. Wire them up
> to the ethernet nodes. This is enough to make barebox pick the right
> mac-addresses and pass them to Linux.
>=20
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I wonder if this patch is on someone's radar?!

Best regards
Uwe

--jf4746uwztvxbhk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgKU48ACgkQj4D7WH0S
/k4KqQgAh+AwCxuJsOtZS4t76OvBR42DI7PxQQ1v6/IsFyAA8afEf+7e9zgLaGZu
DJlNzT2e74nbDdcbaCDOLOM6VKrJ082DI+Sk5TfSuz8/KQeC5ljjKfoS4Srem16C
QDRhMNzYgTUC1GCxXE8CY46syIHB07mA6uuNndjxI2MFUG8jA0tO//dGkfWzzxUi
17RqErahedYndDxyopbtce05CvZHvNoZ+zcmxJItvijX1JWpUW5utouFgFsO40Xj
6H/hmScaWYagqW9CMyoUcgmnvDoWDx+aq2XRmWXIG5USJzc48wUynpZAHd/rvpRS
dYA59U3ESpZ/3M+zMWEjDvaKnGw27A==
=DXp2
-----END PGP SIGNATURE-----

--jf4746uwztvxbhk3--

--===============2155328815152934254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2155328815152934254==--
