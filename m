Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D52F6977F5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D250AC6B448;
	Wed, 15 Feb 2023 08:18:49 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58DB6C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 18:12:41 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 59EC86602174;
 Tue, 14 Feb 2023 18:12:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676398360;
 bh=0/EG0sklC8qUexXu0LYmfC2BO1OVBbV9Fcsg9x+88a4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m0/HxerAwjPWxchWbVHrWiidbzPuqSL30laX0/Fa8a6CXl8+IjtWG74Eml/d7BIJk
 dYi0I+FNt4t4GqhEcuAfI1Rqlb98CMZ+u2D179uTxp/UMogSEHpenrfYk2WwvYp5wS
 V0DX/gTadp9vSNI0LWsr6pcFZR4JNCli1X1Da6QuYboYAEcSyxGtsWV/xSgjCa2yEp
 Psph/A9m256McoWjzZ+sfoTNCnXcUyJ1wE/A+fqcC3YDNOQWdIuE+LlM0MikAV3Ocr
 bspbDLgNKxznYOi4F0o5HMbPJkTXGdCtBVwhddBy0kbHHv3lhIUh3dnh3U3Syzr6bE
 pvhOS/697MvLw==
Message-ID: <fcfc3ede-6799-4dc2-d390-148370dfc5c8@collabora.com>
Date: Tue, 14 Feb 2023 20:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <dbf26e3f-6a4f-cd15-c7d3-b0c1c482b83b@linaro.org>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <dbf26e3f-6a4f-cd15-c7d3-b0c1c482b83b@linaro.org>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/12] net: stmmac: Add glue layer for
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

On 2/13/23 11:26, Krzysztof Kozlowski wrote:
> On 11/02/2023 04:18, Cristian Ciocaltea wrote:
>> From: Emil Renner Berthing <kernel@esmil.dk>
>>
>> This adds a glue layer for the Synopsys DesignWare MAC IP core on the
>> StarFive JH7100 SoC.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> [drop references to JH7110, update JH7100 compatible string]
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   MAINTAINERS                                   |   1 +
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>   .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 155 ++++++++++++++++++
>>   4 files changed, 169 insertions(+)
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d48468b81b94..defedaff6041 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19820,6 +19820,7 @@ STARFIVE DWMAC GLUE LAYER
>>   M:	Emil Renner Berthing <kernel@esmil.dk>
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/net/starfive,jh7100-dwmac.yaml
>> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>>   
>>   STARFIVE JH7100 CLOCK DRIVERS
>>   M:	Emil Renner Berthing <kernel@esmil.dk>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> index f77511fe4e87..2c81aa594291 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> @@ -165,6 +165,18 @@ config DWMAC_SOCFPGA
>>   	  for the stmmac device driver. This driver is used for
>>   	  arria5 and cyclone5 FPGA SoCs.
>>   
>> +config DWMAC_STARFIVE
>> +	tristate "StarFive DWMAC support"
> 
> Bring only one driver.
> 
> https://lore.kernel.org/all/20230118061701.30047-6-yanhong.wang@starfivetech.com/

Already mentioned in the cover letter that we have this overlap (will be 
merged into a single driver).

Thanks,
Cristian

> 
> Best regards,
> Krzysztof
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
