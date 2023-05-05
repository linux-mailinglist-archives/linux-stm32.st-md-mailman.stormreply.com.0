Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 408BE6F7C8E
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 07:50:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C54C6C6A60D;
	Fri,  5 May 2023 05:50:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E80B1C69069
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 05:50:00 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=igor.pengutronix.de) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1puoKI-00046m-Rk; Fri, 05 May 2023 07:49:54 +0200
References: <20230411083045.2850138-1-s.trumtrar@pengutronix.de>
 <20230411083045.2850138-2-s.trumtrar@pengutronix.de>
 <ebb3050c-c045-3758-5c23-349ab949340e@foss.st.com>
User-agent: mu4e 1.8.14; emacs 30.0.50
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Date: Fri, 05 May 2023 07:48:57 +0200
In-reply-to: <ebb3050c-c045-3758-5c23-349ab949340e@foss.st.com>
Message-ID: <87y1m31g5c.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 01/10] ARM: dts: stm32: Add alternate
 pinmux for ethernet
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


On 2023-05-02 at 17:20 +02, Alexandre TORGUE <alexandre.torgue@foss.st.com> wrote:
> Hi Steffen
>
> On 4/11/23 10:30, Steffen Trumtrar wrote:
>> Add another option for the ethernet0 pins.
>> It is almost identical to ethernet0_rgmii_pins_c apart from TXD0/1.
>> This is used on the Phycore STM32MP1.
>> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>> ---
>>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 50 ++++++++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>> b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>> index a9d2bec990141..1c97db4dbfc6d 100644
>> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
>> @@ -341,6 +341,56 @@ pins1 {
>>   		};
>>   	};
>>   +	ethernet0_rgmii_pins_d: rgmii-3 {
>> +		pins1 {
>> +			pinmux = <STM32_PINMUX('G', 5, AF11)>, /* ETH_RGMII_CLK125 */
>> +				 <STM32_PINMUX('G', 13, AF11)>,	/* ETH_RGMII_TXD0 */
>> +				 <STM32_PINMUX('G', 14, AF11)>,	/* ETH_RGMII_TXD1 */
>> +				 <STM32_PINMUX('C', 2, AF11)>, /* ETH_RGMII_TXD2 */
>> +				 <STM32_PINMUX('E', 2, AF11)>, /* ETH_RGMII_TXD3 */
>> +				 <STM32_PINMUX('B', 11, AF11)>,	/* ETH_RGMII_TX_CTL */
>> +				 <STM32_PINMUX('C', 1, AF11)>; /* ETH_MDC */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <2>;
>> +		};
>> +		pins2 {
>> +			pinmux = <STM32_PINMUX('A', 2, AF11)>; /* ETH_MDIO */
>> +			bias-disable;
>> +			drive-push-pull;
>> +			slew-rate = <0>;
>> +		};
>> +		pins3 {
>> +			pinmux = <STM32_PINMUX('C', 4, AF11)>, /* ETH_RGMII_RXD0 */
>> +				 <STM32_PINMUX('C', 5, AF11)>, /* ETH_RGMII_RXD1 */
>> +				 <STM32_PINMUX('H', 6, AF11)>, /* ETH_RGMII_RXD2 */
>> +				 <STM32_PINMUX('B', 1, AF11)>, /* ETH_RGMII_RXD3 */
>> +				 <STM32_PINMUX('A', 1, AF11)>, /* ETH_RGMII_RX_CLK */
>> +				 <STM32_PINMUX('A', 7, AF11)>; /* ETH_RGMII_RX_CTL */
>> +			bias-disable;
>> +		};
>> +	};
>> +
>> +	ethernet0_rgmii_sleep_pins_d: rgmii-sleep-8 {
>
> Mistake here, it should be rgmii-sleep-3

Meh, good catch. You're right of course, will send a v9.


Thanks,
Steffen

--
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
