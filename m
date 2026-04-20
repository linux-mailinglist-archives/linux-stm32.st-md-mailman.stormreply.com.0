Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOaqN/CG5WnCkwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2026 03:52:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EEE426195
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Apr 2026 03:52:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49032C8F26B;
	Mon, 20 Apr 2026 01:45:55 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6E34C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Apr 2026 01:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFRsXqiOTwg3Z+XBzFYDVwzeufPvDjXU8ZufYOCcWbqFgTG5LB9aGq/hUPHawAVrj6hg7+bNsf9jTxKSEr47zUx2RKx1LJIyFbxQrpiP/RAVZJWKGPkF6BgkXyKigdrLBn0/MV1psB73GX6Vd4PUUhAy927eH9GcMut2ow4pqEPlfALDpuFPWOs+Dj9CJCkTjM7FDXzvXsngj/tVbBa7QsrMAVNSAQsyFawHchFVzFDUeYAXXVmGO/4Begk7yphRZrZR2AjlNN97zuV+53bDvsZzi7Qr2rOVfz3hS483VWiOkPc3jy1EoXNtKorhoKdbpwGe94Qt0V6HOWa+B3JqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7HFJlP9QXFfyKUOO/FmcBvXDy0Ay9xnq8yPc8zE97Q=;
 b=NErjG9tPwocfo1VZfdYDX+hjEv6WDORer8asQGe4mFwcBSYin+friXZjneyAKiolGYvc/EuTDGvgZXVFZY0huyoIygZM+449dd9fIM7wZIosfntUCZhCRrjcmgDcSjvZiJn3k0LmIrGP0tqEPur4n3Rq0tBNdDtvEB299Fj3GEFGBke/TMidC+focRD2eIOmnAwqi6ehklxuawROyRtCBGZN8lshlOVKX0ObFzBcuEkZ5TUIED2cu/bhp9lU11fawRaIRmXqwvO21hLnPpGReybqtC24c7dAdc1QCZ7UG8zYS8b3xhmIpvFkI4sL8L/9wEeLLqDjMiqHtiY1U5ZbDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0790.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 01:45:48 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9769.046; Mon, 20 Apr 2026 01:45:48 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [net-next v2 1/5] dt-bindings: net: starfive,jh7110-dwmac:
 Remove JH8100
Thread-Index: AQHczhRCnOOfCJuOYUCcp0gRDtomF7XjWCQAgAPahKA=
Date: Mon, 20 Apr 2026 01:45:48 +0000
Message-ID: <BJXPR01MB0855CA5A38AB100F641F9076E62F2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20260417024523.107786-1-minda.chen@starfivetech.com>
 <20260417024523.107786-2-minda.chen@starfivetech.com>
 <27151bd8-6a3b-411f-94fd-7b1b932b9aa9@lunn.ch>
