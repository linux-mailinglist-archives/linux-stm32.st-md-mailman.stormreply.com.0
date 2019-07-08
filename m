Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E8625C7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 18:08:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0D6BC5F688
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 16:08:17 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B74B5C5F686
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2019 16:08:16 +0000 (UTC)
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com
 [10.13.135.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 132AEC2A41;
 Mon,  8 Jul 2019 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1562602095; bh=5mfH7ysD+UZuoG2sEri0/zBaDfd9CEWJGoSBbkvtS0s=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=R0un0m8mu0KmE3hRNTIY6IBJbyq7a5AL50V+qIUzPgNsOSYhVrOyB8AtU/HTVhILj
 Dqh9BT9xz4mv/X3I8fuFkCUMWQqxA89gemfXxr+7grE0UJwzejtEDcC/Y6qIifvXog
 /tGOX3fMeQHNGhKNaXS7SID5OD/JrFYv97ynKkuiNhmG4+e8AblB0M8RFsCu3KyjoE
 69PU83HNgLRzUFpX+9Ms6Y5H8t1NzIpPg2YwpwH8lG9uhJkRhWaZo4ypya2bIhV4MU
 LkGL/GGo+TG8wOYjl5TmPYULjaW5C5Ud1F5KSGMcS8SUQ8KTpbfgiZE8CeK+ABgeDC
 i4aXU50PwheoA==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 79FB1A0067;
 Mon,  8 Jul 2019 16:08:10 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 8 Jul 2019 09:08:10 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 8 Jul 2019 09:08:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mfH7ysD+UZuoG2sEri0/zBaDfd9CEWJGoSBbkvtS0s=;
 b=gVxZ351cMPg6TPSQxMwQCyMKHkqPg/HzjwKwcpS2a+V/jlOUqXLi7e1gyAR18EqaZFgF7zA2/s+Sll9pEPpZ1ZjZMfLAv7OsA4zgp/RTnBI1CBSHKt6Tq1P3LO4+/jCZITCMyVwOMGDCACzeRTfmQuuCE5hdQnN884dE10Dq1eM=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.66.159) by
 BN8PR12MB2931.namprd12.prod.outlook.com (20.179.66.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 16:08:08 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::61ef:5598:59e0:fc9d]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::61ef:5598:59e0:fc9d%5]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 16:08:08 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Thread-Topic: [PATCH net-next v3 3/3] net: stmmac: Introducing support for
 Page Pool
Thread-Index: AQHVMwKNzVmUsJPJMUCkE31Cd4D9oqa8BTaAgAAezsCAAAGNgIAEwrOw
Date: Mon, 8 Jul 2019 16:08:07 +0000
Message-ID: <BN8PR12MB32667BCA58B617432CACE677D3F60@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1562311299.git.joabreu@synopsys.com>
 <384dab52828c4b65596ef4202562a574eed93b91.1562311299.git.joabreu@synopsys.com>
 <20190705132905.GA15433@apalos>
 <BN8PR12MB32666359FABD7D7E55FE4761D3F50@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190705152453.GA24683@apalos>
In-Reply-To: <20190705152453.GA24683@apalos>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 659d1876-be61-4c12-018d-08d703be7790
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN8PR12MB2931; 
x-ms-traffictypediagnostic: BN8PR12MB2931:
x-microsoft-antispam-prvs: <BN8PR12MB29312361A1CDAF296642E500D3F60@BN8PR12MB2931.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(39850400004)(136003)(366004)(189003)(199004)(316002)(66556008)(68736007)(478600001)(4326008)(76176011)(2906002)(66446008)(7696005)(7416002)(64756008)(55016002)(73956011)(52536014)(6246003)(76116006)(9686003)(3846002)(66946007)(66476007)(6636002)(6436002)(53936002)(256004)(6116002)(33656002)(99286004)(25786009)(229853002)(486006)(7736002)(305945005)(446003)(4744005)(66066001)(11346002)(476003)(74316002)(26005)(54906003)(5660300002)(71190400001)(186003)(110136005)(6506007)(71200400001)(8676002)(86362001)(81166006)(102836004)(14454004)(81156014)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB2931;
 H:BN8PR12MB3266.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nWOmyTqcVfbVFZU26fx7lSKZy1K2Afy1rDHrkjo08oZKMW0jegDQcXa/w1gvgzDTzpkPgcvfk1q51WAgzXSJkxEfRpH0EQMm/E7IssVG+Db0Exg+rSMeZgkqKp9JOH1jv0S3mdikBxGMbj2noIXAc8gSspyUXvRpM6+HtW5VmCt2/OkIYA2FYdPwukAEPFz0fNshnS0Tmu9YxR+/5txJ2tlzHy1doQYk14292bzdWqvSqWNhp/eJ9z0lGxR/1YpaW7GCjx5oOFYoCIsV8BvYit1tgu/8uKd8hD/vBeje8pSYfjg2DMH3/ZDnJQaIXtYImupqWR1paHKaDNOxX4UHMNLH5cPcx/nG5/1O1CmHNesbwXYVokg1XoH4DWR4lHMuegqLqttyJ3L5QeUQSrMT+V0Srnh2PcP7Hrun9CxlyJo=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 659d1876-be61-4c12-018d-08d703be7790
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 16:08:07.9850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joabreu@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2931
X-OriginatorOrg: synopsys.com
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Arnd Bergmann <arnd@arndb.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Introducing
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

From: Ilias Apalodimas <ilias.apalodimas@linaro.org> | Date: Fri, Jul 
05, 2019 at 16:24:53

> Well ideally we'd like to get the change in before the merge window ourselves,
> since we dont want to remove->re-add the same function in stable kernels. If
> that doesn't go in i am fine fixing it in the next merge window i guess, since
> it offers substantial speedups

I think the series is marked as "Changes Requested" in patchwork. What's 
the status of this ?

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
