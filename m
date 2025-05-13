Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDEFAB5873
	for <lists+linux-stm32@lfdr.de>; Tue, 13 May 2025 17:24:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D81D2C7A837;
	Tue, 13 May 2025 15:24:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AFABC78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 May 2025 15:24:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDxVGf019621;
 Tue, 13 May 2025 17:24:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 e4Aq7HPeyHmZNMONnd/Qv8JQOHr8stkcWD0o0/Qj+zY=; b=6WjYTtlFh2jVpF6c
 sAiuYst1VrwSG4Uu1J3k6lhmhRQFOjgBZAjZsSpgkJauvx9f1zwfbvNspQ7atVbd
 iKp5tMvKZ6JFMQLPXPzQALgN9KBKwa/8OCI/Xwv6xwUYVFig7OsacuQ9vCBMgJKX
 wGpe/oJTOWyIvZnUs83Fx9VAdQt4gETCdSELW9yHlAHIbRLFnucKgKj1VcGcxMC9
 uMFD7keTcqOFIceCsICL89TuHQHFjgXzT0iitYSh9R3XX71dhpJ8+3LQj5Hc4fQ6
 esm1fowNraTMATZLvrA94zjT9UakGtQJhX5aBsYUHY5rC3sEYOLwBs977cDbhAME
 tN5OfA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46hx51cvaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 May 2025 17:24:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2EEF74004A;
 Tue, 13 May 2025 17:22:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B4592B1D1AF;
 Tue, 13 May 2025 17:22:02 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 17:22:01 +0200
Message-ID: <33c35580-e6d6-4c66-80b4-2f5769ce4e67@foss.st.com>
Date: Tue, 13 May 2025 17:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
 <20250428-upstream_ospi_v6-v11-2-1548736fd9d2@foss.st.com>
 <aB29hOrv0nU73RCn@stanley.mountain>
 <cff1ddb5-b438-4287-80cf-3969f7b7b767@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <cff1ddb5-b438-4287-80cf-3969f7b7b767@kernel.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v11 2/3] memory: Add STM32 Octo Memory
	Manager driver
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



On 5/13/25 09:54, Krzysztof Kozlowski wrote:
> On 09/05/2025 10:32, Dan Carpenter wrote:
>> On Mon, Apr 28, 2025 at 10:58:31AM +0200, Patrice Chotard wrote:
>>> +static int stm32_omm_toggle_child_clock(struct device *dev, bool enable)
>>> +{
>>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>>> +	int i, ret;
>>> +
>>> +	for (i = 0; i < omm->nb_child; i++) {
>>> +		if (enable) {
>>> +			ret = clk_prepare_enable(omm->clk_bulk[i + 1].clk);
>>> +			if (ret) {
>>> +				dev_err(dev, "Can not enable clock\n");
>>> +				goto clk_error;
>>> +			}
>>> +		} else {
>>> +			clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +clk_error:
>>> +	while (i--)
>>> +		clk_disable_unprepare(omm->clk_bulk[i + 1].clk);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int stm32_omm_disable_child(struct device *dev)
>>> +{
>>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>>> +	struct reset_control *reset;
>>> +	int ret;
>>> +	u8 i;
>>> +
>>> +	ret = stm32_omm_toggle_child_clock(dev, true);
>>> +	if (!ret)
>>             ^^^^
>> I'm pretty sure this was intended to be if (ret) and the ! is a typo.

Hi Dan

You are right, it's a typo. 

Thanks
Patrice

>>
>>> +		return ret;
>>
>> If it's not a typo please write this as:
>>
>> 	if (!ret)
>> 		return 0;
> 
> For the record I consider this a bug report which still needs addressing
> by the authors.
> 
> Best regards,
> Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
