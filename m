Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9A1B5954
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Apr 2020 12:36:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8DDC36B0B;
	Thu, 23 Apr 2020 10:36:22 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1869AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 10:36:20 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4FE5C0089;
 Thu, 23 Apr 2020 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587638178; bh=dfa9KE7rEKtsCnAHPW2sHuoQejq5TEMKtN6lcuWXONM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=b4adefcyB2iGqpxisdWW6x9BKHxKbWVhjLyjmk0avdna5vLmLREFZwIxcW5thwhJr
 iCdghZV+lcGfr604GhEutrHXg5Y0+bgCj3NgQS3Z2uDf2zZf5jtr8VjrsgJ3+saGdt
 bPnJZuMkoZcWAghKH6ELFjAMhj8x8rdWKVVHr/FTdDE/r87Jd2NwMH6ZJ8I8gdLfxZ
 PqFEeI3F0DkRb9JJzSDRE0oVDettbWaYgWLMqcFmVWOJXUHSlumbhE0gU7Wg9rd16l
 uLgYXXx/UCzefMA9qWPQ/9jzagUETXOD3EZO0yX6F84hV7uo3nzqN/3vXEPOVJdMQv
 6btWOHWnxwdAg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 28E12A0091;
 Thu, 23 Apr 2020 10:36:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 23 Apr 2020 03:35:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 23 Apr 2020 03:35:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjfZ3NQ+CtdYmMNVXnNJbHMBSK9kHT1w8TXWcZX2UbkbYceY6n2o/R7SVZUpU5+lHMSXJ6Rn94tFu1LuzeyzPqFvI30pOQiEsAQMcrmm1W6MjsYwIJiuuRoc+cNUdUxUxAZ4mZ0RTbn7f9zG4GlUzpP8mb5SOOlchU1my0/jkMMMHJfY8hDjsR6/wnnqToa+MIlwl2aUMWt94duBuwCI/I1FEvAksQjwa5PCwA4ENdml0t1yj9trnJHE0bo3yZQuVKWRlzL6pdMf14XywxJFTTyrDGY57uGLqH2bM8TeCIh8dkKrWISLAPn7Ow0VQe70WtUQ44o2ZssSlir/ItNzZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfa9KE7rEKtsCnAHPW2sHuoQejq5TEMKtN6lcuWXONM=;
 b=T/elyBRkig51PQiWPWGWp8mLtoNAMqct61/5WO7U9GNKoODWLv732sSRzw52md18Ul7sRJikkpoIYjjN5HCqdvcRbk1VuGBl92x+tAnJkqI5mRqGzrAvtps42IB5MyC6JxhdTFgfzO0oLh53UIfHll6ropqkU7SK9dwGL0ZX/+5YYhnQySxuYhZxbGNV0HM/tLLbN9/14khEZ+1oUHtpam6d2ulEaWTiArHSA4h5ImVP/C5YpsRyCVlM0uxYQ8dCeo9cIP9zYAVWZHIB9RuW/fu1LT9ecHD9bYKnpppm1P7mwzwv4haXWnJ237i9/V+v/Dac8MhperbaGTvo2jHlQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfa9KE7rEKtsCnAHPW2sHuoQejq5TEMKtN6lcuWXONM=;
 b=SfpNXZK/LsUFYhCjtHsAIilgJVKr9YuDkfIYmLK0JKlyE0N5+3v1p4FFDFutlDWbAgXER0ZJL1GxQXqBShpAy70/4GedL069py3msjW6Qls751Hay4B1z2xq9D1opVenWE2/WBiuItqbX+FSr9axzW1s7/0wVLJZzP2doYvVIgg=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2509.namprd12.prod.outlook.com (2603:10b6:802:29::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25; Thu, 23 Apr
 2020 10:35:42 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::20d2:fe98:5580:932d%7]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 10:35:42 +0000
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@st.com>,
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
 "balbi@kernel.org" <balbi@kernel.org>
Thread-Topic: [PATCH 1/4] usb: dwc2: gadget: move gadget resume after the core
 is in L0 state
