Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E26B251812
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Aug 2020 13:57:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D77EDC3087A;
	Tue, 25 Aug 2020 11:57:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD46BC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 11:57:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PBvY7d029025; Tue, 25 Aug 2020 13:57:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=EbEMV1KvIFNB38fQh8GLgC41aChyvSDIUYhQQsl+qtY=;
 b=bvkTTeXlzGI7fUMHQeo2btq2pGrNSqQZiE+s2efKnCs2wseNGILxgVakkPAxLwJN/zoM
 zLvj+3dYpyFSSLoFAHJ9vcDKaalNisPTZZWyNdZN+QxUedLwh8qQ8C4rFAFu2F4wRmDb
 PD1LDMF0NVkjBKoXTb1WrQP5ZOmjJNAzPDG01mdh5jXF9VvG1Qc7RkBxsdasYBTlF6U0
 e1AHhn0jRvmkTL1jqDbgZUW8i7GiXv1I2K6WNdp+hdhNZ7ja896TgZ7Xz6qofPSVOYQN
 jLwyWexqdpOCpwV4fpnMbAN75XN8I1FU85NuAQKcdLlq51jQjWD27WB2ngkeUEDvgBKP aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b3haujx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 13:57:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E18610002A;
 Tue, 25 Aug 2020 13:57:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F154A2A820F;
 Tue, 25 Aug 2020 13:57:22 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.44) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 13:57:21 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-6-arnaud.pouliquen@st.com>
 <20200824224736.GD3938186@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <cbb145da-95ea-9f10-98e5-2618294996d6@st.com>
Date: Tue, 25 Aug 2020 13:57:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824224736.GD3938186@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_03:2020-08-25,
 2020-08-25 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 5/9] rpmsg: introduce reserved rpmsg
 driver for ns announcement
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

Hi Mathieu

Thanks for the review! please find few comments below.

