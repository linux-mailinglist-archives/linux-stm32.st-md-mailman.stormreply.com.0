Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D928A5FF1F1
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 18:02:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 936E0C65040;
	Fri, 14 Oct 2022 16:02:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CA24C6411E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 16:02:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A66A884EAE;
 Fri, 14 Oct 2022 18:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665763354;
 bh=4QZY273rix2KU23137Kv6VjVkJSrnJrmjDRIoYoYYMI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hWNVIJPGsrCRwR0WpFHKNKj1NHtk5ccMqxWWiNRrgKXUT/Z5ZlpAEbvPP8h/uU+rZ
 xS+gpESJycu/qQScIi6lakYTAxOwiKfVeRl/idv+TDqFluSVhufczlWLZCaPdmFJ2/
 nM5TowIHkdvQpHyhQjDtdU/16nyR53JfEFGWT5FBAQYVXaUi7TVmjmvzynf4xsxrOG
 cVr5zY1cUbaK1BVYFbbhuM0WQ5rOBkNgeWg8yAf4ajII6pUb3ecdY1jR4GsLgb+h+D
 Bn0Nnfr/MdwQyVYMX5qCGUDXTGb/v4pAnTc8TNb6QfcsxHQuLnkXG2vIhbW3ZheVbw
 2Wqt27xGUaD+g==
Message-ID: <09cb3000-14c4-e94f-70e8-36e0ef8ce3fc@denx.de>
Date: Fri, 14 Oct 2022 18:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20221013221242.218808-1-marex@denx.de>
 <cc7289ac-b75a-62e3-4b58-fc018715c068@linaro.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <cc7289ac-b75a-62e3-4b58-fc018715c068@linaro.org>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: mmc: arm,
 pl18x: Document interrupt-names is ignored
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

On 10/14/22 18:01, Krzysztof Kozlowski wrote:
> On 13/10/2022 18:12, Marek Vasut wrote:
>> Due to inconsistency of existing DTs regarding the content of this IP
>> interrupt-names DT property, document this such that interrupt-names
>> is not used by this IP bindings.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Andy Gross <agross@kernel.org>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>> Cc: Yann Gautier <yann.gautier@foss.st.com>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-mmc@vger.kernel.org
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> To: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: Add deprecated:false to interrupts: description
>> ---
>>   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> index 1e69a5a42439b..1c96da04f0e53 100644
>> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> @@ -95,7 +95,9 @@ properties:
>>         PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>>         emptied as part of a bulk read from the card. Some variants have these
>>         two interrupts wired into the same line (logic OR) and in that case
>> -      only one interrupt may be provided.
>> +      only one interrupt may be provided. The interrupt-names property is
>> +      not used due to inconsistency of existing DTs regarding its content.
>> +    deprecated: false
> 
> Why do you add deprecated false? All properties are not deprecated by
> default. Did any other referenced schema make it deprecated?

Rob asked me to add it in V1 .
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
