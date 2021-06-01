Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC41396D91
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 08:51:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7BD5C57B55;
	Tue,  1 Jun 2021 06:51:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61246C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 06:50:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1516gs7w019066; Tue, 1 Jun 2021 08:50:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AkGHDuO+eAUmr9heDWsp/Yt48H7NtSz9cVQLfCEvhYM=;
 b=11zHzOOKD1z83t+EmBlVk5GMk4EGEZtJY4PzigNPeoKoaNHU6VL670C8quRyJPo4JUgB
 EwK/7bT3h48ht5akh3qNilcp4krNH3xItCOHJ4GxkBp1h/6UJXWWRiAQftXdblhGtJ9P
 Z/U5u97QFJTlVo9CvdvcIOmmzk4zr3y/mFfdMKthhz5KOlH1VLfhGmXySvfDmmO/CDX1
 eUh+4sF7bruP7yYnJvlTMH8sItOszj0mP6XN3ylt0T6Xzh/JfiutI3GkzjnaOwSJS28h
 OFxVKE1nW5aktKW0+I7Eafr3PFNzs19KsUU/RmYl0VK8H8h4KxPXyZQvGmkgoArJAz/M +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38vutw54vt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 08:50:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FD6F10002A;
 Tue,  1 Jun 2021 08:50:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0C63208F2D;
 Tue,  1 Jun 2021 08:50:45 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 08:50:44 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210408230001.310215-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <bcac89b7-bcb8-0b84-3a42-0f93be89bd7d@foss.st.com>
Date: Tue, 1 Jun 2021 08:50:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210408230001.310215-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_03:2021-05-31,
 2021-06-01 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Rework LAN8710Ai PHY
	reset on DHCOM SoM
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

On 4/9/21 1:00 AM, Marek Vasut wrote:
> The Microchip LAN8710Ai PHY requires XTAL1/CLKIN external clock to be
> enabled when the nRST is toggled according to datasheet Microchip
> LAN8710A/LAN8710Ai DS00002164B page 35 section 3.8.5.1 Hardware Reset:
>    "
>    A Hardware reset is asserted by driving the nRST input pin low. When
>    driven, nRST should be held low for the minimum time detailed in
>    Section 5.5.3, "Power-On nRST & Configuration Strap Timing," on page
>    59 to ensure a proper transceiver reset. During a Hardware reset, an
>    external clock must be supplied to the XTAL1/CLKIN signal.
>    "
> This is accidentally fulfilled in the current setup, where ETHCK_K is used
> to supply both PHY XTAL1/CLKIN and is also fed back through eth_clk_fb to
> supply ETHRX clock of the DWMAC. Hence, the DWMAC enables ETHRX clock,
> that has ETHCK_K as parent, so ETHCK_K clock are also enabled, and then
> the PHY reset toggles.
> 
> However, this is not always the case, e.g. in case the PHY XTAL1/CLKIN
> clock are supplied by some other clock source than ETHCK_K or in case
> ETHRX clock are not supplied by ETHCK_K. In the later case, ETHCK_K would
> be kept disabled, while ETHRX clock would be enabled, so the PHY would
> not be receiving XTAL1/CLKIN clock and the reset would fail.
> 
> Improve the DT by adding the PHY clock phandle into the PHY node, which
> then also requires moving the PHY reset GPIO specifier in the same place
> and that then also requires correct PHY reset GPIO timing, so add that
> too.
> 
> A brief note regarding the timing, the datasheet says the reset should
> stay asserted for at least 100uS and software should wait at least 200nS
> after deassertion. Set both delays to 500uS which should be plenty.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 272a1a67a9ad..31d08423a32f 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -123,7 +123,6 @@ &ethernet0 {
>   	max-speed = <100>;
>   	phy-handle = <&phy0>;
>   	st,eth-ref-clk-sel;
> -	phy-reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
>   
>   	mdio0 {
>   		#address-cells = <1>;
> @@ -132,6 +131,13 @@ mdio0 {
>   
>   		phy0: ethernet-phy@1 {
>   			reg = <1>;
> +			/* LAN8710Ai */
> +			compatible = "ethernet-phy-id0007.c0f0",
> +				     "ethernet-phy-ieee802.3-c22";
> +			clocks = <&rcc ETHCK_K>;
> +			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500>;
> +			reset-deassert-us = <500>;
>   			interrupt-parent = <&gpioi>;
>   			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>   		};
> 
Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
