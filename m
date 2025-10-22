Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2CBFDCA6
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:14:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E777C5E2D4;
	Wed, 22 Oct 2025 18:14:14 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 838F1C58D4D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:14:12 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-782a77b5ec7so6723039b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761156851; x=1761761651;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2kFn+Q9bHJC3Z5Ojn03a1WB7AFdkKhdOTMatKkfbRQ=;
 b=I0WAwjHRx2n6rB/waWg2UzB55RyVQw3XDOyn3kg1kFFV/TP6fLzIaOSDbwpdT+Kl4n
 +BYL3vvfyE/ms/qmp8gmEIhwqLgSmjt1To1YEDJB0LAHARMSk0xREWoo6IslIv8LbNVn
 p/bw/spd78wnE6hZcIiriaQZl5yxVyZqCEXSBkcIs6jh+f6nBZMq2RJykFEQizTN+5EZ
 JsJ6AucYFA0auODaWlzXK3tDlIUctRsB2Igk6IpdicpiSUKns+sZFjw/Jmx8s0HVdRT3
 tpt4V0L1NH2TV99dCzQq2vD9KtejsspCfF23kv9L7typ56A4sOyOMNouo73njp5M4Oz0
 eJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761156851; x=1761761651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2kFn+Q9bHJC3Z5Ojn03a1WB7AFdkKhdOTMatKkfbRQ=;
 b=hyep53ct0iWZVSprb64nqzKycgS7WX/tyiNferr7TaIhwGcd6eV4ZPcOEM9puDc0KD
 fkRcS2wZMjQJfGUhTaH1uAQVTrOqTeC4ljOlUZyQ6rIczCyK9W6ByIpZpuO8l+xO3+4+
 UIyXk3wBK5w447FyW4OciSHhVQS5/uJ7YY1euEHIUfWbTX+PKFKm5Wdp3nVwNTK/lg3k
 faF7yyZ+GdMpOxRu5PD1SPPI+vppBJfdKuFAoEx29AFdNkmQRXBRlp5vI5E9LI1ldEWX
 AjB1hqSy9gAVOQFDJaq/gIHQK21+FHC9LXHWRkVS4IBgRtmrTK08XrGaQ5u9gc2M5uOb
 nCpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXehWjjKQCZet1/Jo9zFUJAja7o052fL3G/ThwCrQ17d4U/knyz1tcBgVrTsDsCWcz0VLIvvy+MBnURTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtFUbaD2d1fhc33CozqdwNtRBMJvlN4owm1WPJjy4N29atqCTy
 BEk2+VSFm5o1YgIYStGZd8J6Jx9keDTP/fzD9niozDSyohbx91Ya+KZx
X-Gm-Gg: ASbGncu1NsO0NzF7L43RET+NWHBm8MbNbKEjgsgij3jVa2TH/hWZPob4GKtrfoGomQr
 p99vO9A/Pq2nMFKoaUKV7u6cnlcOpjcLrLBhYnlVyeePQ7Vrt8SvOkZHSPZVwhbLYq4/u+fVF49
 80bns9Y67rDlNnEKDAwOUZPAAzZBNnvfGz22twK1y/dtXr+a+TkXvxYe5BQky70D7fqBxw17XqM
 8b3o5Slr/GA6K57SEsFYCATLl0q8XBOPEBXWboiGDSLZBkg7wjK1eW0ZIrLweWr7/nDdRW5JpXS
 EEsjXVNk3NYIEyCdru5G6HC0HRD5y3i6KRoJ3YeDSmV3H6HOblqLwHnsmLjdhloy93bDACniO7W
 qRM80blBwlxe1+wmUZyno5TMBzWCpmi1O697M/SQOY+p2z9ILnqSYbEfUYPNTrCu5N0KtBp4E3p
 Xy5hAER5BEaxU+vl4WRxF8cJtEE2g=
X-Google-Smtp-Source: AGHT+IF2Mft5qBX8wVUVoHYsw+dNzDnWTlX/e+wgKxFPHsJD8mgW5lDVoEORt0wiViK+vK7wTKEhow==
X-Received: by 2002:a05:6a20:939d:b0:334:8e2e:2c55 with SMTP id
 adf61e73a8af0-334a8525dadmr26726146637.18.1761156851043; 
 Wed, 22 Oct 2025 11:14:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a834de75bsm11192507a12.12.2025.10.22.11.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 11:14:09 -0700 (PDT)
Message-ID: <432ac9c4-845d-4fe4-84fb-1b2407b88b3f@gmail.com>
Date: Wed, 22 Oct 2025 11:14:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: phy: add
	phy_may_wakeup()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 10/17/25 05:04, Russell King (Oracle) wrote:
> Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
> when the PHY driver has marked the device as wakeup capable in the
> driver model, otherwise use phy_drv_wol_enabled().
> 
> Replace the sites that used to call phy_drv_wol_enabled() with this
> as checking the driver model will be more efficient than checking the
> WoL state.
> 
> Export phy_may_wakeup() so that phylink can use it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
