Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9DBF836
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 14:06:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB54FC35E03
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 12:06:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E78AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 12:06:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UBv3l2016156; Tue, 30 Apr 2019 14:06:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=0TJCqpAByJcnuLJ0JtSeGC0DKLxILjaYjgU3/kNbuek=;
 b=NmBhW31fR9zLCaqeXjHXtkG5/BQARi8G719yE+lA8MT+RIjgdhnjtI1rVcuizf7yT2ha
 fjDWIVwaVZSlTvU+BQ5dakHKoI4uCLaihfSydWw9ymEnQMIQw/okuMvLQsvrMGWXKxXZ
 GvMl+PTikZK8q0t2qdIM6Wp0qCLDy9SPY+96JOdYQJcfWmBAHr/aaxtWiOTacXyqWHrf
 OhfzASaUV7E5u14LxjwzJJcXL1ttxOO+/P3p/A2fZvY4GtqzZxcfIFzrtwOb5hAL8VqO
 AezCbzmDnt4DyRPwqmw/Ndi+MwL2iff+nGvUwXGhPOUAN1SdbLZ9QxNc/dxu4MPizXjI 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s61q8dqy5-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 14:06:47 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 082673A;
 Tue, 30 Apr 2019 12:06:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D06F22516;
 Tue, 30 Apr 2019 12:06:46 +0000 (GMT)
Received: from [10.48.0.237] (10.75.127.48) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 30 Apr
 2019 14:06:46 +0200
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
 <CAPDyKFqbn=UcbwoH_z+yjrjvHQZaMtmsD=n0yrBV7DAK5VRJEQ@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <74b91eb4-e5a3-38b2-f732-29cdd058eb6a@st.com>
Date: Tue, 30 Apr 2019 14:06:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqbn=UcbwoH_z+yjrjvHQZaMtmsD=n0yrBV7DAK5VRJEQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_05:, , signatures=0
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



On 4/30/19 1:13 PM, Ulf Hansson wrote:
> On Fri, 26 Apr 2019 at 09:46, Ludovic Barre <ludovic.Barre@st.com> wrote:
>>
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> This patch series adds busy detect for stm32 sdmmc variant.
>> Some adaptations are required:
>> -Avoid to check and poll busy status when is not expected.
>> -Clear busy status bit if busy_detect_flag and busy_detect_mask are
>>   different.
>> -Add hardware busy timeout with MMCIDATATIMER register.
>>
>> V2:
>> -mmci_cmd_irq cleanup in separate patch.
>> -simplify the busy_detect_flag exclude
>> -replace sdmmc specific comment in
>> "mmc: mmci: avoid fake busy polling in mmci_irq"
>> to focus on common behavior
>>
>> Ludovic Barre (5):
>>    mmc: mmci: cleanup mmci_cmd_irq for busy detect feature
>>    mmc: mmci: avoid fake busy polling in mmci_irq
>>    mmc: mmci: fix clear of busy detect status
>>    mmc: mmci: add hardware busy timeout feature
>>    mmc: mmci: add busy detect for stm32 sdmmc variant
>>
>>   drivers/mmc/host/mmci.c | 61 ++++++++++++++++++++++++++++++++++++++-----------
>>   drivers/mmc/host/mmci.h |  3 +++
>>   2 files changed, 51 insertions(+), 13 deletions(-)
>>
>> --
>> 2.7.4
>>
> 
> Ludovic, just wanted to let you know that I am reviewing and testing
> this series.
> 
> However, while running some tests on Ux500 for validating the busy
> detection code, even without your series applied, I encounter some odd
> behaviors. I am looking into the problem to understand better and will
> let you know as soon as I have some more data to share.

Oops, don't hesitate to share your status, if I could help.

> 
> Kind regards
> Uffe
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
