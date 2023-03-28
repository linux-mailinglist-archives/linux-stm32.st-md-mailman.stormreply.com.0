Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 547CF6CBE59
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 14:02:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E817AC6905A;
	Tue, 28 Mar 2023 12:02:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F988C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 12:02:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32S9sgHF000481; Tue, 28 Mar 2023 14:02:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VlT8q9AO7WzXKkgQQNzSHFx28HHvMOF6aTI5q0kk19g=;
 b=tup9VkGTqAsOA2iWqWC/d7QmdejbFSZYBR05G9NSmgslKgC5Rbt7EPMc1j7r6VMHpWlO
 a6nEMHrSP5V/K21WzusUEWws0RvQKQny2JTstm/Fp0iexKpjVqzUNALw0C+S5PGhThyh
 /E4uErUYN9G3gRrB7Dm5mdg1Qn0H8QDMS1wzU1fspzAL9p20Ac064AXrUQ62iBJqFIJv
 R+hlQNeUt+tbIbRSWTwF+1uWQqxO0/zeh7/5/hbl5OXNBhDhflHPqpf1VTtIaf3QeIJ2
 toDrJb9nKVTpsbxpLHmoSZFIgtbCzgAOKR0HlXwMHO8ESCUx+6iT9pSc4EUDgq3RJIE7 lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pkvs4sfvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 14:02:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 386F310002A;
 Tue, 28 Mar 2023 14:02:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 33696212FCC;
 Tue, 28 Mar 2023 14:02:42 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 14:02:41 +0200
Message-ID: <5c67d003-c893-8540-a971-6954a57399e5@foss.st.com>
Date: Tue, 28 Mar 2023 14:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Valentin Caron <valentin.caron@foss.st.com>
References: <20230327152948.274743-1-valentin.caron@foss.st.com>
 <20230327152948.274743-2-valentin.caron@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230327152948.274743-2-valentin.caron@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] ARM: dts: stm32: change USART1 clock
 to an SCMI clock on stm32mp15 boards
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

Hi Valentin

On 3/27/23 17:29, Valentin Caron wrote:
> On ST stm32mp15 boards, change clock of USART1 node to SCMI clock
> "CK_SCMI_USART1"

I'll change commit title and message as your patch doesn't target 
STM43MP15 boards but STM32MP15 SCMI boards.

Cheers
Alex



> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts | 4 ++++
>   arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts | 4 ++++
>   arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts | 4 ++++
>   arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts | 4 ++++
>   4 files changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
> index e539cc80bef8..5c8164c10e46 100644
> --- a/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-dk1-scmi.dts
> @@ -77,3 +77,7 @@ &rng1 {
>   &rtc {
>   	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>   };
> +
> +&usart1 {
> +	clocks = <&scmi_clk CK_SCMI_USART1>;
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
> index 97e4f94b0a24..2c9a207a9d49 100644
> --- a/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-dk2-scmi.dts
> @@ -83,3 +83,7 @@ &rng1 {
>   &rtc {
>   	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>   };
> +
> +&usart1 {
> +	clocks = <&scmi_clk CK_SCMI_USART1>;
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
> index 9cf0a44d2f47..21c8169f0e82 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ed1-scmi.dts
> @@ -82,3 +82,7 @@ &rng1 {
>   &rtc {
>   	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>   };
> +
> +&usart1 {
> +	clocks = <&scmi_clk CK_SCMI_USART1>;
> +};
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
> index 3b9dd6f4ccc9..0084abbeb60e 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1-scmi.dts
> @@ -88,3 +88,7 @@ &rng1 {
>   &rtc {
>   	clocks = <&scmi_clk CK_SCMI_RTCAPB>, <&scmi_clk CK_SCMI_RTC>;
>   };
> +
> +&usart1 {
> +	clocks = <&scmi_clk CK_SCMI_USART1>;
> +};

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
