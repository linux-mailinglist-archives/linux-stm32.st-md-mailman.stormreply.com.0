Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CB12F6566
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 17:08:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8391C424C0;
	Thu, 14 Jan 2021 16:08:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB1F9C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 16:08:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10EG2FYd022831; Thu, 14 Jan 2021 17:07:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0JgJHsNz7hWotQHqsv9MMXYM5L07hf3AqCxxBPFoW4Q=;
 b=h8mvkBIrZsVp552w8KbS9voQPbwMg9AQvXWDx5P+FlbZI9gzuga/OhxbY5RiAPunuUUy
 eiO23uCDtWANMLrfBsmjDTEE3CcH4uguKFNpazXIIAKGBLUqxy8LoTtYOYmB/8XON+Yb
 zES/86Fp6UrHKoluozSCQGAjKjt5cA2u8qhvP6EawJwcHSPlzMtnJL8oai+rBqTnNRmc
 AeaLaFAApILwKkBHv1kUZWK3FrJFkPGKpneLTV5/NXwSVw+Pt+tQwUaMVxKrG6v3jhWO
 F/QCF/QeC/RNy4pXKxbWFNuL4jWhBGGPRAr4FJWfEWTS86eIKT12kc7YjW6Vrx/h5ZOj bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxdyeh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:07:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1F3C10002A;
 Thu, 14 Jan 2021 17:07:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8FEF2ADA18;
 Thu, 14 Jan 2021 17:07:42 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 17:07:41 +0100
To: Alexander Dahl <post@lespocky.de>, Rob Herring <robh+dt@kernel.org>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-4-post@lespocky.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <f9277cd5-9898-ab6f-20bd-a0476068ea12@foss.st.com>
Date: Thu, 14 Jan 2021 17:07:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201228163217.32520-4-post@lespocky.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_05:2021-01-14,
 2021-01-14 signatures=0
Cc: devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 3/4] ARM: dts: stm32: Fix schema
	warnings for pwm-leds
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

Hi Alexander

On 12/28/20 5:32 PM, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>    DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
>    CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
> /home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>          From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied on stm32-next.

Thanks.
Alex

> ---
> 
> Notes:
>      v8 -> v9:
>        * added Acked-by (Ahmad Fatoum)
>        * rebased on v5.11-rc1
>      
>      v7 -> v8:
>        * rebased on recent pavel/for-next (post v5.10-rc1)
>        * updated indexes and added comment (Ahmad Fatoum)
>      
>      v6 -> v7:
>        * split up patch (one per sub arch)
>        * added actual warnings to commit message
> 
>   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index cda8e871f999..1e9bf7eea0f1 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -36,34 +36,35 @@
>   		stdout-path = &uart4;
>   	};
>   
> -	led-act {
> +	led-controller-0 {
>   		compatible = "gpio-leds";
>   
> -		led-green {
> +		led-0 {
>   			label = "mc1:green:act";
>   			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
>   			linux,default-trigger = "heartbeat";
>   		};
>   	};
>   
> -	led-rgb {
> +	led-controller-1 {
>   		compatible = "pwm-leds";
>   
> -		led-red {
> +		/* led-1 to led-3 are part of a single RGB led */
> +		led-1 {
>   			label = "mc1:red:rgb";
>   			pwms = <&leds_pwm 1 1000000 0>;
>   			max-brightness = <255>;
>   			active-low;
>   		};
>   
> -		led-green {
> +		led-2 {
>   			label = "mc1:green:rgb";
>   			pwms = <&leds_pwm 2 1000000 0>;
>   			max-brightness = <255>;
>   			active-low;
>   		};
>   
> -		led-blue {
> +		led-3 {
>   			label = "mc1:blue:rgb";
>   			pwms = <&leds_pwm 3 1000000 0>;
>   			max-brightness = <255>;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
