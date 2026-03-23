Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eErYCooXwWmbQgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B42F0330
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45759C8F264;
	Mon, 23 Mar 2026 10:35:53 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013027.outbound.protection.outlook.com
 [40.107.162.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D62BC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 10:17:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SimklfNQG+82M3ywSlMu6f6QgGFWY/rovXNBCvKqSuDLJrtLluE51sz1kaxA8Lfaae8cB84rHVRC/mGH1aIynQVAC6muLITyQuDvgXUFG9Oixb+64AumqMnJhjbni8fUwhIk3O9+oeckYk3U8fNMubwfmtEYcCBpJo44qAbPhydn7wTkujF150Sk0FrmRg8iaqCRN8gm4iMftVEM2LZ2NcF3h8JH5b0mulqWrUCSG2Qq6xIhQP+1MKajidUwOic0+8GDvFGkagldbU7d93Kf7/TtHnVvGP5p1sAIEqVBvz/CRHw7q2fTlcbTyvBLSkHTkHOMJ+nNW3OcapEQRc0vUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZU98YfjZn9Kwqm5f3eOzBWf8tmQQHPi9WEU3CqjSqc=;
 b=W5fdNo9BfayA2HylFoHP23sCCdiQFQtse7QXxXsU4mL36UnDKwLebsrE0mR5PX4i89UNUrpO/htiSKhjODccE6ABpzoO5UtFpFLVBmYRHqmEPq9CrnEMZ7SX4JL/foj8yk3qt0qOeDooTWQyVsZ+ZKxdTLZCDrXou9Dpd3gr4eGLA1U4+weVTVgOSsqPfaPbHd4X933QLtLVQ5H6GKNPiB/aF9LGshXTcNvPqe5q4oYqALee7SmhUWiUuukiZSfTLVG1/lWiBDbISjDtTjgNYtzmHzXPTgHnW6Pme1sJ4LOx7DpVL8fRWyV9J/6z9piRiN3Yk/9Rp76e5zXux9lhYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ST.COM; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZU98YfjZn9Kwqm5f3eOzBWf8tmQQHPi9WEU3CqjSqc=;
 b=GYkYHK0vVMWA//FZMO768aRIIKnbPf+aQlEVfFZLHmu3BtOa8jDmX9ndIFTEC2+HVokAvEXtv8kTYD/MM2Q9/1A42Wym9k9ca5dmzieQ+G0ysrKtitb0ljGCvmIrcOuD8y7NFzfO0G7+LBNa3R5BO2z9tCM5Cjk6ix8odxjs9QJpz863Ff3Qva/gUK3ibjm4rv4GWTpn4QE/gicnfjlHydozpQOuQx0qUnACdWSnClgN8xVrriyL+paLamOfdLhKrTPuA2KgoRKwPPpd5rUc3om/QG/YD9HA5vNP+oLRIhLTcdc0RyKjbbG1NjLP19kp8w/CCkSfTmcC44CvC+S07w==
Received: from GVXPR10MB8197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:112::13)
 by GV1PR10MB6540.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:17:50 +0000
Received: from GVXPR10MB8197.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::40ca:bccd:d49c:84b2]) by GVXPR10MB8197.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::40ca:bccd:d49c:84b2%2]) with mapi id 15.20.9723.028; Mon, 23 Mar 2026
 10:17:46 +0000
