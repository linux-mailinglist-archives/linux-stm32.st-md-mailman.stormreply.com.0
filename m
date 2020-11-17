Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7712B5C22
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 10:48:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7768C3FADD;
	Tue, 17 Nov 2020 09:48:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6894EC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 09:48:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AH9bTIl005854; Tue, 17 Nov 2020 10:48:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=lY3JK5zN6GQkRYquoVIeFlSne0NdJvWJmsEuKlKZck0=;
 b=IzabVR1Fqo5MMbUh4dAzmP/HyUmqeQxtXp6EKTb/j5JqEBsjvBgBg+sQ+iLBH+m3cLIv
 dLrAxQrtBiTl8vQYVUUYfn0oKMOdbLwz7fKRggimdhdl0xXfZj+2paDWjShKdUlpc+mn
 QbAsGCffoZdK3OC+dfVmTFYykWF6VOszwiWxyDShA/vFCzw0nCDHKBPDFKLtc/LAS9ZA
 nZzMw8Vs9ZV8XhIncEDIPwBthkyWVDjxxO6rP63psdExZYTuzUnc+ZU0ohMkJ1KyZ/YM
 B7f9TKAKvVX/HhOr5N0QG8wtkcJdEk87OSonZYq50CZghD0gyP/+pSEoeFZonoQ680ld Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5k509bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 10:48:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BA5810002A;
 Tue, 17 Nov 2020 10:48:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CFAD236062;
 Tue, 17 Nov 2020 10:48:24 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 10:48:23 +0100
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20201110142737.13106-1-amelie.delaunay@st.com>
 <20201110142737.13106-2-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <752db4c9-1af1-1def-3db8-0521c8118681@st.com>
Date: Tue, 17 Nov 2020 10:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110142737.13106-2-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-13,
 2020-11-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: fix dmamux reg
	property on stm32h743
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

Hi,

On 11/10/20 3:27 PM, Amelie Delaunay wrote:
> Reg property length should cover all DMAMUX_CxCR registers.
> DMAMUX_CxCR Address offset: 0x000 + 0x04 * x (x = 0 to 15), so latest
> offset is at 0x3c, so length should be 0x40.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>   arch/arm/boot/dts/stm32h743.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 7febe19e780d..b083afd0ebd6 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -274,7 +274,7 @@
>   
>   		dmamux1: dma-router@40020800 {
>   			compatible = "st,stm32h7-dmamux";
> -			reg = <0x40020800 0x1c>;
> +			reg = <0x40020800 0x40>;
>   			#dma-cells = <3>;
>   			dma-channels = <16>;
>   			dma-requests = <128>;
> 

Series applied on stm32-next.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
