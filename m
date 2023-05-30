Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 602367161E5
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 15:31:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0602CC6A613;
	Tue, 30 May 2023 13:31:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09F3FC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 13:31:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U9eANS001363; Tue, 30 May 2023 15:30:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lELW+s5lmZKWjeMpQ3kERNUcACwyTcZXXJ9J7hPodYM=;
 b=AnIbH62mrtryj5eucMpAcmm7vu6e90DGIOEeyBwBr5os1VZfXnk2dYbcmF+9upVowr4O
 bh6bv5dXqEZ1kAJcx5gfVc1pLJ3MCU3HP587Muttw03ezl9K+u/lXF5mfcOg1T7V1RvB
 NK39tpP5rzsHHWi/PbKg0ZdnqCGaOayumWft5aS4urv3qth8XeWsYs8uxm4/o3ckOeFJ
 Y3ovWkyXksPu1vb49NM7ssyKlx+XRSQqRW4Kv874oJ/1nK2/YENoMnpFQxDKEth6Jt5y
 p4+rD8WgoWU5mSHEI1lk3vvCo35XQBIUwk9AqPrskaxdtzkqwx8YUM6suUS2x+XxyCZS 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qweqe1db0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 15:30:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0451A10002A;
 Tue, 30 May 2023 15:30:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAC1B228A29;
 Tue, 30 May 2023 15:30:34 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 15:30:33 +0200
Message-ID: <92d5a699-9f5d-2e40-ca73-4604f3e5a657@foss.st.com>
Date: Tue, 30 May 2023 15:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
 <20230530122736.tflfu5cugbd7ooup@krzk-bin>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230530122736.tflfu5cugbd7ooup@krzk-bin>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_10,2023-05-30_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: display: st,
 stm32-dsi: Remove unnecessary fields
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

On 5/30/23 14:27, Krzysztof Kozlowski wrote:
> On Mon, 29 May 2023 11:13:57 +0200, Raphael Gallais-Pou wrote:
>> "#address-cells" and "#size-cells" are two properties that are not
>> mandatory. For instance, the DSI could refer to a bridge outside the scope
>> of the node rather than include a 'panel@0' subnode. By doing so, address
>> and size fields become then unnecessary, creating a warning at build time.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Marek Vasut <marex@denx.de>
>> ---
>>   Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 2 --
>>   1 file changed, 2 deletions(-)
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings
I checked it before merging the series on stm32-next tree. I didn't get 
this error. I didn't check commit per commit.

Do you get this error after merging the whole series ?


> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1787034
> 
> 
> dsi@40016c00: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
> 	arch/arm/boot/dts/stm32f469-disco.dtb
> 
> dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
> 	arch/arm/boot/dts/stm32mp157c-ev1.dtb
> 	arch/arm/boot/dts/stm32mp157c-ev1-scmi.dtb

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
