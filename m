Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C37AC446D
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 22:26:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F30A5C36B11;
	Mon, 26 May 2025 20:26:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB059C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748291213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HyWXqN+5wHGnA02x8VIFqjuokIUgrwEnON4MEoIF74U=;
 b=jJdjlQOrZMc6VIvq3OVLaypup/+U4vY4/Tu9aattgruQyCYTM0vrgKC27u0HrUjQuxzvTd
 NCXVhXUjV7B+hsRxBxIi5layaWBS4ttkHE84yazvfpSP+POc0HwnWGHlVBMff06KZeXx1v
 OxBYi3/D/OlGIhSEVzw2PVMN+iNZ4w0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-kxoxOLdGPKW5882mfvMCBg-1; Mon, 26 May 2025 16:26:52 -0400
X-MC-Unique: kxoxOLdGPKW5882mfvMCBg-1
X-Mimecast-MFC-AGG-ID: kxoxOLdGPKW5882mfvMCBg_1748291211
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43eed325461so17026275e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 13:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748291211; x=1748896011;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HyWXqN+5wHGnA02x8VIFqjuokIUgrwEnON4MEoIF74U=;
 b=elyL2Ykf7kzO8O7WMNzx4TIvakd5sxxk9KQ37vkc18AX33OmMVn+zWakqh2wfAlPQ2
 atdeq3u6Bnuy415NeMeiev0jsokZOFUb2oiTF6IyNgFuQslL0Dk0UX3Oe3kBWYK/B4qt
 UB7JZrUVb+flqa/3htMMCBe3/r3igVf8qqmWROh4hYU0XiROLeVkDKYsnlvc2QfoBoiP
 TeMfkz7YZZ+zihzYMXKkDknV+K6Xu7jZaCZv8GGXUl41uVVz7OwLvSzoTIuVLdlei+tt
 MXhcHppG/Vvp5zb8oyRWtMDOzxpAefqOVOp9fl6f2EW1hTsGmrSs8D4hineHwypw4yZ/
 bm6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUpvP/NOu081rqcikDh6t59GyE2dZ0WUXWcYwNGsApwV1+JcykPJPGawhu5rrSu9KfB3yrPyCvNb3nQw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxhVMTvCrYAS5Oo+I10LdvHKfmQ+JwyxFEc7tZletPuCf5w/Pu5
 8snfl3UPBqmGui0RHG5C0ua2n3ruujiZpHx9BLOFC8kc2ExOGQKXE4kUQlEHyJHwzmQfx0VnJxI
 MqKTQfGqDDnniA2E0V/rOGQBgNmwYPVVkKluD+wpfwm8/ua9JoJdKA3FuqnLW307bBGPaL8cqcj
 kjdljPDg==
X-Gm-Gg: ASbGncuQy6kU1WYNxZzNPx14zDnCxsTTEZJPtr/VJBpZu3RjQbWZew7rfwBkSrRfaxi
 4avpmmFSWVbTu//Z/QX9WpcqWaDorxQDuS1+v0WqJ/hdBlFu6PnM6MwQSZwwRGm7Cdw3LZsjWzy
 7LQAr4ehHgsaXR42Zj74iCSyJ0PgcXmWZd2z9Tfto/9XgfdzGDtywIwS/1uJHspzRGOIsGFuau/
 7ktpfOonw69OK55Q/IHYt+qsPRAQVW71ir/OhmnXTDW9RLFSd6BC0Rfoh42XHftQDujLkhVM213
 r0ljFvgMU6bsTi/uBD4oYwggTpUebizU2HIkw37T
X-Received: by 2002:a05:600c:5126:b0:43d:a90:9f1 with SMTP id
 5b1f17b1804b1-44c93016686mr92837625e9.6.1748291211242; 
 Mon, 26 May 2025 13:26:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSrD54L0gvE46Mtr1bEDCW7JZuh1RueZXOjVf2VgxDZDxuwPNbxQGifhSFMWHJcVtKTkfH2g==
X-Received: by 2002:a05:600c:5126:b0:43d:a90:9f1 with SMTP id
 5b1f17b1804b1-44c93016686mr92837385e9.6.1748291210810; 
 Mon, 26 May 2025 13:26:50 -0700 (PDT)
Received: from [192.168.0.115] (146-241-32-247.dyn.eolo.it. [146.241.32.247])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4cfcece9dsm7354854f8f.5.2025.05.26.13.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 13:26:50 -0700 (PDT)
Message-ID: <b3e3293a-3220-4540-9c8b-9aa9a2ef6427@redhat.com>
Date: Mon, 26 May 2025 22:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <foss+kernel@0leil.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250521-stmmac-mdio-bus_id-v1-1-918a3c11bf2c@cherry.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3-NkfgL1MeN3T-SCnjswSCvSKo8UZCEmHIpRjfhjQ2E_1748291211
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Heiko Stuebner <heiko@sntech.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: platform: guarantee
	uniqueness of bus_id
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 5/21/25 5:21 PM, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> bus_id is currently derived from the ethernetX alias. If one is missing
> for the device, 0 is used. If ethernet0 points to another stmmac device
> or if there are 2+ stmmac devices without an ethernet alias, then bus_id
> will be 0 for all of those.
> 
> This is an issue because the bus_id is used to generate the mdio bus id
> (new_bus->id in drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> stmmac_mdio_register) and this needs to be unique.
> 
> This allows to avoid needing to define ethernet aliases for devices with
> multiple stmmac controllers (such as the Rockchip RK3588) for multiple
> stmmac devices to probe properly.
> 
> Obviously, the bus_id isn't guaranteed to be stable across reboots if no
> alias is set for the device but that is easily fixed by simply adding an
> alias if this is desired.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

I think no need to CC stable here, but you need to provide a suitable
fixes tag, thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
