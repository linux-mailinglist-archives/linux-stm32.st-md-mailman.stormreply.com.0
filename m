Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5C49744C
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jan 2022 19:29:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D40C4C5EC76;
	Sun, 23 Jan 2022 18:29:55 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24175C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 18:29:54 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l16so14111196pjl.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jan 2022 10:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oUc8la+19Vm3AyI8hVo2ckW6JXVAW8jvTMpivK53mfg=;
 b=Lb/Okjcs+U3vy7lYzUrFKd1EjDyv15UWcH5nP5ASmiTlbzquvoWme5BIU/aw73MnpE
 vA2dzDLGRBd4pkJXZV+3EBTOSwGfFkd3rog6w2tXNnWDRe54DU8bgmsVtJsLiroWmmdF
 uGf+Tlo0EGIjT2A0TpHDitc7/4aF0C7toql/MAB/E49TxgnpFxyckz7/0y4wt1dHt1SG
 sl3jHGE2jRfQ1vxh9IZ9loLpIyri+2fODY6THk9H4JUIAlLVObGPBF30quJX2ewXVLB9
 q6ZSmDegCjM0/hGHWqNcAFbI8MlgacYftve99jeoilxPbrGqQ0CJwslEVxOzFXOmsPLP
 S2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oUc8la+19Vm3AyI8hVo2ckW6JXVAW8jvTMpivK53mfg=;
 b=AlJ+XAhckG4qAhpKj6bLl7gHPSsgcrdwrwSYCKahvdGHFLa6OWmx4kXB0Qe/YHLhWC
 67n7UQi639hlTe25V93zg04cRI/m4t9+TizRn8xuI1lUXXToAa+kgEF65bta4W/5c7/x
 fdsk0dqcECRiSnIVo1C+cZ1w6FuEQqMesqD/hgJs0odQYRdZIM2F0Q6GAYG5A/PtodIZ
 7XO2rDF33i2LYcfyaE87+rBWf8lBPGgTqtJgMxIM0QS9VNyrPkqLgpTa3pAC0mubr2YG
 STH4FQ4CG9PTdGB62nZ2YmOmCig4mfZzmFJnvySIhoydh41SeexXrbNbA6tw9I5f3Gzq
 nT/w==
X-Gm-Message-State: AOAM533gb2lCAt0hJB0PbHfdtjvnS8ZFsIIUXE3TwfzZ5CHeOza34LZd
 l5QwYcSeLY79ShMwiHOugFc=
X-Google-Smtp-Source: ABdhPJywcS0ZTC5dSc8g3QSaQjWYmMszBsB0svShK9xFetZo8xT2YvbDX6+XNJFQlvxdZV2Rmxbltw==
X-Received: by 2002:a17:902:8693:b0:148:a2e7:fb5a with SMTP id
 g19-20020a170902869300b00148a2e7fb5amr11649910plo.155.1642962592531; 
 Sun, 23 Jan 2022 10:29:52 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:4a48:5d89:db9e:1ac7:6fdc?
 ([2600:8802:b00:4a48:5d89:db9e:1ac7:6fdc])
 by smtp.gmail.com with ESMTPSA id g1sm13399612pfj.84.2022.01.23.10.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 10:29:51 -0800 (PST)
Message-ID: <22aac4ec-2a22-42ee-20ee-9e9d6097b9d9@gmail.com>
Date: Sun, 23 Jan 2022 10:29:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Joakim Zhang <qiangqing.zhang@nxp.com>
References: <20220123141245.1060-1-jszhang@kernel.org>
 <Ye15va7tFWMgKPEE@lunn.ch> <Ye19bHxcQ5Plx0v9@xhacker>
 <Ye19vpFWXR8wJQVH@xhacker>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <Ye19vpFWXR8wJQVH@xhacker>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: don't stop RXC during LPI
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



