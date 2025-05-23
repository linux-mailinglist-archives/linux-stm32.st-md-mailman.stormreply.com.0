Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C833AC248D
	for <lists+linux-stm32@lfdr.de>; Fri, 23 May 2025 15:59:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A048C7A82A;
	Fri, 23 May 2025 13:59:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7EA1CFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 May 2025 13:59:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCYpHj011934;
 Fri, 23 May 2025 15:58:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AIInZnJPnYgqDjAZabB8sZdy0QwAFLIAtwz+MylnP7k=; b=YdPs9bR+Tlgi2y3r
 g7xawDkziYKq11SfV2bPECBW4CrNOUj/06DTajvSTFZ76zTzlvS5A3BCDmk9b7k3
 kxiBdGU9mDt5OQ72A13gjyVm9oaYd5A0u3Cn3moxid1cQbHbctdHxQJqOaPvqJHs
 HHqUX4slez11lBycBfy6HbV6LNTHtodEZyI0CknuZZELzx9NRiro5QC49qs2+IdW
 Tgag2pgcO/eYVVnEqWCy95FLiSjc8TxoO16eMdzz1FG4KV5em8/nO1xBUr2Oby2d
 OxVbpWtC0zuWwS7aA+0rT1DDOpbBQuCQq1WVQ0hGGrGZZGn/xeAPRs6X6EBTQIm2
 Oo6d1A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwffefwy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 May 2025 15:58:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C28D140049;
 Fri, 23 May 2025 15:57:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C9F0A73EFC;
 Fri, 23 May 2025 15:56:56 +0200 (CEST)
Received: from [10.252.20.86] (10.252.20.86) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:56:55 +0200
Message-ID: <27bf1d5a-dfe0-40d0-a962-63b80b0d29c5@foss.st.com>
Date: Fri, 23 May 2025 15:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-3-cac9d8f63d20@foss.st.com>
 <20250521-lapdog-important-eab513a1f0c0@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250521-lapdog-important-eab513a1f0c0@spud>
X-Originating-IP: [10.252.20.86]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] dt-bindings: stm32: cosmetic fixes
 for STM32MP25 clock and reset bindings
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


On 5/21/25 17:27, Conor Dooley wrote:
> On Wed, May 21, 2025 at 02:38:51PM +0200, Gabriel Fernandez wrote:
>> - drop minItems from access-controllers
>> - remove rcc label from example
>> - fixes typos
>> - remove double '::' from 'See also::'
>>
>> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks Conor

Best regards

Gabriel

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
