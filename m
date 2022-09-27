Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C767A5ECCBF
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 21:18:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B55C640F1;
	Tue, 27 Sep 2022 19:18:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C18A0C640E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 19:18:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E6F1A8484A;
 Tue, 27 Sep 2022 21:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1664306302;
 bh=GFpQwFEx3noZVoS5mRJOXFzgRizwUIEKjcVMTs2bkIE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UFBn+o5paRCzQKy0pNoXs+Fz5zCpMY7ZseNrLXQ7XvxncKHpzHTi9wVnqfsDPPpEM
 iiLBQINqVMpBxuTtlyjy+9qLm8tHPkwxumXcAgVAfTru2Ab15hbDUeoJhR/wBT2TeE
 6F6aFh0tH/EvRi8UB6WpOrCosk5yuKhq7kXE4HXzChVWs4uonBx8ox62UW1DNwLtQE
 ezN06zipi06UbQUJzXByx5/kCSVimF0C3anPUXuoS7KGyK6/3P8HVD6dkrxnztus3I
 gvgAjnPcZM29gbLhAvgeUkoEAYepongMzWaeX9+xEmDZv+cY8sh/XnBqcb8UH+BWlU
 tBKTDfCAda6PA==
Message-ID: <cdda3cb1-5772-88f7-aafc-d4ecf51fd050@denx.de>
Date: Tue, 27 Sep 2022 21:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20220927104138.5924-1-marex@denx.de>
 <CACRpkdaA=3QU+_HQkK6RSe4qQJ28O4BbtT6jHuKeVjKqaqLJaQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdaA=3QU+_HQkK6RSe4qQJ28O4BbtT6jHuKeVjKqaqLJaQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mmc: arm,
 pl18x: Document interrupt-names property
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

On 9/27/22 14:18, Linus Walleij wrote:
> On Tue, Sep 27, 2022 at 12:41 PM Marek Vasut <marex@denx.de> wrote:
> 
>> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> @@ -99,6 +99,9 @@ properties:
>>       minItems: 1
>>       maxItems: 2
>>
>> +  interrupt-names:
>> +    const: cmd_irq
> 
> This hardware come in variants with one or two IRQs.
> 
> Either two: "cmd_irq", "data_irq"
> 
> Or one combined IRQ (logic OR between those two!)
> I don't know what that should be called, perhaps
> "cmd_data_irq".
> 
> Since all DTS:es then have to be patched an alternative
> is as Arnd says to just delete the names. We should however
> at the very least patch the bindings description: for the IRQs
> to make the above situation clear.

Done, bindings updated and stm32/qcom DTs cleaned up.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
