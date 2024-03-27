Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF288DA28
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Mar 2024 10:22:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D97FBC6B46B;
	Wed, 27 Mar 2024 09:22:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA80AC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Mar 2024 09:22:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 243A52F4;
 Wed, 27 Mar 2024 02:23:13 -0700 (PDT)
Received: from [10.57.81.167] (unknown [10.57.81.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF5C3F7C5;
 Wed, 27 Mar 2024 02:22:35 -0700 (PDT)
Message-ID: <d8fa8e1a-b2ce-4d91-9ab5-ad1b160111c6@arm.com>
Date: Wed, 27 Mar 2024 09:22:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <3f61d6d3-a0d6-4c49-b094-6ba62d09ab14@arm.com>
 <f23f2e60-e5c0-4c3c-9722-dba63a6e7ef6@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f23f2e60-e5c0-4c3c-9722-dba63a6e7ef6@linaro.org>
Cc: kvm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
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

On 27/03/2024 05:57, Krzysztof Kozlowski wrote:
> On 27/03/2024 00:24, Suzuki K Poulose wrote:
>> Hi Krzysztof
>>
>> On 26/03/2024 20:23, Krzysztof Kozlowski wrote:
>>> Merging
>>> =======
>>> All further patches depend on the first amba patch, therefore please ack
>>> and this should go via one tree.
>>
>> Are you able to provide a stable branch with these patches once you pull
> 
> I doubt I will be merging this. I think amba code goes through Russell.
> 
>> them in to "one tree" here ? We have changes coming up in the coresight
>> tree, which would conflict with the changes here (horribly).
>>
> 
> You mean conflict with  coresight conversion to platform driver? Worst

Yes.

> case it is solveable: just drop .owner.

Or, we could merge the CoreSight changes (as they are really not
affected by the problem this series is trying to address) after the
base changes land in AMBA, via the CoreSight tree.


Suzuki

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
