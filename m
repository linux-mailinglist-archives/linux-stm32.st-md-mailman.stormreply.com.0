Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E302FAA92E5
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 14:19:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99228C78F63;
	Mon,  5 May 2025 12:19:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9454BC78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 12:19:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5458Bxb4012447;
 Mon, 5 May 2025 14:19:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 gQ6gmPL5iKLg1+0Zkeo/dLhugc+HO3kcupvLJaT12dI=; b=Nfl17y9Z1jpnKAPG
 2x01UVnZx1dB6+5vfCYnZpwYsP1rf8W4i6qqZZ6t3nK1nWBByep/ORElkVEykbCm
 GmpQtKnOfc7C53/yZEFALCiamuOV19OmEkVCZrvcYkbsvFd0oF5s2OJaisey/VUL
 W0j0vl9sgRYoDDGQ6uHDfYfKGUEfSrgVczW8XSLqBKHuay5fVZib6bVwcFbCwkS7
 FMnE2h9CiY8vMm9FuxyYTUwtmrkHHiLp3YCH3K6xLkB7Dh3YkJXQ7uptghFNRTCs
 YZ76XZv5AUVRPG6Vz5uHrQvGlD0FwbHzKxU2uoCzaDhdpdOcbytS8soFyYddWnI4
 LE/EDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dbf36902-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 May 2025 14:19:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 888B640058;
 Mon,  5 May 2025 14:18:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07C5DB19791;
 Mon,  5 May 2025 14:15:28 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 May
 2025 14:15:27 +0200
Message-ID: <6d697e1e-84da-4988-8564-91430e820fef@foss.st.com>
Date: Mon, 5 May 2025 14:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <174636664232.45285.4829080141383638928.b4-ty@linaro.org>
 <ec294e4f-274a-45ae-ac10-464ae4ae6f66@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <ec294e4f-274a-45ae-ac10-464ae4ae6f66@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v11 0/3] Add STM32MP25 SPI NOR support
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



On 5/4/25 18:16, Krzysztof Kozlowski wrote:
> On 04/05/2025 15:50, Krzysztof Kozlowski wrote:
>>
>> On Mon, 28 Apr 2025 10:58:29 +0200, Patrice Chotard wrote:
>>> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
>>>
>>> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
>>> the memory area split, the chip select override and the time constraint
>>> between its 2 Octo SPI children.
>>>
>>> Due to these depedencies, this series adds support for:
>>>   - Octo Memory Manager driver.
>>>   - Octo SPI driver.
>>>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/3] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
>>       https://git.kernel.org/krzk/linux-mem-ctrl/c/43eb1b288072641b7de8f5d5c15bde69e6e8589a
> 
> And dropped everything - it is full of warnings.

Hi Krzysztof,

What are the warnings you encountered ?

On my side, i double check and found nothing wrong neither on bindings side nor on source code side:

I previously checked that everything was up to date : 

pip3 install dtschema --upgrade
Defaulting to user installation because normal site-packages is not writeable
Requirement already satisfied: dtschema in /local/home/nxp11987/.local/lib/python3.8/site-packages (2025.2)
Requirement already satisfied: ruamel.yaml>0.15.69 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from dtschema) (0.17.21)
Requirement already satisfied: jsonschema<4.18,>=4.1.2 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from dtschema) (4.17.3)
Requirement already satisfied: rfc3987 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from dtschema) (1.3.8)
Requirement already satisfied: pylibfdt in /local/home/nxp11987/.local/lib/python3.8/site-packages (from dtschema) (1.6.1)
Requirement already satisfied: attrs>=17.4.0 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from jsonschema<4.18,>=4.1.2->dtschema) (19.3.0)
Requirement already satisfied: importlib-resources>=1.4.0 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from jsonschema<4.18,>=4.1.2->dtschema) (5.7.1)
Requirement already satisfied: pkgutil-resolve-name>=1.3.10 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from jsonschema<4.18,>=4.1.2->dtschema) (1.3.10)
Requirement already satisfied: pyrsistent!=0.17.0,!=0.17.1,!=0.17.2,>=0.14.0 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from jsonschema<4.18,>=4.1.2->dtschema) (0.18.1)
Requirement already satisfied: ruamel.yaml.clib>=0.2.6 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from ruamel.yaml>0.15.69->dtschema) (0.2.6)
Requirement already satisfied: zipp>=3.1.0 in /local/home/nxp11987/.local/lib/python3.8/site-packages (from importlib-resources>=1.4.0->jsonschema<4.18,>=4.1.2->dtschema) (3.20.2)


export CROSS_COMPILE=aarch64-linux- ARCH=arm64 KBUILD_OUTPUT=out/
make defconfig
make[1]: Entering directory '/local/home/nxp11987/projects/community/kernel.org/linux/out'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o

  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'defconfig'
#
# configuration written to .config
#
make[1]: Leaving directory '/local/home/nxp11987/projects/community/kernel.org/linux/out'

Then i applied this series https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=957628 
above the current series to check DTB against bindings: 

make CHECK_DTBS=y st/stm32mp257f-ev1.dtb

make[1]: Entering directory '/local/home/nxp11987/projects/community/kernel.org/linux/out'
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  HOSTLD  scripts/dtc/fdtoverlay
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/local/home/nxp11987/projects/community/kernel.org/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
  UPD     include/config/kernel.release
  DTC [C] arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb
make[1]: Leaving directory '/local/home/nxp11987/projects/community/kernel.org/linux/out'

and finally :

make CHECK_DTBS=y DT_SCHEMA_FILES=st,stm32mp25-omm.yaml st/stm32mp257f-ev1.dtb
make[1]: Entering directory '/local/home/nxp11987/projects/community/kernel.org/linux/out'
  DTC [C] arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb
make[1]: Leaving directory '/local/home/nxp11987/projects/community/kernel.org/linux/out'

Thanks
Patrice

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
