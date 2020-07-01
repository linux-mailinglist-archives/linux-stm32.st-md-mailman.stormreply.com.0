Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF2210B8E
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jul 2020 15:02:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84140C36B24;
	Wed,  1 Jul 2020 13:02:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1A10C36B22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2020 13:02:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061CsoKU018099; Wed, 1 Jul 2020 15:02:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qDqIDNVMDXBsFhc42TpMkva+hZeSczm/Qp1TCPPpnnM=;
 b=uLaIcqH2HF71zXBGJGF6Fm4CyhZB+9l2WzSyBsPVF/KbZrzc6pxzEHmzhd48Fu767gqB
 1dy5Sl+vGsTvXSEYBO/fwAfXytg5lhMurkHsZfnhB9iPdHgo6pKRkrSS6L1UgKvt7U0X
 7LvYQ/Jz1S//7dFhH6hMezfZowKb9sbbH7VWtylfdhDYFAJSEaukKNvelLMlrs5i6AuH
 ydeQdY6WyoB8DIr1075iAUDbGAizJkgpI7Q3+S6X7nBMdEgb/uf55cGUTbTPXu5NgYtx
 FipqRU+WdYJj5WKq4RblZalvuYkTxIpZ7NUEVIh7a8chZ5Wn/qUwmdt1Q70Hsse4jEgI /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0ga3tw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 15:02:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94A9410002A;
 Wed,  1 Jul 2020 15:02:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C72B2B66E2;
 Wed,  1 Jul 2020 15:02:46 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 15:02:45 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 1 Jul 2020 15:02:45 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Hugues FRUCHET <hugues.fruchet@st.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Thread-Topic: [PATCH v6 0/3] DCMI set minimum cpufreq requirement
Thread-Index: AQHWT6dwxW+BVT2pZ0iRJjHfwS5knqjyjv2A
Date: Wed, 1 Jul 2020 13:02:45 +0000
Message-ID: <52850ead-3e49-7f24-e96b-3f6f293d54fe@st.com>
References: <20200701125918.30793-1-benjamin.gaignard@st.com>
In-Reply-To: <20200701125918.30793-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <8DE9CF046A29B04DBEAD7A88575F79F6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_08:2020-07-01,
 2020-07-01 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 0/3] DCMI set minimum cpufreq
	requirement
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



On 7/1/20 2:59 PM, Benjamin Gaignard wrote:
> This series allow to STM32 camera interface (DCMI) to require a minimum
> frequency to the CPUs before start streaming frames from the sensor.
> The minimum frequency requirement is provided in the devide-tree node.
>
> Setting a minimum frequency for the CPUs is needed to ensure a quick handling
> of the interrupts between two sensor frames and avoid dropping half of them.
Please forget this version, the incoming version 7 should have fix your 
remarks.

Sorry,
Benjamin
> version 6:
> - come back to version 4 and follow Valentin's suggestions about notifier
>
> version 5:
> - add a mutex to protect dcmi_irq_notifier_notify()
> - register notifier a probe time
>
> version 4:
> - simplify irq affinity handling by using only dcmi_irq_notifier_notify()
>
> version 3:
> - add a cpumask field to track boosted CPUs
> - add irq_affinity_notify callback
> - protect cpumask field with a mutex
>
> Benjamin Gaignard (3):
>    dt-bindings: media: stm32-dcmi: Add DCMI min frequency property
>    media: stm32-dcmi: Set minimum cpufreq requirement
>    ARM: dts: stm32: Set DCMI frequency requirement for stm32mp15x
>
>   .../devicetree/bindings/media/st,stm32-dcmi.yaml   |   8 ++
>   arch/arm/boot/dts/stm32mp151.dtsi                  |   1 +
>   drivers/media/platform/stm32/stm32-dcmi.c          | 138 +++++++++++++++++++--
>   3 files changed, 139 insertions(+), 8 deletions(-)
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
