Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5002528E70B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 21:12:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12F98C424B3;
	Wed, 14 Oct 2020 19:12:53 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10BAEC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 19:12:49 +0000 (UTC)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 38C0DC0098;
 Wed, 14 Oct 2020 19:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1602702768; bh=pNp+oRKtpJFt5A5X0gDrLRdOswAHsIIghJhXcuyTBdY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=iFiKRRnfhrVQteridnYVsijfpu+6Ul6PV1me8BfYiPrAnMNBSQ+sHB34UuSlWskv4
 6VNYYbnerPuG8C2Z+FEO17Yc3qEbVAY3LI4ENiGVC1HMhpaBKlWu9ZmAPHuARF7EdP
 TQAFcHSID+Ss/z+hg0UUJAZ1EgrIWcaExJy8zqlAnfK1ZriExfpPANQ5GBk95L9ogx
 OHqEgvbfj3+Re+zlMK7F+pnmk6SmRVqxshNuIE7vtDyUmCj2gbPLarL7/aBDuzHJPM
 feRw9foOQcFK6hDU24nM3xVCvqGaaEs2t1YMMC0MoD7DlRoxzOUb/EP176Q1c3vAc/
 ZaP45iYVPpt0g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 75D3CA0096;
 Wed, 14 Oct 2020 19:12:29 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id B404D40107;
 Wed, 14 Oct 2020 19:12:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=abrodkin@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="EouuL4ix";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCxQ+4hkVcTwcDHys9Un1kQxk1pZXP0Ox6tHbrIS6ilS6IReatYyBTsWTrGUqqPjbIDIvAbNa3LIlHi2iG9Wccl9okmguuuQRg8A3pSPGNn0+FK7E3i75VlpY7NhZtJ3KEwPyrKIsUPrBT2mSim1SFhfZIBLZCnMLF8KJhh+xLUaUxnnL09x21eIxaEw871qSJ3Mt9dTCyNiTBmHV59V4OKPSEK61us8JkOiqr72E6lCgD83bSxlED2Mofbf7x5R1CSCESRtN9LG6RDSYPuh6rn5CTs7aXSHa5iQE6XNORK0FeqeKB2UEEscRMJyuCaaCXV21iPXVBp93XKY6XshAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN3e/ZuCzd92MQejw9kOHfuEy72151UraV3iCDTfNrc=;
 b=WHo44BuvWWJDwqXrwcjnV0toV7OADwjo9iPhdQ/FTiG/dSB8mHKAHpc25koy2dEOfdY8Hz57S3L+NuDnM7USBILN9HE7TjDxKr5rLOXLW94MS7QzUl8ZQJzdIIrILNmdZCDC0HfDRDMjxVeY1Q/I/RT0Lk4oh4cThDKMB8Oc3D3RA+kzUMD7+sWxTc04Bsdvpif+0dLj4AM5cD0WTXarMZiZDRGwSXu5Epd2KoAlAbpZDctACNf7IoseBux2LCprADS3xPyjCOr97Evh43qF4SzA6fkwSAq/o3Nd6XRnKo0wO6ngVH5zMuAwDq1QnDiK0b72zxQvT+FKXY6aHC/Wxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN3e/ZuCzd92MQejw9kOHfuEy72151UraV3iCDTfNrc=;
 b=EouuL4ixiwcYhYKCoYiw8B/IbkJWAIcmmGlT/FBRHDqSbcUh/A9CMIqMzRfkvG0yBav8cmyV9kcQOUut+21ASLGHcv3U4RuKXo1+wXrSf5lSNlZnbgW9661d0y6/augkufNvXUPHSsS0pKux+3dEt1/5i9oGIZ9XhwIstmyO2Ns=
