Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B02B5E1F
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 12:19:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE85EC3FAD7;
	Tue, 17 Nov 2020 11:19:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B89BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 11:19:16 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHBHXoJ001043; Tue, 17 Nov 2020 12:19:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GZWSuUJqGwDbLaWZmRkl5XGWfwsCO0u3h+HK1eIJif4=;
 b=k8TUEXKXAHLSoO1ZZDKDh+kfSQER+eqV084jJlEjAl2oZlAyIYH4iWxPyz7shFzcrU3a
 mwXSmKf35Rme1Ye7CtlhNPEfJhMU7FBmZz5prvBg/YJyzY/cAWv3hnUfJACUqpqHe4EN
 pwIMBVC3MWGc0lMLke5rzF6KDGtflHS93mqrbf31c13dV+zqFKi6ZQAoRTRCM46pCjzI
 fCka4G2M6bN4IYKrGNC8RdWP48TOKag0PYcl61h1ukg0KeV53A/Q+QRhyMIYR0WY0QRb
 Doyj6dvJKK1lTXOYWywdlUQDOFZqT1pSG2ahbdTxKllHY960alcSxNba+KBZynfb+TCj Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5k50t73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 12:19:05 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3538D10002A;
 Tue, 17 Nov 2020 12:19:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18695241A52;
 Tue, 17 Nov 2020 12:19:05 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 12:19:04 +0100
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Rob Herring <robh@kernel.org>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <78fc5bed-d541-e095-e9c8-bf3b29bc173b@st.com>
Date: Tue, 17 Nov 2020 12:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-17,
 2020-11-17 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] ARM: stm32: add DT properties for
 remote proc synchronisation
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

Hi Arnaud

On 10/14/20 2:54 PM, Arnaud Pouliquen wrote:
> This series implements the DT part associated to the commit 9276536f455b3
> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
> 
> Delta vs V1 [1]
> - add Rob acked-by on patch 1/4
> - simplify yaml descriptions and align other syscon descriptions
> 
> [1]https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=339339
> 
> Arnaud Pouliquen (4):
>    dt-bindings: arm: stm32: Add compatible for syscon tamp node
>    dt-bindings: remoteproc: stm32_rproc: update for firmware
>      synchronization
>    dt-bindings: remoteproc: stm32_rproc: update syscon descriptions
>    ARM: dts: stm32: update stm32mp151 for remote proc synchronization
>      support
> 
>   .../bindings/arm/stm32/st,stm32-syscon.yaml   |  1 +
>   .../bindings/remoteproc/st,stm32-rproc.yaml   | 21 +++++++++++++------
>   arch/arm/boot/dts/stm32mp151.dtsi             |  7 +++++++
>   3 files changed, 23 insertions(+), 6 deletions(-)
> 

DT patch applied on stm32-next.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
