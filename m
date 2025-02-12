Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18340A32B6B
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2025 17:21:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1921C78F9F;
	Wed, 12 Feb 2025 16:21:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4002EC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 16:21:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CEa3AK022172;
 Wed, 12 Feb 2025 17:20:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 sa7ZmXyMmD7WcyKboADT8XwFx6T5S7FVc7f0sxyt4WM=; b=5Ob/TXI07szMEjQ9
 13+9jqgYT94rSOsgLS0jiUmB4CtlsdR53GUayWFFeCIfc6+7EVtWFRI76E+9bB08
 ZNsS/pimmI7ucJQjBh/GfqvRXJD1tLAhb+INylLuw+Y2TdsvR7RlEKNFEZ99j9Uk
 vfjG9cP7Ew3eK01SJuqcZUNqa8cCLOT2zMK7JoQ+VjXaD1MCIT1QvhKBhWhczAuJ
 g0jcLw84oV22ZcdcvyraG0QPcusClbKqveJSNRthw3RhXKIuOmiPFTbcViT85QOI
 ir4a4ST7WIljKj1OwORrLCBfmMMmJMU4W998qPc8QgQ2zTx6z+CEPOODjuMm10w9
 sK9sMA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0q01s2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2025 17:20:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E62D740044;
 Wed, 12 Feb 2025 17:19:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A05732BE712;
 Wed, 12 Feb 2025 17:18:31 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Feb
 2025 17:18:30 +0100
Message-ID: <f56ae1b6-657a-4809-b95c-e318462d4270@foss.st.com>
Date: Wed, 12 Feb 2025 17:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250210131826.220318-5-patrice.chotard@foss.st.com>
 <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAMuHMdVkFym-3byZkszsi9tRoZ6zNOMCT79c2EgQQjn5xd19ig@mail.gmail.com>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_05,2025-02-11_01,2024-11-22_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 4/8] memory: Add STM32 Octo Memory
	Manager driver
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



On 2/12/25 13:51, Geert Uytterhoeven wrote:
> Hi Patrice,
> 
> On Mon, 10 Feb 2025 at 14:21, <patrice.chotard@foss.st.com> wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Octo Memory Manager driver (OMM) manages:
>>   - the muxing between 2 OSPI busses and 2 output ports.
>>     There are 4 possible muxing configurations:
>>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>>         output is on port 2
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>>         OSPI2 output is on port 1
>>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>>   - the split of the memory area shared between the 2 OSPI instances.
>>   - chip select selection override.
>>   - the time between 2 transactions in multiplexed mode.
>>   - check firewall access.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/memory/Kconfig
>> +++ b/drivers/memory/Kconfig
>> @@ -225,6 +225,23 @@ config STM32_FMC2_EBI
>>           devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>>           SOCs containing the FMC2 External Bus Interface.
>>
>> +config STM32_OMM
>> +       tristate "STM32 Octo Memory Manager"
>> +       depends on SPI_STM32_OSPI || TEST_COMPILE
> 
> COMPILE_TEST

 good catch 

> 
>> +       help
>> +         This driver manages the muxing between the 2 OSPI busses and
>> +         the 2 output ports. There are 4 possible muxing configurations:
>> +         - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>> +              output is on port 2
>> +         - OSPI1 and OSPI2 are multiplexed over the same output port 1
>> +         - swapped mode (no multiplexing), OSPI1 output is on port 2,
>> +              OSPI2 output is on port 1
>> +         - OSPI1 and OSPI2 are multiplexed over the same output port 2
>> +         It also manages :
>> +           - the split of the memory area shared between the 2 OSPI instances.
>> +           - chip select selection override.
>> +           - the time between 2 transactions in multiplexed mode.
>> +
>>  source "drivers/memory/samsung/Kconfig"
>>  source "drivers/memory/tegra/Kconfig"
> 
>> --- /dev/null
>> +++ b/drivers/memory/stm32_omm.c
> 
>> +static int stm32_omm_set_amcr(struct device *dev, bool set)
>> +{
>> +       struct stm32_omm *omm = dev_get_drvdata(dev);
>> +       struct regmap *syscfg_regmap;
>> +       struct device_node *node;
>> +       struct resource res, res1;
>> +       resource_size_t mm_ospi2_size = 0;
>> +       static const char * const mm_name[] = { "ospi1", "ospi2" };
>> +       u32 amcr_base, amcr_mask;
>> +       int ret, i, idx;
> 
> unsigned int i

ok

> 
>> +       unsigned int amcr, read_amcr;
>> +
>> +       for (i = 0; i < omm->nb_child; i++) {
>> +               idx = of_property_match_string(dev->of_node,
>> +                                              "memory-region-names",
>> +                                              mm_name[i]);
>> +               if (idx < 0)
>> +                       continue;
>> +
>> +               /* res1 only used on second loop iteration */
>> +               res1.start = res.start;
>> +               res1.end = res.end;
>> +
>> +               node = of_parse_phandle(dev->of_node, "memory-region", idx);
>> +               if (!node)
>> +                       continue;
>> +
>> +               ret = of_address_to_resource(node, 0, &res);
>> +               if (ret) {
>> +                       dev_err(dev, "unable to resolve memory region\n");
>> +                       return ret;
>> +               }
>> +
>> +               /* check that memory region fits inside OMM memory map area */
>> +               if (!resource_contains(omm->mm_res, &res)) {
>> +                       dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
>> +                               mm_name[i]);
>> +                       dev_err(dev, "[0x%llx-0x%llx] doesn't fit inside [0x%llx-0x%llx]\n",
>> +                               res.start, res.end,
>> +                               omm->mm_res->start, omm->mm_res->end);
> 
> As reported by the kernel test robot, this fails to build when
> resource_size_t differs from unsigned long long.  However, you can
> easily print the full resource instead:
> 
>     dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
> 
> https://elixir.bootlin.com/linux/v6.13.2/source/Documentation/core-api/printk-formats.rst#L206

OK, thanks for this tips

Patrice

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
