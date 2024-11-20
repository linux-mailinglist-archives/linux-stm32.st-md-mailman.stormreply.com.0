Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B49D3E33
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 15:56:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B34B4C78021;
	Wed, 20 Nov 2024 14:56:56 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6013C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 14:56:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso18747625e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 06:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732114608; x=1732719408;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=;
 b=b562a7kn4oya3BepDGf78WTsgI5ekgZ1a/T7Hiq8aqpdFlSschI9RHzZSTuM3pYMs/
 Z6WU/oYS6xkUa3AIhXhrO49OIlNh0T+hDn0QcNyDs7IyH1qPbfm6rRkQbmqCrfADRCQD
 LHnbcvrgC5rn8fa7ek7AQ4Tp13nBGAHx2tphY7fRSp8Z5O4wFDYGB/LmlUcJ3dQS1MEo
 aA+lejILN+pVK5Gd5NG4Q/oZxW32hE981AHhG7eQ+LQ9tpa7f3ATJ1mtz2h0PirxVZ67
 ZAuXrdJfWZ5JP6rgC7hCkCTOxogmIaafOuNuz7gxZ4dAL8IGQYNf9MYm/rVolcNhUpqe
 BKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732114608; x=1732719408;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WhX7sy9ylH8oB54T8NmaXKVtwnhmbfEVEz1XB5edX8=;
 b=Ygr4Wa2ZVRuVmoGOLtweHDSTi/2ZHUSMS0SJOFEeveDCU5fPAFIwJX1YpnhbHogejo
 gKjFDPWNeRDRySOQpoFuPciJfycPQbyS1HIuJJJ05AAlplIf4NaDzEXXOKJvrw8xlPRT
 nDzsOGhVf5/jNGPxXg3ElRnqK9bIJx9zCnD2VGDXBOLTNA4ySLkrDUal6bxwDEj+L++2
 tpUDkLhlV0zavf17iOhjW2w0ufrxKYbRO8s8iCRg/eNnpaYPBc2VbhSMHkT0AGomTLJn
 bjUXs2wISCm5vEHgiSpiHuf6//+JEGXduzlxHb+YZDVsIywaVoLRwNlzKhNHlVIHmilH
 PqsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsYjK1fhG0XRlM0KCJ+z542VI6RtKtuXck8wbInsS1jTVklTZskJn/SbOa4gkyleejEQ1uZI3xSrMsUg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEECXUESGZknukifZ2fsYgYnQZ1/SVgKOA54mDJufAzIo6ru1t
 LpA9rhORliZw84Vg663fQUGQ/iro8RrIfDzEQKwLJX5WGYI3dpO3WsN27jM3gvU=
X-Google-Smtp-Source: AGHT+IHrKfGLOGxnCvfbK0rlizot2Xe7bNWUl7+WlgkZB4qaV364sHZfb2rsYw8BE+EFPgwo4ike+Q==
X-Received: by 2002:a05:600c:4f83:b0:431:50fa:89c4 with SMTP id
 5b1f17b1804b1-433489868e5mr29893195e9.3.1732114608102; 
 Wed, 20 Nov 2024 06:56:48 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825493ea7fsm2279732f8f.90.2024.11.20.06.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 06:56:47 -0800 (PST)
Date: Wed, 20 Nov 2024 15:56:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Message-ID: <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20241118082707.8504-4-a0987203069@gmail.com>
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add
 dwmac glue for Nuvoton MA35 family
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
Content-Type: multipart/mixed; boundary="===============4850286818454179603=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4850286818454179603==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xlycwx5h2jmtpvei"
Content-Disposition: inline


--xlycwx5h2jmtpvei
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
MIME-Version: 1.0

Hello,

On Mon, Nov 18, 2024 at 04:27:07PM +0800, Joey Lu wrote:
> +static struct platform_driver nuvoton_dwmac_driver = {
> +	.probe  = nuvoton_gmac_probe,
> +	.remove_new = stmmac_pltfr_remove,

Please use .remove instead of .remove_new.

Thanks
Uwe

--xlycwx5h2jmtpvei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc9+KwACgkQj4D7WH0S
/k7LQgf9Gwj9QyarYndFEA5e8v9OUMxfn6Cu7vJ3gmwOZLcBm0Oi+KHCfrK/5oMe
BYJvIWmrL6AbSFQqaIp38aZmWH2UiKV3KCeRx2kikFou49njcPVyqAKzwpCCi5TE
6XTZpAg/OHN3kJOiLwN4RZVsnsA4pR1VQVIdch+oGFMyKEgyu85MLpjeQecxRCT/
RP/bgKRO/OTWrrtnIewHNV2YsehEzx/+wY9gCh6lEVzBJYDGNNkZf49WdTO5nF1G
KB/pOfKMX4LrldyqelhrRyOOkqDa2mtB5gVdJf5vGP64XwbyxPhzUbblHk/cc5O3
wThAhMtIKX1kBcxmm20loeBenE3nrg==
=CCaY
-----END PGP SIGNATURE-----

--xlycwx5h2jmtpvei--

--===============4850286818454179603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4850286818454179603==--
