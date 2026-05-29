Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAe6MJc2GWrzswgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 08:47:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B545FE1F8
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 08:47:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A053C8F291;
	Fri, 29 May 2026 06:47:51 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013017.outbound.protection.outlook.com
 [40.93.201.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81F74C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 06:47:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjXGXBuT12F0dFylL5TatzNaD22EB357Ah0M+o8yCPH3HWdaqbucqr/AuULbwMnaGuIlaphVu8pw0MJkLgwYHGlVPUlW8mnqPJDRIeKH/RThfgkX2kLLgaDitcwx6MzmR2a1waXkM4I756xSJKOjiZ6Tls7JmzqAIXqHN0q7LjZP1aBqJB0uq5kdNW7vD9KtvhGmbpVKKdOe6aEn6ShoDLiJCmn7ZL+qLfU/lqX3NaWOiHwF0wDBZGi/9iT5IFy3CqAuYfgjGduQxnq7ne2aYlBPw5GBc0H/HTtxHUKYjGwUpXrkIdEIp7j2Iq/gs/m/WmJ2zfgLPR/CWCNU3EBHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Q9c4+2Qr9Qcm0TcpMamRUBlAS7OF7joracS875CNOI=;
 b=GncsyPMK8xMCSixpLSN/hIjWS8w02LlaG1imd+iSd15LZ19BjOOkWvPnVTY9we6mnVDhAeQyG91A7LtpHQqprAk+GEcmjk4fXmN/7aKwdm8PL9NKZDyz9yb7L5i2HOc5nedsGUDgZJWl04E7gwWJbtacwcY3d8upsrwldIAk5DTkX7exIiZH1IhgpxLhDyXJqTPdm1FTOnGx6JFSVwvoVt96zkhIfZEgpY3KuA44sNyk/D8mcOIEMJ9NGc2c++QgL9scsu6GNaEqAJ3uW6CUGYWsLkRR72bjwzDx4LAVNlwh+rd2q9t/DFBE6p4L4Uxkzx6iYBfyVNhRfMuHETXWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Q9c4+2Qr9Qcm0TcpMamRUBlAS7OF7joracS875CNOI=;
 b=YvHbLU7Iqx7HKv17Gy6ZNda2WBccSRqj9uY4Ys8wLx/YFKS1sTG85AlCZ3Djo4S14YzRMFwq8ji6tI9hie3rMUzWIq/t5OZHQZHLdf+uvI0icpypSrpagO/y/mMH9/kThuoJRb2YoV9BzJ12TUcraZdNy54EESRqeGeuiCw/50f/SIe9aDllL81Ma72efr8VP5TB6wiKVMjumSOI278ADTkdn4PQwg2AZMZLOZjznJ2IsAT/lfPwPm99LG03D4ODKSb9Ue+jzWjTZCqjD6TSthyiyw/VFI8H4emLqZz94RxHckZyAKOCjGKedTpCok1eM+zQiqM4W4Xi0D1dEPL5iw==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by DS0PR03MB8200.namprd03.prod.outlook.com (2603:10b6:8:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 06:47:48 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 06:47:48 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH v2] net: stmmac: Improve Tx timer arm logic further
Thread-Index: AQHc7YFGyhadwxLyUUuvDyE+WpcKlLYir+wAgAHjMAA=
Date: Fri, 29 May 2026 06:47:48 +0000
Message-ID: <1175310d-5c8b-4a4e-a597-5acca4ec0db8@altera.com>
References: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <a0cdbac8-c7b2-4dc2-b08c-7fae99a73e93@lunn.ch>
In-Reply-To: <a0cdbac8-c7b2-4dc2-b08c-7fae99a73e93@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|DS0PR03MB8200:EE_
x-ms-office365-filtering-correlation-id: cee9e07c-7a14-4a0a-3485-08debd4e3277
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|38070700021|55112099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info: BAR13zUkPKNYdXhEaJySbl/le1fljYR6RPATwBlhK+UI2SjGf2/2jCYA8E+E0nrE4pBjyFMwJFx5ZNrpHYQA7102JOISY8K0qnq3mKQNbRu9EGT6kB35TeUEz1o+76OwgQ/rG7dFbXLi4kRgonAgKReKa0L8yKqaQ+qiR9uRwAnV/jeM1RXTyJZD5zTwi729WYPulK62U+Fm+5mDlwFu6iOJL44Yxt3KKD2DfWfg7NY6V7YjClnB31VCUj8XkIrAFdzjV+W2r7ZIoliy5IYAtZqzkOXbP2f8BkuqAnijEV0F7sehdTeoTmfYSUXSmyqw2JJiuyEQ/UTGvnM+dK7YevI4qACW5+EIigG8Xty/gOaBEuD12u5I+y6LTw2vpEqthelqPsGtNbmyYQMckDqhdmJWr0SmoRsYoRIVhkK1sR/W5DmBnzuSfix5gT75+vF1e7yoHBuzSY1yOwJjUAxmK8YaB4V7j7vEgLYkYiZeH34A59frupoYu2rKZXFdN0d094i4L/dF5hbtIL/lsfshMv7f3LXW22P+RUQKH2OdXW6fufR5ggeqvdCT+GWlVsoTk9pM+lgxB9XBX7I+GlIqHax/rJ2hwZJuP1HaCImmqlAcbMEuM5g3ZVaSjJF5hiXQkD2FcuMNEtkWNAKHP4i0LF95eUJwuTGve3RRtLBwDYivRkl2TsW4C3+6ImXa3qazpzwwQc03/ac/u5vsoXS6/rm1LLBhjE5dBNf+xAKdUu/ye99miwq/HBQsh29afCWm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(38070700021)(55112099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejhZV1FtRjlNNndWb3oweEdQL21oUi91VVJVdXlMS2cyN0Y1N3JDZlZzaWNq?=
 =?utf-8?B?ZWJ1RGh4cU0zUEwvMXNOWmR2R2NVTjFRL1E5UVIydmFRdlgvMG1vUmVveFdU?=
 =?utf-8?B?RkJsU3JNSHVlcmUvTzNPMzNYTW5ldWZiWlhlNGZvaDB1R1NrS3hRamhzZm85?=
 =?utf-8?B?WUlJQ2dFQXozbHRiZmlqSUZ0REN2VTBlc0UvaXRXejZjeUxRY1B4a0dBNVdt?=
 =?utf-8?B?TlF2TWRTZjFETlFSSFZKZ3VDK3F2UE92MWZBMitrZW1zSHE4S0kvZk9QME95?=
 =?utf-8?B?TkFRekdqSW0wUnY4Mlh1Vm8vU2N1M3RGTDZMSVFqUGl3Sm5KdHowQU03RkNP?=
 =?utf-8?B?V1RTR205VnJWZXBwaW94TUFyb3pHZjdRMllmM0RRRGhXQlRWMjJSclhtY2h1?=
 =?utf-8?B?dTFmTnhENFhkVEpoOXV6UzQwTVFaQ3o0MkRRcGVYbWVRQmRqUlVwR0ZDZ2xG?=
 =?utf-8?B?bDVJVkRBNzdnWk4rTEZRS2dYbC9HQUtJWjVGWnRHTDdyRHVRaEdHd0ExU2Rh?=
 =?utf-8?B?WUZPcDM2cUE5Zlo1aWxPczFyS0E0ZnV1RUFrMk5PU2l5RjNUTlRtU2xBV3c0?=
 =?utf-8?B?dVlPYUFxTGdLVXdyTUJneEhuN0ZJUWE5UTVaWmMwTHE1R0FBall3S2FyZDA0?=
 =?utf-8?B?Wk9yUEdUQm1JRTVhYjRYdEI3a2NzTWFBRlFMQnRoVjN1WmlQc3Y4UFV2U2ZY?=
 =?utf-8?B?OXpSLzcvTUlNMnp3M2RmbFYya0p6QmlVUEovMWdiaGlRMnkxdXdYZFpDNy8z?=
 =?utf-8?B?cWcwUk9mNUY2T3lSYVh5T3hvMWRzQWNKMjNnOFR2WkVpOFNJSG9CU0xNWlpO?=
 =?utf-8?B?dmtXMWltZTNzT1dieFhwWjQ4MDZaVlk2YXI2RXZzU1RrdmVXTFowS09obVhS?=
 =?utf-8?B?UEJvdDFtNjl2aFNIa1JiQ2ZMVVlVMUtmbC9WRlJudFBraGZoRlgxdW04dE9L?=
 =?utf-8?B?RjRocmwwVGJjQWVGVnk4RmEzY2NrSjQrVWxBYXdsWll5Y28vd0VJSm1CVnFa?=
 =?utf-8?B?QmVBNlc5ME4wL1luRU5ObklwVG1DbWpCWXM1dWRtbHRMTEVPQmZlNyttdlRm?=
 =?utf-8?B?bmdMMU9tcnd4emVhNDdRZHpUdEs1eDFxR0EyZTI0YkdWREtoVzE1Znc1MGFx?=
 =?utf-8?B?T3V4d1AzZCs1QTFuOTRrdU5DcHlwdzl5QmsyREE3THpva1A0ZXBhcHdKMHRl?=
 =?utf-8?B?cDUxcjRkQlR0WVRiVWFuN1BKdHZXVnA0bk1xTnRENkxpUjFoaDg4L1J5MjVN?=
 =?utf-8?B?OEFZUTYzUTV3ZnRyQzRrZU1ZOC9ITFh3NTk0UUh3a1hUM3pHREE0cm54Q0Fl?=
 =?utf-8?B?UlRzNk43ZFA0c1hKaW9seTNHV1ZwT09ZQzh4UHM3MURqZ01VUyt3NHRaUXZG?=
 =?utf-8?B?c3RRTXJRTDVRK1c0UFlPR1B5b0VzOHRZQXZxdjBFZmkwNVhWRUxQZTZaZkdK?=
 =?utf-8?B?MkEzelE3Wk5vK2hRMERuOU9IOEpTNDRPN3h5L0kvUVRnNDRDVTZyKzMxNWR2?=
 =?utf-8?B?aGNIL3Z0bkt1QjQvWC9xZ1JIOWRxOGtoN3MrbjVlUm9jMzBoUjNFcGtDM01U?=
 =?utf-8?B?RWxld1N5MlVqOTFXMEZRTXBRenpFOHgzTHZjVnpCeXBtc3d4MU5NcWp0ekJ5?=
 =?utf-8?B?Si9YaTE0Y2VyK1pEWnh5dUIxTnUzWGVNU1FVWjZtOW11djZvcG1lTnBleWs3?=
 =?utf-8?B?WUFjdXRwTHFVQ2V4czB0cEhZTFUyZklPanlNWENQZnBpSzkyaXB1L3FHL1pa?=
 =?utf-8?B?YVRKZ2Yzc3REQ09DSW5ZVFpMeHB1aUlvbHJ5UVBWdmVrdzl3NEJkVlFwMjI1?=
 =?utf-8?B?bDN5TURLQXN5MjdjYTR2MUVIQ2lKZWRxZ202blNhbEtBeFVvN2Zoc0Rlc2Jy?=
 =?utf-8?B?dVpqdnNxbjVPQUNzRmJOODhCY1lHekhWNFY3cDZVUmk0Y3ROQ1o5QnBKQWdx?=
 =?utf-8?B?NmpnUzRpaSttajU5SFNLSU44Ylc0ZXJrTmdkNVAxeGVmMjRJbzJxVHBMcEVt?=
 =?utf-8?B?dHhyTW9LVEtValFSL0tOTkJpbTI4cVR2SVVtcWhxS041MlQwVFg5Qm9LU1J0?=
 =?utf-8?B?NGpaVVJ6RDZ3eXNHejdYRTlUdHArbmxld05EWlgxVGoyTk1FcllCQTVHdzV5?=
 =?utf-8?B?eEhZY3RGT1dRY25hdTlsK3U3UVA3cXhqTmhJaVMrSG9nWkFiOS9LSUNPbjVv?=
 =?utf-8?B?NndWRXRHNTFHVE5YS3hJSEd1aDZadkUxVU9rUEtEME1jZkZpQysrSjVLOGZY?=
 =?utf-8?B?N056TVB6em1lRlpFemEzdUpNVDVMK2JZYUFyNmNValY2SzBJWS9jUi9pckJv?=
 =?utf-8?B?c1BLRTRGVmtER1VFWU94QkxSdU1JdlpEdmdRQjNYK1UxUkFqM3Uya2YzQ0l6?=
 =?utf-8?Q?Pc9SNLsYfMx/o0NSBt/hlv4o+lE18YbVOOHGYpZWPc4KD?=
x-ms-exchange-antispam-messagedata-1: 8QQZqfaGJQ8mZA==
Content-ID: <CDFC743BEBDD654186ABF20D2F914195@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee9e07c-7a14-4a0a-3485-08debd4e3277
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 06:47:48.4546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylQYVO7Lvff0mqt/xxjKGKehnFewqsAOPD7Dq+zVjcWjpu0+XWoBVct1AUhWja1PEvJ9x3L87TyB0WJEJvIDVRTYDl3rjj65I+cld21PeTWTegADdXcTfBaqZGaANyVmlYYN7XdCv0IHeVmOJvbrPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8200
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
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Improve Tx timer arm
	logic further
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[altera.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[altera.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[altera.com:-];
	NEURAL_HAM(-0.00)[-0.770];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,altera.com:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 73B545FE1F8
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On 28/5/2026 9:58 am, Andrew Lunn wrote:
>> pre-patch behaviour. The meaning of tx_coal_timer is unchanged.
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 3591755ea30b..35da51c26248 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
>>   	 * Try to cancel any timer if napi is scheduled, timer will be armed
>>   	 * again in the next scheduled napi.
>>   	 */
>> -	if (unlikely(!napi_is_scheduled(napi)))
>> -		hrtimer_start(&tx_q->txtimer,
>> -			      STMMAC_COAL_TIMER(tx_coal_timer),
>> -			      HRTIMER_MODE_REL);
>> -	else
> 
> With this code, the timer is always tx_coal_timer in the future.
> 
> 
>> +	if (unlikely(!napi_is_scheduled(napi))) {
>> +		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
>> +			hrtimer_start(&tx_q->txtimer,
>> +				      STMMAC_COAL_TIMER(tx_coal_timer),
>> +				      HRTIMER_MODE_REL);
> 
> If the timer is not active, it is set to tx_coal_timer in the
> future. However, if the timer is active, meaning it is already
> counting down, it is left alone, so is less than tx_coal_timer in the
> future.
> 
> Do i have this right?
> 
> Doesn't that change the meaning of the timer. It now actually goes off
> sooner?
> 
> This is somewhat academic. The point of coalescence is to reduce
> overheads. The increase in performance shows that this change does
> reduce overheads.
> 
> 	Andrew
Hi Andrew,

Yes, you have it right. I have updated the commit message in v3 to 
correctly describe this behaviour change.

Thanks, Nazim
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
