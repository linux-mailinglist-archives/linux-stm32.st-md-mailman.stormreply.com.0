Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCCEA54534
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 09:42:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 550CAC78002;
	Thu,  6 Mar 2025 08:42:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67A61C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 08:42:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267Sk7N015077;
 Thu, 6 Mar 2025 09:42:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 mcl6sGfOXxz2wVCK7AnSLNHITansIH0yOzXR+7u97no=; b=xAzJdlwnXlBNm1Wa
 7Ife+ee+VgwahclxL70yp7tvaLJa4H1ObaqD15ZCyqlBMH8sFnRdZUvn31Mp/SYY
 A6pIR/FJjc7B6PXCWpy9ykshds9Lejm8g+cCQeGONwjQjacbntQuag08ox4s2mY8
 ddSQ/IRWGPpgvpnKCy7O/ZJ9kLoESBL6G08fUFrN7asYyBbMFxOJt7yJNxjYNB+k
 iILuXTz1faI7GfE3vI91cHBsKtfVb54RKddtFw73nEowe2PMhzDlVNnwOq6/WEbb
 xLIadHIi8b/hnQpaRc5nb2vNJe8YRQrNEGYudS/Re0U0EgUNScrj9SFkBxGHFMvf
 Xt/NHA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 456krth50w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 09:42:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 54F7C40052;
 Thu,  6 Mar 2025 09:41:17 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83009441E5C;
 Thu,  6 Mar 2025 09:40:12 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:40:12 +0100
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 09:40:11 +0100
Message-ID: <32aad66e-a9ae-493a-8bea-a06e096c88f2@foss.st.com>
Date: Thu, 6 Mar 2025 09:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <jic23@kernel.org>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-4-fabrice.gasnier@foss.st.com>
 <20250305144539.54a75689@jic23-huawei>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250305144539.54a75689@jic23-huawei>
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
Cc: robh@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-iio@vger.kernel.org, catalin.marinas@arm.com, lee@kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 ukleinek@kernel.org, krzk+dt@kernel.org, will@kernel.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/8] iio: trigger: stm32-lptimer: add
 support for stm32mp25
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

On 3/5/25 15:45, Jonathan Cameron wrote:
> On Wed, 5 Mar 2025 10:49:30 +0100
> Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:
> 
>> From: Olivier Moysan <olivier.moysan@foss.st.com>
>>
>> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
>> this new HW variant. Add new trigger definitions that can be used by the
>> stm32 analog-to-digital converter. Use compatible data to identify them.
>>
>> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Hi. Oops I replied to v1 without looking for other versions.
> From a quick glance feedback still applies here.

Hi Jonathan,

Thanks for reviewing, I've noticed your review comments on V1, I'll take
care of these in next revision (v4).

Best Regards,
Fabrice

> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
