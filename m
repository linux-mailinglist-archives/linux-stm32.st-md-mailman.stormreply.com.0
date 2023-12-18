Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C85816CB0
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 12:43:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 576A8C6DD70;
	Mon, 18 Dec 2023 11:43:57 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A114BC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 11:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702899835;
 bh=+AE8FG87JjGXQZ7aKx+tpmHcDvNM6DDRUxk5MZqAb4U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NnoaSKieHR6swMS1aHrusYDqLIPoqpaqKP+0jC7/bOhu9uyCuIBbR7GbjLOTqnVFQ
 aofCGeAjJ4cerVlSp1kZIzTq3bqOY0m+r49v5ciHgqgMaU5T6cU4vZbLZG4vXANCbv
 zuSyGf1s3hLfzDH5RWG9MP/vR06o1sHfa11g1uWVzclCVDk0a3F4hQgZhBx416FP3f
 OL9eePgwTzMG11Djscu2MGXa5b2LVFdYhFoA757KG6Ink9K5ft8lu/cm6CSkRraR8x
 aJFsfpEgK3Lr/z3MHNYgU1KRhR1N55mIB4UMHLrQrKHmqq4PRcinmK5BZCvn2yRC3H
 OxPAyW3dxhFkA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 696FF37814A3;
 Mon, 18 Dec 2023 11:43:53 +0000 (UTC)
Message-ID: <b65393f1-1c36-40e5-96f6-1e7f978cc185@collabora.com>
Date: Mon, 18 Dec 2023 13:43:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-7-cristian.ciocaltea@collabora.com>
 <f8f9d454-6155-4b1c-b4b2-daf98267be14@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <f8f9d454-6155-4b1c-b4b2-daf98267be14@lunn.ch>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Michael Turquette <mturquette@baylibre.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-clk@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 6/9] riscv: dts: starfive:
 visionfive-v1: Setup ethernet phy
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

On 12/17/23 19:55, Andrew Lunn wrote:
> On Fri, Dec 15, 2023 at 10:40:45PM +0200, Cristian Ciocaltea wrote:
>> The StarFive VisionFive V1 SBC uses a Motorcomm YT8521 PHY supporting
>> RGMII-ID, but requires manual adjustment of the RX internal delay to
>> work properly.
>>
>> The default RX delay provided by the driver is 1.95 ns, which proves to
>> be too high. Applying a 50% reduction seems to mitigate the issue.
>>
>> Also note this adjustment is not necessary on BeagleV Starlight SBC,
>> which uses a Microchip PHY.  Hence, there is no indication of a
>> miss-behaviour on the GMAC side, but most likely the issue stems from
>> the Motorcomm PHY.
> 
> I suggest you make a similar comment in the .dts file, just to explain
> the odd setting.

Sure, will do, we need a v4 anyway.

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
