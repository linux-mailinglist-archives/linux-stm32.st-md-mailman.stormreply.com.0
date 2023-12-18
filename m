Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F4E816CD5
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 12:48:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF7BAC6DD70;
	Mon, 18 Dec 2023 11:48:25 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F419EC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702900104;
 bh=cGR57+CiG5a+3zirrKt+CQiAa44aj9FUBj5+rhcA9VM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QZ+3xWuH+hzguRihJ5wfmGV6IBQ4oy3RSHlbf/lRB2c+dNBkK6gAFqaUQ6BHgsYTP
 B71E+s4hEd5cGoywoTQOe1kbaeb2ZZuJRNEKc7xVtBI27NWEjkyIprI5ph/sYpBynk
 56SgJde7fgS+77iBGFoeFNn7K5bG3pw6727TJnyesSfgPpImLp45fRHI5h4eRxU/zG
 F6znNG4DSGdyhKHM9Wol9Wj3ctEOWFnE/hDUofqYmpfQZzBPAc2CgfOhUgo5hgl4nV
 RdaygF1EqXYMma/47DjheC66X6nCo4j7osbBxylPw3DRkgwlk6LH5UVhMd1Ip2MxKc
 st6Q66gdTlKSA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1609037814A3;
 Mon, 18 Dec 2023 11:48:22 +0000 (UTC)
Message-ID: <11f7fbee-4795-4d5f-a5f8-901bc17683eb@collabora.com>
Date: Mon, 18 Dec 2023 13:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-6-cristian.ciocaltea@collabora.com>
 <CAJM55Z-bg0EGPaLHtxcu2AzqN59zfuiT0eE7oCShrx7dG_QK1g@mail.gmail.com>
 <20231217-rippling-galleria-904152e41f95@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20231217-rippling-galleria-904152e41f95@spud>
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
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v3 5/9] riscv: dts: starfive:
 jh7100-common: Setup pinmux and enable gmac
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

On 12/17/23 23:03, Conor Dooley wrote:
> On Sat, Dec 16, 2023 at 11:38:53AM -0800, Emil Renner Berthing wrote:
>> Cristian Ciocaltea wrote:
>>> Add pinmux configuration for DWMAC found on the JH7100 based boards and
>>> enable the related DT node, providing a basic PHY configuration.
>>>
>>> Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>>  .../boot/dts/starfive/jh7100-common.dtsi      | 85 +++++++++++++++++++
>>>  1 file changed, 85 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>>> index 42fb61c36068..5cafe8f5c2e7 100644
>>> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>>> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
>>> @@ -72,7 +72,92 @@ wifi_pwrseq: wifi-pwrseq {
>>>  	};
>>>  };
>>>
>>> +&gmac {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&gmac_pins>;
>>> +	phy-mode = "rgmii-id";
>>> +	phy-handle = <&phy>;
>>
>> I'm not sure if it's a generic policy or not, but I don't really like adding a
>> reference to a non-existant node here. I'd move this property to the board
>> files where the phy node is actually defined.
> 
> FWIW, I don't like the reference-in-the-wrong-place thing either.

Yeah, as I already mentioned this was unintentional, will fix in v4.

Thanks,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
