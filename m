Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B16977F3
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1FAAC6B442;
	Wed, 15 Feb 2023 08:18:49 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93964C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 17:58:22 +0000 (UTC)
Received: from [192.168.1.90] (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7A0E866020A4;
 Tue, 14 Feb 2023 17:58:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676397501;
 bh=Y4hHrvH1B5sqY1by0xSyqs58y8vsVlrsUYCjBXVOzgQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rgmm1hRkkv36vX6S4kwZIjU9y/lgmTGeV1Ia4edMQzQc5k1JaZ8iGWswYiuLBwi9Q
 2uK87DtWhOESGqcYttatohf6TdFHjHCqmroabZKzcKSZZjXHXeIVL7gpG0KEEUN0kp
 RtFBlMdQYBo434oxLBE1oz9KusXyFiOHVzBJXqc9lVWBYGJrsh28lgG6PdFHhbzej+
 d8ILeq6tvjsKxNTqduLQD83xIa6iQQr/O3N3oobNAqdQJl9hrjQuSfCj2kDCnClnaH
 YRt2b1788WywrxWnTLmmsJ8ZIK+ImFPwx+8FUQwuNyvJMaM1FrR9iAB6rfnpusp7NT
 DFVnRoNAD2Mww==
Message-ID: <bed5244c-fcb5-1f95-9ff8-81c3a96ecff9@collabora.com>
Date: Tue, 14 Feb 2023 19:58:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
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
 <20230211031821.976408-3-cristian.ciocaltea@collabora.com>
 <c895f199-2902-4c22-2453-829d946a8d11@linaro.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <c895f199-2902-4c22-2453-829d946a8d11@linaro.org>
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 02/12] dt-bindings: riscv: sifive-ccache:
 Add 'uncached-offset' property
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

On 2/13/23 11:23, Krzysztof Kozlowski wrote:
> On 11/02/2023 04:18, Cristian Ciocaltea wrote:
>> Add the 'uncached-offset' property to be used for specifying the
>> uncached memory offset required for handling non-coherent DMA
>> transactions.
> 
> Only one offset can be non-coherent? If this is for DMA, why
> dma-noncoherent cannot be used?

As Conor already mentioned in [1], the handling of non-coherent DMA on 
RISC-V is currently being worked on, so I expect this patch will be dropped.

[1] https://lore.kernel.org/lkml/Y+d36nz0xdfXmDI1@spud/

Thanks for reviewing,
Cristian

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
