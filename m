Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8uzCMEuImpNTgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 04:04:49 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4564495C
	for <lists+linux-stm32@lfdr.de>; Fri, 05 Jun 2026 04:04:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=altera.com header.s=selector2 header.b=os+J9goy;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=altera.com (policy=reject);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CD72C8F273;
	Fri,  5 Jun 2026 02:04:48 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010020.outbound.protection.outlook.com
 [40.93.198.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49F12C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 02:04:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC0Z2cocCUyXOIQpDZA+BWJK7ZY+y1A9D1XYL8y4JHELZC1DhrqPNX9YoHq1riSrmU5Zylzgvf+rTdex+LkVr9ihDpnHh8uxNwdKBpJY0vfFyhTY90OP/ZjwSNBRSm74u9R8maw0SQur55OrMjnlPeVxYAY42hZ/DBRd4d66yWlili5lw9uQ3TLPKjn0FzBQ5vc2tFDFBsv/qc+oDbbqtzEJmvai1Wwk437wWpJWtpz1vJr1KqHLql4D/ociodemJcEMi+DP67b1WY1JrljKOWX4Oz1LDAG//tvre8rXDXtemVNzR1LsKBAMiK7j0yk57M440H50w9dgyF68ynKilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBzMLZKku5HL+q5vUuAgVCyMjQv3/tfyYgT3s8gphBM=;
 b=vbUa52FP1zfMy6jSeDQOKLxIKiY4maHWrR+mbK5H8kaM07ZK2hVIM3UECQfEmUXGRKHr/BE8M3xkrAe75JTa/R+E4oKgvQbiAW13Hbj3Fp9FeEayiv09JVhzfLf6ETdfY+0sA+8Tb73Y1wu1j7eHZuVAKG3/TsP+s1rQPILpJ3okG1KECgfzDWJcvDb2RPNiNkisdlLNARQvJ9mRcqxTeNeW2EfYJ8KlG+jGpfUB1FoYsa+bg9dbAbleOp/uKoCPzQpjPHhOgelO3SBP9pXPCdXv/cbYPqcoSRwVeauTiJQ29w67nTXAGcwKgRP9bW4s1Ws0SmOdwMjGcCpxXovk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBzMLZKku5HL+q5vUuAgVCyMjQv3/tfyYgT3s8gphBM=;
 b=os+J9goy+Vreo83cjwh9c1lbQnDrRjQGdXUhvYtVCdzCJtdev20bnS796iMVVKvLPYKPJ/7AoSXM3Z2PeiuUwYqW+6eiNthl2VisEprnGb6Ky8HCQ8Vq4lzOyM9EdaL+fGZFLPdpoUnjGxj+Y4t6ElLXIaVTryVqu8LTxFcQH0T40WjOA1f0U974j7xO7tKnCLMwR9nPe5xQ3q9x8CSV7Kx/wAHdS2tFlkbFDFP4W6nc9DpqjeX2S/V7EWCj3y0llapLohwuujf9oDmBz6LvC5h8Xot0WCrY3nA9pAM9Wm8VNKU3fh1e8HjOyBfL6jxLLzQ405UCfmp3dRYUNTw7Ew==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 02:04:43 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Fri, 5 Jun 2026
 02:04:42 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH] net: stmmac: xgmac: report L3/L4 filter match count in
 ethtool stats
