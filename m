Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B113F3CA1C9
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 18:01:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3384AC59781;
	Thu, 15 Jul 2021 16:01:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4736EC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 16:01:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FFmCnt021533; Thu, 15 Jul 2021 18:01:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=UpZ7fBWPr2koAB/z0RHu4msndPBXfH17zAKbTKg+mFo=;
 b=l7plO9jVWQREK82wGVyGUurmk2qwebH1eh0weco0JRWYMld9gx9kXHtUwWEErH51mfkh
 4v4KPSfVlr2T5t5th7PU3lycOS2/Ttdx+9z/qJjJOS9j9HJskTP94hTJpKnPMsE909ku
 6aLaa9Vw0sD1dTXQvmGaO5XlFhEMxN4bNDbOOg0Cg13K0C86Vu9zttzVEr/qyMRErGEa
 0yA0RnI8ecxfM/rBG5LqYOlPQtXgUFDmvwTkcas6M5CGa0Tggc9jtP5Fj0487mYHuIEo
 yUq7gWkfQggngGtbdzdPXKVjhMJYR0lsu6M7AyeLXC9xRgOmRh5mZEzo6pQIYs/0XQwV Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39thrstc3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 18:01:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81292100034;
 Thu, 15 Jul 2021 18:01:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 76021233C98;
 Thu, 15 Jul 2021 18:01:14 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 18:01:13 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210620212431.102640-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <756dd3e0-19cf-5096-74f9-5b024efa0545@foss.st.com>
Date: Thu, 15 Jul 2021 18:01:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210620212431.102640-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_10:2021-07-14,
 2021-07-15 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Update AV96 adv7513 node
	per dtbs_check
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

On 6/20/21 11:24 PM, Marek Vasut wrote:
> Swap reg and reg-names order and drop adi,input-justification
> and adi,input-style to fix the following dtbs_check warnings:
> arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: adi,input-justification: False schema does not allow ['evenly']
> arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: adi,input-style: False schema does not allow [[1]]
> arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: reg-names:1: 'edid' was expected
> arch/arm/boot/dts/stm32mp157a-dhcor-avenger96.dt.yaml: hdmi-transmitter@3d: reg-names:2: 'cec' was expected
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 64dca5b7f748..6885948f3024 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -220,8 +220,8 @@ &i2c2 {	/* X6 I2C2 */
>   &i2c4 {
>   	hdmi-transmitter@3d {
>   		compatible = "adi,adv7513";
> -		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
> -		reg-names = "main", "cec", "edid", "packet";
> +		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
> +		reg-names = "main", "edid", "cec", "packet";
>   		clocks = <&cec_clock>;
>   		clock-names = "cec";
>   
> @@ -239,8 +239,6 @@ hdmi-transmitter@3d {
>   		adi,input-depth = <8>;
>   		adi,input-colorspace = "rgb";
>   		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>   
>   		ports {
>   			#address-cells = <1>;
> 

Applied on stm32-next.

Thanks!
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
