Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D014923F2
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jan 2022 11:44:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AE8DC5C82B;
	Tue, 18 Jan 2022 10:44:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74E47C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jan 2022 10:44:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20I97GDu009658;
 Tue, 18 Jan 2022 11:44:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8tSOi6hFO4mBG1V3W8bMA0J9PppE7RMIf5SisFC//CI=;
 b=2rCtH5QP/v8r3GgsSoY6Pq3pXO6qXE4aw1ZZ0RrQW4IAynpj+Bo85F9ip/XsEgq/flNg
 7hQpCHpIon9MYzLQPpP+P6T+E38l6qM5l/FUo3QkYtb+icyvkRCNbxt5B0E6Fm/SEH9Q
 2rjVHQtzvmutThtVNwrmSlrR04YnfdBlodDAruT3tulCjOhgWAHUiaHcnDLlmw212XU2
 YvrOSGIVKRAMMk/rHzakdmqojXD+vkH5g7rIXRaFzkuk1V5RgWk0wanLgftTH0JOzbFO
 uqDFNidLjygE9+RCaKVZPIM4rNSNdYFZFP2hCr7G9ZIlMMquIw2J9ZFBieJ2orP+W+E4 tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dnkesjnu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 11:44:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D5BA10002A;
 Tue, 18 Jan 2022 11:44:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A797211F15;
 Tue, 18 Jan 2022 11:44:32 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 18 Jan
 2022 11:44:31 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
 <20211207080843.21222-4-arnaud.pouliquen@foss.st.com>
 <YeXz2SFqYr+eUvnw@builder.lan>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <cffe6884-2059-d1e7-7dfd-37c852924959@foss.st.com>
Date: Tue, 18 Jan 2022 11:44:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YeXz2SFqYr+eUvnw@builder.lan>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
Cc: julien.massot@iot.bzh, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 03/13] rpmsg: Move the rpmsg control
 device from rpmsg_char to rpmsg_ctrl
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

Hello Bjorn,

On 1/17/22 11:55 PM, Bjorn Andersson wrote:
> On Tue 07 Dec 02:08 CST 2021, Arnaud Pouliquen wrote:
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> [..]
>> -static void rpmsg_ctrldev_release_device(struct device *dev)
>> -{
>> -	struct rpmsg_ctrldev *ctrldev = dev_to_ctrldev(dev);
>> -
>> -	ida_simple_remove(&rpmsg_ctrl_ida, dev->id);
>> -	ida_simple_remove(&rpmsg_minor_ida, MINOR(dev->devt));
>> -	cdev_del(&ctrldev->cdev);
>> -	kfree(ctrldev);
>> -}
>> -
>> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>> -{
>> -	struct rpmsg_ctrldev *ctrldev;
>> -	struct device *dev;
>> -	int ret;
>> -
>> -	ctrldev = kzalloc(sizeof(*ctrldev), GFP_KERNEL);
>> -	if (!ctrldev)
>> -		return -ENOMEM;
>> -
>> -	ctrldev->rpdev = rpdev;
>> -
>> -	dev = &ctrldev->dev;
>> -	device_initialize(dev);
>> -	dev->parent = &rpdev->dev;
>> -	dev->class = rpmsg_class;
>> -
>> -	cdev_init(&ctrldev->cdev, &rpmsg_ctrldev_fops);
>> -	ctrldev->cdev.owner = THIS_MODULE;
>> -
>> -	ret = ida_simple_get(&rpmsg_minor_ida, 0, RPMSG_DEV_MAX, GFP_KERNEL);
>> -	if (ret < 0)
>> -		goto free_ctrldev;
>> -	dev->devt = MKDEV(MAJOR(rpmsg_major), ret);
>> -
>> -	ret = ida_simple_get(&rpmsg_ctrl_ida, 0, 0, GFP_KERNEL);
>> -	if (ret < 0)
>> -		goto free_minor_ida;
>> -	dev->id = ret;
>> -	dev_set_name(&ctrldev->dev, "rpmsg_ctrl%d", ret);
>> -
>> -	ret = cdev_add(&ctrldev->cdev, dev->devt, 1);
> 
> This turns out to be incomplete and the cdev_del above is in the wrong
> place. This, and the same for eptdev, is being corrected in:
> 
> https://lore.kernel.org/linux-remoteproc/164245960510.1698571.4998090450663669237.b4-ty@linaro.org/T/#t

I will rebase on next branch including this patchset

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
