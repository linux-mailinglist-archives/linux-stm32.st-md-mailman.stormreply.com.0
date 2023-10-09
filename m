Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 633947BE165
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 15:50:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 167E5C6A61D;
	Mon,  9 Oct 2023 13:50:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2707DC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 13:50:00 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 399D7Qxg013177; Mon, 9 Oct 2023 15:49:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Rl6XtwYBshIFAdYkV2eozsWds6Rxm1JhSGil6DuD480=; b=u2
 qZ9iUMCuSQohPkXzoktEV4wucBR6zC7z6pbKCvxrCE4UE1N2O5wD8pTNA1GTdk5i
 BzWqVSGKd7RgwFXHk5CRBwZMRUYRZDN98g5rEVFJTuZw0uUwVCjli7A/Na7+RZIW
 9QhDxTQuE4QE+jaQFgPP7wqDRJZA/roFtr8ywVHuBqPG75ly+UmlP4EeRkyz9Mlu
 AAq9wxKEmWKpOQMdS+ncv8PsR0yY/lQz/h8w11IGePTgm5KyPcq4d3qUj5CVV/Zu
 TONWGDQMxSGSvmQm1nZmN58BTEu6NLDsGPeKE6VU671d/CRfQJg+W627CeHyuMdV
 QHdV36dKtBka4r+BAz0Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkhk3de1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:49:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F243210005E;
 Mon,  9 Oct 2023 15:49:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6F9924FF4F;
 Mon,  9 Oct 2023 15:49:42 +0200 (CEST)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 15:49:41 +0200
Message-ID: <0de2ae74-2ba1-0e8d-aa7b-77806ac8b252@foss.st.com>
Date: Mon, 9 Oct 2023 15:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
References: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
 <20231004091552.3531659-4-hugues.fruchet@foss.st.com>
 <6bc60e4a-ddf1-4125-ba27-53ab55a553d2@linaro.org>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <6bc60e4a-ddf1-4125-ba27-53ab55a553d2@linaro.org>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_11,2023-10-09_01,2023-05-22_02
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: media: Document
 STM32MP25 VENC video encoder
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

Hi Krzysztof,

On 10/5/23 21:45, Krzysztof Kozlowski wrote:
> On 04/10/2023 11:15, Hugues Fruchet wrote:
>> Add STM32MP25 VENC video encoder bindings.
>>
> 
> I don't understand why this binding is separate from video decoder.
> Merge them.
VDEC and VENC are two independent IPs with their own clock, reset, 
interrupt & register set, they have their own access to APB/AXI bus.
Moreover future chipsets may embed only VENC or VDEC.

Hoping that this clarifies the reason of two different bindings.

> 
> Best regards,
> Krzysztof
> 


Br,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
