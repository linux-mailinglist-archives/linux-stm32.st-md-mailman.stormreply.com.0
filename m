Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14FA9EAD9
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 10:34:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED4ACC78011;
	Mon, 28 Apr 2025 08:34:44 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37D45C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 08:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHUAP7uqa/Ncp9ZkutAoQXa99JcftZVu5BtVB2jOc2+bgiP66QrnvyRVAACvCSx4b+ZjoL8JdsjPoG6752ad1JLI92V3FefLkbMWB0E7AAlswm273Yt4LtmiA62KklsL469V2pHQXtU4lwtz5Olq0W65nkZKV7uR5em4jt2bpjWMcBlOF6nQeXW6kIEuSPdEtWtTO9jm5dpomrrnE03xu1LtRLhnTS97Gc5Jx+gHvBIGmIPbp3ORLYpv8kYGZHZE68qt7HsUhh7CsdMlY6SFZ2Lpy+q5xyZ+EAiEuy8UUUOPLBAU7/GE5gLAhi3a2LR73AY8P2mmQi38gbCGHhGdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvT04c1A57p2tZVUQSmHyiBRJRwM9e60GnBNU0D4IoQ=;
 b=t6yVIeeIjslYoMoMOLGdCLSYPnjtxtxsgt4LoNsICqlO5GuoKmiV2h9HuOYKOYNVDpTh3otOAWJ8yFhYgPJcLrH+f5Qgknkqgk8P9qPQ1GzKK18sgC1yyCEx4u8gSlsHSMGMRrDGh82LUYAuLT41C3KFKZ5b7XAqToMXxok7xoMXSxW6D/gwKKwAMpRgJNuJQCrhzwt9XcIkkiZMOPHx+4GTT2XMC+WsGNbXN+bddAPuo5l6G4xycWNdaEpXGTPiEdM1ikOe/m/TjqUFne2mQvHdj5+7lVw5hm3UKCvtIXvS19H3zsQ3FDx9lZK+EEnAdgy31us8mnOobKFKs0/F0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvT04c1A57p2tZVUQSmHyiBRJRwM9e60GnBNU0D4IoQ=;
 b=ECfoZGbcOcP7tsMpzJfU0FYU33cQFXo3nrDpF9e7ysv78T6xVYjOl2IMLZuLYBuFvhwRNDoYDu3bVnsBNV0hq1bDlvgOzbq8SfSNYZu5UKPhjevv8HqFGX5sqEIdUUzjxOJSQNge0AxBM4XR6k8UXPwzH5hQi1KssxXbVf6pkjjzbZrxSEfsQcsUgcLMq6silvDn26qp0fqDtB7kuaAk7ReRFn8VlH0KLOZvAJDfcaw1uUBeevMdRzi7Al2kLLYv9PxyzMgKNHAvVMZpoKwk0KIP1TUkkj9GdRpWyfRnEnYlAzYpwJL092pIA+/mkVfxpuNpnNAavN0HypSXFGbAYw==
