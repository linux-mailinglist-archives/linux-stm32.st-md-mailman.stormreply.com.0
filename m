Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KK1ROGjv5mlA2AEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2026 05:30:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF44436136
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2026 05:30:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67F40C56612;
	Tue, 21 Apr 2026 03:30:47 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2124.outbound.protection.partner.outlook.cn [139.219.17.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77368C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 03:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsB7lln57Iu+bBBsHBI2zTX2CwkZsAgkcAvoJgDk9JKAheE3GcbUvHgOXHIhsd1nNnN2TTHyhZYV7f/D+z3dr1Uy8SM1D59dgsdE9k645hbOKp8JVUkm9tGB45z9F0fN/VyqiR4B2+PkVZt9tgZSA+kZeMrHb8UbTUu5fu8unz3Z+KUKUIfwkLXnQLU+y54prTS5numU4EB9Lg66vrjPrb24tOyzrwogZPHwG6TPv/PNYZtWvGm1dgbIl23tz717FNy0LIuehYL8lFAnUt6kPe05kWAsL/5mBPI1AidMn8LuN3D7uWOztIVB4X6O7w58fDQt+hvCLsOFfSqZuZ70eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zu4rf9iErfXUTPnbkhk0bLu2bnuCORTTuHAok7jqTXc=;
 b=PoE9OnxVIuxG/scRdZ4NFkyPCwEJ1fB6xJS7bPWr5GMTCEfuAMlKD/3N/rzX/Snp6v3au4g53asDAmGnj3TGLZLUNtZzwtBapgO+bqehqSZHhzQXPSaeFp2exlxHt29wGR/bmzi611FhJ8hb6eP56dXD1mRJZ3SKy4AfpWxERM9YiJGfavViaQWKadPYQN6Sk+EJYnEKIlKlIoC32rJW1sVUCqL6AaCJzByG4gyTYKwBgoLPSHwv12EY8Yd97idK4RTQ1DZ04iUu2qabNpzxEry4RuThhiBztPChQr3IrnwbhUQ5yIANN7Hr1IbbXEiyB+SjmEHO00Tt3vBfD+YCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0760.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 21 Apr
 2026 03:30:40 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9769.046; Tue, 21 Apr 2026 03:30:39 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Thread-Topic: [net-next v2 2/5] dt-bindings: net: starfive,jh7110-dwmac: Add
 JHB100 support
Thread-Index: AQHczhRDrTa9KD3ikECgLqCpAIFxfLXoGfAAgADIWXA=
Date: Tue, 21 Apr 2026 03:30:39 +0000
Message-ID: <BJXPR01MB08555231BFE4AB38415CDEE8E62C2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20260417024523.107786-1-minda.chen@starfivetech.com>
 <20260417024523.107786-3-minda.chen@starfivetech.com>
 <20260420-messy-elite-panther-a7ffbc@quoll>
In-Reply-To: <20260420-messy-elite-panther-a7ffbc@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0760:EE_
x-ms-office365-filtering-correlation-id: ff97e938-2239-48a6-c8ac-08de9f565c63
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|56012099003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: 0n49nmay0DgNEKAEQGgCBG2H/JeMv6DVoGzls+lG1zAQIuov+gIyaUdQunYFDnpBx1RglhIjKLRcHQ6fYhsagUbx6YH5uhhhqpDLt2eciWiPqMiuqHwVSDmrK6jiT72PMu4vntpADpdxP3oBDZpSnPJEWUiyrd8KhXqzH/nuZgJb4ULoDGvIlLLFf7NjZKKHKY8+LUSoHH7Q9WOWyOpEvBDtcANd1vqu0WohTTASfK+Uoejpogs0Hj+uC/OlJAHJiUfXyMP5i78fMc1MNgCPR2AL9iKHpADe6RfPv09OmVLXKWZqJpAId2sBOf5cKF7r6TeE4/3rfg2eTzqD3Z2d2/C1moKF5Xv2YbIQLcYRl2dKGSAuoCDXajNzeuX97UKmrshoSZqBNBsf6sO8Xw98uFaXWVs4RDpdAt2BOMuEILl+ZC+XwnwwLe0r4y4fEJ5OKKa9gvvtkqn0NSVO2I62aqQeHvzfxpFuWWbzDbc4NqP04971DvtFp+vV2SQ5oCxlGMLW+jN+iWChH+uBKdjwNyNWCrHCYFW3wgxyDi3/wjpLSY+Cwmphvong50V62yScMyL6PW7N7Ap1SquiNbxk7y6mwL6z6+gbWEmZNYjeh9Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHhudEphN2IxdDZtMTVlalJheDRpQUxRVzVwWm5MRVhXS1Nwa29MblRtc0Fi?=
 =?utf-8?B?QTRHUUErUCtBZktsOU1FSlY4MkIyUEUrOFpYVTVBcTFaZDNVbk4rM1VBREdi?=
 =?utf-8?B?NGF4T2lndW5COW9qNjBncHM5d09qc3EybVJRazJKc0RuRFo2N1NiR3lnSkFZ?=
 =?utf-8?B?aFJkaXhLVmxBTEI0dG5xaWxRaWRUbUI4UkFDT1hWS3hSeHcvLy9yNG8xQlJY?=
 =?utf-8?B?ODZGVFZXSWd3V1BqYjFkN0tSZVhJS3orTi9kZjdWanNXQXpWMVVmc3gyTkx5?=
 =?utf-8?B?MHNOQmwwL2pYemhjUlhqV1VpNVlMRENIdE1tZWo4YnZMZitLeU1pcWxwenhH?=
 =?utf-8?B?bCtOT3MwakNDelNmSWt4NkNKS253eWZ6ZGs3RGNqL0NPSWVCcU1YK1dyZ0Vr?=
 =?utf-8?B?VFp5M3g2NlNFR2lSNXByQ2RaTzdYVlY3dzkrQ040Ri8yK25JN2tDY3VPZ3dV?=
 =?utf-8?B?Qmp6WnR6S1BDaE4wNXpkOTFqOHplWFJWQXVLbkJxZUNZOHN5S01wbENYWWJs?=
 =?utf-8?B?amVxNDQvc3loekNjUkNvRENzQ0N5c0dSOGhDdXVZSlF2S0hCNHFTbVdQbXl0?=
 =?utf-8?B?TlBoSVhrc1pTN0lLdzFIeXlxQkJkNTBTMG1leW9ZNWVzTzBiMEJ4NXVtZy8r?=
 =?utf-8?B?Um5YTW1WVFRoMm83NlJSVUVyNzdHdTZEM3duVzI5MiszdHNNSEZ2V3ZHUFFP?=
 =?utf-8?B?bWVKb04yT2FxSUZVYlR3dHpQcStaNGRhTnJPYktKS21aWG1BR0pUYjFreWZ5?=
 =?utf-8?B?VlhaTzVZVUZOWUU2OEYvTVRiRFJ4elZEQzBmRy81UlFDL3B5ZFhLN2xjdm5h?=
 =?utf-8?B?bEdOZFA2TjdudWRXak0wWXJoTk5pZVFMS1YzWGhYZm1wTThTYWphZVRhQXlN?=
 =?utf-8?B?L2hRd2JaOWJVZm5RK0tPdDNyTjU2dmora2kvV2ZIUTR0dUtlbzJtcStPNE1F?=
 =?utf-8?B?c1M3S1cwRGtpeDBkSHFhMDcyS09kN3doMDRxazUxSWpBWDZLWmxKbnN6Zkdv?=
 =?utf-8?B?T2FWWDNWeC9XZXVYT0IxK0I0cEphaXZRS2RZTTVlU2syMzdvcXN6djVIRFpT?=
 =?utf-8?B?N3BIVGtoZDdJcVV5YzVkRXJqak9JVkxUOXhibEtuNGxxbStJWkFQeWc4SDBF?=
 =?utf-8?B?dnFFTjl3Uno5a2hPZWI5ZjBvWFdacFZaMkJsNllKSll5WUZvb1E2SjBDR09x?=
 =?utf-8?B?Z0s0clpGNlMya09VSmU1dnhabjV5VFA3bnVVQ0c2d25SVDkwQXVRanZXeERw?=
 =?utf-8?B?YzJDZHQvWkVxbmc3TVV5dkliZ0NJTVpHTWhWSzRtL0RiOGFHTmRjZmg0QzNK?=
 =?utf-8?B?RXRJNWpKRXVZMmZFU0Nza1U4eVF0TjBNcUNob01yZExBRE5FcGpwNUhtekFq?=
 =?utf-8?B?T1BxcUpkR0gyQkhnMEJRTXRUNkoxbTFJTC82Tzd2ajV1dWVjMHN1b3c4UlJy?=
 =?utf-8?B?TU12SDlNazNpa0pYa2F5NjRYK2owT214TXRWeHlFUUlONGNDdDlHbFlKUWo2?=
 =?utf-8?B?azV2emJneVRYQzliK0hvS2kxU0RaU1d4Y1FyODZpbG1JVlRiTGNrdGFXMUR4?=
 =?utf-8?B?cU9IMEwzZVVZOWY3cnBtVHBsaHpubmVtTGZkU2hhRDB3S1hXL1U4cmMxcGc2?=
 =?utf-8?B?K1lkMFlEZmwrL0g0VUV5UW5DcjFJQ2k5Q3ZBMU5SbGhKS1hpUUFjM24zZ2FQ?=
 =?utf-8?B?N21JeDRYdzh3bm1FbzRIcWN5ZTdnVUZrTk5wVVZpN1hkWmswSjBtc1dZQkNQ?=
 =?utf-8?B?S3NXa2pBZnhoT2RDaTRSeEgwczUxYTY0NjBRdDQxRW8xaE1UTDdOaVFoeDVW?=
 =?utf-8?B?L1RnVWt1NGZDa20zcldJNmxNN2hOTzFFTjJzVGNJeDZib2pnVHdOU0s1S1Nk?=
 =?utf-8?B?WUEyYVNLbWxLT1Evd2xnUFo4UFluU3hJYUw2TkhNRkw1ZkduSHhZNXpERE04?=
 =?utf-8?B?OGZ4SjNpa244NHNFMTkrREF0Yzh3ZjBWRk94R1V4bXE3NUZyUWlTdzhxYXM1?=
 =?utf-8?B?U1F5QVQ4WDVSWjA2d0gwNkl0YlVyNDBFTjJzSXZrWEY2ZkZRc1VNcW8yd2g2?=
 =?utf-8?B?QkFvZWllbzdaNlpKOU9sR1BNUVo5dzFFLzk2Qk1IMjZPWXdDcU9oU2dsNXR6?=
 =?utf-8?B?R05hZFRMbTdPSHZxSWxDcis5S2FIdDFpNWNLMFdJWW02ZDE5WWJkb2FOZGxa?=
 =?utf-8?B?V2hSUWRlU1NVVmRza2JselBXSkcrSkNaMG5zMG1uVEFBVGlwOFo1RDU5bklN?=
 =?utf-8?B?ZHQxZWY0MnhVVUVrTWk0NW5GWHdqSE5yS3oweGhWV2ZnVFZQcTBkKyt1Z0tZ?=
 =?utf-8?B?VVJFL2NrVHZLOXNPWkFSeHZYMnFQaE5qYWp1U3pqREdzUlozL3FaQT09?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: ff97e938-2239-48a6-c8ac-08de9f565c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 03:30:39.8820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ts0Rp/27/yAYNjTE1x/jTEByfPurzyNACVpOX29KFsiw/FHUgq092MTztQI+labzuo4GvjrK01AxkJl2B3UQpb11N9gwpK2XLuqhv5iDWpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0760
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
Subject: Re: [Linux-stm32] [net-next v2 2/5] dt-bindings: net: starfive,
 jh7110-dwmac: Add JHB100 support
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
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.926];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,11b80000:email]
X-Rspamd-Queue-Id: 3EF44436136
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> 
> On Fri, Apr 17, 2026 at 10:45:20AM +0800, Minda Chen wrote:
> > Add StarFive JHB100 dwmac support and compatible.
> > The JHB100 dwmac shares the same driver code as the JH7110 dwmac,
> 
> Please describe the hardware or programming interface, not driver code.
> 
> > which contains 2 SGMII interfaces, 1 RGMII/RMII interface and
> > 1 RMII interface.
> > JHB100 dwmac has only one reset signal and one main interrupt line.
> 
> 
> Drop all below, not relevant.
> 
> >
> > Please refer to below:
> >
> > JHB100: reset-names = "stmmaceth";
> >
> > Example usage of JHB100 in the device tree:
> >
> > gmac0: ethernet@11b80000 {
> >         compatible = "starfive,jhb100-dwmac",
> >                      "snps,dwmac-5.20";
> >         interrupts = <225>;
> >         interrupt-names = "macirq";
> >         ...
> > };
> >
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
> >  .../bindings/net/starfive,jh7110-dwmac.yaml   | 23 +++++++++++++++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 38bc34dc4f09..85cd3252e8b1 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -115,6 +115,7 @@ properties:
> >          - sophgo,sg2044-dwmac
> >          - starfive,jh7100-dwmac
> >          - starfive,jh7110-dwmac
> > +        - starfive,jhb100-dwmac
> >          - tesla,fsd-ethqos
> >          - thead,th1520-gmac
> >
> > diff --git
> > a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > index 0d1962980f57..edc246a71ce3 100644
> > --- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> > @@ -18,6 +18,7 @@ select:
> >          enum:
> >            - starfive,jh7100-dwmac
> >            - starfive,jh7110-dwmac
> > +          - starfive,jhb100-dwmac
> >    required:
> >      - compatible
> >
> > @@ -30,6 +31,9 @@ properties:
> >        - items:
> >            - const: starfive,jh7110-dwmac
> >            - const: snps,dwmac-5.20
> > +      - items:
> > +          - const: starfive,jhb100-dwmac
> 
> So that's an enum in previous "items" list.... but your commit msg said your
> devices are compatible, so confusing.
> 
> Best regards,
> Krzysztof

Got it . I will correct the commit messages. Thanks 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