From: Christian BRUEL <christian.bruel@st.com>
To: Antonio BORNEO <antonio.borneo@st.com>, Denis HUMEAU
 <denis.humeau@st.com>, Olivier MORCHIPONT <olivier.morchipont@st.com>, Arnaud
 ROSAY <arnaud.rosay@st.com>, Francois CHOLEAU <francois.choleau@st.com>,
 Amelie DELAUNAY <amelie.delaunay@st.com>, Christophe KERELLO
 <christophe.kerello@st.com>, Christophe ROULLIER
 <christophe.roullier@st.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Alain
 VOLMAT <alain.volmat@st.com>, Olivier MOYSAN <olivier.moysan@st.com>, Hugues
 FRUCHET <hugues.fruchet@st.com>, Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU <philippe.cornu@st.com>, Arnaud POULIQUEN
 <arnaud.pouliquen@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>, Thomas BOURGOIN
 <thomas.bourgoin@st.com>, Maxime MERE <maxime.mere@st.com>, Christophe
 PRIOUZEAU <christophe.priouzeau@st.com>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Yann GAUTIER <yann.gautier@st.com>, Jean-philippe
 ROMAIN <jean-philippe.romain@st.com>, Valentin CARON <valentin.caron@st.com>, 
 Alexandre TORGUE <alexandre.torgue@st.com>, Nicolas LE BAYON
 <nicolas.le.bayon@st.com>, Thomas BOURGOIN <thomas.bourgoin@st.com>, Maxime
 MERE <maxime.mere@st.com>, Michel JAOUEN <michel.jaouen@st.com>, Ludovic
 BARRE <ludovic.barre@st.com>
Thread-Topic: Sashiko: AI code review on Linux Kernel Mailing List
Thread-Index: AQHcup9cvIaMi6/V2EqzqZwdJkvlTrW75oug
Date: Mon, 23 Mar 2026 10:17:46 +0000
Message-ID: <GVXPR10MB8197E9AEE2968A63EF26B0AA814BA@GVXPR10MB8197.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB962366CB3DB8B9A52D7C4220FB4BA@AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM0PR10MB962366CB3DB8B9A52D7C4220FB4BA@AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=True;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2026-03-23T08:45:53.5090000Z;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=Classify
 only; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=3;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=st.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR10MB8197:EE_|GV1PR10MB6540:EE_
