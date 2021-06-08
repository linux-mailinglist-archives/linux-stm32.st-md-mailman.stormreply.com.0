Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 359EC39FAA1
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 17:27:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8905C57B79;
	Tue,  8 Jun 2021 15:27:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5AC2C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 15:27:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 158F7rtn014083; Tue, 8 Jun 2021 17:27:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jYLpiPCQZpM+0HyeyUk4ri/5ofGA2P0gEQQY/BP7RWM=;
 b=OCJHJhG9UpOQC1DJUAneIwnMrPUM9YBg7kSmvpxuiRBmK4rsDtkV0ne8MUCS4ibmM+3V
 MjiYSyzKIrPZ2MkX9uWAXlSGCM8bCGTGa2peEtx6FTY6t8/R6iKivt1WHSQTJobUqzE/
 8l1v3TW9HvQ0kaM7+CHyFGR4Vd4Ws8sN8CXY9tZkyD/DHbK75isVNLaQB1Jb2ZzHmRfc
 VheJmdXn9ULIu17ka056WcytpGFBcqRCuNvT21J3hEx1/p6hzM0dZxLOrgx1IO+0M0ek
 pdiuIKyxbc0IpUGHV5cI2sZdiQPhsn5YYyc6skD0f3AGbsAZHeobcfI/A9EOobUJZDNl Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39257v2bxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 17:27:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6141210002A;
 Tue,  8 Jun 2021 17:27:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F45B2291B0;
 Tue,  8 Jun 2021 17:27:03 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 8 Jun
 2021 17:27:02 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
 <CANLsYkxAXiKTD=KB-45O+V7DAY4dbzd_Q3WdPoDrd=UdFqtw4w@mail.gmail.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <3a554f3e-71c1-3073-038f-0a4f7cc2d94a@foss.st.com>
Date: Tue, 8 Jun 2021 17:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkxAXiKTD=KB-45O+V7DAY4dbzd_Q3WdPoDrd=UdFqtw4w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_10:2021-06-04,
 2021-06-08 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Julien Massot <julien.massot@iot.bzh>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/4] rpmsg: char: introduce the rpmsg-raw
	channel
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

Hi Mathieu,


On 6/8/21 4:26 PM, Mathieu Poirier wrote:
> Hi Arnaud,
> 
> Between remoteproc/RPMSG and CoreSight, I have 6 patchsets to review
> (including some of your work) before getting to this one.  As such it
> will take a little while.

No worries, i knew you have already some patchsets in your pipe.
As i used this series to test the rpmsg_ctrl [1], both were ready at the same time.
So i decided to push it because it can also help you to perform tests on the
series [1].

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=494021

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
> On Mon, 7 Jun 2021 at 11:30, Arnaud Pouliquen
> <arnaud.pouliquen@foss.st.com> wrote:
>>
>> Purpose:
>>   Allow the remote processor to instantiate a /dev/rpmsgX interface relying on the NS announcement
>>   of the "rpmsg-raw" service.
>>   This patchet is extracted from  the series [1] with rework to add rpmsg_create_default_ept helper.
>>
>>
>> Aim:
>>   There is no generic sysfs interface based on RPMsg that allows a user application to communicate
>>   with a remote processor in a simple way.
>>   The rpmsg_char dev solves a part of this problem by allowing an endpoint to be created on the
>>   local side. But it does not take advantage of the NS announcement mechanism implemented for some
>>   backends such as the virtio backend. So it is not possible to probe it from  a remote initiative.
>>   Extending the char rpmsg device to support NS announcement makes the rpmsg_char more generic.
>>   By announcing a "rpmg-raw" service, the firmware of a remote processor will be able to
>>   instantiate a /dev/rpmsgX interface providing to the user application a basic link to communicate
>>   with it without any knowledge of the rpmsg protocol.
>>
>> Implementation details:
>>   - Register a rpmsg driver for the rpmsg_char driver, associated to the "rpmsg-raw" channel service.
>>   - In case of rpmsg char device instantiated by the rpmsg bus (on NS announcement) manage the
>>     channel default endpoint to ensure a stable default endpoint address, for communication with
>>     the remote processor.
>>
>> How to test it:
>>   - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
>>     + the "Restructure the rpmsg char to decorrelate the control part" series[2]
>>
>> [1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
>> [2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793
>>
>>
>>
>> Arnaud Pouliquen (4):
>>   rpmsg: Introduce rpmsg_create_default_ept function
>>   rpmsg: char: Add possibility to create and reuse default endpoint
>>   rpmsg: char: Introduce the "rpmsg-raw" channel
>>   rpmsg: char: Return error if user tries to destroy a default endpoint.
>>
>>  drivers/rpmsg/rpmsg_char.c | 92 +++++++++++++++++++++++++++++++++++---
>>  drivers/rpmsg/rpmsg_core.c | 51 +++++++++++++++++++++
>>  include/linux/rpmsg.h      | 14 ++++++
>>  3 files changed, 151 insertions(+), 6 deletions(-)
>>
>> --
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
