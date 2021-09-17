Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB540F2A2
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Sep 2021 08:54:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85424C597BE;
	Fri, 17 Sep 2021 06:54:34 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D374EC5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Sep 2021 02:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1631845347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7/6nBllO0qz8oimE6x+1iWitWV8BCaNmZH8qWdDU6s=;
 b=j5/r5ZDw/Q3Gj/v1bEAzKAwXRQJJduHWWhRrcfkkypo7TgjSnry3mP7OME7sQKIGWKelmh
 dqHi+lJtJS2J1yyjKyhMAdH5KSffJROAIcxGpJQF7OJuPAzMAwQxItr5LwoDLONkB08a16
 oSrZOgc94AScmZyGbke7R4NZdwOeJrQ=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-zON5onB5Pni2x93cOcA07A-1;
 Fri, 17 Sep 2021 04:22:25 +0200
X-MC-Unique: zON5onB5Pni2x93cOcA07A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKOaoJAGv/TLp2uO4on901i0/ckpe+hzY+X/111WHUzys968sFCux6GUjDhfii/x2KvvgzQJrOuZIhRlvYQXoDOzcLu5vOourQ/3qczp39m1U0tXSvHlx5HvrQY/dBKv9KSopcuc+pUr4bidUhBfTLvjpUn6/r80014QAxYoUhO2sIpydOtYbtz9jfSug2iAbFEmmoIMAm8D00LnLTHPy6l+gqjMbkWf3ZXGhdiVgMEZvgqp6wlA9mMmcFT8sIRVLVdntoiMqSLAfyHYm9M3lwTP+39o8MrPLCDjpmCDQlW+NZw6V4Ha97DxAm5O4HCnBgCDM4fKgwBslI6g03MO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=T7/6nBllO0qz8oimE6x+1iWitWV8BCaNmZH8qWdDU6s=;
 b=lbdPE4zfeZZQuhSZ8GT6oA1h5QywTFhg23/QoOGDGiEK8jXfbFYEp1wSbCz/dJlyjnX4bgN8s2M05rbfIXul5L3veaNMhA1Ewop3j5lMvRZD5xLXCbQpzXy09kkOej2xeo9buJgLeNSEjyROjQCLC0PxpPhXDKASiax9E+WbXDtqsDEavYnAvkzW/5hAgL7W3KWhzmzeDMf1FQmMZ5PkRSmtTdLYO3u2QU2bwl5/EnuuxPvQ1E/93ssNNqhS2imQVFWazr9wBPX+P6/iSKOlJRVOeJMo0xirK6mVWv/Dm24yR+vA1vj7ZWX1LlBn2F2KilwMsxWFqurWjqrfIcszBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: wolfvision.net; dkim=none (message not signed)
 header.d=none;wolfvision.net; dmarc=none action=none header.from=suse.com;
