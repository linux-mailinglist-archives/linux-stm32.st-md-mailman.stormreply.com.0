Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BE9130FC4
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2020 10:54:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D998EC36B0B;
	Mon,  6 Jan 2020 09:54:01 +0000 (UTC)
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 240BDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2020 09:53:58 +0000 (UTC)
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: zRYaw4MeO4BFWFLdqJXvUY4C8JTd6rsGJCwIJ8YlLTugfq0JmWZaPogmdcwBHuWUZ++ko7DEGD
 BJJGNFA57Sl79e73vBQSMa6SCMiY4i9i91fTHYXugjtElNw5uB78HquFSr8yexIUHXrkYEksaY
 YvegeIvKQ+aitDPClbUEfrYNlhUCrbKtKUrmTH155eMDQljBsWiXKOrNC3/Ri4FJfVnyTjtadA
 KYRORygrteaJ/5RBN6OIwm3rcfgKZiqIdTgpy7okIqMBSSt1X2VAIhDb3/zWQobDcwsmUwkdp+
 GYk=
X-IronPort-AV: E=Sophos;i="5.69,402,1571727600"; d="scan'208";a="62304574"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jan 2020 02:53:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 6 Jan 2020 02:53:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 6 Jan 2020 02:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6+sOCUNgE+sv79pOH7kUbSG9qURMPA1dAm5fxhtIfOdllB7j8oOQUXuq4UVPDH3K6kyZ84lRz2s5YVfeQPPQR8QIQAY9l+Ux86ST8Ct7iVL2dLyLxKY1quJKVFTo6ttkmzgQqo8Rp6PMu7N3ufe+8TD6KoaKS5ZreGOxG9UjmMgx6DzVWKJyCzr77teNi69BbgzQ4/mno0VE+/lJinyVtU2IdF43ljxiOADQjJhBzRQnhSD3iQW5miSz5gXILRA4kehDRaXYzW72mH6WNSGuFpEk6wB3le/4EYQgiByvjr54XzOdeu/T8wDVRlgVZTKMjyzx/Ru0Pn2YoQfdbhfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gm1Br1CHUtUOfgm+A45dSW91JgI1NL3xTYIa8s1JGo=;
 b=a0U49dyvkiMBMRgGGE00g5gvxs8k7jlVrAdhhlRinlVULsPnQTDXEguRKZkL1KONA7HTvyN9sn/J83CUm84GhGAwQqDWutNz3BkFQ/KixS3MWq7dN5sOZe3OFL4HllS4IkrpAF9PWZ0fDZ43P7KjqsAIF8g1wGNA3DOpWnesICVwV05CRTk9bHmguTgrVdu6T5Wu9l/k3NzEjYfH7GZvQblk1lME19wIAxCxMcnN8ggPNXUB4NBD/WciEaOfVoDvvwCgGZmv7kfVy6TkePwvynMC6j+dFeESgb9rPag5Wzi+Oi1QXVdcPdC5CCOkOPxGCy1biZatXK9+TOydK+Qfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gm1Br1CHUtUOfgm+A45dSW91JgI1NL3xTYIa8s1JGo=;
 b=ObK9NWuOUA2Ra5xdx/mS3cPhEFFH1X0iYxOt9W+7P5FUopxHqJOk0L7ZjvI1nKqNtyOBL8UGJvMnC+AwMskDCxkQ+RH7pvnpXckbg+aKZomFbpBhTEyJ7weDynWu1hszOHfmSZZ5TjRssoZBKQDThbIM5FWS/nyb61QnU6pZjyU=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.224) by
 DM6PR11MB3868.namprd11.prod.outlook.com (10.255.61.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Mon, 6 Jan 2020 09:53:53 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb%7]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 09:53:53 +0000
From: <Claudiu.Beznea@microchip.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <linux-pwm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <bcm-kernel-feedback-list@broadcom.com>,
 <linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>
Thread-Topic: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Thread-Index: AQHVxHc0gN2UoP7Gc0Ocsx6/BxJUcA==
Date: Mon, 6 Jan 2020 09:53:53 +0000
Message-ID: <145f61f5-941b-d0f4-7abd-33ce7f005fca@microchip.com>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
In-Reply-To: <20191230172113.17222-2-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd98d837-f71d-4669-e076-08d7928e56fe
x-ms-traffictypediagnostic: DM6PR11MB3868:
x-microsoft-antispam-prvs: <DM6PR11MB386839E19F8AE22C56AED43D873C0@DM6PR11MB3868.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(376002)(39860400002)(136003)(366004)(189003)(199004)(66476007)(478600001)(66556008)(64756008)(8676002)(2616005)(66446008)(31686004)(6506007)(66946007)(53546011)(91956017)(76116006)(26005)(186003)(71200400001)(7416002)(110136005)(316002)(6486002)(8936002)(2906002)(558084003)(86362001)(5660300002)(6512007)(31696002)(36756003)(81156014)(81166006)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB3868;
 H:DM6PR11MB3225.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOMKXiNGziR8dv9gol0oOsf6AU3jg0EgTcvPeER6oGWQ/VHSV6mZ4G35IavOvUWvfJowh6rCgEhlk8dQaHqqGFPgluMQ/mqNOqzZVUbtBXvd+M8DHE4Ih/QhaACanEKd2yY2+hKwmKfmIpxc1EDyNlGPemaiqh/eovfKhRtnMxavwU1Rh5GcI/Bfjng/YCxdkty/e8RkHg/iDVeRjL+c/LvR4hzUbhvVz3lKSJuB5ISxB3wNgEJGnvL8HRHkVq0weTLXARW5wg0/ogGuGqlsHjEi26ZJ9uuAZdKfXOph3zN5gzzRsREIrYqQtIndwiq3oYxJ7K+SEPHCJN1cZszNc3RUqF6sq9ENqwWlsZVSQaJswTwMjrUgUQEtDbwvv2LYq+67tv/sGjVbjPS4m9b4PUGsbsVMg053jU9TpUZuCpkkSbnD/5hZPBztOan2HJK8UmTIUVrmLulShBaKbP3pI4lxjuCXzYZMVtW9YYwU/x5yVUIMoaO/gPvVe18u5JSW
x-ms-exchange-transport-forked: True
Content-ID: <C6A04D4974AB244693C3B9F0D1537D34@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cd98d837-f71d-4669-e076-08d7928e56fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 09:53:53.6461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3t7GXAiHVzcYWfgg7rs7BGYg4AhBXFOdWKJswiYpNOQZcRLxnjLB8thujRLTCNbSdB/NeinF2BmkaKx5I9MFDTEFmIV3xzqyWRswi5WXJcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3868
Subject: Re: [Linux-stm32] [PATCH 2/2] pwm: Enable compile testing for some
	of drivers
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



On 30.12.2019 19:21, Krzysztof Kozlowski wrote:
> Some of the PWM drivers can be compile tested to increase build
> coverage.
> 
> The Meson PWM driver requires COMMON_CLK dependency.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

for PWM_ATMEL:
Acked-by: Claudiu Beznea <claudiu.beznea@microchip.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
