Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62F13A36B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2020 10:06:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA773C36B0D;
	Tue, 14 Jan 2020 09:06:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50C77C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 09:06:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00E92VkQ012743; Tue, 14 Jan 2020 10:06:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=jtwGEjUtyuxEZq8hdbqmLv/Jf7tRXlP+PuuoBmxhh+o=;
 b=CSrmp1u9fXkvyI4/vCQ+5KOO0gZw9Z/uTwtwABr6pdxsZ1jmyEh9v2gQ+0/zGc8juri9
 2NDeCMjRgdgOn053FuHQn3xNJ1DmiYc4rFnI5XbAXEKqi15cx+o26HUlSag9j1XxevTP
 W5gD7z1s4/yUak8bG5kUl3ZaSg91WEWwXjOniE8b8zat6droZlcYopicCHGEHt+7Gxv+
 tKEzS2bwgK9a+vdiLxW9K+EQwpdCRSUCJ5VeuVlvxBOlR8DLD4TPqllWafqJ38cuGMEN
 x9pQ+0OqLU7SEW/5Rf2LYxwQDxVq9Sb/po/iINFGAQoaLKuEflxuuPh7SEl28dJrPtsv XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jpcen3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jan 2020 10:06:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BD11010002A;
 Tue, 14 Jan 2020 10:06:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A171B211F21;
 Tue, 14 Jan 2020 10:06:39 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jan
 2020 10:06:39 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
 <20200113172453.GQ738324@yoga>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <c6ecd3b6-2a3b-11d8-6d1c-a531c73bc388@st.com>
Date: Tue, 14 Jan 2020 10:06:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113172453.GQ738324@yoga>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-14_02:2020-01-13,
 2020-01-14 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] rpmsg: core: add API to get MTU
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

Hi Bjorn

On 1/13/20 6:24 PM, Bjorn Andersson wrote:
> On Wed 13 Nov 09:22 PST 2019, Arnaud Pouliquen wrote:
> 
>> Return the rpmsg buffer MTU for sending message, so rpmsg users
>> can split a long message in several sub rpmsg buffers.
>>
> 
> I won't merge this new api without a client, and I'm still concerned
> about the details.
The client exists: it is the rpmsg tty that i 've been rying to upstream since for a while.
https://patchwork.kernel.org/cover/11130213/
This patch is the result of some comments you did on rpmsg tty thread. 
Suman was also interested in and request to merge it independently
(https://lkml.org/lkml/2019/9/3/774).
That's why i'm trying to do it in 2 steps.

> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  V1 to V2
>>
>>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>>   - Change patch title,
>>   - as not solution today to support MTU on GLINK make ops optional,
>>     RPMsg client API returns -ENOTSUPP in this case,
>>   - suppress smd and glink patches.
> 
> That's ok.
> 
>> ---
>>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>  include/linux/rpmsg.h            | 10 ++++++++++
>>  4 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>> index e330ec4dfc33..a6ef54c4779a 100644
>> --- a/drivers/rpmsg/rpmsg_core.c
>> +++ b/drivers/rpmsg/rpmsg_core.c
>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>  }
>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>  
>> +/**
>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>> + * @ept: the rpmsg endpoint
>> + *
>> + * This function returns maximum buffer size available for a single message.
>> + *
>> + * Return: the maximum transmission size on success and an appropriate error
>> + * value on failure.
> 
> Is the expectation that a call to rpmsg_send() with this size will
> eventually succeed?
yes, this should be the role of the transport layer
(e.g. RPMsg VirtIO bus) to ensure this.

> 
>> + */
> [..]
>> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>> +{
>> +	struct rpmsg_device *rpdev = ept->rpdev;
>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>> +
>> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> 
> I'm still under the impression that the rpmsg protocol doesn't have to
> operate on fixed size messages. Would this then return vrp->num_bufs *
> vrp->buf_size / 2 - sizeof(rpmsg_hdr)?
it depends on the transport layer. For RPMsg over virtio, this is the size
of the payload of a buffer so vrp->buf_size  - sizeof(rpmsg_hdr)

Regards,
Arnaud

> 
>> +}
>> +
> 
> Regards,
> Bjorn
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
