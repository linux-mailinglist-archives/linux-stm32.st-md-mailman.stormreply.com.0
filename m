Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4C57E89
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AAAEC57B78
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:49 +0000 (UTC)
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BAC5C60B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2019 04:54:24 +0000 (UTC)
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,562,1557212400"; d="scan'208";a="34772477"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jun 2019 21:54:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Jun 2019 21:54:21 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 6 Jun 2019 21:54:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MOfrxpcLloTDFR+GlMIfx0ID92W6ANeQcMXQWwoxHY=;
 b=FhFitQfEZPAS/tVmoXbF/KHz478+zK3X65pX/gdNYSTOWN8ea4671SM/VAb9qpVKeBgotefXGdc7fC7hD/tqID6rLApXqndCuviQZjEp9T3IH6HChRsDeBrIM9gtvIg8xJULa5s30wXcr0Ls8PTBzGOjdOxM31RdGm2UW6JSppA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1905.namprd11.prod.outlook.com (10.175.97.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Fri, 7 Jun 2019 04:54:19 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1943.018; Fri, 7 Jun 2019
 04:54:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <ludovic.Barre@st.com>, <marek.vasut@gmail.com>
Thread-Topic: [PATCH] mtd: spi-nor: stm32: remove the driver as it was
 replaced by spi-stm32-qspi.c
Thread-Index: AQHVBLY5V09e/skhoEu+jgD24Fu8MKaP0KoA
Date: Fri, 7 Jun 2019 04:54:19 +0000
Message-ID: <2940804e-2df7-066c-c9da-2e842ec74a04@microchip.com>
References: <1557220598-18531-1-git-send-email-ludovic.Barre@st.com>
In-Reply-To: <1557220598-18531-1-git-send-email-ludovic.Barre@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0230.eurprd07.prod.outlook.com
 (2603:10a6:802:58::33) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.241.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 086421dd-569a-4559-d8c9-08d6eb0432f7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1905; 
x-ms-traffictypediagnostic: BN6PR11MB1905:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB1905AD034E89C817EBDD7B51F0100@BN6PR11MB1905.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(366004)(376002)(396003)(136003)(199004)(189003)(66946007)(71190400001)(66556008)(8676002)(6116002)(486006)(316002)(53546011)(446003)(6246003)(102836004)(99286004)(6436002)(52116002)(36756003)(6512007)(2906002)(54906003)(110136005)(3846002)(6306002)(6486002)(476003)(5660300002)(2616005)(11346002)(186003)(4326008)(81166006)(386003)(71200400001)(305945005)(73956011)(6506007)(4744005)(86362001)(66476007)(76176011)(229853002)(7736002)(31696002)(68736007)(53936002)(31686004)(8936002)(81156014)(7416002)(66066001)(478600001)(256004)(64756008)(25786009)(14444005)(966005)(66446008)(72206003)(14454004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1905;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yrAZQ2rbvTCn3NTYRro74GSl+hcVuUpQiQAEYcJ2EmZgx7SEypl/Axs5f7dNbeoEkGuZFykcE+Z+YtMBF/WZdqQ2teZ3TRiJin0GRMQWwPMIphoXulBQhGxO3kOyDmnAv9R+8OS/8qKxF4A0xRkR7PnWE1FqQjpTByXz2Om30DYtyQlDyI/kM7BfhAxmsShXrLdjz39Z32X9pcARfppzhltdhXXGXuxdNCVi6N2uoeYhEkVyz6OG4c5WW6/+qrLwFcRAF65qBnwuGvf9XYm2y8cY8v1Uk3Oq7a7exPE1nBuQMUIoBGrfy37zuCeRUUWFInm71Qfzxb+VVzeqSJu940xhgN+VJUmOstrB7Ao7OacFlV+7aolf6yDU6xXUnN8q9Vq5edge9SBi7ktanlwZsEEC5uvF/a3z4jHTr+wQjBE=
Content-ID: <F1FDC19070F3C5438494749CC8BEED4D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 086421dd-569a-4559-d8c9-08d6eb0432f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 04:54:19.4570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1905
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: devicetree@vger.kernel.org, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mtd: spi-nor: stm32: remove the driver as
 it was replaced by spi-stm32-qspi.c
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



On 05/07/2019 12:16 PM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> There's a new driver using the SPI memory interface of the
> SPI framework at spi/spi-stm32-qspi.c, which can be used
> together with m25p80.c to replace the functionality of
> this SPI NOR driver.
> 
> The "new" driver uses the same dt properties and not affects
> the legacy compatibility.
> 
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-quadspi.txt      |  43 --
>  drivers/mtd/spi-nor/Kconfig                        |   7 -
>  drivers/mtd/spi-nor/Makefile                       |   1 -
>  drivers/mtd/spi-nor/stm32-quadspi.c                | 720 ---------------------
>  4 files changed, 771 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>  delete mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