On 8/25/20 12:47 AM, Mathieu Poirier wrote:
> On Fri, Jul 31, 2020 at 01:47:28PM +0200, Arnaud Pouliquen wrote:
>> The name service announcement should not be linked to the RPMsg virtio bus
>> but to the RPMsg protocol itself.
>>
>> This patch proposes to break the dependency with the RPmsg virtio bus by
>> the introduction of the reserved RPMsg name service driver which will be in
>> charge of managing the RPMsg name service announcement.
>>
>> This first patch only implements the probe and the RPMsg endpoint to
>> manage create and release channels remote requests.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  drivers/rpmsg/Kconfig          |   8 ++
>>  drivers/rpmsg/Makefile         |   1 +
>>  drivers/rpmsg/rpmsg_internal.h |  17 +++++
>>  drivers/rpmsg/rpmsg_ns.c       | 135 +++++++++++++++++++++++++++++++++
>>  4 files changed, 161 insertions(+)
>>  create mode 100644 drivers/rpmsg/rpmsg_ns.c
>>
>> diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
>> index f96716893c2a..140faa975ea1 100644
>> --- a/drivers/rpmsg/Kconfig
>> +++ b/drivers/rpmsg/Kconfig
>> @@ -15,6 +15,14 @@ config RPMSG_CHAR
>>  	  in /dev. They make it possible for user-space programs to send and
>>  	  receive rpmsg packets.
>>  
>> +config RPMSG_NS
>> +	tristate "RPMSG name service announcement"
>> +	depends on RPMSG
>> +	help
>> +	  Say Y here to enable the support of the name service announcement
>> +	  channel that probes the associate RPMsg device on remote endpoint
> 
> s/associate/associated
> 
>> +	  service announcement.
>> +
>>  config RPMSG_MTK_SCP
>>  	tristate "MediaTek SCP"
>>  	depends on MTK_SCP
>> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
>> index ffe932ef6050..8d452656f0ee 100644
>> --- a/drivers/rpmsg/Makefile
>> +++ b/drivers/rpmsg/Makefile
>> @@ -1,6 +1,7 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>>  obj-$(CONFIG_RPMSG_CHAR)	+= rpmsg_char.o
>> +obj-$(CONFIG_RPMSG_NS)		+= rpmsg_ns.o
>>  obj-$(CONFIG_RPMSG_MTK_SCP)	+= mtk_rpmsg.o
>>  qcom_glink-objs			:= qcom_glink_native.o qcom_glink_ssr.o
>>  obj-$(CONFIG_RPMSG_QCOM_GLINK) += qcom_glink.o
>> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
>> index d5ab286d0e5e..641b48f6bf2a 100644
>> --- a/drivers/rpmsg/rpmsg_internal.h
>> +++ b/drivers/rpmsg/rpmsg_internal.h
>> @@ -102,4 +102,21 @@ static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
>>  	return rpmsg_register_device(rpdev);
>>  }
>>  
>> +/**
>> + * rpmsg_ns_register_device() - register name service device based on rpdev
>> + * @rpdev: prepared rpdev to be used for creating endpoints
>> + *
>> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
>> + * basis for the rpmsg name service device.
>> + */
>> +static inline int rpmsg_ns_register_device(struct rpmsg_device *rpdev)
>> +{
>> +	strcpy(rpdev->id.name, "rpmsg_ns");
>> +	rpdev->driver_override = "rpmsg_ns";
>> +	rpdev->src = RPMSG_NS_ADDR;
>> +	rpdev->dst = RPMSG_NS_ADDR;
>> +
>> +	return rpmsg_register_device(rpdev);
>> +}
>> +
>>  #endif
>> diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
>> new file mode 100644
>> index 000000000000..fe7713e737c2
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_ns.c
>> @@ -0,0 +1,135 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) STMicroelectronics 2020 - All Rights Reserved
>> + */
>> +#include <linux/device.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include "rpmsg_internal.h"
>> +
>> +/**
>> + * enum rpmsg_ns_flags - dynamic name service announcement flags
>> + *
>> + * @RPMSG_NS_CREATE: a new remote service was just created
>> + * @RPMSG_NS_DESTROY: a known remote service was just destroyed
>> + */
>> +enum rpmsg_ns_flags {
>> +	RPMSG_NS_CREATE		= 0,
>> +	RPMSG_NS_DESTROY	= 1,
>> +};
>> +
>> +/**
>> + * struct rpmsg_ns_msg - dynamic name service announcement message
>> + * @name: name of remote service that is published
>> + * @addr: address of remote service that is published
>> + * @flags: indicates whether service is created or destroyed
>> + *
>> + * This message is sent across to publish a new service, or announce
>> + * about its removal. When we receive these messages, an appropriate
>> + * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
>> + * or ->remove() handler of the appropriate rpmsg driver will be invoked
>> + * (if/as-soon-as one is registered).
>> + */
>> +struct rpmsg_ns_msg {
>> +	char name[RPMSG_NAME_SIZE];
>> +	u32 addr;
>> +	u32 flags;
>> +} __packed;
>> +
>> +/* invoked when a name service announcement arrives */
>> +static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int len,
>> +		       void *priv, u32 src)
>> +{
>> +	struct rpmsg_ns_msg *msg = data;
>> +	struct rpmsg_device *newch;
>> +	struct rpmsg_channel_info chinfo;
>> +	struct device *dev = &rpdev->dev;
>> +	int ret;
>> +
>> +#if defined(CONFIG_DYNAMIC_DEBUG)
>> +	dynamic_hex_dump("NS announcement: ", DUMP_PREFIX_NONE, 16, 1,
>> +			 data, len, true);
>> +#endif
>> +
>> +	if (len != sizeof(*msg)) {
>> +		dev_err(dev, "malformed ns msg (%d)\n", len);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* don't trust the remote processor for null terminating the name */
>> +	msg->name[RPMSG_NAME_SIZE - 1] = '\0';
>> +
>> +	strncpy(chinfo.name, msg->name, sizeof(chinfo.name));
>> +	chinfo.src = RPMSG_ADDR_ANY;
>> +	chinfo.dst = msg->addr;
>> +
>> +	dev_info(dev, "%sing channel %s addr 0x%x\n",
>> +		 msg->flags & RPMSG_NS_DESTROY ? "destroy" : "creat",
>> +		 msg->name, msg->addr);
>> +
>> +	if (msg->flags & RPMSG_NS_DESTROY) {
>> +		ret = rpmsg_release_channel(rpdev, &chinfo);
>> +		if (ret)
>> +			dev_err(dev, "rpmsg_destroy_channel failed: %d\n", ret);
>> +	} else {
>> +		newch = rpmsg_create_channel(rpdev, &chinfo);
>> +		if (!newch)
>> +			dev_err(dev, "rpmsg_create_channel failed\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
>> +{
>> +	struct rpmsg_channel_info ns_chinfo;
>> +	struct rpmsg_endpoint *ns_ept;
>> +
>> +	ns_chinfo.src = RPMSG_NS_ADDR;
>> +	ns_chinfo.dst = RPMSG_NS_ADDR;
>> +	strcpy(ns_chinfo.name, "name_service");
>> +
>> +	/*
>> +	 * create and attach the endpoint to the rpmsg device that it would be
>> +	 * destroy when the rpmsg device will be deleted
>> +	 */
> 
> This comment doesn't work, please revise.

Could you clarify what does not work, from your POV?
in view of your comment, it seems I should at least rephrase it... 
proposal:
	/*
 	 * Create the NS service endpoint associated to the rpmsg device.
         * The endpoint will be automatically destroyed when the rpmsg device
         * will be deleted.
	 */

> 
>> +	ns_ept = rpmsg_create_ept(rpdev, rpmsg_ns_cb, NULL, ns_chinfo);
>> +	if (!ns_ept) {
>> +		dev_err(&rpdev->dev, "failed to create the ns ept\n");
>> +		return -ENOMEM;
>> +	}
>> +	rpdev->ept = ns_ept;
>> +
>> +	rpdev->src = RPMSG_NS_ADDR;
> 
> I think this is already done in rpmsg_ns_register_device().

You are right!

thanks,
Arnaud
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static struct rpmsg_driver rpmsg_ns_driver = {
>> +	.drv.name = "rpmsg_ns",
>> +	.probe = rpmsg_ns_probe,
>> +};
>> +
>> +static int rpmsg_ns_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = register_rpmsg_driver(&rpmsg_ns_driver);
>> +	if (ret < 0)
>> +		pr_err("%s: Failed to register rpmsg driver\n", __func__);
>> +
>> +	return ret;
>> +}
>> +postcore_initcall(rpmsg_ns_init);
>> +
>> +static void rpmsg_ns_exit(void)
>> +{
>> +	unregister_rpmsg_driver(&rpmsg_ns_driver);
>> +}
>> +module_exit(rpmsg_ns_exit);
>> +
>> +MODULE_DESCRIPTION("Name service announcement rpmsg Driver");
>> +MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
>> +MODULE_ALIAS("rpmsg_ns");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