Thread-Index: AQHc8/xs8lKIhzRBZEySaP8kNuOik7YuyT2AgABuI4A=
Date: Fri, 5 Jun 2026 02:04:42 +0000
Message-ID: <ed1ead6c-0505-4e56-97e3-b8e32e3e8e2b@altera.com>
References: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <5e912b43-7c06-4d04-9ba0-8f929150429c@lunn.ch>
In-Reply-To: <5e912b43-7c06-4d04-9ba0-8f929150429c@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|BY1PR03MB7996:EE_
x-ms-office365-filtering-correlation-id: 8de5d91f-579e-49e2-1af2-08dec2a6cf1c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021|22082099003|18002099003|55112099003|6133799003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: r9BWqEkhM09vMLlB1r6CddScTXA/Dx1PkkOvol77RDlSxN2q1tFZ9ixsGj1YEL32J8bWnMzlhpP0NvtE2NLH3M9P/UKB85FNDe+wbjPBkWi+hQKd88/PzxqSaLO4h6M4z5Ll43iIDbUpwKkX08QtsK6wpuN+i+L5l/PppxXenoDzAzYV5lK7V2Jq1r9++GEvwgfdhQzW3xO4CJvLAs4Ll/PNcdR3NCTroobaw5ZTbPQDUzErGvsVrSjSW5/G9C8gAbg7lqKk06ec3Rl4MEQtszs3svOoh4smlsJQ/mh0r6NS79DbWBRhLvwEQ0mjjFCSx7KEAogaXIsFwlV4OLT2CYAYKiiLXDWi/pe1UL7zC/Dql2H+RhZDzVhg6hgLFI3RcauJ2TSWd9wMu8H0BI0HSjQCjspFo9REQpVTFk1hsON2KhCBFL9rrkuVHgDCbntfiKuNTTmUWtPAhNAWkSLS0n/6yf5sqVtQ/3OELOLAnzI9HCqhGeQtJ5l7MGxx5XZT+4er4LiKymLuCZOyq8h6ADd+S27vxS3oNzQ2rmk2dh8YKhHcdGNFVan+t5hyXvKEtudXj33FG+vvKQ7nmVTXtJGiY2qutKRtkPtWAgEd98IC/DG7qVKbIR9tulpd1XZdVSQdCVVBPesLHtnQSOn9hmrPqgPL0T8LVvG6Fz/qSqJA4ih0G9ZJfl0Pv5fvjjeRtZZrmfBBbb4nE/lwMf2xuFfQQSjd6W2lQ2jwxrNM5/7FZkcVua3JwymXxRBIdl9P
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(55112099003)(6133799003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2F0SFMxMjNYdW53NWJlbWJFZDBGYWR5bjBYb2hhTTdHU0RDN1FUTGlSUDVz?=
 =?utf-8?B?TjlNUlJvaTdnNFNNNjlpelpidVE0bUQrUWFtbC9tSXl5T3gwOHJYdThMcU9m?=
 =?utf-8?B?bFpGbHVLRXA0cys2bU9QM2FzU3ZKOXFhazJEd0dGNlp0clRPUGw2Y2dOMFpa?=
 =?utf-8?B?VVQ0aXB1RlBWeWxBNFI2NUh2OFRXMnRDRUxsL2F0Nng1RWFCNU5EVTVqbFRL?=
 =?utf-8?B?cGpTNkJXVXdKa1RhQkdxN2ZyUDhPQ0RFQ2ZvNi9zZnFDRG9RSE56RGM5MnRQ?=
 =?utf-8?B?UHNudUJQZ0tLWWxjNUpFQStjV3V3Q0xJVkh0cU0xcUZuaGVqTzJjaTJiS0o0?=
 =?utf-8?B?RmhNKzNrZy9yMVVlREQ4L0Y2UVpjOGErb25Sd2RmZU9RTk1KTUppOE9SbUZB?=
 =?utf-8?B?azRaQ3ZJTHRsUFZCWFM3d2ovbmlQZUlucXdIL08vUEg5cUJHMVFTOGRQbXF1?=
 =?utf-8?B?bUFoYzYwa3dieGF2REVJRjlaSTVZVzlqMWEvS2Z1RWZuRHB5TENsMk9TQ3RL?=
 =?utf-8?B?YzlHVFovcFh6VVpXNHd3SXdYdlNVcndQWndEbEJFZ2RIQ0FCZWZOOEs4aTF6?=
 =?utf-8?B?bm01bnhTbFkzMDQ2aGZIR3o4RnFCQjhKdzBOTWtKNVU2RWxybFRJMEx0aVlW?=
 =?utf-8?B?dTB4ZVl0RTdRYmZCSit0UjhlZ016Z2xEL3JlRkRIS3hTVVRFaHg5SGFNZWxV?=
 =?utf-8?B?VXgrZklISUF0WitNcGRnSG5lbW1yMzU3M2VLUzk2VGc1RTFOV0lKQkVLRUE2?=
 =?utf-8?B?cWVjdVFKMTA4RGdlTUQzdmFraTFKNnZzSWlQYUxZTTZNa1VRL0VMODNza3Qw?=
 =?utf-8?B?VzdZVmRmeGREd2lPME5QeXoxUGdaSjJXazI2Q09RdU43NzQ4amdaS0ZvTjJW?=
 =?utf-8?B?aGE3NXdWSDJDbHJaM3Y5VnIyZjlpT2pUVDR5T3NyaDlVWFE5TTlrejhaSDZj?=
 =?utf-8?B?RjdTak04ZFdHUUtzOTdPUzF5c3lLMFd2T00wY1gzSG9ielQ3Qk5ScmxHVDdi?=
 =?utf-8?B?UHhORDBWZTk4bEx6V0RwaGRGWUErbjZCL3JMaUJoaXdDVjEzU0JRVGFHa21I?=
 =?utf-8?B?QmVDVktqYlIvNG8yb1U1Q0pIck9hN0FOMlJWTFpFQ0l2NUhoOUJqdWdRc1py?=
 =?utf-8?B?VG5LcTcyU2oyZU1qSGFrbmp5cEFPemErSEpaSk1KR2FKVTNHY2NrRnFGeE54?=
 =?utf-8?B?WENVcW1id0Z2ZW5GMFdieHMyV3dQYjRBVkRyaXN6YXE2cWNyV2diazhFOEs2?=
 =?utf-8?B?L1JjTmNOK25xczUya3JCWHBKMW0xRHJxcjgyRVlwcmREOWozU2VGYW5KMW1h?=
 =?utf-8?B?Z2xvellQdDhIT1ZmNEZHM1ZkWng5Z3phbGFXY1lQU2N2TGV2K2JPZlVrM1pH?=
 =?utf-8?B?WXlqNzBYY1I2Nzg1YnNYVjNWRk5TaXI4a2RsOXF0VU1sYWdzMFFoejJ3Y241?=
 =?utf-8?B?aE41bVRpRW5NVEN3M3J0UXFKYlBKcHF0K1gxWnJKTVhpblBjdFhjdUNkbTBZ?=
 =?utf-8?B?bVR3UFZDWUJXNGdNbjZSSmVnRXBtK0UwZHZUcGFTUzNsclROSjRNazlBVEls?=
 =?utf-8?B?KzIyaVBObk5JWW1FUys4dHBNdzhHMlloWFZYNm1SM0hVUmtUc3NYaXFXcHNr?=
 =?utf-8?B?ekhQdU1hcjNSTDJ5QUFNZDRPSlNmSEx0cXhLL1pQeWtnQ1p5UFpFY2szbThx?=
 =?utf-8?B?eWNlRmVPY1pFYzU0UW9ZYVZDaFBZZXI5bWJRdVdDdFBGRDAvb1grMDBQNE9S?=
 =?utf-8?B?QVg4KzBNU2FDOXBCcG91NnpDSVdBZTNvaFQ4Y2Z6NVR3K2tDWjUwYnIvWjdN?=
 =?utf-8?B?K2JvSlFRbElZS2ZiVUtncHAwRE1YUjVUait2SG1Uc09FQ2dIYzMwcUtBSFZG?=
 =?utf-8?B?M1JKN0tuaTFheGVibW5NTHF1N2c1Z2dwTm5sWlMyZGhzSjlDVXVScjJQNjQ5?=
 =?utf-8?B?SjVVWTFpMHBXYmJBOFNEKzU2ZEcxa0s0MndmSkJGVVo0aXZ2MGIxZjJ5UElJ?=
 =?utf-8?B?Q0srd0J0cW4xZlFMd0xWNkd2NGJ4ZWxTN0dWTGYzZzdwd0tablRvWnozcTJW?=
 =?utf-8?B?U1pEQWloWTVRL3hxKzAyNVo3OGhKb2VUQmVyb0UzbXdHbG5UTFRORkVDdjN3?=
 =?utf-8?B?a1VKMlFKcWNKcENWeCtLcHk4OWU4bHgyajNiVEEzcjB0UGNQZmszbkRMa3F0?=
 =?utf-8?B?YTBlbm5PTnkwSnJEMitEdG5yL0tqVXh5RGY1TXFIbXduR2JJeUs3Uk0vQzRP?=
 =?utf-8?B?UjRRT0x1c0M5aGp2Vm1IQUhhcE1kWEg5WEIxRkE4eWR6WnQyMTRRMHVMMVdE?=
 =?utf-8?B?eGdmb3ZEV2pkRDBXempZMDlJaVpVY2R2ZWE2bE02WVVOU0MvOVZoYU5rSllW?=
 =?utf-8?Q?ghVIMip4L5x3abna+b0XXzQLahlTtbXPMGqFDJvyR1ls7?=
x-ms-exchange-antispam-messagedata-1: +H2on5ui+ZDXRtsOnCsjGE/ES4Wuolt8ldM=
Content-ID: <8336B2B84C9C6446A56FDEAAD4C67520@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de5d91f-579e-49e2-1af2-08dec2a6cf1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2026 02:04:42.7804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fz/z1V6O/behF5Kr9ylAq4CVAIgw88JO3fc5xQuXhgAds9TjHYCvErCDDzmei+YRfCbL5yf+XG7efrIOHIDwQD/ewXu/k2PlpYKFabNFI+WJSLPOMx3x8bSGTYsSvqZyhj5HShshK8B4nhcOaH4kZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7996
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "edumazet@google.com" <edumazet@google.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: xgmac: report L3/L4 filter
 match count in ethtool stats
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[altera.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[altera.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[altera.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altera.com:mid,altera.com:from_mime,altera.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2F4564495C
X-Spam: Yes

T24gNS82LzIwMjYgMzozMCBhbSwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+IE9uIFRodSwgSnVuIDA0
LCAyMDI2IGF0IDAxOjMwOjM3QU0gLTA3MDAsIG11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5h
c21hZGVAYWx0ZXJhLmNvbSB3cm90ZToNCj4+IEZyb206IE5hemltIEFtaXJ1bCA8bXVoYW1tYWQu
bmF6aW0uYW1pcnVsLm5hemxlLmFzbWFkZUBhbHRlcmEuY29tPg0KPj4NCj4+IFJlYWQgdGhlIEwz
Rk0gYW5kIEw0Rk0gYml0cyBmcm9tIHRoZSBSWCBkZXNjcmlwdG9yIHN0YXR1cyB3b3JkIChSREVT
MikNCj4+IGFuZCBpbmNyZW1lbnQgdGhlIGNvcnJlc3BvbmRpbmcgZXRodG9vbCBzdGF0aXN0aWNz
IGNvdW50ZXJzLiBUaGlzIGFsbG93cw0KPj4gdXNlcnMgdG8gb2JzZXJ2ZSBMMy9MNCBmaWx0ZXIg
aGl0IHJhdGVzIHZpYSBldGh0b29sIC1TLg0KPiANCj4gQXJlIHRoZXJlIGFueSBtb3JlIGJpdHMg
d2hpY2ggYXJlIG1pc3Npbmc/DQo+IA0KPiBkd21hYzQgaGFzIFJERVMyX0wzX0w0X0ZJTFRfTkJf
TUFUQ0hfTUFTSyBmb3IgZXhhbXBsZS4NCj4gDQo+ICAgICAgICAgQW5kcmV3DQpIaSBKYWt1Yiwg
QW5kcmV3DQoNClRoYW5rcyBmb3IgdGhlIHJldmlldyENCg0KVG8gcmVwbHkgb24gQW5kcmV3IHF1
ZXN0aW9uIC0gQXMgcGVyIHdoYXQgSSdtIHNlZWluZywgdGhlIFhHTUFDMiBSREVTMiANCm9ubHkg
ZGVmaW5lcyBMM0ZNIChiaXQgMjcpIGFuZCBMNEZNIChiaXQgMjgpIOKAlCB0aGVyZSBpcyBubyBG
SUxUX05CX01BVENIIA0KZXF1aXZhbGVudCBpbiB0aGUgWEdNQUMyIGRlc2NyaXB0b3IgbGF5b3V0
LCB1bmxpa2UgZHdtYWM0IHdoaWNoIGV4cG9zZXMgDQppdCB2aWEgUkRFUzIgYml0cyBbMjc6MjZd
LiBUaGlzIHBhdGNoIGNvdmVycyBhbGwgZmlsdGVyIG1hdGNoIGJpdHMgDQphdmFpbGFibGUgaW4g
WEdNQUMyIFJERVMyLg0KDQpCUiwNCk5hemltDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