In-Reply-To: <27151bd8-6a3b-411f-94fd-7b1b932b9aa9@lunn.ch>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0790:EE_
x-ms-office365-filtering-correlation-id: 040ba719-b6e7-466d-58b9-08de9e7e8bfd
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: mDGcSG29J4v93KgO3/2M/WNYf849JNAHm5WovA8G8irQb6o7jGF3eu7nlhcXJ2cyNlTcZbHqk9jwFJHhPXAKxjsTHX/lPnfCYYWT31mfom+0fdf4CMrbclQyKH7yBjV6+23PBmAZC3/jCiPlyEznPwi7pHxvShyOeCIFoV5GFjDy6gQP9PYWedDxGOhkCrdeavPHpWGjXz2IEbnjF8+WNWMW1YSxpmpVgvudfcgNjYxyrN/xTWJ6tq80tJgrXnCh335132YuwRm6Mr8EN29DXqHQ0IgJ08Vr0YoVz/yKR0TB14V7E4JTZhTp57uojDQg0JlSva//++ornF3WNQcHKOS2b1WPpmY3ckoLWkR/DWR+3gdkMj/HjijTfiSzUUh0vPMA0Cs83yLktlixJTfCQoVk8ytZ8JmAtqrhNhpq9DIGnh2sQdQbmAGYaIt2S5MSpnsKZgq74jWwQNT5bidtE2AYUE92TnQOhblpe4/A0iJlnaSNeMSodhWArN3VLt9KHKxZqU4i+o2LfWRrVuAkQyZBnWDWwIyA++zCJZxaFwebZ1mh+IOIFpy5W4CTK05yZ7HAvgctCMfq7j+qnAYXfclvWUk0TRlrDanHNCbSn8c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E2YMR91/gPuSwq4RLbcB9nwePMRdTIDIr/kRlfW7sQSRwz7g4Ko9BsbrBCBw?=
 =?us-ascii?Q?BffWMuLLw/vSZnyGQ00uPVJ+NtVbebb0A6/islhtu2S8esPmAyVSBUivHih8?=
 =?us-ascii?Q?VzfxesbZwE2Y3SbaLYxjrs4m9ObFYoZoVo2nNgftVlFgjf5hWfqopGGzODTG?=
 =?us-ascii?Q?xYjBP8O1AqsCAWdklLH8K9ue0FWMeHdvqooEI+87nKQV/FxQvOwzFszqSJhE?=
 =?us-ascii?Q?7KK/msl+kyV7/GxBsujh4h6i/9lyjZREyEo9MIPjkcchSbWP5d3pTJhsSY5p?=
 =?us-ascii?Q?Twg0XOmoXx5zziFTWwjHaqsbF8Z/PlMvJkqoS4pYfRXIPek9c8ajO6eXcoZk?=
 =?us-ascii?Q?MP3LofveFzFg8szTySPReeXDc71dtpUy+RVY7K+HdV5xDNvS8nkJYjHdsoqD?=
 =?us-ascii?Q?eMAMbQFmw12LsnaYpIPQFGjtNNP9d2Ff+5mQxhv0wYeSvf2c1h/WwvWTcnbK?=
 =?us-ascii?Q?GxYTdZmEC4ftmnWGLqcrEB6BwRuc8cSZNvye9XweWUVoHnsXpaW7Cggiysja?=
 =?us-ascii?Q?LpLzCHjemPEeZCseY40aRABZC67sHsrt0W2tMf5ogp5/v9FGCKpehL04NyKI?=
 =?us-ascii?Q?4YQb+0QvUNGIsbeJb3HnTnoDEkd+J66LSqVUGgVuDl8NB7mY5J/kJNWGDjjo?=
 =?us-ascii?Q?h2cXntP9ABMjKZcmqngnfyIjh33DuJX4Nc5mIPgJ+bM4mbUFUqMhzQpsGT6U?=
 =?us-ascii?Q?PkGtJsw4uFpWaF+vFSZugsXZdSc0kloZGwMbxwRHeCGEvOiC2gP+TXUx9VSE?=
 =?us-ascii?Q?SDO+/Z0TRT/+QQZ5duyjGss0dL8TE5yjDKKivOubFpxdgArnBacik7BB1IiM?=
 =?us-ascii?Q?pfSyPiVcVlF4eX4Ito6CGuiPyg+mRirTPBGfIUMO5TYDtqmD9kn/Xt0POPW+?=
 =?us-ascii?Q?z594W8AejYJdLeTDHTa+PLH5Yb1TxZr+viQKXOZeIz7RAkIZDonjeUVjATC7?=
 =?us-ascii?Q?8mwrjLjzX+4SPoxm6GOAjVqHGccaDc81Sasmb2Mn6EJ48XylE9bmNJYmM3J0?=
 =?us-ascii?Q?GWxIrUPXg/74Z4nIi86jzx0nygmEieAHLouTA/1mWqF7ChisEjZJ9TPXyGuW?=
 =?us-ascii?Q?wO8sh/5JruiHF+giSrDZPBEQw9Tlzlfys00mQ1Dcmuf8yrADzfTUovyUaoMW?=
 =?us-ascii?Q?sicJMAP0fQh8x/Sdh5Z+5QpmWAeMgF0+o7RK5xagTGxg6LO5ST1i5cyEk+Je?=
 =?us-ascii?Q?YEcRY780W0JnrEOEyVPS+DV0mbQdQQgfXIWt6h4hwws93J9YV5oD12kQSvus?=
 =?us-ascii?Q?MWKNeDMvTuXlZZuSsH4NM5rjjP3yd+D0UgAirVPgOTOeIdDEP6eht2rMmJvV?=
 =?us-ascii?Q?svwpHUU9i3KaZNKhVxTEHHIj4SW6a0sIDGuAOmlELdye1J7sVHBRJ/qNQ9OD?=
 =?us-ascii?Q?0aUIV6kFukwxtEjrBI0NlJB3zHL7cwG7cfJa1Oij3AqrbYChFx8/ZVyFu9a4?=
 =?us-ascii?Q?n7wdfeb9Igu9Te9cbRiakCSc5ZzNhIXHnUxqLv6FOEFLagBXda98rqN8ca/K?=
 =?us-ascii?Q?rJSXi93G+QhoiB82AmL87tsATth+k3TGSutJyok4ea71bQgStMuNZ4ra36dE?=
 =?us-ascii?Q?yUtyBXa8WlvUpHqmlIETm9iTLfDSuLUoTyOu8DFrytkzYTJ2aAcTkdO4TItu?=
 =?us-ascii?Q?0fnQcUPryuma2cPBSGY5SE/NPWr/fu+0JkE1mwX4qrahu9mRB6OI3mLZZ/RU?=
 =?us-ascii?Q?QwctZaBBAtiSZ4r2EuF9vRYM+/rJBU4wzA8DZHaDzUs+XdU3Tb/WIgi9RNQL?=
 =?us-ascii?Q?7DrO2iujfA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 040ba719-b6e7-466d-58b9-08de9e7e8bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 01:45:48.4275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WP7xYN0bgzULjagpPiPyY1N1nmZCOrtYFtK6oQnY9pLGPwJiMraSDsYTm1WuTtFh9B3UMNKosy8orYFF1ylrpKn1idW1m6vV8V4CESugRt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0790
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley <conor@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v2 1/5] dt-bindings: net: starfive,
 jh7110-dwmac: Remove JH8100
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 71EEE426195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> 
> On Fri, Apr 17, 2026 at 10:45:19AM +0800, Minda Chen wrote:
> > Remove JH8100 dt-bindings because do not support it now.
> 
> > StarFive have stopped JH8100 developing and will release it outside.
> 
> Is there a missing "not" in that sentence?
> 
>     Andrew
> 
> ---
> pw-bot: cr

I will change it next version
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
