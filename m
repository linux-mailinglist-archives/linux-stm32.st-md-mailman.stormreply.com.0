Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D74AA7DB05
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 12:24:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6C6BC78F9B;
	Mon,  7 Apr 2025 10:24:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41DFEC78F97
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 10:24:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso21811195e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744021473; x=1744626273;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cHEoQFwXWeEahAsWtVrHWP+XPCjbcIBA59jvijJVzNM=;
 b=e2K1KHWfCW8qlL533PLuR/o2c5Xe0fCjlRm6BtChgso8Xpq+pkLAwC5uG9S8bzgrWO
 9Ljdu84GUT6JlQNJ0QdQbQm6PS2lK9Dor8ZGrd5tT5oDARtvQCRMPyQpZ1iLaQuZZ6rj
 NqRQNcgu+MCu6pVPM5CgXpPry0d4DPAjsI95BrwRRYNdaNF/BnBEnLHRk+sTfsXLwyys
 cLjIfddg/F1eBjubYtF3Uhj+JeGQeMq3n3WgkIbUmd8gzmJtm1iKrTvWDkLkoVzQapnk
 ds7DDkYKtfv/61GAOfif6UYKES84BsVxHRBKYxJRZwQB4olQrK8nTXHOnrNH5SEH4RSO
 0jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744021473; x=1744626273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHEoQFwXWeEahAsWtVrHWP+XPCjbcIBA59jvijJVzNM=;
 b=FdY817eGSjCaR3carUCwt1374s638EVP2JB/WhF1oOTgeCkG8s4EW0W+paHnwqnC43
 31PmR7DBOlzNsZYuAqK+nJ0/wEbpGWNHUddBD6UrzEvNkCxWebyqAFCgPHM9K1TNTkop
 p+21fgAPvuWa5EDtIlP03YNgY2Jz3l82dQiZdh2b1/XtaNvme+Gjv1saexwOuLNAjzoj
 P67wx9FPzEQt16txavI3yFoeBAXSh2wcb3vnAQJgdxfLtoe4HL1wKSLuDozliawyhTYi
 9grmf67AKIfbdw2WiPKQSYfOAUetom277us2KvXy0aKOVzutUPpyIXlNAndN5Z29w+Pn
 oQ9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV338uYmL7LBLy66MW59bZfKw1imTv+iInKOxLktA6aDwLYLRCOFGxHXjouLMTT/FNKX+Q+WdX8RUq/1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNDeb8JpNf3aromHcVOC3oix4rG+22J4sj/NrBQjhW0rzaGR8l
 1SlHDtcdYAGIg5yWolCRVg61eaGo6anasOzJ/2Eng/BHBQd+uo0YA3C1vlxdIJ8=
X-Gm-Gg: ASbGncshlKlKy/f35g9N5k/SuDT8i2rVaDkLWZ0YAlZJ65tj+0A5Nq7uVbKGw5VoFrM
 7m6+wCkcUPYmIW++f8w61Pc3a3lW8krGETqw0yC1ZLF+1C54tKmy6E8ph66G5NBPKWBPDDaoQ/D
 2LLb7Ket769ZdhEhEd5Em8ElorhYnD3NT0B6gr8eptpml57MWF20+BJ3MpG5gADOMxIA27e4Xi1
 eW8a8hMBIN388062dBHB0GnqU1NDyh2GA5UpRcxrl6eJ8aZ2c6O5hCXJfzU/uaZTHfTRqNLyXT8
 w3CY1BDarbyV5EqvCqtOXuXYqIvCoaejsKozKp1jet2Fk3dS/MOInyBq5nprtBI5jnAe3F2jwAO
 dHMN+NPaBDtI=
X-Google-Smtp-Source: AGHT+IGZWuoPqI5GhADsQ3RuS88slV6GMK9gadfCiV0+cI0VoYQJ9/cpeSLu1FczN67nQ6IYvyNLEg==
X-Received: by 2002:a05:600c:4f05:b0:43d:7588:6687 with SMTP id
 5b1f17b1804b1-43ee0664696mr69308895e9.12.1744021473550; 
 Mon, 07 Apr 2025 03:24:33 -0700 (PDT)
Received: from localhost
 (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f14:6104::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-39d753e48f7sm5409639f8f.4.2025.04.07.03.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 03:24:32 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:24:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Message-ID: <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] pwm: Some fixes preparing chardev
	support
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
Content-Type: multipart/mixed; boundary="===============7312275960144431539=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7312275960144431539==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c76mue3amd423vde"
Content-Disposition: inline


--c76mue3amd423vde
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
MIME-Version: 1.0

On Sat, Apr 05, 2025 at 11:27:11AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> while working on character device support for PWMs I found a few
> inconsistencies that are fixed in this series. After that I plan to work
> on getting the character device support into shape to get it into
> mainline, too.
>=20
> While some of these patches qualify as fixes I think there is no urge to
> get them into 6.15, but given there is a bunch of such changes I might
> send them to all together to Linus for inclusion to 6.15.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (6):
>   pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
>   pwm: stm32: Search an appropriate duty_cycle if period cannot be
>     modified
>   pwm: stm32: Don't open-code TIM_CCER_CCxE()
>   pwm: stm32: Emit debug output also for corner cases of the rounding
>     callbacks
>   pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
>     rounded up
>   pwm: Do stricter return value checking for .round_waveform_tohw()

I applied patches #1, #2 and #5 to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes

I still havn't made up my mind about trying to get these into v6.15, but
at least they should be included in next for now.

Best regards
Uwe

--c76mue3amd423vde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfzp9cACgkQj4D7WH0S
/k5h1wf/ePnI78AwsFL73hW/6a3vkcMZT1DX5QGpwIyEH62MofINXyMmZ/DLn3/E
cHpC9YmdK4KjuLW/FjdG/yxNo/Me8osVzWaMTNNbFZAtgVc5gIka3FbfznJML970
5UYLrmq4YcgT+PfECKmwQ5n2qleTpUimRIgUkSIu1GSCutJ47Z2K+SmwW2RdoDZc
ILkPr7uTh3Smp5SMXU1lIXI6p5BrbxHDTtgidp6qEbLLU56zulCqUY8Xc/BaBzQV
oPqykCt5ec5E1NdyLN6OTmQPSrQTFzsQqcuPSRj9E0RJeD12HwC/toKhG13vWAGW
w1Iu0W62/tqWEksU+l9Op9pMMa6u5w==
=PhOu
-----END PGP SIGNATURE-----

--c76mue3amd423vde--

--===============7312275960144431539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7312275960144431539==--
