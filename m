Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C12212196
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jul 2020 12:53:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84779C36B26;
	Thu,  2 Jul 2020 10:53:27 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4C4EC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 10:53:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49yFLr39hkz1rVw0;
 Thu,  2 Jul 2020 12:53:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49yFLr2C48z1qw71;
 Thu,  2 Jul 2020 12:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id XE8f4teyIOH6; Thu,  2 Jul 2020 12:53:22 +0200 (CEST)
X-Auth-Info: BxUsMb4hTCTIOASkHZPedF6xg2xeCtGU7rA2aRGZqFc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  2 Jul 2020 12:53:22 +0200 (CEST)
To: Philippe CORNU <philippe.cornu@st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20200229221649.90813-1-marex@denx.de>
 <a30ad5a774004221903292871797607a@SFHDAG6NODE1.st.com>
 <64ea7f77-0a0b-ae3a-2911-5fdc8633255e@denx.de>
 <68f47008-f0ed-384c-7e21-f29b444da3ee@st.com>
 <3121f339-c513-f75d-569e-81c5c0f3cd1a@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a35217e6-21ce-6d36-c1bb-9e057ae35be1@denx.de>
Date: Thu, 2 Jul 2020 12:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <3121f339-c513-f75d-569e-81c5c0f3cd1a@st.com>
Content-Language: en-US
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: repair runtime power management
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

On 7/2/20 12:07 PM, Philippe CORNU wrote:

Hi,

[...]

>>>> Thank for your patch. Pm_runtime_put_sync is also done into function ltdc_crtc_mode_fixup.
>>>> To avoid several call of Pm_runtime_put_sync, it could be better to check pm_runtime activity:
>>>>
>>>> +	int ret;
>>>>    
>>>>    	DRM_DEBUG_DRIVER("\n");
>>>>    
>>>> +	if (!pm_runtime_active(ddev->dev)) {
>>>> +		ret = pm_runtime_get_sync(ddev->dev);
>>>> +		if (ret) {
>>>> +			DRM_ERROR("Failed to enable crtc, cannot get sync\n");
>>>> +			return;
>>>> +		}
>>>> +	}
>>>> +
>>>
>>> Where should this go ? And wouldn't that only hide nastier PM imbalance
>>> issues ?
>> Hi Marek,
>> I tested the patch &  it generate an error when I try wake up / sleep
>> the board STM32MP1 DK2 with weston application.
>> It need an additional patch
>> drm-stm-ltdc-remove-call-of-pm-runtime-functions.
>>
>> Thanks for the patch.
>>
>> Tested-by: Yannick Fertre <yannick.fertre@st.com>
>>
> 
> Hi Marek,
> before merging the 2 patches, I would like to be sure that Yannick's 
> patch does not "break" your use case (Qt I think)?
> May I ask you please to give it a try?
> Note: If you think there is no need to do extra checks, simply tell me 
> of course
It's fine, thanks !

-- 
Best regards,
Marek Vasut
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
