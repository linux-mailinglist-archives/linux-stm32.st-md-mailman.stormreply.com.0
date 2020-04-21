Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB21B2142
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 10:17:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FBBCC36B0C;
	Tue, 21 Apr 2020 08:17:08 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30088.outbound.protection.outlook.com [40.107.3.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75EDBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv2cPQm7xH+KZ+EotFKKCWV9YAf81JfV2itsl+KgvyM=;
 b=FcAn67wK1Dt5zectlDP7f24o+nGgDk2Xef3+kdB1ihgsHvpfx32/KSD5kJqDBZlcYBwNWX6rKyB9zuZDlXwuxXDdLu8urey2kysyl8bYL5d1LwUeuZswkCGhoSWGYlqIG9RIUeDyaug0y3iV+sxnmLE+PjDa/xmtoMwcTpkoysc=
Received: from AM6P192CA0069.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::46)
 by DB6PR0801MB1637.eurprd08.prod.outlook.com (2603:10a6:4:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Tue, 21 Apr
 2020 08:17:00 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::d3) by AM6P192CA0069.outlook.office365.com
 (2603:10a6:209:82::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 08:17:00 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; st-md-mailman.stormreply.com; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;st-md-mailman.stormreply.com;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Tue, 21 Apr 2020 08:16:59 +0000
Received: ("Tessian outbound 3a3e6dcbad0e:v53");
 Tue, 21 Apr 2020 08:16:57 +0000
X-CR-MTA-TID: 64aa7808
Received: from c473cb8e1070.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F2A79AA-FCDC-4567-836C-979C2DD3AD75.1; 
 Tue, 21 Apr 2020 08:16:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c473cb8e1070.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Apr 2020 08:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ID3X4ixCak+CD7BfX9fYWdPZOeDaOc7Jv8OUmRofedRDDM5wxM8ApFTid1S4MMMrRcsDcsbmb3XruSonp4gHVvTi9PoGv3kXegUuhf/aFeuEYbCgrW0JUYjiE4oLDJozoWn0pUFkJIimIsxkyrNPwUMS1jS4D7OHLvCPv2hlRvXE0XMjg/sWJLN1Xl+brmAFbVr6mcF7uh4yBlbefYSfphSR4uC2O1NX35z6sVPoZiRbSBEgXTgG6m5bA39cUCJqdyHQfNuLVOPTI07tm6dxqfMkArkTK+ESOOdOLeAZvIJfjQQA7p5iJJhjHaamSz9WWLLgUhHHFk6yu8vgNdG9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv2cPQm7xH+KZ+EotFKKCWV9YAf81JfV2itsl+KgvyM=;
 b=LiqdAGp3SP6W/wCG1EtiXOJiiqRAhEIRg2QSffBayUH/EMZHZKj+CiGK9gaIHxza9oB1y3M0IFiDMiXQj6M2rU9Vf0jcFAMM4MuohwgyhWImOnecSWqMqPigsB4On4qzrylXav55YjOizeXR5l8Us47h2BctKG3hISboBB1RBgrP5NaeXcR0RjMOsm8NZN1zktVVnnSupo4mJ9TMdQAmUMyk0+mSYU1GbislxvzCNxIH5XEtCXaPQ6kmnKyA0Ur/DW6cIt+voXM/nhO97TPea8UXO3Ywpjr+mLp9EZR8l7ye+2QT8Whq4cXuCyilUNth0SEwfz4UixuwLHZd/1p3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jv2cPQm7xH+KZ+EotFKKCWV9YAf81JfV2itsl+KgvyM=;
 b=FcAn67wK1Dt5zectlDP7f24o+nGgDk2Xef3+kdB1ihgsHvpfx32/KSD5kJqDBZlcYBwNWX6rKyB9zuZDlXwuxXDdLu8urey2kysyl8bYL5d1LwUeuZswkCGhoSWGYlqIG9RIUeDyaug0y3iV+sxnmLE+PjDa/xmtoMwcTpkoysc=
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com (2603:10a6:4:a0::12)
 by DB6PR0802MB2438.eurprd08.prod.outlook.com (2603:10a6:4:a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 08:16:49 +0000
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117]) by DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117%8]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 08:16:49 +0000
From: Hadar Gat <Hadar.Gat@arm.com>
To: Rob Herring <robh@kernel.org>
Thread-Topic: [PATCH] of_device: removed #include that caused a recursion in
 included headers
