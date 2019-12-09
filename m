Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C673116E93
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2019 15:07:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5219EC36B0B;
	Mon,  9 Dec 2019 14:07:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C4B6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2019 14:07:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB9E2Z3K029711; Mon, 9 Dec 2019 15:07:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BCWX5NNeDVU6wpFJD/S/N/1xkElQUKoGoGtgt/DzrE4=;
 b=aV9aeettm48PTkUp9/ucH7YOznx3hKtPa+AWvQmxejzR2VuSZTQ9H5x8KN77eI03s+2z
 ZuiltkGyccdCzDLjexMNNgfG23S1jsTpd5BLde2r6UsQng/2rQSV+lVtUTYICZV4ADQ4
 9viHA+aY3v7oOs8x/fQQIzoOe7TsSbVeWmSbujMv0E+YQABtmTJvpf6Qx4UOkJg0KgOv
 ew3yusQ5uJeahQKJcxiY1EzadTzDatDdnxFVEMndtatphfI8Riw67u4fBVeCxAX6uZGi
 8g4EZBZzw58S/ETFVA/fXKhHyldHBtiZG6YYRE7feX3sr5xYeV/iy3jep5q9QcaPKwdX qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wraq3qshq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 15:07:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 075AB100034;
 Mon,  9 Dec 2019 15:07:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE10A20DAFE;
 Mon,  9 Dec 2019 15:07:35 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 9 Dec
 2019 15:07:35 +0100
To: Benjamin Gaignard <benjamin.gaignard@st.com>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>
References: <20191202145604.28872-1-benjamin.gaignard@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <49d3e0c4-7e0d-0c5f-524c-4f2f9f197582@st.com>
Date: Mon, 9 Dec 2019 15:07:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191202145604.28872-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-09_04:2019-12-09,2019-12-09 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/3] ARM: dts: stm32: remove useless
 clock-names from RTC node on stm32f429
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

Hi Benjamin,

On 12/2/19 3:56 PM, Benjamin Gaignard wrote:
> On stm32f4 family RTC node doesn't need clock-names property.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   arch/arm/boot/dts/stm32f429.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
> index 5c8a826b3195..ac9caaf4cf51 100644
> --- a/arch/arm/boot/dts/stm32f429.dtsi
> +++ b/arch/arm/boot/dts/stm32f429.dtsi
> @@ -318,7 +318,6 @@
>   			compatible = "st,stm32-rtc";
>   			reg = <0x40002800 0x400>;
>   			clocks = <&rcc 1 CLK_RTC>;
> -			clock-names = "ck_rtc";
>   			assigned-clocks = <&rcc 1 CLK_RTC>;
>   			assigned-clock-parents = <&rcc 1 CLK_LSE>;
>   			interrupt-parent = <&exti>;
> 

Applied on stm32-next.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
