Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19650B13B3F
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 15:16:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAFCDC36B2E;
	Mon, 28 Jul 2025 13:16:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61735C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 13:16:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SCmIZY020685;
 Mon, 28 Jul 2025 15:15:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 kLBhveJQnl8m3PppqLbOwkmepYRNmUTrNGuqfx0S5N0=; b=BO0GX2YIvdvzkDS8
 ZgLPuGdA6WGl6NtJ6/xQvARzA7FDTBuGpl2k/0Qe88TTGB7pnIHxmoiSSisOV32g
 UPiaPFmPKvtiX3XhLTfQmiPWWhAf9mhUbsxt+Qr5vXr+/xmOe8AI+GP0Tf55h+zN
 AFsqv8MDszq5GkCQzzPwvL5oMkRwBOJCrayjtLqCoOJvpNLWhq4S434nD6ImKdRB
 72VdlL6sQWIW34oobe/U/QH4wcbMN4ZdhzkhC81oilbCnC/pNvViJ6nfNqbMdD1i
 EIeVOm26ibQEre65vm7otTMzzWKq1lvbLirBMolEWRX1Hn8E7BM9qTwCIDk13yj3
 LKIF2A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc28cgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 15:15:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C3CB64005A;
 Mon, 28 Jul 2025 15:13:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDC18768ABE;
 Mon, 28 Jul 2025 15:12:40 +0200 (CEST)
Received: from [10.252.23.100] (10.252.23.100) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 15:12:39 +0200
Message-ID: <a0c0e255-32c6-466d-a2ea-694a4f074de3@foss.st.com>
Date: Mon, 28 Jul 2025 15:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-12-7b7a4f3dc8a0@foss.st.com>
 <20250725115655.00002304@huawei.com> <20250725115908.000074d7@huawei.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250725115908.000074d7@huawei.com>
X-Originating-IP: [10.252.23.100]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 12/19] perf: stm32: introduce DDRPERFM
	driver
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

On 7/25/25 12:59, Jonathan Cameron wrote:
>>> +
>>> +	platform_set_drvdata(pdev, pmu);
>>> +	pmu->dev = &pdev->dev;
>>> +
>>> +	pmu->cfg = device_get_match_data(pmu->dev);
>>> +
>>> +	pmu->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>> +	if (IS_ERR(pmu->membase))
>>> +		return PTR_ERR(pmu->membase);
>>> +
>>> +	if (of_property_present(pmu->dev->of_node, "access-controllers")) {
>>> +		ret = stm32_firewall_get_firewall(pmu->dev->of_node, &firewall, 1);
>>
>> Jiri is busy driving dev_fwnode() thorugh to get rid of all the directly references
>> to of_node.  Probably better to use that here from the start.
>>
> Need more coffee. Ignore this one, you still need an of_node here.
Ack

> 
>>
>>> +		if (ret)
>>> +			return dev_err_probe(pmu->dev, ret, "Failed to get firewall\n");
>>> +		ret = stm32_firewall_grant_access_by_id(&firewall, firewall.firewall_id);
>>> +		if (ret)
>>> +			return dev_err_probe(pmu->dev, ret, "Failed to grant access\n");
>>> +	}
>>> +

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
