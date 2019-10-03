Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E1C9BB4
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2019 12:08:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24A41C36B0B;
	Thu,  3 Oct 2019 10:08:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42BAFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 10:08:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x93A2vsa020834; Thu, 3 Oct 2019 12:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=aOluPCF6ESczZ7lBj75ysirYywqU6TpjFJ3pKXx14HA=;
 b=tWLZ2rCpdbtQMBUgXGvr/BC7PDLIdTDZcXKZvrsSlLQ+QdRLZewXN7uj6MTgO+2VeCeh
 GX4lh9VcZmScLP2p2lmbpdVH4Gxtb1yWC5IVj/0JYA0BgcKqXxnL9PRXoYHf2E3rUqzX
 /6Le48HXrwFWbeOIsMy8NUU+TCLl/Zl8CBLtK1iQ+UoU+Fi+QjPp1cvYAe4I5UP1xzLj
 39bQW4u6cYieeCSTSDvHk0T7Hklv2O5jROxhLy+QZZowsAzf1zJ07Gp0BqkW6EmDUBW9
 gs3nQ9Dfat/5SFN3quriPKhjEZHsmLL8JKmV+UAqbeVJINAh/9dn6s2GYPmJNdIl39EQ lA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2v9xdh3kq6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 12:08:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 27E3822;
 Thu,  3 Oct 2019 10:08:07 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC98B2B00F7;
 Thu,  3 Oct 2019 12:08:06 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct
 2019 12:08:06 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Thu, 3 Oct 2019 12:08:06 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net"
 <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
Thread-Topic: [PATCH v3 0/5] stm32-ddr-pmu driver creation
Thread-Index: AQHVXOk+As8mb1s6+UKuO5XjiYJqiadI6qNQ
Date: Thu, 3 Oct 2019 10:08:06 +0000
Message-ID: <013321ff60ae44da892d806fbd3024d4@SFHDAG5NODE1.st.com>
References: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
In-Reply-To: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_04:2019-10-01,2019-10-03 signatures=0
Subject: Re: [Linux-stm32] [PATCH v3 0/5] stm32-ddr-pmu driver creation
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Dear all

Gentle reminder for this review.

Thanks in advance !

G=E9rald

> From: Gerald BAEZA <gerald.baeza@st.com>
> =

> The DDRPERFM is the DDR Performance Monitor embedded in STM32MP1
> SOC.
> =

> This series adds support for the DDRPERFM via a new stm32-ddr-pmu driver,
> registered into the perf framework.
> =

> This driver is inspired from arch/arm/mm/cache-l2x0-pmu.c
> =

> ---
> Changes from v1:
> - add 'resets' description (bindings) and using (driver). Thanks Rob.
> - rebase on 5.2-rc1 (that includes the ddrperfm clock control patch).
> =

> Changes from v2:
> - rebase on 5.3-rc6 that has to be completed with
>   'perf tools: fix alignment trap in perf stat': mandatory.
>   'Documentation: add link to stm32mp157 docs': referenced from this seri=
es.
> - take into account all remarks from Mark Rutland: thanks for your time!
>   https://lkml.org/lkml/2019/6/26/388
> - fix for event type filtering in stm32_ddr_pmu_event_init()
> =

> Gerald Baeza (5):
>   Documentation: perf: stm32: ddrperfm support
>   dt-bindings: perf: stm32: ddrperfm support
>   perf: stm32: ddrperfm driver creation
>   ARM: configs: enable STM32_DDR_PMU
>   ARM: dts: stm32: add ddrperfm on stm32mp157c
> =

>  .../devicetree/bindings/perf/stm32-ddr-pmu.txt     |  16 +
>  Documentation/perf/stm32-ddr-pmu.txt               |  37 ++
>  arch/arm/boot/dts/stm32mp157c.dtsi                 |   8 +
>  arch/arm/configs/multi_v7_defconfig                |   1 +
>  drivers/perf/Kconfig                               |   6 +
>  drivers/perf/Makefile                              |   1 +
>  drivers/perf/stm32_ddr_pmu.c                       | 426 +++++++++++++++=
++++++
>  7 files changed, 495 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/stm32-ddr-
> pmu.txt
>  create mode 100644 Documentation/perf/stm32-ddr-pmu.txt
>  create mode 100644 drivers/perf/stm32_ddr_pmu.c
> =

> --
> 2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
