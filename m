Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F7662AB8
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 17:02:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 133F6C69048;
	Mon,  9 Jan 2023 16:02:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDA80C03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 16:02:26 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309BUSOH003298; Mon, 9 Jan 2023 17:02:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Jt+8u7dc7kaoHRVclJ4gTOkOj2blFmusjgWq7LjVRrc=;
 b=6eZORvo4lw///FcMSYj4Ln6zwTf4V0NdkPNkTC2Mxs2sfnMU50VmLapBkp2bv+V8Qjr3
 N3TpQVRCcgx5z0ntc0G4MZcBVqEkOhUkf6W1XUx75gs0y0oFkJOqF1eBXbRA9/Mp6eR1
 d2m7VgFpN5UgLR6XwdfTItj6hvNG7P3UaFfjwcxMSHQlDPseCZILJxFKwfOVA3ei7ThL
 r5R8zn/DTP6uU3XSFcbWRm55RmCvmieUrGls33uC1GL1qL5cElfjsUzOOZ3wdbzbbM/W
 IcKfgG8UUjDOHiC+uhOXz4dL4USqmIxdykSdgzMu5qYrtJge5c1V9+ls512OAiHeniTW zA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3my0gnvbhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 17:02:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE11610002A;
 Mon,  9 Jan 2023 17:02:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7A812243E9;
 Mon,  9 Jan 2023 17:02:14 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 9 Jan
 2023 17:02:14 +0100
Message-ID: <dd823016-f419-f801-6da5-3fdfc9bd758b@foss.st.com>
Date: Mon, 9 Jan 2023 17:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Olivier Moysan <olivier.moysan@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20221205121602.17187-1-olivier.moysan@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20221205121602.17187-1-olivier.moysan@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_09,2023-01-09_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] ASoC: stm32: update sound card on
	stm32mp15xx-dkx
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

Hi Olivier

On 12/5/22 13:16, Olivier Moysan wrote:
> This patchset introduces the following changes on STMP32MP15 DK boards
> sound card:
> - Rename the sound card to ease SOC diversity management
> - Cleanup of useless clock property in SAI2A node
> 
> Olivier Moysan (2):
>    ARM: dts: stm32: remove sai kernel clock on stm32mp15xx-dkx
>    ARM: dts: rename sound card on stm32mp15xx-dkx
> 
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 

Applied on stm32-fixes.

Regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
