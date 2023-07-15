Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F80768DB1
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06EBBC6C831;
	Mon, 31 Jul 2023 07:17:17 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6CAFC6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 15:11:50 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3461053677eso6531845ab.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jul 2023 08:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ieee.org; s=google; t=1689433909; x=1692025909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
 b=KpbiwA9NRF8+W6tdUk7oAEajedYliLcT3fLwx1hKWNPafETFpJG9nnPmhVRp1UdI1a
 ec9mVwfBesk49WkdsrPfeQTQNowRCIhbKJuP16XD7dO7TZekJ8yDxNsj6kgUO5dmVinN
 O/xItmOPmt9BnCnKdfjfmpm5zf8eizKb7wHPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689433909; x=1692025909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9XlpRMNdAAEFImKOS7TDT4umEsjSeY77+bJ4P1MRe8=;
 b=GE5886lfislXJ8Ti3aS+nKEXVI+DMQOhEEqFbQ1XwFmuBTHaPnHVa52y206xvJO0ce
 t6A40fjH9LnxqJ1NSrB+x2XvpgeFYTUMIvfDavoOtF+FlEd2OOt+2oUXVJkTyQNFd7sl
 aPYd5Wd8flRpHXxXPAQFaPykaQM3BtR8BEtolOW9FK3Im94YKB2wg0SWaEImaL4NMwNe
 8IhzBhpU6HNajQu55lJ7IUnMTLwYWgp6a9rgIFWyS7U5051nHHAZ86rnPhYnRylMHEFR
 6OK8dCg7II+bX70YczrjviyoaDwg/AYyRTXKrnTEpOc3MxfxjGnVz03HbD9prOrYxlMO
 meng==
X-Gm-Message-State: ABy/qLZW63hCaPAzIMogW4PbEhRoVTb4RUf/dLBkggOO/yHM4qbKiuXK
 eLv7n9/VWyYUKgMdjefLEI86vQ==
X-Google-Smtp-Source: APBJJlGJVqbBu5lKEA54CgyQF24n/fOTJfhIYz9w3XH4VGOvH3KCmWksDsEmgsEiSCeG83sO26Hgmw==
X-Received: by 2002:a05:6e02:1148:b0:343:ef5e:8286 with SMTP id
 o8-20020a056e02114800b00343ef5e8286mr3847417ill.7.1689433909634; 
 Sat, 15 Jul 2023 08:11:49 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net.
 [98.61.227.136]) by smtp.googlemail.com with ESMTPSA id
 f8-20020a056638022800b0042b2959e6dcsm3321388jaq.87.2023.07.15.08.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jul 2023 08:11:48 -0700 (PDT)
Message-ID: <1c6175fc-496a-843c-c8c5-2173e065eaa8@ieee.org>
Date: Sat, 15 Jul 2023 10:11:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
References: <20230714174809.4060885-1-robh@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-can@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-wpan@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ath11k@lists.infradead.org,
 wcn36xx@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: Explicitly include correct DT
	includes
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

On 7/14/23 12:48 PM, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

(I significantly reduced the addressee list to permit the message
to be sent.)

For "drivers/net/ipa/ipa_main.c":

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/net/can/bxcan.c                                 | 1 -
>   drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
. . .
>   drivers/net/ieee802154/ca8210.c                         | 1 -
>   drivers/net/ipa/ipa_main.c                              | 2 +-
>   drivers/net/pcs/pcs-rzn1-miic.c                         | 1 +
>   drivers/net/phy/marvell-88x2222.c                       | 1 -
>   drivers/net/phy/mediatek-ge-soc.c                       | 2 --
>   drivers/net/wireless/ath/ath10k/ahb.c                   | 2 +-
>   drivers/net/wireless/ath/ath11k/qmi.c                   | 1 -
>   drivers/net/wireless/ath/wcn36xx/main.c                 | 3 +--
>   drivers/net/wireless/intersil/orinoco/airport.c         | 2 +-
>   drivers/net/wireless/mediatek/mt76/mt7915/soc.c         | 1 -
>   drivers/net/wireless/silabs/wfx/bus_sdio.c              | 2 +-
>   net/core/of_net.c                                       | 1 +
>   124 files changed, 110 insertions(+), 120 deletions(-)

. . .

> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 6a2f2fc2f501..da853353a5c7 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -13,8 +13,8 @@
>   #include <linux/firmware.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_device.h>
>   #include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/soc/qcom/mdt_loader.h>

. . .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
