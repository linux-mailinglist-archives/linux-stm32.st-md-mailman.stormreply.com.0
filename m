Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E56FA3C
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 09:23:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A680CC14FA;
	Mon, 22 Jul 2019 07:23:31 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4231CC14F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 07:23:29 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
 [10.13.135.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9A2C3C015E;
 Mon, 22 Jul 2019 07:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563780208; bh=ZDI13eRLks5BhdqdBMUPilHlm2dHvKCGDWuFYoI5+kI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=WdEYAW8yFCqa52V5gkcGraoqvr0HYJy59fUAOVxX6fesqtHac3EPUB6VCQ29Fo/8z
 hQNkCzgxPo67bYW5AEMZ+bqPJJvq/B1s56sw8XUALA1t14zBSlNlMURIcr0hQkwe4J
 rvXy46jlLuy4sDvgEKURVlkCAZU2iiZPfjDjz7YpSvhrnp4FwVnMB5PJx5GkPoVDh7
 8k4dGbMmk9LKPZxH6zQytfKHsaX3RWWi4BCuX3up6u9IDDh4TgqquhDG03d0vpT//V
 XnzYWlppwK99Ay29xbQRMRzG2MP6cV6i4bQcpYYfkWx2l1eNJ0eUo6XouHn7p1F7xt
 LYm2+JGpSsEoA==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D733CA00CE;
 Mon, 22 Jul 2019 07:23:20 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 22 Jul 2019 00:23:11 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 22 Jul 2019 00:23:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqOYpwj8Qj5fwp8U4Qi2rKs/z2Z2m4wZedefMLt1fcA8sXPacM2fc9ZdubrkVv3k3vzYb+FGvOG6a/RgnHcthXYYbPIMo3mCNQKdjGpfj/tfk1ivpbw9tDGDNx8hIbvTmZn/70WLVD0eUIZSp+K/3UYyhgTTV0o1p13p937JeSNE86LVTmam1bztT7BHOkMCRJIBu666Jtmmt/b1OPjGWxWWvYRrxUlGPv7JsBEBKkVVoVJvSRQHdwDQJFHhyqWbB75TudhclzIPRVQxO/fpdPAw5NssLHFEH9TXYwF0iZYR90Q8u/3sZZvpuneaRcW7lZs3wfL+DmFjpa8bn2KK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDI13eRLks5BhdqdBMUPilHlm2dHvKCGDWuFYoI5+kI=;
 b=TuueUv5EpHoCYhpdiyOEl4ZTAAbRlJ8XYjUwhw89epDWHTu5JJJe/TNuP2p/ToNIHfS/ZWp1L+268KOy7Xq3tRN6pXkblgo7DM5KEfsZfAIwuhbKv93MDkHTy7H+fbs3+GJrkvm1ariJlaqw9BUXLrBRhVqDD5RmHbKcvZrvnEe8r9Yzi+Ia9kwFUXxhjfL5UfdB5PV6+iCUNbH+IgJjrBMIVO6kHzF0adcmqgrWgeCmUJz7wXVkKzWwVRwNzwSPFR7FY4l0/RouEJte1Qwj40wDV9zY+e41gAtoQNkoJIW7P4pSIj3XVYd7tZ/lfjYp4RuFY2rdefHzcU0TbQKl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDI13eRLks5BhdqdBMUPilHlm2dHvKCGDWuFYoI5+kI=;
 b=uw6JUkIurOIkbZRUMX03yDqilJalguCOhTAi4paXUCOZ2eUUGc2rrlNLJpquEZhRzgpT3rgIz5NzZbzMAUAFll7DG+q64wUJeeyYIWx+BHaIZOVKvEy5bE2ALNJdYNMaMwm/SXQIJrg4g5xKTG38cAOlL232SzTlo0Rn2ACV2ng=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.66.159) by
 BN8PR12MB3347.namprd12.prod.outlook.com (20.178.210.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Mon, 22 Jul 2019 07:23:09 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::61ef:5598:59e0:fc9d]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::61ef:5598:59e0:fc9d%5]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 07:23:09 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Jon Hunter <jonathanh@nvidia.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Thread-Index: AQHVMYtq2Zx4WVoG/U2kL8GCK0bP/abPQEOAgADTx+CAABvLAIABeX5ggAAOFICAAAG4AIAAAXQAgAAaB/CAACO4AIAAAIsAgAAR0ACABE5q0A==
