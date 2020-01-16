Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7E13D5F6
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 09:31:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82C6EC36B0F;
	Thu, 16 Jan 2020 08:31:21 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A63CC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 08:31:20 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 641CE40704;
 Thu, 16 Jan 2020 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579163478; bh=tkpPyFahm6kn8v3+DnM5uKmzdo17bDOR+juBQ1gI85A=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KiWTrmcGNHF6oW8Uw3LDjIDuZK1GLSgYMzD1gr8UjD7IrWB2mTlSREhWZlHp2roGA
 rPTXfXJiK2WiI1yID7Uip6zY9m8vr2e8N8K0XlJBq/eBDX45ZkOSc8JiqGkAfwFP4u
 4r7mZbpI3DZJA0KFV5OPUBw/SotSaaqHYhKwExhADs8dB2ffax7SDJiPHNokcR5vhm
 XQm8ahRdd+w/zsbQj6yFqxoLsGbDJ4ZUt5SrbVFY64m/4hPxtjIXAoXZMdPhHNzb4U
 X9qNF3NahdrmkxEzfoUVmTlmh1nJoqtitYI6stqCaIa/ZnnIqi6p5Vo7HbWbFGMiaV
 isnk5PjY1kLYg==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2231AA0079;
 Thu, 16 Jan 2020 08:31:17 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 16 Jan 2020 00:30:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 16 Jan 2020 00:30:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1+qPsUotpdxIXicBOHppgHs1M2iPLXnaeYqhE9Kl4A0Xqu7+21FS/cwPRuAFpdfEv+mnMeZyIFMzI21MxnupP0tCdOuH12z7xiXMYHETXMDk+MgOaqUeUdh6CCLWCNUeCsG9Mki5CseLC+N3/+Fnszp7IXknTLTivb1IHGxjFXoWCSKGv3ZCgg822JGvPto2I4VSy1dOL6gchOBIJxGIMBoGQ6bQnGJMXSIJM7BbaYAeZVF8M//9fEKG0hBwwY7kXUHPMq5dNjrf0/mQSEvQoE1yQ1/eTJ4mLxUmqlB6a/igmc8aNY8779Nwk6ILpMB9LQo2ijlXzTOi7RndB0CGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE1bYDD4RkZp+aX9S3ANQi6+v2eTdeCtIfxgSt7XgI0=;
 b=aITQMaZL/JBgmO2GatZnraNgoa13+8dp2z1ov35DsboIInsgLHY55EptSey5dhiybrNNUf59Im9yu2NQ+ezuCS+3ZC/HQTOXWgwrU22FyOstY+ZrGsXRt4ubcuPIURTfPze9RfXsBG5T+C3hR1ER5UL7520Eue7c9wpQrppCat67+Bv/SHjpYJFoiWH6ijuZQ201oAAsH8rHD61PBdBgmljSfiDB/E1D2SqP96QLV5H/FK2D/jy/8MDoZYIrgqpBT8owO5YmqdlKT58uC55xzldBDzyjSAUUlqc7J++dAJUAHeI1YSon6bvMIrTHhMDnlfnlMADVb0qDuZaMSkcogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE1bYDD4RkZp+aX9S3ANQi6+v2eTdeCtIfxgSt7XgI0=;
 b=HnB2xD+y1RN3IZTgNmz3pITrNUky7gvq7tvGnYjVJDrPjTyHvyirnA2eILy85FurgHs/b+ClTt/pz/hSqZ82VU0vIFPoni6pO/rhyhKGqLvum183jXvBZpp0MKzIPvrqL2GCeVWgsXcHgOlnUHLZK411mGnLvHQQS05sqnQ8gyc=
Received: from BN8PR12MB3266.namprd12.prod.outlook.com (20.179.67.145) by
 BN8PR12MB2963.namprd12.prod.outlook.com (20.178.208.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 16 Jan 2020 08:30:02 +0000
Received: from BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::c62:b247:6963:9da2]) by BN8PR12MB3266.namprd12.prod.outlook.com
 ([fe80::c62:b247:6963:9da2%6]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 08:30:02 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Ong Boon Leong <boon.leong.ong@intel.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Thread-Topic: [PATCH net v2 0/4] net: stmmac: general fixes for Ethernet
 functionality
Thread-Index: AQHVy3L8gC9rJbZo/EWGaQN98Kr0mafs9y/g
Date: Thu, 16 Jan 2020 08:30:02 +0000
Message-ID: <BN8PR12MB3266D34E72DF8650CD1A0E25D3360@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <20200115071003.42820-1-boon.leong.ong@intel.com>
In-Reply-To: <20200115071003.42820-1-boon.leong.ong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b376d520-051d-4d62-6764-08d79a5e485e
x-ms-traffictypediagnostic: BN8PR12MB2963:
x-microsoft-antispam-prvs: <BN8PR12MB2963A825F5CD8E593A7D54F2D3360@BN8PR12MB2963.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(4744005)(52536014)(5660300002)(66946007)(478600001)(186003)(86362001)(66446008)(2906002)(66476007)(64756008)(26005)(76116006)(66556008)(55016002)(9686003)(316002)(110136005)(33656002)(71200400001)(54906003)(8676002)(81166006)(81156014)(4326008)(6506007)(8936002)(7696005)(7416002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN8PR12MB2963;
 H:BN8PR12MB3266.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K2SpoxhLTfB+M9TfU0rctjqH7sK8cHqG0lOpuXpvSlL3FjvhcWvPAglPM7pwt3mj+P2wvrv2+TAlwrk03S2io/Dfhc/WRrmYlL+AMpcJo3V4RmVp1Ta+XXdg2CrWmHZY8Wk2XCxPxiGKYLQOfH0NyxxI6Ttj04uil1DH71X7/Pgr6XiJxDGjVejohIZ3N5I3f9lYS6QmnZYVcIWmrqFVP9pGKLVGkqEOzMz7OFusiSHLnWEwJGwyt3fu8KTqpaY3tMXJfDSQzU/khjwK1MUDaA7PhVEP6U6xVlc1Wzuf+u6DsVqZQljv0ijQzV10+XE49vWGTA3jNF7b3OXip+hEk0yTbbH6GYDtW0FkrmLtODl00lICJYusp2NwZpE72WNIfwcBxjj7fxJjw2clcVlOnSjXKmkqm2FiQ2NCY5OdlxWbaWbeN3g5aFGuBdshRnjs
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b376d520-051d-4d62-6764-08d79a5e485e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 08:30:02.7124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6yqNadTp8smp4eVRfF8BV5s4lFDAh+gYrTrCQ/72UP4XcjaDP6I4R5IDMvjSBpT/UsnJlPhe9Lrmza7yMN9Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2963
X-OriginatorOrg: synopsys.com
Cc: Voon Weifeng <weifeng.voon@intel.com>, Jakub Kicinski <kubakici@wp.pl>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David
 S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v2 0/4] net: stmmac: general fixes for
 Ethernet functionality
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

From: Ong Boon Leong <boon.leong.ong@intel.com>
Date: Jan/15/2020, 07:09:59 (UTC+00:00)

> 2/4: It ensures that the previous value of GMAC_VLAN_TAG register is
>      read first before for updating the register.
> 
> 3/4: It ensures the GMAC IP v4.xx and above behaves correctly to:-
>        ip link set <devname> multicast off|on

Can we please also get these fixes in XGMAC core ? The code base is very 
similar so it should be pretty straight forward.

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
