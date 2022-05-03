Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECA5185E7
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 15:48:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5081CC60467;
	Tue,  3 May 2022 13:48:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 542E3C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 13:48:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2438jP16016032;
 Tue, 3 May 2022 15:48:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FcROAh4SzXous4lLTDrw/Umg8J6Je3OS37++N8VSQdI=;
 b=H1hmbqUGQf1RIWQLtOvwlXd2ED83g7m4nyCPwkcHnmkqHPmlnGS0TejK0Ji36MsiAQ8G
 /WPq1vqxKom8xNENw+B0oIKi/saLZ4TsqxXPG0aAUx4MMD7n1Sm/Nu+SxG60ba/gnYh0
 9F4D7H887tDF+kmQDU2QOj9g8ZJUKk2s0rXqRXp2QNZnncM7RoJrc1K4CuuveVcpGNZH
 FwLUqOHilE529MlCQB3k0uhP/Jeamtaua+FKHYj+uivZmKjsyz0iqg4fBk6oMasrn7+0
 S/dZ/oeN0g02z4c6e7jewZtHw2YRZ9b+woAwWkbRqhMtYRKYDJnOWJ8eoQ0JdzQxgCh+ 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0g7dae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 15:48:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D306510002A;
 Tue,  3 May 2022 15:48:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC0E222177E;
 Tue,  3 May 2022 15:48:07 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 3 May
 2022 15:48:07 +0200
Message-ID: <1be925e8-5eeb-2928-d9c8-95d41102ddf9@foss.st.com>
Date: Tue, 3 May 2022 15:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Fabien Dessenne <fabien.dessenne@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220503090621.483567-1-fabien.dessenne@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220503090621.483567-1-fabien.dessenne@foss.st.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_05,2022-05-02_03,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add EXTI
 interrupt-parent to pinctrl node on stm32mp131
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

On 5/3/22 11:06, Fabien Dessenne wrote:
> Add interrupt-parent property in pinctrl node to use GPIO as IRQ.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp131.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index 58647396704f..f9ebc47e6421 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -259,6 +259,8 @@ pinctrl: pinctrl@50002000 {
>   			#size-cells = <1>;
>   			compatible = "st,stm32mp135-pinctrl";
>   			ranges = <0 0x50002000 0x8400>;
> +			interrupt-parent = <&exti>;
> +			st,syscfg = <&exti 0x60 0xff>;
>   			pins-are-numbered;
>   
>   			gpioa: gpio@50002000 {

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