x-ms-office365-filtering-correlation-id: d81c9e8a-3c18-4fe8-0d3e-08de88c56dc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|376014|366016|8096899003|13003099007|921020|38070700021|22082099003|56012099003|18002099003|7053199007;
x-microsoft-antispam-message-info: Hujgy5bkzKfVmBiaa+EbeFjfagwaQn/BT9yrAIqGdRxxWzmkl/hhl1n/RyRtpViN/YjU0Gs7HMRtiChDKmMui41kqby23XNkgbtSIE5+kc81d/CI5q7K6vsOYYIVmfsU5NxwCEuGXibZbmrKNr3Os6oPQuGsg3TAukG4WxU6MQ4NBlBvgI9nbcAfgxwMwdZ0q+/d/Q1pBVOnaz5Rh68jBxURwMFZ2oU+048dgmtZ/rT6JUJgJlzbtF5PU0DqVUus1B7JYyuMLMlctxfyY5EVk1jYQKt8GAN5qE+eCY3rTjhrt/vD7PD6ORI2ANPuUE/Cex3RjA92b1bb+nyxgJ4ZRKlqpf2hmS9Xc5N7gP4Voi4OyIBO7DZ8wXo4MhfXTCxk97En7y+LEZL2sAU21dczH2/llXzKH/mBT24zmH4yzJKKFgJiPDixI1/n6Ba3UHmf/xQ+xMlEOx1V3M9K+4Np0AlRbyYHtume6+F0zLsaVzNHwkwJOoVZjeHv38LetAElpJJ/u2YCHKgtdHg4xutOH2MkpWNj2dkV/2lqt2efcCfQvCpCCZW65EUdY6imVjYcBn38pUhsCB66LtZvRE9HR7YFAV3l9niaOvpVFlQDySU/qGPgD9ATkr6RLqSiHXB5c4d9WW+pVXSzR41nHA/4TG7R74HWF5RaMinkeifEG1lC/lLOkP6TwcFk7pGRQNi/4pVzNfBpZS7Aw20m06Fr/Dm/5puENscHbfWRvZ7FiMesk3MtURbMDCnfqHEQGa56
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR10MB8197.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(8096899003)(13003099007)(921020)(38070700021)(22082099003)(56012099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aC6MrqDRNJluiJoB440RSmjvj9hhZ6tg66AKwkFtGkMHW1Br2yAR6bJsa2Y0?=
 =?us-ascii?Q?2kx392lojrbNDqwqXGZ2G2PM3OnoTlmuqlKlwW+/hksJESYONnXsMzw6DcuN?=
 =?us-ascii?Q?SvzxGIhFlK0q3WGBlC+aUKtVKNtEuOX64IeRYQ1HyvB60LXkBVdvj8Y8oyXq?=
 =?us-ascii?Q?x8FEycuaDJqbk8lA3iTnuLCjvMZA5seT9nqivZtus6ZDjwbB6lW9ICBb8oW8?=
 =?us-ascii?Q?ZWe1zh4ENb5QJcIbOuZ/BlS/yZXeBhAb9U+5vE0t+wu2nIIOgyTsyEoMx9rd?=
 =?us-ascii?Q?m/Hzp9IvmD07ZvRCcYDI9lOr7VhRITDmfZizZm0MxQe8JBDXIR95N/yWtX6V?=
 =?us-ascii?Q?fQXbn21yA79+XtuHI5SDqkPXd4GT3kuMIO5NiXeRwf65kYbFQGqDIqQ8Zawd?=
 =?us-ascii?Q?5izxsKwUfPAcJZ/8OzBQgLnn9Vb9RPrV3dtW/y44TkdDCmqwjCOkc5MkvsWS?=
 =?us-ascii?Q?tv1cQoTq9AbViX5c969+T0fBQxeq0MmjsRIi+0amR318FK8xj98ifE2JJ96v?=
 =?us-ascii?Q?lrByvh7WZIZl5tFaiaM7LZT5hrksUNZyAq5C3dyqIaphZqp9GciqXHfAePxd?=
 =?us-ascii?Q?uf2MLxUXJj91l2UzIqD4j7MnCmEI5SB8/I8Yjrf09g7mNFXGojmtBuZtCkrI?=
 =?us-ascii?Q?RuV6xm0qvgvBnLeuMeIajIgFPR12iKGdmR1/cySEAett2v5Hqz7b7AlzY50p?=
 =?us-ascii?Q?E/olxD2+1W6riScCH1zsEUO5ti9g31w3eS8nudvjmOVUQZREYaOLjRk0Dcpv?=
 =?us-ascii?Q?HtjxKIYmG068iHeNN5OCsPb0uIDwHtO1bAyLj9ZTlGT8TA9LLOY91vrsdIMo?=
 =?us-ascii?Q?lGEmrpGC8tdoupMifWTgoCcAhZlz6lQj1BojD4yI5SJIkLIeMKLZgUml8oWP?=
 =?us-ascii?Q?/1nCY128jKBqGlZakqFU28lvp+yCar75qBOcCW+DyrexvE0gv3TnCVtpvLTZ?=
 =?us-ascii?Q?31kY6mPaZpq7ppuIE9yypUiCrY87nHZ+XHfDTQnW+VO+Rui5CqMqsDW9C4Mx?=
 =?us-ascii?Q?268ZQ4AZH86h75jcUd7lGEeY9zAhm8lGhCkSy1DIo2xwCNOOzQDknNcWcgk6?=
 =?us-ascii?Q?amu1yjVuc69KSziK37yX4jvtLCIcZIQCLFHHmHSgysx5fBkPx8aOU7KYtdw8?=
 =?us-ascii?Q?haeKv0c1bMMFG58W6/jtGHiW5NdoAay8/Ah0iH4OjM7rihI3JqO119fe1ib/?=
 =?us-ascii?Q?0A98MEVofhRWoIACRjcChQGNcZxzyYRi5D31t+zFztX5HdKNKW6BQ09xtzZo?=
 =?us-ascii?Q?B2vx0KwjqdMXxOU6GOjt4n0Ex2zkdr196YLZVyePI0s2ERg2ilmzw9u9F58v?=
 =?us-ascii?Q?h4gLIQWVu7aexqkQ6P4gEtBYrqVb4PNX7RI2qoQafeQ4yydKYdwDXj3WFdKF?=
 =?us-ascii?Q?MfmlXmr3gQUnD2rQW4BsjmyyEuZvhN4nzDpU/F89w67oij8oHD3TMglrlv8h?=
 =?us-ascii?Q?+jjdCJIbZzkkjT0oUy09z/qJKYctHLOa07AMECDKvgmZiTl/fA2c0KZixxCG?=
 =?us-ascii?Q?IJ10cQJprCGM8UyorjC9RbDmSgZYJfae6FgX8lHtjCAMeJ3ILDLr5NHJMnbM?=
 =?us-ascii?Q?bEw6gKKhvH5Ipb/B41R6mAP3Ew44qTTm6Jewk0omCL3UCQMYKd6SzGNE6Vpc?=
 =?us-ascii?Q?Dxa1wd60Ha9IZLZJPU/ZrHCdeo5fxgi5T8DRZ/B+YwO7bkmG/ynCdHvV6Q3n?=
 =?us-ascii?Q?CuqC5jKs3aZjl5PS7CwggmhKS5TP/86edtoafJwEGAfEyfv3osp9u+jb8o/z?=
 =?us-ascii?Q?CqRvUYvXqw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXPR10MB8197.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d81c9e8a-3c18-4fe8-0d3e-08de88c56dc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 10:17:46.4441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1SRMOOhmjWfSUMBNKtZS49S0orglOFrJeKPwdOTF1Et3Ua0ZvJRyfD/bv8mjnuFHgUmNc/42v2c1amPFZPUrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6540
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:35:52 +0000
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] Sashiko: AI code review on Linux Kernel Mailing
	List
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
Content-Type: multipart/mixed; boundary="===============8856856052268226778=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.49 / 15.00];
	DMARC_POLICY_REJECT(2.00)[st.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ST.COM:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:antonio.borneo@st.com,m:denis.humeau@st.com,m:olivier.morchipont@st.com,m:arnaud.rosay@st.com,m:francois.choleau@st.com,m:amelie.delaunay@st.com,m:christophe.kerello@st.com,m:christophe.roullier@st.com,m:fabrice.gasnier@st.com,m:alain.volmat@st.com,m:olivier.moysan@st.com,m:hugues.fruchet@st.com,m:yannick.fertre@st.com,m:philippe.cornu@st.com,m:arnaud.pouliquen@st.com,m:gabriel.fernandez@st.com,m:patrice.chotard@st.com,m:thomas.bourgoin@st.com,m:maxime.mere@st.com,m:christophe.priouzeau@st.com,m:patrick.delaunay@st.com,m:yann.gautier@st.com,m:jean-philippe.romain@st.com,m:valentin.caron@st.com,m:alexandre.torgue@st.com,m:nicolas.le.bayon@st.com,m:michel.jaouen@st.com,m:ludovic.barre@st.com,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.bruel@st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ST.COM:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.047];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[christian.bruel@st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: EA6B42F0330
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============8856856052268226778==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_GVXPR10MB8197E9AEE2968A63EF26B0AA814BAGVXPR10MB8197EURP_"

--_000_GVXPR10MB8197E9AEE2968A63EF26B0AA814BAGVXPR10MB8197EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Merci Antonio,

L'outil vient de me sortir une analyse sur un corner case (Sashiko<https://=
sashiko.dev/#/patchset/20260323-skip-bar_subrange-tests-if-enospc-v2-0-2080=
f878134d%40foss.st.com>), c'est assez impressionnant effectivement !

