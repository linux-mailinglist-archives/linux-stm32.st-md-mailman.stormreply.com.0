Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F26B396D93
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 08:51:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06A90C57B55;
	Tue,  1 Jun 2021 06:51:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D6D3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 06:51:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1516gr4O019005; Tue, 1 Jun 2021 08:51:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=88aoSG93oLJTZ4+9SDFk/mw01FsnD91w/cuPHLIMsB0=;
 b=sz8/xvr0A8Nz+uBH9THsAjVu1jL4t9cEAWu1J3wi6qYSBpGdn5sLTh7I+gXDmy4vDgew
 Zggy6gtmfBw1aNc3uwLmuD1QsQXRgFPyKbwZg5oTxwa1Ot/yh89QYyBK7Kw9tXWzJ+Kf
 rPrFyQJcwWGR1CAygcJUWfEwKMDG+GJBb6ubF0J4IBK+vTJqJsj87aYaMHYNaSeiUqqX
 gB6/SPfswTsF+WsEBj3BGP3i9NwNlaujPH+RK4Sq5289ifVy3gX/XJK48Gm9qVcBmpF9
 BXZm6PNSlGYu/I0ouYkyFwQ8S7BHPKAaZcMSJUa/HFh+Q1du9Taw9enI1jelWTTyYaa1 iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38vutw5517-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 08:51:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B403100038;
 Tue,  1 Jun 2021 08:51:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7060C211614;
 Tue,  1 Jun 2021 08:51:31 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 08:51:30 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210426150013.121406-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <8d2663f0-f0c6-5171-5d88-99d612036b05@foss.st.com>
Date: Tue, 1 Jun 2021 08:51:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210426150013.121406-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_03:2021-05-31,
 2021-06-01 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Remove extra
	size-cells
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

On 4/26/21 5:00 PM, Marek Vasut wrote:
> Fix make dtbs_check warning:
> arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: gpio-keys-polled: '#address-cells' is a dependency of '#size-cells'
> arch/arm/boot/dts/stm32mp157c-dhcom-pdk2.dt.yaml: gpio-keys: '#address-cells' is a dependency of '#size-cells'
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> index 5523f4138fd6..0fbf9913e8df 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-pdk2.dtsi
> @@ -34,7 +34,6 @@ display_bl: display-bl {
>   
>   	gpio-keys-polled {
>   		compatible = "gpio-keys-polled";
> -		#size-cells = <0>;
>   		poll-interval = <20>;
>   
>   		/*
> @@ -60,7 +59,6 @@ button-2 {
>   
>   	gpio-keys {
>   		compatible = "gpio-keys";
> -		#size-cells = <0>;
>   
>   		button-1 {
>   			label = "TA2-GPIO-B";
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
