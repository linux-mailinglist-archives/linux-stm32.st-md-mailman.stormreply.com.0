Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6B14A4BC
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 14:18:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1649CC36B0B;
	Mon, 27 Jan 2020 13:18:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41D3CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 13:18:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RDCPuc010457; Mon, 27 Jan 2020 14:17:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=c+hFzAdIS/ZnJvsdSSsIUfuzk1mAp/1PFd89s5h3LUs=;
 b=OZuaUBMTUdGI7IbENiN6ix0An7f95cN1yX6VPzF/5H71q6NR0vgNn46CX122o8lu1dIT
 o9EL3Zu+aZ1LHcyrOP2e+sPqr91A+z24To2NrXL8PYTVpED06cmJZ10h1HwTc4JKTQs8
 4u2uBkZEbjxdFK/w/aq1njYx0RdBgnWNFUSPULviAQq3PO+kAZkAAuLKD18VIXTS32Aw
 Vwf2VBWDPCTW1DxT1VYpar2grQ9O4kP3vJ2IUrGQnTx7HM5z9ts7hTAiESfZQPD0mmD3
 yruC1jf+w8wbzvGob+gD88iUd22IIhsOH/J1cSyimK1roXxMsWErv98AVTxXhF9dqOcl UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdek8vsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 14:17:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24EBE10002A;
 Mon, 27 Jan 2020 14:17:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0F4192AD9F5;
 Mon, 27 Jan 2020 14:17:51 +0100 (CET)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jan
 2020 14:17:50 +0100
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Mon, 27 Jan 2020 14:17:50 +0100
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
Thread-Topic: [PATCH_V3 0/6] thermal: stm32: driver improvements
Thread-Index: AQHVx575+Q0vFMQB1USceV4qSXzFT6f+iFaA
Date: Mon, 27 Jan 2020 13:17:50 +0000
Message-ID: <a400d4e2-4abb-aad8-73f0-57c9300ca351@st.com>
References: <20200110101605.24984-1-p.paillet@st.com>
In-Reply-To: <20200110101605.24984-1-p.paillet@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <F142B21D02B60D49A091256E0AAA3F53@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_02:2020-01-24,
 2020-01-27 signatures=0
Subject: Re: [Linux-stm32] [PATCH_V3 0/6] thermal: stm32: driver improvements
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

The goal of this patchset is to improve and simplify the stm32 thermal
> driver:
> * let the framework handle the trip points: it very is hard to split this patch
> into smaller ones and keep each individual patch functional.
> * fix interrupt management to avoid receiving hundreds of
> interrupts when the temperature is close to the low threshold.
> * improve temperature reading resolution
> * the dirver is backawrd compatible.
>
> Pascal Paillet (6):
> changes in v2:
> * Split "handle multiple trip points" patch to make ones:
> *   rework sensor mode management
> *   disable interrupts at probe
> * "remove hardware irq handler" is squashed in "handle multiple trip points"
kind reminder for review
>    thermal: stm32: fix icifr register name
>    thermal: stm32: rework sensor mode management
>    thermal: stm32: disable interrupts at probe
>    thermal: stm32: handle multiple trip points
>    thermal: stm32: improve temperature computing
>    thermal: stm32: fix low threshold interrupt flood
>
>   drivers/thermal/st/stm_thermal.c | 388 ++++++++++---------------------
>   1 file changed, 120 insertions(+), 268 deletions(-)
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
