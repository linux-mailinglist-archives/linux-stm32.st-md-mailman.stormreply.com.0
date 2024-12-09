Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D139E8E3E
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 10:01:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6740EC78021;
	Mon,  9 Dec 2024 09:01:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8F07C78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Dec 2024 09:00:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B98VISn028237;
 Mon, 9 Dec 2024 10:00:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4raHiqxQoPVH+LXWyFUosGW/Q2xLlE6E0wYYvSLxcV8=; b=YOj+ENX1/yu/azn+
 6f4/j18QK7hxDoTpOMaZeTzmhKvPgOhxJWfZTEinxb4/Iq0tBk2UzJAbMsDJI7ri
 S42H1yBbQOZmmhXCglpUjzdChmDv8XOs2UTiDQ7M7SwXRvzFyvzpTuugJRkMXo4D
 u7xCUKFKwoHJdBxfdPUogHgiEDsu3F6upLsENPXtH60KZkJC/Ct1vTBrClM7WEYP
 My56ygdlFcscpK5ATcFo/LDe3dVxvzGIJFJEIs4qT5rvXvKn9qvWYBZDOZuyuBIp
 cu6BTwu3YFBT33nroessU5wdkyfdLi8KRSf3oqMkIeYg51xw2Vcgr42NXJKSkzXG
 2YzWPg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnkxwrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2024 10:00:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F07CC40077;
 Mon,  9 Dec 2024 09:59:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 818D524D44F;
 Mon,  9 Dec 2024 09:58:59 +0100 (CET)
Received: from [10.48.87.198] (10.48.87.198) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Dec
 2024 09:58:58 +0100
Message-ID: <18c36a0b-f647-4acd-bed2-d5a09b1694b7@foss.st.com>
Date: Mon, 9 Dec 2024 09:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ken Sloat <ksloat@cornersoftsolutions.com>
References: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20241206115018.1155149-1-ksloat@cornersoftsolutions.com>
X-Originating-IP: [10.48.87.198]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: dma: st-stm32-dmamux: Add
 description for dma-cell values
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



On 12/6/24 12:50, Ken Sloat wrote:
> The dma-cell values for the stm32-dmamux are used to craft the DMA spec
> for the actual controller. These values are currently undocumented
> leaving the user to reverse engineer the driver in order to determine
> their meaning. Add a basic description, while avoiding duplicating
> information by pointing the user to the associated DMA docs that
> describe the fields in depth.
> 
> Signed-off-by: Ken Sloat<ksloat@cornersoftsolutions.com>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
