Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 003504615FF
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 14:13:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8525C57B6F;
	Mon, 29 Nov 2021 13:13:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD11DC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Nov 2021 13:13:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AT8gB0U015642;
 Mon, 29 Nov 2021 14:13:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=sqMNcoQwpA9ck+7HZwoMAo0dG2+QpAolRg6WzPlAIKI=;
 b=QUDV4Oyu5hgi3RtaH24ANImYc7CEO15DHaQfwhQDcTw94rpXvYxwV3MXaQfBY5ibsI3a
 o/Y70SCbVBcFhwTwNNVJpXyW+FU+hOHs3HGU4RR58+YhFlBDz9N9AlMJErL5Szp6BTbj
 tsLtsvLUOhxByTGdVLrvhqxaLnj3RWtcErcjCWCDA/cWMzI6HYYk/4wZOXTcKXY7J0v6
 G0O6pHdgJBGQdc4lrGZ9B3y7QnUzKlTG0IQCRiCt7FkQctIQ5b3jJ2Hv9oLPAf63/z40
 z7uUOjOrei51DtLHbjzBKR0HM6/wsZ1dtEcN1jZiM+q6DI0Frbg6N3Q9b8iO24TLkHMW Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cmn1ybces-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:13:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 641F910002A;
 Mon, 29 Nov 2021 14:13:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58A68218100;
 Mon, 29 Nov 2021 14:13:15 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 29 Nov
 2021 14:13:14 +0100
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <1637926420-5116-1-git-send-email-fabrice.gasnier@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <d716a6a6-549f-c790-d1a1-b48c29d6ef00@foss.st.com>
Date: Mon, 29 Nov 2021 14:13:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637926420-5116-1-git-send-email-fabrice.gasnier@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_08,2021-11-28_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix stusb1600 pinctrl
 used on stm32mp157c-dk
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

Hi Fabrice

On 11/26/21 12:33 PM, Fabrice Gasnier wrote:
> A pinctrl handle is used to setup a pull-up on the stusb1600 IRQ pin (that
> is open drain).
> When in ANALOG state, no pull-up can be applied in the GPIO HW controller,
> still the setting is done into the register. The pull-up is effective
> currently, only when the GPIO IRQ is requested. The correct setting is to
> use directly the GPIO, instead of ANALOG state.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> index 5f060fe..3b65130 100644
> --- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
> @@ -1718,7 +1718,7 @@
>   
>   	stusb1600_pins_a: stusb1600-0 {
>   		pins {
> -			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
> +			pinmux = <STM32_PINMUX('I', 11, GPIO)>;
>   			bias-pull-up;
>   		};
>   	};
> 

Applied on stm32-next

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
