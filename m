Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC682B480
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 19:07:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FB21C6DD74;
	Thu, 11 Jan 2024 18:07:13 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAD94C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 18:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1704996431;
 bh=lv5L2wbjPc1YW+bfBQ2xAmvYm+GCTmQkkdH8Qjc9HRw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k15I3w8q1Xt6+sO+soQbwSrQPfh0RCgowNT2FUnLnjHfgzEghTstoGgHA4O9JIbRZ
 4ghe80QPeXKCGlKmaV/VCtqhawWXnRUrUwCbqmYdk3IHFJ/nlFNUqox206qYmftSt1
 NWC3/vhnl5q3AFfcQKUV2vNUsDoRd1QBR2E7J6/iHsKiNZ4cFFn2ZKVoISuu2Kf2Sx
 /U3YJ4N5DwnBp5EeOgMf60+7nhZgOS/r7gFl95KJDIqXZJi5KnRvJZUOkf4xP3at5u
 8egkGmktDDfQtE3ySHf6ZqrmdhV1I4gZqfGTP6hi4L0dEnHF4k4PI4aLDv1P7q5Zc2
 Z4/kZvag02TxQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82F463781FCF;
 Thu, 11 Jan 2024 18:07:09 +0000 (UTC)
Message-ID: <59bb488f-f2ad-44b0-87fa-206ae3b1c33f@collabora.com>
Date: Thu, 11 Jan 2024 20:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tan Chun Hau <chunhau.tan@starfivetech.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <rmk+kernel@armlinux.org.uk>
References: <20240111025531.2875-1-chunhau.tan@starfivetech.com>
 <20240111025531.2875-2-chunhau.tan@starfivetech.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240111025531.2875-2-chunhau.tan@starfivetech.com>
Cc: devicetree@vger.kernel.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jee Heng Sia <jeeheng.sia@starfivetech.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/1] dt-bindings: net: starfive,
 jh7110-dwmac: Add StarFive JH8100 support
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

On 1/11/24 04:55, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> JH8100 dwmac has one reset signal instead of 2 resets as in JH7110.
> 
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 50 +++++++++++++------
>  2 files changed, 37 insertions(+), 14 deletions(-)

[...]

Please note this is going to conflict with the about-to-be-merged changes
in [1], so probably it makes sense to wait for that to be picked up before
sending a new revision.  

[1]: https://lore.kernel.org/lkml/20231222101001.2541758-2-cristian.ciocaltea@collabora.com/

Regards,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
