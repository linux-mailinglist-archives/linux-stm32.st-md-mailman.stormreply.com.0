Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 67DdKtACe2kyAgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 07:48:48 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3171AC518
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 07:48:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CA59C5663A;
	Thu, 29 Jan 2026 06:48:46 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87766C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 06:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9zsj7vjUkTar9bJZzPe6a6P69cEsj17eg9Du52DFyK2RsSnlkrEtw5HMyZHqghO7E/8MoplnLjX/lATrebZA41kVeDXnM0y7cris6gRtI9rCDaN7SmgFI1Ge2WPkLnaKWjjyJoTCqraQMnefxhMr8ykC7WCx4IPUhhd2Y2d2MCphjpdRqiMC2mQ3F8AeAwtWjiHIXilX73mLpin+VXRxh2f7/jWNTavG/FLV6p9pd9StbxsWSukqVupC/jeum5DYLpvNlVEk03QavDnxlBD2GwxTWfpr5zhxF6070tdys01AK0843UqgelF0c6eRVOwL//guxwQ1RRS+YT5pvXzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaXRApdqSHqXXXXtnOHwyd6RezSQV0hihkxO3a5k8hs=;
 b=vNAk3SmCRxi1x4m4EAZqfoSSOjhnWm1nE/8HVmw5UiaMpf2ETuGHQMMA3uFBEqkUE3XhKSTkmSszPH7cBMd9FztmPHeDCe2a7obdDn8FzGISyT7TxA2WGXKK6Q/2/696AI031F4oWNjkYS1z0fqTs9fv/23dXRWvyyz7AuqWgAwlCyx9tAn/ChW+Rdh5aChMfWIEzwnAbpb6kQ5kyJmI+iqVjTsf39eqg0uTNlJqyO8ErhAmCkn0EDT1PUOiemElw5ysRTrQV1EzbhW6n+GMxS2Uh5w1+l4k5c19UAWpsQobhN3O5DIi9h7M+nqOEjdWP4YYepC7W0BxGINV2Hi20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaXRApdqSHqXXXXtnOHwyd6RezSQV0hihkxO3a5k8hs=;
 b=gJd6tMcDIg+yCPMmDcV4gwU7+tkswCcGl25xZ2WqKgYuo8lGNFJ1h5AXp9g4HOA4tMAa0W8z25QkeCqMDzqtLFpX2HT8QxzpS2ivw8QqP/Wy0HuxODuluQrJyPrmWUsBRSLHDIYkhkADLsoYLZfswkJ48AqEh/r0zy20fKAYX7Q=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB16046.jpnprd01.prod.outlook.com (2603:1096:604:3e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 06:48:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 06:48:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
Thread-Topic: [PATCH net-next 0/8] Add support for Renesas RZ/G3L GBETH
Thread-Index: AQHckFXeT9XnpVduDU6nOeHDOSp+37Vn6tEAgADKOUA=
Date: Thu, 29 Jan 2026 06:48:39 +0000
Message-ID: <TY3PR01MB11346EE343BB8DAAD3DE1D0F1869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUgnVcwo3b=zQx0wVcH53dm6kBz3nQ5T0DZat4KxastuQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB16046:EE_
x-ms-office365-filtering-correlation-id: 8812216e-5696-4941-f92f-08de5f026f7a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bDFjUVBxSnR2cjgyOTNVd3JFbEVLME1UaWFycDZRcW1kNVdNeFQzcG5PMm03?=
 =?utf-8?B?aGx3Rjc4WG91N01tcUphRFkyVTFTdy9GTGErRGVHcDdDcjY2Nk13SGd5RkUx?=
 =?utf-8?B?djMyMWRmam8zcGJoU2NzSjBHLzNhcUhUSjJXS1cwak10VVdhS0sxSXhrZVZo?=
 =?utf-8?B?Z3djZmxMZEQ5YXJDd05tNEU0ME1oWFdtdnlSTVB3ejl4WmRvaTRNTHZlaVJi?=
 =?utf-8?B?N3RMeEdtb1NDcDVqUUtPRnJ4WU5QeU5sNlBQeFI5RGZ3NndreXQyeTJQUEMy?=
 =?utf-8?B?WkdKeTdMM3psejRGZmdaUU1INWlIMERNOWhPa0RyU21sdWlGWHBCKzhpUUVE?=
 =?utf-8?B?M2ErN0pva0pTZ3hjbEkzK2k0ZVo2YnYyV0lDQklwdTBTUmR2dW1RdGVtcWVQ?=
 =?utf-8?B?L1RPK3hvWUV5NmNhYkRUN1hGUGhjbk5QeG50OU1aVnUxb21USnEybGdLNzJJ?=
 =?utf-8?B?V1hzbW5pSHV5VU9ZYU1VejZLWUYvMHNmQlN1Sm9kWktMQ2t0NEtMMTFOcFJn?=
 =?utf-8?B?cUMwcktTYUZjcHJKRGpjUVBqNlhrWXgwQVVpVmhFMGY4SEtkWEZZcXhzWEw4?=
 =?utf-8?B?UzQ0NTc0ZWFCQmhRRVdGa2dOSCtBRVFEZnk1WGF1QTVwTVNtcDdabEtuNndH?=
 =?utf-8?B?Q0w5MjUvYUJkSjIxSGNTdllTOSs3VHF4V0psNENwQlBVR0hMU3RiSy9BRXd5?=
 =?utf-8?B?emR3eWhXNk5PSUM4b0RCOGp4eEVmc1lyQ2UzSkZTdnY3RnkrTkVIVzRTbHZt?=
 =?utf-8?B?K1hRQWlKVFdnYWF1Q2ZWZVc2c3lkRWVqamo0NFN5VW12V3NVOTIwVWRHNm5U?=
 =?utf-8?B?NWZ0WnpoOG5SRUF0SGxYeDZDL3ErTGRkeDZEV1VxS2ZqcXp0U3VIY0N6M242?=
 =?utf-8?B?RDArei82K3B3aU1rSUZsbElCTUk1blFGRVdhSHI0akJyLzZqSk50R2JrOE1R?=
 =?utf-8?B?blVhWjJTelVRSWRuY1kvM1NMVGZINkh5c254WEk1Q3pZQm1RQWpnSTRSUFpD?=
 =?utf-8?B?NGlsSEg3ZWNvOGFYWXF6OUxCa2JXSnp6a1BkOFFpUDloVEtZbXo3TEdJZ2px?=
 =?utf-8?B?NzdLVFVqSGJ6Y2JxVWxzTzNDNTdKazlaNjdpZ0srMXZTaXBoY0JGdkhuU2ZO?=
 =?utf-8?B?c0FpbEhBTUsxbWMyQ3NUOTdMSWNWUStaaUd4L0k2b0U4c203Q25LdktiejFN?=
 =?utf-8?B?WmN4elhIUEtpUE9XZDY5THhXVEdrTzlEdnJBYnZ3R1pEWWhwaHRzVGVvQVAr?=
 =?utf-8?B?dVl4Wjc2ZVJxZm5UbnY2ekp6UmIxR2dXZ2RkMUdFUEZWMTNodFlmS1JmbHhs?=
 =?utf-8?B?Q0hPSlBCK0cxMitYOVpQOWlLV01IMmppQ2J5cG1zWFBkSUNBUi9pWk9uUXNs?=
 =?utf-8?B?U2RpV3Nuejl2akQwbjkxVm1lNFBhTks3MjNCUE1oNS9xZ3dJTHB0djZmL2x2?=
 =?utf-8?B?ZWJnajNWR2JIT2k2Qi9EdUgrc2JpenJ0RWFXQ3dmcVBWelgyMTd3MkdSQm9F?=
 =?utf-8?B?bjh1N1k3WHRoa2ttUFpWcWU5WnFIWlhoMWY1WmVCZXpHSkJDRWFXVUlNaTZ6?=
 =?utf-8?B?a05wbnp2UjhIRkxwZ3VROUJjNEp2SW5YZTYrZEVJZzVDVlZpK2NTS2l0ZEhU?=
 =?utf-8?B?UUh3ZE9iK2cxdUdMSlZTc1Q1MXFzZ3lpRjd4dG40bktTb3BOSVdDQXBNWEs1?=
 =?utf-8?B?MU9KRkJMUnJDblBGaXgvdkZWbVJEWmoyS0JBUmpzRmtqZENSSUE1WGM1ZEVX?=
 =?utf-8?B?YTFJL0NrRkh6V3RYTWhRcWhvYk5YTFlQbWVwMnRCWUdSSk1LU0g1NW1MckVo?=
 =?utf-8?B?WFdRUUdtNlNQTFppbVlvN25EOGU2eVp0L2diRE9LMC9JTDlrMEdNaGIxZGE3?=
 =?utf-8?B?Y0h5cXgrRktRZG9KTXdpL0pDRUEybFVBbmJra1krY1p5dXBpcE1VR1dYdFZC?=
 =?utf-8?B?bDcwSElGL0tzUkkvYm1NS01ZdkdsTGFLOUxHd09USDZCOGllRzkvUnk3VnVQ?=
 =?utf-8?B?ckM0UFVSalFQR0ZzOUEvaEsyY21JZi91eHpWTEIvNWNDakQ4amtOQk1WNUVq?=
 =?utf-8?B?V3h1WG5Ka1FsR0Z5QnVzYXFaME9nK2xrdEpxenpvOWR1eXlRcmFwTTNrS3dV?=
 =?utf-8?B?RERXdnRDcDZNNHNBT2JOQnJ3RFJncUxuZXlDRHV6dkJqYTh1OTRkL0lZMDBO?=
 =?utf-8?Q?MEQc4cjUHPq297rA+VBICN8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3ZMUnBUZGZ6NkxxSWdVT1hmdGdhdFR4NWxRc3BPQkQxam1JdmpnT1NjWXdv?=
 =?utf-8?B?dGw3dFNQcmIyRU12L1l3RWszckhQaGphWTV1RFhsbHF1cXQ2WGNVMVk1MUdZ?=
 =?utf-8?B?by9LeEtHS2FkaG0xZ1BJM2RsSnZrcGdwWFN4d0ljbmhKS3VDZVdjMDdrbUtL?=
 =?utf-8?B?RGc2QVBWNnZuY1JTU2dDUjQzKzYzWU9nVnNFQ2xEdmJMaXRnWFZ4ZloyT1Rv?=
 =?utf-8?B?RlBqbmN4anZLelNvdG95MmlxRHNHN0JqQ0tOUGZ5cldFdFJGeGFVNlMrMVdu?=
 =?utf-8?B?dUEyVFFMeXNOaS9oYWNUbHpzbk56VDBZdGZVMHpsZysrSHlSV3ZBb2VXdGpv?=
 =?utf-8?B?Q24vTHNoMGxqVzVJWWl6QzJRZEE3U0dMM0dVblcrS2JsZXRsNTBZcGVGZHla?=
 =?utf-8?B?RzVCOVd3dHNiWTVhY0l3RytDcWYwN2d0SmQwN21KVGtkQ2tXODFKRnRETWVu?=
 =?utf-8?B?Yko3Zk1FMzNCR0xPa0Uwb2FLQnBBeEVxRDc5OU9zZy8zeEllWnBZT29TOUp3?=
 =?utf-8?B?eFNyQ2p5TXp2aS9kdTdROGkwSllrazlPVWxPTnU3YmE3OUdrdTFSc2ZiL0dm?=
 =?utf-8?B?ZjE2Syt0L25OR2N5a1kzTVhNL3oyTDZGRzA1OUpCR0p2cjR4UFlSbDQ0a3E1?=
 =?utf-8?B?K0NldTQ0SDQzWi9CdWgzNFNkdnc4d1oyNEpUWUE1SWJWeGowVjFZekJXR28r?=
 =?utf-8?B?U3F0Nm00bGdGTXRkRmU0STlxT3djQ2NVQzRlWHBmTk1YQm40Q0xKcEJMNkRw?=
 =?utf-8?B?OENqMzQxU1pxY01UQmcyNGs4NEE2VXRFWlFUYm1LZS8rcXJQRVBHVDBRcE1h?=
 =?utf-8?B?OVh1Q29pdjA5d1JOMkFNNDN2RFpUN2ZtTmNualJhMkNoVHh0R3RvMUVEa05v?=
 =?utf-8?B?WXdoZDQ4N1YxaFpNOWluRDdSYVVDVUluYko4RE4yMUJ3VFFUQmFOb1JKWlA5?=
 =?utf-8?B?QW94b2NZaTlyN2dwM0FGYWVYV1ZsdUNmeitSMytSb2dpV2xwbkRIMWFzT0hx?=
 =?utf-8?B?SkVIRlBzZDU3UUpNVXdJMkw5andYcUpTWTJRaEZHT0ZIUG5ZOHo2dUdKU3R2?=
 =?utf-8?B?VW0wZ2Z5SVplOUZkdkhZWHhLUEZMT2hLRDhxVWZFWTdKODBDNGxSUkkxNFk5?=
 =?utf-8?B?NE1NdFUrYmw2bURpaEs0RXJBdWUyYjQ4ZGJjRC9tdUxUdmJyVWVTRjM1UDg2?=
 =?utf-8?B?MUNtVGlCaUJOZ25YVFMyVXZTTUxUUUc5VGVQVVRnL05PbFVJUTJhZTV0dUY1?=
 =?utf-8?B?dkF6UUxJMC9zOFpMR2lQNjY0VVRIV3U1emlTNFNPYTdFOFl0SGVIZDJBUjZC?=
 =?utf-8?B?WkVvZ0tjWE95aW82ZURoR0t3djMyZVRGU0c1TldqL3NkWGpEWHRML2E5UnlQ?=
 =?utf-8?B?b3VvSi9oS2JtRFlxaDkzS3E4TE43NUxPVnlIT3VMcnIxaUZjNTZIcHdpTFZl?=
 =?utf-8?B?U2t0azRxcDY1eXlOTFp3K0YxVDdIZkx1ZmI0VSt2c0hGZnl4MHZza1pUd01J?=
 =?utf-8?B?SE9KWUovSU1qdnRhb0VqeTBFUmROR3QzL0Vla2U4WXVySjZmWTdSNkJjSWN4?=
 =?utf-8?B?QTdnVXhER0lvYU83VXA4a05ORGlkdzZHbFhreWZCZHpRbjdGeXZzNU1PbGJR?=
 =?utf-8?B?ZEx0UE5Cb0hjSTkwZWgxekhVeUFYYVBJUVFiZWQyd3UrQTd0MHdES2VLOTY2?=
 =?utf-8?B?VDVKTGpDdTB1cUdSNDZhVEVpMTBuQko0WVhRQlZ1MGN0b0F4VjlhcUR2S0hB?=
 =?utf-8?B?M05xdHBncXJPYmJHSXc1aDFMYUh5N3RlM2tsUEExR2dLaU1sSjk0bEoxZEYz?=
 =?utf-8?B?djYrcVVsZ2dpRmVzMjV4b0VxQTBOcFlUb0dWYno3MkplcGQ2bHJiT3VpZHhO?=
 =?utf-8?B?b1NvdmdJaDhtN2pKTHJHQnF6Q0JxMzZaYWk0UDkraGlzb2FEWE0yWmdrS0N0?=
 =?utf-8?B?KzMxZGZwUHZ4YlcyWjU5NG1CNmN3TGlGRUlBN0pCZ0VWWVBIUy81MHlES3Fn?=
 =?utf-8?B?bHU3U0pPWFB4RXpud21jbEdmUEQwMC96cmRWSG5IVkhYRVJVdndOSzlybmFF?=
 =?utf-8?B?c25nbGIwbmkwRkFGK2pmOHZyWjdmSGJEdkExeldqZjJmanVDVEtEMDZRcm5h?=
 =?utf-8?B?a2pORWFFci9uOWhxUXJ4Q0UwNWdUM05HWG1EQU50ZE9FejVEdmtiSk5aajdO?=
 =?utf-8?B?bmEzQklBS2dDRklmOS9Fd1FKT0JwcmVzeDZaaXc1dGlQTWhuZmthOE1lTDE0?=
 =?utf-8?B?Y2JCd0hMUkZ6Ty9xYzFKb3JWUE1VL29xakcvZVRVenMycjhuRSt6ZzBTOXBR?=
 =?utf-8?B?TkVHSDJSUTZUNmNTeFVCd3JlZnlRVzEybmhJd0xjeWNuSnU1VHNJdz09?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8812216e-5696-4941-f92f-08de5f026f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 06:48:39.7999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Xy8ao79WSlplcA1pAZtKEpSGgRFRTX6yB7Zd2hhfy91CQ9N3HENrJe5iLJjbTAiHgOoyuYl5r7z15aXiuWPLROkkMJuclPOj9lciL15ITQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16046
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 "magnus.damm" <magnus.damm@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] Add support for Renesas
	RZ/G3L GBETH
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:magnus.damm@gmail.com,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,google.com,st-md-mailman.stormreply.com,kernel.org,gmail.com,synopsys.com,redhat.com,vger.kernel.org,bp.renesas.com,st.com,lists.infradead.org,lunn.ch,davemloft.net];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: B3171AC518
X-Rspamd-Action: no action

Hi Geert,

Thanks for the feedback

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: 28 January 2026 18:42
> Subject: Re: [PATCH net-next 0/8] Add support for Renesas RZ/G3L GBETH
> 
> Hi Biju,
> 
> On Wed, 28 Jan 2026 at 13:58, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
> > compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.
> >
> > The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has
> > pps interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and
> > enable the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L
> > SMARC EVK. The eth1, pincontrol definitions and hotplug support will
> > be added later.
> >
> > Biju Das (8):
> >   dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
> >   net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
> >   clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
> >   clk: renesas: rzg2l: Add support for enabling PLLs
> >   clk: renesas: r8a08g046: Add support for PLL6 clk
> >   clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
> >   arm64: dts: renesas: r9a08g046: Add GBETH nodes
> >   arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH) interface
> 
> Thanks for your series!
> 
> Please don't include "net-next" tags in patches that are not meant to be applied to the net-next tree.

My bad, I will split net-next patches separate and send it as v2.

Cheers,
Biju

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