Christian



ST Restricted
From: Antonio BORNEO <antonio.borneo@st.com>
Sent: Monday, March 23, 2026 9:46 AM
To: Denis HUMEAU <denis.humeau@st.com>; Olivier MORCHIPONT <olivier.morchip=
ont@st.com>; Arnaud ROSAY <arnaud.rosay@st.com>; Francois CHOLEAU <francois=
.choleau@st.com>; Amelie DELAUNAY <amelie.delaunay@st.com>; Antonio BORNEO =
<antonio.borneo@st.com>; Christophe KERELLO <christophe.kerello@st.com>; Ch=
ristophe ROULLIER <christophe.roullier@st.com>; Fabrice GASNIER <fabrice.ga=
snier@st.com>; Alain VOLMAT <alain.volmat@st.com>; Olivier MOYSAN <olivier.=
moysan@st.com>; Hugues FRUCHET <hugues.fruchet@st.com>; Yannick FERTRE <yan=
nick.fertre@st.com>; Philippe CORNU <philippe.cornu@st.com>; Arnaud POULIQU=
EN <arnaud.pouliquen@st.com>; Christian BRUEL <christian.bruel@st.com>; Gab=
riel FERNANDEZ <gabriel.fernandez@st.com>; Patrice CHOTARD <patrice.chotard=
@st.com>; Thomas BOURGOIN <thomas.bourgoin@st.com>; Maxime MERE <maxime.mer=
e@st.com>; Christophe PRIOUZEAU <christophe.priouzeau@st.com>; Patrick DELA=
UNAY <patrick.delaunay@st.com>; Yann GAUTIER <yann.gautier@st.com>; Jean-ph=
ilippe ROMAIN <jean-philippe.romain@st.com>; Valentin CARON <valentin.caron=
@st.com>; Alexandre TORGUE <alexandre.torgue@st.com>; Nicolas LE BAYON <nic=
olas.le.bayon@st.com>; Thomas BOURGOIN <thomas.bourgoin@st.com>; Maxime MER=
E <maxime.mere@st.com>; Michel JAOUEN <michel.jaouen@st.com>; Ludovic BARRE=
 <ludovic.barre@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Sashiko: AI code review on Linux Kernel Mailing List

