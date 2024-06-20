Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BDB910187
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 12:34:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10D85C7128E;
	Thu, 20 Jun 2024 10:34:23 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BED8C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 10:34:15 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so779178a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718879655; x=1719484455;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UH1RftmHG3Vs+kyJjdp6FaijzaNseaKDxHW9Q4uMarM=;
 b=W4+xA0TNUs6WPW2AGhDGopz7ZNVBm1BL+gctfJlf2msgSGYCdgZl9AH2vPRVaVGk2U
 9qYfSgOG0j8JhadcyVshU4b+wnOW4dVfmvaLahM7F9P9j9/w/bZr3JA2Y+eEjcdetyaS
 dX/IqMiUGs7cR7qYJ5odMyMBWeQjt8fYtC4K+uUqQ2pQdW66N+kmbv8Lq1gN6TX03Q+8
 DLiet2b5brwPBdkSizK+nza5ewZ17HhlC025Vgirs6VDCv1IVFrSNiRs0iYkpPApEhYs
 1jTe2pvv/KwFCfxmNdIWO1TcC+8rwbISUpkpUP9Ko/AqXAevLkPMeAm6hT4jduRw16Zp
 jlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718879655; x=1719484455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UH1RftmHG3Vs+kyJjdp6FaijzaNseaKDxHW9Q4uMarM=;
 b=xDRefwoD3tIGVv/Y4tC4c/ovd+N5IME3Go4RqNVQTRPMxLnQW4k/Ys8AcU/RcZaHAn
 lE7cawSTbR4OFuJjEsY3fYXkHE4anAA68JP8Xc4FypOVxuXmqwjQ0wIbk+9oRZddHNsx
 ny47i416NmFm22MmOMwasDIY8HSSDhT0qRGbx24SyQocqon0a9Ah3yj+9GjXXV2fQ+43
 Ti8GpSBQKeWMlkb7ZIZi9kW6Y0eRKkmmSL1I7JUaOzs07345Zsqyqn3CgDAgjJImaZr/
 sumx6YfXhbqkK+M6S/QEoV4N0g8+SQFEkVuepYqYFnyfqrwklDq677RClKS28geZxByh
 H8Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+Tw/9BAvqMWXXUWzhsRtUfuD0PTuWcR3CqwL/vHHk8GgWb6TW8gqN0lRfFRnjIjG2PgaCH7GNEvKVdLIoFLdMgVK9caUNt97R13A5O/iHCRwAJyQqkBDZ
X-Gm-Message-State: AOJu0YxI5KZj5AZ1B37ZvqPzlceAvVRHvD82QyL3XBkP06/Ke4otlqK1
 GH7gQgKpaOEx+dterMcWDOuMSTym5nlTimszU8tfvgj8xJ/+DiPrjBFgkSW1zgg=
X-Google-Smtp-Source: AGHT+IEywqbKty6de7BGaA3EekB8lHCg+TqJCCgL/r5vpSNbTS3dSW25wQhhnMyvzNmMNB+yuXEXOw==
X-Received: by 2002:a17:906:e214:b0:a6f:6721:b065 with SMTP id
 a640c23a62f3a-a6fab643f94mr316617366b.32.1718879654465; 
 Thu, 20 Jun 2024 03:34:14 -0700 (PDT)
Received: from localhost
 (p200300f65f283b00ca876ee5dd3d1e3b.dip0.t-ipconnect.de.
 [2003:f6:5f28:3b00:ca87:6ee5:dd3d:1e3b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecd5bfsm750320466b.113.2024.06.20.03.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 03:34:13 -0700 (PDT)
Date: Thu, 20 Jun 2024 12:34:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Message-ID: <imyuhtcsjrbyodsndzbaqfwa4jxny25eylfdh4u4xtsiotsk5g@45l556pcrzys>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240620084451.GC3029315@google.com>
MIME-Version: 1.0
In-Reply-To: <20240620084451.GC3029315@google.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============1163642461246360174=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1163642461246360174==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hl7obtkvuj2dllak"
Content-Disposition: inline


--hl7obtkvuj2dllak
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Lee,

On Thu, Jun 20, 2024 at 09:44:51AM +0100, Lee Jones wrote:
> On Wed, 19 Jun 2024, Uwe Kleine-K=F6nig wrote:
>=20
> > These two defines have the same purpose and this change doesn't
> > introduce any differences in drivers/counter/stm32-timer-cnt.o.
> >=20
> > The only difference between the two is that
> >=20
> > 	TIM_DIER_CC_IE(1) =3D=3D TIM_DIER_CC2IE
> >=20
> > while
> >=20
> > 	TIM_DIER_CCxIE(1) =3D=3D TIM_DIER_CC1IE
> >=20
> > . That makes it necessary to have an explicit "+ 1" in the user code,
> > but IMHO this is a good thing as this is the code locatation that
> > "knows" that for software channel 1 you have to use TIM_DIER_CC2IE
> > (because software guys start counting at 0, while the relevant hardware
> > designer started at 1).
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> >  drivers/counter/stm32-timer-cnt.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> Did you drop William's Ack on purpose?

Yes, because a) I was unsure what he didn't like about the subject, and
(more importantly) b) I split the patch in question. I should have
written that in the cover letter, sorry.

(Note I only announced to have fixed the subject prefix of the pwm
patch. I assume you won't include that in your pull request, but if you
do, please do s/-/: / on it. That's another thing I failed with for this
series.)

Best regards
Uwe

--hl7obtkvuj2dllak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ0BaEACgkQj4D7WH0S
/k7t4gf/cOIyz4Nagjp9u3Qrvbjo6uKDr5UNTBYW/l4HOKdCzRn2Ay7aWf5oRPOh
ZES1YQ1qZfU016yI+Uo1glCjmYvLuqCUeAh10hdBbTG62MHpUZoQG6KjL2Xv5+x/
FpsgfO77RerGDLZ4eUEH57XolCnRK76HAyDGLUp07GOU/xuDpGLmu6vh+Q+7m3Uu
A3IrKXrN9x8RDbO1Dl6Hm2Qpw+wbvZtlyTS/Zua+nKtO8lGpGkWtv3eJnnnupHQt
RJDvkplZy1uB3W+4x1cU/AKRtUphn94+DAaoWAHu82hamy3s3xiuS9n1aq5W4l8h
AtKCcSvaXottQP+Nm85Lr7Y1srvioQ==
=TbiZ
-----END PGP SIGNATURE-----

--hl7obtkvuj2dllak--

--===============1163642461246360174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1163642461246360174==--
