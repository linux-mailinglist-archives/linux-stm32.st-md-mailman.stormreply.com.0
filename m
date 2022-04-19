Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F62F5071F1
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 17:37:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2071FC6049A;
	Tue, 19 Apr 2022 15:37:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04581C6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 15:37:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23JCbNEh019703;
 Tue, 19 Apr 2022 17:37:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MMWQcd7ztdfHPvacGaXnDXQQDw/8sntKbHOtFacicws=;
 b=vVylh44DlkT3N6R9KUMdq7dAwFTjIftmkMCO3nv8tE917dkccLDGEn+FJRfq1pTuyP6C
 sB5kHZizIKqQBVAhejDTBU4fi+kKWqCBCJUHluKcK/Lfg/zn8zmb5xLnG80+mT15DB8F
 W+91vUWuhH0IM81x7FYGaKB12D/cEc2388zX4emxy5txFOkG/Zr8pvesIOdKEQnufyI+
 06MkLL/gLpbBmZw7qQAZ3BJoKmcF1eQQe+7nFOqsfzcEUv0IArkGugWHzie8/87r3IMS
 NIKXavRJlQpm/YBEOVU62N3yNCIzDTA7GXxZjADaB/qpllYUSs6eIBC4x7Rnft94gGaO 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09krnem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 17:37:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D92B410002A;
 Tue, 19 Apr 2022 17:37:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2A48216EFC;
 Tue, 19 Apr 2022 17:37:23 +0200 (CEST)
Received: from [10.48.0.142] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Apr
 2022 17:37:23 +0200
Message-ID: <b7b07e11-6078-ca32-7d3d-188542f28f9d@foss.st.com>
Date: Tue, 19 Apr 2022 17:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Valentin Caron <valentin.caron@foss.st.com>
References: <20220407162042.361956-1-valentin.caron@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20220407162042.361956-1-valentin.caron@foss.st.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_05,2022-04-15_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: add RTC support on
	stm32mp13 boards
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

Hi Valentin

On 4/7/22 18:20, Valentin Caron wrote:
> Add RTC node on stm32mp13 soc.
> Enable RTC on stm32mp135f-dk board.
> 
> Valentin Caron (2):
>    ARM: dts: stm32: add RTC node on stm32mp131
>    ARM: dts: stm32: enable RTC support on stm32mp135f-dk
> 
>   arch/arm/boot/dts/stm32mp131.dtsi    | 15 +++++++++++++++
>   arch/arm/boot/dts/stm32mp135f-dk.dts |  4 ++++
>   2 files changed, 19 insertions(+)
> 

Series applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
