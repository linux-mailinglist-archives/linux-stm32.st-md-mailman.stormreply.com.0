Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB82548149
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 10:08:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 151ACC6047C;
	Mon, 13 Jun 2022 08:08:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99ED0C03FFF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 08:08:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25D1kSHm032240;
 Mon, 13 Jun 2022 10:07:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Kav0w6MVj5vV9UqBAzR4zzVyod+R3FYL6arVbUtgXas=;
 b=3+LjQTSkR0A8XFdVXMEah+/Fgs9Vij7EATTCB8JQdRTL3tpazBQf9DyFsTZ7QjnrtMRR
 1Q7+6ojhPZHtKAvNK3OxLlPhYKIDDLG7jkbonYFXYiFQkJDzXy7q2F7N8evbrrFXB/9W
 4qtqJ4xHhx2Ph7edeZCA9q+9bN8q0x6EP505M8UPWDVDlGDZMziCJKPwBZFWpQiagchA
 RZWeSv4tOWDlBYgA+1KvonyWsXhyXZc++uikOqwihcdLzQ+spCaCMl+qT01VWRDFxl7r
 juaQsIbx0FQL9WvwS/izAaIl3aT0m6jiBAfBOpU2zVFquhYcsjWkP2PgupSV+xXis2KF 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmgfmafjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jun 2022 10:07:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 042B210002A;
 Mon, 13 Jun 2022 10:07:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F27F921230B;
 Mon, 13 Jun 2022 10:07:53 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 13 Jun
 2022 10:07:53 +0200
Message-ID: <ef315d12-cdf3-f859-3c72-4a1280319c5f@foss.st.com>
Date: Mon, 13 Jun 2022 10:07:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220526203632.831039-1-krzysztof.kozlowski@linaro.org>
 <20220526203632.831039-2-krzysztof.kozlowski@linaro.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220526203632.831039-2-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_02,2022-06-09_02,2022-02-23_01
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: stm: adjust whitespace
	around '='
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

Hi Krzysztof

On 5/26/22 22:36, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Output compared with dtx_diff and fdtdump.
> ---
>   arch/arm/boot/dts/stm32429i-eval.dts    | 8 ++++----
>   arch/arm/boot/dts/stm32h743.dtsi        | 4 ++--
>   arch/arm/boot/dts/stm32h743i-disco.dts  | 8 ++++----
>   arch/arm/boot/dts/stm32h743i-eval.dts   | 8 ++++----
>   arch/arm/boot/dts/stm32h750i-art-pi.dts | 8 ++++----
>   5 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> index 0d98aca01736..3de0e9dbe030 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -251,10 +251,10 @@ ltdc_out_rgb: endpoint {
>   

Applied on stm32-next. I just slightly updated the commit title.

Thanks.
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
