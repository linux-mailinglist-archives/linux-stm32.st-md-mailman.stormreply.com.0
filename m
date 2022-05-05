Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574D51BE31
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 13:38:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5672FC5F1FB;
	Thu,  5 May 2022 11:38:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E2C6C5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 11:38:06 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458OXkn015790;
 Thu, 5 May 2022 13:37:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=nah7mSDbtSwqT6AwNkM/s3+n1ALTH54pR+JyiLo0OUA=;
 b=jW6cEH7ZRj/XQEGpAAz73I8QIYZM9G9joxCDuohfazgHejixWyuRIUuZgn47sylctAkV
 7kmgCflxJWiiVWw8n3C1rTp2LU3VOzlim7pci54gfZ8EOcqDWAM75P2ySWmxcXSMXkZV
 p1BZQPlHFIGOrVrN0Idc1RynTfjSDp4Nq7JcPdwanmiXDJltCc2XY7wZ8O6qLh6CuDV8
 g4ZxBuNS9PSaC7oNFJNIOnvZ7k8aXTrwktIGp/zXbN29dRizirEFxaJjbaNrHgjMuwZS
 u6jkeH6HxaFO7Ticfsc2wG04W3ILXceTCivxcED9whTCujVNSdWQyUO7lmibfm/iSKL7 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frvf0sswk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 13:37:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6A4F100034;
 Thu,  5 May 2022 13:37:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFF1D21A23F;
 Thu,  5 May 2022 13:37:39 +0200 (CEST)
Received: from [10.211.10.105] (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 5 May
 2022 13:37:39 +0200
Message-ID: <44356f74-5ab9-5cb9-ae76-6495803d845e@foss.st.com>
Date: Thu, 5 May 2022 13:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220504094143.1272200-1-arnaud.pouliquen@foss.st.com>
 <e0af5143-7fe1-fa68-25c0-eb81d695844a@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <e0af5143-7fe1-fa68-25c0-eb81d695844a@linaro.org>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: remoteproc: Fix
 phandle-array parameters description
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



On 5/5/22 11:10, Krzysztof Kozlowski wrote:
> On 04/05/2022 11:41, Arnaud Pouliquen wrote:
>> Replace the FIXME by appropriate description.
>>
>> Fixes: 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  .../bindings/remoteproc/st,stm32-rproc.yaml      | 16 ++++++++--------
> 
> Please add "st,stm32-rproc" as last prefix in the subject. With that:
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Done in a V2,
Thanks
Arnaud

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
