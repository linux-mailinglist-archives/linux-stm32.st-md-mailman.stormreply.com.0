Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70234A3B2E7
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2025 08:58:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B8F7C78F89;
	Wed, 19 Feb 2025 07:58:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C24E3C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2025 07:58:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J4sKAc024666;
 Wed, 19 Feb 2025 08:58:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3bBJS43pvAXXysK32UqQ0DdYgo9OZo0TPX7SlCS/zbM=; b=qrofjjdIBjqjCtpb
 eXbj5Hjt98R97RAEso4phh094s2/DGVfjhBk9wOuOFTSjnzyQ5GMt39Hca+VHeI6
 +6F0WqQwbljBlbKo6DUQxa/d/zVrSybRz6RwlkD5sEiYRUcSqf2+q0IpeANXZe5f
 5hY7cOmdN5AmovgJE1ctS/U1beNebFZVyMVEBLJlkbcBdN1b1j6Kr1HwCqdLNL3G
 tkHAg7150dqPbTeV4UPFl9zR2pqPNubn7WuB4ZDo12AdH8eiT26dfvvsUeSbKdYG
 jW57vPUdO4wnQQmlNx1vp4EzwNmWoNEjqdGVx+p5yoLyseOiK4Xw06QG7HfllL7G
 jptJmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44vyyn25qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 08:58:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB48C40053;
 Wed, 19 Feb 2025 08:56:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D4984026F8;
 Wed, 19 Feb 2025 08:52:52 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 08:52:51 +0100
Message-ID: <df73976e-12a5-4af9-b312-503ae68edcfc@foss.st.com>
Date: Wed, 19 Feb 2025 08:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250218130000.87889-1-patrice.chotard@foss.st.com>
 <20250218212138.GA1092771-robh@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250218212138.GA1092771-robh@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/8] Add STM32MP25 SPI NOR support
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



On 2/18/25 22:21, Rob Herring wrote:
> On Tue, Feb 18, 2025 at 01:59:52PM +0100, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
>>
>> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
>> the memory area split, the chip select override and the time constraint 
>> between its 2 Octo SPI children.
>>
>> Due to these depedencies, this series adds support for: 
>>   - Octo Memory Manager driver.
>>   - Octo SPI driver.
>>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
>>
>> The device tree files adds Octo Memory Manager and its 2 associated Octo 
>> SPI chidren in stm32mp251.dtsi and adds SPI NOR support in stm32mp257f-ev1
>> board.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Changes in v4:
>>   - Add default value requested by Krzysztof for st,omm-req2ack-ns, 
>>     st,omm-cssel-ovr and st,omm-mux properties in st,stm32mp25-omm.yaml
>>   - Remove constraint in free form test for st,omm-mux property.
>>   - Fix drivers/memory/Kconfig by replacing TEST_COMPILE_ by COMPILE_TEST.
>>   - Fix SPDX-License-Identifier for stm32-omm.c.
>>   - Fix Kernel test robot by fixing dev_err() format in stm32-omm.c.
>>   - Add missing pm_runtime_disable() in the error handling path in
>>     stm32-omm.c.
>>   - Replace an int by an unsigned int in stm32-omm.c
>>   - Remove uneeded "," after terminator in stm32-omm.c.
>>   - Update cover letter description to explain dependecies between 
>>     Octo Memory Manager and its 2 Octo SPI children.
>>   - Add Reviewed-by Krzysztof Kozlowski for patch 1 and 3.
> 
> No, you didn't.

Argh, sorry, i will send a v5

Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
