Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FE53D3C4B
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jul 2021 17:17:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 923FFC5719C;
	Fri, 23 Jul 2021 15:17:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3056DC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jul 2021 15:17:42 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16NFC8FN011862; Fri, 23 Jul 2021 17:17:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=d5Pg9hJb7R0JsPe/idV5np6RbfuP1n5bFZQZMW5h9ng=;
 b=f8Bk4bY2wAhpLkoKMPnCtnqzLNuCGiKzg8K478n4ER3RjQn0BmyPkTVz8UnHJZKWO4sR
 A2vZM27RsjSPFS39Rbx+IRHrCvlNTb6iM/+JFyRK7aAf3rBBA/T9CP6Eq0y7wofFng1X
 tHKWGE22A4aKlacZC7sTdEVrz7wh4crE8+zSPTA9WRLFq0gVBiVS7xHzH3YznUnIaQYZ
 Mlbqy2bsH4v6LWJ/neWdc5YLagzcuD+QKZLb62kJho6pewBhTxhAcYjwftxySkN6LQTo
 Dl2M9+ezc++VoRHii44EAsgwsJuyOeDGzm8hAPzGn8z0gDZ8t7Gcsk81FbH42BksGbAO Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39ygng4km8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Jul 2021 17:17:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9805A10002A;
 Fri, 23 Jul 2021 17:17:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C5B3228E30;
 Fri, 23 Jul 2021 17:17:27 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 23 Jul
 2021 17:17:26 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210721181253.126823-1-marex@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <c680dada-7484-0a71-9496-f7f2ed6cb00f@foss.st.com>
Date: Fri, 23 Jul 2021 17:17:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721181253.126823-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-23_08:2021-07-23,
 2021-07-23 signatures=0
Cc: cniedermaier@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Disable LAN8710 EDPD on
	DHCOM
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

On 7/21/21 8:12 PM, Marek Vasut wrote:
> The LAN8710 Energy Detect Power Down (EDPD) functionality might cause
> unreliable cable detection. There are multiple accounts of this in the
> SMSC PHY driver patches which attempted to make EDPD reliable, however
> it seems there is always some sort of corner case left. Unfortunatelly,
> there is no errata documented which would confirm this to be a silicon
> bug on the LAN87xx series of PHYs (LAN8700, LAN8710, LAN8720 at least).
> 
> Disable EDPD on the DHCOM SoM, just like multiple other boards already
> do as well, to make the cable detection reliable.
> 
> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> index 8349c9099e301..8c41f819f7769 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
> @@ -140,6 +140,7 @@ phy0: ethernet-phy@1 {
>   			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
>   			reset-assert-us = <500>;
>   			reset-deassert-us = <500>;
> +			smsc,disable-energy-detect;
>   			interrupt-parent = <&gpioi>;
>   			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>   		};
>

Applied on stm32-next. Note it'll be send through a fixes branch for v5.14.

Regards
alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
