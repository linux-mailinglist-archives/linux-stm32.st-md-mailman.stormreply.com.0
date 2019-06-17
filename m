Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4E4828B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 14:35:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37DDEC6275B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 12:35:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00F2AC62759
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 12:35:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HCVDen016387; Mon, 17 Jun 2019 14:34:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Bf2mCAHJCk8x6Ixnh6dSc1NHiHAHnvfKgorvDCTAyto=;
 b=fxfACKVNj9ccB9QXV/rSwNlnRBZyRuirF8gZAmOWFdFkcnq/QNamAG9mKqjxUkRygFJl
 eMmtdQLPH+8oEhDel/Onx9vbwaJx2o1EQsx0Pe6fgP0nbCHpQ4PfJzmFHGJZ1kdpo80a
 A7S7/wYgYt/BFcgUl7t7Hxg8kZ4ZIfR5WWgZZoln7Qs86Su6Yu4cT9GG8zx9BKeVrC5w
 rzsGAqNSbL4Srh7uM94Dzb3sq7sti9Kox5HCfi0kxNN4QX4IwXZphIa3p1cFIRsd0tzf
 VHT184Cw3OkzKtp3NtnbqURzo2mUDKpfcz2p1qWBBbKSZozQFJtoi6QoUZKwsqAaXc1H mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4qjhtf0b-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 14:34:51 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 916DE34;
 Mon, 17 Jun 2019 12:34:50 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 673C029CD;
 Mon, 17 Jun 2019 12:34:50 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 17 Jun
 2019 14:34:49 +0200
To: Christophe Roullier <christophe.roullier@st.com>, <robh@kernel.org>,
 <davem@davemloft.net>, <joabreu@synopsys.com>, <mark.rutland@arm.com>,
 <mcoquelin.stm32@gmail.com>, <peppe.cavallaro@st.com>
References: <20190617085018.20352-1-christophe.roullier@st.com>
 <20190617085018.20352-2-christophe.roullier@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c53808dd-f1d2-2865-7d45-fa2ca875b95a@st.com>
Date: Mon, 17 Jun 2019 14:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617085018.20352-2-christophe.roullier@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_06:, , signatures=0
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: replace rgmii mode
 with rgmii-id on stm32mp15 boards
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

Hi Christophe

On 6/17/19 10:50 AM, Christophe Roullier wrote:
> On disco and eval board, Tx and Rx delay are applied (pull-up of 4.7k
> put on VDD) so which correspond to RGMII-ID mode with internal RX and TX
> delays provided by the PHY, the MAC should not add the RX or TX delays
> in this case
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157a-dk1.dts | 2 +-
>   arch/arm/boot/dts/stm32mp157c-ev1.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
> index 098dbfb06b61..2c105740dfad 100644
> --- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
> +++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
> @@ -51,7 +51,7 @@
>   	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
>   	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
>   	pinctrl-names = "default", "sleep";
> -	phy-mode = "rgmii";
> +	phy-mode = "rgmii-id";
>   	max-speed = <1000>;
>   	phy-handle = <&phy0>;
>   
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index b6aca40b9b90..ab1393caf799 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -79,7 +79,7 @@
>   	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
>   	pinctrl-1 = <&ethernet0_rgmii_pins_sleep_a>;
>   	pinctrl-names = "default", "sleep";
> -	phy-mode = "rgmii";
> +	phy-mode = "rgmii-id";
>   	max-speed = <1000>;
>   	phy-handle = <&phy0>;
>   
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
