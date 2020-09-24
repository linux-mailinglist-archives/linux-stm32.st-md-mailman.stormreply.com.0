Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F04C02770F6
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Sep 2020 14:28:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC6A0C3FADE;
	Thu, 24 Sep 2020 12:28:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BB9BC3FAD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 12:27:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08OCQnBU001967; Thu, 24 Sep 2020 14:27:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=v0+6la6mEAINSXjq/A8KgH4UYDVPzmj5JSfbyrt53hA=;
 b=O5hwpsJvzgYiLk6XjufBBovUYZIM5PoEPh5nfl5+2PBmfKot2i4e4OEA23gbrxEXOXWL
 d6tZkkpfA6+oMyRHQ7VI564W+W/adQJ0XZfROGtSzvSXvMVYcLoTBJ3+awUbG7MKAeiC
 aUpkQPHsxhyS2sy2xWsIlcw0lRBVqMVoNcYOYZpjhVA15l4cF5ZKNuLpeehxZ8uAWgnI
 16bsjRjUjavO+LdPb9oeZa8O3l3MOOS0yD+xWNwqZkiTUmViwL8Y2pR2P6cwPWRq+Qi4
 E4aVvbeBQQ6EOLJqe5Xpj3unU+15xWUhcjb+zKxIfhRCm8/B+u6MEo74JaoIuef9n8Ff PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n7f03tgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 14:27:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A158E10002A;
 Thu, 24 Sep 2020 14:27:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BABC2AD2BE;
 Thu, 24 Sep 2020 14:27:48 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Sep
 2020 14:27:47 +0200
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200909093511.4728-1-amelie.delaunay@st.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <542ec140-fd49-04a1-bc66-e473858caa67@st.com>
Date: Thu, 24 Sep 2020 14:27:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909093511.4728-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_08:2020-09-24,
 2020-09-24 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v6 0/3] Add USB role switch support to DWC2
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

Gentle reminder on the whole series instead.

Thanks,
Amelie

On 9/9/20 11:35 AM, Amelie DELAUNAY wrote:
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
>    dt-bindings: usb: dwc2: add optional usb-role-switch property
>    usb: dwc2: override PHY input signals with usb role switch support
>    usb: dwc2: don't use ID/Vbus detection if usb-role-switch on STM32MP15
>      SoCs
> ---
> Changes in v6:
> - Select USB_ROLE_SWITCH if USB_DWC2, and not only if USB_DWC2_DUAL_ROLE:
>    drd.c is built whatever DWC2 mode (DUAL, HOST, PERIPHERAL) as it is used also
>    to detect attach/detach (so a-valid/b-valid sessions).
> Changes in v5:
> - Use device_property_read_bool instead of of_read_property_bool in params.c
> Changes in v4:
> - Simplify call to dwc2_force_mode in drd.c
> - Add error_drd label in probe error path in platform.c
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
>   drivers/usb/dwc2/drd.c                        | 180 ++++++++++++++++++
>   drivers/usb/dwc2/gadget.c                     |   2 +-
>   drivers/usb/dwc2/params.c                     |   2 +-
>   drivers/usb/dwc2/platform.c                   |  20 +-
>   8 files changed, 215 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/usb/dwc2/drd.c
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
