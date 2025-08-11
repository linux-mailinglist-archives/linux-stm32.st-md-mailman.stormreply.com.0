Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E0B2094E
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 14:51:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27120C32E8D;
	Mon, 11 Aug 2025 12:51:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5B56C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 12:51:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BCFoFq015667;
 Mon, 11 Aug 2025 14:51:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 53zGgiW4pcj9jrOtnsn97k72zHjoUdMXek5BkNzfPj0=; b=2wI3QkQih+ZdbeD8
 Nn1JouG6h2FjVti5TbXbXwzVtT1X07GrF3u0GJT+xhn2w9bVIvqVu1LPOnqXnaAa
 DhlmK7aO2zPgDg2mkVyz+CMtC112Hw9BZ4LoYUkFUZK350NSYaLsuxvp83p9B1YG
 6yTUwtghRDbAsDN0QmhVmExmdBBnY6OOh19pWzG78oXoRjDQBhbxi0vwrnHqDGqD
 OOvw5UT9a6wogG6nwg4p5GZx1GDTfO3RiqytUn06BWZl+wrzIxliRCFqQFH5qk42
 eOgyPA7PW5CvOZysBEZa0jMNHGl/3DKWegPmUpH30H4fUIou+M5YoXGuReaQkQZI
 yUTaVw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7g61uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Aug 2025 14:51:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0DCFA40066;
 Mon, 11 Aug 2025 14:50:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3479F748475;
 Mon, 11 Aug 2025 14:49:46 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 14:49:45 +0200
Message-ID: <a55774bf-1133-48c2-ad20-7a69f340bd78@foss.st.com>
Date: Mon, 11 Aug 2025 14:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>
References: <20250807-upstream_omm_fix_req2ack_test_condition-v2-1-d7df4af2b48b@foss.st.com>
 <39c67e57-e4e6-46ba-bd61-46afc650381c@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <39c67e57-e4e6-46ba-bd61-46afc650381c@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] memory: stm32_omm: Fix req2ack update
	test
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



On 8/11/25 09:09, Krzysztof Kozlowski wrote:
> On 07/08/2025 09:34, Patrice Chotard wrote:
>> If "st,omm-req2ack-ns" property is found and its value is not 0,
>> the current test doesn't allow to compute and set req2ack value,
>> Fix this test.
>>
>> Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>> Changes in v2:
>> - Add more detail in commit message
>> - Remove "Cc: <stable@vger.kernel.org>" tag as the fixed patch is not part of a LTS.
> 
> Why LTS would matter? Which kernel is being fixed here?

Hi Krzysztof,

The fixed kernel is v6.16.

Thanks
Patrice

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
