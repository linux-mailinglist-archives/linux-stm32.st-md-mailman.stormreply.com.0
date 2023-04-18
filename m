Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9126E6549
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 15:04:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C966CC6A5FA;
	Tue, 18 Apr 2023 13:04:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 177FEC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 13:04:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33ICtFoA018647; Tue, 18 Apr 2023 15:03:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LzUumFtrr4EeMVRLDS/dYjTQf8MdHw4wgweVrOp0zKo=;
 b=cf3bdRyeXFiTl7hRHU45JVbVLmRzx92ZLqqQPLhYN2u7pM9fX2lh6kvqaAj49qCzUP+S
 2KEBq6zeaBhskSEmwLFvcNuEcK3SbFIz3lwWipIGCZFBW058YU218FL3QxOwv/x3wLsc
 0MyC+HSz7PG7xQCI+7tpkii6zZK5X0drKFiW4Z/0vDTnbeN0k/6ZI8JFmsfVav3301HE
 U1pHkEqe4CAJ120k0I4kHx7aJ7IPqpdM7LDWDNxhT2NKgVMRWd5vizlOHP7N9fsmpRov
 bAPs6hw1NhMvwoI0fMlGLwrnUknEYKM74Omp+ykABBmXCsm1eQ1lpm6UW5YobKV7kVQ7 Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q10ve1yvu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Apr 2023 15:03:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F30B610002A;
 Tue, 18 Apr 2023 15:03:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAE7821F0C8;
 Tue, 18 Apr 2023 15:03:53 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 18 Apr
 2023 15:03:53 +0200
Message-ID: <f2ad2414-526e-8b9b-aa95-a35953556f36@foss.st.com>
Date: Tue, 18 Apr 2023 15:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20230417181342.v2.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
 <fde49fb8-c337-3a6b-811e-b9d7c3620393@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <fde49fb8-c337-3a6b-811e-b9d7c3620393@linaro.org>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_09,2023-04-18_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: stm32: Remove
 unnecessary blank lines
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

On 4/18/23 09:22, Krzysztof Kozlowski wrote:
> On 17/04/2023 18:14, Patrick Delaunay wrote:
>> Remove double blank line.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>> Changes in v2:
>> - update commit title and commit message to reflect what the change is
>>    V1="dt-bindings: mfd: stm32: Fix STM32F4 DT include fil
> More than one file has the same issue. This is quite a churn to handle
> such patch one by one. Please fix all of them or just skip, as it is
> harmless.


To be crystal clear, it is minor difference between files in U-Boot

and in Linux, just because we correct the check-patch errors

when this file for STM32F4 was up streamed in U-Boot.


I prefer correct this line in the Linux file and no having

this difference for each device tree synchronization with U-Boot.


But if you prefer, you can drop this modification and

I will align U-Boot file with this error.


Alexandre: it could part of patch for STM32 files clean-up ?

scripts/checkpatch.pl -f include/dt-bindings/*/*stm*

scripts/checkpatch.pl -f arch/arm/boot/dts/stm*


>
> Best regards,
> Krzysztof


Regards

Patrick


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
