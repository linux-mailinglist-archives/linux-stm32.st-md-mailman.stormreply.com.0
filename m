Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF991C2AB
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 17:31:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34C09C71282;
	Fri, 28 Jun 2024 15:31:22 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81DFFCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 15:31:14 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so95225366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 08:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719588674; x=1720193474;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q5JIqp/Wf4fxg2MB78rOVzzjMmA3m9XSWkuB6lP9b+k=;
 b=Q/PDZdarJJLFaXzhYaeKyl4COiRZiVmSZ/4O8hUKACStU3IRUWOSESFow2b6H47L9H
 xQNWMamMXfeIHENqYUOfR8b8J3nM3UsxKn9QurZGXQWzstS6IpPoN9TYlS6Xrnwx0wKv
 lOHIOtIZ/mPWcuOyp5gV5sfMKEulq069SFjJqF1sYXExpYSSi8y1MJko5zEUL/asDUDF
 gvf4hyOzht43kRfVNq5ziTu2TzzorGCQir4DD2K6XnlR3S8J3GBvor7WdOG2i56POV+y
 dzM1+I3D90SAhby2CTrinzEXXCzHgKI40v7va7oMia3kAzZvzssBOXXT9uE2okCYMzA5
 dSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719588674; x=1720193474;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5JIqp/Wf4fxg2MB78rOVzzjMmA3m9XSWkuB6lP9b+k=;
 b=Xhc2YQ6x6/3NQnAI2RXo5R+KOJ+ZqGcZ6jzklNdjw7NeT9nkJ7yZc7OHxqKIwZ8fMw
 AM+hlOlXhQ/LrnjeLHBkk5YQyUZRNtpcCrwPkD7ZC03Vj3xPwqxyML2fjY0zkF3M8gHF
 fe8M55zuAA8+Wo7+i5cg+nr+aBpb8vkUX1OTe9JDSSy3RGusOX1cS9FNb/nxHEUtbnoT
 DWfiAbpFzLx9+lBASlTiLoTaVwAAd/kWaiAgxGDSDp4vMaBIO4uBz80vdgexq/DnsFJB
 chVaSSneMk8TkJf1D02EbchT/Wy8qMFOH4DZZJ2wTUOTL0/tdJ5cbXRiMHuvRSkQNVZc
 hrVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF0lJSlMRXDgx6/fBzAbsEJxaMJ3gPj5UiLl4xBAb38ctVIM9baYCAYPAgBY9vo9Bhx2jTw3w2wUvBa1Ma/+AjXAivGmTxKg630UT8yj0l45NShMh1KDG0
X-Gm-Message-State: AOJu0YxMTcJwZR/jp41VXh6dheQd8QOb1ADUmE6PfrRYNWplPAkDmUz7
 8smdqaA61SO5/2vefwq4RxnKkN7tclQv8AKsYeUmyNFie67zuFDXmoAvirjRbgA=
X-Google-Smtp-Source: AGHT+IFRuQ7YvA3YzYURlVYrBjCcKHGte4VTBj2Nk5k3QmyJ3xEe18nZQZz0a+CEYGABUKDkBB2m8Q==
X-Received: by 2002:a17:907:118c:b0:a6f:e50c:334e with SMTP id
 a640c23a62f3a-a7245ccdd60mr897244566b.23.1719588673865; 
 Fri, 28 Jun 2024 08:31:13 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06519dsm88699466b.99.2024.06.28.08.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 08:31:13 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:31:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Message-ID: <wfhqh5jfjaecjr75fu5olxnnulxgtqyxpw46azlfa6vqe7ezlz@l5mwketc3f5j>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240626151343.GA2504017@google.com>
 <20240628142847.GN2532839@google.com>
MIME-Version: 1.0
In-Reply-To: <20240628142847.GN2532839@google.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: Re: [Linux-stm32] [GIT PULL] Immutable branch between MFD and
 Counter due for the v5.11 merge window
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
Content-Type: multipart/mixed; boundary="===============6103138877745322139=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6103138877745322139==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vwml3ark6hcxxqsa"
Content-Disposition: inline


--vwml3ark6hcxxqsa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Fri, Jun 28, 2024 at 03:28:47PM +0100, Lee Jones wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfab=
d0:
>=20
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>=20
> are available in the Git repository at:
>=20
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags=
/ib-mfd-counter-v5.11
>=20
> for you to fetch changes up to 304d02aa711369da89b4f8c01702bf1b5d1f7abc:
>=20
>   mfd: stm32-timers: Drop unused TIM_DIER_CC_IE (2024-06-26 16:09:58 +010=
0)

Thanks, merged into pwm/for-next!

Best regards
Uwe

--vwml3ark6hcxxqsa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ+1z0ACgkQj4D7WH0S
/k7wMAf+IQqhOqwRtmvzgqxA3dQPTH3rCH8Y4z5wsmtBC5eqzlC6r3Hz0UjzxlUA
2tgx4l7hoq832LjoauTlmSckhKJywRAYHhcll0XyODku6sP00oYmsdidrWftQQYz
yJQ77dcmOLs2wbgqlC/mn48nMQKJBsWuxtTXZzERDBevXW1VcpKtYstg7WNZAkEX
cv5Xx7I5wAIklRc4fHTsvd8pPo25VVS/AcZ10aKnTdFQAFQkkjSCjJFthH9X9TQt
0GwSUGpxg/oU7sneXNoYb5zXVqMs7EijFr0MzcFFi3Y8OAgeRf5jn6WVF8pAbnqA
Z3gZNyEIRABVSWQewBB/0yxodqtP1A==
=Zv7T
-----END PGP SIGNATURE-----

--vwml3ark6hcxxqsa--

--===============6103138877745322139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6103138877745322139==--
