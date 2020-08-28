Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CE2255A1C
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 14:29:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20875C32EA6;
	Fri, 28 Aug 2020 12:29:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4971C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 12:29:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SCTBVv003785; Fri, 28 Aug 2020 14:29:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=mhax2lXh25TjQywWYVCfR215WIfUavNxtARMbcANmRI=;
 b=lVCOqvIXTGOdHAYOLeUPs5qZxyv4iMt8ORxzzpyal8OVu/ov9xNmrBunGi1dnHDk0SKe
 M+s7QxCylNMOWoRgVZ3UQRhjzqaTnZiS4Bzl/YlecdgpMljBsrYRE61z/9KTmJWpH+x0
 U0a63JbXaRTQ4iX3xdrafjpIRWns5rg/fuvuFIBg369FRjqrPCFfPskgyqF9zGoE9XR8
 jgOrQQvqzbgV4iGh2Gj18iSft7L2+u7gGfiiFB7eGe89qPkk2qYeseoDAi7+rCmfCOSU
 Kmy1cugeqmSHglOxbPUceVmgPAdO811kB0mVp1p2LNuY2sPQHR+/nJt+KaLWv8mrFYy/ xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b6xkhkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 14:29:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6C22310002A;
 Fri, 28 Aug 2020 14:29:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 609382BC7DF;
 Fri, 28 Aug 2020 14:29:28 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 14:29:27 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200822203425.61419-1-marex@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <365ff43d-c1f0-e063-b979-c84d41c5b214@st.com>
Date: Fri, 28 Aug 2020 14:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200822203425.61419-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_08:2020-08-28,
 2020-08-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable RTS/CTS for DH
	AV96 UART7
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

On 8/22/20 10:34 PM, Marek Vasut wrote:
> The DH AV96 has RTS/CTS lines available on UART7, describe them in DT.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 905cd7bb98cf..ec02cee1dd9b 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -351,6 +351,7 @@ &uart7 {
>   	label = "LS-UART0";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&uart7_pins_a>;
> +	uart-has-rtscts;
>   	status = "okay";
>   };
>   
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
