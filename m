Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF096316125
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Feb 2021 09:39:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D35BC57B52;
	Wed, 10 Feb 2021 08:39:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52F4EC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Feb 2021 08:39:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11A8Uspd032146; Wed, 10 Feb 2021 09:39:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IdIphRq0oo03Upaifx4Sr2lddUG/YQLMaBXzjBtS7BU=;
 b=0YLLFZjDT3TCALs25fy5Dia6PQlM89y1hFyTr9xH1csDL1FClrZcu7NHicXWytBBXhnq
 DBTtzv5gLl+JnY5n8TRI4fR7mTibaaJUNDMJtjIi8VNIRX1q4aNXzL9sCXMW+56zuV0l
 8GMv9ym9beQXLVombOk8VtrYlGdAQ6p8ScSjOPx3bWgb7H4hsOtw1Dv14xooRARK+4nq
 MOqBc/mWcN1k3zJZk6CQxF0L5TS38O6iYrUCEtSr4lPxM6wEKYggHOTmFZsajyIMgw+w
 lVunJuS/RA1ODu/slEkxlbkKHPaHion/Vs/M3ap1w5WFEGFPl8hYttVdc+rwA9f1h7IP Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hr2ceg1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Feb 2021 09:39:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0781410002A;
 Wed, 10 Feb 2021 09:39:33 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E14A921CA9C;
 Wed, 10 Feb 2021 09:39:32 +0100 (CET)
Received: from lmecxl1060.lme.st.com (10.75.127.122) by GPXDAG2NODE6.st.com
 (10.75.127.70) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Feb
 2021 09:39:31 +0100
To: Alain Volmat <alain.volmat@foss.st.com>, <wsa@kernel.org>,
 <robh+dt@kernel.org>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
Message-ID: <59aec92b-9e5d-b9e9-0fee-d14d50281d4b@foss.st.com>
Date: Wed, 10 Feb 2021 09:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-10_02:2021-02-09,
 2021-02-10 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: enable the analog
 filter for all I2C nodes in stm32mp151
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello

Looks good to me

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>

Thx
Regards


On 2/5/21 9:51 AM, Alain Volmat wrote:
> Enable the analog filter for all I2C nodes of the stm32mp151.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
> index 3c75abacb374..558fc8fb38b6 100644
> --- a/arch/arm/boot/dts/stm32mp151.dtsi
> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> @@ -493,6 +493,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x1>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -508,6 +509,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x2>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -523,6 +525,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x4>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -538,6 +541,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x10>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -1533,6 +1537,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x8>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> @@ -1570,6 +1575,7 @@
>  			#size-cells = <0>;
>  			st,syscfg-fmp = <&syscfg 0x4 0x20>;
>  			wakeup-source;
> +			i2c-analog-filter;
>  			status = "disabled";
>  		};
>  
> 

-- 
--
~ Py MORDRET
--
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
