Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1BBA954DC
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Apr 2025 18:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B660FC7802F;
	Mon, 21 Apr 2025 16:47:24 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73E91CFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Apr 2025 16:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9jCiqM1jQYAzjvvGwdnaaShjaUmKZMr54Gp75kplHfefGADbF67/CRwSNql3h2w1MjGai4e6wiLPDuCpCHQXVbdRDOnaH/o7crVD2EmoC2Dznm/0q+AdBro8O2JItaIn8ZacBInWZHWjhbI76ssBwYVj4KqW8Oywh52Hguc62SLfS3VMS0qF1I6ugvsU8V88G8ZlVn9OSOgEqU7o4dBvpFO9AxGUyZY2pYcZ6bjeZJ9x0Dx6yPgCikFSaaxX3sZdSrsREbvbty/Vgno2NzZ2m8BjY0DIilpLdxHJu4Wrd/NEzZBgAeBFwe+G+aFPU/beaDTaW8VtvUAGXmk930DPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyoYHvirLNOs1Mdwh6lJI8kI6cksiOg+TSaaJH42Koc=;
 b=aBaa+LAC6jZgvyO65cxb00dJpwkTeU02DspzL2y3P2ij5nPozwqVeN9mYK3Lg/3cYY3a4qm7RJ3luxRUWiV3Zskxpoc7OyoL+vh3g4oheJRwC8xdjrjUcX2pnmS40H8rZLzmXSiHZ5xVB0nTR3E2HR8ld7ZxM5vbfnhxw9VN3fayN2QgUWn0vWnzy2XK6cyjlg/meQ0j2UEDzhT9fshKnS9hIwoywo6C/FLx6qToVcJ4xJ1/Oik5Itx4MkEbCCxgW1NMKteOBdDNCYaJ2hINrUahY8kKcVMT/+HXp+fwdKFgewAmivRcvnWOd78ZeSNVyl2VZWudkGUbxQyssSDN3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyoYHvirLNOs1Mdwh6lJI8kI6cksiOg+TSaaJH42Koc=;
 b=UxtkzFIeLzwMxu/55kl2q7zG5JErkhOwb6al0ZGLPrxSNPQ03vDZnApc64cu2uUpitQBNVIetkgd3038GSNppefysVcDos826xr0aOvE0dey7u9SfnjDgGvoJiF/NvXDBRgXA3eLWNz7K13b02t0M1aLFcm2VjILlkJU0bIEKmXRaQnG3qjdVGShV+aVdbP998MVJb3fyiCbFViVHP5a+Orp0WF05VdbNHYeR8mVTvtRH9l/ZxlaYCIUO+Zu9R0VDdvVt2w0tujrEcUlu+Ka72AXcH3h15wsgYuKkuyIt01HMuJMTpGBv09BBDNOC1BV7tE6pLsgaJmWJodryLVz+A==
Received: from BN8PR03MB5073.namprd03.prod.outlook.com (2603:10b6:408:dc::21)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 21 Apr
 2025 16:47:20 +0000
Received: from BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a]) by BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a%3]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 16:47:13 +0000
From: "Ng, Boon Khai" <boon.khai.ng@altera.com>
To: Simon Horman <horms@kernel.org>
Thread-Topic: [PATCH net-next v3 1/2] net: stmmac: Refactor VLAN implementation
Thread-Index: AQHbqF534FzGLRNwp0yA1XNTHIr18LOeruIAgA+55CA=
Date: Mon, 21 Apr 2025 16:47:13 +0000
Message-ID: <BN8PR03MB5073253767315FB81E5C76B8B4B82@BN8PR03MB5073.namprd03.prod.outlook.com>
References: <20250408081354.25881-1-boon.khai.ng@altera.com>
 <20250408081354.25881-2-boon.khai.ng@altera.com>
 <20250411163602.GM395307@horms.kernel.org>
