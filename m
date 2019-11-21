Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A12951055D9
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 16:42:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 612EDC36B0B;
	Thu, 21 Nov 2019 15:42:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B3EEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 15:42:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALFXDfl028623; Thu, 21 Nov 2019 16:42:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6K6SA6MxWiPmIb8PZSMO4AouSBUXf9ocbVHakGWmeeY=;
 b=wacSu0WQFKqxN6GiTws8aia0fMfgsNAN5eqHz7JV4imk1QaIph+NOaHYU6xkQZIrfwdp
 avzBuxD+lEUkTR8FkLqM9DgAtlMPioWpPRSN/IYTMU2Nk7RMU3g0eI2Sli78BNegVQue
 k4JqxH9wBoB/8fyLhBrms5IqiM+UUcY5D5I3IYj3RTmHF9eTWmxAYEPhQ8V4Nqx5QeWo
 d3DlpTh2P4pNWFxK2dTl7zcymtSNNauNA8WImglM5o79GL9EqVTN00RhQeAYsuadwiQp
 AF+NNG3BNnKjHqKC/M5X3EkSwsNRM0R/GYAyHu5Akqv1aeU2fXPTlQACs4KWOfvuYMKW fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9upcmgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 16:42:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A23D1100034;
 Thu, 21 Nov 2019 16:42:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DC422C8478;
 Thu, 21 Nov 2019 16:42:18 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 16:42:18 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Thu, 21 Nov 2019 16:42:18 +0100
From: Pascal PAILLET-LME <p.paillet@st.com>
To: "rui.zhang@intel.com" <rui.zhang@intel.com>, "edubezval@gmail.com"
 <edubezval@gmail.com>, "daniel.lezcano@linaro.org"
 <daniel.lezcano@linaro.org>, "amit.kucheria@verdurent.com"
 <amit.kucheria@verdurent.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v2 0/5] thermal: stm32: driver improvements
Thread-Index: AQHVkxQC8UWFfFfMGEiVMCDWvdxpCaeVzZWA
Date: Thu, 21 Nov 2019 15:42:18 +0000
Message-ID: <6e2eeae4-1f2c-c232-73b0-6d1f16f586d6@st.com>
References: <20191104133020.8820-1-p.paillet@st.com>
In-Reply-To: <20191104133020.8820-1-p.paillet@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <FE2D4140B818E344A5C59FF89DA5E9B8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
Subject: Re: [Linux-stm32] [PATCH v2 0/5] thermal: stm32: driver improvements
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


> The goal of this patchset is to improve and simplify the stm32 thermal
> driver:
> * remove hardware interrupt handler that is useless
> * let the framewwork handle the trip points
> * fix interrupt management to avoid receiving hundreds of
> interrupts when the temperature is close to the low threshold.
> * improve temperature reading resolution
gentle reminder !
> Pascal Paillet (5):
>    thermal: stm32: remove hardware irq handler
>    thermal: stm32: fix icifr register name
>    thermal: stm32: handle multiple trip points
>    thermal: stm32: improve temperature resolution
>    thermal: stm32: fix low threshold interrupt flood
>
>   drivers/thermal/st/stm_thermal.c | 367 ++++++++++---------------------
>   1 file changed, 111 insertions(+), 256 deletions(-)
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
