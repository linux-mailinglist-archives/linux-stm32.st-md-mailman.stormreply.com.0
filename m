Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D652A4BB01
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Mar 2025 10:43:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0366EC78F62;
	Mon,  3 Mar 2025 09:43:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 304FFC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Mar 2025 09:43:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so39775155e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Mar 2025 01:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740994989; x=1741599789;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I7HD702RfpHXjFSS9LnmCasnaIsMWIVtBEVPu04XVSc=;
 b=22moVTbuz8aPhVbeiJu96NLS05Hn27E3UFVQW/OstyxGUGZobf9LEiwQtIE5Inq9Sb
 6AeO3i/KEPQms40B3UGk/Wn85E8OZ5iv4RuTRhiC+wXVZiUFzI9VNnzbgBE9JO3TFBcq
 xK6VGLU+MEgxejaW/cYm14J6vKD+CJ7ZydcuIupiMi8AwNSt9GJRrT3cmA3Ddc1fHvLe
 eI5AAcZN0idszdmBuRF0XQczlVFpDTrf0mmvHgxpiVNBukYHOKFQVHZSrP4/J7AtrdUe
 pj1wEuxQEwQ2flry3ATo+ewoFwy6m4i+9y05g8Skk92Lr5SuJS34vF2KSK6R9bX5GIdP
 7oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740994989; x=1741599789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I7HD702RfpHXjFSS9LnmCasnaIsMWIVtBEVPu04XVSc=;
 b=Fc0ZczNPyU21gLhQU8dfIxHVUMnjcX0I6HRsd7r9nv3wxUXKlOyH3V1fT2OV0l8vd5
 ops1zAHoWvp8/BpanOpoVSIUGzArstWFuGBiP6P6U8T31hde+Jqg6MvlLu1bYd+yVHh5
 9fnXQ6hsu6ye9rhud9/vYi5+PQ/EZE4IpW1fwT02zE6b7j5tkxdaBB0xXof4OzNbC37q
 tzmTzn8hb/FyPxbzViBLgxo1g6iM8tGbGafQK/UX6KfyYLIZYgKlCJTfQcG6LMLirXPf
 tPugYFaqUaJcXBLYw5AEGrpcCv0D3LC0hrNQqVjVwto/vpHVAqAm3sPg/KmIuCzonIjZ
 1B/Q==
X-Gm-Message-State: AOJu0YwNByr+SsJNLlxT+OvChTRtxCjlMbChKMMUtFKowEC36wfw97r+
 JSTx1VVlgpQWXaz4jLxm6AJZTkutZspT12KS4q0jJLLvGBG9GL9HTd2jY6kkgew=
X-Gm-Gg: ASbGnctTE49SLenOrxRm9Tq0fBSt8TUgoXYLQG10UnDILjSiOd/4UmWwxoLE1b0yvRS
 aj2G/7kAhRU7xwSZHA0Wt9GWhIKSQo40Z+7Rwms2GVYCQjBpnzQBrVSWY4XkyNCtF66jxNaK58X
 aGu8hAQtR1FbL17d9vlsPTHMZ2RRhQWHsS5lLXqlgzSdS2p40a++nSNuQJk+2NVHl1RHXhHsq1b
 moatE2vLTjjaNkCAMKKaprIjYBDrGAtd2zEG4dE9jLmIEeBbEO/yrAsHkvdCIxPnOytM/LO7D/s
 UQKAe1n5e5TZq/6PCuvY2+xcyct/68ZvwavJijblzLBP2CAAtLjRPCVFD9w3jwmVKa5EPbOURHX
 CfJO+xje9GnIg0wWh5OfNxqBc3A==
X-Google-Smtp-Source: AGHT+IGioXL+ceLlmWfZZmydFoO+5l0CmYAT/WRogvwkcEnYKD7My0ndm6CmTHlXPf3FtWobh/14Lw==
X-Received: by 2002:a05:600c:1547:b0:439:98f6:8bc8 with SMTP id
 5b1f17b1804b1-43ba6760ca3mr81796515e9.26.1740994989516; 
 Mon, 03 Mar 2025 01:43:09 -0800 (PST)
Received: from localhost (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr.
 [109.210.4.206]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7b6asm14251498f8f.51.2025.03.03.01.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 01:43:08 -0800 (PST)
Date: Mon, 3 Mar 2025 10:43:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Message-ID: <miozabyaeoagqrw7evl4c44augcfbrdtupf4ium62xz5kb77cm@vndlz2rcoyj4>
References: <20250215143723.636591-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20250215143723.636591-2-u.kleine-koenig@baylibre.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stmpe: Allow to compile as a module
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
Content-Type: multipart/mixed; boundary="===============4622746381703738185=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4622746381703738185==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dszzsrs7iiegpzat"
Content-Disposition: inline


--dszzsrs7iiegpzat
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stmpe: Allow to compile as a module
MIME-Version: 1.0

Hello,

On Sat, Feb 15, 2025 at 03:37:22PM +0100, Uwe Kleine-K=F6nig wrote:
> pwm-stmpe is the only driver that cannot be built as a module. Add the
> necessary boilerplate to also make this driver modular.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

=2E

Best regards
Uwe

--dszzsrs7iiegpzat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfFeagACgkQj4D7WH0S
/k5Q0Af/fTmRfYYk6lWXxsIcFhHDAF6paE6ZWIq5+TiCzoRCcX8S4fiH92Kmz0kD
FcFDNskZuj/MZEUmfQ+xXClJVwpXTEhZL0589ALzo8uSv1FNZUg2tHk/tPT30Rxw
wfNynJPHkyO4gVQ6dm81qJ2e82VI6B85KNxN54DkJphIYhynS/OstQdsuT/kvsFf
cT1ei+v101ww6s1ycVH44lrCbC06sb9tC4XVkS3ZCQw443EzJM2A4nIE6MrIdLsa
A8pb7ggUHf/sUtQC/BDssdTAvWvq1hgXDDQSnVpuhg8lXhUyAW4xeoCZan2mFPrk
8nJ2zdNMDZPQ4WWaLC8jEJy5z4syUw==
=Uees
-----END PGP SIGNATURE-----

--dszzsrs7iiegpzat--

--===============4622746381703738185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4622746381703738185==--