In-Reply-To: <20250411163602.GM395307@horms.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB5073:EE_|DM6PR03MB5289:EE_
x-ms-office365-filtering-correlation-id: f3293345-cf22-4d87-4b49-08dd80f42ac0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BncIRxoum9qiLnmxuNt+Tkvn1pkOT3C+IV40jXupZlrXA478btaCccqMRxWJ?=
 =?us-ascii?Q?pTiUaEL3qePsckdJy/WfxzAD3ZdAyZI9UamDoLF97ICR13PKg3fqdPiqmi6O?=
 =?us-ascii?Q?LyiBcR3w72ivBQyoJCuzAvZhMaP0bnOXblrKCEj1YAYokvvBDBRKiYzh1/yc?=
 =?us-ascii?Q?cDitGGrmuquhwNEMu/96oehJZrsdL3gkwrWQeuxVQvMopOqaQN9OIGrjHZ3m?=
 =?us-ascii?Q?wkmDf+LQ2IF0yLD1RDMfg9zlu65g6aYY+XYk+EucApHs7Ahvp4XxJWVNAiYb?=
 =?us-ascii?Q?Ih/kOK2NzgIeX/bQuH8s1id9xfcc+vlVVCTiEB5RQPdKW+joR4CwhFP5/xYz?=
 =?us-ascii?Q?9moLFe+wAR72je1TlK9n/ywME+MBN+4tMuz4fG+0gbuk4jnbxSB7iOaj9xrK?=
 =?us-ascii?Q?dJCesaekjGSHQCbXfneLQvaOGl2tJZZKb9FV2D4BKHZPyZu0hVohD5jNfpKK?=
 =?us-ascii?Q?8NF5i7tOAx+zZJHhDuE5ZX9tAAGbHBLXaQOoGsTl3DZf4Zstti883gUAnp00?=
 =?us-ascii?Q?BI1jtAA/sWPrR918iqmI2PqLhYYR4CH2yq5NMIDhXeefthsSi8DRxVF5g/6q?=
 =?us-ascii?Q?VnYFyMZdMrvlip5P2eeOpDR+PkoweJTMwzKTNQV0MuLzvJfPnqMHEAYqxDv3?=
 =?us-ascii?Q?HE8sPlP2THTtPI63H3vtzgUGZ42necUCWjtW71MYPB0ZNxQY7e69rd/xybmT?=
 =?us-ascii?Q?Br+6fCXqD4q6wG9r1+aTX0YkfsZWNEyqItu/r9o2qD7t5BnZOWokw3kEfJd0?=
 =?us-ascii?Q?6b35+1buMQhKg8/jn/I+1m9MvHUN6+k7FJ7gTfVqxVMPUmeddzvjqlSdIh9q?=
 =?us-ascii?Q?a5bm4fJVTeDTp0Cqrav/wfLijN9jKGLcZJX3czGnd0A5shui7BZeCXNwUVCi?=
 =?us-ascii?Q?kcpxkNBf1UjCQmzb0YnVx2QkDQh1jHKcoRMUWEYnocbNGSfJ/t6nMfVtzOua?=
 =?us-ascii?Q?9XP8Fjc3TRCDvt62aCr1sqKOcalpsPvxAVbgpw8pICIJdgnEFeHU793v/eri?=
 =?us-ascii?Q?NXQy73J6s4VQbai2HAimXDAO0cX2mleSQwgSYKnLoJHP+nKIL73oN2NL1Jl8?=
 =?us-ascii?Q?xSQbGXNhzrQy17ffWBysQbFMzkI/ibdzCyQ2kBI8bH7NlaYny8CvijbMhQJE?=
 =?us-ascii?Q?DOVSLCqU7BlKrIBtC7jisGQ0PD1Y3eYVsXDRUNf737WNtFpL5Cf/AEDuit9E?=
 =?us-ascii?Q?Dky7wx0FHu9phHJWQhssXwZxHJOIRoASMzEhg7fngLvxx1Mj+L+jzYuGypm7?=
 =?us-ascii?Q?9MI8Cvths6X2OxfYyWHXmbpzf36p9qzin0uuNtw5iC+qT6jRsn42eqxULbLk?=
 =?us-ascii?Q?kQY/hb2XW/OrqUiwrn7APP5eXzWFDjnhEHYc++oJnARV2+iSFqvv/KH/XHL6?=
 =?us-ascii?Q?sJGF/voT52wLMPoJXflhWhS3OnGRPAjx8H+/rGtbWIHGqZnf41H/j5Q+YIiz?=
 =?us-ascii?Q?4+41lwXTDBZXCu7ScjOKtE4Es+nAqLOswCVqs8Nu80q8K1YG7lWgRg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR03MB5073.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YYcSwMe3C/aHzLCb12n4p6tC+F0Gh1R3B3A1Nc4Q4d9mxz5uudbjz/G5ZWoO?=
 =?us-ascii?Q?2FU2g8OJ8ImBCqDgffQmnunbMMr3q6/wNPAY/VwBRbuDdXDtIQYdmrGd/V/f?=
 =?us-ascii?Q?uSTrigI3divEZgFdl3zaykZuTlpU5V3O5JNqzJMc7LVTfc6OxrDHO6RMLq0r?=
 =?us-ascii?Q?onI0cJBEcu1xqJM/wiKMb7Os2keSNxHOy/7CePelBInsuL8jzDGLGfNXtZbz?=
 =?us-ascii?Q?J9eQ0YgTXBf8+8MuOjQdYup5Ikx8mcTW4mDr5tm0xZe4d8hKhN8pbhbYjziV?=
 =?us-ascii?Q?vUD1YxjJrmfeX2XYkHbvJNs3xdv66MAPrI+8gizvGYGw8NGCeLrK4jYhJ6gb?=
 =?us-ascii?Q?/fU8Ql60Lv4b5KHiCkEFcRNaKbOPpCM5uJngzULtv8Ycb4oyYCJrQIoyIT6x?=
 =?us-ascii?Q?3kPSoMLhKxinoql6WlwjCP+kzHRy3IfdnVOuVyzGDxkG+eR6gcU+oD2Xqhb0?=
 =?us-ascii?Q?OB/fHIY5LKB0yO7PTbCpfTgzJAJx/sgabPNuTj4fGQ6LvCOT5Do21G1bHCjZ?=
 =?us-ascii?Q?phG9/Sd+i2o6rOkymUiw3qL6fFaoBHRz45u+qGAHOf9aZ2hbiroppgSbkyon?=
 =?us-ascii?Q?7QkAoLvTLyhKZPqgHsyI3xuYD5Qd3CXj9I8Gzsa2HLm0lhLYPP7FiYFL8gnw?=
 =?us-ascii?Q?mMurkq9s1NxA183esm03ZoFHcxmVFChbb1kl0PH+XDuFKOH+gTunUW8ZvDUt?=
 =?us-ascii?Q?rhHtApjzoVD3khSg0xcMdoGQbWTJA+cPLk/os3cminW/eoVGXLV1NqqUWI0v?=
 =?us-ascii?Q?7txX5b/REZ3N4tgWiXhjSF1wX9jjg2v3bXU9hCH7WcMhl4nWsxtphB9gPDg8?=
 =?us-ascii?Q?jbeytmDbnFEE9GHGdO5OdexGtMdhvXscrejw3HWF3ojF3UzMywdBq+ZTjBMv?=
 =?us-ascii?Q?iVbw9vRm7FJ0uG5Mf6vZ1IspMna8cdW1rjLqKH5YLKgMZ9PNIsItcWBLGUni?=
 =?us-ascii?Q?LtIcUnTf4La8goEA6ok2uMWwmP7MnBs4tHID+Q2GHeKZew0wdj1CnTi14mFJ?=
 =?us-ascii?Q?JCAg1AFqlH408BPMLLOL7zkADMalZD8CiiL+pbtlbZkLiZF5CulMqJ0iaCB5?=
 =?us-ascii?Q?h5UD7Fofowd0Q/uFR5hcuKU4ZZD3+qptFeW8FUDNUcklhJ9UFh9JpjrL2pay?=
 =?us-ascii?Q?11qFVpuiu30TppttYzxMwaZP8iG5L+RqLnM+3z/6o/YEHmYt1ISN50XhcUez?=
 =?us-ascii?Q?hOQgbkOc3soLQBfVu+r4mceZEhsEZ+NAujZ5shZI7SsIPoaY6rETlfZbKf+5?=
 =?us-ascii?Q?J1NrJ52Yh0KKgTHBhvmOoiPa9MSdQ+MGq2WmovO3nYkhscyPHsA3gFl5o0G4?=
 =?us-ascii?Q?tRJlp+yUcRhXGNLHxX1ERuqeRYqi99v/nskCyNOy1e17G2AvrZozDXXOt/ZH?=
 =?us-ascii?Q?IqOyU457akktWl1CL7WFpilV/cp4H5j5m0QubamFeorK+vb+x+uHxmibiCIE?=
 =?us-ascii?Q?9H/Qyi+8ZmAjYKCzJbG8wg25B+zXqlVnUgxjYsa39cCWNDX6VRMcP4o9TPZD?=
 =?us-ascii?Q?VcxxZ2vMHi3756w8ktcoeOsLUpwDUaTKZFM+OALlG21uknN7NnhfYFBNPhOA?=
 =?us-ascii?Q?9vfiRL2ZPKKznrKoVkkrr5sKjZT26IHTOaOEpu92?=
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB5073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3293345-cf22-4d87-4b49-08dd80f42ac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 16:47:13.3944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xq7W86XHwHP4pR5t99k4C9gCNqiNceay4R6xFlEetPMAn6QiCtm9rbHhOVPrJxFUYhdl196D+mq05qqCV/cg6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/2] net: stmmac: Refactor
	VLAN implementation
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

> 
> Hi,
> 
> The signature of this new function does not appear to match that of the
> functions it replaces. And it appears to regress the endian annotation of
> perfect_match which was corrected in commit e9dbebae2e3c ("net: stmmac:
> Correct byte order of perfect_match")
> 
> Flagged by Sparse.

Hi Simon, 

Thanks for highlighting this issue, I have fixed it in v4

Regards, 
Boon Khai
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
