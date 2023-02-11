Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F46977F1
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 726E6C6B454;
	Wed, 15 Feb 2023 08:18:44 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF687C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 11:53:50 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A68AF6602111;
 Sat, 11 Feb 2023 11:53:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676116430;
 bh=pg4cvypY8FQKYrpV9fWDZ348Gx/msla9+ReQno8Gwf4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TTpyL64WvTvjHDWR4s8teHDz+yxz7/0DnZ/kaLk9N9qvglrWYAPmktHIo44GAPyYM
 IS9aG4ozuS/c/j0GYEnQJzRRzOVQsEiyCw66j/flJaAQYmU64KNuqMlM62Hbm9Uw79
 tnHmsoTqFX7G8pwinGvFonBYPwbdcSXEy/ltMvBSgB1YnBCqiCRHWmF74eUoYnsHCQ
 S+BLhNB6xh17yQCRVtx3QPWslvxpr+CgZY5h2yYIpwBwZb+jKza/QvCZGdvw7JrNG6
 JP7mobsbJLD0IOfQw/t1JxgzAufgSsgFgdPQw3HtAw1NtL5igpApMWPUS9qKUnuw4H
 8IVCYNKbkvfDQ==
Message-ID: <b5fa8148-1dc6-b8a7-2f5d-95f0354197e6@collabora.com>
Date: Sat, 11 Feb 2023 13:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <Y+d36nz0xdfXmDI1@spud>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <Y+d36nz0xdfXmDI1@spud>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, arnd@arndb.de,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 prabhakar.csengg@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 00/12] Enable networking support for
	StarFive JH7100 SoC
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

Hi Conor,

On 2/11/23 13:11, Conor Dooley wrote:
> Hey Cristian!
> 
> +CC Arnd, Prabhakar
> 
> On Sat, Feb 11, 2023 at 05:18:09AM +0200, Cristian Ciocaltea wrote:
>> This patch series adds ethernet support for the StarFive JH7100 SoC and
>> makes it available for the StarFive VisionFive V1 and BeagleV Starlight
>> boards, although I could only validate on the former SBC.
>>
>> The work is heavily based on the reference implementation [1] and requires
>> the non-coherent DMA support provided by Emil via the Sifive Composable
>> Cache controller.
>>
>> Also note there is an overlap in "[PATCH 08/12] net: stmmac: Add glue layer
>> for StarFive JH7100 SoC" with the Yanhong Wang's upstreaming attempt [2]:
>> "[PATCH v4 5/7] net: stmmac: Add glue layer for StarFive JH7110 SoCs".
>>
>> Since I cannot test the JH7110 SoC, I dropped the support for it from Emil's
>> variant of the stmmac glue layer. Hence, we might need a bit of coordination
>> in order to get this properly merged.
> 
> To be honest, that one is the least of your worries sequencing wise.
> Anything doing non-coherent DMA on RISC-V that doesn't use instructions is
> dependant on Prabhakar's series:
> https://lore.kernel.org/linux-riscv/20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com/#t
> That's kinda stalled out though, waiting on Arnd to make some changes to
> the cross-arch DMA code:
> https://lore.kernel.org/linux-riscv/ea4cb121-97e9-4365-861a-b3635fd34721@app.fastmail.com/

Thank you for pointing this out, I wasn't aware of it!

> I was talking to Emil about the non-coherent support at FOSDEM actually,
> and I see no real reason not to bring the JH7100 non-coherent support in
> if we are doing it for other SoCs.
> 
> So yeah, hopefully we shall get there at some point soonTM...

That would be great, I'll try to monitor the progress and re-spin the 
series as soon as the non-coherent support is figured out.

Regards,
Cristian

> Sorry,
> Conor.

>> [1] https://github.com/starfive-tech/linux/commits/visionfive
>> [2] https://lore.kernel.org/linux-riscv/20230118061701.30047-6-yanhong.wang@starfivetech.com/
>>
>> Cristian Ciocaltea (7):
>>    dt-bindings: riscv: sifive-ccache: Add compatible for StarFive JH7100
>>      SoC
>>    dt-bindings: riscv: sifive-ccache: Add 'uncached-offset' property
>>    dt-bindings: net: Add StarFive JH7100 SoC
>>    riscv: dts: starfive: Add dma-noncoherent for JH7100 SoC
>>    riscv: dts: starfive: jh7100: Add ccache DT node
>>    riscv: dts: starfive: jh7100: Add sysmain and gmac DT nodes
>>    riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
>>
>> Emil Renner Berthing (5):
>>    soc: sifive: ccache: Add StarFive JH7100 support
>>    soc: sifive: ccache: Add non-coherent DMA handling
>>    riscv: Implement non-coherent DMA support via SiFive cache flushing
>>    dt-bindings: mfd: syscon: Add StarFive JH7100 sysmain compatible
>>    net: stmmac: Add glue layer for StarFive JH7100 SoC
>>
>>   .../devicetree/bindings/mfd/syscon.yaml       |   1 +
>>   .../devicetree/bindings/net/snps,dwmac.yaml   |  15 +-
>>   .../bindings/net/starfive,jh7100-dwmac.yaml   | 106 ++++++++++++
>>   .../bindings/riscv/sifive,ccache0.yaml        |  33 +++-
>>   MAINTAINERS                                   |   6 +
>>   arch/riscv/Kconfig                            |   6 +-
>>   .../boot/dts/starfive/jh7100-common.dtsi      |  78 +++++++++
>>   arch/riscv/boot/dts/starfive/jh7100.dtsi      |  55 +++++++
>>   arch/riscv/mm/dma-noncoherent.c               |  37 ++++-
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>   .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
>>   drivers/soc/sifive/Kconfig                    |   1 +
>>   drivers/soc/sifive/sifive_ccache.c            |  71 +++++++-
>>   include/soc/sifive/sifive_ccache.h            |  21 +++
>>   15 files changed, 587 insertions(+), 11 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>>
>> -- 
>> 2.39.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
