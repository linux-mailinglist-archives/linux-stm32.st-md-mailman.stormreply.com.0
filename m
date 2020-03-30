Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C01977AF
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2020 11:20:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DE2EC36B0B;
	Mon, 30 Mar 2020 09:20:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F138CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2020 09:20:11 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U9IYdM014314; Mon, 30 Mar 2020 11:20:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BDnCI6b6acG0T9BuR5lD6KHabVMwol0RzaAFhI2kJT4=;
 b=O80uZaTrRU+TKNGXXOn3OuaqH7qhsSISN7rM7SxjiNx5UpqOOxsD2WxxsHg7k4VSTZmI
 Gdc8/quoSj95b7b7LiDadZ+jAgcBfd3nIn/BHNEeDJqBQPae+I5qo1WZiLu5YbT3+Ahk
 VddpuR3XxuWnG9pVc/aaJeJzTeUpwJPVfU+OBr5KoNkGgkW1rN4T0o0pkhTHBeVXLY+g
 /5S8oJ38QulCzBiS7oGMOOQBYV/b6dfjV2YMeXQrGwsrc0hNUcf66VtMGS1PoOE0WaCX
 1InMK+Fw12Lsd95xFVgpRXzS7h9y4mBfukwQHwyCG5AhE4Aqc4bl3pFndDzOFfLuAfbq vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53jtcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 11:20:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D394F10002A;
 Mon, 30 Mar 2020 11:20:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE52B2A6215;
 Mon, 30 Mar 2020 11:20:00 +0200 (CEST)
Received: from [10.211.11.146] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 30 Mar
 2020 11:19:57 +0200
To: Marek Vasut <marex@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <lee.jones@linaro.org>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <tony@atomide.com>
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-4-git-send-email-christophe.kerello@st.com>
 <f6a2c766-8ae5-fab7-e2f6-db23f39b5d91@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <93fce520-9269-123c-9523-173e75cdce2e@st.com>
Date: Mon, 30 Mar 2020 11:19:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f6a2c766-8ae5-fab7-e2f6-db23f39b5d91@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI
	controller driver
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



On 3/30/20 3:24 AM, Marek Vasut wrote:
> On 3/23/20 3:58 PM, Christophe Kerello wrote:
>> The driver adds the support for the STMicroelectronics FMC2 EBI controller
>> found on STM32MP SOCs.
>>
> 
> On DH STM32MP1 SoM in PDK2 carrier board,
> Tested-by: Marek Vasut <marex@denx.de>
> 
> btw. it seems this sets BTRx DATLAT and CLKDIV to 0xf , it's "Don't
> care" in the datasheet for Muxed mode, but then it should probably be
> set to 0.

Hi Marek,

Thanks for testing.

These 2 bit fields (BTRx DATLAT and CLKDIV) are only needed for 
synchronous transactions. Based on your bindings, the transaction type 
is asynchronous.
CLKDIV bit fields should not be set to 0x0, as this value is reserved 
for this bit field. The driver keeps the reset value when it is not 
needed to update a bit field.

Regards,
Christophe Kerello.

> 
> The bindings I used are below:
> 
> &fmc {
>          pinctrl-names = "default", "sleep";
>          pinctrl-0 = <&fmc_pins_b>;
>          pinctrl-1 = <&fmc_sleep_pins_b>;
>          status = "okay";
>          #address-cells = <1>;
>          #size-cells = <1>;
>          /delete-property/interrupts;
>          /delete-property/dmas;
>          /delete-property/dma-names;
>          reg = <0x58002000 0x1000>;
>          ranges;
> 
>          ebi {
>                  #address-cells = <2>;
>                  #size-cells = <1>;
>                  compatible = "st,stm32mp1-fmc2-ebi";
>                  ranges = <0 0 0x60000000 0x4000000>,
>                           <1 0 0x64000000 0x4000000>,
>                           <2 0 0x68000000 0x4000000>,
>                           <3 0 0x6c000000 0x4000000>;
> 
>                  ksz8851: ks8851mll@0,0 {
>                          compatible = "micrel,ks8851-mll";
>                          reg = <1 0x0 0x2 1 0x2 0x20000>;
>                          interrupt-parent = <&gpioc>;
>                          interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>                          bank-width = <2>;
> 
>                          /* Timing values are in nS */
>                          st,fmc2_ebi_cs_mux_enable;
>                          st,fmc2_ebi_cs_transaction_type = <4>;
>                          st,fmc2_ebi_cs_buswidth = <16>;
>                          st,fmc2_ebi_cs_address_setup = <6>;
>                          st,fmc2_ebi_cs_address_hold = <6>;
>                          st,fmc2_ebi_cs_data_setup = <127>;
>                          st,fmc2_ebi_cs_bus_turnaround = <9>;
>                          st,fmc2_ebi_cs_data_hold = <9>;
>                  };
> 
>                  sram@3,0 {
>                          compatible = "mtd-ram";
>                          reg = <3 0x0 0x80000>;
>                          bank-width = <2>;
> 
>                          /* Timing values are in nS */
>                          st,fmc2_ebi_cs_mux_enable;
>                          st,fmc2_ebi_cs_transaction_type = <4>;
>                          st,fmc2_ebi_cs_buswidth = <16>;
>                          st,fmc2_ebi_cs_address_setup = <6>;
>                          st,fmc2_ebi_cs_address_hold = <6>;
>                          st,fmc2_ebi_cs_data_setup = <127>;
>                          st,fmc2_ebi_cs_bus_turnaround = <9>;
>                          st,fmc2_ebi_cs_data_hold = <9>;
>                  };
>          };
> };
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
