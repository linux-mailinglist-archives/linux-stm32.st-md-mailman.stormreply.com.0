Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F301BE215
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 17:08:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 091BDC36B0D;
	Wed, 29 Apr 2020 15:08:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A617C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 15:08:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TF8PQB004369; Wed, 29 Apr 2020 17:08:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=OrHsueskmIs43EdFBn1E0vUvKJn0/dh6AJ0xQ3uCkUU=;
 b=WU/9l2NUHJH3flwUdt93RKlSOQmpi7VFr8JCg6CpOnWjmxuv0b7ar/GvhNXzDhytHw6O
 bD9La1Beo83P0GFaqGWCOKMbllfsqlZwUQmfQqVEWZOqnGsECGZ5OwE0eKPy8MoiwS8l
 hzEuVg5D9cWA1zgd6h/nGnyOBmZByzpgribLJrtwFUQK+1mCd2wiHhG9nqDvb4XQRwDG
 nd7PUINXfID6uHt30ZPMQWW7a3x6XdTxL6GEsalwwGEaXz3v5V/QXkbaLsC27xc4TJaM
 zH1s/QnOFs7NG/c775sAO6DcdcJqJ7PzUDVQ5Vi6yHZ915hYmedzryzE30fgHiVzuToJ IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq672ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 17:08:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F1E310003A;
 Wed, 29 Apr 2020 17:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3CE062AB39C;
 Wed, 29 Apr 2020 17:08:34 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.45) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 17:08:33 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <bjorn.andersson@linaro.org>,
 <ohad@wizery.com>, <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <219771d3-b0a5-0ec7-7f20-d2055bcb0217@st.com>
Date: Wed, 29 Apr 2020 17:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_07:2020-04-29,
 2020-04-29 signatures=0
Cc: linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 00/12] remoteproc: stm32: Add support
 for synchronising with M4
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

Hi Mathieu,

On 4/24/20 10:24 PM, Mathieu Poirier wrote:
> This patchset needs to be applied on top of this one [1].
> 
> It refactors the STM32 platform code in order to introduce support for
> synchronising with the M4 remote processor that would have been started by
> the boot loader or another entity.
> 
> It carries the same functionatlity as the previeous revision but account
> for changes in the remoteproc core to support synchronisation scenarios.
> Some RB tags have been removed when the content of the patch has strayed 
> too far from the original version. See patch 3, 8, 9 and 12 for more
> details.

I reviewed the series, and made some tests on my side.
FYI, I do not answer to patches when tagged "Reviewed-by: Loic Pallardy" 
and with no extra remark. So consider them as Reviewed-by me but not
necessary to add the tag in commit, Reviewed-by: loic in commit is sufficient. 

Concerning tests, it works find except the crash recovery from a sync start.
But i suppose that you know the limitation, waiting Loic patches[1] update :)

[1]: https://lkml.org/lkml/2020/3/11/403

Thanks a lot for your work!
Arnaud
 

> 
> Tested on ST's mp157c board.
> 
> Thanks,
> Mathieu
> 
> [1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=277049
> [2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877
> 
> Mathieu Poirier (12):
>   remoteproc: stm32: Decouple rproc from memory translation
>   remoteproc: stm32: Request IRQ with platform device
>   remoteproc: stm32: Decouple rproc from DT parsing
>   remoteproc: stm32: Remove memory translation from DT parsing
>   remoteproc: stm32: Parse syscon that will manage M4 synchronisation
>   remoteproc: stm32: Get coprocessor state
>   remoteproc: stm32: Get loaded resource table for synchronisation
>   remoteproc: stm32: Introduce new start ops for synchronisation
>   remoteproc: stm32: Update M4 state in stm32_rproc_stop()
>   remoteproc: stm32: Introduce new parse fw ops for synchronisation
>   remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
>   remoteproc: stm32: Set synchronisation state machine if needed
> 
>  drivers/remoteproc/stm32_rproc.c | 262 ++++++++++++++++++++++++++++---
>  1 file changed, 244 insertions(+), 18 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
