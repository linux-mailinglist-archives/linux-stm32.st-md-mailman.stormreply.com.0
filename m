Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA7A83AC0
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Apr 2025 09:19:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA658C7A83F;
	Thu, 10 Apr 2025 07:19:30 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07CFFC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 03:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9REq2548rBjD0wpsZ9WxcgsWujGTpG9yVEBeNKcD2++z3XAayrwmr8sPcHnr9Q8jxb0O/4kwR3YztNeTcRGw+6+CPl+VPGVt1yrkh7iwgTtopTvV9CBUH2yCC57K01Jx5M6pmtyoGhhAahJAAgrXkQroImVeb9UyIk8oZKzmS8NaAb3raa6NtcSzYJDCykagh+uI6GXCxIMjggsJDTjM9Z2BKkNnu17HSg7wnuTXGvV6pYyRoxT/IT2gN27h+oSaaJXBEZxlYYbYl1/haGZjKuz2232ythYZyoyTFcrCaWuyEE20gCAK8rHAmx97Eh/T5D5bmcH38HLUC6sZffwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atwN7loEq4It1UfikccBrN4ZnO5Uwq9RB04UmheZOFU=;
 b=fa7Eu5DunhOrQCEECWL8bV+TIdBhcDtBDFb3RYAq+XrcGLCxLaKHLFYcrV2M8FkPVOgXetLaEgLrvw2hyd4qyJU5Zy7pGwJSpYnrkTZsxO8DBE/kwM4MHPBN98o3DIIRV8HH5IGjUDbXWewu9GGxz9R/IHQDjU2jBlpI0eaxDV1+0Tbhd76v8Q7gAVxJ+wE2zpwODdxvcTlDf9cbQtBZcrk/jtdzLPIZRkb5PYXAH7eV1ukLHVXtZbMFQVqrPY+vYInfyxNozVZrtjmt549f0VpgU/N7BrvzXYa0JdOVrxzrt9nSvUwi29PuQzo/Cuyu1CSekfvDS/U9OAGQrnLB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atwN7loEq4It1UfikccBrN4ZnO5Uwq9RB04UmheZOFU=;
 b=oGHch4f+LhEhUZJ7BT69DljQojO76U6r+4geJkmH5n5x/0zGj9M4hMpPP1UqDu9irv7jBuH6/f61TuT0zBdKZ5gCWhe4z6upt0g6FQ3L6uw+ita7Jhr9yD4Xi6OzLwtwv6D2jao80gc3tICneWmApGdYx1dDQjZWLhDsqiLfEyI8UZO53zHYr922LLEq8X1yJATQHmLtXpJaIeBS0gAxCSUGsisknkY2dIQdAzDvqy69/SKlMs1IvXBOGejlQhS+5yfnh42Px/7ynhb8dNeItyZZ91LG//XL1O8JIey1yZkxFJeLZf5/ummQ3RT+w5rhFfpvxmBhccNnHE/dFnSwdQ==
Received: from BN8PR03MB5073.namprd03.prod.outlook.com (2603:10b6:408:dc::21)
 by BY5PR03MB5361.namprd03.prod.outlook.com (2603:10b6:a03:21a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 03:12:53 +0000
Received: from BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a]) by BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a%3]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 03:12:53 +0000
From: "Ng, Boon Khai" <boon.khai.ng@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH net-next v3 2/2] net: stmmac: dwxgmac2: Add support for
 HW-accelerated VLAN stripping
Thread-Index: AQHbqF58Bphr398kgkyddiIUmDLZn7OaIpwAgAB6UlA=
Date: Wed, 9 Apr 2025 03:12:53 +0000
Message-ID: <BN8PR03MB5073B710F5040EAC06595AE2B4B42@BN8PR03MB5073.namprd03.prod.outlook.com>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-3-boon.khai.ng@altera.com>
 <c65bfe99-a6e1-4485-90ee-aee0b8e0984d@lunn.ch>
