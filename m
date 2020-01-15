Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C8E13B62A
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 00:52:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0D4DC36B0F;
	Tue, 14 Jan 2020 23:52:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04EC2C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2020 23:52:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00ENqbjh091809;
 Tue, 14 Jan 2020 17:52:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1579045957;
 bh=EV+SZqSB5hyndsCzQOz7pyuWRNEJtahXq1ja5MBaalA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=p48aSBNtFvdkXakiOwl5Ombj7qIf5gHH/8fzfozIhAOBtFqL7MG1w6SItLYRHH5zb
 lUQSyhjV8HDlES1Dkoh0wE0GlKeBSPHvWFGyNwhVI3g8Mysyro4OyLsAXd3bi+nSmw
 71qTjaX7Hn8t+e7JrS65KqkNIUCatrq9syx0eHVU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00ENqbGl100760
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Jan 2020 17:52:37 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 14
 Jan 2020 17:52:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 14 Jan 2020 17:52:37 -0600
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00ENqaHP128032;
 Tue, 14 Jan 2020 17:52:37 -0600
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
References: <20191113172249.32412-1-arnaud.pouliquen@st.com>
 <20200113172453.GQ738324@yoga> <c6ecd3b6-2a3b-11d8-6d1c-a531c73bc388@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <c199d1ba-53c4-b79c-1dd0-b01ef12dbb48@ti.com>
Date: Tue, 14 Jan 2020 17:52:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c6ecd3b6-2a3b-11d8-6d1c-a531c73bc388@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>,
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

On 1/14/20 3:06 AM, Arnaud POULIQUEN wrote:
> Hi Bjorn
> 
> On 1/13/20 6:24 PM, Bjorn Andersson wrote:
>> On Wed 13 Nov 09:22 PST 2019, Arnaud Pouliquen wrote:
>>
>>> Return the rpmsg buffer MTU for sending message, so rpmsg users
>>> can split a long message in several sub rpmsg buffers.
>>>
>>
>> I won't merge this new api without a client, and I'm still concerned
>> about the details.
> The client exists: it is the rpmsg tty that i 've been rying to upstream since for a while.
> https://patchwork.kernel.org/cover/11130213/
> This patch is the result of some comments you did on rpmsg tty thread. 
> Suman was also interested in and request to merge it independently
> (https://lkml.org/lkml/2019/9/3/774).
> That's why i'm trying to do it in 2 steps.
> 
>>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>>> ---
>>>  V1 to V2
>>>
>>>   V1 patch:https://lore.kernel.org/patchwork/patch/1124684/
>>>   - Change patch title,
>>>   - as not solution today to support MTU on GLINK make ops optional,
>>>     RPMsg client API returns -ENOTSUPP in this case,
>>>   - suppress smd and glink patches.
>>
>> That's ok.
>>
>>> ---
>>>  drivers/rpmsg/rpmsg_core.c       | 21 +++++++++++++++++++++
>>>  drivers/rpmsg/rpmsg_internal.h   |  2 ++
>>>  drivers/rpmsg/virtio_rpmsg_bus.c | 10 ++++++++++
>>>  include/linux/rpmsg.h            | 10 ++++++++++
>>>  4 files changed, 43 insertions(+)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
>>> index e330ec4dfc33..a6ef54c4779a 100644
>>> --- a/drivers/rpmsg/rpmsg_core.c
>>> +++ b/drivers/rpmsg/rpmsg_core.c
>>> @@ -283,6 +283,27 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>>>  }
>>>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>>>  
>>> +/**
>>> + * rpmsg_get_mtu() - get maximum transmission buffer size for sending message.
>>> + * @ept: the rpmsg endpoint
>>> + *
>>> + * This function returns maximum buffer size available for a single message.
>>> + *
>>> + * Return: the maximum transmission size on success and an appropriate error
>>> + * value on failure.
>>
>> Is the expectation that a call to rpmsg_send() with this size will
>> eventually succeed?
> yes, this should be the role of the transport layer
> (e.g. RPMsg VirtIO bus) to ensure this.
> 
>>
>>> + */
>> [..]
>>> +static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>>> +{
>>> +	struct rpmsg_device *rpdev = ept->rpdev;
>>> +	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>> +
>>> +	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>
>> I'm still under the impression that the rpmsg protocol doesn't have to
>> operate on fixed size messages. Would this then return vrp->num_bufs *
>> vrp->buf_size / 2 - sizeof(rpmsg_hdr)?

There was some discussion in the past to remove the 512 bytes
hard-coding and replace it with a configurable value, but that is not
yet done. There was some code restructuring towards the same, but it it
still fixed atm in virtio_rpmsg transport.

> it depends on the transport layer. For RPMsg over virtio, this is the size
> of the payload of a buffer so vrp->buf_size  - sizeof(rpmsg_hdr)

The vrp->num_bufs is the number of buffers available in the vring
transport, vrp->buf_size is the size for each transport buffer, and
every message includes the rpmsg_hdr structure, so the amount available
for rpmsg clients is less by that much.

regards
Suman
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
