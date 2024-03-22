Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E60A8869C9
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Mar 2024 10:55:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2389DC6DD95;
	Fri, 22 Mar 2024 09:55:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42684C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 09:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711101340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vo/L3PCMtanLu2TJZTNwXbvQfetWwP+AkuBpjYG20CY=;
 b=An/EFXdM+ZbTom+06eQ7/3ntOeJyycGVCHBCl8XL/uFmNiedSJj5wbrKSdrc4KKIxzE5Od
 6F4yYrvwFG8+n8+XNdFTKQ4SXH/picStDcBFD0Cc0fCMmpwP5QPzYM+ntSXqu+Hw3gSqhm
 pnmDn8CgfRai61eGWZBBRkIHphaEr8Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-sqDgVnw_PKK5eFUWMq0WCA-1; Fri, 22 Mar 2024 05:55:36 -0400
X-MC-Unique: sqDgVnw_PKK5eFUWMq0WCA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4140f58ac00so11842175e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 02:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711101335; x=1711706135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vo/L3PCMtanLu2TJZTNwXbvQfetWwP+AkuBpjYG20CY=;
 b=PWHbDQXreO1IxFcPSqypk/RKgnKb6DPqSATenq3R9n5+Rx1Af+1lHhlPedySRQNu2Z
 j/JfVN3dD75Mo0Dh3W29XJiOC8uHCM2OcJ9NpkIeKRLIOY66zqAXMFfBii1o5ljGbQr2
 39NQ8hkhLKCm0ICZ0UAYDgLKi2K0nEj3kZXCMkeqP1C6OKnjWAfG7dLywmbJRhsrctlA
 zR0JlyTMssBznzbdkRwL46sIyUm2rIou+zXFV+LeUNs7nRxiDyqYv3rrKAbmtYAOQ7eJ
 Ty2VX7NvJvAaZksDIEZ1P2SgYr601cytKK4Fv67a8yCaO6jrOOzwWvuhlwo9JeUJuimq
 NQeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjO1YPBEYJQ/B+eS21wAbb6k//IHUNo+cAOzfvNobbkZpYVrwoHZyVnIZTr/RwwgIsTnVKv3rX2QNQnJ6hDILGTaca8pGUMPYVunxL0WNs6E4weD9PTzyd
X-Gm-Message-State: AOJu0Yy668k03EgvhzqZEQ/J684Lp6shHr6I5CQafVzAk7fJX6PIYwrh
 nY8OE0RFGiGj+79WR8r5lpLE9ISCZyrJVeDMgqSJ6UV/bMKSPj2iOoFqv9GgsiRBWhofbP8J7ZQ
 dqfV/8KKiNmKWbbL/3KOy6+BdU1XQS8ia2xGKmE18laXEA4ihB/6JiEUUC3/bOAxlFpyEVAHTl1
 UZqgTe7hf7Sg==
X-Received: by 2002:a05:600c:524f:b0:414:113b:36a6 with SMTP id
 fc15-20020a05600c524f00b00414113b36a6mr1186556wmb.25.1711101334842; 
 Fri, 22 Mar 2024 02:55:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg/h7b5xnDKSo4gtbJWuasREGSAYbEF2+V9h+/dUOcDuMToHsBM1B7l/0LDXtt7umgouxxoA==
X-Received: by 2002:a05:600c:524f:b0:414:113b:36a6 with SMTP id
 fc15-20020a05600c524f00b00414113b36a6mr1186532wmb.25.1711101334272; 
 Fri, 22 Mar 2024 02:55:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 fc18-20020a05600c525200b00414105c4cd9sm8362519wmb.21.2024.03.22.02.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 02:55:33 -0700 (PDT)
Date: Fri, 22 Mar 2024 10:55:33 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20240322-brass-magpie-of-teaching-9cbff7@houat>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
 <20240320-berserk-soft-crab-70d22c@houat>
 <2A220F57-5DD2-4F28-9328-547A04185D3F@geanix.com>
MIME-Version: 1.0
In-Reply-To: <2A220F57-5DD2-4F28-9328-547A04185D3F@geanix.com>
Cc: Martin =?utf-8?Q?Hundeb=C3=B8ll?= <martin@geanix.com>,
 yannick.fertre@foss.st.com, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] STM32 DSI controller driver: mode_valid clock
	tolerance
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
Content-Type: multipart/mixed; boundary="===============1232337211011551341=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============1232337211011551341==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rp7u3xpfvn5q7kb4"
Content-Disposition: inline


--rp7u3xpfvn5q7kb4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 09:47:18AM +0100, Sean Nyekjaer wrote:
> >> If HDMI is requiring a tolerance of 50 Hz, would it be better to do
> >> the check in the HDMI bridge driver?
> >=20
> > Judging from the code, it would be hard to do because the clock that
> > generates the pixel clock isn't exposed to the HDMI bridge.
>=20
> What do you think about Raphael=E2=80=99s proposal to add the tolerance a=
s a
> device tree option?

I don't think it's the right solution, for multiple reasons:

  - There's no way for OEM to come up with a decent value;

  - That value isn't platform specific in the first place;

  - Allowing any value will create troubles somewhere else in the stack,
    for example for applications that rely on accurate vblank;

  - We could come up with something that would make this entirely
    irrelevant, like being able to come up with proper drm_display_mode
    based on display_timings and a given clock rate.

So it's a software problem, it needs to be solved at the software layer,
not in the platform description layer, no matter how convenient it is.

Like I said, VESA DMT and CVT specs use a .5% tolerance and it works
quite well for panels too for other platforms. Just use that and see if
it's still an issue.

Maxime

--rp7u3xpfvn5q7kb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZf1VlAAKCRDj7w1vZxhR
xaFOAQDKiKkMqulyFswAi+droFD84pxIoT6ueIzkm7W7ZLCtKwEAvw5ciGv/GTA/
wM7izR039t7Wi6kVqWxiDb/R8gQHWAI=
=MX70
-----END PGP SIGNATURE-----

--rp7u3xpfvn5q7kb4--


--===============1232337211011551341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1232337211011551341==--

