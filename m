Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D202D8B36A2
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 13:42:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7E3C71292;
	Fri, 26 Apr 2024 11:42:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05072C71291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 11:42:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43Q9YZbQ003998;
 Fri, 26 Apr 2024 13:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=xlp/k6NhfJf0MqxY61zVVi1EscMRkgrov08pc3xWnOQ=; b=EF
 brcrlSp46O1V38x7aimygEW9OOem1rrJnfo1JuqJegCGR9OogPSz7VKupSeL3T3V
 pqW7mazob116524aoeNUmLKrH81SIFt/gMORjwOOnDBMPj45kg4fxwz7PSGEB6V0
 FZs8g/JUmBmjNQ4e6HCH+OM8aGMeEehZIfM36OGF8c3hy4xxkyPdFbKnTBWQK7Eq
 KeyCgtmpqjif0ai204Bywn5alXego3R9uiCHICxdmCvwg0eBkq1+HbdCkD5zRSBp
 RdCeVJOEkbpwDRrXZeFRq7yfQ4kDfECoax2q7coLWPA8FrMM5TWYtlK8FW1inqBb
 frfX0FIJ7nKaVXbLAzCA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4ee9jx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Apr 2024 13:42:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F36D74002D;
 Fri, 26 Apr 2024 13:41:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF31E2194CC;
 Fri, 26 Apr 2024 13:41:14 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 13:41:13 +0200
Message-ID: <28aeb8b1-72f1-4dd9-b433-f5b693150475@foss.st.com>
Date: Fri, 26 Apr 2024 13:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
 <20240425163035.GA2783061-robh@kernel.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240425163035.GA2783061-robh@kernel.org>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] ARM: st: use a correct pwr compatible
	for stm32mp15
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

Hi,

On 4/25/24 18:30, Rob Herring wrote:
> On Thu, Apr 25, 2024 at 09:48:31AM +0200, Patrick Delaunay wrote:
>> This patchset removes the unexpected comma in the PWR compatible
>> "st,stm32mp1,pwr-reg" and uses a new compatible "st,stm32mp1-pwr-reg"
>> in STM3MP15 device trees.
> Why? I don't see any warnings from this. Yes, we wouldn't new cases
> following this pattern, but I don't think it is worth maintaining
> support for both strings. We're stuck with it. And the only way to
> maintain forward compatibility is:


Yes, no warning because the compatible string are not yet checked by tools.


I propose this patch to avoid the usage of this compatible for other SoC 
in STM32MP1 family.


I see the invalid compatible string when I reviewed the U-Boot patch to 
add the PWR node for STM32MP13 family:

https://patchwork.ozlabs.org/project/uboot/patch/20240319024534.103299-1-marex@denx.de/


So I prefer change the PWR binding before to have the same patch applied 
on Linux device tree

> compatible = "st,stm32mp1-pwr-reg", "st,stm32mp1,pwr-reg";


Yes, I will update the SoC patch with you proposal.

it is the only way to have compatibility of OLD Linux kernel (with old 
driver) with NEW device tree.

I miss this compatibility issue.


>
> Rob
>
>
>
Regards

Patrick

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
