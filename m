Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA00A8706
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2019 19:31:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95494C35E01;
	Wed,  4 Sep 2019 17:31:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2A97C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2019 17:31:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x84HQYBs024035; Wed, 4 Sep 2019 19:30:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vsh43LmBMTIDm6eOyuvc4z7dAvyDF4r1QZqCzSzuG7Q=;
 b=SUPC6f7Cf7kO/BGTncmewkyVgRO6+E7MzkwNUKMsfDJOmgOQ9Oqs4lz0fcB31pBPm+Bb
 qGn4/2c1TgZ6AdnAWYX/9yzAajXUJFMec9GBIs6hYSlKD/YKO1wJS6j6UEhIE0edJ8Sf
 52oVVLCHrJcbOEkhN3UpbIKPNY2HGHT17ZcVCQmcBpZBIic8HBNG8vatVqpOSKfFY0I7
 4ijCi/AKLwCzbD2Evosuo0flSKHU5zYRsQ3HsRWpuEE0XreGvRBSlxdvCQUCrm8Wjlcs
 nO+GUUxEx0+s55WsL4rSuT6kbEYFxjfd27d3qpBQ4x6KxCRla8fPCL5ZMFk/XryMmBB3 2g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqenvar2k-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 04 Sep 2019 19:30:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 60D7722;
 Wed,  4 Sep 2019 17:30:53 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94CEF2D78C4;
 Wed,  4 Sep 2019 19:30:52 +0200 (CEST)
Received: from [10.48.0.131] (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Sep
 2019 19:30:51 +0200
To: Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, xiang xiao
 <xiaoxiang781216@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <1567602594-2913-1-git-send-email-arnaud.pouliquen@st.com>
 <1567602594-2913-2-git-send-email-arnaud.pouliquen@st.com>
 <704fadc2-3a62-5d23-6959-2495b497b3f9@ti.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <399f278a-13a9-7dc8-a232-8b0ac737abdb@st.com>
Date: Wed, 4 Sep 2019 19:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <704fadc2-3a62-5d23-6959-2495b497b3f9@ti.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-04_05:2019-09-04,2019-09-04 signatures=0
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Linux-stm32] [PATCH v6 1/2] rpmsg: core: add API to get
	message length
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

Hi Suman

On 9/4/19 6:36 PM, Suman Anna wrote:
> Hi Arnaud,
> 
> On 9/4/19 8:09 AM, Arnaud Pouliquen wrote:
>> Return the rpmsg buffer size for sending message, so rpmsg users
>> can split a long message in several sub rpmsg buffers.
> 
> Couple more minor comments..
> 
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
>> +
>> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>> +{
>> +	if (WARN_ON(!ept))
>> +		return -EINVAL;
>> +	if (!ept->ops->get_mtu)
>> +		return -ENOTSUPP;
>> +
>> +	return ept->ops->get_mtu(ept);
>> +}
>> +EXPORT_SYMBOL(rpmsg_get_mtu);
>> +
>>   /*
>>    * match an rpmsg channel with a channel info struct.
>>    * this is used to make sure we're not creating rpmsg devices for channels
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>> index 3fc83cd50e98..12b9e72adc75 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -47,6 +47,7 @@ struct rpmsg_device_ops {
>>    * @trysendto:		see @rpmsg_trysendto(), optional
>>    * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>>    * @poll:		see @rpmsg_poll(), optional
>> + * @get_mtu:		see @get_mpu(), required
> 
> see @rpmsg_get_mtu(). Isn't this optional atm, since we haven't added
> the callback for SMD transport?

It is a good point.
On one side, if optional, rpmsg_get_mtu returns an error and the rpmsg 
client has to define a default value, but which one?
On the other, if required, i need to implement it for SMD and Glink 
driver. Calculate the mtu for these implementations does not seems 
trivial (if possible...). And i don't know how to test dev on these 
platforms.

Any suggestions?

Regards
Arnaud

> 
>>    *
>>    * Indirection table for the operations that a rpmsg backend should implement.
>>    * In addition to @destroy_ept, the backend must at least implement @send and
>> @@ -66,6 +67,7 @@ struct rpmsg_endpoint_ops {
>>   			     void *data, int len);
>>   	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>>   			     poll_table *wait);
>> +	ssize_t (*get_mtu)(struct rpmsg_endpoint *ept);
>>   };
>>   
>>   int rpmsg_register_device(struct rpmsg_device *rpdev);
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 376ebbf880d6..fab01b67a550 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -175,6 +175,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>>   				  int len, u32 dst);
>>   static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>   					   u32 dst, void *data, int len);
>> +static ssize_t virtio_rpmsg_get_buf_mtu(struct rpmsg_endpoint *ept);
>>   
>>   static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>   	.destroy_ept = virtio_rpmsg_destroy_ept,
>> @@ -184,6 +185,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>   	.trysend = virtio_rpmsg_trysend,
>>   	.trysendto = virtio_rpmsg_trysendto,
>>   	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
>> +	.get_mtu = virtio_rpmsg_get_buf_mtu,
>>   };
>>   
>>   /**
>> @@ -699,6 +701,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>   	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>>   }
>>   
>> +static ssize_t virtio_rpmsg_get_buf_mtu(struct rpmsg_endpoint *ept)
>> +{
>> +	struct rpmsg_device *rpdev = ept->rpdev;
>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>> +
>> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>> +}
>> +
>>   static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>   			     struct rpmsg_hdr *msg, unsigned int len)
>>   {
>> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
>> index 9fe156d1c018..9d638bf2bdce 100644
>> --- a/include/linux/rpmsg.h
>> +++ b/include/linux/rpmsg.h
>> @@ -135,6 +135,8 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>   __poll_t rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>   			poll_table *wait);
>>   
>> +ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept);
>> +
>>   #else
>>   
>>   static inline int register_rpmsg_device(struct rpmsg_device *dev)
>> @@ -242,6 +244,14 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>>   	return 0;
>>   }
>>   
>> +static ssize_t rpmsg_get_mtu(struct rpmsg_endpoint *ept)
> 
> static inline
> 
> regards
> Suman
> 
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return -ENXIO;
>> +}
>> +
>>   #endif /* IS_ENABLED(CONFIG_RPMSG) */
>>   
>>   /* use a macro to avoid include chaining to get THIS_MODULE */
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
