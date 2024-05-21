Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E14C78CAE0A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 14:17:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A56BC6C838;
	Tue, 21 May 2024 12:17:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99632C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 12:17:41 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LBRr0a019207;
 Tue, 21 May 2024 14:17:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=NB18YDuzAPhccihOvrNVEn535LLvcSqVIm6q6GCowLk=; b=NW
 sKLMmVnuP5no2/j0pXbYlId8pyR1WjzvXloM+f+9wc/2IXqZ01GrlUFcy4x8Dr8X
 5mya/Z5J3547aeYnsSdQLyiIvWwiI3KD/gqvyqryUt1/Ip7/hSLJ6d/kZSGBCTjN
 ebH2L2X8tIbDk4v9RZpMkPWNpyfigSzu5UVgG+6gLNO7wuWK3EgMbsOGL5LFcbGy
 fa4BMItreNQq0G+KBfj381mzXyqU+OkdRAUIZ9NTpaqfpdToqjEEww33P2DQ1/Jn
 o1v3YyV7fSKm6+vVtOeMlg9MBhk40o3Xih2T0qAbxls5c2bTaF79X/CLVT0Q6RZm
 JIlMJm/Pc9wdARZT/ZWA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y75w0a23s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 May 2024 14:17:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B22CF4002D;
 Tue, 21 May 2024 14:17:22 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B82B2194DB;
 Tue, 21 May 2024 14:16:58 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:16:57 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 14:16:57 +0200
Message-ID: <498403f4-98ff-40ec-adfc-c0ffba6450aa@foss.st.com>
Date: Tue, 21 May 2024 14:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-3-arnaud.pouliquen@foss.st.com>
 <dfb3c96e-0684-4e61-b1c9-5a83f61e0418@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <dfb3c96e-0684-4e61-b1c9-5a83f61e0418@kernel.org>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 2/7] dt-bindings: remoteproc: Add
 compatibility for TEE support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On 5/21/24 11:24, Krzysztof Kozlowski wrote:
> On 21/05/2024 10:09, Arnaud Pouliquen wrote:
>> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
>> where the Cortex-M4 firmware is loaded by the Trusted execution Environment
>> (TEE).
>> For instance, this compatible is used in both the Linux and OP-TEE
>> device-tree:
>> - In OP-TEE, a node is defined in the device tree with the
>>   st,stm32mp1-m4-tee to support signed remoteproc firmware.
>>   Based on DT properties, OP-TEE authenticates, loads, starts, and stops
>>   the firmware.
>> - On Linux, when the compatibility is set, the Cortex-M resets should not
>>   be declared in the device tree.
>>
> 
> Not tested.
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
> 
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
> 
> Please kindly resend and include all necessary To/Cc entries.

I apologize for this oversight; I will resend the pull request and adding
the missing CC and To.

Thanks!
Arnaud

> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
