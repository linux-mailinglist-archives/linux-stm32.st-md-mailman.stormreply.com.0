Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E76F135610
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2020 10:47:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E267BC36B0B;
	Thu,  9 Jan 2020 09:47:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A529AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2020 09:47:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0099bweL010751; Thu, 9 Jan 2020 10:46:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=kaxJeJxsQ9kniwCq7eta3R28bBgqLC1dveeyS7Ju7cY=;
 b=a5Pp6DTZ/GlpD0FCtQUjLWhUkZwYV9XTBXGlEbgqM3xXjL83GA5aBjJHRtBdxLxFebD6
 YM8UtNwT1nPY+2lUxtgZn0hkLiH2X32GrsXvWvKPsBlAuk+72KzgGmRRoQewLA9cUh/Y
 5HbmkmBrUWs03P7nHFuHDrDO28ZknO+yzv0S1oXiNpSxqvsYpsZhKCROm5ycEEQmgvze
 stnUxKE+c535SLRRjBUeE8uXVpS1PSswLjOv5mIkg6f1ecjRDDHjwf8R6S4THUBobKox
 dtNGnv8UU29aXLYW6pidPc8CYc//SZgbGEfZ1VD1DYUAdhrIp8rBMwldu02/hFpyc5bP nQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2xakkb0ysg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 10:46:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 175E510003D;
 Thu,  9 Jan 2020 10:46:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 01FEC2A791B;
 Thu,  9 Jan 2020 10:46:52 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jan
 2020 10:46:51 +0100
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <mcoquelin.stm32@gmail.com>, 
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
References: <20200108132647.26131-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <2af148e9-c67c-0654-716b-1e65a77510b7@st.com>
Date: Thu, 9 Jan 2020 10:46:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108132647.26131-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-08,
 2020-01-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add power-supply for RGB
 panel on stm32429i-eval
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

Hi

On 1/8/20 2:26 PM, Benjamin Gaignard wrote:
> Add a fixed regulator and use it as power supply for RBG panel.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   arch/arm/boot/dts/stm32429i-eval.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> index 58288aa53fee..c27fa355e5ab 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -95,6 +95,13 @@
>   		regulator-max-microvolt = <3300000>;
>   	};
>   
> +	vdd_panel: vdd-panel {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_panel";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
>   	leds {
>   		compatible = "gpio-leds";
>   		green {
> @@ -138,6 +145,7 @@
>   
>   	panel_rgb: panel-rgb {
>   		compatible = "ampire,am-480272h3tmqw-t01h";
> +		power-supply = <&vdd_panel>;
>   		status = "okay";
>   		port {
>   			panel_in_rgb: endpoint {
> 

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
