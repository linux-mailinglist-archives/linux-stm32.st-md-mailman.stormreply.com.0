Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5293C45A3CB
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Nov 2021 14:31:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3A6CC5A4FD;
	Tue, 23 Nov 2021 13:31:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F304C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Nov 2021 13:31:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN9wKG0027706;
 Tue, 23 Nov 2021 14:31:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iwhWjxQDT+yFLIgL+6PycClD1TJGEcaSS6op1WcKbS4=;
 b=6j13W92wokqJWvTP4gg6x6knqJu/rYjCIGHzUi4rLkdc5svwZvVfS3VTdHrPlnMQ98/k
 BzSH5SwWhQpSbq/gginXikgDD1mwws1JNjEQhW2/FH7SiVI7h0tkIxgnUa8E6AQ98uF8
 B/VwJATC9sOuvbic79ybqrQsoyNIf0t6zKjim1Sv5OaQIDo8TJMvbpnI7g/mhp6P1jNl
 rn3N8KR/J6tukuJTsjIUtnBiwDYOM8oXAGfC/DElfn8JsUnYaFLIKUpz72yApnmYEf7s
 OvJ/HGKipk73EnnWM37B8F86e+19ZN1HKxAHW+Je2yZvj3T41HgVTFDKHhh6TKbIHhp+ sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cgc6p73eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 14:31:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1A74510002A;
 Tue, 23 Nov 2021 14:31:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 002022224BC;
 Tue, 23 Nov 2021 14:31:21 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 23 Nov
 2021 14:31:21 +0100
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211122160812.25125-1-arnaud.pouliquen@foss.st.com>
 <20211123011340-mutt-send-email-mst@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <43894114-6d25-98fa-a89f-b720749ba910@foss.st.com>
Date: Tue, 23 Nov 2021 14:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123011340-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_04,2021-11-23_01,2020-04-07_01
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Jason Wang <jasowang@redhat.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: virtio: don't let virtio core to
 validate used length
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

Hello Mickael, Jason,

On 11/23/21 7:15 AM, Michael S. Tsirkin wrote:
> On Mon, Nov 22, 2021 at 05:08:12PM +0100, Arnaud Pouliquen wrote:
>> For RX virtqueue, the used length is validated in all the three paths
>> (big, small and mergeable). For control vq, we never tries to use used
>> length. So this patch forbids the core to validate the used length.
> 
> Jason commented on this. This is copy paste from virtio net
> where the change was merely an optimization.
> 

Right, I did it too fast last night (European time) to share the regression as
soon as possible.
For that, I copied and pasted the first commit I found related to the problem.
Need to rework this.

>> Without patch the rpmsg client sample does not work.
> 
> Hmm that's not enough of a description. Could you please
> provide more detail? Does rpmsg device set used length to a
> value > dma read buffer size? what kind of error message
> do you get? what are the plans to fix the device?

Let's me explain the context.
I run the rpmsg client sample test to communicate with a remote processor
that runs a Zephyr FW designed to answer to the Linux kernel driver sample.

The Zephyr is relying on OpenAMP library to implement the RPMsg and VirtIO layers.

In TX direction (Linux to Zephyr) 8 buffers of 512 bytes are allocated.
The first 8 RPMsg sent are OK. But when virtio loop back the the TX buffer index
0 (so already used and free one time) the following error occurs in
virtqueue_get_buf_ctx_split[1]:
" virtio_rpmsg_bus virtio0: output:used len 28 is larger than in buflen 0"

I have investigated the problem further today. Here is my analysis

rpmsg_send_offchannel_raw
-> virtqueue_add_outbuf
   -> virtqueue_add
      -> virtqueue_add_split
	 Here we use the "out_sgs" (in_sgs == 0)
	 buflen is not incremented in loop [2]
	 We don't enter in loop [3] as "in_sgs == 0"
	 consequence is that vq->buflen[head] is set to 0 [4]

[1]
https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L799
[2]
https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L551
[3]
https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L567
[4]
https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/virtio/virtio_ring.c#L622


An alternative to fix the issue is to set buflen in loop 2, but I'm not enough
expert to ensure that this will not have any side effect...

@@ -559,10 +559,11 @@ static inline int virtqueue_add_split(struct virtqueue *_vq,
 			 * table since it use stream DMA mapping.
 			 */
 			i = virtqueue_add_desc_split(_vq, desc, i, addr, sg->length,
 						     VRING_DESC_F_NEXT,
 						     indirect);
+			buflen += sg->length;
 		}
 	}
 	for (; n < (out_sgs + in_sgs); n++) {

So can you tell me if you prefer me to send a V2 updating the commit message or
a new message to fix virtio_ring (or both)?

Thanks,
Arnaud

> 
>> Fixes: 939779f5152d ("virtio_ring: validate used buffer length")
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> ---
>> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
>> ---
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 9c112aa65040..5f73f19c2c38 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -1054,6 +1054,7 @@ static struct virtio_driver virtio_ipc_driver = {
>>  	.feature_table_size = ARRAY_SIZE(features),
>>  	.driver.name	= KBUILD_MODNAME,
>>  	.driver.owner	= THIS_MODULE,
>> +	.suppress_used_validation = true,
>>  	.id_table	= id_table,
>>  	.probe		= rpmsg_probe,
>>  	.remove		= rpmsg_remove,
>> -- 
>> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
