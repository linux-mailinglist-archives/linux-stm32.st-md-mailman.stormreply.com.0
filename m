Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755DC140F70
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2020 17:57:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D352C36B0F;
	Fri, 17 Jan 2020 16:57:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7815C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2020 16:57:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00HGrXCG029102; Fri, 17 Jan 2020 17:57:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ToWKcgdqHr2y9NGwMN8FxA1C8N8+itLWrzlpfIiirBA=;
 b=mgUiZuPBnyuXekfOc07M8ZrLuFHk4l1tSZaR1p0ERH3OFsdqtHjFJlrC7MkfaiJNoSoE
 fiC8SgiVTKiuxZGF4boZhnavXCQ2P7nqGbVkLLlkz+NhoK8Tlt7uBW7o/K5n/0AkId+q
 OVxCyYDNBPelp6Crh2pBYmC/ywNhAmLcp5JzLHWBwJn6TnHmiHS8oqlQLuWhW76Nfvi6
 PFOBohbGx5C2vAYI1+gvj4Uf+YMubqU++LodsTV2/M5uwDrWJ41ycirNwwUmsBTNo1so
 6OJMhIqVK5ji4ZKmsvFghg2W1qqvfyHebv1+Ht5gtHmJaLdmCYSCvDbMXNGBl281660u yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xk0r7cp76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 17:57:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D2466100038;
 Fri, 17 Jan 2020 17:57:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C73B222169C;
 Fri, 17 Jan 2020 17:57:13 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Jan
 2020 17:57:13 +0100
To: Marek Vasut <marex@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20200115094714.154581-1-marex@denx.de>
 <2881f2b053b04d718eba35e61f7b5403@SFHDAG6NODE3.st.com>
 <435364e8-9737-58ab-1497-f532f57af65d@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6b3a1cb7-02e9-2293-00c9-710979cbc258@st.com>
Date: Fri, 17 Jan 2020 17:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <435364e8-9737-58ab-1497-f532f57af65d@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_04:2020-01-16,
 2020-01-17 signatures=0
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add DH Electronics DHCOM
 SoM and PDK2 board
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

Hi Marek

Minor comments below.

On 1/17/20 1:51 PM, Marek Vasut wrote:
> On 1/15/20 5:46 PM, Patrick DELAUNAY wrote:
>> Hi Marek;
> 
> Hi,
> 
>> Adds the Linux Maintainers for STM32M linux patch:
> 
> Added, if there is a need for V2.
> 
> (no further comments below)
> 
> [...]
>>
>> Hi Alexandre,
>>
>> Can you review this patch.
>>
>> Regards
>>
>> Patrick
>>
>>> -----Original Message-----
>>> From: Marek Vasut <marex@denx.de>
>>> Sent: mercredi 15 janvier 2020 10:47
>>> To: linux-arm-kernel@lists.infradead.org
>>> Cc: Marek Vasut <marex@denx.de>; Patrick DELAUNAY
>>> <patrick.delaunay@st.com>; Patrice CHOTARD <patrice.chotard@st.com>
>>> Subject: [PATCH] ARM: dts: stm32: Add DH Electronics DHCOM SoM and PDK2
>>> board
>>> Importance: High
>>>
>>> Add support for DH Electronics DHCOM SoM and PDK2 rev. 400 carrier board.
>>> This is an SoM with STM32MP157C and an evaluation kit. The baseboard
>>> provides Ethernet, UART, USB, CAN and optional display.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Patrick Delaunay <patrick.delaunay@st.com>
>>> Cc: Patrice Chotard <patrice.chotard@st.com>
>>> ---
>>>   arch/arm/boot/dts/Makefile                   |   1 +
>>>   arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts | 351 ++++++++++++++++++
>>> arch/arm/boot/dts/stm32mp157c-dhcom-som.dtsi | 368 +++++++++++++++++++
>>>   3 files changed, 720 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dts
>>>   create mode 100644 arch/arm/boot/dts/stm32mp157c-dhcom-som.dtsi
>>>

...

