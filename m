Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A121977A5
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 11:19:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4008CC36B0B;
	Mon, 30 Mar 2020 09:19:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A97BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 09:19:15 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U9Idm5014377; Mon, 30 Mar 2020 11:18:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Ub38GwQsQKqIBSKsE+gjD8+CY2Fdv+1zkRWPPsQFePE=;
 b=wCho9PLMdX7pbE8u/OS2MBsRIhfy+mSq0mMnjW98WzaA8Q+zLt1eBYwlWY7lCBgR1Nfs
 q+M+aHB3kEGWhc/VOohy8S2dCRIDmqtS1cVzNhK7816mKY5xim+cAk+0v9ppAbEMZAbS
 GvCir6YnbUt9xzUV3eXcpuWFqxv+YKS42Yhgk+2qgElkN9hrX/GGuDWqv9+TnAJdRkqX
 ifLPd3TI6k8+jEW+A5gWgJM4mrIj18V26jSPnMMMTH8xtrNq5Ss3rv7j/0IkpzJqBFx1
 IlUNp1ERF9yCPH+uYuFibHeE4aZd7xHELbnWspLgDTGwNqz7a1ux6ezpPTQV4wW0NZZy BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53jt76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 11:18:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6283C100038;
 Mon, 30 Mar 2020 11:18:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 303492A6215;
 Mon, 30 Mar 2020 11:18:42 +0200 (CEST)
Received: from [10.211.11.146] (10.75.127.47) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 30 Mar
 2020 11:18:40 +0200
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-3-git-send-email-christophe.kerello@st.com>
 <a989ce31-740d-8f0f-4c55-026c65259104@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <38a25c89-f45b-c5cc-2618-d1ee059e6ef7@st.com>
Date: Mon, 30 Mar 2020 11:18:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a989ce31-740d-8f0f-4c55-026c65259104@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [02/12] mfd: stm32-fmc2: add STM32 FMC2
	controller driver
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



On 3/30/20 1:36 AM, Marek Vasut wrote:
> On 3/23/20 3:58 PM, Christophe Kerello wrote:
>> The driver adds the support for the STMicroelectronics FMC2 controller
>> found on STM32MP SOCs.
>>
>> The FMC2 functional block makes the interface with: synchronous and
>> asynchronous static memories (such as PSNOR, PSRAM or other
>> memory-mapped peripherals) and NAND flash memories.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> [...]
>> +static const struct of_device_id stm32_fmc2_match[] = {
>> +	{.compatible = "st,stm32mp1-fmc2"},
> 
> stm32mp151.dtsi uses "st,stm32mp15-fmc2" compatible string for FMC (with
> extra "5" in the string).
> 

Hi Marek,

I have not sent in this patch set the update of the device tree files.
Currently, for backward compatibility, the FMC2 is only supported the 
NAND driver. We need to wait the review of the different maintainers 
before updating the device tree files (bindings acked, ...).
I will send a DT file update for your own test.

Regards,
Christophe Kerello.

>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_fmc2_match);
>> +
>> +static struct platform_driver stm32_fmc2_driver = {
>> +	.probe	= stm32_fmc2_probe,
>> +	.driver	= {
>> +		.name = "stm32_fmc2",
>> +		.of_match_table = stm32_fmc2_match,
>> +		.pm = &stm32_fmc2_pm_ops,
>> +	},
>> +};
>> +module_platform_driver(stm32_fmc2_driver);
> [...]
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
