Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D17B4AA7D7
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2019 18:02:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1566C35E01;
	Thu,  5 Sep 2019 16:02:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 183D7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2019 16:02:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x85G1k8B024599; Thu, 5 Sep 2019 18:02:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=9aNLD8I30iSCXYQuoK3fnEQebuHYYFccizzyDOOMuIA=;
 b=tIYrAWARMx++UdA4uU7k6oR72UH7TwVXEoFVmS4UiBNxJEO+PInhoDnJaWSka5FNyje+
 lYEgpKfMCcMNpa4WK5KbhQyHtAm2nroBwpHXNci89kpwnEoKo5VngQT7XklD+rggnmU4
 O/BWljUvIok0S0s5kjjhNoAltc0ejt3Z/vZ2+ihIrZFCHcWG4CMgBxHDSIX5r7RKzNsz
 2UlqId7PszmPkwwqgCB5tVBxZJxji+Y2bvn1RLiO8C8gySQBh3LfO2I/1MQS/wWP32xq
 6zyhtYPJcGs5Gak5CN9a5DlBAEne5Vgur7nEgERl2kyVbOgI7QbMMcUYPeKdl2UMDuXh /g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uqfsj90jk-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 05 Sep 2019 18:02:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D40A64E;
 Thu,  5 Sep 2019 16:02:01 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 382102FF5EA;
 Thu,  5 Sep 2019 18:02:01 +0200 (CEST)
Received: from [10.48.0.131] (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Sep
 2019 18:02:00 +0200
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
 <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
 <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <8e87ccff-1bdb-255c-0be4-db34869f0d13@st.com>
Date: Thu, 5 Sep 2019 18:02:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_05:2019-09-04,2019-09-05 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, MSM <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] rpmsg: core: add API to get message
	length
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

Hi Jeffrey,


On 9/5/19 4:42 PM, Jeffrey Hugo wrote:
> On Thu, Sep 5, 2019 at 8:35 AM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>>
>> Return the rpmsg buffer size for sending message, so rpmsg users
>> can split a long message in several sub rpmsg buffers.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>   drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>   drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>   drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>   include/linux/rpmsg.h            | 10 ++++++++++
>>   4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index e330ec4dfc33..a6ef54c4779a 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>   }
>>   EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>
>> +/**
>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>> + * @ept: the rpmsg endpoint
>> + *
>> + * This function returns maximum buffer size available for a single message.
>> + *
>> + * Return: the maximum transmission size on success and an appropriate error
>> + * value on failure.
>> + */
> 
> What is the intent of this?
> 
> The term "mtu" is "maximum transfer unit" - ie the largest payload of
> data that could possibly be sent, however at any one point in time,
> that might not be able to be accommodated.
I was not aware that the MTU has to be static in time. And I'm not 
enough expert to be able challenge this.
The use of the MTU initially came from a Bjorn request and IMHO makes 
sense in RPMSG protocol as other protocols. The aim here is not to 
guaranty the available size but to provide to rpmsg client a packet size 
information that is not available today at rpmsg client level.
For instance for the virtio rpmsg bus we provide the size of a vring 
buffer, not the total size available in the vring.

> 
> I don't think this is implemented correctly.  In GLINK and SMD, you've
> not implemented MTU, you've implemented "how much can I send at this
> point in time".  To me, this is not mtu.
If MTU has to be static i agree with you.
> 
> In the case of SMD, you could get the fifo size and return that as the
> mtu, but since you seem to be wanting to use this from the TTY layer
> to determine how much can be sent at a particular point in time, I
> don't think you actually want mtu.
Please forget the TTY for the moment, The mtu is used to help the tty 
framework to split the buffer to write. The size is then adjusted on write.
For SMD i can provide the fifo_size,or a division of this size to 
"limit" congestion.
would this make sense for you?
> 
> For GLINK, I don't actually think you can get a mtu based on the
> design, but I'm trying to remember from 5-6 years ago when we designed
> it.  It would be possible that a larger intent would be made available
> later.
Is it possible to have the largest intent? or it's not deterministic.
> 
> I think you need to first determine if you are actually looking for
> mtu, or "how much data can I send right now", because right now, it
> isn't clear.
> 
In my view it is the MTU. "how much data can I send right now" is an 
information that is very volatile as buffers can be shared between 
several clients, therefore unusable.

An alternative would be to make this ops optional, but that would mean
that some generic clients would not be compatible with SMD and/or Glink 
drivers.

Thanks,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