Date: Mon, 22 Jul 2019 07:23:08 +0000
Message-ID: <BN8PR12MB32665C1A106D3DCBF89CEA54D3C40@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <29dcc161-f7c8-026e-c3cc-5adb04df128c@nvidia.com>
 <BN8PR12MB32661E919A8DEBC7095BAA12D3C80@BN8PR12MB3266.namprd12.prod.outlook.com>
 <6a6bac84-1d29-2740-1636-d3adb26b6bcc@nvidia.com>
 <BN8PR12MB3266960A104A7CDBB4E59192D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <bc9ab3c5-b1b9-26d4-7b73-01474328eafa@nvidia.com>
 <BN8PR12MB3266989D15E017A789E14282D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <4db855e4-1d59-d30b-154c-e7a2aa1c9047@nvidia.com>
 <BN8PR12MB3266FD9CF18691EDEF05A4B8D3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <64e37224-6661-ddb0-4394-83a16e1ccb61@nvidia.com>
 <BN8PR12MB3266E1FAC5B7874EFA69DD7BD3CB0@BN8PR12MB3266.namprd12.prod.outlook.com>
 <25512348-5b98-aeb7-a6fb-f90376e66a84@nvidia.com>
In-Reply-To: <25512348-5b98-aeb7-a6fb-f90376e66a84@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fa84088-1c66-47b8-72f4-08d70e757288
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN8PR12MB3347; 
x-ms-traffictypediagnostic: BN8PR12MB3347:
x-microsoft-antispam-prvs: <BN8PR12MB3347C98045C2B45C76C3A2ABD3C40@BN8PR12MB3347.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(366004)(136003)(346002)(376002)(189003)(199004)(6506007)(53546011)(102836004)(186003)(305945005)(7736002)(99286004)(4744005)(25786009)(74316002)(2501003)(53936002)(33656002)(7696005)(8676002)(71200400001)(71190400001)(478600001)(2201001)(26005)(6246003)(229853002)(55016002)(76176011)(4326008)(9686003)(446003)(256004)(52536014)(66066001)(8936002)(14454004)(2906002)(66476007)(66556008)(64756008)(66446008)(6436002)(476003)(86362001)(11346002)(81166006)(81156014)(316002)(486006)(5660300002)(7416002)(3846002)(76116006)(66946007)(68736007)(6116002)(5024004)(54906003)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB3347;
 H:BN8PR12MB3266.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pPzcdhVJokCMzQdj+1o8nrxr2bJ19r3LngJf+/CfUHdU9D69r4Iqv70CZcTUAU4HCryIJuSDOX3q2V4KDbMIq5obhU5c94cRGZOmfH+a4YSr4fjexYBcM9aJDCP3170aLhnuSQ8ai8E6soDNKlHXINdrF1Jp/6fXekNOV9txwlFhTmgz47DhIkVL7oTDTo8ink/PVQbQxwtE1IlDXNGAlwU3YMz1CzIGMaPIWFMsR/+fiXM8xgP68tDSlTyOv3E9+T87M+st14hzojuywfd3+4qT+QfHxV3OD++qRQDNGk259Z/XGFzUwJF5um7OCTwW4st+prctGLmyp6bwSpHPsgVyl/DdG0a0dZftKZlvFbTiGp3d6HVj1diltFUiWRpnlXa9O0ZsWIZTtOavH5e8RByu5rjNUyRvkX2DxCBmCho=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa84088-1c66-47b8-72f4-08d70e757288
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 07:23:09.0282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joabreu@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3347
X-OriginatorOrg: synopsys.com
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

From: Jon Hunter <jonathanh@nvidia.com>
Date: Jul/19/2019, 14:35:52 (UTC+00:00)

> 
> On 19/07/2019 13:32, Jose Abreu wrote:
> > From: Jon Hunter <jonathanh@nvidia.com>
> > Date: Jul/19/2019, 13:30:10 (UTC+00:00)
> > 
> >> I booted the board without using NFS and then started used dhclient to
> >> bring up the network interface and it appears to be working fine. I can
> >> even mount the NFS share fine. So it does appear to be particular to
> >> using NFS to mount the rootfs.
> > 
> > Damn. Can you send me your .config ?
> 
> Yes no problem. Attached.

Can you compile your image without modules (i.e. all built-in) and let 
me know if the error still happens ?

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
