Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA9A3D91F
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 12:46:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D078CC7A824;
	Thu, 20 Feb 2025 11:46:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA339C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 11:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+oSM0VmQwv7GhcMs++zCDAR5MCpJYdKejv6a6vCiwPl9MYy/J7P5Fm+305e/TYVNfoYsA1E/NAPx52Nt31o8apt8ZxQWHdh3OYXzwud9zZ0vbcEBOLxclq+m5KQ31NMK+LSG4mO+laC3OLNsHTDe2MKxGoqWms5fUpEmBIKbhl0VN3cmNlzwOriotA8MhRLlCY9yocGmrl0ojpubh2Mx4/rVLSY4JoiI6e2wfAOzApHpsMz3pa+PJXCXJF6SPndz61Dnew9fEcoyhtyqIO3MSlcMhWLML2cSFzZjhuTs0ZQ5ZmRqVOwT5glBAKkGntGD0Z+CjXc/uPC+H/nHazwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4/hn9HQ3VIGBRcd081JpOjN0OC3Sm7s/4GPVQbWFb8=;
 b=SAlPUyP56FLdhr871HttA7EewdFGrNp+cENod/vmP4aVfoII3Ygi9Af6zvi/jJLmtlCpZKeIHdMwgPJbtuExtboEhwYLyFiWeiiCpKajlEs5ARxIaGEtIhTTx7jTHKGfUrlgQ8hpgETzEiQsA6v/khAhgIZ3lPNilIz5irABtO3Co64qVZbM3J7oTJbbeYs4yoSQVMUy+5m8RLhl0RDzR4Rw5b3d3g3qBOmHeIjHiRufA/GRj/lbJOSJ+xsI0wGNZdu1ZeidvTo+/iD1ij8wdfK6J4+i1YLT2Ff3jOjsm8E5EkPqfM9zzojU249Zs+6IY6yAqpTiGLbVnegNoKtw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4/hn9HQ3VIGBRcd081JpOjN0OC3Sm7s/4GPVQbWFb8=;
 b=VrvYFQxKOv7YsJkX7jN8pILEiSrzQjKC7cV9fu/2soEuxFWTtUj/1nI4OiqxnxkFmJMdsmg+zgZxR9Fs0tYOlhEYf3Ok+6kYSyilrzECuUr0hdJUSC6L3tWx9NvDeLg7nZAZWcR652kKRzXUNRT9simyZfzB1zBuXvxSQbPUPu4WJC7EsPgH9nXot4qx0kYpZQw3+b23GYEU4ZTAmAAhLB4pqidX6iUnnsfwXmFmgtHlFUfBtTNF9YlhUMtD5XuG5X7P2QC3fcibm7wP4BaPVew4T9FLe5bwBCK07pxcpelHSvZBt0s1MiX6IQdqj51bvPsV3A2INuz2vj5/8rBIcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAXPR04MB8158.eurprd04.prod.outlook.com (2603:10a6:102:1c3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 11:46:23 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 11:46:23 +0000
Date: Thu, 20 Feb 2025 13:46:18 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Furong Xu <0x1207@gmail.com>
Message-ID: <20250220114618.3ukkmvau4rzd2a3h@skbuf>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR04CA0107.eurprd04.prod.outlook.com
 (2603:10a6:803:64::42) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAXPR04MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: b223d59a-0447-4e4e-535b-08dd51a43303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y5ZnwF7fxgBXc4z5N/o60d97xL0OTTOA5gu1KudahL1azAgy400lZG9jO+UF?=
 =?us-ascii?Q?SvbTtN+GlNMxke774ouG00WyjMahZosPbkUnERgRsVzgGDQzBBzMZy+4vmzI?=
 =?us-ascii?Q?ysNi6S2PreDlo5sc/f195ziGp6hlpSNO1DOR3AWKh+lJXai47Eq62moJXfeS?=
 =?us-ascii?Q?X83UdQS+QPkvwCpmtvYA0wnp2yP8fS+khbC8l2XBVJTCkFxP9h9C7o9xhdv8?=
 =?us-ascii?Q?xD2v02jNSSspAQOjDZ6kblYi++qQje0RN/prDQelNYTKa/35A3lScphiyyd8?=
 =?us-ascii?Q?cGOiISZ6RpM6/t0++Id4VlCYAWKc4AqZ98iPw0jXrZVxxtKA6uQ0VZF9aNyn?=
 =?us-ascii?Q?3O20YaQB56wiHI4c90qz4HMCNN+8145ahca1o95k/28+x8tJcBdqhWJH52zn?=
 =?us-ascii?Q?5MqawRRvj67u6WPqkx19YlUXkLxjiQtunSbF5lzIwxBiXaeELA6OXqgk3t6C?=
 =?us-ascii?Q?8dUwgj39ZDXqbdmW7Y+pQpopG+IQ24kIWV0F2JQp4wJ9tlvS420017zqZTGq?=
 =?us-ascii?Q?/wdmLbHCi625a44z0N8SQoeImY6WNvysgUmibpYTTR7lDbVAQetciLshCnc7?=
 =?us-ascii?Q?FM98StXrPdS4h95Dw/PDjQpe+bueFOXgI+fDkqodeA5t+bOrO8cW7BYh5oIm?=
 =?us-ascii?Q?WoX1jAG/dAJiiKQw8rv+RJxT+LCMawI/Jd/rI/Dcfa37/0uX0Ql1RiCiY32i?=
 =?us-ascii?Q?3RVUzWHguuj2V3CVQparRWLvejnMEeXH+ifLlS8Acs2ESffGfDJAZeP0MiLw?=
 =?us-ascii?Q?tkGfsoDXnRvNbb81gr32sCuRhOTrtXksHp0j6KY8L2ko1v3pVyYQMv0hk3pi?=
 =?us-ascii?Q?/f5qxJ6X/IMx34DCFybvcoEFhdNNfz6I1gCMeNnBvpofT9w4UslZdJRGtLue?=
 =?us-ascii?Q?6mvRygmupjHdnn1qqA43+L4oWdELnpE44E1ZSwrc9Cp+PMJTpiaM/E9Qi0oc?=
 =?us-ascii?Q?lzsXwmP3vBHkJs2LYJQtSbSlG180QXAbJ5uhJnpIJv4JF7+GIdP31Af2Nuae?=
 =?us-ascii?Q?iHtSfrJZlXuD2HjpSjZ3hRMQoQWajk+RQzi9gIqhVC1zkGXajtd5YZnV0yFL?=
 =?us-ascii?Q?QDGru6uMoiYbnXnrOmW8+hN5WFiBVyrcdBFiuySZnzijVoZymCU51TLZubtH?=
 =?us-ascii?Q?ocf3cho6cdgpBvj6DBMhDBlEOmdCpMqbxViqQGdOqpchJSzFcuGNvlrA9qkv?=
 =?us-ascii?Q?EPt7yGpgdVI0CbI6xvi0LtBlcGEA7wawFza1UM2gT7AF/fOCY+fB12Ohxo7S?=
 =?us-ascii?Q?6Guu2GG/UIF3RdZoNqBIjApUr/l5skIdwOHSjVoBlCoY1MctWoKazniCweXy?=
 =?us-ascii?Q?UTy9EydrOF/hkio3OIPH8cXbipldtBuRopvfZ7H1LVh0DsRhD9k6pDTtMBbZ?=
 =?us-ascii?Q?t9uEyJfsIqIq2Fb6JgSqaQ2B3RQZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hyONZVZXEWKcUhrCFuuowZMuCEcbjvBj+7FA3aDgny+3SdFWUMcNQSSKQPF+?=
 =?us-ascii?Q?VEfY86JBEbaoqWpkFuJofoDks9AHq/xfQVSujl4zoxMLQEcR3CAkfmQRnOEw?=
 =?us-ascii?Q?PM4w/GULv0rqkjJ9HY2rDqvh+FQ0W1TrszNjpNCNX+DX0wj8DU2LyhdwVe8b?=
 =?us-ascii?Q?TxU14gD2sTvpsD1OsopvJIUCgKtv6tqIYpE4Hv9+auj6YzdtC3lpZ3jgFX9J?=
 =?us-ascii?Q?R/29gYldtOLTlQKCLVi5BmkOjxAwR93bFdafbK+lkXx+svrbdHf5VkJWOh+P?=
 =?us-ascii?Q?nRUR8YjqTz/HDgTTix606e1SX1SrYgkrtwMSMHkJ/p1tuWeoPurPthLSqB7i?=
 =?us-ascii?Q?gioabyP+NGuh42CQu0F3DBxP0UpVh2UqkS1/8uzNsnaih3znGM9HZcK6sgx6?=
 =?us-ascii?Q?t8QRyMayWvCGrxzFrBsv34V0DyvLJIDoaesGKkoqAjodughj6gQTS1NWVM+5?=
 =?us-ascii?Q?5ixOrHRH5yx2pfV5aqbVud2gpotkDfyiANbQMcgIphmM6BADuvae/L+5eqdU?=
 =?us-ascii?Q?UgfoGqg8oKC0UrifFc9EVytqGp3ZyTInVoItFIuC9rvsEkix7wKVMQnUdp6i?=
 =?us-ascii?Q?dx8w5iy371vhAEYBOqxKA3oxvpJPHC2B2Fygfl8WloQGX2R/mVlSyQfVKVob?=
 =?us-ascii?Q?FywwXTvIYFrWThWEybUc8D9e4dwM5kYARyplEKhJJPNQKQqjeei0HBZiCl+5?=
 =?us-ascii?Q?j/Ydj7CwEJ8FzcWXQgymFM/8PWaGK/kYjpALSpdm/WGINu3QFr9Cb2gKjErV?=
 =?us-ascii?Q?De3xjb/tS6NMAcWUioEzbPcyEBu3ii4hAxxZ4F1zf1ICPEb+C1rO2N2elkDC?=
 =?us-ascii?Q?XZyOP5mwB7xYTk8onpxk+JCWoqRE3SqCZE9BYJTnKtZOT2HKT7BFWlOB4PwC?=
 =?us-ascii?Q?AH1HtHZnMmn4U11wUiSV/pAi0k/CuM+K7qlrbXBoUQfGesLyHn+ywZ49fsAl?=
 =?us-ascii?Q?f4Q2raou1ucHFumP+caQtgzpf4Pa0HGaLl6Qa91UbYytKMT4ujOpuHkiN/92?=
 =?us-ascii?Q?A95nbPn/W1R6qQnLEy1jgJ8uROqbnRnDJKSh1Xfo4zA8KinvRzK53Neu9Z0y?=
 =?us-ascii?Q?aPOyMrDGKwpqSV8jCDIo8UBh/qUILat01TNxaK4cv/LzXKr72NAOBmrjGVoV?=
 =?us-ascii?Q?t7e+irM87i5b3dsXAqCko1YHKF18ljGke9fMNPFYuOsNg1kN0JPID0W5Zv5F?=
 =?us-ascii?Q?7rowy5PGDtmLtchYkj4rz++Dm7SPij2FrPtTkTpcttAj4Y1p2aeQz1ujKbMa?=
 =?us-ascii?Q?MxzQfo2ES8CU9ADTlBeklrMyd6qPw9AK7S0ifabtJ0ntjde0gs9QLX8xydhV?=
 =?us-ascii?Q?k73k1WAO8nW1ONZ8gucGpqV55lTf/GdwP511DJpc3eY8E9EqI8fM+dlm7G8O?=
 =?us-ascii?Q?420Xa2tC7e5k4oRZm9boQH6hbesPV8K8MbT2YRkEIH+4xNdGPSkefazYbFQU?=
 =?us-ascii?Q?YZCKjMV9i4cO749zs1QkDOFJkSQILYwbmQOQYNkbgRdOuTH2dneovhT+zaiV?=
 =?us-ascii?Q?mQMSGhCi1QcIopfHZ+gcZ8gvAIXPiNEYR7aGkWC3RI29obJL/dEvN7qO8s8m?=
 =?us-ascii?Q?1B83qqZDFLdRtC/ZTnSB0/u8fdYJHad4jl4el9RJEJv8e9u/geFgqfMaQIbx?=
 =?us-ascii?Q?Vg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b223d59a-0447-4e4e-535b-08dd51a43303
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 11:46:22.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fr94v0stYk0CgEHCJkpoIiOtfKUSJHWpegyIljyLATyVI8IrxrWZaCo5RcuUjA8fFCJhhzSAKq/7PJyz5NQIdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8158
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v5 0/9] igc: Add support for
 Frame Preemption feature in IGC
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

