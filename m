Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA44139468
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 16:10:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C17DC36B0C;
	Mon, 13 Jan 2020 15:10:37 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (sv2-smtprelay2.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18D93C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 15:10:36 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4F01D406AC;
 Mon, 13 Jan 2020 15:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578928234; bh=tMARHQqXb/kxiANaRYrpH66Kf5YVI/DDBh4/dKYxjKM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=JH3Q3t4UMzDEJ4nKPyxsecEWuvJMidBlQnCYfIJuqo4b7L6HRxDf19VlY9kBVAZJ3
 OnK9nIT1z3ET6ncl/F2sK6T1mWHV4Za83o1hlMvkZ2O4fzbHP3fAHeY23uDSrSGYR8
 j7ByqxgTN5q8FfsIel4Y6nvTa4Bnj9m9DxxfNEIRubpmP5llQMsRvJ0kskGM5pBHy5
 5rk4bIX/uPQiV989kwU7AcPCJTbNI1f2uxUqq3VrYrD2/6gPzjWwwxYsrKOL1uVB5H
 iIqhEGvnBmK0IQ7gX0dG3M4OIX/ry5QjsT3ji0Y199uk9lxNAmAJyK+VYqXZFdsbVD
 gYM8RQR3sJdwQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D2640A006A;
 Mon, 13 Jan 2020 15:10:33 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Jan 2020 07:10:33 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 13 Jan 2020 07:10:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmir8j8hS0su8V6x6AjaJcHJoqZCdo4sqQbLPx/XAnsQJqSKHbSBHjNbErY2JRmO4cY+dQLtDe6c6YlTzrjTlBTLdqeV4EE2NbuSfOkCuGp9nQF327JyUMXaK3Dc9OqrXvg6kEceMPmc4rVO9tsv1cyGZqSg0LnWBtq33qwP5x2uy85FQwQvXqr471xEfohSHg5QHnLrth43InLnBN3KjWcLc7sfvD5Nc5ID30IqvrxttlBXZr+y9dKAjDKq90thqemVWvBaaRKV4THMIMhM1xBO7bJArXftjlzuyMCMTrK3bNk0FgNew/ucSb8VglNHTIG7/FiqUR1ZY5f/WHUNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+Rb2KkptlEuGeGSmBiEd/BtjFYolpxi//mcXAjS6zQ=;
 b=E00cjwftGZYJfBPxCwLKbSjhCgPp/iqpEtQqNlhuVzGds5lHSyZO9kqoSgERiYuh/jdPgnvkI3OXEK1cl7iRwZYHpMQotc5BLm6lc4OjC5rCO5aCnjoRgsQaDvTXgj1zmM6wp6W1Usw+qeTSEmebiNTiuU2cH7pxAdatiCc9253CNJLbI0VBqz38phxReeoeNe5/bzQGuyFslVBryhXWFJpsx6HGiSsQhYTcRGwUg9IaJrnYtS5K+bTnvd+F8IKfEjkAPM2EF2Ak80wBPp2ylmDaHG+vGZn9KjhdcU6c8on/uW5goXbFJ1BEiyR5LCsOCLD9JwgdcO7h9Pr89HAYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+Rb2KkptlEuGeGSmBiEd/BtjFYolpxi//mcXAjS6zQ=;
 b=LSvZwblUqu96O/FDkVN1DwGjgWekTU8/nQG6i6wOLXkblyQ5Y0c1bqWllLiciqYbBSCPnCqVVspe9FhRz5HVPAH9Esb0cIDk/n9mwOst/MthRkqkHKeG+Aj/FOzr/Er+gV+CNWiD6582Gm8D0nHhU5Jxao4yiQgkbi104LXil58=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) by
 BN8PR12MB3236.namprd12.prod.outlook.com (20.179.64.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 15:10:32 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::c62:b247:6963:9da2]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::c62:b247:6963:9da2%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 15:10:31 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Jakub Kicinski <kuba@kernel.org>
Thread-Topic: [PATCH net-next v2 1/8] net: stmmac: Initial support for TBS
Thread-Index: AQHVyhHfUgV7XByIykCLlDpbD1GCAaforncAgAAD9wA=
Date: Mon, 13 Jan 2020 15:10:31 +0000
Message-ID: <BN8PR12MB3266B96942463C01A0F367A9D3350@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1578920366.git.Jose.Abreu@synopsys.com>
 <d72e539523e063a391391d447ece658524bb8d57.1578920366.git.Jose.Abreu@synopsys.com>
 <20200113065406.54bb324b@cakuba>
In-Reply-To: <20200113065406.54bb324b@cakuba>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af290b24-ec28-4645-7226-08d7983abb6b
x-ms-traffictypediagnostic: BN8PR12MB3236:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3236010D7542B18971C3FE44D3350@BN8PR12MB3236.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(346002)(39860400002)(136003)(189003)(199004)(66476007)(66446008)(2906002)(6506007)(558084003)(71200400001)(64756008)(66556008)(66946007)(76116006)(26005)(33656002)(186003)(52536014)(5660300002)(86362001)(8936002)(4326008)(7696005)(6916009)(966005)(81166006)(316002)(9686003)(478600001)(8676002)(55016002)(81156014)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB3236;
 H:BN8PR12MB3266.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zhFtA3pmWHZzk7im+6McKKqYSSGJYgEYUtrn4wSHW4hFJUT/rjMZ3T3+5FnnHb0KVTgHXEGWmkeR7+NNZ/EfNbmLKF9bUCFTplrpWycl4DsVWZeaChPO/MqJ2yg/sUOw1Ekor8ZWqTGV2T0FFUgoJRzDZkzqQZlhpUwm2We2PTr+bngGh2z/KKfiM/HQ0rC1tQTEymH06Zj+U2/7wcr93JXPs7PUHfeRp318PKrTG6qcafGbq+ezQDk5eZjnda2qJYYCO8tyFfF/fCjqQ3Jb+D8P1UvGAoKl56nETXTXxgMoegSQU/jJQaTvuVt6ABtKhRgGwJS+03GtZeygghFjWlE/wJmLr+1Htm2MX4fECA6LFpF0r6fMHuAA6DVllIjqSmbgecYvdQCmBorrEMXnvijEC7cfR9PjgKw42HT617sGNQPXI4hntlHIq2es/AZbfzDxVG5Ld8jzc9TBwtyfSiDvIiFwDhy2OicBRcqQCzu3mTcz/yn97BFcvGKB3zHcvVfdkCkgPvv88utOoXb/+g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af290b24-ec28-4645-7226-08d7983abb6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 15:10:31.4171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M8UXGMB08GuTM1+Q8O4yMieIJZKr2aXwpBDst4Xdwi5uF/I5+00kG3dZHGuWESmK+N+UAAX+OthgqbA46AGJSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3236
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: stmmac: Initial
	support for TBS
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

From: Jakub Kicinski <kuba@kernel.org>
Date: Jan/13/2020, 14:54:06 (UTC+00:00)

> > +	int tbs_avail;
> > +	int tbs_en;
> 
> These could be bool or a bitfield?

I'm tempted to not use bool since I read this: 
https://lkml.org/lkml/2017/11/21/384

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
