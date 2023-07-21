Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E475CCD5
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 17:59:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74B41C6B442;
	Fri, 21 Jul 2023 15:59:12 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24967C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 15:59:11 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1b89114266dso15914015ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 08:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689955149; x=1690559949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ouosyBPb4dn4HHlTnUJ4FSBNaoZUMLrSaPdnIDz9wuw=;
 b=Vk2fCFGEwoEdn2x2gzgjtS58Pwt9U01pViJ4ZQYCxi/eRmX4AkBspvWDAHWVmDk7xN
 n+2D8vXy2mZxQGdXrDv2lS+MrjZFIQcofY7Pwjw53TNZieLT5lObBGn5XVSRAVUv0ZTt
 Q7xAz/7IeqOMHlruhDE/8h2+agVavciZ9JWsBxClyOMn9k/1eQP+XGEXs+ux+ch4eZdL
 uubRSfULij8HcYuxURTHh3pZ5mjfXK6wVcDpXraubFagQEBcIulvXvb1ziBCjIJ60/4a
 gDW7X02wmc08mJbmEFpiGPGUqpBD0w+sUK6REF8VIs6Rq7y8Xi8guYUAK4Dg24xTGZ9X
 U2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689955149; x=1690559949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ouosyBPb4dn4HHlTnUJ4FSBNaoZUMLrSaPdnIDz9wuw=;
 b=N1lmguzwmTlDQGqOL4pD1J1sK4bYofSo1o8lRD3tY0XjGPTMBEk4EETittr89F4dkC
 lQxkCvMlMGsFstRWR1FZd2bGt3tyxVhrfIK90r0GFK0Epg5blD9H9JuQnYcYkz3Yre+A
 LsyPpuuFQkhStTIjE46IV1iRm1KXy3ywXMHsRR8wsWfuMkiwmSqev/3vAEYuq9WgXzgm
 rkuWEI0sK6ivVbFj7AR9hymLostzSYkPJL9lWqVHR379hQ22taAEnNIkzbbeMgZPbtVX
 WVCzWYRlb2kLcRSFc93URj7LjDZMdfE5xdKij+F8fnuoJQvg3TATO+onTYxbBKNVe6ot
 F8Kg==
X-Gm-Message-State: ABy/qLZGQkwmLjQ4TjiDFatP5zsi7JTnKXBd41gIzYZ5cUrOV3J+UJEA
 /CGbDJ+MgRbTNgdQOxwJVg8=
X-Google-Smtp-Source: APBJJlF3jZO0qcpAN4Y2IfbskrZlRgsTwwf5ilO35BnrANfcSEFNfCqrHVMg0flcOt/RvXSehhqNcg==
X-Received: by 2002:a17:903:181:b0:1b8:6cae:3570 with SMTP id
 z1-20020a170903018100b001b86cae3570mr2580302plg.11.1689955149561; 
 Fri, 21 Jul 2023 08:59:09 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170902e54d00b001b9be3b94d3sm3670309plf.140.2023.07.21.08.59.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jul 2023 08:59:08 -0700 (PDT)
Message-ID: <7549a014-4f5e-cf87-f07d-c4980ab44dc1@gmail.com>
Date: Fri, 21 Jul 2023 08:59:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "Boon@ecsmtp.png.intel.com" <Boon@ecsmtp.png.intel.com>,
 "Khai@ecsmtp.png.intel.com" <Khai@ecsmtp.png.intel.com>,
 boon.khai.ng@intel.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-3-boon.khai.ng@intel.com>
 <cfba8fa4-47e5-7553-f40e-9e34b25d1405@kernel.org>
 <DM8PR11MB5751E5388AEFCFB80BCB483FC13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <DM8PR11MB5751E5388AEFCFB80BCB483FC13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
Cc: "Swee, Leong Ching" <leong.ching.swee@intel.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>,
 Shevchenko Andriy <andriy.shevchenko@linux.intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 2/2] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
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



On 7/21/2023 8:30 AM, Ng, Boon Khai wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Friday, July 21, 2023 6:11 PM
>> To: Boon@ecsmtp.png.intel.com; Khai@ecsmtp.png.intel.com; "Ng
>> <boon.khai.ng"@intel.com; Giuseppe Cavallaro <peppe.cavallaro@st.com>;
>> Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
>> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
>> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>;
>> Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
>> <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-
>> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Cc: Ng, Boon Khai <boon.khai.ng@intel.com>; Shevchenko, Andriy
>> <andriy.shevchenko@intel.com>; Tham, Mun Yew
>> <mun.yew.tham@intel.com>; Swee, Leong Ching
>> <leong.ching.swee@intel.com>; G Thomas, Rohan
>> <rohan.g.thomas@intel.com>; Shevchenko Andriy
>> <andriy.shevchenko@linux.intel.com>
>> Subject: Re: [Enable Designware XGMAC VLAN Stripping Feature 2/2] net:
>> stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
>>
>> On 21/07/2023 08:26, Boon@ecsmtp.png.intel.com wrote:
>>> From: Boon Khai Ng <boon.khai.ng@intel.com>
>>>
>>> Currently, VLAN tag stripping is done by software driver in
>>> stmmac_rx_vlan(). This patch is to Add support for VLAN tag stripping
>>> by the MAC hardware and MAC drivers to support it.
>>> This is done by adding rx_hw_vlan() and set_hw_vlan_mode() callbacks
>>> at stmmac_ops struct which are called from upper software layer.
>> ...
>>
>>>   	if (priv->dma_cap.vlhash) {
>>>   		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
>>>   		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER; diff --
>> git
>>> a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>>> index 23d53ea04b24..bd7f3326a44c 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>>> @@ -543,6 +543,12 @@ stmmac_probe_config_dt(struct platform_device
>> *pdev, u8 *mac)
>>>   			plat->flags |= STMMAC_FLAG_TSO_EN;
>>>   	}
>>>
>>> +	/* Rx VLAN HW Stripping */
>>> +	if (of_property_read_bool(np, "snps,rx-vlan-offload")) {
>>> +		dev_info(&pdev->dev, "RX VLAN HW Stripping\n");
>>
>> Why? Drop.
>>
> 
> This is an dts option export to dts for user to choose whether or not they
> Want a Hardware stripping or a software stripping.
> 
> May I know what is the reason to drop this?

Because the networking stack already exposes knobs for drivers to 
advertise and control VLAN stripping/insertion on RX/TX using ethtool 
and feature bits (NETIF_F_HW_VLAN_CTAG_RX, NETIF_F_HW_VLAN_CTAG_TX).

What you are doing here is encode a policy as a Device Tree property 
rather than describe whether the hardware supports a given feature and 
this is frowned upon.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
