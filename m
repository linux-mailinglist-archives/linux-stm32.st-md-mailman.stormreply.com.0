Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5435098CE55
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Oct 2024 10:03:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05198C7801F;
	Wed,  2 Oct 2024 08:03:07 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1276FC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 08:03:00 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a8d56155f51so812821066b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Oct 2024 01:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727856179; x=1728460979;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hdcJyRPpVgyLrAYHhcOHffwlDloxz/bcgIEwIdRrCLc=;
 b=Dk33fL70GqFfoOPP+JoqpByjN0N6Xm+teOtkLgy7fllLwplfNbsk8xyJIuTZak/0O5
 TpPaWkm1RfKv1wZA2itG8kTjdSgs3zvOHiXAQ9G4AOMxjBlqYGg2ftwXdAaDF9ia8cjv
 tO7KNt2c/8YioVb+aboNhUrOkexvLr2hBAU/o1MHouvyPo3bLVjRUmWC+olBHxZv1gd4
 3eeqJiQt7LiX2ka01z4cWWP87kJJZh+vvvw8TlnGHB+Z+8dwK7QzTdjWueRReLz00IUl
 A0VGcVR2Xbn+kE1jHZTRJ0tG4qGtwbE5o9ruRoOplBxfAPMi8zSeTV14lzyaS2jB8TDR
 srQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727856179; x=1728460979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdcJyRPpVgyLrAYHhcOHffwlDloxz/bcgIEwIdRrCLc=;
 b=keZqr7DX+M6cPQXXnFTyjIPXzlaRllx0H8pMWZJe1yZs+6RBay+nk94j6xnxFKBsyW
 UbhLnsIV/toA83sAnlZRYaikCS9nCiLE2BjDuXK9pLip+kDr+JDjcgp6S8oT/QCX7Zkv
 Qe/dNuO/gkv7it+M1uccVbflAAbpmWg6ATDjRyFykUWFbfxiZSZiN+0Up1O+1fa5Fb/X
 /UdbtROvYmNiBQoHjZcO8L+nEUTxskxP/Jf5xK921A+BEgQK2QxH671YwD4+aaREw497
 X5eKjdTm3XYVBrbmYZaSvRoLi9Q6UgqozEwFU+9sOIsXbHZ30Nm0XJ5fm1YEJIzDZU4P
 Vg0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjiLmOVcV2+AzsIhrJPQjq+re67eHLIioeMPCRhD1aUsvmPhFaKn68+/GF6TMMoW66PJbcUTnGlJw9SA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9ZGCvKTQAc0Oo+DDZpASfUo8fCsP1VN76bk85KV03pBg8ZwBc
 NF7wda3SGS8mwa5CAa/XmAIAl07C4HjkasqtnL+9o0edoIPW+Gx20nBekHkTkGM=
X-Google-Smtp-Source: AGHT+IGf6A0q+qgQWjijjqt+Tz0p7nyHr8dMHpu1Hkc/80jtLo+MhLmWkP69hGodPJJFwuXzTaJEaQ==
X-Received: by 2002:a17:906:6a20:b0:a8a:4e39:a462 with SMTP id
 a640c23a62f3a-a98f8207942mr206253566b.7.1727856179420; 
 Wed, 02 Oct 2024 01:02:59 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27770desm820149366b.32.2024.10.02.01.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 01:02:59 -0700 (PDT)
Date: Wed, 2 Oct 2024 10:02:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kees Bakker <kees@ijzerbout.nl>
Message-ID: <wl4wpipx2jaixlmdjv7uq5ghewwid5wo6gpmz5bkqj5chnu3vc@6bougxe3rzbx>
References: <cover.1726819463.git.u.kleine-koenig@baylibre.com>
 <332d4f736d8360038d03f109c013441c655eea23.1726819463.git.u.kleine-koenig@baylibre.com>
 <b0199625-9dbb-414b-8948-26ad86fd2740@ijzerbout.nl>
MIME-Version: 1.0
In-Reply-To: <b0199625-9dbb-414b-8948-26ad86fd2740@ijzerbout.nl>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 Kent Gibson <warthog618@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 6/8] pwm: stm32: Implementation of the
 waveform callbacks
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
Content-Type: multipart/mixed; boundary="===============8362725015017953588=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8362725015017953588==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lw6wwepyh7fx5yuf"
Content-Disposition: inline


--lw6wwepyh7fx5yuf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Kees,

On Tue, Oct 01, 2024 at 09:17:47PM +0200, Kees Bakker wrote:
> Op 20-09-2024 om 10:58 schreef Uwe Kleine-K=F6nig:
> > +			regmap_read(priv->regmap, TIM_ARR, &arr);
> Did you forget to assign to ret?
> > +			if (ret)
> > +				goto out;
> > +
> > [...]

It seems so, yes. How did you find that one?

When I create a patch, is it ok if I add a Reported-by: for you?

Best reagrds
Uwe

--lw6wwepyh7fx5yuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb8/i8ACgkQj4D7WH0S
/k4LjQf+IuQXl7qrFJl9cpY+KX3OCGqk4Jj7v5/cv2R0jEn6bCZlJpgSxmPU50ir
C7H6qhNKKrGXivDS3CqeFFtbzDKha7sk/SJkRGFfSsFNawdAtBQnV//VzdNEFEEL
/NWC4hzyTo/Jyji5UuSQfXalLIoBK3fwZ1I0uC9nrbRvaf4OEBT3ozo3TqsHU+64
JgyOsypiVfgH1V+QGOFj9LcqE3QIsd1f1fdvYx1snilU8d8r9Ky8FDvrtwok5ELX
b5kny40D3wAg1LKC0iMa+aP0+4bNz1XU+PqsoY8ogtjzPLYpeuBI+f0kgCXW5nYM
N2K+48tvR32EiZkDqrBQmYMlXWuAKw==
=Fe7s
-----END PGP SIGNATURE-----

--lw6wwepyh7fx5yuf--

--===============8362725015017953588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8362725015017953588==--
