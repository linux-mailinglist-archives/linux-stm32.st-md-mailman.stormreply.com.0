Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E54A6608
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Sep 2019 11:49:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78A78C35E01;
	Tue,  3 Sep 2019 09:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF53BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2019 09:49:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x839f35N006869; Tue, 3 Sep 2019 11:49:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=qAPgp0EL893ZaRTISydhUDXeZQ3+/E80TJjDmAJXx5Q=;
 b=taVd6utEbIlSPk9e7arumd8UuD3ssEO0SJK3MH5YmXM9d014PMtOZ8akkZexU97nSoBW
 qCY0RtB1BO/hT3GCsV/w0W2yB2GJDXSBJjPAXmX/VJxXLiBmMqtwSy5OsAFGlzbinslj
 pYrgzpjQYvWOqMFAnRoxKotHeh46F0pulaADwR9ICuu1cszefzmtvEXZqHyVby/yvaw8
 /amMaZEeVAi4eYRsZPqkmBYQMf8dE0eimPs238Km9db/PAIw6Dqnx2X0oW4RXlMs3g9Y
 q5V91LXy4lOoaZVTUjyIN9GkiM5gN/PwApPElwjzUwcDqWMKMHecdImkDzn07l8NZ5sk Nw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uqenv1y63-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 03 Sep 2019 11:49:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D29223;
 Tue,  3 Sep 2019 09:49:28 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EFD722C2A0B;
 Tue,  3 Sep 2019 11:49:27 +0200 (CEST)
Received: from [10.48.0.131] (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Sep
 2019 11:49:27 +0200
To: Suman Anna <s-anna@ti.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, xiang xiao
 <xiaoxiang781216@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <1567005566-10986-1-git-send-email-arnaud.pouliquen@st.com>
 <1567005566-10986-2-git-send-email-arnaud.pouliquen@st.com>
 <7dc4d1cf-4f15-19ab-b8dd-424175f2a11a@ti.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <f6f2ad3e-123a-268b-2586-544752c54db7@st.com>
Date: Tue, 3 Sep 2019 11:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7dc4d1cf-4f15-19ab-b8dd-424175f2a11a@ti.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-03_01:2019-09-03,2019-09-03 signatures=0
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com,
 Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [Linux-stm32] [PATCH v5 1/2] rpmsg: core: add API to get
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

hi Suman

On 8/29/19 12:34 AM, Suman Anna wrote:
> Hi Arnaud,
> 
> On 8/28/19 10:19 AM, Arnaud Pouliquen wrote:
>> Return the rpmsg buffer size for sending message, so rpmsg users
>> can split a long message in several sub rpmsg buffers.
> 
> Thanks for the patch, I also have a need for the same to be able to
> compute permissible payload size. Minor comments below.

Thanks for your review. i will update it ASAP. Then if you need it and 
ack it, i suppose that we could request Bjorn to integrate it in a first 
step, if the rpmsg tty driver has not a level of quality sufficient to 
be accepted...

Regards
Arnaud
> 
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>> V4 to V5 :
>>    - rename rpmsg_get_buf_payload_size to rpmsg_get_mtu
>>
>>   drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>   drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>   drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>   include/linux/rpmsg.h            | 10 ++++++++++
>>   4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index 8122807db380..daca2e24fc71 100644
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
>> +	if (!ept->ops->get_buf_mtu)
> 
> How about calling the ops just get_mtu or rename the function to follow
> the ops name, like all the others.
> 
>> +		return -ENXIO;
> 
> Perhaps ENOTSUPP or EOPNOTSUPP.
> 
>> +
>> +	return ept->ops->get_buf_mtu(ept);
>> +}
>> +EXPORT_SYMBOL(rpmsg_get_mtu);
>> +
>>   /*
>>    * match an rpmsg channel with a channel info struct.
>>    * this is used to make sure we're not creating rpmsg devices for channels
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>> index 0d791c30b7ea..645c402569ac 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -46,6 +46,7 @@ struct rpmsg_device_ops {
>>    * @trysend:		see @rpmsg_trysend(), required
>>    * @trysendto:		see @rpmsg_trysendto(), optional
>>    * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
>> + * @get_buf_payload_size: see @rpmsg_get_buf_payload_size(), optional
> 
> Missed updating the kerneldoc to the new name.
> 
>>    *
>>    * Indirection table for the operations that a rpmsg backend should implement.
>>    * In addition to @destroy_ept, the backend must at least implement @send and
>> @@ -65,6 +66,7 @@ struct rpmsg_endpoint_ops {
>>   			     void *data, int len);
>>   	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
>>   			     poll_table *wait);
>> +	ssize_t (*get_buf_mtu)(struct rpmsg_endpoint *ept);
>>   };
>>   
>>   int rpmsg_register_device(struct rpmsg_device *rpdev);
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index e757f0038a1c..f80b1ad23e7e 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -178,6 +178,7 @@ static int virtio_rpmsg_trysendto(struct rpmsg_endpoint *ept, void *data,
>>   				  int len, u32 dst);
>>   static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>   					   u32 dst, void *data, int len);
>> +static ssize_t virtio_get_buf_mtu(struct rpmsg_endpoint *ept);
> 
> Minor nit, virtio_rpmsg_ prefix similar to all the other ops.
> 
> regards
> Suman
> 
>>   
>>   static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>   	.destroy_ept = virtio_rpmsg_destroy_ept,
>> @@ -187,6 +188,7 @@ static const struct rpmsg_endpoint_ops virtio_endpoint_ops = {
>>   	.trysend = virtio_rpmsg_trysend,
>>   	.trysendto = virtio_rpmsg_trysendto,
>>   	.trysend_offchannel = virtio_rpmsg_trysend_offchannel,
>> +	.get_buf_mtu = virtio_get_buf_mtu,
>>   };
>>   
>>   /**
>> @@ -702,6 +704,14 @@ static int virtio_rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src,
>>   	return rpmsg_send_offchannel_raw(rpdev, src, dst, data, len, false);
>>   }
>>   
>> +static ssize_t virtio_get_buf_mtu(struct rpmsg_endpoint *ept)
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
