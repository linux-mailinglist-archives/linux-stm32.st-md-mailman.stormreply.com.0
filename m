Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6659113D5
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 22:56:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD2C6C7128D;
	Thu, 20 Jun 2024 20:56:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58D58C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 20:56:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-36226e98370so848202f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 13:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718916979; x=1719521779;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tParEw4TnP3wUXcwkDyOi4Scz2rhjwIoECr/A9aobTg=;
 b=QHBSd13XDFziArfLzagh08V3xki6dVQkADnK+fSkO+EkOxFnKJUGF5jExHVBZNF6wa
 A3nogrDLCJCabk3asdJghnF1Q+7c2/gqmNh4K6u3IutZn49ywbmeg2UeA5HevI8NFEsQ
 tLeUIhBbTQn28vprkR03kPkznp20qDUvPnhLl5b0aBVn4/zXVA369M4CwPM7tk3cI9u9
 6YmUAX2dzZS46j5+02uHEb6kl47GdFlhTCm86Qee/iVncknVFCYD8d/R9MVW/lM9+h9v
 tXUdY10JR0+tdcjcX/JrziA5k9ch5k00Z4O+kFkYpaaxMzZRtziLl3LUsrYsNI84CqOH
 7rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718916979; x=1719521779;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tParEw4TnP3wUXcwkDyOi4Scz2rhjwIoECr/A9aobTg=;
 b=vsxI8m3jxh3GRhwh/sAoOCOVl1htJOl8+F/tRWJwE7PQUaDs+5g5aBW4FkTRH88Hxu
 AiDWIpSF25N19TpwMAU5MEOvm7obcDTe7bMbWQSbsufSnDxIVdhVXz1QCrCuu9kgdwhQ
 uuECydmJl8xNGJQV3L8VEXUrEd4MapeskznhVfAQEmD7BcwZiWHA8Lasvri/zWwvFY8C
 OXim3dgxqmGrp0HHzSbhSrtXKUyMB4fYBeOVYzNOMgOQ0N2KtDnnCqC8/wbfQQPVnTS6
 zdO9DhTCBJlbk1RHBrfC99bqgpgLJlEl5CYzFwUIPUcLVb0ZAfbI3G4rkFEtLNphn7no
 +vSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaFM7jqoHvhOc9ppj1YWvdG6BcI1hmtv9zSC+SrPLdlknzjjMxqPT82LeccVo7+mmmjyzd19IuleDB6T/bXHiOpPs5j/uVHykVM6D8XJgsM/sX4wLPFcmI
X-Gm-Message-State: AOJu0Yze7oCpd0Z7BaILLvO5jdIh6I/+65BtLO4eIklCYkTdcbOgP8Ey
 ir0gpE8pJ1Pcm4wsQ467inNyA2DYWXncpsf/+bpjPBf7zKe0idzTzxS7wrU2Kp0=
X-Google-Smtp-Source: AGHT+IF8t8LppDcAmDZ+UAbN2U2Xv9mXuQyfexbNH4CmjdFqAlZe48YByq17RrjbGyxJj0+YBSnHjQ==
X-Received: by 2002:a05:6000:d52:b0:362:ad5d:4df4 with SMTP id
 ffacd0b85a97d-363192d0833mr4782800f8f.48.1718916978597; 
 Thu, 20 Jun 2024 13:56:18 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf56eeadsm8781966b.216.2024.06.20.13.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 13:56:18 -0700 (PDT)
Date: Thu, 20 Jun 2024 22:56:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Message-ID: <ip5aysvcuchc6q6sikghcz7vjn6zvih5r3amkvp7n7xpvncbhh@jdq5lkckeoej>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240620084451.GC3029315@google.com>
 <imyuhtcsjrbyodsndzbaqfwa4jxny25eylfdh4u4xtsiotsk5g@45l556pcrzys>
 <20240620173838.GB1318296@google.com>
MIME-Version: 1.0
In-Reply-To: <20240620173838.GB1318296@google.com>
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
Content-Type: multipart/mixed; boundary="===============6071462983160262652=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6071462983160262652==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ny374adlpexcdnhr"
Content-Disposition: inline


--ny374adlpexcdnhr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Lee,

On Thu, Jun 20, 2024 at 06:38:38PM +0100, Lee Jones wrote:
> Which patches need to be in the pull-request and which can be hoovered
> up by their associated subsystems?

The dependencies are as follows:

	#1 <- #2 <- #3 <- #4
	       ^
	      #5

So the practical options are (in the order of my not very strong preference):

 - Immutable branch with #1 - #4 (assuming William is ok to let you
   merge #3), and then I can add #5 (and further work on the pwm-stm32
   driver that I'm currently working on). Maybe William even doesn't
   need to pull; I didn't check.

 - Immutable branch with only #1 and #2. Then William can pull and add
   #3 and I can pull and add #5. #4 can be applied later then.
   (I can remind about #4 in the next cycle.)

 - Immutable branch with #1 - #5
   (Reminder: In that case please fixup the pwm patch's short log with
   s/-/: /)
   I would add this for sure to the pwm tree. I didn't even try to check
   if it's needed for mfd and/or counter. So if you don't need it, I
   volunteer to create that branch, but if you want to do it, that's
   just fine, too.

Best regards
Uwe

--ny374adlpexcdnhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ0l20ACgkQj4D7WH0S
/k6mfwf+PSqfL8bo56onxdPLgXeRSRFlGHnohlXLPJBHSNS5MN0nKoVkWb3Qrx9j
0iMDVTrmGbfB3Bi2hVznoi3CFEaRhRzGSm0de3kSbJiXzqNacDdNVbM5WTzr38GI
wfXotmIxx6lAnt5QMb672g2S8AVqvuO+64QzFAoStGh+BtBFcZCQmTsgQEVbWzNU
WeMX5vPGvMwWEjjqkgnAscNxW0KGCwt1j2BlBDvxlacxSosQtjjROYl+mFaz8ii0
1LevCg4/MxvJQd+LsXFitEFa7ObSpFku33S9mllK7EtR/pcJyrxVXn/+yRMFIWWb
D3NxQShAbnZwVqj4+grvDGqCZKImYA==
=nFFT
-----END PGP SIGNATURE-----

--ny374adlpexcdnhr--

--===============6071462983160262652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6071462983160262652==--
