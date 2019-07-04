Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3235FA41
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 16:46:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8478BCBB4AE
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 14:46:06 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFBAFC32EA0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2019 14:46:05 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4FE88C263A;
 Thu,  4 Jul 2019 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562251564; bh=wrFtPaXbv2rSgRV5CDYWYhI4aVx2bKPpFIRxTBiKEBs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dBEBjkFiMdD++q98gqxU/jTnMJG5LWMM6pQsPETxzuj/fJCrO9nLpwasc21GIixkU
 nbvyHCOe8ixQfRIsy20PtRFF3nvk+yAdzvekOeO5YwRnNeiWalKmIkR44hSefM4iUZ
 D22ed6Ojv9lRPbu3lEOdwfmtpDFnzsmSHtHsIPw+z4aXQVGt1GFrcLRgEU66A8KXc2
 rkbN4LXPChshwLxp/ho4ZH0piD74D+xGc/2/hd65in2x8H3mLNlCqJrQzIa0sVWn0/
 5iOobaXGbgRNOGJnB0PSIympiegZXSkqbykPkq2EVVyeJmOBsG6UZkvQuejZu+o3h5
 gLdFJqrss6E/w==
Received: from US01WEHTC2.internal.synopsys.com
 (us01wehtc2.internal.synopsys.com [10.12.239.237])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 86610A009A;
 Thu,  4 Jul 2019 14:46:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 4 Jul 2019 07:46:00 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 4 Jul 2019 07:46:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrFtPaXbv2rSgRV5CDYWYhI4aVx2bKPpFIRxTBiKEBs=;
 b=bz5U+y7SS/0fpxJBvuppHhiLYnEcR4o2yM8/sjgvUsIVdFE7o4vqv/dp3VFDj6Qi8iv/7PdPPLrKRpEceEtCaGP03a9yN0Yv/UwDY2Us5e9lpmGxWOsV91VZNmMBWIJM3vEpg8d1G37EOpayY8TcdJIr0NajoNG/T+3hErKz4Ys=
Received: from BYAPR12MB3269.namprd12.prod.outlook.com (20.179.93.146) by
 BYAPR12MB3541.namprd12.prod.outlook.com (20.179.94.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 14:45:59 +0000
Received: from BYAPR12MB3269.namprd12.prod.outlook.com
 ([fe80::f5b8:ac6e:ea68:cb1c]) by BYAPR12MB3269.namprd12.prod.outlook.com
 ([fe80::f5b8:ac6e:ea68:cb1c%4]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 14:45:59 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Jesper Dangaard Brouer <brouer@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Thread-Topic: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Thread-Index: AQHVMYtq2Zx4WVoG/U2kL8GCK0bP/aa6NZoAgABVQYA=
Date: Thu, 4 Jul 2019 14:45:59 +0000
Message-ID: <BYAPR12MB326902688C3F40BB3DA6EEEBD3FA0@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <20190704113916.665de2ec@carbon>
In-Reply-To: <20190704113916.665de2ec@carbon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8f8545f-d62f-4d54-68c3-08d7008e5434
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR12MB3541; 
x-ms-traffictypediagnostic: BYAPR12MB3541:
x-microsoft-antispam-prvs: <BYAPR12MB3541648C6FADB7CE2C5119DBD3FA0@BYAPR12MB3541.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(366004)(346002)(376002)(136003)(199004)(189003)(5660300002)(64756008)(476003)(73956011)(33656002)(6246003)(66066001)(86362001)(68736007)(7736002)(446003)(7416002)(26005)(6436002)(14454004)(66446008)(316002)(110136005)(55016002)(25786009)(54906003)(99286004)(76176011)(478600001)(8936002)(256004)(4744005)(6506007)(6116002)(71200400001)(8676002)(102836004)(2906002)(52536014)(229853002)(186003)(66556008)(66946007)(11346002)(74316002)(305945005)(71190400001)(76116006)(6636002)(486006)(4326008)(14444005)(66476007)(81166006)(9686003)(7696005)(81156014)(3846002)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3541;
 H:BYAPR12MB3269.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oTS6YRHj2w/eYAvpJQHKqJyDLWwHk0ZELDrT/rzbr/mIW/cdu02ndRu10N1U8EfUcbfbmrKJdF1ma2qv2Jn5PjHul3LgBy/r8NU1Z8cCyAWvFysgWKNLLgbdvGAY+hu0YKiOhNutRBtHb4mArOidKo4kEPtDcOR9+ATfuXZvJffu/r6peuk41VTn1UCOuGq3+Z99OcU5Ig0xiq0xqlgOcycOImooqNPaXAbOVelI8ys7p2liSWxqNZMvflLXUm0ScMrWEOlQVmgyAP7jAztzh1ahg4F6o0J39bZ3TPzSyP3MXDzyjX+2o+NKoQM88H9saIIvr4gn62BnC8EYXh0QsrOVrplqzh/QaCW5Xu5OF44lAIC0YiNHjVPASn8x9JPrRRPTXpdiXxzQj2ADPqs1TZH0cIkezkSN2D9GO16ncvI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f8545f-d62f-4d54-68c3-08d7008e5434
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 14:45:59.2512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joabreu@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3541
X-OriginatorOrg: synopsys.com
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

From: Jesper Dangaard Brouer <brouer@redhat.com>

> The page_pool_request_shutdown() API return indication if there are any
> in-flight frames/pages, to know when it is safe to call
> page_pool_free(), which you are also missing a call to.
> 
> This page_pool_request_shutdown() is only intended to be called from
> xdp_rxq_info_unreg() code, that handles and schedule a work queue if it
> need to wait for in-flight frames/pages.

So you mean I can't call it or I should implement the same deferred work 
?

Notice that in stmmac case there will be no in-flight frames/pages 
because we free them all before calling this ...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
