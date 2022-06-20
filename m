Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C27DD551FF8
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Jun 2022 17:12:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79ED4C5E2C6;
	Mon, 20 Jun 2022 15:12:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 553DDC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 15:12:25 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25KEQU7b024436;
 Mon, 20 Jun 2022 17:12:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=5rxaXKrnxGJg+Tuh7+UheAYB9LVA5fqJwlB51AZL1IQ=;
 b=eXd923Q/3qtdj2Ll3aAymendGBBqcWVD4VWvFM6GeiwhgJmIWRQDPFlvuHE+kMUJ1S4g
 XBFp6dysrtVvEuQU2MYdIoDKpNvPPTQiDhIlpgbSOWsymVV2nzNve4zmSeas6ggTKMd2
 fpUyh9UFMp9S/oWZwJ84vco1v1AN8qpbApOqAUvEdnOSAvwuWP+7U1E/lEiVsnYhlyYW
 cduOBJmaRu5UMoIPpLslGo/g5+Q3X29sRGM4HafYpf+WMyMl53j1fE77GiuilCEm3SCx
 ZtGmvC/EiXOzwkOmZzFLPCq05mKDJek6C1StGcVY5v4YQM3MRdWQl1+q8pWhIrbUvioy kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gs71tm62q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 17:12:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9872E10002A;
 Mon, 20 Jun 2022 17:12:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1754422D18A;
 Mon, 20 Jun 2022 17:12:05 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.118) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 17:12:04 +0200
Message-ID: <ab33d6d5-cedf-fb01-77a2-c56e8b6b1b49@foss.st.com>
Date: Mon, 20 Jun 2022 17:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20220613093815.18334-1-alexandre.torgue@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220613093815.18334-1-alexandre.torgue@foss.st.com>
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rcc: stm32: select the
 "secure" path for stm32mp13
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

On 6/13/22 11:38, Alexandre Torgue wrote:
> Like for stm32mp15, when stm32 RCC node is used to interact with a secure
> context (using clock SCMI protocol), a different path has to be used for
> yaml verification.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> ---
> 
> Hi Rob, Krzysztof,
> 
> If you agree with this patch, I'll apply it directly in my STM32 tree.
> 
> Thanks
> Alex
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> index f8c474227807..242fe922b035 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> @@ -78,6 +78,7 @@ if:
>         contains:
>           enum:
>             - st,stm32mp1-rcc-secure
> +          - st,stm32mp13-rcc
>   then:
>     properties:
>       clocks:

Applied on stm32-next.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