Received: from BN8PR12MB3330.namprd12.prod.outlook.com (2603:10b6:408:43::15)
 by BN8PR12MB3027.namprd12.prod.outlook.com (2603:10b6:408:64::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.27; Wed, 14 Oct
 2020 19:12:19 +0000
Received: from BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::653f:cfaf:d858:a52b]) by BN8PR12MB3330.namprd12.prod.outlook.com
 ([fe80::653f:cfaf:d858:a52b%7]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 19:12:19 +0000
X-SNPS-Relay: synopsys.com
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Paul Cercueil <paul@crapouillou.net>, Serge Semin
 <Sergey.Semin@baikalelectronics.ru>
Thread-Topic: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Thread-Index: AQHWohLONLr1JmaKTE2JNSOSXEmoVqmXcyuAgAADLfw=
Date: Wed, 14 Oct 2020 19:12:19 +0000
Message-ID: <BN8PR12MB33302A8B1549B03CA17A6BDAA1050@BN8PR12MB3330.namprd12.prod.outlook.com>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>,
 <DLG7IQ.15UXZI2H6RYC3@crapouillou.net>
In-Reply-To: <DLG7IQ.15UXZI2H6RYC3@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [188.243.7.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 097bda4a-75a3-40a7-7068-08d870751289
x-ms-traffictypediagnostic: BN8PR12MB3027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB30272E59E915D6BAB6817B91A1050@BN8PR12MB3027.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ukwa6663jm1N3EoiE1UJar0zVnvMKGx5J68OuAGTqoSnsUJaALS1BctfqNNQPhefsEbHpvCYNH2QJD5Gvdw94tH8oji8hVpUVyVq/85EPiiBAJ/YQdCkN35bQYk+sMcnLPXpwTAxys8JLWH6m1wfSD91UjhvoxMQd7o0l+tjnQO7w96oOizjD+woTWtfS7KJCzIsuKeOgmtO0vhGdhai1sDouzjZpgt8gM5AtVNs+iQxsCRvmvTZbeF5U198PxQQ8qbSXFFQc0TviLs+fmb9IzAG8cPo+3vem0OGbb7YiV/21xKB9NQcmPEfr9kUnO5q
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3330.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(64756008)(8676002)(7416002)(478600001)(71200400001)(2906002)(76116006)(8936002)(7696005)(6506007)(91956017)(7406005)(26005)(4326008)(9686003)(558084003)(186003)(66446008)(66476007)(66556008)(66946007)(110136005)(54906003)(33656002)(86362001)(55016002)(316002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: y5OYozHKwhMxtZU9jB9xK1Io3tnB/qL8nVYnvWKcTR7SLSrg6zbLzEx7VGXeb8lVyp/8FZKTQbtgbFlF79T5bFSpRl/cytp7P6G6lN9LiMHZvYjaI/ZmgPKLl3MIge3HVCFEZkqOBxd1TiScYlRayDvIdFcWev7I85EoNWI1nMi8svDIt5h+6RK74NFNltOXzPI5za4S06+wgzbuPL+UFdUmHYWd58u1LvcQb93ouqC1x9DNoxLXMWVOHcDas+Y3+XotJPcEFcMMC9MGTB2VS4+lkYkk+fR3ffy/lAr0/AYOo3qeCr5Nor+3Z/XqP9lb5ooD19zXId47rEd2fUZYkVV8YbmgyIXGjkUNDJmtm5/44KT0wQX5/QyTz8bGma34SOU6kUZnvfwjcyJ9DPm33qvuet8+m4O7PjkVuBrGXT8IOdyc+BrK4JnItgBfGIfxwG9Hd/DPDy8JSEHLRLdMSb/av79agbT01Z21NSKClA3AFqPvCcrFycO7sEpfqxapZgfVrydKe19IL6G34qSMS/fchvfZB6adVp1MzvlI0TcXVqWkWQ7Lii6z3CN0KZqQqgLT3vLIV+zIo4xRE74ayXYD5mFD8O+bzuzDzTB0quXGLqOIxkqeJVMgZ6sUOiGqWKE0JtDE2PcaHdJLfGGLyg==
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3330.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097bda4a-75a3-40a7-7068-08d870751289
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 19:12:19.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMZ+eAPWq5G/hLMTcUL87K0/y4mkdUQBkZw3UOfkrvpHOhGAZIu/7aHHWWdcjMUJrzjMxwBiJ+bHsZf41i4BzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3027
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?iso-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [Linux-stm32] [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes
	name
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

Hi Sergey,

>  arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
>  arch/arc/boot/dts/hsdk.dts                     | 4 ++--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-

For ARC boards

Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