Thread-Index: AQHWEZiY+abZp/0PVkOqsiba5LEPaqiCg6GAgAC++lA=
Date: Tue, 21 Apr 2020 08:16:48 +0000
Message-ID: <DB6PR0802MB2533545239D9A51DC529F241E9D50@DB6PR0802MB2533.eurprd08.prod.outlook.com>
References: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
 <20200420203647.GA23189@bogus>
In-Reply-To: <20200420203647.GA23189@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 9a0da84f-3d62-4600-86ab-07dcd4a991da.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
x-originating-ip: [84.109.179.203]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 202472ce-1b1f-4f4b-1e3c-08d7e5cc5d77
x-ms-traffictypediagnostic: DB6PR0802MB2438:|DB6PR0802MB2438:|DB6PR0801MB1637:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB16373C418293992922413F09E9D50@DB6PR0801MB1637.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 038002787A
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0802MB2533.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(7416002)(7366002)(81156014)(6916009)(86362001)(7406005)(76116006)(2906002)(8676002)(8936002)(186003)(33656002)(4326008)(478600001)(71200400001)(66946007)(6506007)(26005)(54906003)(7696005)(316002)(66446008)(64756008)(66556008)(66476007)(5660300002)(52536014)(9686003)(55016002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1vi2oe8bj4TtbAYqnunSAAlFl5kY/+nhuGxMZFk+jPEGxchcUVbVRrQS7iIkaWRpL+OR71ZPCgyKUXiV//WriqboJueXVjacj/+2tKjlzs3mvznHNu9i1m1cc/vobc2lwyBreoPqu+xDYRQbutz09sCB8+rrb0pvHtXPdWo29aJthiXqZzXtAW9Sk75MSQuDXpFOmqlFxwSVMzVjQlLiFOnbvmjCZGe8aWRfSwQ3NaFoy6mcP13ZHqS99mExEdCk+GjkyqMyEWdgdUtoIY3dnh+RgYaWk7ZbDYchePh1IX0zMVID1LocPipNGljTbNtq2sUXR1xSU+tQZwvmFy9Nxd9x4cwGjVsrE6wArvIB2Q6lwUMiWNBPi6/a7xfw2rcojHyk1SHRHCCABbhj1rfy4OcCx3M31ksg5qG7tiwBlmM15n+jNWkbObmEr67F/l4g
x-ms-exchange-antispam-messagedata: It7fEWIhcyCA8ZERRU1O40KTe+7UKv14dghrMOFOhIusVL4DzkGQlupZq08vqBVlKmSeVEuHN9raviiWA4C4EqIOmt0TDUKwqEIUg4ZxwxdaBAwiu32G8FqKzxwKnV3lQzhceIuDPfIDxdf46AxnGA==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2438
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(46966005)(81156014)(8676002)(5660300002)(478600001)(356005)(8936002)(54906003)(36906005)(316002)(6506007)(2906002)(7696005)(52536014)(82740400003)(9686003)(47076004)(55016002)(4326008)(33656002)(6862004)(86362001)(26005)(81166007)(336012)(70206006)(186003)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0c4cf79d-e522-47e4-0483-08d7e5cc56eb
X-Forefront-PRVS: 038002787A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J7Pb0zylx6XYeLpPOi/EnHE+FN4adVcVfdaLIwUHvpC2OWh/xJktjgRrGw+nzlpcAtvGMpr/pk/kKjtMSMcG+uoa5eha/kWUBvGzTjRvXOeQ5nJjb2uerhxrD35wzM735DQpZZ7V+fp0fDHHn3rFj0ZQpKC6P46zR7Kx/4EjgEIStRWvNhw8TUlED0w19BHeGIxKh6EkDNzgxZSO1JmleLDu5f/x0AEfgkcWtfvhHcMnI0uIC4jEHbavIiTlQVsm7wwjmtNtFAjTKuwcw23ivtqOFgyPhZl4l8AclSEBu+dj51fsrUux0yXr+Fp2KlD2YlaetbdOfedQmEQSq+jItofuqlujcGEOA0PVVLyK+vS22Bm8pG4jJdX15USE2OpRthGMv6fKoKkTVB+znPw5vuGNLUjm/LgMX/21wOXLFnUvtUNFytM3PB5xUvPVcbOjGihhKeCiC2RfxN26361kpizN/eyP2E0Do3pUSbt5fojoGAe1N+w8xHrAA5J1598Aiw0JLgC7MneWYFrJmwIsXQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 08:16:59.9130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202472ce-1b1f-4f4b-1e3c-08d7e5cc5d77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1637
Cc: Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?utf-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, nd <nd@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ofir Drang <Ofir.Drang@arm.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 JC Kuo <jckuo@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kukjin Kim <kgene@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <Sudeep.Holla@arm.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] of_device: removed #include that caused a
 recursion in included headers
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


> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, 20 April 2020 23:37
> 
> On Mon, Apr 13, 2020 at 04:35:53PM +0300, Hadar Gat wrote:
> > Both of_platform.h and of_device.h were included each other.
> > In of_device.h, removed unneeded #include to of_platform.h and added
> > include to of_platform.h in the files that needs it.
> 
> Guess we forgot about that temporary comment!
> 
> Both of these headers have a lot of things we don't want 'normal'
> drivers calling. The most common thing needed from of_device.h is
> of_match_device/of_device_get_match_data. A good number are only for
> ibmebus. Maybe the header should be split or the former just moved to of.h.
> 
> For of_platform.h, it seems we have a bunch of unneeded includes:
> 
> $ git grep 'of_platform\.h' drivers/ | wc
>     560    1120   36049
> $ git grep -E 'of_(platform_(pop|def)|find_device)' drivers/ | wc
>     248    1215   20630
> 
> Would nice to drop those (or switch to of_device.h?) too.
> 
> Be sure to build on Sparc. It's the oddball.

Hi Rob and thanks for your inputs.
Unfortunately I cannot continue to work on this patch at the moment since it is not as small as I expected and I have limited resources for that.
So anyone can take it and continue from here.
Thanks,
Hadar

> > Signed-off-by: Hadar Gat <hadar.gat@arm.com>
> > ---
> >  drivers/base/platform.c                           | 1 +
> >  drivers/bus/vexpress-config.c                     | 1 +
> >  drivers/dma/at_hdmac.c                            | 1 +
> >  drivers/dma/stm32-dmamux.c                        | 1 +
> >  drivers/dma/ti/dma-crossbar.c                     | 1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 1 +
> >  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 1 +
> >  drivers/gpu/drm/msm/msm_drv.c                     | 1 +
> >  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 1 +
> >  drivers/gpu/drm/sun4i/sun4i_tcon.c                | 1 +
> >  drivers/iio/adc/stm32-adc-core.c                  | 1 +
> >  drivers/iio/adc/stm32-dfsdm-adc.c                 | 1 +
> >  drivers/iio/adc/stm32-dfsdm-core.c                | 1 +
> >  drivers/iommu/tegra-smmu.c                        | 1 +
> >  drivers/memory/atmel-ebi.c                        | 1 +
> >  drivers/mfd/palmas.c                              | 1 +
> >  drivers/mfd/ssbi.c                                | 1 +
> >  drivers/mtd/nand/raw/omap2.c                      | 1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
> >  drivers/net/ethernet/ti/cpsw.c                    | 1 +
> >  drivers/phy/tegra/xusb.c                          | 1 +
> >  drivers/pinctrl/nomadik/pinctrl-nomadik.c         | 1 +
> >  drivers/soc/samsung/exynos-pmu.c                  | 1 +
> >  drivers/soc/sunxi/sunxi_sram.c                    | 1 +
> >  include/linux/of_device.h                         | 2 --
> >  lib/genalloc.c                                    | 1 +
> >  26 files changed, 25 insertions(+), 2 deletions(-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