In-Reply-To: <c65bfe99-a6e1-4485-90ee-aee0b8e0984d@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB5073:EE_|BY5PR03MB5361:EE_
x-ms-office365-filtering-correlation-id: 0153451b-dabb-4b3b-032a-08dd77146b1b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|10070799003|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GEAAcA5wW5QMENhpzfuCPDbMwiG+2KmqGgXrYTUltyt3ObDB4CDBg9qHLDmH?=
 =?us-ascii?Q?VdTeTWEkT8jvBg7WvLmVMzqZLUU495TSYTS/eYlmi3LesP5GesDBp9a9/obL?=
 =?us-ascii?Q?d4/9pxXzBtMbm5saZ55PLYpkiQj6rbzHHi+8duNIqBPKmk8N5CZsDkkkwQ3e?=
 =?us-ascii?Q?jbWuXJiv3tbzErUhm0grFeWHMkvzha9CVYlmtHK/McZGqbQJYy428Sy3jCo2?=
 =?us-ascii?Q?I5FU4aeMWxkhdBNr7KxWi4pwwTf9HiHE/918yRdmSioQvyGIDEBQX0LmDQET?=
 =?us-ascii?Q?E327+1A2YD6G2kUNHFANhuAObg2ACAe6lu+1wevLfK9ys5zZOL41chYW+YJa?=
 =?us-ascii?Q?hYTGUTE1IU0vyyqIe4U50uFtBic6P2oMyTasXFFLlE+qIqISAn6chUJQQjiA?=
 =?us-ascii?Q?JScoLql5oWtcrSp7+v6PN2TnnT0GlA1JnSaRcWDX4xyEXguyUIxwGqcpA8fh?=
 =?us-ascii?Q?ub9KpGItivnp+Eu4BFc9dJ7mNrhJ+U2d0grOitaSvkHN76KZnf3mN5zA7RlX?=
 =?us-ascii?Q?kgd1L6h4nIXY7XCnd4iSGgnYW/y3aoHcW6U5sFFrsVByncR15iCpoO5oqZ3T?=
 =?us-ascii?Q?K4aXaqL4LHs6ZtKJhlYtabXrZH6jM2pWxd/s9S8X8cgi0ZA7ofv3JEeB7rCT?=
 =?us-ascii?Q?PT+mSmgkcMezBKZkUhScma5GvPwYxWQ3kCGMJHHNszPMb6DEpxEvQEgSnRiQ?=
 =?us-ascii?Q?82xxoZKutTBn8Bv4qCOLBDUm3VtXwyy862zFK/q69Up0PXSlfCq0A5BhpVT6?=
 =?us-ascii?Q?DRPADIxHbgVMfexPq1E07CmfS1uc5NjOZIrs5nZ9gvTkMsfYtqDUBC19/X1w?=
 =?us-ascii?Q?xef6jFhQ+OJdbl0RL+asCsWBC0y/MYVJqYQIYkv0AfZHbORUjRI+vUqARMSq?=
 =?us-ascii?Q?kGmjk3ddsCNfqc7+5rbNozX8vj7XykqUFMP2T0u8UI5tahDhofBEkL5qCSSV?=
 =?us-ascii?Q?jazV7TUg4DIYoA0ygS7ndy8VBi/GYr7+Vg5jYMZfCypjgnaP1ZHsTC8emPQy?=
 =?us-ascii?Q?lLpPwgd9n1RAaMX0f7kbtUDObSOcz+Ae32fJCkttLqus130t9S7ovk1bb+tr?=
 =?us-ascii?Q?kscEEolfn/DnO5GF9xwS64QgGbeoYVYSLXIs480c8/mBTUGN720Ooi3JIwqQ?=
 =?us-ascii?Q?vGLTUCygwowFZVJbr4EKo+OVnHw0KwQ76u2JXzkYTdlbV0Zc3TfrdiVrUw60?=
 =?us-ascii?Q?LRcA0Kh7jhvTA85v2+V7oT+oAqo76PmyWrP7Ibe6P43791IwYCa9JeXs+5fb?=
 =?us-ascii?Q?kODlAyg053NNxH0F71FSZ5GiN8YcEZQe+C/HIQQH6U08JApzuIVSlxwG2dTY?=
 =?us-ascii?Q?BKDNkgLU7VTb93vHSQ7KRsr6TB9tnZCajs+n0yWnB3j/eNbRg3jCHp/NGEIv?=
 =?us-ascii?Q?e8iDJFj/bo6V0fKXIOd1OjIBzNF6PYdw84iPD/71S0MZSdVXz9Xdx0gHWAJZ?=
 =?us-ascii?Q?4tOcSTInmZ9fFzp8gI4XoywVmkuFl86H?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR03MB5073.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(10070799003)(366016)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mwdY8jvxFqnqAx+pIvd/oVDYwk4j0567VAkjPrJk+cmU47gMXFYAkn13ERdK?=
 =?us-ascii?Q?nXat8CaEhO70Rwrp36PTUePO4MEI+lEF8/64U8fYawYs/4k3jUukeFFPQvZN?=
 =?us-ascii?Q?zPa7N6mJ2wv0NF1ltnM4XbqEGT4wahvLoxCrTn+kg5EcbWRLFQeLzFQKt7xZ?=
 =?us-ascii?Q?tnwahPlsEEo4CVgPWEGRXQU65THNH4vVtJVVfa/jYybm0Ek3hqJ4v8WgwrXz?=
 =?us-ascii?Q?YbI2dCgtYmNhwY1h/DF8R1C5eN3lNGLb091XfY8+u7Bceu+aoStfhIWV5oOt?=
 =?us-ascii?Q?qDS9001tVynfWyNBpe3ICbhxzpsVphlCwuxA709uWRVEQElMI+T+S4cEd6XS?=
 =?us-ascii?Q?uA7s2pUY0rlInabnbcRr6T5Ns0D5I1kK4i+BpzXx6TGRZJzdZ5ZcvwZ2AXB2?=
 =?us-ascii?Q?WNK3MK9IL+NsU/6W8ZjloD5/BlHOsuFd9OBSP6G1bK3h0mw6XPTeL68TvTsn?=
 =?us-ascii?Q?aijSZZ51QzfeQfqBbkJZKHIE52WZ6HhKYReaeLewGO9jjtDS81fMlZVSgCLw?=
 =?us-ascii?Q?kUc+u2BaguZ3MdGw0m3MMHgJrP30eFOSdtqWcUuhICEICYMxa+T1okGA8EYr?=
 =?us-ascii?Q?OyToouBjy8b+91hR0ZWM7ZnFWRmzrJwaPfCnDPt7y9UTSx5RA5UssZGxeMpv?=
 =?us-ascii?Q?BXuNysuWMT0+HcXxXpk8rbHpku5tu8FXe4Clexy+z96IFrtJTneX/UgVif2x?=
 =?us-ascii?Q?p5+pY+m93Mr6eB4DVvDmrvbRsG94f7OpFEQzry9fhqm6xnK9OedcOvs6z2Yd?=
 =?us-ascii?Q?2hf7Sns9+WppyPOsbv8f0eWfY4qAoRcQjiPsbg3njZ+tqAhL/KLe4cp1yFIC?=
 =?us-ascii?Q?snvzL960yck6Q7iYUDrX+DgfQTgblSnlNMDRRPu12w9GLoHpiAvLbYPv2N/C?=
 =?us-ascii?Q?c6x6Y34AF9pRF5NbTUGkPARpgFC/iNbdwIdpHC6m4APP796bwgL+vhqCAq7O?=
 =?us-ascii?Q?RLmDTo0U7pJ2TvEzfLO6ZB9uQE2qS4nj4IGirsjtZgytN/1x9V72yGjv2P8s?=
 =?us-ascii?Q?SJo8VLiPPNXKiDYWt5e4aCuL7VZOU8LXIgSmjXnvg/wZ+4Qe/pWv9829PHK+?=
 =?us-ascii?Q?376NTgaz97o6fWSN43NgHFIze7HMKBZnpuuWVZ0TWdXGr4e3z1itY1xX2uZg?=
 =?us-ascii?Q?NaXYJobsVkTd/G9bp/DkYOFTGQ56UGyyrdnZM8VUmWLxca/NO4d7eMvy5gcS?=
 =?us-ascii?Q?UfGqdqzBc1NtO/Wf8YMiQcJa4AkFh097GavVZpOMfPc9ivmK3o0cjRZ/E+RH?=
 =?us-ascii?Q?QUgO1RBZqYYqatSFz4jiKjBlpT8f1j62opRreG28a3gd6J7CxPZGK2dlnHk+?=
 =?us-ascii?Q?Cq9Gq5l+II4VZ3pJ+Mmkzh2Wib1h90ubSrnpMnyw2jZ9tq2d6lAZjJpJwMsy?=
 =?us-ascii?Q?MVGhMEiJLGmRxrhgJrG3jMCF57JkE0VBQi0uHFcEdvPsicn6LMsbv8WJf3vj?=
 =?us-ascii?Q?wIC2zdkiX5Mj7mxNN8wJ6HC74iw8H3xINKlhrRg6M/OdFLQuz9wWQoL+PmIL?=
 =?us-ascii?Q?sErbUksQ6V6qVKgmWXE3eh5ubF44G1c7e4t4Ow71SbdTvwyMZpgg/V8vELJo?=
 =?us-ascii?Q?K2gjwA7FueuDmWAhQUdOrWYGeABbrAX+rnR+7HHM3wvkWdOdprr10/ViaH3c?=
 =?us-ascii?Q?tJ04ik5fP3TWGu/Ht9LImn353acVrI02OUYSvF7+rNYv?=
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB5073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0153451b-dabb-4b3b-032a-08dd77146b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 03:12:53.6254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ln7jECEIW7AJSbQm312gwPMYc/O4Sd3HmNnSSbQt7B/kFI87BTqFrmKHf42mRc+luACVqw/hoq4XaQ3Rf0zEcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5361
X-Mailman-Approved-At: Thu, 10 Apr 2025 07:19:28 +0000
Cc: "Ang, Tien Sung" <tien.sung.ang@altera.com>,
 Alexei Starovoitov <ast@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Russell King <linux@armlinux.org.uk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, "Tham,
 Mun Yew" <mun.yew.tham@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Gerlach, Matthew" <matthew.gerlach@altera.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac: dwxgmac2:
 Add support for HW-accelerated VLAN stripping
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

