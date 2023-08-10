Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF665777CB9
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 17:51:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86DFEC6B469;
	Thu, 10 Aug 2023 15:51:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81223C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 15:51:58 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37AClMPY009213; Thu, 10 Aug 2023 17:51:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=g+8JhM5SSBXnEGBoDoQhWJziQ4ZCSrXrnm9iiuLxIDk=; b=Fp
 GQg3BnYhfEf9QARcqXnmN7GIWJ9LN4rj2fv9mXskpBbHFjF0lhIge+MUd2SrDB/g
 5h8ZB/RhFE58kIj0jFzFQKAX0Kqd/ONBO4+ks+L/faH+9sGjYjy1sAkhMFr9i5wX
 oP6CmZU4XH+stxhokKvrdSyUgS6je6OGBv7F52oNh9m/saZjvsOja8Ojopu1WT2z
 vdbnv/EgSrBagecSYRvq3pImjqDw9bhkl015knbPjnPqBZCpmtGSytTs4d9Fn0BT
 2ODeFbqlssEuMqdej8GjZPqUiOG2KtNUUIYKOPOoJiM3wO6XCVzy+dqXurtE5wSD
 jwk8XUVejmMwBjjgQQHQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sd0730yba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 17:51:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF8F6100053;
 Thu, 10 Aug 2023 17:51:48 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8313227EF6;
 Thu, 10 Aug 2023 17:51:48 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 10 Aug
 2023 17:51:48 +0200
Message-ID: <6098f24e-c2fa-b74f-76e3-5a3718e887da@foss.st.com>
Date: Thu, 10 Aug 2023 17:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <patrice.chotard@foss.st.com>, <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20230808093119.714224-1-patrice.chotard@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230808093119.714224-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_13,2023-08-10_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] Add gpio_ranges property for stm32f7
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

On 8/8/23 11:31, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Add missing gpio-ranges property for stm32f7 based boards.
> 
> Patrice Chotard (2):
>    ARM: dts: stm32: Add gpio-ranges for stm32f746-pinctrl
>    ARM: dts: stm32: Add gpio-ranges for stm32f769-pinctrl
> 
>   arch/arm/boot/dts/st/stm32f746-pinctrl.dtsi | 44 +++++++++++++++++++++
>   arch/arm/boot/dts/st/stm32f769-pinctrl.dtsi | 44 +++++++++++++++++++++
>   2 files changed, 88 insertions(+)
> 

Series applied on stm32-next.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
