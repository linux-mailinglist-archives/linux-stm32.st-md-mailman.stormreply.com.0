Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BFA175854
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Mar 2020 11:29:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35259C36B0B;
	Mon,  2 Mar 2020 10:29:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2B66C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 10:29:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022ANQDP005577; Mon, 2 Mar 2020 11:29:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zkytL5nVEwPnsSSru/KymaDUr/ha+HwULMX9F6zIoyc=;
 b=exSa+YIJRpOznMWRg+X11gkj5wmZyPmRg08IYzfFup7xEtPRjr6hWuETdT4oWSeRj3gy
 wg3QhBQp7WTFiMxpDmBLYzfUI0Z4kea/DHRf82bFxgz48iJsg368pvRH6M0FBQQJNvm2
 0YtY1DCoULu5mT1lJ0lgrxwVHyC9zPpFuF/GYQlx5zjVBJ/TepQqiOoRZEw0lYD/5ZxJ
 /1s50RY+qf7NVfQdXBcYlsg6gkidy+IpOg0GatzRrm3hdSfJPdQ+5+F/QNciTNbLBRYc
 d/EGAvKYG+5A3T82naPax11ZVINz1N2f98HRIsLxjAIZH2hM78fSz8U2ZnViQc3sIiEi XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yffqpjscd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 11:29:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C81410002A;
 Mon,  2 Mar 2020 11:29:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 610342B881B;
 Mon,  2 Mar 2020 11:29:30 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar
 2020 11:29:29 +0100
To: Lucas Stach <l.stach@pengutronix.de>, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, <linux-stm32@st-md-mailman.stormreply.com>,
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
References: <20200226143826.1146-1-a.fatoum@pengutronix.de>
 <20200226143826.1146-2-a.fatoum@pengutronix.de>
 <244a4502-03e0-836c-2ce2-7fa6cef3c188@st.com>
 <fbba971d7501c774ce0081f22dcff4ef74002a4d.camel@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e227de9a-7440-7e1f-2928-5648cbbe44c1@st.com>
Date: Mon, 2 Mar 2020 11:29:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fbba971d7501c774ce0081f22dcff4ef74002a4d.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_03:2020-02-28,
 2020-03-02 signatures=0
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: add STM32MP1-based
 Linux Automation MC-1 board
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

Hi Lucas

On 3/2/20 11:18 AM, Lucas Stach wrote:
> On Mo, 2020-03-02 at 11:06 +0100, Alexandre Torgue wrote:
>> Hi Ahmad
>>
>> Thanks for adding a new STM32 board. Some minor comments.
>>
>> On 2/26/20 3:38 PM, Ahmad Fatoum wrote:
>>> The Linux Automation MC-1 is a SBC built around the Octavo Systems
>>> OSD32MP15x SiP. The SiP features up to 1 GB DDR3 RAM, EEPROM and
>>> a PMIC. The board has eMMC and a SD slot for storage and GbE
>>> for both connectivity and power.
>>>
>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de
>>> ---
> [...]
>>> +
>>> +&gpu {
>>> +	status = "okay";
>>> +};
> 
> This question is more to the ST guys than this specific DT: Why is the
> GPU marked as disabled in the SoC dtsi file? This device is always
> present on the SoC and AFAICS there are no board level dependencies, so
> there is no reason to have it disabled by default, right? Removing the
> status property from the dtsi would remove the need for this override
> on the board DT.

You are right. With new stm32 device tree diversity, it makes no longer 
sens to disable GPU node in stm32mp157 dtsi file. Indeed, we use now 
dedicated files for each SoC (stm32mp151 / stm32mp153 /stm32mp157).

Ahmad, can you add this modification in your series please ?

regards
Alex


> 
> Regards,
> Lucas
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
