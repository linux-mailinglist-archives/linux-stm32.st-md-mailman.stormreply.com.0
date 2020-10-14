Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1028E140
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 15:26:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 843B7C424B3;
	Wed, 14 Oct 2020 13:26:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54773C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 13:26:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EDH8ch014255; Wed, 14 Oct 2020 15:26:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=lviZr5mndgb1DhcV9IXIyhpaaUsdsfiUCsuP6d87wN0=;
 b=ZAbExVn7GfBMhBQ+8UKOmdFv87zS+BbDd2+8sxvXSIxR3NbGofB/RtqEXDNcNYiw4nvO
 sDXWcY9zsNo2ge5S1v9Ck4C3z9JJdNdYRB5CtGdOX2cRcNKBaGwIN2jjBc19HWCOPa7Q
 QP9tlP0key/QzQxtSbL25WyeS0srk78vwbBM8H6uvFEzJV9Q1uT0OqBZzXyn4B4jmMNh
 cGpMv+v4LoXaoQU2WUPda4RjN4K2otXbw6miGMEsge/zvWJNSA5sAYoeAluWNqnBFYXg
 XmbKCJ73MTfJu7Scdk1l+t+zkOyurgLS8a3yxh2K4nBSkuP6RfmT/tEN93kBX6Xdikfy /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356ee021-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 15:26:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31AF110002A;
 Wed, 14 Oct 2020 15:26:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08D5A2DC5BF;
 Wed, 14 Oct 2020 15:26:22 +0200 (CEST)
Received: from SFHDAG2NODE1.st.com (10.75.127.4) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 15:26:21 +0200
Received: from SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90]) by
 SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90%20]) with mapi id
 15.00.1473.003; Wed, 14 Oct 2020 15:26:21 +0200
From: Yann GAUTIER <yann.gautier@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
Thread-Index: AQHWoi2b7WHkvVHtlkyJZn5NXXCBPw==
Date: Wed, 14 Oct 2020 13:26:21 +0000
Message-ID: <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
References: <20201009210820.243659-1-marex@denx.de>
In-Reply-To: <20201009210820.243659-1-marex@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <51810C541DF4C642B5D14321E14C8CBD@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_07:2020-10-14,
 2020-10-14 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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



On 10/9/20 11:08 PM, Marek Vasut wrote:
> The default state of SD bus and clock line is logical HI. SD card IO is
> open-drain and pulls the bus lines LO. Always enable the SD bus pull ups
> to guarantee this behavior. Note that on systems with bus voltage level
> shifter on the SD bus, the pull ups might also be built into the level
> shifter, however that should have no negative impact.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index b2d19583450c..73d9a5b7f5ba 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1291,13 +1291,13 @@ pins1 {
>   				 <STM32_PINMUX('D', 2, AF12)>; /* SDMMC1_CMD */
>   			slew-rate = <1>;
>   			drive-push-pull;
> -			bias-disable;
> +			bias-pull-up;
Hi Marek,

This pin config is used by ST board, where we have a level shifter.
This shouldn't be changed. We discussed this with Alex, and a new group 
should be added in this case.

>   		};
>   		pins2 {
>   			pinmux = <STM32_PINMUX('C', 12, AF12)>; /* SDMMC1_CK */
>   			slew-rate = <2>;
>   			drive-push-pull;
> -			bias-disable;
> +			bias-pull-up;
Same case for this one.
>   		};
>   	};
>   
> @@ -1447,13 +1447,13 @@ pins1 {
>   				 <STM32_PINMUX('G', 6, AF10)>; /* SDMMC2_CMD */
>   			slew-rate = <1>;
>   			drive-push-pull;
> -			bias-disable;
> +			bias-pull-up;
This node sdmmc2_b4_pins_b should be used by ST board DK2, which has 
external pull-ups. So this shouldn't be changed as well.
>   		};
>   		pins2 {
>   			pinmux = <STM32_PINMUX('E', 3, AF9)>; /* SDMMC2_CK */
>   			slew-rate = <2>;
>   			drive-push-pull;
> -			bias-disable;
> +			bias-pull-up;
Same here.
>   		};
>   	};
>   
> @@ -1510,7 +1510,7 @@ pins {
>   				 <STM32_PINMUX('C', 7, AF10)>; /* SDMMC2_D7 */
>   			slew-rate = <1>;
>   			drive-push-pull;
> -			bias-disable;
> +			bias-pull-up;
This one is also used on Linux Automation MC-1 board, Ahmad, is it OK 
for you?


Best regards,
Yann
>   		};
>   	};
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
