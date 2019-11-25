Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729C1091E4
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2019 17:34:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7289C36B0B;
	Mon, 25 Nov 2019 16:34:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D197C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 16:34:47 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPGRw0B014214; Mon, 25 Nov 2019 17:34:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=auNwC8Og+UxT0YXv3DVgSuOwHEWs6615wNsybbaTUQg=;
 b=Cg/7vv3OCDOZGVlVy9JwhLP7C98IcGtYomX+91cKtrMZFHCcc2bmT93M1/sIfTHzW0yM
 rV30eEf0wuaFqmSiZ//f7zA5rZ3MNmIlGK4dLRTr9fg/SxS2SpMea/4U9T84Yx2Qb+Cs
 8IuZ7yL5WdaBQEJ9ZGSlIuX9lFUk5Xmm6DBowoAPfnYFxIDIu/zW+XI4OfeUKjey5JFK
 ien7UTdyHfVzhImiDhZT4/Pf0FF1yXWzMLJF+6rGzLOcxSmSkL6qNXzBOtfgSzud6WuN
 fqHnwuv56qMCB/t8SxvVJAjgK+g6J7BmPspokeh8G9SBR+bYLKnrc5X1a3sQq91RSb+Y og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weudw2624-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 17:34:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64E6B10005F;
 Mon, 25 Nov 2019 17:34:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C27D2B2429;
 Mon, 25 Nov 2019 17:34:29 +0100 (CET)
Received: from [10.201.23.29] (10.75.127.51) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 25 Nov
 2019 17:34:28 +0100
To: Steve deRosier <derosier@gmail.com>
References: <1574442222-19759-1-git-send-email-christophe.kerello@st.com>
 <CALLGbRJ00TeZKPfhkqj_mwu9zhMzc_+A8mh4uwaPnFBUatrwTw@mail.gmail.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <e7801419-1644-d768-4186-ab4f17151980@st.com>
Date: Mon, 25 Nov 2019 17:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALLGbRJ00TeZKPfhkqj_mwu9zhMzc_+A8mh4uwaPnFBUatrwTw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_04:2019-11-21,2019-11-25 signatures=0
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 miquel.raynal@bootlin.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] mtd: Use mtd device name instead of mtd->name
 when registering nvmem device
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



On 11/25/19 5:05 PM, Steve deRosier wrote:
> On Fri, Nov 22, 2019 at 9:04 AM Christophe Kerello
> <christophe.kerello@st.com> wrote:
>>
>> MTD currently allows to have same partition name on different devices.
>> Since nvmen device registration has been added, it is not more possible
>> to have same partition name on different devices. We get following
>> logs:
>> sysfs: cannot create duplicate filename XXX
>> Failed to register NVMEM device
>>
>> To avoid such issue, the proposed patch uses the mtd device name instead of
>> the partition name.
> ...
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 5fac435..559b693 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -551,7 +551,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>>
>>          config.id = -1;
>>          config.dev = &mtd->dev;
>> -       config.name = mtd->name;
>> +       config.name = dev_name(&mtd->dev);
>>          config.owner = THIS_MODULE;
>>          config.reg_read = mtd_nvmem_reg_read;
>>          config.size = mtd->size;
> 
> This would be a breaking change for anyone that depended on
> `config.name = mtd->name` behavior. Obviously, if they were using
> multiple devs with the same partition name as you were, they'd have
> already been broken, but I suspect if a lot of people were doing that
> we'd have heard about that before now.

Hi Steve,

I understand your concern. So the recommendation is to have unique 
partition names.

Regards,
Christophe Kerello.

> 
> - Steve
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
