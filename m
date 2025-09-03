Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A73CCB416EF
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 09:39:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EE67C3F95F;
	Wed,  3 Sep 2025 07:39:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 876ACC3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 07:39:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5835jZYh007176;
 Wed, 3 Sep 2025 09:39:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 oTO3GWe6vWTxVF1nz0fRYpUGQk7A1HpUGiGkoFHYPaU=; b=f6PnfX052q4atmjA
 4p3rG7NLg6nSAVvfPHh6OoDoJ9dtKFB0rFd47RkIdkqjqCCGJjNTrbpt4kg2J84U
 pBnd95KHLWdfLW5pqkSEbZmPM8Cys06fUkwx6ech9Oc9DGwOBLwv4Ariy2xGfNPc
 9jqReH9MmUyvD2HO+ValDs6G3mc1iSD94QBiqSQz/s/mdWrIBcThvxei/RxUlH76
 1r3e7ySt4POeitq9b+NXlZTINueQH+OPaIYYAhULAZq/FiHjJN7cNvZUa1p5mFV2
 lbaiHBVoulwpXub7Ej9idqGItDfO1fCXtNIxRRBhD3nHfWwZUd+GR6DTF0PWUlgO
 AKhqoA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqkg5u3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 09:39:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F4154002D;
 Wed,  3 Sep 2025 09:38:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C354029038A;
 Wed,  3 Sep 2025 09:38:20 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 09:38:20 +0200
Message-ID: <667a4a36-5b5a-4a45-9300-d0abd10d4b53@foss.st.com>
Date: Wed, 3 Sep 2025 09:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, <mcoquelin.stm32@gmail.com>,
 <robh@kernel.org>
References: <20250830225115.303663-1-jihed.chaibi.dev@gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250830225115.303663-1-jihed.chaibi.dev@gmail.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: stm32mp151c-plyaqm: Use
 correct dai-format property
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

Hi Jihed

On 8/31/25 00:51, Jihed Chaibi wrote:
> The stm32-i2s binding inherits from the standard audio-graph-port
> schema for its 'port' subnode, audio-graph-port requires the use
> of the 'dai-format' property. The stm32mp151c-plyaqm dts file was
> using the non-standard name 'format'.
> 
> Correct the property name to 'dai-format' to fix the dtbs_check
> validation error.
> 
> Fixes: 9365fa46be358 ("ARM: dts: stm32: Add Plymovent AQM devicetree")
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
> index 39a3211c613..55fe916740d 100644
> --- a/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
> +++ b/arch/arm/boot/dts/st/stm32mp151c-plyaqm.dts
> @@ -239,7 +239,7 @@ &i2s1 {
>   
>   	i2s1_port: port {
>   		i2s1_endpoint: endpoint {
> -			format = "i2s";
> +			dai-format = "i2s";
>   			mclk-fs = <256>;
>   			remote-endpoint = <&codec_endpoint>;
>   		};

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
