Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 962A160FB14
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 17:03:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7D44C04003;
	Thu, 27 Oct 2022 15:03:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 054DFC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 15:03:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RE75TP006304;
 Thu, 27 Oct 2022 17:02:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=+ka7b9dqA75ujNAafgwvotrndDQkoRf5EU7I/cGmtu0=;
 b=RndY8IyUXdY2UF7lkIGsiCYvWwPQP1sd5ctg7yFENkaNdillsVPEIXtVrx+h1r6WRsfO
 Y1sb9v8SNHwfweTjQTvVvKLnXX3QCI6Fq+/18yY1dnh2O9SFRL3+PuCfDYc/jEgcu5aN
 bxEpfaHweZPTQZk+4UlSVhly9aU3scoyZo7DYltWGA0ne2ebjZ1HZ+IwfX71wCEGtyjV
 VNh9CWKbJ9vIXzgdfgLm+lwlFUyJJIh2BQuebcn3CB7EUaDPnQapQ8VG382tK2PFGX7k
 TSxoYDdoiD5WlAWS1412ndol/B2InNghxgHY7+v1pcLdf7NQ6wscvfP/5tisw2zG3Aax Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kfufh8c08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 17:02:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 76F08100038;
 Thu, 27 Oct 2022 17:02:44 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71F10229A91;
 Thu, 27 Oct 2022 17:02:44 +0200 (CEST)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 27 Oct
 2022 17:02:43 +0200
Message-ID: <e25bd4c2-c0d1-2884-5bcf-93fe205c06a7@foss.st.com>
Date: Thu, 27 Oct 2022 17:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221017134437.1.I167a5efc1f8777cce14518c6fa38400ac684de3e@changeid>
 <c33c5490-c43d-17d5-f0fb-0b930dd46928@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <c33c5490-c43d-17d5-f0fb-0b930dd46928@linaro.org>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp13: fix compatible for
	BSEC
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

Hi,

On 10/18/22 03:55, Krzysztof Kozlowski wrote:
> On 17/10/2022 07:44, Patrick Delaunay wrote:
>> Use the new compatible for stm32mp13 support.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>> This device tree modification depends on the binding modification
>> introduced by the patch:
>>
>> dt-bindings: nvmem: add new stm32mp13 compatible for stm32-romem
>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid/
> This breaks users of DTS. The patch above did not describe devices as
> compatible and that's the problem sending patches separately, without
> context.
>
> You need to keep compatible.
>
> Best regards,
> Krzysztof

I will sent a V2 patch in a serie with binding change, driver updates 
and explanations.

Regards

Patrick

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
