Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EA6C1046
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Sep 2019 11:02:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74BA0C36B0B;
	Sat, 28 Sep 2019 09:02:06 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACCDFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Sep 2019 09:02:04 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1D77AC0CDD;
 Sat, 28 Sep 2019 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1569661322; bh=1cqYGwIxi3VOH2w8jzKYB3Q8SDna/xsu7JsFOTgsDME=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=hLRobXHs1T3Nn/4753ZrTPZC8qD5TRvJ5se2XGnSWKfQ4FOq5HYifgAIRdPaziOiP
 ZEPPEoMd9YO6BQcztIwH51fsGjyvyTD0deUK2k2hYL73O6oxIaebKAIOLibbcPFJTg
 bx5jJd74XBOvJGY8kTXhcfsqsZDbL+A2kqKf0rv4rVN9fXz98R+TXd9JOU2B3FE3rq
 Wh4Sv1r8en0H9SFq6aczA0kNhu914qDJkTiwv2Y3FoesolIIub2pVfczlvwwf3HzKN
 yncXVrCc1cVyul+zbfDqPYu5ra7Qd5m6sMb76yNXsGR+t3KgY6FJTFteICLiq4iggs
 i3m7laxlH24nA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id A1C5EA0067;
 Sat, 28 Sep 2019 09:01:50 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sat, 28 Sep 2019 02:01:42 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sat, 28 Sep 2019 02:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC7gW9K2ZvZ5ihC3eXfKzU9bk5YE8t2Yn6ALJZWpGyzNVFZPqRhnPHF0cppaPe3wrgFQ2RcTFTwI2yZKZ4kcARLFtO5Imh9JoqR8WuqB1n+cjBfiu1j0OM64jWBV+mkSQwVomleWoU7t5LUI1GoZ5LvZO++a/e1X177Af2uWWWyk8gLBSpaUtfZpS19YpHM0o2ME2LHHHeNdjWM8kFyqXchXk8eauVE3uedyzoaTJdXFCvjbNU7NXYbwsB4oS1VEZ7Rg+1+YJOT3ucqmzVES6z7uGslPzsilFGe3EkhhYj4/K5yYNrOzAfzjG8JU3/Y8xQKWCd5RSdb1nn2S/BzBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cqYGwIxi3VOH2w8jzKYB3Q8SDna/xsu7JsFOTgsDME=;
 b=VkASU75qi/niCjtSlr7HXGFd6UxW5vj3lK92mytuduDTksLJAkB9nHOalkRDDhUCijXYMndYIZgRbOr+vXDOqLKMk9Y76XUroYHZLaI7Pyo29s+wZsqStftvwx6sj6LpLkJRTD6zKc2rLEy4/N7PINaZVlIjKoZrKwW4kCNwP83Ive8u4Z3JdzqivHxDhwefdJQPyiBXTdn8RfDBXW9iRrlJRGuppDRqwsKR1d7nDQZmtlEuwHyPIMNrwV8k6xClavMnR9L7j+/VyWtJqHka9FIPMAFt7b91oZELIKwjwue0q56aG96F9VR3BknFxLvikb/us65J8UYF1bn2t5G5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cqYGwIxi3VOH2w8jzKYB3Q8SDna/xsu7JsFOTgsDME=;
 b=eNySKBV6Yyq36kU7kAS7GtlBJv3c38ayJlkNjWCV01asK2XZNkllCgpLKNGTN5AVRReZIoZmpXBP9NV0wzyI3GkJ6WlJMU0wHN6EO/G5qz07JuXiGR0weMQsev8eTyX29+0glpwU/6L50HJaScVAg8b1yAPlW5SB/fDtT7y3lkQ=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) by
 BN8PR12MB3009.namprd12.prod.outlook.com (20.178.210.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Sat, 28 Sep 2019 09:01:40 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::59fc:d942:487d:15b8]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::59fc:d942:487d:15b8%7]) with mapi id 15.20.2305.017; Sat, 28 Sep 2019
 09:01:40 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Thread-Topic: [PATCH net 0/8] net: stmmac: Fixes for -net
Thread-Index: AQHVdQgUsu3+9Gx8RkShfK4JNFRi6qdAzChg
Date: Sat, 28 Sep 2019 09:01:39 +0000
Message-ID: <BN8PR12MB32667D583653ABB31CDD4FA0D3800@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1569569778.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1569569778.git.Jose.Abreu@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [188.80.50.127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86cb476f-4b57-4940-33e9-08d743f279f6
x-ms-traffictypediagnostic: BN8PR12MB3009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3009E0B858439D73C2AD53E7D3800@BN8PR12MB3009.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0174BD4BDA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(346002)(376002)(366004)(396003)(189003)(199004)(2906002)(26005)(99286004)(33656002)(486006)(446003)(11346002)(74316002)(305945005)(71200400001)(71190400001)(102836004)(186003)(25786009)(6506007)(4326008)(54906003)(3846002)(7736002)(476003)(66066001)(86362001)(5660300002)(316002)(558084003)(66946007)(66476007)(76116006)(66446008)(64756008)(81166006)(8676002)(76176011)(14454004)(7696005)(6116002)(110136005)(81156014)(66556008)(9686003)(55016002)(6436002)(8936002)(478600001)(2501003)(229853002)(52536014)(256004)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB3009;
 H:BN8PR12MB3266.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oInf90ScnbtZ6uXcLbLGNeQb/F26vrO0Zn7u5RVy68V3SEcxQRz/Je2BH3iDdxBtIh/Jhmu4tprdVMkux7vr29FbOl3XgAjapqO0ddl8Q+sIjfjTWGU1dW4jFggRu8ao2F82EMYVGNr5VvAMg91ymU5DZm5MP3X+dbTxWFLC+ldgSCIAdoizKRvgMOYcQx/5XdyiT8fCbvSR+iX4ti4umWP6qvm1WBSiaFkwsB0Tjz7wwZe/LFK4sSN6YBD5UYc1qq0K2Qh0am0Bmy9mPcRYuWKe+PGT6DaqMrE/II6y0iEqM8u5FkDPwht1u1mwQ4WJ/TprgmX5NWTySQHNy1T/8Z8k4aQ0PS/MT6YfGuKgUAZXqd+F5wosbPrXEGvtWaHIQnayAnmYSt1S/sD+b2UDoupMwD9NXEQ20UiS7D17zMA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cb476f-4b57-4940-33e9-08d743f279f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2019 09:01:40.1180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOl4JFOI58xgoBtVwk+hZFV7mtsT7ruNlCNtsA4t6n8lusyLQYGIn8fRTY5t63seNv8jeGtw7/EGlk1Yd8VQ2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3009
X-OriginatorOrg: synopsys.com
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David  S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 0/8] net: stmmac: Fixes for -net
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

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Sep/27/2019, 08:48:48 (UTC+00:00)

> Misc fixes for -net tree. More info in commit logs.

David, please do not apply these. I forgot to rebase my tree against 
-net and this was based on -next. I'll resend. Sorry for the mess :(

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
