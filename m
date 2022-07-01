Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34019563320
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Jul 2022 14:06:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED0C4C640EC;
	Fri,  1 Jul 2022 12:06:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A44B7C03FDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Jul 2022 12:06:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261B9fXx023260;
 Fri, 1 Jul 2022 14:06:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JLmeDHmz4HYB0KdQ39Am9oL6EYP+j5fi0LmM0OxLjj8=;
 b=Atmu8pudBECmO/zqgpwsyX+5ucxttWYE4QYbZQ0NCtybBIzd8ESriP5LRObQyxkJYOgo
 fnsIp+5eWHnX6sr1gML2tRpi8gB1tWqmQYCwijX3n38affi2catfI9IeSRf1XQR1gXhV
 2rE+xKJGYpCEzslJUQ7HSadK4gGzPQF3bPLhelO3NbUeGpZ/qFfybCHzE98mbgcSKisU
 j+WIZrRiL2EYODGuoFXEvHvyh/YWnoGBcaTY+kFGfaf8cSuD9fkpU/q2qO6TCURtX15w
 zYIoN+nlJz9HZbm9Ds3Ck/9IkEmjX2vtuX5iTQKK4dqymF8XUtHG+gTY4jTMuLU5z9Q6 AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h1d2mpe5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 14:06:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B92C2100034;
 Fri,  1 Jul 2022 14:06:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B3D5221BF46;
 Fri,  1 Jul 2022 14:06:37 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 1 Jul
 2022 14:06:37 +0200
Message-ID: <707af18d-bd00-ae2e-f58e-ce546ab389b9@foss.st.com>
Date: Fri, 1 Jul 2022 14:06:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Etienne Carriere <etienne.carriere@linaro.org>
References: <20220624090055.569400-1-etienne.carriere@linaro.org>
 <7329b1e1-6337-5430-e90f-7f4c59c00636@foss.st.com>
 <CAN5uoS_yWujQ=zDHaLqsFuH9w-fnzePhU=CJFwxxLRJOxoEgyw@mail.gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAN5uoS_yWujQ=zDHaLqsFuH9w-fnzePhU=CJFwxxLRJOxoEgyw@mail.gmail.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_06,2022-06-28_01,2022-06-22_01
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix pwr regulators
 references to use scmi
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

On 7/1/22 13:58, Etienne Carriere wrote:
> Thanks Alex,
> 
> By the way, my review tags for other fixes to the scmi DTS files [1],
> [2] and [3]:
> Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
> Tested-by: Etienne Carriere <etienne.carriere@linaro.org>
> These are needed for a consistent kernel configuration of these boards.
> 

Sorry Etienne, I just sent it. But thanks for your tests ;)

Alex

> Br,
> etienne
> 
> [1] https://lore.kernel.org/lkml/20220624092715.1397827-2-gabriel.fernandez@foss.st.com/
> [2] https://lore.kernel.org/lkml/20220624092715.1397827-3-gabriel.fernandez@foss.st.com/
> [3] https://lore.kernel.org/lkml/20220624092715.1397827-4-gabriel.fernandez@foss.st.com/
> 
> On Fri, 1 Jul 2022 at 13:44, Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi Etienne
>>
>> On 6/24/22 11:00, Etienne Carriere wrote:
>>> Fixes stm32mp15*-scmi DTS files introduced in [1] to also access PWR
>>> regulators through SCMI service. This is needed since enabling secure
>>> only access to RCC clock and reset controllers also enables secure
>>> access only on PWR voltage regulators reg11, reg18 and usb33 hence
>>> these must also be accessed through SCMI Voltage Domain protocol.
>>> This change applies on commit [2] that already corrects issues from
>>> commit [1].
>>>
>>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>> Link: [1] https://lore.kernel.org/linux-arm-kernel/20220422150952.20587-7-alexandre.torgue@foss.st.com
>>> Link: [2] https://lore.kernel.org/linux-arm-kernel/20220613071920.5463-1-alexandre.torgue@foss.st.com
>>> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>>> ---
>>
>> Applied in stm32-fixes.
>>
>> Thanks
>> Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
