Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A2FBAE88
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2019 09:32:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F171C35E01;
	Mon, 23 Sep 2019 07:32:42 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34CBCC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2019 07:32:41 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25B7AC040E;
 Mon, 23 Sep 2019 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1569223959; bh=UmMy1/fic4o3hxEzGV/5qz3vnC6skKqVwLI3BJhMus0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dKVBrdfu5gyPayfaiY9FUr0+Vnnxo2JHT+rP+rEw8+ChTTLrVnEPd43hgAvSiA2Tw
 M8k+A9NVObstF9RuZsHgUZBj8DfLF9dRAqCjK6avq4CgW5CntyhLFA8ux6fA0eWUyn
 qDizvrVKyfqhCuLFfbwfQxS1WGbP02O9Ju987fH4Pg+eAR0F1ZPmXizsSJdXsHNLnq
 oKC2rdeL4fj1IIopg36lQFtNTZl6B9qdrgBPyoxX6iZSzdE7YoLOIKWuUpVKFOuPGj
 Ae51bWUU/LddKEAJt/h44+Xiau9a+b55lQ2027ukf+P0oDQJzzzo+pZahvl9lI47nC
 ZEyOMD5NSkCgg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0322CA0067;
 Mon, 23 Sep 2019 07:32:37 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 23 Sep 2019 00:32:37 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 23 Sep 2019 00:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDcbmDpiBmkJq61PtaY5shwfOXMfyOpj2/zBmZmktV1lhuxs4xBunsIxur4Ld0a/DkOivMSY0zWSQuZVaVDfdknBVD04kytCG6RHKMtd1AkIL/04faayRSGVUpRFu1nDGYr+4rOpsOh4tY37qZqvPyczzXB4PiFxszDbLdTWYYf+KWcAHzgS2+o5k2yN6w0MUGp7T1McM2ZpOq7VdIn9hPph/0M2XDVfWci440/ywxLt3iO+c+513QD2G6quPcCK2b8fhGFCqpwVDJHPUoJbuCMrnecdC4WodSS2D5hCLOhIfaWpV17S7ItuB0S3nXJaRy7+eenZqUBL3f+RfvNKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmMy1/fic4o3hxEzGV/5qz3vnC6skKqVwLI3BJhMus0=;
 b=S+Q23sgNqnIcGErmyI2TCBychlPu/N2nigr+paQuQgEb8a2o18SMLbw0W55isWPZiQJT8gaVVOhnZmdXEFUNWTMipEqebUyZhfUpNGWj1aXEJVKl51ydkZlvkQwMP+bF3zfKpbLmv1VEsZRJ5d3Ko6hCbxrfw6DciI4pygTGFcEQewqiYz7kt2w8tzJXL5oWmDl3WXF9Ik2dTwFZc8Wh4zmAe44aQ8CeUetNlUC1P78qwZE9RWoO08l7b85DgBlVkCELbtUgcmzOhpq8fjuvlOIIOxqHVBHxnMtNLKvvfbfhaOZaFpMCdQ9w07iB0XNKfukTxuOpLrA4J4EcK0Dd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmMy1/fic4o3hxEzGV/5qz3vnC6skKqVwLI3BJhMus0=;
 b=QfNXcZbonQBflntv7bv2svrDWcUxAcn0YyASkWEmdNdqsFkUOQkJPg1yezH3erNk5pZfXLGhwZnZkQrBu82WE5YyMgl5ZTucC0E1zEjm+bEVgyVWmojWgE2f240Kph/hK9TzvkGhF6BYE4adlmzubJZMl0NlAAD77MUyOWuvsN8=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) by
 BN8PR12MB2978.namprd12.prod.outlook.com (20.178.210.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Mon, 23 Sep 2019 07:32:35 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::59fc:d942:487d:15b8]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::59fc:d942:487d:15b8%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 07:32:35 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Thread-Topic: [PATCH net] net: stmmac: selftests: Flow Control test can also
 run with ASYM Pause
Thread-Index: AQHVbtJ1HwIoxgwcmE2GaMh8ERjNe6c4Q5cAgACggSA=
Date: Mon, 23 Sep 2019 07:32:35 +0000
Message-ID: <BN8PR12MB32663D64B4A3D517C76B262FD3850@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <f35fa5a51f52fc1ef17a0a9ecd470e2a6792b3f8.1568887745.git.joabreu@synopsys.com>
 <20190922145642.55453135@cakuba.netronome.com>
In-Reply-To: <20190922145642.55453135@cakuba.netronome.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46be0eec-93db-4ac2-fbf6-08d73ff8344c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN8PR12MB2978; 
x-ms-traffictypediagnostic: BN8PR12MB2978:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB29787BFA0B7F5FD2D8297414D3850@BN8PR12MB2978.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39850400004)(136003)(346002)(376002)(199004)(189003)(51914003)(8936002)(14454004)(71200400001)(74316002)(4326008)(4744005)(33656002)(54906003)(6636002)(9686003)(55016002)(229853002)(64756008)(66946007)(52536014)(486006)(25786009)(316002)(6436002)(110136005)(256004)(76116006)(446003)(186003)(86362001)(2906002)(81156014)(81166006)(76176011)(7696005)(8676002)(6116002)(66446008)(66556008)(66476007)(66066001)(476003)(71190400001)(11346002)(3846002)(5660300002)(6246003)(305945005)(7736002)(99286004)(102836004)(478600001)(6506007)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB2978;
 H:BN8PR12MB3266.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Psi9iBSYREtQIhLuFZcUgs3JdGv2Ryae1W9Mafw944tO4EyDFJpMCMY9A2xOjzNOzLZSL95bYdEPM5DPx0yc47Kj3pMrafIhFMu1VYSrfT65GEpqv1/x6/MeyWW02g0i1eG/89s9pr1tHUwzlKgKLOcl8LCk930Zt90jlqA65OBu3IzIonNumyL5qJ00hccYeM7mYAqGacTcikNiyBoKGiKE4sb0E/AabzW5ucHu4Gd0TjwQn2ojUc3l8JNUlr8J8DcX0nJgiSkeM9ruulWrskXGIM9ZbLVjy1htt2sHVRpdG8smtMONcA4hV92JMfXF6V6WWH1Qn+Tl+imKfXECxS6NSqxUJt9h61eBYZoNU70MvoAEu4fxvC0b1T/vW4wWSb819ZVsZtc1AhbqtzG1EelsX6r3d0dGIvUf144UJmo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 46be0eec-93db-4ac2-fbf6-08d73ff8344c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 07:32:35.6835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ryx+XKrNnnfptUxg1JH6t+rPAEvhSVEZtBUcoawJ4t7u2Ffph8iH7Ni3ocTUs+2Ni64EnZDHAH1PrZtsYN5O7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2978
X-OriginatorOrg: synopsys.com
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: selftests: Flow Control
 test can also run with ASYM Pause
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

From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Sep/22/2019, 22:56:42 (UTC+00:00)

> On Thu, 19 Sep 2019 12:09:49 +0200, Jose Abreu wrote:
> > The Flow Control selftest is also available with ASYM Pause. Lets add
> > this check to the test and fix eventual false positive failures.
> > 
> > Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> > Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> 
> Hi Jose! 
> 
> Thanks for the patch it looks good, seems like you posted it from 
> a slightly different email address than was used for signoff:
> 
> From: Jose Abreu <Jose.Abreu@synopsys.com>
> vs
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> 
> Could you please fix and repost? Automation may get upset otherwise.

Yeah that's my external vs. internal email messing around. Any of them 
works though. I resent it using the external one. Can you please take a 
look ?

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
