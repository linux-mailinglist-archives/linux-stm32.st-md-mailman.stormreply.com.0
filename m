Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA39010D774
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Nov 2019 15:52:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0150C36B0B;
	Fri, 29 Nov 2019 14:52:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3105C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Nov 2019 14:52:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xATEl2rW015649; Fri, 29 Nov 2019 15:51:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=g8lD3rtdXNrCg147P/vL/OTbncUOSvc26kNNxIEODlU=;
 b=kcjurm5sWToNx0YxGPewWYGHrO6fGpUyf6fVE3BiBVSse71WSxfWao+4zlxicrc4hVXw
 4/2x6utimcqGQPR0/QULgoj2VHX4b2+inZ5O1MGFNWOsUvYjH9kEmtQxk4pFra33P31n
 gMZtS+MnVpo9AvHicIdyxUrN8lopXOiCZuqsNzjTV1XAV/RG2lGF9Oy22/Bb1AQHxAUa
 KnFryJpdfh7UaI9YmZW/54NYzzBO5sHroCSyXnZ5AXPY0JHcb6MlB5zVCgEOaaUYTLMq
 tR4Ytc2/IL1LnhMwgp+s3kjw0a3GpCiKeByP5nxenR/LmY7zY8ynZBC0mDU8csL/g/P6 TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2whcxjg1nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Nov 2019 15:51:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 778B310002A;
 Fri, 29 Nov 2019 15:51:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4622B2B9FAF;
 Fri, 29 Nov 2019 15:51:49 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 29 Nov
 2019 15:51:48 +0100
To: Arnd Bergmann <arnd@arndb.de>
References: <20191120144109.25321-1-alexandre.torgue@st.com>
 <20191120144109.25321-6-alexandre.torgue@st.com>
 <CAK8P3a2Bg9KwfEqEE3_NUHxVv=svFGuj--Tnq-w-xFg63cfqAA@mail.gmail.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <92be0a67-c0ed-23bd-08f3-73f71d8bfc3f@st.com>
Date: Fri, 29 Nov 2019 15:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Bg9KwfEqEE3_NUHxVv=svFGuj--Tnq-w-xFg63cfqAA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-29_04:2019-11-29,2019-11-29 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/6] ARM: dts: stm32: Adapt STM32MP157 DK
 boards to stm32 DT diversity
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



On 11/29/19 3:20 PM, Arnd Bergmann wrote:
> On Wed, Nov 20, 2019 at 3:41 PM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
>>
>> To handle STM32MP15 SOCs diversity, some updates have to been done.
>> This commit mainly adapt dk1 board to include the correct package and the
>> correct SOC version. A new file has been created to factorize common parts.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>
>> diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
>> index 3f869bd67082..1292ac3b6890 100644
>> --- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
>> +++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
>>          model = "STMicroelectronics STM32MP157A-DK1 Discovery Board";
>>          compatible = "st,stm32mp157a-dk1", "st,stm32mp157";
>> -
>> -       aliases {
>> -               ethernet0 = &ethernet0;
>> -               serial0 = &uart4;
>> -       };
>> -
>> -       chosen {
>> -               stdout-path = "serial0:115200n8";
>> -       };
>> -
> 
> As a rule, I would leave aliases and chosen nodes in the .dts file and not
> move them into a shared .dtsi, since they tend to be board specific.
> 
> (even if that may not be the case in this particular file)

I agree, I'll move them in V2.

Thanks
Alex

> 
>        Arnd
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
