Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9653209D93
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2020 13:34:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68E1EC36B0C;
	Thu, 25 Jun 2020 11:34:56 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12C93C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 11:34:53 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D47D340391;
 Thu, 25 Jun 2020 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593084892; bh=CqEjaOX56SFTAAb+E4RdvnBhS0ifpAx1v7Zdk8b4ZOw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=grmfe+dxEUfewxuT24qgR9KmiQvIWxMgkpMRVPvhMFdaFuHx2Lcs3QINUc3d9skNQ
 YVjPjyOnrKBacTbxScqBfW1Cb24V56XhgmTmEAe+DtHel4fC51mqftR/9g+WthnCfX
 JUZyM0Sg3MpjngmPazdZjRY7LGhMsDKGR/cf8zkyykJRgVYEdfLztM9GcwBfPqZKKL
 5G23HMLRqdHozQ/qkn+N9Sbu7TTZRnQc907YbGa47ihVd9D/Dw82F9mSSeOpraL9F2
 UAJfF8I9Dkv2qK0DCtBZS+Av6WiRsF/BAnfkskjX7Y6XYEVzh2LHvbhlKytNd4JCxy
 xcSPcF/15qcBg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1F659A0057;
 Thu, 25 Jun 2020 11:34:49 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2052.outbound.protection.outlook.com [104.47.38.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6DAD6400F0;
 Thu, 25 Jun 2020 11:34:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="m6U0nKvJ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FykM8LMA8YwR3g85G5tFPSzj44u3/k2pXAU+kJXdLCNoDYKg5SiD4jrJpXikqRuBmeShL33CMtRdwmeiQjMKA7mu0NHqSeMiyowruXFns4wgnKbBckR4oEooFadg3he6amu1UNlTX79NbUvFdDnPaV3p07p/w7fLyg774rVO+bNtBNi8MthuSjX3uSxjTBfCRAllRkLQdQKzwlVqpPAMsU+7z2w0eJt/8D+H5YHT7fwFrGN7bGAV7EsID5cyflN3svcRX0kScJ2OTQatAbMOGZyATPtytpqBKAbESlCO5fCRJ0+v1Umm/UbXSAwZH6ZTjhiMjQLhBFVhG63uFEhMcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqEjaOX56SFTAAb+E4RdvnBhS0ifpAx1v7Zdk8b4ZOw=;
 b=JWXzWSffzpdhVbuiXcO7YQUYhMwcegdbnkysRkDXvu8hbFsU/CGpkYSTX3QZDYjOppaPdkHShAbkzF/qATn+BkjycwCnKQm9+pK3eYeZhwJULWzxGWBAm+FD+jhDsdxce6hSHZ+x/Ad/OavKVdi6ckLn6IpC2NUHFI2x9HaezYvSA+c1ijQlZBPUyWnEvDidVDdN6XqMjrpGb7lPDWHI99QxICLFgGaEFM+dNpSYVH868g84Yth8+fI7B88W0ICYfJ8ajDV8vaxabZNf6+bdeS9Rlva2u+Rsjo5TLwPlrSZqrJtY2rNrEbb0FuQbp+IeXwbriK1KEu3YYQhjEjAkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqEjaOX56SFTAAb+E4RdvnBhS0ifpAx1v7Zdk8b4ZOw=;
 b=m6U0nKvJNBNcXpioXRlYOKWqlrXf4eFv7iU0lri1pd/bD4lDJJj2FoGkLJ2IjSdJ5DMPuNuIIAOWbdOqDYNmQHvA7nFqZGThlU4YD4IQlH5jZXhS89sz8CaCQyzpg7B1XOjW5U55+9fsGIMUFo8RZMpOCFgOfVal7+0hzhttLpE=
Received: from CY4PR12MB1432.namprd12.prod.outlook.com (2603:10b6:903:44::11)
 by CY4PR1201MB0055.namprd12.prod.outlook.com (2603:10b6:910:1b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Thu, 25 Jun
 2020 11:34:45 +0000
Received: from CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd]) by CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd%10]) with mapi id 15.20.3131.020; Thu, 25 Jun
 2020 11:34:45 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@st.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@st.com>