Received: from AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22)
 by AM6PR04MB5415.eurprd04.prod.outlook.com (2603:10a6:20b:93::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 17 Sep
 2021 02:22:23 +0000
Received: from AM7PR04MB6821.eurprd04.prod.outlook.com
 ([fe80::78e1:ab2a:f283:d097]) by AM7PR04MB6821.eurprd04.prod.outlook.com
 ([fe80::78e1:ab2a:f283:d097%5]) with mapi id 15.20.4500.019; Fri, 17 Sep 2021
 02:22:23 +0000
Message-ID: <2424d7da-7022-0b38-46ba-b48f43cda23d@suse.com>
Date: Fri, 17 Sep 2021 10:22:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Michael Riesch <michael.riesch@wolfvision.net>,
 Punit Agrawal <punitagrawal@gmail.com>
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
 <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
 <568a0825-ed65-58d7-9c9c-cecb481cf9d9@wolfvision.net>
 <87czpvcaab.fsf@stealth>
 <aa905e4d-c5a7-e969-1171-3a90ecd9b9cc@wolfvision.net>
From: Qu Wenruo <wqu@suse.com>
In-Reply-To: <aa905e4d-c5a7-e969-1171-3a90ecd9b9cc@wolfvision.net>
X-ClientProxiedBy: SJ0PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:a03:331::12) To AM7PR04MB6821.eurprd04.prod.outlook.com
 (2603:10a6:20b:105::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [0.0.0.0] (149.28.201.231) by
 SJ0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:a03:331::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 02:22:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48f23657-0eda-4ae6-7beb-08d97981fb78
X-MS-TrafficTypeDiagnostic: AM6PR04MB5415:
X-Microsoft-Antispam-PRVS: <AM6PR04MB5415BA34D194C8333E945024D6DD9@AM6PR04MB5415.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6EoHbBJBrU21tYfgQOuP+lwHdxnjmGmxNfUnU2AB/2JLFW4BwGF+uDd0F0f/1zJHxh6nVLgjoeulv2MQmpjE8tmirW9asqcDPn3DzPy02ML+sBgJT0uFidGH5tN1QDB8z3SFkHC+Gh/CLPSx9F1sKk5O81xtVpzoXA+lffr54F5LEhEDbjDV6pUiVpSed0YUyD5r4g4oS07D9Cjg37zjSXTiB11+9sTIbC6AUfLpsiyJYZ05hdP/HWe6608UV0qxPo9qDhspKoaXW2E1P4yfVOMkjuzfEuxngyjvW7Pmo2HaGGfv9Bf5UrSBJr/+dsplVNMNhQ/QztrUue3nD83LHIbShI5laXwBIDfBMmd6Mu1JEQlbEVnA9+geA1qrs8wLEvFJXbF+JkQTlKTDiVIKvhuA2eQ7br7snAvpwPEjO5u74ZCBItVw89ac1IwtrcxPAwUXy5dNTQv17ehYPsbCdVrCV6isTTAe16TUvnzVdUfqKSGtJ66wbr5kFPc7/DmWex2gAiqIn9CST6U/u2n2VxGDcRUgzCUTa76E/gzKKRtL1inaoIlb8xYNEzghbqq/B1c9w0g4jVmroo0ISkfY+9bv3kcmuI3vDzJ6MxRG7pKC0ibf6POEkYaWlBsAUIhexK9NYUiACkMjqT7lC9rt1+/dAb7U5nMUX/VMxl3SZx5ErasEtMBWJ6LFA44yzhq0hKpA5rwjqZWOufoaJNuCc93MwG0htUIoBz8MxXVAWrMmXQaHtDTOou6Uax1SyA5PfXsh3puvYrn1H56C22FJoFGznHSa80O+jpD496XtPTaTxjLfOHi74lu+XU/THLKdfCigEmkpmUJH7rVkXCEsQOcU4Ni5UWZAAuSJWiDUDyVoAz+QyEagKD0DTZMF2jQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB6821.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(396003)(346002)(39860400002)(5660300002)(31696002)(36756003)(316002)(8936002)(86362001)(53546011)(6486002)(38100700002)(2906002)(186003)(8676002)(6666004)(83380400001)(110136005)(26005)(2616005)(16576012)(956004)(54906003)(66476007)(7416002)(478600001)(31686004)(4326008)(66556008)(66946007)(6706004)(966005)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjgvZkRrQWtTK0VqeEJ6bnNZRHRSczhiK0l2bkVhdVdUc1M5Qjkzb1dEMDhU?=
 =?utf-8?B?UlZvQkp1QXFTeXRXTHEwNzhFaEhYNXpGMExWbnUwbzMwbE4yOHZOMURmSk82?=
 =?utf-8?B?bWFFdWl1K3kraStCUTJ0RkJRU1kwQUxGcXJtL3Y0SHI3N0FEYWE4a0loUlZk?=
 =?utf-8?B?dGNFc2EzeUUrRGZkWHg1d1duNVltN3kydmI1SlFVNXRFM1Vldk1BZEZlbUpo?=
 =?utf-8?B?OUJnZ2ppWTVCNGpBSStzQnBvYzAwdDRKcDRIKzcvdjlwMlpET3ZxMDRHdGJV?=
 =?utf-8?B?STJEeXN0emNsSk94RUs4SzM1Q2dCSi84SndsQ2U3YzlsUE1mMDV4ZDdLMWpZ?=
 =?utf-8?B?b0E1REQ4UmdGTHAxYk1vdHB6SVErT0NwN2NaM0lqbGp3ZGY5SmVrVjRHVmNZ?=
 =?utf-8?B?eENBSlhLSzFMZi9yb2RXcDQzT0U3bjg0NlRTaGo3K2Nab1JBaE4zbkJwbVM5?=
 =?utf-8?B?alA1NWlmc3FybG9XbHhvSk1Id0cycGZybktkZ2hnQ3M2Vms3Mjdnd0U3N3BL?=
 =?utf-8?B?Y1dzNk1Ddy9jSFdlYzB6TmxzZW1sZkVyUGJGTDhKTUJwWFBxZHJUcnpqYVlm?=
 =?utf-8?B?dkhFQi92TmFRQmgySzU2dDBwWnZJdHlibytSNnkweCtHNENoWlJUVFIzKzB4?=
 =?utf-8?B?SDlhb3pIMEdkQWc0ZlBkZ3liR2szTC9nYUxGRzFvSm8vOWFxK1FSdkRyWXIx?=
 =?utf-8?B?NWNnZGk1VStpaTRXdjdTT0dLNzRXYmc3dWs1QmNmMHlmWHNUL3o0eTFJN2ZD?=
 =?utf-8?B?Wkd4enVaYno5YitnbXdyT3V0bzNkd1FhM1hSSnNVNTljMnFLZU10U3ZncEZN?=
 =?utf-8?B?aUFpUTBSd3A5Q3E3RHRCQzBsSHFOSzY4TXkyRWlmOC9KS0grWW9zcEkrM1Rn?=
 =?utf-8?B?UldUYWhoT0JVdmRyM1dtdFJkOW9wT1EyUnJDSFZRL09BMzB5eTBWcEhjS0ty?=
 =?utf-8?B?bG1SbGZ0UTNJVVVkR0QxeE1zUW1XNDN5aXVWSTVrekc4WWpLRFd0Y1ZGcjI0?=
 =?utf-8?B?bWU3aWg0RmdFa1BWampNaGJOY005ZHZ1MkxEcy96ZDlSREV5OWdTb2pSdWVj?=
 =?utf-8?B?WFVYby9nby9qcFFQOCs3cVd2b3ZUYlN4c056T3VGNkFzcW95eDZFMUd1Wmkr?=
 =?utf-8?B?Y3BIWmlkSCtkOFY3aHh0ZFVudmxrTGFhb0cvcG9tSTl1Z0hEVy9UY3NMYTkz?=
 =?utf-8?B?WHZzNzM0bGhIaFFObCtJNWswbHVYREROSmswbWRvSUZkdEFxVHIySmphM1Nw?=
 =?utf-8?B?Z0JsMmdCWVNVMXRDYXh3MmlJSUhUSXNPNEpscHF2K1pFUlhwRmVnS2hmTkFD?=
 =?utf-8?B?VmF2UnBnZUJ3ZlQySmdNanpOcUNYdVdMc25qT2dTbU5TYUROMmtKUENSZGk0?=
 =?utf-8?B?R2RLVmdVK0t6b1dCZEthVnJ1cE9NSFlOTS96dXhBcmtrQTlWUzhFUFNtT2ZT?=
 =?utf-8?B?RSs4ZFNoOUtVbUMzbFhUVDk0SEp2TDRTNHoydS9lUWl5RkI3dzN1QXdhMStT?=
 =?utf-8?B?ZXYxMi9ySXh3NmR4YjdrT1NNeTVFSk5YVGMrTGZheGx1amhtWjFuMkFscUVx?=
 =?utf-8?B?UUdicWdoeUtGY2lKV3J1emQ1OVgzRk1ta094aUM4S1ZnekxjL0VPc0ZIME9v?=
 =?utf-8?B?WXlEbGpDRTlOcUdHTTZ2bTZ2cE5TaEpYcndVS3RHVnZSb0hHcHR6OE9XQkRV?=
 =?utf-8?B?V0tDeEJhYmpWclJEWVMzK2x3N3dNNkVFaWNkUklDZmM2SUVxeWtUL2ExSy9a?=
 =?utf-8?Q?T6bHgGyxvF17KMxalMIAnbOjqGzFeT6bjFvotv/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f23657-0eda-4ae6-7beb-08d97981fb78
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB6821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 02:22:22.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBS5vq765vGD1gCcX824gNtJg9M0YXhRfWfeg+geKhnByZoRGLOnw+BgiXLt6IKJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5415
X-Mailman-Approved-At: Fri, 17 Sep 2021 06:54:30 +0000
Cc: sashal@kernel.org, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 wens@kernel.org, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
 pm_runtime_enable warnings
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



On 2021/8/30 22:10, Michael Riesch wrote:
> Hi Punit,
> 
> On 8/30/21 3:49 PM, Punit Agrawal wrote:
>> Hi Michael,
>>
>> Michael Riesch <michael.riesch@wolfvision.net> writes:
>>
>>> Hi ChenYu,
>>>
>>> On 8/29/21 7:48 PM, Chen-Yu Tsai wrote:
>>>> Hi,
>>>>
>>>> On Mon, Aug 23, 2021 at 10:39 PM Michael Riesch
>>>> <michael.riesch@wolfvision.net> wrote:
>>>>>
>>>>> This reverts commit 2c896fb02e7f65299646f295a007bda043e0f382
>>>>> "net: stmmac: dwmac-rk: add pd_gmac support for rk3399" and fixes
>>>>> unbalanced pm_runtime_enable warnings.
>>>>>
>>>>> In the commit to be reverted, support for power management was
>>>>> introduced to the Rockchip glue code. Later, power management support
>>>>> was introduced to the stmmac core code, resulting in multiple
>>>>> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.
>>>>>
>>>>> The multiple invocations happen in rk_gmac_powerup and
>>>>> stmmac_{dvr_probe, resume} as well as in rk_gmac_powerdown and
>>>>> stmmac_{dvr_remove, suspend}, respectively, which are always called
>>>>> in conjunction.
>>>>>
>>>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>>>
>>>> I just found that Ethernet stopped working on my RK3399 devices,
>>>> and I bisected it down to this patch.
>>>
>>> Oh dear. First patch in a kernel release for a while and I already break
>>> things.
>>
>> I am seeing the same failure symptoms reported by ChenYu on my RockPro64
>> with v5.14. Reverting the revert i.e., 2d26f6e39afb ("net: stmmac:
>> dwmac-rk: fix unbalanced pm_runtime_enable warnings") brings back the
>> network.
>>
>>> Cc: Sasha as this patch has just been applied to 5.13-stable.
>>>
>>>> The symptom I see is no DHCP responses, either because the request
>>>> isn't getting sent over the wire, or the response isn't getting
>>>> received. The PHY seems to be working correctly.
>>>
>>> Unfortunately I don't have any RK3399 hardware. Is this a custom
>>> board/special hardware or something that is readily available in the
>>> shops? Maybe this is a good reason to buy a RK3399 based single-board
>>> computer :-)
>>
>> Not sure about the other RK3399 boards but RockPro64 is easily
>> available.
> 
> I was thinking to get one of those anyway ;-)
> 
>>> I am working on the RK3568 EVB1 and have not encountered faulty
>>> behavior. DHCP works fine and I can boot via NFS. Therefore, not sure
>>> whether I can be much of help in this matter, but in case you want to
>>> discuss this further please do not hesitate to contact me off-list.
>>
>> I tried to look for the differences between RK3568 and RK3399 but the
>> upstream device tree doesn't seem to carry a gmac node in the device
>> tree for EK3568 EVB1. Do you have a pointer for the dts you're using?
> 
> The gmac nodes have been added recently and should enter 5.15-rc1. Until
> then, you can check out the dts from linux-rockchip/for-next [0].

Do you have the upstream commit?

As I compiled v5.15-rc1 and still can't get the ethernet work.

Not sure if it's my Uboot->systemd-boot->customer kernel setup not 
passing the device tree correctly or something else...

Thanks,
Qu

> 
>> Also, other than the warning "Unbalanced pm_runtime_enable!" do you
>> notice any other ill-effects without your patch?
> 
> No, not as such.
> 
> Best regards,
> Michael
> 
>> If this affects all RK3399 boards as ChenYu suggests quite a few users
>> are going to miss the network once they upgrade.>
>> Punit
>>
>> [...]
>>
> 
> [0]
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/log/?h=for-next
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
