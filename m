Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC03739867
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 09:50:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53608C65E4F;
	Thu, 22 Jun 2023 07:50:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E38C0C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 07:50:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35M7fj6L022380; Thu, 22 Jun 2023 09:50:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iCQ9/Z5yKXxcex+mnARghE6TVsLc1zROYMwOn4/VDIE=;
 b=r2IqUJAxD2W9H7aKUvpnLGw/QbV0hTqHvkDnNJ7ILjki7m0S038sA6gu1JbnKR1YP7qe
 l9+hy0vkeAtA2Rh55HgpQXVvXFAypUCdGhYXvA9lmdwR7Hs8XjQfGW9dG9YW7NlgS3uk
 vj1jwSfrm+9PPs7Fo8SYgVaK4+Ah5VprgJatgwkZz6WUWOXEaoiWTXIXpihBQN4ikYsU
 F/oh1cYKksxeBE1JQYuO7ZNJlEX6p8YSqacyS4wPznaToEtj0qxifjV8908ASQi/Q0lm
 nYbxtW/VpeTPgQd274FYJLc+39UDNXiUsP/o3N+44reYxYiuc1ePXhWKYQ5NOKSst8wt mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rcj4tr2v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jun 2023 09:50:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A10F210006F;
 Thu, 22 Jun 2023 09:50:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 781B12138FB;
 Thu, 22 Jun 2023 09:50:18 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 22 Jun
 2023 09:50:17 +0200
Message-ID: <6d3c01d0-c809-b420-335f-551c98956493@foss.st.com>
Date: Thu, 22 Jun 2023 09:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, arnd Bergmann <arnd@arndb.de>, Arnaud
 Pouliquen <arnaud.pouliquen@foss.st.com>
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
 <20230602132859.16442-5-alexandre.torgue@foss.st.com>
 <24e9c526-4128-4e63-8d28-c4ef1647f886@roeck-us.net>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <24e9c526-4128-4e63-8d28-c4ef1647f886@roeck-us.net>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_04,2023-06-16_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Olof Johansson <olof@lixom.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 04/10] arm64: introduce STM32 family on
 Armv8 architecture
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

Hi Guenter

On 6/22/23 02:57, Guenter Roeck wrote:
> Hi,
> 
> On Fri, Jun 02, 2023 at 03:28:53PM +0200, Alexandre Torgue wrote:
>> Add a dedicated ARCH_STM32 for STM32 SoCs config. First STM32 Armv8 SoC
>> family is the STM32MP25 which is composed of STM32MP251, STM32MP253,
>> STM32MP255, STM32MP257 SoCs.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>
> 
> This patch (or patch series) results in the following build error when
> trying to build arm64:allmodconfig.
> 
> Building arm64:allmodconfig ... failed

Should be fixed by this patch:

https://lore.kernel.org/linux-arm-kernel/9ebb9a5a-7bc8-da67-529f-5193b9352b23@infradead.org/T/

regards
Alex


> --------------
> Error log:
> In file included from include/linux/printk.h:564,
>                   from include/asm-generic/bug.h:22,
>                   from arch/arm64/include/asm/bug.h:26,
>                   from include/linux/bug.h:5,
>                   from include/linux/fortify-string.h:5,
>                   from include/linux/string.h:254,
>                   from include/linux/dma-mapping.h:7,
>                   from drivers/remoteproc/stm32_rproc.c:9:
> drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_mem_alloc':
> drivers/remoteproc/stm32_rproc.c:122:22: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'size_t'
> 
> Bisect log attached.
> 
> Guenter
> 
> ---
> # bad: [15e71592dbae49a674429c618a10401d7f992ac3] Add linux-next specific files for 20230621
> # good: [45a3e24f65e90a047bef86f927ebdc4c710edaa1] Linux 6.4-rc7
> git bisect start 'HEAD' 'v6.4-rc7'
> # bad: [e867e67cd55ae460c860ffd896c7fc96add2821c] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> git bisect bad e867e67cd55ae460c860ffd896c7fc96add2821c
> # bad: [57b289d5b1005a9c39d6d6567e0ef6115bd59cea] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> git bisect bad 57b289d5b1005a9c39d6d6567e0ef6115bd59cea
> # good: [dc6399fc9ae6d2530fc38fb3ae96bcc8393bd66f] Merge branch 'for-next/perf' of git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
> git bisect good dc6399fc9ae6d2530fc38fb3ae96bcc8393bd66f
> # good: [5bfea833dd8f972ce3435359f12f61bdbf01b147] Merge tag 'v6.4-next-dts64' of https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux into soc/dt
> git bisect good 5bfea833dd8f972ce3435359f12f61bdbf01b147
> # bad: [6f8f9120fd588b28edb0a9c6b9ae9ca6c261d9f6] Merge branch 'for-linux-next' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
> git bisect bad 6f8f9120fd588b28edb0a9c6b9ae9ca6c261d9f6
> # bad: [fe16e4b5e7fa1badc2fa69d85f7b13926cce8fe2] Merge branch 'at91-next' of git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
> git bisect bad fe16e4b5e7fa1badc2fa69d85f7b13926cce8fe2
> # good: [0e4ad579ef10d4e9eca86eb33fb4cd87de7c05c4] soc: document merges
> git bisect good 0e4ad579ef10d4e9eca86eb33fb4cd87de7c05c4
> # good: [d704f1fe9f4a4ae9c9f1f9fac1e4194c34dd035b] Merge tag 'arm-soc/for-6.5/devicetree-arm64' of https://github.com/Broadcom/stblinux into soc/dt
> git bisect good d704f1fe9f4a4ae9c9f1f9fac1e4194c34dd035b
> # bad: [26588df4e5a385e5b7751997d48bdeef042cf736] Merge branch 'soc/newsoc' into for-next
> git bisect bad 26588df4e5a385e5b7751997d48bdeef042cf736
> # good: [6bce45197c25c99612a3c5e0cf041d18aa28fbf3] Merge branch 'soc/dt' into for-next
> git bisect good 6bce45197c25c99612a3c5e0cf041d18aa28fbf3
> # bad: [3b170e1653c05b067ea6ef616ece961b07714f48] arm64: dts: st: introduce stm32mp25 pinctrl files
> git bisect bad 3b170e1653c05b067ea6ef616ece961b07714f48
> # good: [c3053382574a5a829c93fb5ab0bb52d20456e745] dt-bindings: stm32: add st,stm32mp25-syscfg compatible for syscon
> git bisect good c3053382574a5a829c93fb5ab0bb52d20456e745
> # bad: [5d30d03aaf78586c37100006ba271d045f730bb5] arm64: dts: st: introduce stm32mp25 SoCs family
> git bisect bad 5d30d03aaf78586c37100006ba271d045f730bb5
> # bad: [9e4e24414cc6b45bd887d746a59691e295431ddf] arm64: introduce STM32 family on Armv8 architecture
> git bisect bad 9e4e24414cc6b45bd887d746a59691e295431ddf
> # first bad commit: [9e4e24414cc6b45bd887d746a59691e295431ddf] arm64: introduce STM32 family on Armv8 architecture

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
