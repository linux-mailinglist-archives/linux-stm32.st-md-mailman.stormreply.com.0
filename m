Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCF685303F
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 13:11:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0D81C6C83D;
	Tue, 13 Feb 2024 12:11:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4572C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 12:10:59 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D9saVg015351; Tue, 13 Feb 2024 13:10:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ChetLBdDsyZCoOZVq/CcmKPawKKxLlNm8k9kly42dxc=; b=XP
 Tm/XEJXAj0h03nwlwl/5vxOFM6OZLESY21fyNEWi0nQ/8/y0YIVcbyeNNmqfeN0D
 SwLoUTSRgO78vD9fJTSxJL+uRY3CWqcjZ76WQ1Czj5Mu7RSy34gpSsZVZtDr5y7i
 NWYZaPwXWhfMPlIINoPXFCOEmu7hwz5ARJrTbn9RURFPVCC7pjh4Jm+pU6+GxG1s
 7oqMgPSWe8VOaR9JwFI/2UuS/YrUysTHG+AMFcJ6PWRuO+l5BCpHNF1OYSu/5eeI
 psFdzYGXlZrW4ioscXxhwNj0n4ayVmD+XYGCZZu7kPxfVlW7/7YY9sV5xC/hIC4s
 U9R0H2GHa1Sgk3zdYYAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62jsatc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 13:10:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 472C04002D;
 Tue, 13 Feb 2024 13:10:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C219236951;
 Tue, 13 Feb 2024 13:09:56 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 13:09:55 +0100
Message-ID: <9f20563b-bef1-41d0-a1ba-fefeabed2e09@foss.st.com>
Date: Tue, 13 Feb 2024 13:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <fbaad3c7-13b7-41a2-a8f6-7036ec1ca2fe@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <fbaad3c7-13b7-41a2-a8f6-7036ec1ca2fe@linaro.org>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_06,2024-02-12_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 00/12] Add MP25 FMC2 support
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



On 2/13/24 08:34, Krzysztof Kozlowski wrote:
> On 12/02/2024 18:48, Christophe Kerello wrote:
>> Add MP25 SOC support in stm32_fmc2 drivers:
>>   - Update stm32-fmc2-ebi driver to support FMC2 revision 2 and MP25 SOC.
>>   - Update stm32_fmc2_nand driver to support FMC2 revision 2 and MP25 SOC
> 
> Why do you combine memory controller driver and NAND in one patchset if
> there is no dependency? On any further submissions, please split
> independent works.

Hi Krzysztof,

NAND driver patch 11 refers to the compatible described for the memory
controller (so there is a dependency), but anyway, I am going to split
this patchet.

Regards,
Christophe Kerello.

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
