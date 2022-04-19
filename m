Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D542506D78
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 15:30:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4E43C6049A;
	Tue, 19 Apr 2022 13:30:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9E7AC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 13:30:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JCeESq019632;
 Tue, 19 Apr 2022 15:30:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yVMrm4zWjinomEQt6Qi0CU02yE86wEnfHBQgY0IOHqc=;
 b=nFB0m7eyQ1BHx2n5SeGnAyqflzmTnnBNt+gQV/xjoQu3LfSq5YTU/69SkKOGdx8nIkZw
 FJDjxEa7c6hypgNU62Y2i5lXOiwstXJFhQXwEzPSGk+oLP1gix327yzSG4PJtArSM9QN
 da/63nkP+2s0tc5n1zbnPWpeTc4ZTIKeXoaKXtPc9LNEOW4idvqv71gy55RIzWcCZjST
 x+pKEQUqIEgFmzJD0zSH3xYCj9uZVlJxqWng+8wBja2Fi+3Gpz6+HWBFQ892PJY3DIg/
 Hr93FGwT6Cd6yJMuyNMRMxcye3UQv/YXpIxBI4+g+F+DuHbMYIkUA+Q6FmTKcuGsvsxl PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09kr17x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 15:30:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1EFB100034;
 Tue, 19 Apr 2022 15:30:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7E742128DC;
 Tue, 19 Apr 2022 15:30:10 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 15:30:09 +0200
Message-ID: <c40b818d-1036-8068-2ebb-a6f1eab4d738@foss.st.com>
Date: Tue, 19 Apr 2022 15:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sekhar Nori
 <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
 <d0d9c16f-4668-1263-49fa-e51648c8c098@foss.st.com>
 <8798d7bb-6480-90ef-90fd-d7ff7d7beb2a@linaro.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <8798d7bb-6480-90ef-90fd-d7ff7d7beb2a@linaro.org>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
Cc: Olof Johansson <olof@lixom.net>, arm@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: align SPI NOR node name with
	dtschema
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

On 4/19/22 15:10, Krzysztof Kozlowski wrote:
> On 19/04/2022 15:03, Alexandre TORGUE wrote:
>> Hi Krzysztof
>>
>> On 4/7/22 16:30, Krzysztof Kozlowski wrote:
>>> The node names should be generic and SPI NOR dtschema expects "flash".
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>    arch/arm/boot/dts/da850-evm.dts                  | 2 +-
>>>    arch/arm/boot/dts/dm8168-evm.dts                 | 2 +-
>>>    arch/arm/boot/dts/spear1310-evb.dts              | 2 +-
>>>    arch/arm/boot/dts/spear1340-evb.dts              | 2 +-
>>>    arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 2 +-
>>>    arch/arm/boot/dts/stm32mp157c-ev1.dts            | 4 ++--
>>>    6 files changed, 7 insertions(+), 7 deletions(-)
>>
>> Thanks for your patch. Is it possible to split it per vendor
>> (TI/STM32/SPEAR) ?
> 
> This was a part of a bigger set where most of these I split. However
> here split would be more churn for such simple change, so I combined them.
> 
> This was already picked up by Arnd:
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=for-next&id=56147a156e7e2f50bef695efe6cc4fe8e91c40dc

Ah Ok, I missed that Arnd took them, sorry.

Regards
Alex

> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
