Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D981C54C5
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 13:52:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 743A5C36B32;
	Tue,  5 May 2020 11:52:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C63DBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 11:52:33 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 045BnN8o019017; Tue, 5 May 2020 13:52:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=3SOp8PhNdW4IrWYxqJrQCRdEteG7eOQ26e42CGGjuAA=;
 b=xJnwGeMBKd93uRpJLbpprI7VkgCllwAGNZ81JG8prq/cV4mA+UX6aNb/YRrT0Or53xgj
 uAFYinEeYsQilCi6R/IcWGXhdLjgLqpmqiKG/CZhC7LiZLa4ufizmVUtUeGaLNMB2xSq
 4rvNbn0ZjfPZWu2ctwjI5kIldQ4GyCa0r1sFg8rITCzBNf7SHaam7goJ5OTWx2ut1ZDT
 5CD6T7z8JvFCWpV7y7pwH4Su8aoU1N+SmXfhcdbOSBk4KVdAuatBkEbXBlSHc7l4hy4g
 KY2kcpfrHnvrrUZUPxAFK+vz/9lXG3GPIfUuVkOYB/I4UddIi10YGkB2dbei0rGDhwVt 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxmvfse6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 13:52:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44ABF10002A;
 Tue,  5 May 2020 13:52:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 160F22B8A14;
 Tue,  5 May 2020 13:52:26 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 5 May
 2020 13:52:21 +0200
To: Pascal Paillet <p.paillet@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20200430130235.23979-1-p.paillet@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <264b0346-736e-91a0-c9c2-4f1a53627363@st.com>
Date: Tue, 5 May 2020 13:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200430130235.23979-1-p.paillet@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_06:2020-05-04,
 2020-05-05 signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable thermal sensor
 support on stm32mp15xx-dkx
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

Hi Pascal

On 4/30/20 3:02 PM, Pascal Paillet wrote:
> Enable STM32 Digital Thermal Sensor driver for stm32mp15xx-dkx boards.
> 
> Signed-off-by: Pascal Paillet <p.paillet@st.com>
> ---
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> index f6672e87aef3..203f7742e054 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
> @@ -116,6 +116,10 @@
>   	status = "okay";
>   };
>   
> +&dts {
> +	status = "okay";
> +};
> +
>   &ethernet0 {
>   	status = "okay";
>   	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
