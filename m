Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8B24B4D
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 11:17:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25CA8C725D7
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 09:17:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71436C725D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 09:17:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L96iJ0014021; Tue, 21 May 2019 11:17:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=4RTuKGHCLsvh6APcX9ZvfmHkgHj7OwihyknGBu1Dl3k=;
 b=zu0FNCpQ3k5YZ+Hsbbr3+WOhETEEI/gIOo8/DQQg6XhVOH+wQN5fmQxRdPoCRMQl5YHP
 BXFwqOgCQeT/O3uvkr/R1btmto74WK/L9rN8UnYKQwZC6LfYnCeswjgmf0wBmOOQ72ir
 HTGEDPHbl3+VDiPOrxUgouddIuxMgctnPwiTu5l9Ssm+sdJOvMDGmYaWJCNFq/8AP21Y
 NRJfA5saQo7a+yG5I5A4LjLOrqk74BBnHvNZfK2ealDkR4PahOAymzNzuVwKd1LkSaDJ
 T881Rf3ep8OKCnHgANMCr9YhMkR7PBygemChfoWMJoXEYrd+Rz/tnM6pM3JXW+ZSRigb VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj8xg8bpr-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 21 May 2019 11:17:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4ECC531;
 Tue, 21 May 2019 09:17:50 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DB7C24EC;
 Tue, 21 May 2019 09:17:50 +0000 (GMT)
Received: from [10.48.0.237] (10.75.127.44) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 21 May
 2019 11:17:49 +0200
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
 <CAPDyKFqbn=UcbwoH_z+yjrjvHQZaMtmsD=n0yrBV7DAK5VRJEQ@mail.gmail.com>
 <74b91eb4-e5a3-38b2-f732-29cdd058eb6a@st.com>
 <CAPDyKFoURwnai1hbCbO+Uh6+hc7A4dYHjWkqeFAEgMQET-BzwA@mail.gmail.com>
 <e884b614-14d4-1cae-5b77-c6aacabb764a@st.com>
 <CAPDyKFo4Y9PF_QL47rO2c_szUHahPMuzHV=j_SL9dxvAzst17w@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <7e15c8ec-f851-b0d3-a3ce-dfad2a398e78@st.com>
Date: Tue, 21 May 2019 11:17:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo4Y9PF_QL47rO2c_szUHahPMuzHV=j_SL9dxvAzst17w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_01:, , signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 0/5] mmc: mmci: add busy detect for
	stm32 sdmmc variant
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



On 5/21/19 9:56 AM, Ulf Hansson wrote:
> On Tue, 21 May 2019 at 09:38, Ludovic BARRE <ludovic.barre@st.com> wrote:
>>
>> hi Ulf
>>
>> Just a "gentleman ping" about the rest of series.
>> "mmc: mmci: add busy detect for stm32 sdmmc variant"
> 
> Thanks!
> 
> It's been a busy period and I am currently traveling. My plan is to
> look at in detail beginning of next week when get back home. I hope
> that's okay.

yes, I understand, it's just to not forget me :-)

> 
> Kind regards
> Uffe
> 
>>
>> Regards
>> Ludo
>>
>> On 5/3/19 3:29 PM, Ulf Hansson wrote:
>>> On Tue, 30 Apr 2019 at 14:06, Ludovic BARRE <ludovic.barre@st.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/30/19 1:13 PM, Ulf Hansson wrote:
>>>>> On Fri, 26 Apr 2019 at 09:46, Ludovic Barre <ludovic.Barre@st.com> wrote:
>>>>>>
>>>>>> From: Ludovic Barre <ludovic.barre@st.com>
>>>>>>
>>>>>> This patch series adds busy detect for stm32 sdmmc variant.
>>>>>> Some adaptations are required:
>>>>>> -Avoid to check and poll busy status when is not expected.
>>>>>> -Clear busy status bit if busy_detect_flag and busy_detect_mask are
>>>>>>     different.
>>>>>> -Add hardware busy timeout with MMCIDATATIMER register.
>>>>>>
>>>>>> V2:
>>>>>> -mmci_cmd_irq cleanup in separate patch.
>>>>>> -simplify the busy_detect_flag exclude
>>>>>> -replace sdmmc specific comment in
>>>>>> "mmc: mmci: avoid fake busy polling in mmci_irq"
>>>>>> to focus on common behavior
>>>>>>
>>>>>> Ludovic Barre (5):
>>>>>>      mmc: mmci: cleanup mmci_cmd_irq for busy detect feature
>>>>>>      mmc: mmci: avoid fake busy polling in mmci_irq
>>>>>>      mmc: mmci: fix clear of busy detect status
>>>>>>      mmc: mmci: add hardware busy timeout feature
>>>>>>      mmc: mmci: add busy detect for stm32 sdmmc variant
>>>>>>
>>>>>>     drivers/mmc/host/mmci.c | 61 ++++++++++++++++++++++++++++++++++++++-----------
>>>>>>     drivers/mmc/host/mmci.h |  3 +++
>>>>>>     2 files changed, 51 insertions(+), 13 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.7.4
>>>>>>
>>>>>
>>>>> Ludovic, just wanted to let you know that I am reviewing and testing
>>>>> this series.
>>>>>
>>>>> However, while running some tests on Ux500 for validating the busy
>>>>> detection code, even without your series applied, I encounter some odd
>>>>> behaviors. I am looking into the problem to understand better and will
>>>>> let you know as soon as I have some more data to share.
>>>>
>>>> Oops, don't hesitate to share your status, if I could help.
>>>
>>> Thanks! Good and bad news here, then.
>>>
>>> I now understand what is going on - and there is certainly room for
>>> improvements here, but more importantly the actual mmci busy detection
>>> works as expected.
>>>
>>> When it comes to improvements, the main issue I have found is how we
>>> treat DATA WRITES. In many cases we simply don't use the HW busy
>>> detection at all, but instead rely on the mmc core to send CMD13 in a
>>> loop to poll. Well, then if the polling would have consisted of a
>>> couple of CMD13s that wouldn't be an issue, but my observations is
>>> rather that the numbers of CMD13 sent to poll is in the range or
>>> hundreds/thousands - per each WRITE request!
>>>
>>> I am going to send a patch (or two) that improves the behavior. It
>>> might even involve changing parts in core layer, not sure how the end
>>> result will look like yet.
>>>
>>> In any case, I have applied patch 1 and patch2 for next, as the tests
>>> turned out well at my side. I also took the liberty of updating some
>>> of the comments/changelogs, please have look and tell if there is
>>> something you want to change.
>>>
>>> I will continue with the rest of series next week.
>>>
>>> Kind regards
>>> Uffe
>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
