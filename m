Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F13A919867
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 21:43:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B76AC6DD9F;
	Wed, 26 Jun 2024 19:43:37 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3F23C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 19:43:29 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7241b2fe79so585851366b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 12:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719431009; x=1720035809;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GjGTkNIBK/W7dyZDTk9H62YteS6jTO2H7CEOhj6wZPc=;
 b=XNi+MGiEJCH6MNtwTvk9omPkS0u5wZp32njDMqbSZ3GVevwKb5nRs3qtyUbx2VtYee
 lYFlmlV6ESmoCCnRmTYbZ1SKcK2M2/m21f/dWBDtHCFjCXZl90Vh8vdDU+5hetgX5bU6
 f9tQVWkVffTv7Eh+33Gh00YjdI5va676MYobsxaFDi7FZlHVRMU7ihIyBNfiO/6ZJdEg
 l2iTfimPZFxVlRfK1VRkovuOfsKmQVCGmbm1ZTDmLAf3tksK+29DRVYM8Budtyu0mG9L
 ck36KaaPQWMVfDMqTtjV2qk+DmMFsAbs+aAhmuR+G7i2drAUPWXt4YZ/ifE6K6FTvHdD
 S2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719431009; x=1720035809;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjGTkNIBK/W7dyZDTk9H62YteS6jTO2H7CEOhj6wZPc=;
 b=iUNqsN9JlX2lNGp1NYA63AIlG68znc6/sFhF+CsiHwDP8eKdPJnCzysSp1+H+5YNfM
 j0FVIyBWUFoSORNaXojpoTqwJl33WQg4XSyohphl9jnNVmZDE82H+0S6+Zf0GW+5WOBp
 JG6Q94EyFEBC4BIFD9sf/NuASSMF5tv/0aEdZL1PjPy6eLa7IFJVHNHqKWaIgmctPi0+
 BpsXRsZ7loac0yAlYFUhEOz0Ml2iH7h+0dPY7j1Rp7LKD1ZiPWsW0MezCosnxtN5VQSu
 hSX2mmIFLIEgvyPiZ23hnf+80Z7BiHmAoIgMQqPxx5YE33QeqPdvM0+5WYirc8/0LG6n
 HYiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK/BEA2bvakKgYMCFkHhn511itu3vNOJttKdUcOPysmOKL6spM6n2LVLWI0RsnwkKwNqj+zXP5zVjNyfx8esOlpGxO6AwYZASzuMA+zXe9sFpGO9RN3wNh
X-Gm-Message-State: AOJu0YxIqH+3LB7/S98WtzlOrhhrW2a+f+hgjmNjvgL3xs8kOrRaVNXO
 N952FjQzPZO0Nl1yujgdGDgdHDtgF+eKf1kY07IMmm21T4SDtmXLt/QaKhSb87g=
X-Google-Smtp-Source: AGHT+IG4TjffVhUXYhDKxyCatM54/g+s4fUWCsSBNsfk6wfhm8KPJ2zLGyyYXEOBP2q79X3ceoR9WQ==
X-Received: by 2002:a17:906:c243:b0:a6f:569b:3ff0 with SMTP id
 a640c23a62f3a-a7242c39c0cmr794609666b.26.1719431009283; 
 Wed, 26 Jun 2024 12:43:29 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a724610ff5dsm437619466b.223.2024.06.26.12.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 12:43:28 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:43:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>
Message-ID: <cgtiizodhbyutaeu2kw5qszb6ap6bpzdk5pnpurliikhz4isvp@3xtidwcttjkb>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240620084451.GC3029315@google.com>
 <imyuhtcsjrbyodsndzbaqfwa4jxny25eylfdh4u4xtsiotsk5g@45l556pcrzys>
 <20240620173838.GB1318296@google.com>
 <ip5aysvcuchc6q6sikghcz7vjn6zvih5r3amkvp7n7xpvncbhh@jdq5lkckeoej>
MIME-Version: 1.0
In-Reply-To: <ip5aysvcuchc6q6sikghcz7vjn6zvih5r3amkvp7n7xpvncbhh@jdq5lkckeoej>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] counter: stm32-timer-cnt: Use
 TIM_DIER_CCxIE(x) instead of TIM_DIER_CCxIE(x)
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
Content-Type: multipart/mixed; boundary="===============7297016060713092182=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7297016060713092182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufxu7ubv2j356spy"
Content-Disposition: inline


--ufxu7ubv2j356spy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jun 20, 2024 at 10:56:15PM +0200, Uwe Kleine-K=F6nig wrote:
> On Thu, Jun 20, 2024 at 06:38:38PM +0100, Lee Jones wrote:
> > Which patches need to be in the pull-request and which can be hoovered
> > up by their associated subsystems?
>=20
> The dependencies are as follows:
>=20
> 	#1 <- #2 <- #3 <- #4
> 	       ^
> 	      #5
>=20
> So the practical options are (in the order of my not very strong preferen=
ce):
>=20
>  - Immutable branch with #1 - #4 (assuming William is ok to let you
>    merge #3), and then I can add #5 (and further work on the pwm-stm32
>    driver that I'm currently working on). Maybe William even doesn't
>    need to pull; I didn't check.
>=20
>  - Immutable branch with only #1 and #2. Then William can pull and add
>    #3 and I can pull and add #5. #4 can be applied later then.
>    (I can remind about #4 in the next cycle.)
>=20
>  - Immutable branch with #1 - #5
>    (Reminder: In that case please fixup the pwm patch's short log with
>    s/-/: /)
>    I would add this for sure to the pwm tree. I didn't even try to check
>    if it's needed for mfd and/or counter. So if you don't need it, I
>    volunteer to create that branch, but if you want to do it, that's
>    just fine, too.

I wonder what's the state here. Maybe Lee waiting for William to send an
Ack that Lee can do the first option?

Best regards
Uwe

--ufxu7ubv2j356spy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ8b08ACgkQj4D7WH0S
/k5u9wf8D3qbnAeT1su3hEebC3PyyJaGAQgQP3j6KOeSzL1QwvEYVG2QWirUwU4M
nduLdm0RKB//DIb98T87S1WNT9+6yRy4YNG51liRGPPdJkCPftYiA7qCrmS8+knn
XxFUJ0q578MzWTPZEuIFVNybdF1XLjb07eWerpE9TNIOwawnrmdrSXAEWF/7AjaL
krin++PPjmLPvcaREVVvosFdov4XIZJij9gso9M61zj+ZiDGQxRYBWsrrjDhGPKD
/6E5R9RISaOSqFyi/kpLgifRQP0ts94QLVIvtbvD30M9pB9exTBRRl1AHxq4iSws
YmMOzrRvYdoXCNcwcerJ4oXz3keWqA==
=Y58C
-----END PGP SIGNATURE-----

--ufxu7ubv2j356spy--

--===============7297016060713092182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7297016060713092182==--
