Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C673C1321CD
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 10:01:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80193C36B0B;
	Tue,  7 Jan 2020 09:01:34 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (sv2-smtprelay2.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 499DEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 09:01:29 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1CD2B4064D;
 Tue,  7 Jan 2020 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578387687; bh=gEHgRGfdfF4RsI22DsfQnV/d/Tbae987J3pbDIVYns4=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=lkuzUoIBWDbLikhAuhj1B1gaKhL3Sfej5WBvirMwVUNwEsMPP6+LPdJ3pCVR7Qje/
 Vc2x26axZcfZ/6Ld0qbUhXazwDQteN0ip8itBU743TuSSkhtXwMB7mzaGu3MJ8+CKH
 tuyiEdoWr96nBzyrBurnp+3fl8UOF1oyjDgbbg/0IfJk0kkDM4oJX4XWbhNFHtZTwL
 e2emoNPfKqoso1Pz+/w0Gsx7Nm6ztH+unBe3xKimbxLaP4bztiW7MV8NQwEEGS3IVH
 xeXCopy1eQu+laHSvY53x+ZuqqfKxFNCMwJxGkF4pM1Y/Pu8vP3iz8KuI56glnylcy
 vOKxA1iUg8EXQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 1AD03A006A;
 Tue,  7 Jan 2020 09:01:23 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 7 Jan 2020 01:01:23 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 7 Jan 2020 01:01:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWmunz68KH9waX9x/w9wgpscMoAjezZn+pLFI2nB0LNZCedvUA37BT6G/qrL57fm0vkqju9BWux8YwiMFSHCQnb3HM6cpeY7+acVmbPyzMTMMb/pVRYdL06cUKQfwRPQVHVsqPRG2QL1oFUWCy73Gmq90NTmvN3kR/l1DJcj6RdY29hAvTYZZhbRTO4WdVPKXGfZmukcQiLC1uIXdjYEiwEeWeApqUdeJQSOWkcX6azQBoPRaQMbm7Hw1y2wbw+aV3Rc4fOZD4IfdkV0zHUqXKedshqrxAEu5sQBisVVWWfPbevKko5NMdeAH7sk4rzZdL6OO+LxT09hmb5qaerhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEHgRGfdfF4RsI22DsfQnV/d/Tbae987J3pbDIVYns4=;
 b=Q43bJPcx75QTbYt1PUNKZ2Hfsh1x13gDOp7OSeXGWJbWs73UNf2gDHaRf61nuXGCYnP40+R6+QlLKMApQdXd0eF9d85etaaiaqy7OOMYaYPAQ1zTGmjgX5dRRCW81lboRWDIUBDKj680bMfqwCeEQ1a7DXgl+qSYkZod5CHyHybk8P+yKONjQZKgDLJaThrWph7y3jCJfdo8/pgShvK6w9+/DYDJCSfgCGYxTJsng1K/t1FDcmwv68xDq9xx55Avqb3zy49zpMQIMiFZE1xhYi14BshjzPILf5GTS5rOZ9cKQvNIQF7W5lzvFyZXd7W27hEVbTdLrQ9FuGBOne6E8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEHgRGfdfF4RsI22DsfQnV/d/Tbae987J3pbDIVYns4=;
 b=c2RuTUQerHorB9MxML6+UTjM3+oIZ7KzNkicNPM/TyJqniW4ckGHW3hYn3NV3wCLtH1vOVXBo2+WlduFDl3tJX5/Gn5kAWNnnMYc9YVP7ULuG4VANig5iAwJDJgaeYUpRPHDIH9vbvq4AxEsBMeuiuioX8GGOZaECncc8Ykk8XE=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) by
 BN8PR12MB3027.namprd12.prod.outlook.com (20.178.209.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Tue, 7 Jan 2020 09:01:20 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::c62:b247:6963:9da2]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::c62:b247:6963:9da2%6]) with mapi id 15.20.2602.015; Tue, 7 Jan 2020
 09:01:20 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Sriram Dash <sriram.dash@samsung.com>, 'Florian Fainelli'
 <f.fainelli@gmail.com>, "'David S. Miller'" <davem@davemloft.net>,
 'kernelci.org bot' <bot@kernelci.org>, "tomeu.vizoso@collabora.com"
 <tomeu.vizoso@collabora.com>, "khilman@baylibre.com" <khilman@baylibre.com>,
 "mgalka@collabora.com" <mgalka@collabora.com>,
 "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
 "broonie@kernel.org" <broonie@kernel.org>, 'Jayati Sahu'
 <jayati.sahu@samsung.com>, 'Padmanabhan Rajanbabu' <p.rajanbabu@samsung.com>, 
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "'Heiko	Stuebner'"
 <heiko@sntech.de>
