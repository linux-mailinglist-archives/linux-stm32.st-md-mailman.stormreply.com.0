Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7F696F8EA
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 17:59:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93346C78013;
	Fri,  6 Sep 2024 15:59:34 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDF18C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 15:59:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c3d20eed0bso2197139a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725638367; x=1726243167;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F7TOto2gJdYDzL19q7b5Hq7OG/kUEwC5OLOLMKwb+YY=;
 b=feMATCx9dbZErzRNaVGKI1WOsadm4ePX504jVf0EentV4e+YGQgRS9VqumRhVh/Aqb
 +/GiZUAi7XH+6BhXB8QXEdBYFRtuCPp9kq1VJXdXkGTE0omL1CbOQOIFD4dt/B+BYaOt
 ULpna6//TzUnK3hBl4aOvm0asw1HY8MhAqPf5fWJMIi4dhl8CMz7Ut5cVsc0ByLeskWk
 Vy6car0WyDELID5ZvlYBVr3Snv5q2fCamo5XfaAfUo3OkROgSjIYLV1c0cjdxDZd0vxy
 PCHgkD6o53RWe2XrCF6Bnwa09U8zL36epIYaKG3buFXecr4FogWbJ0FabhZ/F+BENcUa
 ZIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725638367; x=1726243167;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7TOto2gJdYDzL19q7b5Hq7OG/kUEwC5OLOLMKwb+YY=;
 b=KdzjhWBK/GIRfNebbzocFeapwLWnnkSxLDP0Gq5c+Wra29odgTPbbnmiz9JKXcPlcu
 jlcWk48a0zTY6WgxgDUZ+x66zcxtKmnF39qC55TbEaZ41gYlIjQnA0qvLh4h3gm2/GfY
 zMqLWpp80z4bUB+lT9ElP111iVfivEh/A7hO1mutgjH/p1tQed5FUYymkIPI5yvEfUBX
 8E6XgX/KKoh3Nof40r8SIwTECYbC8n4zD1dQBwgLtyccpRVr9cESnBs2kdjLaXnCsk82
 FCHKDb6EZ/xKCCUxq4dx1R1wOrt2NkPzpT7+NywscEgtd+jEqcs0WS5eYJJcfW5puYEo
 0tJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXLukJHXMp+IUzZyIEXyqMnfy/20wiWmXW/5EJVc6/tXc4rkkhZil00wUM9zt04mE69RxjwdImgpEjAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwnnOgL5euzinf1wA40CNQy6qBS2pfrzlBqKv7ywn0pntV0JRru
 5/p0/q39zEurBN9XF8ptbZ/u5mRDfv41oB8K2/4AP1Csla1nJE8z7I3xnnCgRqg=
X-Google-Smtp-Source: AGHT+IElOuVW0/bvU5KZW0vs5FRqDmEDWn7l0+wenGnjMqDK6TiMDh3GYYeFc7VUmR6Y/xGk+UFE5A==
X-Received: by 2002:a17:907:36c2:b0:a7a:97ca:3059 with SMTP id
 a640c23a62f3a-a8a88667f98mr278534766b.34.1725638367021; 
 Fri, 06 Sep 2024 08:59:27 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a70592a9fsm237226966b.4.2024.09.06.08.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 08:59:26 -0700 (PDT)
Date: Fri, 6 Sep 2024 17:59:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <tv3muhjb5utix42duujkqqs4p2dvfecwafhqh5kvv6wqrd6hxp@6jaw6cujvubd>
References: <20240905090627.197536-2-u.kleine-koenig@baylibre.com>
 <07ad0918-c1bf-4ae2-8091-33e75aac4778@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <07ad0918-c1bf-4ae2-8091-33e75aac4778@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: Use the right CCxNP bit in
	stm32_pwm_enable()
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
Content-Type: multipart/mixed; boundary="===============8565614839223019070=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8565614839223019070==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4p3lzx43yv55222g"
Content-Disposition: inline


--4p3lzx43yv55222g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2024 at 02:40:01PM +0200, Fabrice Gasnier wrote:
> Good catch, I haven't noticed this has been introduced in earlier patch.

Well, wasn't so difficult to find. When I tried to fix my conversion to
the new waveform callbacks it was quickly obvious that the patch base
was already broken.

> You can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

thanks, but I was to quick. I already sent a pull request to Linus
(https://lore.kernel.org/linux-pwm/25x74hglxoyb33fphdrtxrpmvsqe5227d7vy6uo6ez77hjbrn6@dh637q6cvzax/)

> Does it need to be CC'ed to stable list also ?

No, the issue was introduced in 7cea05ae1d4e which is only in mainline
since v6.11-rc1. So assuming the fix will make it in before v6.11 there
is no need for stable backports.

Best regards and thanks once more for your feedback,
Uwe

--4p3lzx43yv55222g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbbJtoACgkQj4D7WH0S
/k6pswf/ahSJfbabI5hmfPOo/8K3+DFe9kw7Z/MXI1LXugsUYuAx2taakDUYePq+
pp4wC/3bK86r+rIJQ7B1hfzwbU9VkXGOzcewBGV43nC3C8AJmNmqtl9kOYpe41T/
kxmf+HJHATmH6FkmYf3oeZ5Oyi/yZUw73f0Lh4nED0XWZqXGXM+2EwgmQ652KKuv
izrwZRBmBxHg/BvIolfznA6+NEpPEby030VRXSbFA2NcdnUHUZfBqbNjA2smSCfs
yDY3yXhq6ZfRqPH1CqwFbBPqLjWMVvwCf8Wek1QiaVv6uIAb6+ToWieXGm7Uxl6D
bYbWkePlWDTNMLbhzMZzqKnKcn4gzA==
=7NB1
-----END PGP SIGNATURE-----

--4p3lzx43yv55222g--

--===============8565614839223019070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8565614839223019070==--
