Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABCDB4189F
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 10:33:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08A9BC36B27;
	Wed,  3 Sep 2025 08:33:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5642CC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 08:33:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5838RtY8015449;
 Wed, 3 Sep 2025 10:33:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 CbG/DgXgau78CIkI3+MQbjX+sYb7ZYtoUXtP9IbZlwA=; b=7quNYpbMIWXq5ZTh
 UGu5GfZUH8lRpdGGUowWnlLGHmly1s9B/zQ2/ZzuvzxWf7TiwTCJbgBGSqNeA6ss
 cF34z/PZVT/SPNX/kdyhGpPjmagnj+dD3mRaeOJskZS7sBu/6H9qo1Wz3CtNOlCq
 dHarfBeyrSzZZrKizqtq7au1TC4H4F+iq7lz/2cWSsDJPeBlnJdyTWCFL8j6wFKb
 sd8CiDkQzXlUCFpd3KMyufYtPVsTZssENKuAHDxIg20MvneLF5eB1Dr1mkT2g0/h
 lbfASz1oqbrsyMqQIKPOxSIMTU/FXEFlG2PfwOzOVG07Ztcy3Bm1vNxu+VLRREbR
 nuyIrw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqkgg2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Sep 2025 10:33:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3F7FB4002D;
 Wed,  3 Sep 2025 10:32:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC4342BBC2D;
 Wed,  3 Sep 2025 10:31:19 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 3 Sep
 2025 10:31:19 +0200
Message-ID: <0dbcc59d-2797-4106-b247-9bd575c5de2c@foss.st.com>
Date: Wed, 3 Sep 2025 10:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Christoph Niedermaier" <cniedermaier@dh-electronics.com>, Marek Vasut
 <marex@denx.de>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@dh-electronics.com>
References: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250818143730.244379-2-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
Subject: Re: [Linux-stm32] [PATCH] arm: dts: stm32: Drop redundant
	status=okay
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

On 8/18/25 16:37, Krzysztof Kozlowski wrote:
> Device nodes are enabled by default, so remove confusing or duplicated
> enabling of few nodes.  No practical impact, verified with dtx_diff.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/st/stm32mp157c-dk2.dts          | 2 --
>   arch/arm/boot/dts/st/stm32mp157f-dk2.dts          | 2 --
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-drc02.dtsi | 1 -
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-pdk2.dtsi  | 3 ---
>   arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi   | 2 --
>   5 files changed, 10 deletions(-)
> 

Applied on stm32-next.

thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
