Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF26A36386
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 17:48:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EC1FC78F8C;
	Fri, 14 Feb 2025 16:48:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42E59C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 16:48:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51ECjshJ029218;
 Fri, 14 Feb 2025 17:48:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 muAwRDtlWPqfC7Ckl/SfsaEnjrfKdJHs7mawv1lD9nw=; b=J464MCAJoWPrzPnd
 fRlHP0xSoZLl0JuJpDcUtJfkP1wD2LrmbaqZCZyZuhCCj6hzB49SPN75gv42S4CR
 yeJTMLhfp5JZk7V10TxdnBQ3ykrDjpRVjI6xyJBTDObS04jofzr+jyvDdV7RivNJ
 nLgYS0a7KFIdGsNB3qgDSMYyLibyNB2Ox310k+xL8kx+gL1U4PiUtYgauidb87pB
 gaa7Dr6K2I8pcGrqPqgUGCBh30X4lZ2gRxEQIINgSUmhlUSa4nNU5f0zad+5ys+a
 sxI3KbL45014YivfJAGV3AhhXGpxSkA6EzFUS85f9NAWGEi+dL9h/PndurEQwW0A
 heVDkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44rrfxc9e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 17:48:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1BCFB40050;
 Fri, 14 Feb 2025 17:47:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E701B2F25A5;
 Fri, 14 Feb 2025 17:42:36 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Feb
 2025 17:42:35 +0100
Message-ID: <9c543c92-38c5-457e-8a58-910d10867049@foss.st.com>
Date: Fri, 14 Feb 2025 15:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>
References: <20250117140514.3614314-1-christian.bruel@foss.st.com>
 <Z688unKfcSeFE5X/@vaman>
Content-Language: en-US
In-Reply-To: <Z688unKfcSeFE5X/@vaman>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
Cc: kishon@kernel.org, arnd@arndb.de, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Fixes: 2de679ecd724 ("phy: stm32: work
 around constant-value overflow assertion")
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


On 2/14/25 13:53, Vinod Koul wrote:
> On 17-01-25, 15:05, Christian Bruel wrote:
>> This patch replaces the workaround with fixes for two issues leading to
>> constant-value overflow assertion:
>>
>> - Guard against false positives with a WARN_ON check to make the compiler
>> happy: This should not happen because the offset range is checked against
>> the sorted imp_lookup_table values.
>>
>> - Guard against a true warning found for the max_vswing, as a given
>> vswing value can be 802000 or 803000 depending on the current impedance
> 
> Patch looks fine, the fixes line should go here and subject needs
> revision
> 

Hello Vinod,

This was addressed in the [v2,RESEND] that you applied :

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250210103515.2598377-1-christian.bruel@foss.st.com/

you can drop this first version.

thanks !

Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
