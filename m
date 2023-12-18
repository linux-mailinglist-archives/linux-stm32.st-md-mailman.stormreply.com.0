Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A3817D7D
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 23:59:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA7C7C6DD72;
	Mon, 18 Dec 2023 22:59:17 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA68CC6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 22:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702940355;
 bh=XxSneoKB0phG9Xq6G4JnE0CG/YoBow6E1NyN18LLUPQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gHETnA5p/lEpjV9CbNjCMYnR6kNnu4AhRFm+FRwHlwQJUiOVe9xWbRVbwXW01J2pl
 rMEGm2Z/GC9xFC86vAB5MTbZdhgLkxTFfVB/O2IUILJSAPQP6sGKKl7lL88B0U7UBX
 l47X7qcjTFIB314tc8qdAPvwZ58EIPp4pklot+331Ffks575JS7Tqffs4obDe6ODrf
 oQxDUj11pP/nJnRD+XCFU5gs+SsPJMoe+HMSXCpmaSVYEL8ZxaVQeS2G6JRg7tNHC8
 eJ4ymoeS1+9gludH6j87/vXb4AczG5rpiHVHw9xqreYgslJvTvJvY8FY55NhnM6XNp
 tUfM53gKU7clA==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C1FB3781453;
 Mon, 18 Dec 2023 22:59:14 +0000 (UTC)
Message-ID: <426f4baf-4aa2-48a5-a4e3-2fa361c0bc4a@collabora.com>
Date: Tue, 19 Dec 2023 00:59:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jacob Keller <jacob.e.keller@intel.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
 <453e0abd-30a4-4abd-b5ae-63d9982ec1b8@intel.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <453e0abd-30a4-4abd-b5ae-63d9982ec1b8@intel.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/9] Enable networking support for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 12/19/23 00:53, Jacob Keller wrote:
> 
> 
> On 12/18/2023 1:44 PM, Cristian Ciocaltea wrote:
>> This patch series adds ethernet support for the StarFive JH7100 SoC and makes it
>> available for the StarFive VisionFive V1 and BeagleV Starlight boards, although
>> I could only validate on the former SBC.  Thank you Emil and Geert for helping
>> with tests on BeagleV!

[...]

> I'm not super familiar with how the various pieces fit together, so I'm
> not sure how valuable my read through is.. but I didn't see anything
> obviously wrong.
> 
> For the series:
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Thanks for the review,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