Thread-Topic: broonie-regmap/for-next bisection: boot on
 ox820-cloudengines-pogoplug-series-3
Thread-Index: AQHVuvgaaaIsBudVbUKl0Vrfhs6hVafY/hyAgABHUQCABXoXAIAAB1yAgAAY0QCAABpMkA==
Date: Tue, 7 Jan 2020 09:01:20 +0000
Message-ID: <BN8PR12MB32665EEBA454D679201C7D59D33F0@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <CGME20191225075056epcas4p2ab51fc6ff1642705a61f906189bb29f0@epcas4p2.samsung.com>
 <5e0314da.1c69fb81.a7d63.29c1@mx.google.com>
 <03ca01d5c23a$09921d00$1cb65700$@samsung.com>
 <1c3531f8-7ae2-209d-b6ed-1c89bd9f2bb6@gmail.com>
 <011801d5c51a$bd2e5710$378b0530$@samsung.com>
 <54a292b8-3cac-0caf-08c7-841c469fb68f@gmail.com>
 <012001d5c52a$d3be2590$7b3a70b0$@samsung.com>
In-Reply-To: <012001d5c52a$d3be2590$7b3a70b0$@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4454d657-f6d6-4f25-86f2-08d7935029b5
x-ms-traffictypediagnostic: BN8PR12MB3027:
x-microsoft-antispam-prvs: <BN8PR12MB3027A67BCAEC5709A92F2FF7D33F0@BN8PR12MB3027.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(39860400002)(376002)(136003)(366004)(52024003)(199004)(189003)(86362001)(26005)(478600001)(7416002)(5660300002)(8936002)(52536014)(186003)(71200400001)(66946007)(81156014)(8676002)(81166006)(6506007)(64756008)(76116006)(7696005)(66446008)(66556008)(66476007)(4326008)(55016002)(2906002)(110136005)(54906003)(33656002)(9686003)(316002)(558084003)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB3027;
 H:BN8PR12MB3266.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +AtBce2jg1lGxoY+lqf4FuogXH6mTVSxU+sfT8HRcwltVBn+l4s2OCPZscjWy80fbK5tyjIXQn/KA7R+tkblH25qYs6dv4/76qHPr6c0Wkc7Sw59araYJ92EMFhS+qzn4KmnyzkvsBiGkq4zeeDRpmlawx7LdUNY95xwP+v9v6VhrBm35upkOUIVLUtpn+vBXMp0ewofffRkCFwcUepsRqMvtF8Ea1M1fSW5KqPTbMEhySqzCOPCmn5sgvf71iL7Oz8ePQ04c16dyPhcDmS6PAP8POGbfQqguhBAKAE+PbfgeC/56TI3DO9cAjKFYF5W07mnRvcYlpjJ9naDXdFUiYclmPmtwcDJXBDvgC49GaQSLQ0chvXmnBXXHz5Hs9mTO/s6j7k4mqYqk3xixn+4C3DBZwNZHnQkVlCDQUGVhOD26DRjXgZUwtDAGnY2yyyS7iRu/IEvxyzTIYUUn0+GThKCCJLJ84j3MYio+2DkN/d0luxC9VoS8WKsNdfm7L+WyQk8hcCgwtIlkHLtxPt46A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4454d657-f6d6-4f25-86f2-08d7935029b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 09:01:20.1304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pK3JbOwGwFCkPvvoUamteLfboO2IeG5WDPkOePgtcjS1UBXRyPS+Eg3DMMnTmy9Nt4fqBgI8rIQzEzmIiGJ1Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3027
X-OriginatorOrg: synopsys.com
Cc: "rcsekar@samsung.com" <rcsekar@samsung.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 'Maxime
 Coquelin' <mcoquelin.stm32@gmail.com>,
 "pankaj.dubey@samsung.com" <pankaj.dubey@samsung.com>,
 'Giuseppe Cavallaro' <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] broonie-regmap/for-next bisection: boot on
 ox820-cloudengines-pogoplug-series-3
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

Sriram, Florian, Heiko,

Thank you a lot for looking into this! Unfortunately I was FTO and then 
sick which caused my mails to pile up. I'll try to take a look at this 
during the week. Please cc' me in the follow-up patches and sorry for my 
delayed answer.

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
