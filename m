Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C221235C398
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 12:19:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D165C57B6F;
	Mon, 12 Apr 2021 10:19:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6CB6C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 10:19:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CAGEDt020722; Mon, 12 Apr 2021 12:19:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YJkcntAZUXkIgNIIrAREWE1IbHO+eVFlSLGHgdZHNeI=;
 b=Z0WGRoFU3q+IPxELbd8wub9WE78/OqzQ7022qaUQsDwPGuGJlrNvSEw4HF6fFvmRboM4
 PDxjks6K1okKU7kaVQxWc9kYBj9JzJ2MCxw0mJl5fm9MvMMSmLV1R+Hh/6bR099Eyl+E
 Jh4hw+yLxi7xCdTc899PiSkxA/RA0mcbwt13B062yrIBBCNoCzRTYm5G9Gh2mAxKfRI1
 Yv27PVB2DS6Eg0dgR1ysF2D69jzWGW9wQwiFoPW0PWuWnEKOPNZETaaM+NV4ReK8TcJI
 VU3/OprC/GFPmzEj7HyTHNeRVBiUeZ6KIqQyfPyuSIU47I/BnrFgp4I7HZeT4g+mPuYm hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37uv9md613-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 12:19:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3001710002A;
 Mon, 12 Apr 2021 12:19:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B898231DD0;
 Mon, 12 Apr 2021 12:19:36 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 12:19:35 +0200
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
 <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
Message-ID: <52c32145-7f29-8944-58dc-dc2fb406ffb0@foss.st.com>
Date: Mon, 12 Apr 2021 12:19:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1cd91834-6df8-a655-a3b1-0e16f5fe470d@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_09:2021-04-12,
 2021-04-12 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [RESEND PATCH 0/3] MAINTAINERS: update
 STMicroelectronics email
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

Hi

I think this series has been forgotten, any chance to see it merged into v5.13 ?

Thanks
Patrice


On 3/11/21 4:24 PM, Patrice CHOTARD wrote:
> Hi 
> 
> It's just a gentle reminder to not forgot this series.
> 
> Thanks
> 
> Patrice
> 
> On 2/16/21 8:49 AM, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> This series:
>>   _ Update st.com to foss.st.com email for some maintainers.
>>   _ Remove Vincent Abriou as STI/STM DRM driver
>>   _ Add Alain Volmat as STM32 I2C/SMBUS driver maintainer
>>
>> Patrice Chotard (3):
>>   MAINTAINERS: Update some st.com email addresses to foss.st.com
>>   MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
>>   MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer
>>
>>  MAINTAINERS | 31 +++++++++++++++----------------
>>  1 file changed, 15 insertions(+), 16 deletions(-)
>>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
