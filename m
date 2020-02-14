Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9637615E426
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2020 17:34:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62847C36B0B;
	Fri, 14 Feb 2020 16:34:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06CF7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 16:34:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EGJApR022703; Fri, 14 Feb 2020 17:34:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=IDcJAhgQjtxPC/OrQ8RnxJzkwvOSmDQi1PRaGPnHPEY=;
 b=zUk8zGjh4i2vxLAeptqpRly1WmMosqXpdUhBLv9nJVfNz/x0vkBhvlJ2ClRfhzYD8XFH
 3c4i/t1JVKu8vK0mis6RLdpcKWZbbBUNRHxdY8W1dvNLLYIxQxITIi35MlGR0pku8E6z
 l2DjuWEVQV/vluo/bJf1cG89vjQXEGsg0k4zGO1VvODEPlfdmXo8SA4KWxZktkyBIwe5
 XlhA+5TM8X5a5BMEj3t8kyT+1QXcalRy0A4zElFiwGHHbyIXO1i0cPlWrdIVn/xjf8tP
 2t/1ipibxusDoYOMfWLbwuVnGdsMgeyQKtNYABhggPcWhQTzKu9HbDNmLU1fumr4qQuX lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhvykr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 17:34:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A56FE10002A;
 Fri, 14 Feb 2020 17:34:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 96A3F2BF9B5;
 Fri, 14 Feb 2020 17:34:20 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 17:34:19 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-2-arnaud.pouliquen@st.com> <20200214025512.GQ1443@yoga>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <ff04e4ed-201a-877f-7500-f594820cab15@st.com>
Date: Fri, 14 Feb 2020 17:34:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214025512.GQ1443@yoga>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_05:2020-02-12,
 2020-02-14 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabien DESSENNE <fabien.dessenne@st.com>, Rob Herring <robh+dt@kernel.org>,
 Suman Anna <s-anna@ti.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 1/3] remoteproc: add support for
 co-processor loaded and booted before kernel
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

Hi Bjorn,

On 2/14/20 3:55 AM, Bjorn Andersson wrote:
> On Tue 11 Feb 09:42 PST 2020, Arnaud Pouliquen wrote:
> 
>> From: Loic Pallardy <loic.pallardy@st.com>
>>
>> Remote processor could boot independently or be loaded/started before
>> Linux kernel by bootloader or any firmware.
>> This patch introduces a new property in rproc core, named skip_fw_load,
>> to be able to allocate resources and sub-devices like vdev and to
>> synchronize with current state without loading firmware from file system.
> 
> This sentence describes the provided patch.
> 
> As I expressed in the earlier version, in order to support remoteprocs
> that doesn't need firmware loading, e.g. running from some ROM or
> dedicated flash storage etc, this patch looks really good.
> 
>> It is platform driver responsibility to implement the right firmware
>> load ops according to HW specificities.
> 
> But this last sentence describes a remoteproc that indeed needs
> firmware and that the purpose of this patch is to work around the core's
> handling of the firmware.

I will update or suppress the last sentence.

> 
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++------
>>  include/linux/remoteproc.h           |  2 +
>>  2 files changed, 55 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> [..]
>> @@ -1758,11 +1779,20 @@ int rproc_boot(struct rproc *rproc)
>>  
>>  	dev_info(dev, "powering up %s\n", rproc->name);
>>  
>> -	/* load firmware */
>> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>> -	if (ret < 0) {
>> -		dev_err(dev, "request_firmware failed: %d\n", ret);
>> -		goto downref_rproc;
>> +	if (!rproc->skip_fw_load) {
>> +		/* load firmware */
>> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
>> +		if (ret < 0) {
>> +			dev_err(dev, "request_firmware failed: %d\n", ret);
>> +			goto downref_rproc;
>> +		}
>> +	} else {
>> +		/*
>> +		 * Set firmware name pointer to null as remoteproc core is not
>> +		 * in charge of firmware loading
>> +		 */
>> +		kfree(rproc->firmware);
>> +		rproc->firmware = NULL;
> 
> As stated before, I think it would be more appropriate to allow a
> remoteproc driver for hardware that shouldn't have firmware loaded to
> never set rproc->firmware.
> 
> And I'm still curious how you're dealing with a crash or a restart on
> this remoteproc. Don't you need to reload your firmware in these
> circumstances? Do you perhaps have a remoteproc that's both
> "already_booted" and "skip_fw_load"?

Yes the crash management is the main point here. Even if the firmware has been 
preloaded and started by the bootloader, a crash can occur (e.g. watchdog) and have to be be treated.
In this case on stm32 platform we trig a crash recovery to shutdown the firmware.
Then application has possibility to reload the same firmware (copy of the fw in FS),
to load a new firmware(e.g.for diagnostic or a clean shutdown), reset the platform.

Implementing a specific driver would not give such flexibility.

> 
>>  	}
>>  
>>  	ret = rproc_fw_boot(rproc, firmware_p);
>> @@ -1916,8 +1946,17 @@ int rproc_add(struct rproc *rproc)
>>  	/* create debugfs entries */
>>  	rproc_create_debug_dir(rproc);
>>  
>> -	/* if rproc is marked always-on, request it to boot */
>> -	if (rproc->auto_boot) {
>> +	if (rproc->skip_fw_load) {
>> +		/*
>> +		 * If rproc is marked already booted, no need to wait
>> +		 * for firmware.
>> +		 * Just handle associated resources and start sub devices
>> +		 */
> 
> Again, this describes a system where the remoteproc is already booted,
> not a remoteproc that doesn't need firmware loading.

Right, i will change the comment.

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