Thread-Index: AQHWF9kltb5ivodInUCMhTw1JrJADqiFOpOAgAATFACAAAV1AIABIAeAgAATCYA=
Date: Thu, 23 Apr 2020 10:35:42 +0000
Message-ID: <0cd4f5f9-f729-f638-098a-285bbd5f8542@synopsys.com>
References: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
 <1587472341-17935-2-git-send-email-fabrice.gasnier@st.com>
 <5391768a-da52-def8-9b2a-aeb559d8e26b@synopsys.com>
 <ba525953-fbab-c2cf-beba-8755846cd27e@st.com>
 <13a35aac-a3c9-df9f-a2b7-64abdbf9463c@synopsys.com>
 <d1a2ce55-450b-47ea-15f9-a8532000a647@st.com>
In-Reply-To: <d1a2ce55-450b-47ea-15f9-a8532000a647@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b5d175a-a6f6-456a-b273-08d7e77212c9
x-ms-traffictypediagnostic: SN1PR12MB2509:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2509CF9A33A853737880DFA0A7D30@SN1PR12MB2509.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(136003)(366004)(396003)(346002)(39860400002)(376002)(53546011)(4326008)(81156014)(6506007)(26005)(8676002)(86362001)(31696002)(6512007)(8936002)(54906003)(110136005)(316002)(71200400001)(76116006)(186003)(91956017)(2906002)(31686004)(2616005)(66476007)(66946007)(64756008)(66446008)(66556008)(478600001)(6486002)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eMjhaMdJUVU4c6ojXxgECS6gia22b+WTuHs6ImHS/w0A1KfWxpqN+1ghQoNeT4rGep3K3kfvyAIG1iyhAmp8tznnoKn/Sf8GUHkuoje+x2yWiopVbDlbY3Q2NU0puw2lsVW3+Pt5y0jdxr2O8aB1oUilOBT+byF3R6cHDb7+5vVIxbfMsnk05OH1O4x651DLKE1UvT+LcrfZFhRN+wuk/22UVkEJMGl9wmUdG09mp+l9VM8ot7sKyCNMf+w3FWj28SSetiKjRqyNshjLaR+0zID/6Hvsxq5W2sbpkrdLhxDYcsGoGjYhnrFRbrpM1cjhkLVgSqgFqZ5Y6UsW9b9JQFsw5vKFWjogw8h1h4rlBE0HZDM3BFPenTsXlumKrOGCd5yM8hH4B6TuO5FJKdpQEFTiVXgOMnaBqvEOappzDb4BofRqWNJCSWPRN2gsJ7DY
x-ms-exchange-antispam-messagedata: KhuWRwYhQU06ewOeeDHATI3fN51re/IzAcv0lUMLzhMqoFVZ511XfNKM3e7NCI/rnDHO54gjRLe73oAz2KqRhKou67lEDwTv0cNgDoAi/Q/6uqosX2C9FQWPn7929/gERjdjviYqL8AimTbn0tp6Qg==
Content-ID: <C32F802B2BEEFA49A21FAEC4D17C48CC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5d175a-a6f6-456a-b273-08d7e77212c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 10:35:42.2311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uB9PVbAicc4m+f8O8R5W5LjaNpdru+/bzsTh5QibLdE7R7dKdR9Tl1ekPSX/atFOuSOVigEn50XwCnhZPTmGiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2509
X-OriginatorOrg: synopsys.com
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] usb: dwc2: gadget: move gadget resume
 after the core is in L0 state
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Fabrice,

