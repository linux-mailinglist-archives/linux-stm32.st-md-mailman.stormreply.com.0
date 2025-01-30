Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B74CEA229F1
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2025 09:58:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 843CEC71289;
	Thu, 30 Jan 2025 08:58:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 278ECC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 08:58:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U6Qiup019883;
 Thu, 30 Jan 2025 09:58:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 s976OaYE2e3BsM2Yyt8pmWRwKwvFpBCgGfn39LD9zkw=; b=d3G/Qm44ZvEs6Pm1
 MFIt92MrrZ7GkJEc1sMOsAsWaPjDpugbhSSWoD5CB/JjJEwBd5HOC/kB7O0wDcIe
 Mto+B7CcU9xb+DYxKAd//M/HIupe0ifZzjajnMAYL1QkYMqHkCXwsTESRyhSeOp7
 +BDxhIEVuA5BOdxoWMjBcQ6GwYqZ8wsd5bOv/9iif0e5Fa1WtwLjc5o96HmybiLr
 aVawqJDqZ+YjjyVbhk4vqRR9meCxiwF1LpJL76uweEmGEOAEzW7KAJ1FxIovGQDy
 BnQQRYrx/zdyXT5QCo7ZTJ4WFkMEDNJr7GYYpHWePrdt+eTQhJnpMfwIIeGI5DNo
 zeivdg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f26x6wd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 09:58:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1A47F4002D;
 Thu, 30 Jan 2025 09:57:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4DE822D5871;
 Thu, 30 Jan 2025 09:56:02 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 09:56:01 +0100
Message-ID: <b5d7fce0-f726-4b54-a038-d3e0526cdde0@foss.st.com>
Date: Thu, 30 Jan 2025 09:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-10-patrice.chotard@foss.st.com>
 <df76be38-cf62-417a-85f4-a1a95af0db74@kernel.org>
 <36560385-ff90-4f7c-8e5c-2bfb014a4c7f@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <36560385-ff90-4f7c-8e5c-2bfb014a4c7f@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 9/9] arm64: defconfig: Enable STM32
	OctoSPI driver
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



On 1/29/25 11:30, Krzysztof Kozlowski wrote:
> On 29/01/2025 10:36, Krzysztof Kozlowski wrote:
>> On 28/01/2025 09:17, patrice.chotard@foss.st.com wrote:
>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> Enable the STM32 OctoSPI driver.
>>>
>> Please squash this patches. It's not one driver per one defconfig change.
> 
> 
> s/this/these two/
> 
> So only one defconfig patch.

ok

Thanks
Patrice

> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
