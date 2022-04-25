Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC250E98E
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 21:35:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09D89C60462;
	Mon, 25 Apr 2022 19:35:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F119C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 19:35:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5A17883B2F;
 Mon, 25 Apr 2022 21:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650915315;
 bh=FsZzdOsTx0wA9ngioPmnOF9El9tJsq70UI32iV/2VXU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sBsXJ88X5iuiGoySi565D7ly4Q7lCcbnwUGgDkCE5k1JCrpc9r+7wPCUXHUrPfw2k
 BJSgL6Hyib7axRTZlS2GdN/S3GzTcPdc/idG62EKbWHb5HTiubwXqyEHrEvxFVc8G6
 rdiv/jRW2oU06M9nR5JNODNYpG38Ga0Guwk/8GbfY68OPugdR9xabNgFOdvmQCnaFW
 Ao9s7pKy5jpoG58+rVARny6ZtMqdhg8qHsHfIQUDmbhmXQvBz7cSmJfiUhHo1bgL8a
 xK4hi3B4Pjqbo+uPXOHkPBdtBSjaa6J//HoZtY1OguVgxCbC4fzPtoex1HMzvyIT6X
 +zksEbCtiLjJQ==
Message-ID: <a6fa8050-1860-fffb-e7eb-6603d2e0eec4@denx.de>
Date: Mon, 25 Apr 2022 21:35:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
 <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
 <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] dt-bindings: clock: stm32mp1:
 describes clocks if "st, stm32mp1-rcc-secure"
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

On 4/25/22 21:11, Rob Herring wrote:
> On Fri, Apr 22, 2022 at 06:31:25PM +0200, Marek Vasut wrote:
>> On 4/22/22 17:09, Alexandre Torgue wrote:
>>> In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
>>> security support hardened), "clocks" and "clock-names" describe oscillators
>>> and are required.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>>> index 7a251264582d..bb0e0b92e907 100644
>>> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
>>> @@ -58,14 +58,8 @@ properties:
>>>              - st,stm32mp1-rcc-secure
>>>              - st,stm32mp1-rcc
>>>          - const: syscon
>>> -
>>> -  clocks:
>>> -    description:
>>> -      Specifies the external RX clock for ethernet MAC.
>>> -    maxItems: 1
>>> -
>>> -  clock-names:
>>> -    const: ETH_RX_CLK/ETH_REF_CLK
>>> +  clocks: true
>>> +  clock-names: true
>>
>> It looks like this should rather be a property than a compatible string --
>> the compatible string is used by the OS to determine which hardware is
>> represented by a node, but here it is the same hardware in either case,
>> "st,stm32mp1-rcc" and "st,stm32mp1-rcc-secure", it is still the same
>> STM32MP1 RCC block, just configured differently by some bootloader stage.
>>
>> So why not just add one-liner property of the RCC block like ?
>> st,rcc-in-secure-configuration
> 
> Because using compatible was already decided.

I see ... may I ask why compatible is OK in this case even though this 
is encoding a policy (secure/non-secure configuration of the same clock 
IP) into DT ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
