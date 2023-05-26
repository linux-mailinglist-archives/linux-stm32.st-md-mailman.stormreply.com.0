Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6624571297B
	for <lists+linux-stm32@lfdr.de>; Fri, 26 May 2023 17:29:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECB70C6A615;
	Fri, 26 May 2023 15:29:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAFE5C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 May 2023 15:29:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QCq8vF015360; Fri, 26 May 2023 17:29:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=HBLC25tXm7PL8iCv/hvsiP333s5gaIjYk0U6zt24BHc=;
 b=2zxcYfhHIFQK6h07+ohH5SliIZjSmgduH3XlzOeeKAzGZG6YSU1QpMP32OA50KNMWWxN
 0dkhkSpo/nUUn9lJQow5Ob9wMozCRWh/kUMYVSd6PJAcJFoiXabuDIub427Jk+m7spl+
 QpLddFyMxMp2VjDM5gbBdHC+j1cTXV2nNxJH+i+BZq4qVv9yVcp00lOBi+xHyjVJUAZg
 M1F1MJxHZcsY2MsR0317iCWYj/2EhoG0RNlyMBvsz7LQ3VK8L+3Rs7ZDdqBOA44BXnp5
 5poFv9F5BT/g58FUSNZl4VqHaAVdz85BeNLE/sPxV5ZhXNdpTKSSQ9K+IW21vx5yxwIa ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qttufa14n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 May 2023 17:29:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC36E100034;
 Fri, 26 May 2023 17:28:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9FF23C6AC;
 Fri, 26 May 2023 17:28:59 +0200 (CEST)
Received: from LMECWL1299 (10.201.28.137) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 26 May
 2023 17:28:57 +0200
From: <patrick.delaunay@foss.st.com>
To: 'Marek Vasut' <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20230517152513.27922-1-marex@denx.de>
 <20230517152513.27922-3-marex@denx.de>
In-Reply-To: <20230517152513.27922-3-marex@denx.de>
Date: Fri, 26 May 2023 17:28:51 +0200
Message-ID: <02ca01d98fe6$ca371d80$5ea55880$@foss.st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQHZj9Uh86Xh97Obl0G0KFWD/onRSq9skNqA
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2023-05-26T15:28:51Z;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=d91f1318-ed6d-4299-a9f2-97d9fb285e39;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
X-Originating-IP: [10.201.28.137]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_06,2023-05-25_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, 'Conor Dooley' <conor+dt@kernel.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
 'Rob Herring' <robh+dt@kernel.org>,
 'Srinivas Kandagatla' <srinivas.kandagatla@linaro.org>,
 'Maxime Coquelin' <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: Add nvmem-syscon
	node to TAMP to expose boot count on DHSOM
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

Hi Marek,

> From: Marek Vasut <marex@denx.de>
> Sent: Wednesday, May 17, 2023 5:25 PM
> Subject: [PATCH v2 3/3] ARM: dts: stm32: Add nvmem-syscon node to TAMP to
> expose boot count on DHSOM
> 
> Add nvmem-syscon subnode to expose TAMP_BKPxR register 19 to user space.
> This register contains U-Boot boot counter, by exposing it to user space the user
> space can reset the boot counter.
> 
> Read access example:
> "
> $ hexdump -vC /sys/bus/nvmem/devices/5c00a000.tamp\:nvmem0/nvmem
> 00000000  0c 00 c4 b0
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: No change
> ---
>  arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 11 +++++++++++
> arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 11 +++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 74735552f4803..b2557bb718f52 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -537,6 +537,17 @@ &sdmmc3 {
>  	status = "okay";
>  };
> 
> +&tamp {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	/* Boot counter */
> +	nvmem {
> +		compatible = "nvmem-syscon";
> +		reg = <0x14c 0x4>;
> +	};
> +};
> +
>  &uart4 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart4_pins_a>;
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index bba19f21e5277..864960387e634 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -269,3 +269,14 @@ &rng1 {
>  &rtc {
>  	status = "okay";
>  };
> +
> +&tamp {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	/* Boot counter */
> +	nvmem {

According binding you need to add "@<reg>" => nvmem@14c

And you export only TAMP_BKP19R directly in a nvmem region ?

> +		compatible = "nvmem-syscon";
> +		reg = <0x14c 0x4>;
> +	};
> +};


the boot counter could be a nvem cell so you could expose  other backup registers 

For example :

&tamp {
	#address-cells = <1>;
	#size-cells = <1>;

	nvmem@14c  {
		compatible = "nvmem-syscon";
		reg = <0x14c 0x4>;

		/* Data cells */
		boot_counter: boot-counter@14c {
			reg = <0x14c 0x4>;
		};
	};
};

Even if you export more backup register the cell will be correctly described in DT
and could be accessible directly  with sysfs without managed offset in userland

with https://lore.kernel.org/lkml/202305240724.z3McDuYM-lkp@intel.com/T/
Or previous serie https://lore.kernel.org/lkml/20211220064730.28806-1-zajec5@gmail.com/


for example to export all the free register:

Reference: https://wiki.st.com/stm32mpu/wiki/STM32MP15_backup_registers

the cell " boot-counter" will be always available for users.

&tamp {
	#address-cells = <1>;
	#size-cells = <1>;

	/* backup register: 10 to 21 */
	nvmem@0x128  {
		compatible = "nvmem-syscon";
		reg = <0x128 0x44>;

		/* Data cells */
		boot_counter: boot-counter@14c {
			reg = <0x14c 0x4>;
		};
		boot_mode: boot-mode@150 {
			reg = <0x150 0x4>;
		};
....
	};
};


Patrick

> --
> 2.39.2

ST Restricted

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