> This appears to be identical to dwmac4_wrback_get_rx_vlan_tci() ?
> 
> Can it be moved into the shared code, or am i missing something?
> 
>         Andrew

Hi Andrew thanks for the quick response.

For the dwmac4 IP it has the following format at the 
Receive Normal Descriptor 0 (RDES0)

           31                                                                                                0
              ------------------------------------- -----------------------------------
RDES0 |   Inner VLAN TAG [31:16]   | Outer VLAN TAG [31:16   |
              ------------------------------------- -----------------------------------

While for dwxgmac2 IP it has the following format at the RDES0
Depending on the Tunneled Frame bit (TNP)

For Non-Tunneled Frame (TNP=0)
           31                                                                                                0
              ------------------------------------- -----------------------------------
RDES0 |   Inner VLAN TAG [31:16 ]  | Outer VLAN TAG [31:16]   |
              ------------------------------------- -----------------------------------

For Tunneled Frame (TNP=1)
           31                                        8 7                          3 2                  0
              -------------------------------- ----------------------- ----------------
RDES0 |   VNID/VSID                    |    Reserved         | OL2L3         |
              -------------------------------- ----------------------- ----------------

While the logic for handling Tunneled Frame and Non-Tunneled
Frame is not yet implemented in the 
dwxgmac2_wrback_get_rx_vlan_tci() function, I believe it is
prudent to maintain separate functions within their respective
descriptor driver files, (dwxgmac2_descs.c and dwmac4_descs.c)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