On 1/23/2022 8:09 AM, Jisheng Zhang wrote:
> On Mon, Jan 24, 2022 at 12:08:22AM +0800, Jisheng Zhang wrote:
>> On Sun, Jan 23, 2022 at 04:52:29PM +0100, Andrew Lunn wrote:
>>> On Sun, Jan 23, 2022 at 10:12:45PM +0800, Jisheng Zhang wrote:
>>>> I met can't receive rx pkt issue with below steps:
>>>> 0.plug in ethernet cable then boot normal and get ip from dhcp server
>>>> 1.quickly hotplug out then hotplug in the ethernet cable
>>>> 2.trigger the dhcp client to renew lease
>>>>
>>>> tcpdump shows that the request tx pkt is sent out successfully,
>>>> but the mac can't receive the rx pkt.
>>>>
>>>> The issue can easily be reproduced on platforms with PHY_POLL external
>>>> phy. If we don't allow the phy to stop the RXC during LPI, the issue
>>>> is gone. I think it's unsafe to stop the RXC during LPI because the mac
>>>> needs RXC clock to support RX logic.
>>>>
>>>> And the 2nd param clk_stop_enable of phy_init_eee() is a bool, so use
>>>> false instead of 0.
>>>>
>>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>>> ---
>>>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>>> index 6708ca2aa4f7..92a9b0b226b1 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>>> @@ -1162,7 +1162,7 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>>>>   
>>>>   	stmmac_mac_set(priv, priv->ioaddr, true);
>>>>   	if (phy && priv->dma_cap.eee) {
>>>> -		priv->eee_active = phy_init_eee(phy, 1) >= 0;
>>>> +		priv->eee_active = phy_init_eee(phy, false) >= 0;
>>>
>>> This has not caused issues in the past. So i'm wondering if this is
>>> somehow specific to your system? Does everybody else use a PHY which
>>> does not implement this bit? Does your synthesis of the stmmac have a
>>> different clock tree?
>>>
>>> By changing this value for every instance of the stmmac, you are
>>> potentially causing a power regression for stmmac implementations
>>> which don't need the clock. So we need a clear understanding, stopping
>>> the clock is wrong in general and so the change is correct in
>>
>> I think this is a common issue because the MAC needs phy's RXC for RX
>> logic. But it's better to let other stmmac users verify. The issue
>> can easily be reproduced on platforms with PHY_POLL external phy.
>> Or other platforms use a dedicated clock rather than clock from phy
>> for MAC's RX logic?
>>
>> If the issue turns out specific to my system, then I will send out
>> a new patch to adopt your suggestion.
>>
> 
> + Joakim
> 
>> Hi Joakim, IIRC, you have stmmac + external RTL8211F phy platform, but
>> I'm not sure whether your platform have an irq for the phy. could you
>> help me to check whether you can reproduce the issue on your platform?
>>
>>> general. Or this is specific to your system, and you probably need to
>>> add priv->dma_cap.keep_rx_clock_ticking, which you set in your glue
>>> driver,and use here to decide what to pass to phy_init_eee().

I suspect the problem is only or largely relevant in a RGMII 
configuration whereby the TXC of the MAC is an input to the PHY which 
then re-generates the RXC and feeds it back to the MAC as RXC (with the 
configured delay). If the PHY stops its clock, then MAC no longer gets a 
RXC and all sorts of problems would arise if the MAC logic on the RX 
side is dependent upon getting the PHY's RXC to be re-sampled internally 
within the MAC.

Now, this would be symptomatic of a fairly naive design on the MAC side 
to support EEE, also usually to really save power while in LPI you would 
want to switch your MAC from its main or fast clock (which is presumably 
at least 250MHz to support Gigabit rates and generate a 125MHz TXC) to a 
slow clock (say 25 or 27MHz) in order to actually save power on the MAC 
side (even if the bulk of the power is on the PHY's analog logic). When 
the PHY signals that we are out of LPI the MAC switches back to its main 
clock. This may occur with the help of the MAC driver, or this can be 
done autonomously sometimes.

So with all that theory and how should things be designed and so on, I 
think you need to investigate this problem a bit more thoroughly.

FWIW phy_init_eee()'s second argument is improperly designed. Before 
deciding to stop the PHY's RX clock, you should first know whether the 
PHY supports it to begin with, otherwise you are requesting something 
the is not able to do, and there is no feedback mechanism. A while back 
I had started this patch series which may still be relevant:

https://github.com/ffainelli/linux/commits/phy-eee-tx-clk
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
