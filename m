Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670122056B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2020 08:51:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2819EC36B29;
	Wed, 15 Jul 2020 06:51:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25C1FC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 06:51:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F6FpUX024368; Wed, 15 Jul 2020 08:51:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vbuvzM4B1pzYFNQAdA/xW0KuMdcMV+YHFNrF1pRM0Ao=;
 b=1FdLCpqARMTs+AHaN4/DCuR7Lx+oGxPz/ohUXhAcMQB6ROpr2iG6wpQTmHtwqe3pwH8b
 qf+X8nh6NFFNMBxhv09fRdBKYnVkSf9FVCUT6PTIzRVN2nKUJpfR9reXXDkttml6C73C
 o7qTigMTDaplbFrTpWG42fBYl49TvS60IBDEKG/Lf8muLmGeLR6uL3z2HUZ5PJLX23t/
 3j594oHhZ85fO1a147T4sBjLxApedV1C59s2XCGGUazbLxvxob2gxIxvHWtwu3d2gmWw
 60AwtahQE+HS/2NAS0cFR6dS7/gBgaby+xSAZBD/esQk8m/ILbDjMlEHMn6zG9/hOnz6 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 327bkvbedu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 08:51:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A17610002A;
 Wed, 15 Jul 2020 08:51:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag7node1.st.com [10.75.127.19])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89C3521CA7F;
 Wed, 15 Jul 2020 08:51:15 +0200 (CEST)
Received: from SFHDAG3NODE1.st.com (10.75.127.7) by SFHDAG7NODE1.st.com
 (10.75.127.19) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 08:51:14 +0200
Received: from SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86]) by
 SFHDAG3NODE1.st.com ([fe80::1166:1abb:aad4:5f86%20]) with mapi id
 15.00.1473.003; Wed, 15 Jul 2020 08:51:14 +0200
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, "ohad@wizery.com"
 <ohad@wizery.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Loic PALLARDY <loic.pallardy@st.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [PATCH v6 00/11] remoteproc: stm32: Add support for attaching to
 M4
Thread-Index: AQHWWhoHKFc9kYSe9EGYwzCL4AzvBqkIMyOA
Date: Wed, 15 Jul 2020 06:51:14 +0000
Message-ID: <1cde5c1d5d9047149c93e031c5093492@SFHDAG3NODE1.st.com>
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_02:2020-07-15,
 2020-07-15 signatures=0
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v6 00/11] remoteproc: stm32: Add support
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

Hi Mathieu

> -----Original Message-----
> From: Mathieu Poirier <mathieu.poirier@linaro.org>
> Sent: mardi 14 juillet 2020 22:05
> To: ohad@wizery.com; bjorn.andersson@linaro.org; Loic PALLARDY
> <loic.pallardy@st.com>; Arnaud POULIQUEN <arnaud.pouliquen@st.com>;
> mcoquelin.stm32@gmail.com; Alexandre TORGUE
> <alexandre.torgue@st.com>
> Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> stm32@st-md-mailman.stormreply.com
> Subject: [PATCH v6 00/11] remoteproc: stm32: Add support for attaching to
> M4
> 
> This set applies on top of [1] and refactors the STM32 platform code in order
> to attach to the M4 remote processor when it has been started by the boot
> loader.
> 
> New to V6:
> 1) Removed extra newline in patch 06.
> 2) Re-worked title and changelog of patch 08 to better reflect
>    what is done by the patch.
> 
> Tested on ST's mp157c development board.

I don' t know if you don't see  it on last  version or if you prefer that I review your update first... so for the series

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
> [1].https://patchwork.kernel.org/project/linux-
> remoteproc/list/?series=318275
> 
> Mathieu Poirier (11):
>   remoteproc: stm32: Decouple rproc from memory translation
>   remoteproc: stm32: Request IRQ with platform device
>   remoteproc: stm32: Decouple rproc from DT parsing
>   remoteproc: stm32: Remove memory translation from DT parsing
>   remoteproc: stm32: Parse syscon that will manage M4 synchronisation
>   remoteproc: stm32: Properly set co-processor state when attaching
>   remoteproc: Make function rproc_resource_cleanup() public
>   remoteproc: stm32: Parse memory regions when attaching to M4
>   remoteproc: stm32: Properly handle the resource table when attaching
>   remoteproc: stm32: Introduce new attach() operation
>   remoteproc: stm32: Update M4 state in stm32_rproc_stop()
> 
>  drivers/remoteproc/remoteproc_core.c |   3 +-
>  drivers/remoteproc/stm32_rproc.c     | 214 ++++++++++++++++++++++++--
> -
>  include/linux/remoteproc.h           |   1 +
>  3 files changed, 198 insertions(+), 20 deletions(-)
> 
> --
> 2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
