Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440C5EC008
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 12:44:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D41D0C63326;
	Tue, 27 Sep 2022 10:44:53 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2188C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 10:44:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 125C96602265;
 Tue, 27 Sep 2022 11:44:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664275491;
 bh=ql4FTrakdy7CCJMp7yH+mwWBCOP+cR85Z8Ogp0SyhfQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YPYx0ZrExlZHMAFeo/WtOFIN8CcQcAPdKHAiMl1HxB5TXBC535cZvTs8W0xZmK7lF
 +/fdeD6qWM1p33efR/YpUjibMzM/k+mXVg953aKxQoHBf3ct9lB+bdNBnX8rkNaDBt
 pvJSrvGB21cdSfH3GXqwjlfKa16GfaGZ0vWXv9RKA9HAbodUKHphgiLLph2VDaHa4c
 NLufBwh57PaWEyCzJclqmsBDDpq3HIG9jJJ463q+whX3ILocQY9HucQGgeTT/tI8SI
 PQLcAyKBWa3BXTAou5taxGv4uNP7qbv2RhHaATsbjTM9gJ5XkxZ1fV/4/q6TB0UFS3
 nlwmyFZSQbVhg==
Message-ID: <888703a8-a8e5-e691-7a53-294f88ad7a4e@collabora.com>
Date: Tue, 27 Sep 2022 12:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
 <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
 <4f205f0d-420d-8f51-ad26-0c2475c0decd@linaro.org>
 <80c59c9462955037981a1eab6409ba69fc9b7c34.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <80c59c9462955037981a1eab6409ba69fc9b7c34.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] net: stmmac: Update the name of
	property 'clk_csr'
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

Il 27/09/22 10:44, Jianguo Zhang ha scritto:
> Dear Krzysztof,
> 	Thanks for your comment.
> 
> On Fri, 2022-09-23 at 20:15 +0200, Krzysztof Kozlowski wrote:
>> On 23/09/2022 20:14, Krzysztof Kozlowski wrote:
>>>> This is going to break MT2712e on old devicetrees.
>>>>
>>>> The right way of doing that is to check the return value of
>>>> of_property_read_u32()
>>>> for "snps,clk-csr": if the property is not found, fall back to
>>>> the old "clk_csr".
>>>
>>> I must admit - I don't care. That's the effect when submitter
>>> bypasses
>>> DT bindings review (81311c03ab4d ("net: ethernet: stmmac: add
>>> management
>>> of clk_csr property")).
>>>
>>> If anyone wants ABI, please document the properties.
>>>
>>> If out-of-tree users complain, please upstream your DTS or do not
>>> use
>>> undocumented features...
>>>
>>
>> OTOH, as Angelo pointed out, handling old and new properties is quite
>> easy to achieve, so... :)
>>
> So, the conclusion is as following:
> 
> 1. add new property 'snps,clk-csr' and document it in binding file.
> 2. parse new property 'snps,clk-csr' firstly, if failed, fall back to
> old property 'clk_csr' in driver.
> 
> Is my understanding correct?

Yes, please.

I think that bindings should also get a 'clk_csr' with deprecated: true,
but that's Krzysztof's call.

Regards,
Angelo

> 
>> Best regards,
>> Krzysztof
>>
> BRS
> Jianguo
> 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
