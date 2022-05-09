Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8DA51F7D1
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 11:18:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 719F4C5F1D3;
	Mon,  9 May 2022 09:18:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44ED0C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 09:18:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2498UabE017146;
 Mon, 9 May 2022 11:18:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=C3wiR7qnEracRhKpAOx6YtBI+f6gCjQnqQN7TEosXEg=;
 b=z4glVLFgaqVLSpAbV0C/Y+xgGVW14z9XjRfrPXP0nwtS45E5FSNi+uyJ9oBpuwwQUR4e
 wUtLT/i/oAVJlHVSDSNJFCL6o6+4D3U1OgiwE9iILIjv6P38TwsaA7taUkCGWawqhEcz
 u2lT3y5wAPOJ6XVvqYHmcdgAH91TJ+gcD7v/y+8wKHDnx1Xldzfk6Qx+eOBSlMJlUohX
 YIeft7N+pD7u5McO6wc3zT01184mjh86EKB9hgvzTyC6OvKVTuqJBivhNI1AMihC1uf5
 I4gA97fE/1SJI1jhW6LgaZC5r/j3I3C32YBTrEJrNAzKJJ6d73MdIzIM9q8e4J7Sz/BC MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw8tfu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 May 2022 11:18:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E0B78100038;
 Mon,  9 May 2022 11:18:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D793C21513B;
 Mon,  9 May 2022 11:18:34 +0200 (CEST)
Received: from [10.201.20.246] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 9 May
 2022 11:18:34 +0200
Message-ID: <b7a3db59-201d-a5fb-f416-e1d60d79762f@foss.st.com>
Date: Mon, 9 May 2022 11:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220315153856.3117676-1-arnaud.pouliquen@foss.st.com>
 <20220506171222.GA2816011@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220506171222.GA2816011@p14s>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-09_03,2022-05-09_01,2022-02-23_01
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: set dst address on first
	message received
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

Hello Mathieu,

On 5/6/22 19:12, Mathieu Poirier wrote:
> On Tue, Mar 15, 2022 at 04:38:56PM +0100, Arnaud Pouliquen wrote:
>> when a rpmsg channel has been locally created with a destination address
> 
> s/when/Wen
> 
> Also, please be more specific about the "locally created" part, i.e
> rpmsg_ctrldev_ioctl() -> rpmsg_create_channel().  Otherwise it is really hard to
> understand the context of this change.
> 
>> set to RPMSG_ADDR_ANY, a name service announcement message is sent to
>> the remote side. Then the destination address is never updated, making it
>> impossible to send messages to the remote.
>>
>> An example of kernel trace observed:
>> rpmsg_tty virtio0.rpmsg-tty.29.-1: invalid addr (src 0x1d, dst 0xffffffff)
>>
>> Implement same strategy than the open-amp library:
>> On the reception of the first message, if the destination address is
>> RPMSG_ADDR_ANY, then set it to address of the remote endpoint that
>> send the message.
>>
> 
> I would have expected a "Fixes:" tag.

Difficult to give a reference. For me the issue exists since the creation
of the rpmsg virtio bus. A driver can create a channel that generates a NS
announcement leading to this issue.
The issue as been highlighted by the creation of the  RPMSG_CREATE_DEV_IOCTL
control.

> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>
>> ---
>> Remark:
>> An alternative (or a complement?) could be to add a NS bind/unbind in
>> the NS announcement channel (in rpmsg_ns.c).
>> This would allow the local and/or the remote processor to inform the
>> remote side the the service announced in bound.
>> ---
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 3ede25b1f2e4..99d2119cc164 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -708,6 +708,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>>  static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>  			     struct rpmsg_hdr *msg, unsigned int len)
>>  {
>> +	struct rpmsg_device *rpdev;
>>  	struct rpmsg_endpoint *ept;
>>  	struct scatterlist sg;
>>  	bool little_endian = virtio_is_little_endian(vrp->vdev);
>> @@ -746,6 +747,15 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>  	mutex_unlock(&vrp->endpoints_lock);
>>  
>>  	if (ept) {
>> +		rpdev = ept->rpdev;
>> +		if (rpdev->ept == ept && rpdev->dst == RPMSG_ADDR_ANY) {
> 
> Please add a comment to explain the first part of the if() clause.  It took me
> quite some time to understand. 
> 
>> +			/*
>> +			 * First message received from the remote side on the default endpoint,
>> +			 * update channel destination address.
>> +			 */
>> +			rpdev->dst = msg->src;
> 
> This triggers a bot warning and should be addressed.  If it can't be addressed add
> a comment that clearly explains why so that we don't end up receiving patches
> for it every 4 weeks.

Oops, I missed it, thanks for pointing it out.


Concerning the patch itself as discussed in RP open-amp meeting. I wonder if this issue
could be addressed by the flow control[1][2][3], or if needed in any case.

I propose to send a V2 when ready to propose in parallel the flow control.
So both can be addressed at same time to have a global picture of the way to address the
use case..

Thanks,
Arnaud

[1] POC Linux code:
https://github.com/arnopo/linux/commits/signalling

[2] openamp library associated code:
https://github.com/arnopo/open-amp/commits/flow_ctrl

[3] overview presentation
https://drive.google.com/file/d/1CLU3ybI3oSBGvor18AQ-HOzOJ2nOppEb/view


> 
> Thanks,
> Mathieu
> 
>> +		}
>> +
>>  		/* make sure ept->cb doesn't go away while we use it */
>>  		mutex_lock(&ept->cb_lock);
>>  
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
