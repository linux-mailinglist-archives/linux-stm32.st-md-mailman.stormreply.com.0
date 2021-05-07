Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C023763DB
	for <lists+linux-stm32@lfdr.de>; Fri,  7 May 2021 12:34:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E94CBC59783;
	Fri,  7 May 2021 10:34:05 +0000 (UTC)
Received: from mail.iot.bzh (mail.iot.bzh [51.75.236.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23BFFC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 May 2021 08:17:09 +0000 (UTC)
Received: from localhost.localdomain
 (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
 by mail.iot.bzh (Postfix) with ESMTPSA id 540E740081;
 Fri,  7 May 2021 10:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
 t=1620375426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOiL5pdW+tmoprAzmKiGDKcT8zd1nbKFMEsR8wuMcZ4=;
 b=b67B7clEPcGra/TVXtB6WSPhKHJINHZKOL/7vq1MudpY/sQhF20KzEuTJuJkNF8TckPE2k
 spgfXtNgc6phm0Veo3iAukOmLpyEJFBSY6ss8d29hH/eZ8P2SRGEWUYrks/CVRkLaAkmQS
 do5vKtX606hkdhCvyQIcfzGfGxfHBoUR6lBiPwR25r7/FiVw7SMqLg2+n9HKXznmCPuSu8
 5COZHzxko+DHD2+BMuS/JAkRgB3rk7MBeB2pGd9Cxb8TCVtPlBfIs+L0nEwllfMAzWOmI7
 GyUmhR6ycZoWVxSFxzqN5Hug7UFeFtJYreCPEIo+YyoIsjYwE4iwX19PKlrQJQ==
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210429135507.8264-1-arnaud.pouliquen@foss.st.com>
 <20210429135507.8264-6-arnaud.pouliquen@foss.st.com>
 <20210505164159.GB1766375@xps15>
 <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
From: Julien Massot <julien.massot@iot.bzh>
Message-ID: <d840a1dc-c908-1be1-8354-ddd404045df6@iot.bzh>
Date: Fri, 7 May 2021 10:17:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5a41e653-4d75-c5d5-a8e3-e247a50507f3@foss.st.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 May 2021 10:34:01 +0000
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v3 5/6] rpmsg: char: Introduce a rpmsg
 driver for the rpmsg char device
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

Hi Mathieu, Arnaud,

On 5/5/21 8:25 PM, Arnaud POULIQUEN wrote:
> Hi Mathieu,
> 
> On 5/5/21 6:41 PM, Mathieu Poirier wrote:
>> Hi Arnaud,
>>
>> On Thu, Apr 29, 2021 at 03:55:06PM +0200, Arnaud Pouliquen wrote:
>>> A rpmsg char device allows to probe the endpoint device on a remote name
>>> service announcement.
>>>
>>> With this patch the /dev/rpmsgX interface is created either by a user
>>> application or by the remote firmware.
>>>
>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>>
>>> ---
>>> update from V1:
>>>
>>>   - add missing unregister_rpmsg_driver call on module exit.
>>> ---
>>>   drivers/rpmsg/rpmsg_char.c | 53 +++++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 52 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
>>> index 5c6a7da6e4d7..9166454c1310 100644
>>> --- a/drivers/rpmsg/rpmsg_char.c
>>> +++ b/drivers/rpmsg/rpmsg_char.c
>>> @@ -18,6 +18,8 @@
>>>   
>>>   #include "rpmsg_char.h"
>>>   
>>> +#define RPMSG_CHAR_DEVNAME "rpmsg-raw"
>>> +
>>>   static dev_t rpmsg_major;
>>>   static struct class *rpmsg_class;
>>>   
>>> @@ -413,6 +415,40 @@ int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent
>>>   }
>>>   EXPORT_SYMBOL(rpmsg_chrdev_eptdev_create);
>>>   
>>> +static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>>> +{
>>> +	struct rpmsg_channel_info chinfo;
>>> +
>>> +	memcpy(chinfo.name, RPMSG_CHAR_DEVNAME, sizeof(RPMSG_CHAR_DEVNAME));
>>> +	chinfo.src = rpdev->src;
>>> +	chinfo.dst = rpdev->dst;
>>> +
>>> +	return __rpmsg_chrdev_eptdev_create(rpdev, &rpdev->dev, chinfo, true);
>>> +}
>>> +
>>> +static void rpmsg_chrdev_remove(struct rpmsg_device *rpdev)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = device_for_each_child(&rpdev->dev, NULL, rpmsg_chrdev_eptdev_destroy);
>>> +	if (ret)
>>> +		dev_warn(&rpdev->dev, "failed to destroy endpoints: %d\n", ret);
>>> +}
>>> +
>>> +static struct rpmsg_device_id rpmsg_chrdev_id_table[] = {
>>> +	{ .name	= RPMSG_CHAR_DEVNAME },
>>> +	{ },
>>> +};
>>> +
>>> +static struct rpmsg_driver rpmsg_chrdev_driver = {
>>> +	.probe = rpmsg_chrdev_probe,
>>> +	.remove = rpmsg_chrdev_remove,
>>> +	.id_table = rpmsg_chrdev_id_table,
>>> +	.drv = {
>>> +		.name = "rpmsg_chrdev",
>>> +	},
>>> +};
>>
>> The sole purpose of doing this is to create instances of rpmsg_chrdevs from the
>> name service - but is it really needed?  Up to now and aside from GLINK and SMD,
>> there asn't been other users of it so I'm wondering if it is worth going through
>> all this trouble.
> 
> It is a good point.
> 
> Just as a reminder, the need of ST and, I assume, some other companies, is to
> have a basic/generic communication channel to control a remote processor
> application.
> 
> Nothing generic exists today for a virtio transport based implementation.
> Companies have to create their own driver.
> 
> The purpose of my work is to allow our customer to use RPMsg without developing
> a specific driver to control remote applications.
> 
> The rpmsg_chrdev char is a good candidate for this. No protocol, just a simple
> inter-processor link to send and receive data. The rpmsg_tty is another one.
> 
> Focusing on the rpmsg_chrdev:
> We did a part of the work with the first patch set that would be in 5.13.
> But is it simple to use it for virtio transport based platforms?
> If we don't implement the NS announcement support in rpmsg_chrdev, using
> rpmsg_chrdev for a user application seems rather tricky.
> How to instantiate the communication?
> The application will probably has to scan the /sys/bus/rpmsg/devices/ folder to
> determine the services and associated remote address.
> 
> I don't think the QCOM drivers have the same problem because they seems to
> initiate the communication and work directly with the RPMsg endpoints ( new
> channel creation on endpoint creation) while Virtio works with the RPMsg channel.
> 
> By introducing the ability to instantiate rpmsg_chrdevs through the NS
> announcement, we make this easy for applications to use.
> 
> And without rpmsg_chrdevs instantiation, It also means that we can't create an
> RPMsg channel for the rpmsg_chrdevs using a new RPMSG_CREATE_DEV_IOCTL control,
> right?
> 
> That said, If we consider that the aim was only to extract the rpmsg_ctrl part,
> I'm not against leaving the rpmsg_char in this state and switching to the
> rpmsg_tty driver upstream including the work on the rpmsg_ctrl to create rpmsg
> channels.
> 
> We could come back on this if requested by someone else.

I'm personnaly following this thread, our project is to be able to do RPC call
from Linux to an RTOS (Zephyr). Our plan is to do that in userspace using the nameservice
announcement from virtio/rpmsg.

We did an hackish patch to do that internally:
https://github.com/iotbzh/meta-rcar-zephyr/blob/master/recipes-kernel/linux/linux-renesas/0001-Add-device-driver-for-rcar-r7-
rpmsg.patch

That we will be really happy to drop by any cleaner solution.

Thanks for your work !
Julien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