>>> +
>>> +&m_can1 {
>>> +	pinctrl-names = "default", "sleep";
>>> +	pinctrl-0 = <&m_can1_pins_a>;
>>> +	pinctrl-1 = <&m_can1_sleep_pins_a>;
>>> +	status = "okay";
>>> +};
>>> +
>>> +&pinctrl {

You could define DH pinctrl addons in stm32mp15-pinctrl.dtsi

>>> +	ethernet0_rmii_pins_a: rmii-0 {
>>> +		pins1 {
>>> +			pinmux = <STM32_PINMUX('G', 13, AF11)>, /*
>>> ETH1_RMII_TXD0 */
>>> +				 <STM32_PINMUX('G', 14, AF11)>, /*
>>> ETH1_RMII_TXD1 */
>>> +				 <STM32_PINMUX('B', 11, AF11)>, /*
>>> ETH1_RMII_TX_EN */
>>> +				 <STM32_PINMUX('A', 1, AF0)>,   /*
>>> ETH1_RMII_REF_CLK */
>>> +				 <STM32_PINMUX('A', 2, AF11)>,  /* ETH1_MDIO
>>> */
>>> +				 <STM32_PINMUX('C', 1, AF11)>;  /* ETH1_MDC
>>> */
>>> +			bias-disable;
>>> +			drive-push-pull;
>>> +			slew-rate = <2>;
>>> +		};
>>> +		pins2 {
>>> +			pinmux = <STM32_PINMUX('C', 4, AF11)>,  /*
>>> ETH1_RMII_RXD0 */
>>> +				 <STM32_PINMUX('C', 5, AF11)>,  /*
>>> ETH1_RMII_RXD1 */
>>> +				 <STM32_PINMUX('A', 7, AF11)>;  /*
>>> ETH1_RMII_CRS_DV */
>>> +			bias-disable;
>>> +		};
>>> +	};
>>> +
>>> +	ethernet0_rmii_pins_sleep_a: rmii-sleep-0 {
>>> +		pins1 {
>>> +			pinmux = <STM32_PINMUX('G', 13, ANALOG)>, /*
>>> ETH1_RMII_TXD0 */
>>> +				 <STM32_PINMUX('G', 14, ANALOG)>, /*
>>> ETH1_RMII_TXD1 */
>>> +				 <STM32_PINMUX('B', 11, ANALOG)>, /*
>>> ETH1_RMII_TX_EN */
>>> +				 <STM32_PINMUX('A', 2, ANALOG)>,  /*
>>> ETH1_MDIO */
>>> +				 <STM32_PINMUX('C', 1, ANALOG)>,  /*
>>> ETH1_MDC */
>>> +				 <STM32_PINMUX('C', 4, ANALOG)>,  /*
>>> ETH1_RMII_RXD0 */
>>> +				 <STM32_PINMUX('C', 5, ANALOG)>,  /*
>>> ETH1_RMII_RXD1 */
>>> +				 <STM32_PINMUX('A', 1, ANALOG)>,  /*
>>> ETH1_RMII_REF_CLK */
>>> +				 <STM32_PINMUX('A', 7, ANALOG)>;  /*
>>> ETH1_RMII_CRS_DV */
>>> +		};
>>> +	};
>>> +
>>> +	sai2_pins_a: sai2-0 {
>>> +		pins1 {
>>> +			pinmux = <STM32_PINMUX('I', 6, AF10)>,	/*
>>> SAI2_SD_A */
>>> +				 <STM32_PINMUX('I', 7, AF10)>,	/*
>>> SAI2_FS_A */
>>> +				 <STM32_PINMUX('D', 13, AF10)>;	/*
>>> SAI2_SCK_A */
>>> +			slew-rate = <0>;
>>> +			drive-push-pull;
>>> +			bias-disable;
>>> +		};
>>> +		pins2 {
>>> +			pinmux = <STM32_PINMUX('F', 11, AF10)>;	/*
>>> SAI2_SD_B */
>>> +			bias-disable;
>>> +		};
>>> +	};
>>> +
>>> +	sai2_sleep_pins_a: sai2-sleep-0 {
>>> +		pins {
>>> +			pinmux = <STM32_PINMUX('I', 6, ANALOG)>,  /*
>>> SAI2_SD_A */
>>> +				 <STM32_PINMUX('I', 7, ANALOG)>,  /*
>>> SAI2_FS_A */
>>> +				 <STM32_PINMUX('D', 13, ANALOG)>, /*
>>> SAI2_SCK_A */
>>> +				 <STM32_PINMUX('F', 11, ANALOG)>; /*
>>> SAI2_SD_B */
>>> +		};
>>> +	};
>>> +
>>> +	usart3_pins_a: usart3-0 {
>>> +		pins1 {
>>> +			pinmux = <STM32_PINMUX('B', 10, AF7)>; /*
>>> USART3_TX */
>>> +			bias-disable;
>>> +			drive-push-pull;
>>> +			slew-rate = <0>;
>>> +		};
>>> +		pins2 {
>>> +			pinmux = <STM32_PINMUX('B', 12, AF8)>; /*
>>> USART3_RX */
>>> +			bias-disable;
>>> +		};

...

>>> +&sdmmc3 {
>>> +	pinctrl-names = "default", "opendrain", "sleep";
>>> +	pinctrl-0 = <&sdmmc3_b4_pins_a>;
>>> +	pinctrl-1 = <&sdmmc3_b4_od_pins_a>;
>>> +	pinctrl-2 = <&sdmmc3_b4_sleep_pins_a>;
>>> +	broken-cd;
>>> +	st,neg-edge;
>>> +	bus-width = <4>;
>>> +	vmmc-supply = <&v3v3>;
>>> +	vqmmc-supply = <&v3v3>;
>>> +	mmc-ddr-3_3v;
>>> +	status = "okay";
>>> +};
>>> +
>>> +&qspi {

If you follow alphabetic order reorder this node.

>>> +	pinctrl-names = "default", "sleep";
>>> +	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
>>> +	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a
>>> &qspi_bk2_sleep_pins_a>;
>>> +	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>> +	status = "okay";
>>> +
>>> +	flash0: mx66l51235l@0 {
>>> +		compatible = "jedec,spi-nor";
>>> +		reg = <0>;
>>> +		spi-rx-bus-width = <4>;
>>> +		spi-max-frequency = <108000000>;
>>> +		#address-cells = <1>;
>>> +		#size-cells = <1>;
>>> +	};
>>> +};
>>> +
>>> +&uart4 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&uart4_pins_a>;
>>> +	status = "okay";
>>> +};
>>> --
>>> 2.24.1
>>
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
