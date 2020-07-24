Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C022C57A
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 14:44:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18359C36B27;
	Fri, 24 Jul 2020 12:44:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25399C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 12:44:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OCfn0J011543; Fri, 24 Jul 2020 14:43:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=e4RZeBSLDT1ZW1C3Pxzpzqpy5ibmN8D1Dudn9nLs9/0=;
 b=dzy9WeP5rOnyIa5KM6m9LY/RPgjpTMwIz/czuCpoWfblwMnSnJQLtV6T2xq45hscQW8k
 pfJ79oYnvx6L3nwyfBTOwEa5RDG6ZveH5H++442/nl89AV81qujWHQr8oTLiBNz3K4RJ
 O92v1i8+OqCNz/mURTXq6AiRG7tHidbkwjs7fs63FmMCJFsvJdBcX/qE8v06t8sJ/yK4
 sh79ThnQe5gPOHHc5ij6QYBw5CRxvUscyxgyUXc1usvjHsvBNNjGNnghJsxFUrZonI5c
 XNjUai5yui7iqhbHm9SseG+08ZUUcNi0ayO/y9/TJ1ElBAzI7Xa+Zcv2b1vj4ZDrRsjj Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfq0816-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 14:43:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53CD810002A;
 Fri, 24 Jul 2020 14:43:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 44DD62B4D3C;
 Fri, 24 Jul 2020 14:43:46 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jul
 2020 14:43:45 +0200
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
References: <20200724104711.5474-1-amelie.delaunay@st.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <4c44f596-d2c3-6d2f-bf28-9e3964b6e6f1@st.com>
Date: Fri, 24 Jul 2020 14:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724104711.5474-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_04:2020-07-24,
 2020-07-24 signatures=0
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add USB role switch support to DWC2
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

Series dropped.

On 7/24/20 12:47 PM, Amelie Delaunay wrote:
> When using usb-c connector (but it can also be the case with a micro-b
> connector), iddig, avalid, bvalid, vbusvalid input signals may not be
> connected to the DWC2 OTG controller.
> DWC2 OTG controller features an overriding control of the PHY voltage valid
> and ID input signals.
> So, missing signals can be forced using usb role from usb role switch and
> this override feature.
> 
> This series adds support for usb role switch to dwc2, by using overriding
> control of the PHY voltage valid and ID input signals.
> 
> It has been tested on stm32mp157c-dk2 [1], which has a Type-C connector
> managed by a Type-C port controller, and connected to USB OTG controller.
> 
> [1] https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html
> 
> Amelie Delaunay (3):
>    usb: dwc2: override PHY input signals with usb role switch support
>    dt-bindings: usb: dwc2: add optional usb-role-switch property
>    usb: dwc2: don't use ID/Vbus detection if usb-role-switch on STM32MP15
>      SoCs
> ---
> Changes in v3:
> - Fix build issue reported by kernel test robot in drd.c
> Changes in v2:
> - Previous DT patch already in stm32-next branch so removed from v2 patchset
>    "ARM: dts: stm32: enable usb-role-switch on USB OTG on stm32mp15xx-dkx"
> - DWC2 DT bindings update added
> - Build issue reported by kernel test robot fixed
> - Martin's comments taken into account
> ---
>   .../devicetree/bindings/usb/dwc2.yaml         |   4 +
>   drivers/usb/dwc2/Kconfig                      |   1 +
>   drivers/usb/dwc2/Makefile                     |   2 +-
>   drivers/usb/dwc2/core.h                       |   9 +
>   drivers/usb/dwc2/drd.c                        | 181 ++++++++++++++++++
>   drivers/usb/dwc2/gadget.c                     |   2 +-
>   drivers/usb/dwc2/params.c                     |   4 +-
>   drivers/usb/dwc2/platform.c                   |  15 ++
>   8 files changed, 215 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/usb/dwc2/drd.c
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
