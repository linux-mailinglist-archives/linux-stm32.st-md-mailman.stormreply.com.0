Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18205507183
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 17:18:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C513EC6049A;
	Tue, 19 Apr 2022 15:18:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FEC1C60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 15:18:20 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JEONk6018031;
 Tue, 19 Apr 2022 17:18:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cVEYgK1eXr9Uq+MnzLxAjMcASFYphcriAlriRJtnbRI=;
 b=wY8HQqVwlMNuCOBKZ+xA/ejTTOwIJKDzjCG6TystUYrRi0AfE3SxYn4EqzNojQHxtjet
 F5ruuyLTkn0qzvy5duVy8pcsC2Wvi2bVJPfG+JFFadd0Cp6QmQ8mt0uuR7bly92eSwf8
 xYsRGstfGzXJQKZ912uq9cnoatvi4df1yZftgZvgv156vt7XjjpPm/fhTRehjcNPS2HI
 +MCEO5PAkewgU74vqbzZpWFcH3GA376qkT+Y+GNddLgkXs7SvB02IEr4S7mMDR/K77zY
 RDZaLckyGM3i2L5yrywJgRWIb6O+h6BY1XzVskCkkQr5Xu77yLbMPY3P6BIOQfeO0lTP +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqgq0e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 17:18:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1858910002A;
 Tue, 19 Apr 2022 17:18:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1197F21682F;
 Tue, 19 Apr 2022 17:18:07 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 17:18:06 +0200
Message-ID: <cf9246fb-7a5f-035c-1626-a00d55c4202e@foss.st.com>
Date: Tue, 19 Apr 2022 17:18:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Fabien Dessenne <fabien.dessenne@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220311121323.18125-1-fabien.dessenne@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220311121323.18125-1-fabien.dessenne@foss.st.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix pinctrl node name
	warnings (MPU soc)
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

On 3/11/22 13:13, Fabien Dessenne wrote:
> The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> pinctrl: use pinctrl.yaml") resulted in some node name warnings.
> Fix the node names to the preferred 'pinctrl'.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32mp131.dtsi | 2 +-
>   arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
> index 86126dc0d898..57a911cddebe 100644
> --- a/arch/arm/boot/dts/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/stm32mp131.dtsi
> @@ -164,7 +164,7 @@ ts_cal2: calib@5e {
>   		 * Break node order to solve dependency probe issue between
>   		 * pinctrl and exti.
>   		 */
> -		pinctrl: pin-controller@50002000 {
> +		pinctrl: pinctrl@50002000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "st,stm32mp135-pinctrl";
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 1cfc2f011e70..489fb9979085 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -1602,7 +1602,7 @@ tamp: tamp@5c00a000 {
>   		 * Break node order to solve dependency probe issue between
>   		 * pinctrl and exti.
>   		 */
> -		pinctrl: pin-controller@50002000 {
> +		pinctrl: pinctrl@50002000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "st,stm32mp157-pinctrl";
> @@ -1733,7 +1733,7 @@ gpiok: gpio@5000c000 {
>   			};
>   		};
>   
> -		pinctrl_z: pin-controller-z@54004000 {
> +		pinctrl_z: pinctrl@54004000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "st,stm32mp157-z-pinctrl";

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
