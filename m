Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79487411050
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Sep 2021 09:39:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 304C8C5A4CF;
	Mon, 20 Sep 2021 07:39:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F7B7C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Sep 2021 07:39:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18JI7utv023684; 
 Mon, 20 Sep 2021 09:39:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=H59uEKhZ/RULNMJveqVgR3Nc/NKR8KXwr51jpHnR+3w=;
 b=1m5dMqVM/dwsDL7wayBcWGsVu2LkfHfwWSpnDqgPrdYzc18txirePegpzdeaSxFKrlSB
 bjZYuc4lXOlbhZpQUH1TbRFCmd6YtUY2VQSJ+OXfO/Mq/X7rM8yhtWAr/kT8XTqiFHbo
 yeo+wpv5njMh2M+pbjfrHrdaGoPh7WX2wxnLyDsv9nUN2gw/WrpQWNcWQKeNhEXDQYA2
 DwYlM+KUOUt9Kq2Ol4UM1bg0gwGOTyIU63z1gL0FQMYUq/4OmqSoVBySAO2npN6MN+SY
 UE507byfigUxZRWyJdX7I4gfchUixF5/PU6aJjV3rOBANqeh9ZRlv4EUuAd/vAfU5gdi qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b6a76j7qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:39:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A748D10002A;
 Mon, 20 Sep 2021 09:39:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B98E2128A0;
 Mon, 20 Sep 2021 09:39:30 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 09:39:30 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210809121324.155219-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <a6bbc8bc-a5ae-2a3a-e352-936b4ba6ecc3@foss.st.com>
Date: Mon, 20 Sep 2021 09:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210809121324.155219-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_03,2021-09-17_02,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Reduce DHCOR SPI NOR
	frequency to 50 MHz
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

Hi Marek

On 8/9/21 2:13 PM, Marek Vasut wrote:
> The SPI NOR is a bit further away from the SoC on DHCOR than on DHCOM,
> which causes additional signal delay. At 108 MHz, this delay triggers
> a sporadic issue where the first bit of RX data is not received by the
> QSPI controller.
> 
> There are two options of addressing this problem, either by using the
> DLYB block to compensate the extra delay, or by reducing the QSPI bus
> clock frequency. The former requires calibration and that is overly
> complex, so opt for the second option.
> 
> Fixes: 76045bc457104 ("ARM: dts: stm32: Add QSPI NOR on AV96")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> index 2b0ac605549d7..44ecc47085871 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
> @@ -202,7 +202,7 @@ flash0: flash@0 {
>   		compatible = "jedec,spi-nor";
>   		reg = <0>;
>   		spi-rx-bus-width = <4>;
> -		spi-max-frequency = <108000000>;
> +		spi-max-frequency = <50000000>;
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   	};
> 

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
