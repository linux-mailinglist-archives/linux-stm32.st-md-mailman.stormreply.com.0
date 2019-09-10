Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2AEAE766
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2019 11:57:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 742EFC35E01;
	Tue, 10 Sep 2019 09:57:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6681C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 09:57:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8A9uDBj023826; Tue, 10 Sep 2019 11:56:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ErUgIUS2VY+/8qf6Vv9yQV5SKk6g/uDQJFIeqna0UrM=;
 b=QxUSuXEe0+XePhIbyucyVpq3ALGS95czxcVswPVyEkvw/Zyf2UW8mE+lRvXItfxFpuc3
 KAqhRoAhwjObnJEjd2Q4DrSbpUMIDwMzetRIhP2ezl1Q2uOo728eVkaRsysWLvddcbUb
 U5Ll/XBoRJR1+Dv14VJeR0KKo0iOBYvSZSJPZVF+jv5UeHWcYrq+jzK0JdJe6EmmLLbe
 ajjgEzdjt6Ll/jG9680dT5UEdM5R1A3R1ic/EnhhypZQ7jBhYluYT3YIIP0v0zQqHpCC
 9DUxZhQiWPqalSkNsUZu+M3DSOkLh1nRjH+vKF4Apbt1wGnLjFvmPM1ZqmMZdmAH/Y4B sA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uv212keu4-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 10 Sep 2019 11:56:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 45AE022;
 Tue, 10 Sep 2019 09:56:55 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99E802BA3FF;
 Tue, 10 Sep 2019 11:56:54 +0200 (CEST)
Received: from [10.48.0.131] (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Sep
 2019 11:56:53 +0200
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
References: <1567693630-27544-1-git-send-email-arnaud.pouliquen@st.com>
 <1567693630-27544-2-git-send-email-arnaud.pouliquen@st.com>
 <CAOCk7Nrja=31soMB+MhcrxhGHMT+bj9U+3_h6cTLo3+AAsFKqQ@mail.gmail.com>
 <8e87ccff-1bdb-255c-0be4-db34869f0d13@st.com>
 <CAOCk7NraQwa2O=tptWk9enKdvta+eOCJ6ZZ=v6xOE-tocGdgpA@mail.gmail.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <158df963-4cec-a454-d335-24a9b93f74cd@st.com>
Date: Tue, 10 Sep 2019 11:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7NraQwa2O=tptWk9enKdvta+eOCJ6ZZ=v6xOE-tocGdgpA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-10_07:2019-09-09,2019-09-10 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, MSM <linux-arm-msm@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>,
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



On 9/5/19 6:18 PM, Jeffrey Hugo wrote:
> On Thu, Sep 5, 2019 at 10:02 AM Arnaud Pouliquen
> <arnaud.pouliquen@st.com> wrote:
>>
>> Hi Jeffrey,
>>
>>
>> On 9/5/19 4:42 PM, Jeffrey Hugo wrote:
>>> On Thu, Sep 5, 2019 at 8:35 AM Arnaud Pouliquen <arnaud.pouliquen@st.com> wrote:
>>>>
>>>> Return the rpmsg buffer size for sending message, so rpmsg users
>>>> can split a long message in several sub rpmsg buffers.
>>>>
>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>>> ---
>>>>    drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>>>    drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>>>    drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>>>    include/linux/rpmsg.h            | 10 ++++++++++
>>>>    4 files changed, 43 insertions(+)
>>>>
>>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>>> index e330ec4dfc33..a6ef54c4779a 100644
>>>> --- a/drivers/rpmsg/rpmsg_core.c
>>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>>    }
>>>>    EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>>>
>>>> +/**
>>>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>>>> + * @ept: the rpmsg endpoint
>>>> + *
>>>> + * This function returns maximum buffer size available for a single message.
>>>> + *
>>>> + * Return: the maximum transmission size on success and an appropriate error
>>>> + * value on failure.
>>>> + */
>>>
>>> What is the intent of this?
>>>
>>> The term "mtu" is "maximum transfer unit" - ie the largest payload of
>>> data that could possibly be sent, however at any one point in time,
>>> that might not be able to be accommodated.
>> I was not aware that the MTU has to be static in time. And I'm not
>> enough expert to be able challenge this.
>> The use of the MTU initially came from a Bjorn request and IMHO makes
>> sense in RPMSG protocol as other protocols. The aim here is not to
>> guaranty the available size but to provide to rpmsg client a packet size
>> information that is not available today at rpmsg client level.
>> For instance for the virtio rpmsg bus we provide the size of a vring
>> buffer, not the total size available in the vring.
>>
>>>
>>> I don't think this is implemented correctly.  In GLINK and SMD, you've
>>> not implemented MTU, you've implemented "how much can I send at this
>>> point in time".  To me, this is not mtu.
>> If MTU has to be static i agree with you.
>>>
>>> In the case of SMD, you could get the fifo size and return that as the
>>> mtu, but since you seem to be wanting to use this from the TTY layer
>>> to determine how much can be sent at a particular point in time, I
>>> don't think you actually want mtu.
>> Please forget the TTY for the moment, The mtu is used to help the tty
>> framework to split the buffer to write. The size is then adjusted on write.
>> For SMD i can provide the fifo_size,or a division of this size to
>> "limit" congestion.
>> would this make sense for you?
> 
> Historically, TTY over SMD (I'm basing this on my experience with the
> downstream code) has operated in a streaming fasion, where it attempts
> to put as much data as will fit in the fifo at that point in time.  So
> you would have a "write_size_avail" operation that returns the amount
> of free space in the fifo, and then the TTY client would attempt to
> write that amount of data into the fifo.
> 
> In sort, the fifo size is the maximum that could be put into the
> transport, but at any one point in time, there may be data sitting in
> the fifo that the remote end has not yet procesed, which would limit
> the amount of data you could put in the fifo to fifo_size - size of
> data currently sitting in the fifo.
Regarding __qcom_smd_send function. if message length is higher than 
fifo_size EINVAL error is returned, else if send failed EAGAIN error is 
returned ( meaning that it is busy and that client has to retry to sent 
it later).
Based on this behavior, seems make sense to return channel->fifo_size
as MTU value.

