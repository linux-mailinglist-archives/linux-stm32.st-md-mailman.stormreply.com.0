Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715399304D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 17:01:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F9E5C6DD94;
	Mon,  7 Oct 2024 15:01:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB725C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2024 15:01:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497BwB4Z004331;
 Mon, 7 Oct 2024 17:00:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qE8wZ+gDGWCnPkH+WVw/mcs9lDttSkwGYaOIzdr4U8s=; b=W7wzoXSlQueKttxg
 y5n+RZKKhj2fRMRxSAGXhQSskcRsMVHezHj39OHV1CRAX3fCCdLFX+b2CDMIwvpX
 HyG0WdbkIHO8Jn0ZflUmznB8SnZMES5iBrMncl3xXDea2QmsY+fDmY42ZXHU65eT
 RVq78FL2UHVNmlKWtUGFlgdOwL5uKRR913OI6buzjCPu7jvJIj5IODMnACjs7wFN
 BsuK4mYdBIgvL4zcei8wCHDS3jDPBECgJMU7BQtLi1F0C1gmK/HhEZ0dSUYpzdgn
 7/4AwOQ+i7WZNTnd/ru1V40hVeEcCeeA91/yINJRd6yRa6k7u1zJW89nO8xQOI/t
 k647Fw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 422xv71hh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2024 17:00:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 22CCF40047;
 Mon,  7 Oct 2024 16:59:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86106226AF5;
 Mon,  7 Oct 2024 16:58:19 +0200 (CEST)
Received: from [10.48.86.225] (10.48.86.225) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 7 Oct
 2024 16:58:18 +0200
Message-ID: <25630f20-de0e-401a-8002-4aec03f6e2f1@foss.st.com>
Date: Mon, 7 Oct 2024 16:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, Olivia Mackall <olivia@selenic.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241007132721.168428-1-gatien.chevallier@foss.st.com>
 <20241007132721.168428-4-gatien.chevallier@foss.st.com>
 <41fb71cf-7ae8-47b8-bd0e-fc24da9d0bd3@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <41fb71cf-7ae8-47b8-bd0e-fc24da9d0bd3@denx.de>
X-Originating-IP: [10.48.86.225]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] hwrng: stm32 - update STM32MP15 RNG
 max clock frequency
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



On 10/7/24 15:55, Marek Vasut wrote:
> On 10/7/24 3:27 PM, Gatien Chevallier wrote:
>> RNG max clock frequency can be updated to 48MHz for stm32mp1x
>> platforms according to the latest specifications.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Does this also apply to MP13 ?

Max frequency for MP13 is already 48MHz.

Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