Mid last week, the Linux Foundation, in cooperation with Google, has deploy=
ed an AI bot to review the SW patches sent on the Linux Kernel Mailing List=
.
The bot has already triggered three ST patches from me [1], Arnaud [2] and =
Christian [3] (Christian has just sent a V2, still pending for review).

The bot still misses the module to reply to the mailing list, so the review=
s are today only accessible through the website http://sashiko.dev/
You can search for your name or for the whole ST community "foss.st.com"

Click on the logo on http://sashiko.dev/ to have some info on the project, =
or read the initial info on
https://www.phoronix.com/news/Sashiko-Linux-AI-Code-Review
and the improvement on Rust kernel code on
https://www.phoronix.com/news/Sashiko-AI-Reviewing-Rust-Linux

The announcement on Linkedin
https://www.linkedin.com/posts/roman-gushchin-1a95658_im-happy-to-share-the=
-project-i-was-working-activity-7439736656360005632-M-cb/
reports that Sashiko can be deployed locally.
I think it's a good tool to be integrated in ST gerrit for internal code re=
view.
No idea if it can be used effectively for code other than Linux Kernel.

[1] http://sashiko.dev/#/patchset/20260314170142.18290-1-antonio.borneo%40f=
oss.st.com
[2] http://sashiko.dev/#/patchset/20260317180329.1207625-1-arnaud.pouliquen=
%40foss.st.com
[3] http://sashiko.dev/#/patchset/20260323-skip-bar_subrange-tests-if-enosp=
c-v2-0-2080f878134d%40foss.st.com

Regards,
Antonio


ST Restricted