> 
> SMD channels have dedicated fifos, and are assumed to be used for a
> single client.  If the channel is muxed between multiple clients, and
> you want to manage "congestion", that would need to be managed at a
> layer above SMD.
Yes this is the flow control that could have to be in core or splitted 
between the core and the platform driver. We had a first discussion with 
Bjorn few month ago on this subject, the need was identified.

>>>
>>> For GLINK, I don't actually think you can get a mtu based on the
>>> design, but I'm trying to remember from 5-6 years ago when we designed
>>> it.  It would be possible that a larger intent would be made available
>>> later.
>> Is it possible to have the largest intent? or it's not deterministic.
> 
> Not really.  I think GLINK defines a maximum size that it can handle
> as an intent (something like uint32_max), however there is no
> guarantee that any particular client will support that.  If you
> attempt to have the MTU as the max that GLINK supports, and a client
> never queues an intent that large, the data will never be able to be
> transmitted.  The MTU is really based on the the whims of the remote
> side, and I don't recall if there is a way in the GLINK protocol to
> query that.  If I recall correctly, there is a way to request the
> remote side queue an intent of a specific size, which the remote side
> can either do (success) or reject the request (failure).
> 
> In my mind, there should be a valid scenario in which a client can
> transmit data of a size equal to the MTU (although the client may need
> to wait for that to happen), however I don't have a simple answer on
> how to determine that value in a generic way for GLINK.

So no simple way for GLINK :(, anyway thanks for you time and your 
expertise.

> 
>>>
>>> I think you need to first determine if you are actually looking for
>>> mtu, or "how much data can I send right now", because right now, it
>>> isn't clear.
>>>
>> In my view it is the MTU. "how much data can I send right now" is an
>> information that is very volatile as buffers can be shared between
>> several clients, therefore unusable.
> 
> Thats valid.  If you want MTU, then I think you need to fix the
> GLINK/SMD implementations since those are not providing the correct
> information.  Unfortunately, GLINK is complicated.  I think Bjorn
> should chime in on what he thinks would be valid behavior for GLINK.
> 
An alternative could be a DT property that could be defined depending on 
the remote side constraint.

Bjorn,
please, could you share your view to help to find a solution to 
implement the MTU for Glink? or should we simply consider the MTU ops as 
optional and in this case how to determine a default size?

Thanks,
Arnaud


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
