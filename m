Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45920F1B8
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2020 11:36:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 376C7C36B11;
	Tue, 30 Jun 2020 09:36:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9790C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jun 2020 09:36:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U9Ytb1002355; Tue, 30 Jun 2020 11:35:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=XvCnsTc0gHyxA4bCQuL6yxD7F1TD1d0nVE+Ilwp4DeE=;
 b=Xiq6/ExwBe2jgYMzd+pcK7nxWvhuZTiZD4+4aj24d34XfntXZzCOg2vU6FyXga20MRKD
 PJOMKuRZSZrEgXKkZziTieNlwWC7FC6WQ7K5ug86Uc/UuIMj1FH5c6MokhYVTyd1RB4Y
 BViFUk/QltOESaJu/VrVtyK11Z3odChqDAl2TRZxDSeOSNsesG5PvoP6T2JMLbtl24n/
 QJhdX61xYpJCFSWNu//POwF8zBpTJo0Zh/4hG69m+nY2ObKs8JX7I7gNJhF2Gsg4aJIA
 dGPTfO8/bP3n6l54ihWE3J1/86/86QAJnpe1rNONw8Ia2/X5tXbXZfJztV2RmEVDgQnS YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu89hxgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 11:35:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 314C510002A;
 Tue, 30 Jun 2020 11:35:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14BEE2ADA10;
 Tue, 30 Jun 2020 11:35:41 +0200 (CEST)
Received: from [10.211.8.105] (10.75.127.49) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 30 Jun
 2020 11:35:39 +0200
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
 <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
 <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <e30abadc-83c0-f010-be36-fe8d14c4aea9@st.com>
Date: Tue, 30 Jun 2020 11:35:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_03:2020-06-30,
 2020-06-29 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 arnd@linaro.org
Subject: Re: [Linux-stm32] [PATCH v5 4/6] memory: stm32-fmc2-ebi: add STM32
 FMC2 EBI controller driver
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

Hi Richard,

On 6/30/20 11:13 AM, Richard Weinberger wrote:
> On Fri, Jun 12, 2020 at 5:24 PM Christophe Kerello
> <christophe.kerello@st.com> wrote:
>>
>> The driver adds the support for the STMicroelectronics FMC2 EBI controller
>> found on STM32MP SOCs.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>> +       if (!IS_ERR(rstc)) {
>> +               reset_control_assert(rstc);
>> +               reset_control_deassert(rstc);
> 
> Shouldn't there be a small delay between assert and deassert?
> Other than that the code looks good to me.
> 

Even if I have currently not met any issue, I will add a udelay(2) to be 
safe. It will be part of v6.

Thanks,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
