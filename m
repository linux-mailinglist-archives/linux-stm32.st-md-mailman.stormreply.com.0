Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E49AEB5FE
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jun 2025 13:10:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8226AC30883;
	Fri, 27 Jun 2025 11:10:27 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61CBAC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jun 2025 11:10:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4DC4DA52D68;
 Fri, 27 Jun 2025 11:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02D5C4CEE3;
 Fri, 27 Jun 2025 11:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751022625;
 bh=mGMGfBohkZ1WPzOd7l0m/Nelbywkij2anI7hHz+8Wtg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IIMwd5afvL0J/BPxLK6qEbVvjUxRT5d3rknTaZM9WrdHd8lyYqOmr4faeVqoQbv9A
 zFLWXY6pifR+dc3jVcynzhPcSoqUw/bjuLO16NQMRL3IbMXoeQFD3wAc1unC/B2xRo
 fXZN/irWwTW4V69YlaOZCyDJrw75cGKi3a1hUee3+MvzPxU4BbBK8iN0F5j/6AW8QM
 Lzbli/VLSYDfFxzNXv0wsScHhUGDO7ytjshn+VJc+8XTqxPbf8rwhoyhBfSu2jT6qg
 Xaba5+y0sfXJINzM+ZuwAghARcnWnqWFCpAsRNf2aNw0spdKADrCkN4NJ+TcUlwM+X
 DHxNNlgHHTpHw==
Message-ID: <7dd6cb50-78bc-4d44-afc1-9e0fb99a5e49@kernel.org>
Date: Fri, 27 Jun 2025 06:10:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Gerlach <matthew.gerlach@altera.com>, Rob Herring <robh@kernel.org>
References: <20250613225844.43148-1-matthew.gerlach@altera.com>
 <20250626234816.GB1398428-robh@kernel.org>
 <fe705ffc-9a4c-462c-a1bf-e14c55cdb2cd@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <fe705ffc-9a4c-462c-a1bf-e14c55cdb2cd@altera.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Mun Yew Tham <mun.yew.tham@altera.com>, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6] dt-bindings: net: Convert
 socfpga-dwmac bindings to yaml
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

On 6/26/25 20:40, Matthew Gerlach wrote:
> 
> 
> On 6/26/25 4:48 PM, Rob Herring wrote:
>> On Fri, Jun 13, 2025 at 03:58:44PM -0700, Matthew Gerlach wrote:
>> > Convert the bindings for socfpga-dwmac to yaml. Since the original
>> > text contained descriptions for two separate nodes, two separate
>> > yaml files were created.
>>
>> Sigh I just reviewed a conversion from Dinh:
>>
>> https://lore.kernel.org/all/20250624191549.474686-1-dinguyen@kernel.org/
>>
>> I prefer this one as it has altr,gmii-to-sgmii-2.0.yaml, but I see some
>> issues compared to Dinh's.

Apologies for the duplicate review. I was planning to convert the dwmac 
first then add on to the gmii. We should continue with Matthew's version.

> I am sorry for my part in the duplicate review. I just rechecked the 
> output of get_maintainers.pl, and Dinh was not listed, and I should have 
> known better.
> 
> I am happy to do the work to resolve the differences and resubmit with 
> Dinh as the maintainer.
> 

I'm not the maintainer of this. Maxime Chevalier is. Please don't add me.

Dinh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