Received: from BN8PR03MB5073.namprd03.prod.outlook.com (2603:10b6:408:dc::21)
 by CH7PR03MB7906.namprd03.prod.outlook.com (2603:10b6:610:24c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 08:34:33 +0000
Received: from BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a]) by BN8PR03MB5073.namprd03.prod.outlook.com
 ([fe80::7483:7886:9e3d:f62a%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 08:34:33 +0000
From: "Ng, Boon Khai" <boon.khai.ng@altera.com>
To: Simon Horman <horms@kernel.org>
Thread-Topic: [PATCH net-next v4 1/2] net: stmmac: Refactor VLAN implementation
Thread-Index: AQHbstqfHgt1ZgfId0y44506iJ/Lf7Oyv5cAgAX8cpA=
Date: Mon, 28 Apr 2025 08:34:33 +0000
Message-ID: <BN8PR03MB507352B608A7E90E5017E017B4812@BN8PR03MB5073.namprd03.prod.outlook.com>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
 <20250424121604.GE3042781@horms.kernel.org>
In-Reply-To: <20250424121604.GE3042781@horms.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR03MB5073:EE_|CH7PR03MB7906:EE_
x-ms-office365-filtering-correlation-id: 6631129d-a49a-4d55-ead0-08dd862f80b4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BvbcoG2pklyIwU6XV8qEZSJUMAhKrbZcHKOunW4GxpDjJolJm7HfJwZzC6ve?=
 =?us-ascii?Q?gWUVeFbVVFNYiYCftH1YLvroya5s+i1Zdu4nWiqMe80Umhl4P2jKSfb7YkPp?=
 =?us-ascii?Q?NddwGBENV59rQmvLi23xiCMdR9Uf+4y1Aos8L2KQP34y4ZO4d5BgwilB5OKy?=
 =?us-ascii?Q?nb6Q9T69NyoA0sWbVazaBYgrLahu2MiO0N9MWubxw0eavk+0yiLvKl+J9sLt?=
 =?us-ascii?Q?1b324fQ1PTxFNzr4fsFbe91IlU0Ga1ANGgbMNdCda587DHIWQWbXqZBgMQ0T?=
 =?us-ascii?Q?1MM2hTyduh3qzQPECQ56SUPB7jZSbRUQHl2V7g4SVcYHXot30L4X6o8fvcV1?=
 =?us-ascii?Q?Rqr9bhvsCMBcZPvhtbRN2VaIUAhVbCeudHwJQlvqlJPKRnYtq0RDJWu2GWuK?=
 =?us-ascii?Q?vA4v9PGqiLtFcYcoOmOe5jLfHdOuPLda2+J4zHtQgqIzNJNclraEIinmyJv+?=
 =?us-ascii?Q?V6mXCItVChiN85Q6IGFpUHliIFPDbrDMejiWZN+rKWBIqcqvrtlVDBUz8h1m?=
 =?us-ascii?Q?XSmWcbGdUFxnJuvVX5MoaNcWe0L8PAkOWX1CgXqExpiZElUgNCjBnNAv4GNo?=
 =?us-ascii?Q?OBJWqd/ygP1Yd7SfSydYc5rIZaxsoBgZtahCN23hOLR7KFwrJo1dRb/MWHF7?=
 =?us-ascii?Q?RO5+57DucKRvY/8WBdyPjt8Js2tUB3NDAk1JSL1FbHi3U7b7EZy3AoY2MoAh?=
 =?us-ascii?Q?tP6KE7JCQC0+KA6tfKqf/NF8hMbi0imHn8WSaOXXCQW0LewCmR/ve2aNuiSM?=
 =?us-ascii?Q?RoVAx6KzDOuDZwkl4VRyzoF0slmsbC1U3bUwSpV+uNFbC6+AFk2LZ6maA30C?=
 =?us-ascii?Q?sxHm5bB6CihFBoZd78PEOUZay9xRUS8XzsNBax5ngrffMRC4RVzTwKb6qDBA?=
 =?us-ascii?Q?3E9kMe2CfOjiFJXVeX9thAaiJjeLL9G65Mm7lhg2N4+ZHlyS67eqEsrAiErR?=
 =?us-ascii?Q?h4oLIc8eIRMNBFUr/A31UuYKZvyHc4KS76kRTzvNbhEaMuO95THt+M7VP2Vm?=
 =?us-ascii?Q?GW+QsmelQByNoG2Ca14Vqv4YwYvA3fYcC442EJhAmp2c8v5xPGVefCRb5F7J?=
 =?us-ascii?Q?JlQ1uBD5mjS1xU9EMRDgA7J/odsQf2dKmtEJ1j42sDaEMHRe4q0+MriPO88z?=
 =?us-ascii?Q?BkXFeRTxe2eVU+dUIG3dxpPcFT289NzUdsTUuVr8FtcOH9ch7AF5xPAt/9mo?=
 =?us-ascii?Q?9/okgWSIgq3u+zvX6LW94a5nR68892o8ABs4bVDz0cG2rHUVUzSzIwiSSKzE?=
 =?us-ascii?Q?UP8UnMX74OgrNL/fw8Q3d9UCoQWhPW2pXS53dY75nmPehRMXx1gHLju4PhZI?=
 =?us-ascii?Q?IjK9+VRhxqmT5bizQjwVpxIsmSan7WBbCFkvxG3yUMqEBTm2hcyxFuovViOQ?=
 =?us-ascii?Q?8Y+SNv9WK5rCwRpu4VC+xJSrHVsYGQuT4JCAiN5NwBjRugefAfMatadCCAX9?=
 =?us-ascii?Q?srYBSy0varPxVUbCptZT+bInvOrQ6YBnHQfLOJYThVAx/LNj10gf4A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR03MB5073.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6F7KLc+tVKx3+IWINF17FnJi9CSPFFI9AtxJWOZlgt6FmBcgAVxk3r+2LbIi?=
 =?us-ascii?Q?6BqJ1uJAoe9VMSzvRf2nvHPEkq7q5tnbNeCeHu6uiLIqYIYseL1UHnvu2NoS?=
 =?us-ascii?Q?fZBDiUbcYJhKNHq0g91lhU9YbycmLb766ema6dbNK/SDe+il858EQf7XOMro?=
 =?us-ascii?Q?hUtPPxlkaiNWcPALlqJycTOk5SYJmjxCSY4kRrC5Q8qhE1ucEV9UOIeeFuAj?=
 =?us-ascii?Q?sdL13lDazj9dpDLRbQ9oy36RQGIy3mHTRj6vbJ8CiIMXRHGDSEwgrjRUraEA?=
 =?us-ascii?Q?mUK+yRBkN80OZvJGqiXlsaZxrYWRGWPdro7w9qc/kTpqVN8tFYRmwnIYzQvu?=
 =?us-ascii?Q?0Np4TnEMto1srUogUhIMk9bBv2ItsOujprdkivDXY37tN8hZcTqRG+Xatszx?=
 =?us-ascii?Q?09r+vLV8qxRvNqNCNlT91dkIwiBHjrDUcs0NcwBQsLgpwjtA4SbxVGjRzzwl?=
 =?us-ascii?Q?UhOsYP+Y2BT2W2wmjqW4AfzFIm9tYFBNeCLGAJzl/d2vq0dgLK1Nufnn9t+y?=
 =?us-ascii?Q?9OgTfSsWY4qZinMs4CsBupB2n/+d1gerJqwew012GP3PEJ8ZN0AyqghiurS8?=
 =?us-ascii?Q?HxP1Oj6DpL8HxeUAvXk3j34qqehO+P87QiPs9TcZESaaiQaQyIOK9EStnqnj?=
 =?us-ascii?Q?d4Y8QAw3K7jIrcTr3Levp8kMPVpo9S9Y4XdgpDBkfDCKFm1D8rh4Jnw5ENKs?=
 =?us-ascii?Q?PUytrtDGhheVPKvd9KdRx0TsyajHPDa2w9doYawR0Z+HswZCSSvb4jl0VyXP?=
 =?us-ascii?Q?8Bb+yaaOOk9YO/Ti14dw0iBGUB7ltmRe8rNeN9NYs6NWhCxL8KHppQYininw?=
 =?us-ascii?Q?QWW4j2i0xwphcsEbHUCXZPMl3ZvlfnSYQ4N7aCIlob1Su3V3N0AxMUClvMDS?=
 =?us-ascii?Q?kdniwoPBqcPoVs1uc/bjk6Vpm6rR6Ux09pZs+rsqD/d8XsH/s7YgEwKV2rBE?=
 =?us-ascii?Q?uFzOPgvMNN/VPirtkhwe/AsuwpOLgv5Qfd+M5WgMmLOEhR6QxYsbRpSL1N8z?=
 =?us-ascii?Q?TYHiby9psZM6xcjmtqrWkxtCc23C/v8vshg2TNn/C6OCOXh3I95tmaGkGeSA?=
 =?us-ascii?Q?/Bb8fBLG6U3KYv5i5M9xYWIhHclj4ZCwdFMtSy/r6VZ3oxEECTw5KMjXk48x?=
 =?us-ascii?Q?sYsfnHlYsxppgji3XsJsfXuNKZ1hp8N0MFTohPbvXT3ToU5omaT/LLw6cIX6?=
 =?us-ascii?Q?7vZ3mcAx4AK7+g31GCfmtKKAm80Z/ZQ8cySG5b+xa+tgzdsIdDxbIVpdum0M?=
 =?us-ascii?Q?glohpXpi4fawBvuBYQhJlBh8NypZEh65O9OxMSsKp6pTqv/Nzv3p6onkVpSH?=
 =?us-ascii?Q?/Xy+IBstULCf04qVbFotvmmZJO5t6mKm629qfdqoDAAE36CY9p9I/HMYB5OS?=
 =?us-ascii?Q?fcJhTXwIH15VQWFiMD6k7X6cRAP7Fesj3PGeLm2OBfGucF6H0xV7vSrlNNnx?=
 =?us-ascii?Q?B1VqRKZQfzY9R/4ad3ryyrNDpuEXP6V3RlOhusawPt3y+n7Nc4CZQ6CyLATM?=
 =?us-ascii?Q?1bFU5EaZ/E8r37WxHIFLafJreGSK976WCCZhiukZeZDCWG8MgSEmJBlo1uDj?=
 =?us-ascii?Q?pTUcw8azAIul5zw8WKA2n7h0dK9WrAu38OAxXTp8?=
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR03MB5073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6631129d-a49a-4d55-ead0-08dd862f80b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 08:34:33.7200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PswD0cjzK/6yXvVXQzxTBoeasdSF33ulaI+HrELpd+q2evhWfnT+hWyDSaLC5IMg5dOjrBzAhi2eWLms1BTrcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7906
Cc: Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, "G Thomas,
 Rohan" <rohan.g.thomas@altera.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tham,
 Mun Yew" <mun.yew.tham@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "Ang, 
 Tien Sung" <tien.sung.ang@altera.com>, "Gerlach,
 Matthew" <matthew.gerlach@altera.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/2] net: stmmac: Refactor
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
> Here the XGMAC_FILTER_VTFE bit of XGMAC_PACKET_FILTER is set.
> However, this logic does not appear in vlan_update_hash()
> 

Hi Simon,

This is a bit tricky when combining both implementations,
but it seems to be a software difference rather than a hardware one. 
According to the documentation, the VTFE bit is located at the same
offset for both.

Comparing dwmac4 and dwxgmac2, the VTFE bit is enabled in
different places:

In dwmac4, it is set in dwmac4_set_filter().
In dwxgmac2, it is set in dwxgmac2_update_vlan_hash().

From my testing, both approaches work. I ported the
code from dwmac4 to stmmac_vlan.c and verified it on
dwxgmac2 successfully.

> 
> And likewise, here value is based on reading from XGMAC_VLAN_TAG.
> Whereas in vlan_update_hash is constructed without reading from
> XGMAC_VLAN_TAG.

Both drivers write to VLAN_TAG, but they differ in when they read it.
dwmac4 reads VLAN_TAG at the start of the function.

dwxgmac2 reads it within each if block.
The difference seems intentional: in dwxgmac2, the same value
variable is used to program both XGMAC_PACKET_FILTER and
XGMAC_VLAN_TAG, so reading VLAN_TAG at 
the beginning would be overwritten anyway.

When merging into stmmac_vlan.c, I believe we can
consolidate both paths cleanly and avoid discrepancies, 
which aligns with Andrew's goal of combining them.

> 
> Can I clarify that this is intentional and that vlan_update_hash(), which is based
> on the DWMAC4 implementation, will also work for DWXGMAC IP?
> 

Yes, based on my tests and the documentation (same register offsets),
 it works for DWXGMAC IP as well.

> 
> I am curious to know why readl_poll_timeout() isn't used here as was the case
> in dwmac4_write_vlan_filter().

This was my oversight when porting from older dwmac4 code. 
As Russell pointed out, I will update it to use the latest dwmac4 
VLAN handling code in v5.

Regards,
Boon Khai.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