--_000_GVXPR10MB8197E9AEE2968A63EF26B0AA814BAGVXPR10MB8197EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:#002052;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#002052">Merci Antonio,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#002052"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:10.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#002052">L&#8217;outil vient de me s=
ortir une analyse sur un corner case (</span><a href=3D"https://sashiko.dev=
/#/patchset/20260323-skip-bar_subrange-tests-if-enospc-v2-0-2080f878134d%40=
foss.st.com"><span lang=3D"FR">Sashiko</span></a><span lang=3D"FR">)</span>=
<span lang=3D"FR" style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,s=
ans-serif;color:#002052">,
 c&#8217;est assez impressionnant&nbsp;effectivement !<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:10.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#002052">&nbsp;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal">Christian<span lang=3D"FR" style=3D"font-size:10.0pt=
;font-family:&quot;Arial&quot;,sans-serif;color:#002052"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"FR" style=3D"font-size:10.0pt;font-fam=
ily:&quot;Arial&quot;,sans-serif;color:#002052"><o:p>&nbsp;</o:p></span></p=
>
<div><br>
<p style=3D"font-family:Arial;font-size:12pt;color:#FF0000;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Right">
ST Restricted<br>
</p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span style=3D"font-si=
ze:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span=
 style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> Ant=
onio BORNEO &lt;antonio.borneo@st.com&gt;
<br>
<b>Sent:</b> Monday, March 23, 2026 9:46 AM<br>
<b>To:</b> Denis HUMEAU &lt;denis.humeau@st.com&gt;; Olivier MORCHIPONT &lt=
;olivier.morchipont@st.com&gt;; Arnaud ROSAY &lt;arnaud.rosay@st.com&gt;; F=
rancois CHOLEAU &lt;francois.choleau@st.com&gt;; Amelie DELAUNAY &lt;amelie=
.delaunay@st.com&gt;; Antonio BORNEO &lt;antonio.borneo@st.com&gt;;
 Christophe KERELLO &lt;christophe.kerello@st.com&gt;; Christophe ROULLIER =
&lt;christophe.roullier@st.com&gt;; Fabrice GASNIER &lt;fabrice.gasnier@st.=
com&gt;; Alain VOLMAT &lt;alain.volmat@st.com&gt;; Olivier MOYSAN &lt;olivi=
er.moysan@st.com&gt;; Hugues FRUCHET &lt;hugues.fruchet@st.com&gt;;
 Yannick FERTRE &lt;yannick.fertre@st.com&gt;; Philippe CORNU &lt;philippe.=
cornu@st.com&gt;; Arnaud POULIQUEN &lt;arnaud.pouliquen@st.com&gt;; Christi=
an BRUEL &lt;christian.bruel@st.com&gt;; Gabriel FERNANDEZ &lt;gabriel.fern=
andez@st.com&gt;; Patrice CHOTARD &lt;patrice.chotard@st.com&gt;; Thomas
 BOURGOIN &lt;thomas.bourgoin@st.com&gt;; Maxime MERE &lt;maxime.mere@st.co=
m&gt;; Christophe PRIOUZEAU &lt;christophe.priouzeau@st.com&gt;; Patrick DE=
LAUNAY &lt;patrick.delaunay@st.com&gt;; Yann GAUTIER &lt;yann.gautier@st.co=
m&gt;; Jean-philippe ROMAIN &lt;jean-philippe.romain@st.com&gt;; Valentin
 CARON &lt;valentin.caron@st.com&gt;; Alexandre TORGUE &lt;alexandre.torgue=
@st.com&gt;; Nicolas LE BAYON &lt;nicolas.le.bayon@st.com&gt;; Thomas BOURG=
OIN &lt;thomas.bourgoin@st.com&gt;; Maxime MERE &lt;maxime.mere@st.com&gt;;=
 Michel JAOUEN &lt;michel.jaouen@st.com&gt;; Ludovic BARRE &lt;ludovic.barr=
e@st.com&gt;<br>
<b>Cc:</b> linux-stm32@st-md-mailman.stormreply.com<br>
<b>Subject:</b> Sashiko: AI code review on Linux Kernel Mailing List<o:p></=
o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">Mid last week, the Linux Foundation, in cooperation with Google, has dep=
loyed an AI bot to review the SW patches sent on the Linux Kernel Mailing L=
ist.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">The bot has already triggered three ST patches from me [1], Arnaud [2] a=
nd Christian [3] (Christian has just sent a V2, still pending for review).<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">The bot still misses the module to reply to the mailing list, so the rev=
iews are today only accessible through the website
</span><span style=3D"color:#2E3436"><a href=3D"http://sashiko.dev/"><span =
style=3D"color:#2E3436">http://sashiko.dev/</span></a></span><span style=3D=
"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">You can search for your name or for the whole ST community &quot;foss.st=
.com&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">Click on the logo on
</span><span style=3D"color:#2E3436"><a href=3D"http://sashiko.dev/"><span =
style=3D"color:#2E3436">http://sashiko.dev/</span></a></span><span style=3D=
"color:black">&nbsp;to have some info on the project, or read the initial i=
nfo on<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:#2E3=
436"><a href=3D"https://www.phoronix.com/news/Sashiko-Linux-AI-Code-Review"=
><span style=3D"color:#2E3436">https://www.phoronix.com/news/Sashiko-Linux-=
AI-Code-Review</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">and the improvement on Rust kernel code on<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:#2E3=
436"><a href=3D"https://www.phoronix.com/news/Sashiko-AI-Reviewing-Rust-Lin=
ux"><span style=3D"color:#2E3436">https://www.phoronix.com/news/Sashiko-AI-=
Reviewing-Rust-Linux</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">The announcement on Linkedin<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:#2E3=
436"><a href=3D"https://www.linkedin.com/posts/roman-gushchin-1a95658_im-ha=
ppy-to-share-the-project-i-was-working-activity-7439736656360005632-M-cb/">=
<span style=3D"color:#2E3436">https://www.linkedin.com/posts/roman-gushchin=
-1a95658_im-happy-to-share-the-project-i-was-working-activity-7439736656360=
005632-M-cb/</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">reports that Sashiko can be deployed locally.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">I think it's a good tool to be integrated in ST gerrit for internal code=
 review.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">No idea if it can be used effectively for code other than Linux Kernel.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">[1] </span>
<span style=3D"color:#2E3436"><a href=3D"http://sashiko.dev/#/patchset/2026=
0314170142.18290-1-antonio.borneo%40foss.st.com"><span style=3D"color:#2E34=
36">http://sashiko.dev/#/patchset/20260314170142.18290-1-antonio.borneo%40f=
oss.st.com</span></a></span><span style=3D"color:black"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">[2] </span>
<span style=3D"color:#2E3436"><a href=3D"http://sashiko.dev/#/patchset/2026=
0317180329.1207625-1-arnaud.pouliquen%40foss.st.com"><span style=3D"color:#=
2E3436">http://sashiko.dev/#/patchset/20260317180329.1207625-1-arnaud.pouli=
quen%40foss.st.com</span></a></span><span style=3D"color:black"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">[3] </span>
<span style=3D"color:#2E3436"><a href=3D"http://sashiko.dev/#/patchset/2026=
0323-skip-bar_subrange-tests-if-enospc-v2-0-2080f878134d%40foss.st.com"><sp=
an style=3D"color:#2E3436">http://sashiko.dev/#/patchset/20260323-skip-bar_=
subrange-tests-if-enospc-v2-0-2080f878134d%40foss.st.com</span></a></span><=
span style=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k">Antonio<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"color:blac=
k"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><o:p>&nbsp;</o:p></p>
<div style=3D"margin-left:5.0pt">
<p class=3D"MsoNormal" align=3D"right" style=3D"margin-left:.5in;text-align=
:right"><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:red=
">ST Restricted<o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_GVXPR10MB8197E9AEE2968A63EF26B0AA814BAGVXPR10MB8197EURP_--

--===============8856856052268226778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8856856052268226778==--
