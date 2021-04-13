Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2F35DE3C
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 14:05:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 791A3C57B78;
	Tue, 13 Apr 2021 12:05:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8C00C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 12:05:15 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DEBA281A04;
 Tue, 13 Apr 2021 14:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618315514;
 bh=1cx7IY1niXydXktkCXAsPUmSNShSji22fkH1N/eoSfY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=cNs09aDP0xo4Kjn2mQ15olg6nAOvl59ycxnQg5bG9ETzyEfkiQd4m/G1ujp8hiBSr
 tqZInlfSRqFME734Pjf+CCR0CnU3BK2289+ygxvWJCbkc6UKLWiFpwcTrx7wPKsj5m
 uygL5ziQjKCvl/yyh1Ra+HUtGGqDS7CV97ODF74rOGXgvtoGntZk3yXfWLkS7Y2hFj
 A8YZFC9u14oRK8KPdxw1waWTt4DA3AkYNHo2BloCO8AqOik5AvAZ1LID5+sxWvjQ2/
 uCG4OLqQrolT0r6V3R+tLNXBDit/h9PgT4127tIi3qmX16XTqAXSb7e55SX6ml1l39
 lUBwOV6QR0Ksg==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20210408185731.135511-1-marex@denx.de>
 <b81d6a69-713f-eda7-0837-d6e80d691c6a@foss.st.com>
 <2c410c1b-2a1d-b291-a128-c5d5979be1ef@denx.de>
 <340d32f1-3afb-2159-fa94-70a45aecd88c@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5a7ac087-4506-df7f-e692-c663d7b61703@denx.de>
Date: Tue, 13 Apr 2021 14:05:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <340d32f1-3afb-2159-fa94-70a45aecd88c@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 0/7] ARM: dts: stm32: clk: Switch ETHRX
 clock parent from ETHCK_K to MCO2 on DHCOM SoM
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

On 4/13/21 9:48 AM, Alexandre TORGUE wrote:
> Hi Marek

Hello Alexandre,

> On 4/12/21 8:44 PM, Marek Vasut wrote:
>> On 4/12/21 10:09 AM, Alexandre TORGUE wrote:
>>> Hi Marek
>>
>> Hello Alex,
>>
>> [...]
>>
>>>> All the above still only discusses the clock part of the problem. 
>>>> Even if
>>>> the clock cyclic dependencies could be solved, it would be necessary to
>>>> resolve legacy dwmac st,eth-clk-sel and st,eth-ref-clk-sel DT 
>>>> properties
>>>> and avoid DT ABI break.
>>>
>>> Thanks for those clear explanations and for this series. As 
>>> discussed, this approach looks good to me as it doesn't break our 
>>> current strategy for dwmac clock integration. I don't know if those 
>>> cyclic redundancies will be fixed one day but we can have a look on 
>>> dwmac DT properties (the gain to change them, the effort to keep the 
>>> backward compatibility, code readability, ...).
>>>
>>> Your DT patches looks good. I'll merge them soon.
>> +CC Stephen ; the DT patches depend on the clock driver changes. Would 
>> it make sense to pick the clock patches through the same tree or how 
>> should that be handled ?
> 
> In this situation, I prefer to wait that Stephen takes clock patches in 
> his tree. Then I'll take DT ones in mine. (I assume that taking only 
> clock patches will not break mp1 boot or Ethernet usage).

That's fine by me, thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
