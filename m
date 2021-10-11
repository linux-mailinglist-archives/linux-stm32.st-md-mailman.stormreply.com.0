Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89778428B01
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 12:46:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34BBEC5C82E;
	Mon, 11 Oct 2021 10:46:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6647EC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 10:46:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B9Ru8l022177; 
 Mon, 11 Oct 2021 12:46:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MGTAKhW1EuXoe7o3K5K7J44GWxLr6cNvfJJs+YkI2z8=;
 b=JwoYxRPEfEHe4f1sAVWOAKSep0pIe8VGw8tGNg5CVH3ikqzLAs162jNqkpRm7rCLYDRI
 CqVZ8TDyKeVCDetyzRGKaWjN0PrtF7qRP06/ySJygVj1Ipbz/gHkHclt2UmD8/smK77r
 v6+rkllDmigMIO6o/2QREMv0OYFKTq8cMWWhy8SUgOspdAFmORI5P2mjmDPG0PdwgWrD
 tKjYFupOxU3tzqYe35vkR45JCVn5FbK9XJH4QJAVAMUXG8WZENVVJO/V02/KJCUIWdBX
 3zDF55mPHlOGNrzW0gknaCyIP3dRUc7cCmin/b2w2laJY2RsL9HLfWDE1Ulelo/ZT553 tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bmd35tcpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 12:46:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1646F100034;
 Mon, 11 Oct 2021 12:46:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DC5021CA74;
 Mon, 11 Oct 2021 12:46:48 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 12:46:47 +0200
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-4-arnaud.pouliquen@foss.st.com>
 <YWDVwArEz5Yub3GJ@ripper>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <f0696b4d-c0b6-5283-2eda-e5791462cbba@foss.st.com>
Date: Mon, 11 Oct 2021 12:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDVwArEz5Yub3GJ@ripper>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_03,2021-10-07_02,2020-04-07_01
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 3/4] rpmsg: Move the rpmsg control
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 10/9/21 1:35 AM, Bjorn Andersson wrote:
> On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> 
>> Create the rpmsg_ctrl.c module and move the code related to the
>> rpmsg_ctrldev device in this new module.
>>
>> Add the dependency between rpmsg_char and rpmsg_ctrl in the
>> kconfig file.
>>
> 
> As I said in the cover letter, the only reason I can see for doing this
> refactoring is in relation to the introduction of
> RPMSG_CREATE_DEV_IOCTL. So I would like this patch to go together with
> that patch, together with a good motivation why there's merit to
> creating yet another kernel module (and by bind/unbind can't be used).
> 
> Perhaps I'm just missing some good usecase related to this?


> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>>  drivers/rpmsg/Kconfig      |   9 ++
>>  drivers/rpmsg/Makefile     |   1 +
>>  drivers/rpmsg/rpmsg_char.c | 170 +----------------------------
>>  drivers/rpmsg/rpmsg_char.h |   2 +
>>  drivers/rpmsg/rpmsg_ctrl.c | 215 +++++++++++++++++++++++++++++++++++++
>>  5 files changed, 229 insertions(+), 168 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
>>
> [..]
>> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> [..]
>> -static int rpmsg_chrdev_probe(struct rpmsg_device *rpdev)
>> -{
> [..]
>> -	dev = &ctrldev->dev;
>> -	device_initialize(dev);
>> -	dev->parent = &rpdev->dev;
>> -	dev->class = rpmsg_class;
> [..]
>> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> [..]
>> +static int rpmsg_ctrldev_probe(struct rpmsg_device *rpdev)
>> +{
> [..]
>> +	dev = &ctrldev->dev;
>> +	device_initialize(dev);
>> +	dev->parent = &rpdev->dev;
> 
> You lost the assignment of dev->class here, which breaks the udev rules
> we use to invoke rpmsgexport to create endpoints and it causes udevadm
> to complain that rpmsg_ctrlN doesn't have a "subsystem".

We discussed this point with Mathieu, as a first step i kept the class, but that
generated another dependency with the rpmsg_char device while information was
available on the rpmsg bus. The char device and ctrl device should share the
same class. As rpmsg_ctrl is created first it would have to create the class,and
provide an API to rpmsg char

Please could you details what does means "rpmsg_ctrlN doesn't have a
"subsystem"." What exactly the udev is looking for? could it base it check on
the /dev/rpmsg_ctrl0 or /sys/bus/rpmsg/devices/...?

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