Thread-Topic: [PATCH 0/3] Add USB role switch support to DWC2
Thread-Index: AQHWQ+eB+/PdVadB/EW+WlrQXFio16jpQW6A
Date: Thu, 25 Jun 2020 11:34:44 +0000
Message-ID: <fc3b71e6-90a8-7aae-0131-adb0083dc93d@synopsys.com>
References: <20200616140717.28465-1-amelie.delaunay@st.com>
In-Reply-To: <20200616140717.28465-1-amelie.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58f2362d-3276-4d47-36de-08d818fbc26b
x-ms-traffictypediagnostic: CY4PR1201MB0055:
x-microsoft-antispam-prvs: <CY4PR1201MB0055E306B8FCD93F7B3E3722A7920@CY4PR1201MB0055.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0445A82F82
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C+d/fnnPKyjeWO3IMu5/8+avVw+yvnHwTp5kBHg4wRKwJgk/1p6wl9NvLvm5U3JwcUrRf3Z+k1n8qwxZErDpmb+M+O/y4+OV7AXM9Uv1dy3QFfCBSWYBs6Cn+FJYR8KY2P+t3NCmOFrDypY7ysBTbHbTPK4/xCTnUp2NBgCnkMhU2afVkkEajf7aEtSLS6YPPSdB28oW4IE5s2sVUsiKq3190OZaN7OgtT2FZoVFZsQTbQ95AyWtF1ULwNJWis8KfrNNjm1mU/7hRc82KRlqNvSIIcJXd1eISPtKYneJh+/CpQSPyv/ffxuXq5SntpSe3GzzYRANeukMZYTR0u/fynoXDIy33FW/FEmGWbgcMaEhvBTeQFWPfZQMAagX51VmiDJNPw0qWKuKU6VnHshOr0NsJ6O1lFh1CThDUr4MDbjQY/3rJmYjdDFJxR6+I7aVp0BY2zLALrq7I14G45lQGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1432.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(366004)(346002)(376002)(396003)(6512007)(6506007)(7416002)(66946007)(66476007)(316002)(83380400001)(8936002)(53546011)(4326008)(31686004)(71200400001)(76116006)(186003)(2616005)(2906002)(26005)(54906003)(66556008)(110136005)(86362001)(66446008)(64756008)(5660300002)(91956017)(36756003)(31696002)(478600001)(6486002)(966005)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 1De2RN2U2s6mYmbkvLmxkBFvp1p4geixGCmSx8mo+MbwJkJpRlZW/Nolk9Qb57WY+ecUkFewegEt6PmnMieGQu5ez8DB5U31mwwCx9ngRiSS0hb99uJj8WPssplAKBpZIqdqZR9MGthQtRU2AjKOiu/J138QWPX9BtC/Ktxj8aMFMQ1MqA+H+gNpuudFANnqU7jiWpN/TkAcO3vsCEiRcn8HH9T31l5ihITJiD19s9RDhFCD7vsN1ybnx8YTQDHx8doK8hh1G1lqu7U6jnrpG3vaNe2de1heiA74P3OzZzYQYyaDJLl2WmOS2sN9xC55r9FmD7Vli4CY0fc2UvpG/a+Cq2whUDtRTADucItyVinL/qc/AmUiqqOMlPyZTn5IXtQtAxGmoWSmJHGtptQ6rhKjeC5l0FJmeZ3bFd/zQWJooyDKiAFKVHB36UdCPSfJKfFNHkHFRmXFOnVES4plBs/0k7MjbphZisAyl5RVDqpKf+QKrQtTOopTDGo6mxj3
x-ms-exchange-transport-forked: True
Content-ID: <62BA19D6A1F5B14B87B3F522A29D4891@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1432.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f2362d-3276-4d47-36de-08d818fbc26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2020 11:34:44.9409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W3RC7SIB3S8n5CLqyZ3tGUXNPI0k24TXR9+MU/EnSzywNV/hgElhBYGU1xcE8XyFmaPOuVWiRoOC8gsmnKwPGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/3] Add USB role switch support to DWC2
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

Hi,

On 6/16/2020 6:07 PM, Amelie Delaunay wrote:
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
> [1] https://urldefense.com/v3/__https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html__;!!A4F2R9G_pg!KPU6pLcAMaVrFxzSp3peLkjZzWJzjsc__Kl878UYSLY2Cnv5NMmwACsY4kTCow0$
> 
> Amelie Delaunay (3):
>    usb: dwc2: override PHY input signals with usb role switch support
>    usb: dwc2: don't use ID/Vbus detection if usb-role-switch on STM32MP15
>      SoCs
>    ARM: dts: stm32: enable usb-role-switch on USB OTG on stm32mp15xx-dkx
> 
>   arch/arm/boot/dts/stm32mp15xx-dkx.dtsi |   2 +-
>   drivers/usb/dwc2/Kconfig               |   1 +
>   drivers/usb/dwc2/Makefile              |   2 +-
>   drivers/usb/dwc2/core.h                |   8 ++
>   drivers/usb/dwc2/drd.c                 | 190 +++++++++++++++++++++++++
>   drivers/usb/dwc2/gadget.c              |   2 +-
>   drivers/usb/dwc2/params.c              |   4 +-
>   drivers/usb/dwc2/platform.c            |  13 ++
>   8 files changed, 218 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/usb/dwc2/drd.c
> 
For dwc2:

Acked-by Minas Harutyunyan <hminas@synopsys.com>

Thanks,
Minas
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