On 4/23/2020 1:27 PM, Fabrice Gasnier wrote:
> On 4/22/20 6:16 PM, Minas Harutyunyan wrote:
>> Hi Fabrice,
>>
>> On 4/22/2020 7:57 PM, Fabrice Gasnier wrote:
>>> On 4/22/20 4:48 PM, Minas Harutyunyan wrote:
>>>> Hi Fabrice,
>>>>
>>>> On 4/21/2020 4:32 PM, Fabrice Gasnier wrote:
>>>>> When the remote wakeup interrupt is triggered, lx_state is resumed from L2
>>>>> to L0 state. But when the gadget resume is called, lx_state is still L2.
>>>>> This prevents the resume callback to queue any request. Any attempt
>>>>> to queue a request from resume callback will result in:
>>>>> - "submit request only in active state" debug message to be issued
>>>>> - dwc2_hsotg_ep_queue() returns -EAGAIN
>>>>>
>>>>> Move the call to resume gadget after the core is put in DWC2_L0 state.
>>>>>
>>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>>>>> ---
>>>>>     drivers/usb/dwc2/core_intr.c | 10 +++++++---
>>>>>     1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>>>> index 876ff31..b8ebda5 100644
>>>>> --- a/drivers/usb/dwc2/core_intr.c
>>>>> +++ b/drivers/usb/dwc2/core_intr.c
>>>>> @@ -404,9 +404,11 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>>>     	}
>>>>>     
>>>>>     	if (dwc2_is_device_mode(hsotg)) {
>>>>> +		enum dwc2_lx_state lx_state = hsotg->lx_state;
>>>>> +
>>>>>     		dev_dbg(hsotg->dev, "DSTS=0x%0x\n",
>>>>>     			dwc2_readl(hsotg, DSTS));
>>>>> -		if (hsotg->lx_state == DWC2_L2) {
>>>>> +		if (lx_state == DWC2_L2) {
>>>>>     			u32 dctl = dwc2_readl(hsotg, DCTL);
>>>>>     
>>>>>     			/* Clear Remote Wakeup Signaling */
>>>>> @@ -415,11 +417,13 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>>>     			ret = dwc2_exit_partial_power_down(hsotg, true);
>>>>>     			if (ret && (ret != -ENOTSUPP))
>>>>>     				dev_err(hsotg->dev, "exit power_down failed\n");
>>>>> -
>>>>> -			call_gadget(hsotg, resume);
>>>>>     		}
>>>>>     		/* Change to L0 state */
>>>>>     		hsotg->lx_state = DWC2_L0;
>>>>> +
>>>>> +		/* Gadget may queue new requests upon resume to L0 state */
>>>>> +		if (lx_state == DWC2_L2)
>>>>> +			call_gadget(hsotg, resume);
>>>>>     	} else {
>>>>>     		if (hsotg->params.power_down)
>>>>>     			return;
>>>>>
>>>>
>>>> What about below patch without introducing additional variable.
>>>>
>>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>>> index 876ff31261d5..543865e31c72 100644
>>>> --- a/drivers/usb/dwc2/core_intr.c
>>>> +++ b/drivers/usb/dwc2/core_intr.c
>>>> @@ -416,6 +416,8 @@ static void dwc2_handle_wakeup_detected_intr(struct
>>>> dwc2_hsotg *hsotg)
>>>>                            if (ret && (ret != -ENOTSUPP))
>>>>                                    dev_err(hsotg->dev, "exit power_down
>>>> failed\n");
>>>>
>>>> +                       /* Change to L0 state */
>>>> +                       hsotg->lx_state = DWC2_L0;
>>>
>>> Hi Minas,
>>>
>>> That was my first approach locally, but I added a variable to avoid do
>>> it twice... few lines after.
>>>
>>> But if you prefer, I can change in V2 ?
>>>
>>> Please let me know.
>>>
>>> Thanks,
>>> Fabrice
>>>
>>>>                            call_gadget(hsotg, resume);
>>>>                    }
>>>>                    /* Change to L0 state */
>>>>
>>>>
>>>> Thanks,
>>>> Minas
>>>>
>> To avoid twice setting lx_state you can add 'else' before second setting.
> 
> Hi Minas,
> 
> Thanks for your quick answer. Sure, I'll update it in v2.
> 
> Also, do you think this can/should be marked as a fix ?
> - e.g. add a Fixes tag?
> 
> Fixes: f81f46e1f530 ("usb: dwc2: implement hibernation during bus
> suspend/resume")
> 

Yes, go ahead to submit V2 with mentioned "Fixes:" tag.

Thanks,
Minas


> Please advise,
> Best Regards,
> Fabrice
> 
>>
>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>> index 876ff31261d5..f59dabd46e60 100644
>> --- a/drivers/usb/dwc2/core_intr.c
>> +++ b/drivers/usb/dwc2/core_intr.c
>> @@ -416,10 +416,14 @@ static void
>> dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>                           if (ret && (ret != -ENOTSUPP))
>>                                   dev_err(hsotg->dev, "exit power_down
>> failed\n");
>>
>> +                       /* Change to L0 state */
>> +                       hsotg->lx_state = DWC2_L0;
>>                           call_gadget(hsotg, resume);
>>                   }
>> -               /* Change to L0 state */
>> -               hsotg->lx_state = DWC2_L0;
>> +               else {
>> +                       /* Change to L0 state */
>> +                       hsotg->lx_state = DWC2_L0;
>> +               }
>>           } else {
>>                   if (hsotg->params.power_down)
>>                           return;
>>
>>
>>
>> Am I missed something?
>>
>> Thanks,
>> Minas
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