On Wed, Feb 19, 2025 at 09:53:40PM -0500, Faizal Rahim wrote:
> Introduces support for the FPE feature in the IGC driver.
> 
> The patches aligns with the upstream FPE API:
> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.1156614-1-vladimir.oltean@nxp.com/
> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.73054-1-vladimir.oltean@nxp.com/
> 
> It builds upon earlier work:
> https://patchwork.kernel.org/project/netdevbpf/cover/20220520011538.1098888-1-vinicius.gomes@intel.com/
> 
> The patch series adds the following functionalities to the IGC driver:
> a) Configure FPE using `ethtool --set-mm`.
> b) Display FPE settings via `ethtool --show-mm`.
> c) View FPE statistics using `ethtool --include-statistics --show-mm'.
> e) Block setting preemptible tc in taprio since it is not supported yet.
>    Existing code already blocks it in mqprio.

Thanks for the work, the patch set looks ok to me apart from the minor things I highlighted.
It would be good to know that you've tested:
- a netdev down/up cycle
- a suspend/resume cycle
- with CONFIG_PROVE_LOCKING, CONFIG_DEBUG_ATOMIC_SLEEP, CONFIG_DMA_API_DEBUG,
  CONFIG_KASAN all enabled
- the kselftest again
just so we have more confidence we are not missing some non-obvious issues.

@Furong, the set looks close to final state to me, would you mind
leaving a Tested-by: tag on patch 1/9?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
