Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C57A6D82C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 11:21:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E2F1C7802F;
	Mon, 24 Mar 2025 10:21:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0A62C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 10:21:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O7ilKu011526;
 Mon, 24 Mar 2025 11:21:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 VgcK61C1ClW+Bsv+nkLDe43OxgHSNo7fk3rpTcQgFK8=; b=XdTQiGyNpFJcJ7Yz
 4ms/Nfk+xdVzp//FaxZbXEnnZlCWPLaMUALtg+cNzN1CFTwz5Aad33+EEUWSjJfT
 i0Bc5Qdo9DQmkk1Y2Z7Xh2CQ2Hj8ePd7NFad5mlw4wc/u6NCeWpOuyicdiPrA/Li
 6LjfyNBHNrMcpX38nb33bNf0Hs97xU9PbqmfHaSN0iNiGM3zMiJKITo37bGKytwl
 0sW4leqlqZQF0R57dPQTBPzFAvyn4UDKTczlBiW7HAJ86cf9NJ30AvueWDApCTR/
 z4tY9Nku9xrIBUiJ3gjyx1t/A3ZA30OkLvCUUyN61k3+wybe8uYsUnPgVVj4NkYc
 svyLpQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hkgr78c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 11:21:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E7114004A;
 Mon, 24 Mar 2025 11:20:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 359C580B78C;
 Mon, 24 Mar 2025 11:19:07 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Mar
 2025 11:19:06 +0100
Message-ID: <b99576c5-cc9f-455a-aa58-ce5a0489a5a9@foss.st.com>
Date: Mon, 24 Mar 2025 11:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20250321-upstream_ospi_required_resets-v1-0-9aa4702e3ae2@foss.st.com>
 <20250321-upstream_ospi_required_resets-v1-1-9aa4702e3ae2@foss.st.com>
 <688c619d-0e20-496a-ae24-d62ab34f93ab@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <688c619d-0e20-496a-ae24-d62ab34f93ab@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] spi: dt-bindings: st,
 stm32mp25-ospi: Make "resets" a required property
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



On 3/21/25 11:13, Krzysztof Kozlowski wrote:
> On 21/03/2025 10:44, Patrice Chotard wrote:
>> Make "resets" a required property.
> 
> Please explain why. This is technically an ABI break, so you please
> provide explanation what sort of issue is being fixed.

Hi

Right, i will add more details

Thanks
Patrice

> 
>>
>> Fixes: bed97e35786a ("dt-bindings: spi: Add STM32 OSPI controller")
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  Documentation/devicetree/bindings/spi/st,stm32mp25-ospi.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
