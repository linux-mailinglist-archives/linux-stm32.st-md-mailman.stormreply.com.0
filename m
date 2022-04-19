Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B005507185
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 17:18:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D91CAC6049A;
	Tue, 19 Apr 2022 15:18:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19E72C60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 15:18:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JCbNCP019703;
 Tue, 19 Apr 2022 17:18:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yAsK35hKpZsxQi8hVd1WB4CpUJ+QZaAaP8nGYR49dZ4=;
 b=4vYyGIIlSLZJrr+7dBs/6YyZ581gIwCfncaUdTgRc7/4HKbVgolXC+YFKlQHWGIeF22P
 /TOfveMa8b+iDR9PyFMHyY17e+e8ffM2qN4xRBPzhcbiVq/ZvSUgEdosf6RS/L1M17y2
 CXA4oT2cw/BHZH8szbBLh3h3LgdTAX5S8I6KiUEbofJLUM07m7DLnX5s3SMaMte3LL5d
 5Rbh4D3nf+4R9Sizxes6FVpH0hz8Pk63vLl1ZdaqCGL/dTK4otcGtpeO4/nRcgp0LWle
 VKcam6VmcXqmZpEGixvkgofxEPhl3A8/mkoYTVyVRPL8j3SGBxfboXA7XpGE/pemknWO bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09krjwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 17:18:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27C0D10002A;
 Tue, 19 Apr 2022 17:18:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20D69216853;
 Tue, 19 Apr 2022 17:18:32 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 17:18:31 +0200
Message-ID: <fba3ee98-78cf-2c38-3744-86771adb3623@foss.st.com>
Date: Tue, 19 Apr 2022 17:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Fabien Dessenne <fabien.dessenne@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220311121448.18221-1-fabien.dessenne@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220311121448.18221-1-fabien.dessenne@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: fix pinctrl node name
	warnings (MCU soc)
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

On 3/11/22 13:14, Fabien Dessenne wrote:
> The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> pinctrl: use pinctrl.yaml") resulted in some node name warnings.
> Fix the node names to the preferred 'pinctrl'.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> ---
>   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 2 +-
>   arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 2 +-
>   arch/arm/boot/dts/stm32h743.dtsi       | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> index 155d9ffacc83..500bcc302d42 100644
> --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> @@ -45,7 +45,7 @@
>   
>   / {
>   	soc {
> -		pinctrl: pin-controller@40020000 {
> +		pinctrl: pinctrl@40020000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0x40020000 0x3000>;
> diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> index 1cf8a23c2644..8f37aefa7315 100644
> --- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> @@ -9,7 +9,7 @@
>   
>   / {
>   	soc {
> -		pinctrl: pin-controller@40020000 {
> +		pinctrl: pinctrl@40020000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0x40020000 0x3000>;
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 6e42ca2dada2..91dde07a38ba 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -583,7 +583,7 @@ mac: ethernet@40028000 {
>   			status = "disabled";
>   		};
>   
> -		pinctrl: pin-controller@58020000 {
> +		pinctrl: pinctrl@58020000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			compatible = "st,stm32h743-pinctrl";

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
