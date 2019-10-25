Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C6E4809
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2019 12:02:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21F16C36B0B;
	Fri, 25 Oct 2019 10:02:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB4CFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 10:02:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9P9kCWW017181; Fri, 25 Oct 2019 12:02:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=L3mtGVkYrQhlA9oMyG4z+zFmzlcb+vI8GVGs4DcezXs=;
 b=A/OkVqFKWSxzuT+sF0tIFGtEkqXmPoLwQtuOihl0MJVjs9tdkR2msDxWM7yGkuXgdY8f
 3Kv2FPd7fLkdjubQDxGSIqSqV2yPauoXLytDspg3Iu3k/C0Sg18HcElk+y7WVloHKW62
 1c7NUUyJ8ZowVKZQek3JHZHt36yECnPDyOtNEX9A17xonUqOM8cr/4Yh7Mle3o0iGf90
 CKLr6yhv8ZNde6oFi5j3DNRpUhC63pIoEtXUji1hOsLHx7qc/Asl23EQo+/j1bxVp81C
 jBsIdZKsd1lsqrd65MFVJadXf9T43P+imE0/UdHGdgyBre7JQ4ucGYkZwyEwj2uiXUtZ bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s5706c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 12:02:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2E1B10002A;
 Fri, 25 Oct 2019 12:02:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 960CB2C2E84;
 Fri, 25 Oct 2019 12:02:33 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 25 Oct
 2019 12:02:32 +0200
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>
References: <20191011130658.23670-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <a2a82d35-100f-40c3-0827-c110ac37a02f@st.com>
Date: Fri, 25 Oct 2019 12:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011130658.23670-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_05:2019-10-23,2019-10-25 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32f469: remove useless
 interrupt from dsi node
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

Hi Benjamin

On 10/11/19 3:06 PM, Benjamin Gaignard wrote:
> DSI driver doesn't use interrupt, remove it from the node since it
> breaks yaml check.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   arch/arm/boot/dts/stm32f469.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32f469.dtsi b/arch/arm/boot/dts/stm32f469.dtsi
> index 5ae5213f68cb..be002e8a78ac 100644
> --- a/arch/arm/boot/dts/stm32f469.dtsi
> +++ b/arch/arm/boot/dts/stm32f469.dtsi
> @@ -8,7 +8,6 @@
>   		dsi: dsi@40016c00 {
>   			compatible = "st,stm32-dsi";
>   			reg = <0x40016c00 0x800>;
> -			interrupts = <92>;
>   			resets = <&rcc STM32F4_APB2_RESET(DSI)>;
>   			reset-names = "apb";
>   			clocks = <&rcc 1 CLK_F469_DSI>, <&clk_hse>;
> 

Applied on stm32-next. For the next time commit header has to be 
formatted like that:

ARM: dts: stm32: .....

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
