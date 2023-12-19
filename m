Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB05818883
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 14:21:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01DD4C6B461;
	Tue, 19 Dec 2023 13:21:02 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B606CC6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 13:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702992060;
 bh=TsO3xC5LiEC2Q1rDd6j5HFyylembdHw/NQAvbMXny7I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=1wTMgGGDN41nxiK38PIzsZRseLY07AikSD3kZrb6PZ/3ByZMDE7oCm8FOQWDXzzFD
 ym4/CBeHqaC2rghNXq8jIxH5xOeU2qE3gXG8fQoQPo8Lb6cy/mHXSIDQp41qpMLEWK
 EI6d1quKbBpZCn8o4BaTxt8nmkSCmPgueu7RmSk/IDBQl2PEMAB58kYAObV3Ng1oyT
 nzaIHtWLIKRUZVA2BWM/XL91BQ9ZUl824xjvkjFDZME9LagsP8wkrWOlSDwPWWielV
 cVmXBkCGeo1OAX1vfUxbC90Cv6/ref42de0inLmjCDs0RtMkow7xpCvtrNlAPPsjbM
 lOkKmBOzqlhng==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5AB9F378145A;
 Tue, 19 Dec 2023 13:20:58 +0000 (UTC)
Message-ID: <0451e5a9-0cfb-42a5-b74b-2012e2c0d326@collabora.com>
Date: Tue, 19 Dec 2023 15:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20231218214451.2345691-1-cristian.ciocaltea@collabora.com>
 <a37d2df9-e593-476f-bfef-d9abaf063daa@lunn.ch>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <a37d2df9-e593-476f-bfef-d9abaf063daa@lunn.ch>
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

On 12/19/23 11:03, Andrew Lunn wrote:
> On Mon, Dec 18, 2023 at 11:44:40PM +0200, Cristian Ciocaltea wrote:
>> This patch series adds ethernet support for the StarFive JH7100 SoC and makes it
>> available for the StarFive VisionFive V1 and BeagleV Starlight boards, although
>> I could only validate on the former SBC.  Thank you Emil and Geert for helping
>> with tests on BeagleV!
> 
> You will need to split this into patch sets per subsystem. The changes
> to the stmmac driver can then go via netdev, and the rest via each
> subsystem maintainer. It should then all meet in linux-next and work
> there.

Thanks for the reviews and your support to get those networking issues
properly handled!

Just to confirm the split will be done correctly, I'm going to keep just
the bindings and dts patches in v5, while the networking driver and
clock related patches will be submitted as part of two additional sets.

Regards,
Cristian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
