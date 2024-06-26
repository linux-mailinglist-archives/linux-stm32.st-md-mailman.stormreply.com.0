Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44068919897
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 21:56:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9AD4C6DD9F;
	Wed, 26 Jun 2024 19:56:06 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D65EAC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 19:55:59 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a725a918edaso328491766b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 12:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719431759; x=1720036559;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VStahdc+xT5qsKNlriY5Qfhtj/4m/b+JQnzUhJkoQWc=;
 b=WllY3SnMdnSpBYSRmR8kQC1VTsu6kskGLBb4Nak1xQ78OyMhHYNNiOBQT9OnTUPavY
 fontpy5nKi996n6rgs8lbcuc/T1cSVXf2851zUE2d6qrxxIaUVEXgXvDC1wZ/pxqyTbx
 j9StIOYy6jFhzmnxwPlgClUG/Jhk++WyNGyqTY2rqwaIOsN7lKO3zJKrTihKa2dxVvIL
 Lta+pvuiqSvkSkyN6xD6LF2E/rVUaOTpPolxihM7tdEWdq5F5VOJ7uvR7w/aooMT05kP
 NV73JGp2zLDEXJdYIpQHrO1nwFQC3yX9o8r8JMGQxQtoQEV9VMf2Jrnu0kVlxzi+zRaZ
 n68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719431759; x=1720036559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VStahdc+xT5qsKNlriY5Qfhtj/4m/b+JQnzUhJkoQWc=;
 b=iEOzN5EAJkgU/Mw+/cnZecdIgz0xmcM4wVTpFhco+kZafdVRDch256lDn+b5Mx1JjZ
 V/jFv13SYkPuUPjbf4O6iGPLq2HXu+D8Ub/OBGsBOGQTQfTY5sO3Yl8LUQW01wSH9dBh
 Z0DhSpoX9nAT6Z0XwE7S3Vq0R/hr5Y+f44AUS1me1dASyOxzjuu0b7RvPaRrPJx+tO/8
 dJiUsTtqq9GNWyElFOLZgxa1Ol8itej3elNQus4r09FuccIgJXu7kdpUyP4+c5tl7NYD
 jt21iz+njgeSeNLrmKWnUIkDMiXdySzqeUE8VBVnFrEEdJj6p7bn40E/zjphPSxxhKMG
 +a5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4VwH7fHnaM1E4iQmRdE3ZL4fWCOJmJXV5cq3qLvvo8hKFaFIfH0Z5bw+mtxPNpeAx73FiieRVcz0lAp/h4i4UxaLBRmzzSBXqYgCmEChVqzEDxVrCvyid
X-Gm-Message-State: AOJu0YwIev2q7NUpI4i5Uw9wgsJWgLkjTWU1VhCRtltoVaseYnlOSYae
 dVGri1YlRTwsQeg8ILrcr5SWybn1KeOiv/peKIXDXv1gtji7TtuV0jOtwgE61x0=
X-Google-Smtp-Source: AGHT+IGx4yr/IsrDbjytCCrhgFDG4h8ha+n7vpXHHMXD1rUABSW7A50SrfYz2LfdXXZXN6tlmkX52A==
X-Received: by 2002:a17:907:d403:b0:a72:554d:829c with SMTP id
 a640c23a62f3a-a72554d8597mr884511566b.3.1719431759269; 
 Wed, 26 Jun 2024 12:55:59 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72451fd535sm453244166b.149.2024.06.26.12.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 12:55:58 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:55:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>
Message-ID: <u7kisifvsi2bwbayum6rlndu7mingsm3jpaqym6jrzpfzecukz@6xtbqlwxauf6>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <126bd153a03f39e42645573eecf44ffab5354fc7.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240620084451.GC3029315@google.com>
 <imyuhtcsjrbyodsndzbaqfwa4jxny25eylfdh4u4xtsiotsk5g@45l556pcrzys>
 <20240620173838.GB1318296@google.com>
 <ip5aysvcuchc6q6sikghcz7vjn6zvih5r3amkvp7n7xpvncbhh@jdq5lkckeoej>
 <cgtiizodhbyutaeu2kw5qszb6ap6bpzdk5pnpurliikhz4isvp@3xtidwcttjkb>
MIME-Version: 1.0
In-Reply-To: <cgtiizodhbyutaeu2kw5qszb6ap6bpzdk5pnpurliikhz4isvp@3xtidwcttjkb>
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
Content-Type: multipart/mixed; boundary="===============8187124078859370067=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8187124078859370067==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="odshdq4rqvga6wxb"
Content-Disposition: inline


--odshdq4rqvga6wxb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jun 26, 2024 at 09:43:29PM +0200, Uwe Kleine-K=F6nig wrote:
> I wonder what's the state here. Maybe Lee waiting for William to send an
> Ack that Lee can do the first option?

Huh, sorry for the noise, just noticed Lee's mail after sending mine ...

Best regards
Uwe



--odshdq4rqvga6wxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ8cksACgkQj4D7WH0S
/k7zYAf/XnWC8IKcAjOYCWUlOn51NvYiVs+jnm/GKBWbNOMgjmXYnWRxgRHEVzhT
x2EkGFN8ECZTxfySdpZgzYWC5G59mSKgSSwfUEohqEUjCbVG6ZIHKMPXKs6olaqD
KqD2CDfwGSJkasedNYJ0PRoE4wWnEDOx+mEbtqATfewhmcQo1FPAo0J94mt1yuxw
xcERsKlDDVmEj9H7yL2GAUEJ6Neons7GErFh/ZIrJjSkH1BvhBsv/Eyg8IiyR76s
abCQ6Y6yhpNRsiLzXXNZAckMQ0BdY8db3P0Hm5ejG6uo+mCoFXSXKI8k3N/T/pQd
x2J4zhIJDOGVtFb4YRD+NmzkrHVPUQ==
=8Tv7
-----END PGP SIGNATURE-----

--odshdq4rqvga6wxb--

--===============8187124078859370067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8187124078859370067==--
