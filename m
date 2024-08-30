Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F161396668A
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 18:10:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F81DC6C841;
	Fri, 30 Aug 2024 16:10:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBD05CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 16:10:51 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U9Q1Xj031605;
 Fri, 30 Aug 2024 18:10:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0ppgDe+Tyd4XklDsC2+hRlyYNtPjs+5Tcuq+lysrstE=; b=Z9fTBHwf3N5oO3Oo
 onPB9lnPgr9p1bWDY3PzVkn6PmYLNvIGCLjrmqtKsXaqly3aBS9E+65cdmeOj/Qx
 Jb9DzqiLP2Zel6pry7eMzd0evkZTG/ouadJsa3zb1kDgxTfTWmRtdxEW3T9f4VQM
 0w4rRt0H5f6UHXJGwI0dZklzftOhOUE+oAQn1I/mnzAMz4znVZ8yVaCkQMUuboyC
 OML3KArYfAuD9gm1diJ6+cGeGMYwC3TB4P3cG/ISDVUy/hALYEOwoaJ/mZjH3Ek3
 QsQvcV3qjTA9Nur8n2V2r9BNMaVfoAyVobKD0kfYq8KbXKSqmPTvJ7dSF14onRVm
 6udbwg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419putndcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 18:10:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2B61440044;
 Fri, 30 Aug 2024 18:10:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AFC9127D118;
 Fri, 30 Aug 2024 18:10:11 +0200 (CEST)
Received: from [10.252.12.18] (10.252.12.18) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 18:10:11 +0200
Message-ID: <c8ff8572-adf3-4fa8-ae5e-4c27e8090ee6@foss.st.com>
Date: Fri, 30 Aug 2024 18:10:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Marek Vasut <marex@denx.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20240813094856.2002113-1-linux@rasmusvillemoes.dk>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240813094856.2002113-1-linux@rasmusvillemoes.dk>
X-Originating-IP: [10.252.12.18]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: include st,
 stm32mp13-regulator.h in stm32mp131.dtsi
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

Hi Rasmus

On 8/13/24 11:48, Rasmus Villemoes wrote:
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> 
> The file stm32mp131.dtsi uses symbolic constants such as
> VOLTD_SCMI_REG11, VOLTD_SCMI_REG18 etc., but does not include the
> header where they are defined. So when adding a new .dts file that
> includes stm32mp131.dtsi, the build breaks unless the .dts itself
> includes st,stm32mp13-regulator.h.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
> 
> OTOH, it seems that (if this is applied) stm32mp135f-dhcor-dhsbc.dts and
> stm32mp13xx-dhcor-som.dtsi could drop their #includes as they do not
> use any of the VOLTD_SCMI_* constants except through stm32mp131.dtsi.

Thanks for this fix. I think it would be nice to add to this series 
boards updates by removing "#include 
<dt-bindings/regulator/st,stm32mp13-regulator.h>".

Thanks in advance
Alex

> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
> index e1a764d269d2..490d38dc8d54 100644
> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
> @@ -5,6 +5,7 @@
>    */
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/stm32mp13-clks.h>
> +#include <dt-bindings/regulator/st,stm32mp13-regulator.h>
>   #include <dt-bindings/reset/stm32mp13-resets.h>
>   
>   / {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
