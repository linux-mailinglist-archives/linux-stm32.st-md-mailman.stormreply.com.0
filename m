Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E211921A4E3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jul 2020 18:33:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C260DC36B2B;
	Thu,  9 Jul 2020 16:33:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE015C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2020 16:33:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069GSsaH001240; Thu, 9 Jul 2020 18:33:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=p3WUOE1BFwyOWMLXIbNJG7i4gfk1IMbX9+3yZTZGgc0=;
 b=hqw4zfkPmSiAVjOKbFFXR17hj+FvjIVnsf2E+u1VCnJYTA6OnmCdgZwKUfsheROFR2Hx
 qYcNAOeoZFM9+ZZDyZtQb1FPYscHfRkQPmvzWx4xGetXakawhMyG8Ur3AgycMA7cGmnA
 bv94kxjz4a7W3M9FngTcznB9i4t5WZzfa2qUfy2ZdtcobyTM9CHIT5GcompPoMDFXAAA
 6b7aBGykp3mw73mZOiJkv7s2Q5+jdYIPSD/j+T1KwvCVyUIZ8mBaNdhmga87SQHiDcKe
 XM6He93AZZ16Vfi+uibfAkV3IUmf1PIvPEjjkyoXUDSvts2dvtFaIUW9W0A/fYo96YHL FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 325k4cx04y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 18:33:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E3DE10002A;
 Thu,  9 Jul 2020 18:33:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 51A5C2CA1F8;
 Thu,  9 Jul 2020 18:33:27 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 18:33:26 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "ohad@wizery.com"
 <ohad@wizery.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Loic PALLARDY <loic.pallardy@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200707213112.928383-1-mathieu.poirier@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <9d54383c-d653-cddf-7746-21f1001122ea@st.com>
Date: Thu, 9 Jul 2020 18:33:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707213112.928383-1-mathieu.poirier@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_08:2020-07-09,
 2020-07-09 signatures=0
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v5 00/11] remoteproc: stm32: Add support
 for attaching to M4
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



On 7/7/20 11:31 PM, Mathieu Poirier wrote:
> This set applies on top of [1] and refactors the STM32 platform code in
> order to attach to the M4 remote processor when it has been started by the
> boot loader.
> 
> New to V5:
> 1) Added Bjorn's reviewed-by to patch 06.
> 2) Removed Loic's reviewed-by from patch 08, it has changed too much.
> 
> Patches that need to be reviewed: 7, 8, 9 and 10.
> 
> Tested on ST's mp157c development board.
> 
> Thanks,
> Mathieu
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=314523
> 
> Mathieu Poirier (11):
>   remoteproc: stm32: Decouple rproc from memory translation
>   remoteproc: stm32: Request IRQ with platform device
>   remoteproc: stm32: Decouple rproc from DT parsing
>   remoteproc: stm32: Remove memory translation from DT parsing
>   remoteproc: stm32: Parse syscon that will manage M4 synchronisation
>   remoteproc: stm32: Properly set co-processor state when attaching
>   remoteproc: Make function rproc_resource_cleanup() public
>   remoteproc: stm32: Split function stm32_rproc_parse_fw()
>   remoteproc: stm32: Properly handle the resource table when attaching
>   remoteproc: stm32: Introduce new attach() operation
>   remoteproc: stm32: Update M4 state in stm32_rproc_stop()
> 
>  drivers/remoteproc/remoteproc_core.c |   3 +-
>  drivers/remoteproc/stm32_rproc.c     | 214 ++++++++++++++++++++++++---
>  include/linux/remoteproc.h           |   1 +
>  3 files changed, 198 insertions(+), 20 deletions(-)
> 

I tested the series with the [1] 
Minor remarks on patch 6 & 8. After fixing them, for the series:

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thank you very much for your work on this feature.

Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
