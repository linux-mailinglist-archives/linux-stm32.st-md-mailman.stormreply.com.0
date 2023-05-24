Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E670EBE0
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 05:31:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37A19C6A61D;
	Wed, 24 May 2023 03:31:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F8B7C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 03:31:02 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 51C26847E3;
 Wed, 24 May 2023 05:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684899061;
 bh=63+BwPSimon4MRS/P8dtWFgnB/TQmzkO6B/o7+8B5iI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LlJBDabmzGbXUm8K+eGUh9uBimKiz1PbmqvjbiqXaWgc0G8w5/J1GeGuPXCjRCiEM
 14JK+c9NPA+AQP1lC4Ex+orbpi/sSHlHi4CrYuE7nMP1mfUgEoKqq2Y+DilTKf+0Jg
 KrDukPUrI8VubMZg5VA9LpHKYK/rBW4JQUW+AK5QXSH4TJuuceTuZcl8uH90JMAbrm
 f7PiUabBNu/0Pj92CPW4oSsRLvCB11HrvXwGnZP/SGmQPx28oQayY79SPuFC2dRi2K
 TdSKlAa7SclQvRHtuMaJGk1nW+sZArxxWlzapq+yyrirg0Qsp0kpUge7SQDoqca0Tq
 t1ICDGVXJ1Z5w==
Message-ID: <2ff8d48f-c069-6ece-7865-4268296618fd@denx.de>
Date: Wed, 24 May 2023 05:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
References: <20230517152513.27922-1-marex@denx.de>
 <1ad00eb9-7bcb-b93a-191e-7673c835c31e@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1ad00eb9-7bcb-b93a-191e-7673c835c31e@linaro.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: nvmem: syscon: Add
 syscon backed nvmem bindings
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

On 5/18/23 16:30, Krzysztof Kozlowski wrote:
> On 17/05/2023 17:25, Marek Vasut wrote:
>> Add trivial bindings for driver which permits exposing syscon backed
>> register to userspace. This is useful e.g. to expose U-Boot boot
>> counter on various platforms where the boot counter is stored in
>> random volatile register, like STM32MP15xx TAMP_BKPxR register.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
> 
> Let me also leave a note here - cross linking for all parties:
> 
> Please propose a solution solving also mediatek,boottrap, probably
> extendable to range of registers. Other solution is what Rob mentioned -
> this might not be suitable for generic binding and device.

 From what I can tell, shouldn't the mediatek 1g MAC driver have a 
nvmem-cells phandle to this OTP/fuses/whatever area and shouldn't the 
driver read out and decode its settings within the kernel ?

That doesn't seem really related to this particular issue I'm trying to 
solve I'm afraid.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
