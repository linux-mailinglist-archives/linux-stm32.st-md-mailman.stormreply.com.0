Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6631B5821
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Apr 2020 11:27:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C61E3C36B0B;
	Thu, 23 Apr 2020 09:27:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C83E7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2020 09:27:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03N9CamF018121; Thu, 23 Apr 2020 11:27:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ddZbmMdkoc6AUdq6N6QFS5E1Zm5acr798GCEd7mVLZA=;
 b=0Jefn8E2CfPrP+w5DnjbGMLrcDPnH57GyUIqtVXVNTqD1opnn0WpoG5M35fEqAzNhUiw
 OzVa3iRsym/yZokeHk05qANZt0xz7K+M8e2ShinUIYdVOEAwW5hgbPM1h2nvAVYzSqzp
 QXVd71ReTeuCTjGKaiEPTEpUH8dx0TmSg3D3DcFI4scwFtfS1j3qUaadEtKMfgruQmWC
 9ox7BNDM6q1NhmXXiWQKTCEl3FQYqMv0UeUzKHmzm34HotHTVLDM+frI4YM014psDVAZ
 oIZt1uI45DJfmJBF9k8fuidA58a3WAW6V8XQoTubiawiqxaCZIJI0G5SAUXXx0RNlKcf Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30freguu6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Apr 2020 11:27:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F161610002A;
 Thu, 23 Apr 2020 11:27:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD97121FE9E;
 Thu, 23 Apr 2020 11:27:34 +0200 (CEST)
Received: from [10.211.2.131] (10.75.127.45) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 11:27:33 +0200
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, "balbi@kernel.org"
 <balbi@kernel.org>
References: <1587472341-17935-1-git-send-email-fabrice.gasnier@st.com>
 <1587472341-17935-2-git-send-email-fabrice.gasnier@st.com>
 <5391768a-da52-def8-9b2a-aeb559d8e26b@synopsys.com>
 <ba525953-fbab-c2cf-beba-8755846cd27e@st.com>
 <13a35aac-a3c9-df9f-a2b7-64abdbf9463c@synopsys.com>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <d1a2ce55-450b-47ea-15f9-a8532000a647@st.com>
Date: Thu, 23 Apr 2020 11:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <13a35aac-a3c9-df9f-a2b7-64abdbf9463c@synopsys.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_07:2020-04-22,
 2020-04-23 signatures=0
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

On 4/22/20 6:16 PM, Minas Harutyunyan wrote:
> Hi Fabrice,
> 
> On 4/22/2020 7:57 PM, Fabrice Gasnier wrote:
>> On 4/22/20 4:48 PM, Minas Harutyunyan wrote:
>>> Hi Fabrice,
>>>
>>> On 4/21/2020 4:32 PM, Fabrice Gasnier wrote:
>>>> When the remote wakeup interrupt is triggered, lx_state is resumed from L2
>>>> to L0 state. But when the gadget resume is called, lx_state is still L2.
>>>> This prevents the resume callback to queue any request. Any attempt
>>>> to queue a request from resume callback will result in:
>>>> - "submit request only in active state" debug message to be issued
>>>> - dwc2_hsotg_ep_queue() returns -EAGAIN
>>>>
>>>> Move the call to resume gadget after the core is put in DWC2_L0 state.
>>>>
>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>>>> ---
>>>>    drivers/usb/dwc2/core_intr.c | 10 +++++++---
>>>>    1 file changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>>> index 876ff31..b8ebda5 100644
>>>> --- a/drivers/usb/dwc2/core_intr.c
>>>> +++ b/drivers/usb/dwc2/core_intr.c
>>>> @@ -404,9 +404,11 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>>    	}
>>>>    
>>>>    	if (dwc2_is_device_mode(hsotg)) {
>>>> +		enum dwc2_lx_state lx_state = hsotg->lx_state;
>>>> +
>>>>    		dev_dbg(hsotg->dev, "DSTS=0x%0x\n",
>>>>    			dwc2_readl(hsotg, DSTS));
>>>> -		if (hsotg->lx_state == DWC2_L2) {
>>>> +		if (lx_state == DWC2_L2) {
>>>>    			u32 dctl = dwc2_readl(hsotg, DCTL);
>>>>    
>>>>    			/* Clear Remote Wakeup Signaling */
>>>> @@ -415,11 +417,13 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>>>>    			ret = dwc2_exit_partial_power_down(hsotg, true);
>>>>    			if (ret && (ret != -ENOTSUPP))
>>>>    				dev_err(hsotg->dev, "exit power_down failed\n");
>>>> -
>>>> -			call_gadget(hsotg, resume);
>>>>    		}
>>>>    		/* Change to L0 state */
>>>>    		hsotg->lx_state = DWC2_L0;
>>>> +
>>>> +		/* Gadget may queue new requests upon resume to L0 state */
>>>> +		if (lx_state == DWC2_L2)
>>>> +			call_gadget(hsotg, resume);
>>>>    	} else {
>>>>    		if (hsotg->params.power_down)
>>>>    			return;
>>>>
>>>
>>> What about below patch without introducing additional variable.
>>>
>>> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
>>> index 876ff31261d5..543865e31c72 100644
>>> --- a/drivers/usb/dwc2/core_intr.c
>>> +++ b/drivers/usb/dwc2/core_intr.c
>>> @@ -416,6 +416,8 @@ static void dwc2_handle_wakeup_detected_intr(struct
>>> dwc2_hsotg *hsotg)
>>>                           if (ret && (ret != -ENOTSUPP))
>>>                                   dev_err(hsotg->dev, "exit power_down
>>> failed\n");
>>>
>>> +                       /* Change to L0 state */
>>> +                       hsotg->lx_state = DWC2_L0;
>>
>> Hi Minas,
>>
>> That was my first approach locally, but I added a variable to avoid do
>> it twice... few lines after.
>>
>> But if you prefer, I can change in V2 ?
>>
>> Please let me know.
>>
>> Thanks,
>> Fabrice
>>
>>>                           call_gadget(hsotg, resume);
>>>                   }
>>>                   /* Change to L0 state */
>>>
>>>
>>> Thanks,
>>> Minas
>>>
> To avoid twice setting lx_state you can add 'else' before second setting.

Hi Minas,

Thanks for your quick answer. Sure, I'll update it in v2.

Also, do you think this can/should be marked as a fix ?
- e.g. add a Fixes tag?

Fixes: f81f46e1f530 ("usb: dwc2: implement hibernation during bus
suspend/resume")

Please advise,
Best Regards,
Fabrice

> 
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index 876ff31261d5..f59dabd46e60 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
> @@ -416,10 +416,14 @@ static void 
> dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>                          if (ret && (ret != -ENOTSUPP))
>                                  dev_err(hsotg->dev, "exit power_down 
> failed\n");
> 
> +                       /* Change to L0 state */
> +                       hsotg->lx_state = DWC2_L0;
>                          call_gadget(hsotg, resume);
>                  }
> -               /* Change to L0 state */
> -               hsotg->lx_state = DWC2_L0;
> +               else {
> +                       /* Change to L0 state */
> +                       hsotg->lx_state = DWC2_L0;
> +               }
>          } else {
>                  if (hsotg->params.power_down)
>                          return;
> 
> 
> 
> Am I missed something?
> 
> Thanks,
> Minas
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
