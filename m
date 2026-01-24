Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OU+qFTDcdGko+gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC88C7DD27
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 15:50:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B336C8F273;
	Sat, 24 Jan 2026 14:50:23 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11020131.outbound.protection.outlook.com [52.101.228.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD1F9C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 14:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMo4i5u49+G3t4Aqb4ftdMLiWQzEA13EZsfhs7t2C92clbeYTN0IGhMmNbHJcus78ZcRTIFh+Yfs3T33HvOfRX0+JMbdJNxXb4X7Y5r3Ilsoy+yJNYidCt/8Of/Mr0ugbyaZj/SGj6lVpcx6gCbV36h6RELkbTBfamiOYJ1Vt2olNI3NFFHaMM6qVd/a9DHmk4sDM2cIy3YTGFRoiLzvfy9Uv809VDnQe+GF5UiymTqawCj2rIV/13xXkdlcm5Ox0o6G3SI6IsMHjoaK185DK8gNmj5HX+EdQBR8LS1TYsNcyvtkGPMdsuTVwWHFDYd5/4V8oTeGLjIhV27TaC8/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzHmLHiHl09zdrtEBoESDXjnN4gnabBijgeRkh4Eo0Q=;
 b=RLkY0S5NckIrR/9WJ9dYMKPYLIms59t7PGlFje9uXLmctPtARFQXXOSKau/iDJ8JfgV/IG0bSENmEwUfjjhNwSkd/HPAGKfyJvKLRwPkOC5vPmGf7E72Ea+oxwLabH8gJ2LTEzw+7AT0/LeUCg9FtZVlpNiWnLKxeXeWCeDMpvSfOxtZE2O5Vo5Bm+NLKefWWb/9rQEuzn6RwDCnEuido8UGF+2CprKP+PoGvG4lJB5ouJjqfjvNISyJ/XSDqg5LyVSg03QstIujUSSg18jCZVczGCA0treE1kG7I7YqiDQsrvizWwWWoLR2y9qMCpb2oLdaUVcr2fZH9V8j9reIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzHmLHiHl09zdrtEBoESDXjnN4gnabBijgeRkh4Eo0Q=;
 b=hs6dqvzQH7/ufVPBXgpUkYR2PynTVpT+EFN/UDxYJuFvdRRNzbXa2WZbcC8HVN38Qu/aJaFImK4Duer9MI2jwhvilrOsTEyH9QfnusC1auKQ1Z8Ymm6sLLyP2Fk7Rh/ZyJ9FKJz9nXvWiQJI3oGyBwo2rNOy7n1n/TrvO1q+6Yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
 cassel@kernel.org, Frank.Li@nxp.com
Date: Sat, 24 Jan 2026 23:50:09 +0900
Message-ID: <20260124145012.2794108-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
X-ClientProxiedBy: TY4P301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 70290d38-5b3f-4a24-a272-08de5b57e595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SgXOns9ZjoM1KH4Opl0tz5zGjwbFS0fpipu/EX1FnHYV50bEMKiCSzcALdIR?=
 =?us-ascii?Q?n2hNCsDYSJ8bVG4rZcNNahu267HKad+QG8adxbvf6qIW43s3FNiyY1ZqDBJd?=
 =?us-ascii?Q?YgYvkEwupJdqARjQufbhKRKLp0gl0bZ4HZHs6Xq3pS7tVWNPim+dyIbmgoKS?=
 =?us-ascii?Q?t6rxArW1hgVyw0KKIVSFbwX7ci8cjfRiJNOG/cJu4VtgPJRfFaq8QSBg35ps?=
 =?us-ascii?Q?grhJNahcmOsd9/I6A4afL5v1MULQPFn+X5Z2JkQITBiA2NyjSDFY05cCzzkG?=
 =?us-ascii?Q?iya6915mZOpK+1AyeMNgxd13XZ3ZhSo41lzurUh80nMEcWPKGPGyWRzoJw+C?=
 =?us-ascii?Q?IMskEbWadnk7NSllJ3hye2Y2zUDENtnz7nimidsPwMGYrlVhh/OIY5HPf9iq?=
 =?us-ascii?Q?mwQ+hTBopCninoW7mYVskdphexExBXMTTWfSAAAGCukYZyVtlyg4J8rhzziL?=
 =?us-ascii?Q?Xo5ZrCJ1qH04++DrIVbrSJJ/w5/s1pfvyxwFqzT6s+GQGq6G7q/PebnkdvoP?=
 =?us-ascii?Q?0IenWFIxTi+sh6AzU7hlYMBjnNs1zhgil7nAEijzJGUUdJPdvRb348MtV7r3?=
 =?us-ascii?Q?zed1oPEKCkFzToJyS2RmeROiUdSMrZFFgAwoLvd1Jx3S0wbm6r0V1fhVcFLl?=
 =?us-ascii?Q?vz2gqw50lKvdBz+sXQiTLNTS2GU6AROOm1JAk7EmNDcq0hMn41QJRTdNbdoK?=
 =?us-ascii?Q?Yheo+dXz2PmS8dtegatknXA1tnvPrXbpB+XW/+EWccLjgwlmJpM4iX+xl83q?=
 =?us-ascii?Q?/GM7OABKVV6d04IrdQZbqBlGsmSDZlYoWtd72mOPJQg6jxt12bA0LBCfi42N?=
 =?us-ascii?Q?rKCUj/bPEAYC12i38HquALlE5WTVQ5l5WcXCNdaQ1LXC9yI7kAWOhwVGFoLk?=
 =?us-ascii?Q?zALLrx2BWcNGMo9ZFuuvIa4Svr9PtEM5pLSXtpljeU32e+tKTUuD9uk4W/D7?=
 =?us-ascii?Q?aQlT184mvX8fDnezPAJtuoz3Rk3g8HwQARIzdeMp2UA+gwrx2nFoHPiOTJR8?=
 =?us-ascii?Q?Qhpg83oae4i5UfCvN6qjqdSMht+wGv90hWg5OHqck621emhUyDhl0wJZNycs?=
 =?us-ascii?Q?ff8j9dTE2RtPrzD5Vzt3/w5SD3nBK3y2ZXNxKg2UKBAgwktCXK0yKWoqLsS+?=
 =?us-ascii?Q?n6BwtvQ1ahbx43Uly3UpRt5a+Fd5H2d8x/l8vrsyJZWc1MAtr68+kJi/5JQG?=
 =?us-ascii?Q?IVFGr2Wccr2DjD82+ld6dsf2kUzbphr6oqGol2C+en6cH0TEnXPl3XYUZUy0?=
 =?us-ascii?Q?mUpC2Xbz/+7n6BnTnO0nHsSKtWAX5rvc7/bba96MsczKd9w8g51gRAXXgTCs?=
 =?us-ascii?Q?Yw2Gnjljo4Q7FX+Auj4q5ONMxGtIk/8tdR5AWf9JadAj2X8QweKySAACcHjz?=
 =?us-ascii?Q?Fzf2j22UBBPOL4l/4vEUAjRMxBjsS8o0ZxccLS/LG/mTBJEVvRY+XQmJ6ru/?=
 =?us-ascii?Q?rz6gS8pxjNUt0X088bQysrpiENdjE2SIT9F8rvgLjOBW9tH6Ge8mZGD/3sRI?=
 =?us-ascii?Q?jkZwITaA7WvqBlDKM6SwwbLLWXM6MeyIEu+spQcYUTkxDS40H3p1szKI6Nmd?=
 =?us-ascii?Q?fBMOffsvaK7BXrnoVro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9jDK2FJv/rXZN1cvlJZL8XFz08qOMIWZms4TffDAHVXVcLseDTpNk1QwAE1B?=
 =?us-ascii?Q?3KUghYAy2yjduQMKkX3iSKma5MWQP39dwNbrmHLZ0OGny4i4UfUyf5uLMveL?=
 =?us-ascii?Q?nioKzH9U0LbOOa6zsECMGn4AL5IBA6tWgrQ4t+691WnjzvlYpxCGcx9uPcbW?=
 =?us-ascii?Q?4vVzv3RFjurYWCv68taTndtj6PIIU/XalfuvMNiqvBbgz4rMy3ofSdnNcCiU?=
 =?us-ascii?Q?uS7MyzrfIKWnCWRkRYxlbP4pVsN4M7ob4+od58E35HxKSKwridr22ge7Idoa?=
 =?us-ascii?Q?b2vZQKFYwe3tATVMOHptaxJRAInXyJKYfibR35pfx/XFZ3SyHSbCwbZI5KJx?=
 =?us-ascii?Q?reHeZGUhGyHu6pb42xcsQxgPjtrRgjME07Az/V3B+ZdItVGzZwLvp9etw/Ud?=
 =?us-ascii?Q?rXH1Pkgy9qBU4qEuzrA1clSOFxwXM2AOqAk7FWVrxmlsd9S9wBbclpf8shhQ?=
 =?us-ascii?Q?zGQKafcdVAMTXqkq7J12C/oEm9PGuPOyo3Kpo2R58mTi9Dh2EmpcsXoJ3OHV?=
 =?us-ascii?Q?OwwMjik1efXMRjntlcX1+v+/rnmoXh7lJED6T069P+6O/kApSEs63QDN0CA5?=
 =?us-ascii?Q?n8eH9jwhaMgTHTHT+LiDb6xo+cTpK7Gqfmbntq3XhKwn34FU8Z1B0r6dgP+u?=
 =?us-ascii?Q?GP4nAccEQmhyLDcKIvIG4IhPFAxHyUf5tLGdga0o0McBBCJdT5ZrJwDcoXbW?=
 =?us-ascii?Q?iWRkYZ7Cp5lXrvZu90STacfVCPDDz+IkcezlObF3tw7CayIGwKN5zXwiYxnA?=
 =?us-ascii?Q?1kdoB7L9vQU8JG2OWuAO6VlOHCzwgm49gPoE4ZoQusKU6gcpoRK/j8S+2b++?=
 =?us-ascii?Q?4Zg4EA5oBVGld59bvkI4q8Eopg/ID1xNTTC5qOOtl4z2DDuyF6mkwdVwUNfv?=
 =?us-ascii?Q?zvH7ZHKoRYA6nxer4kaM2R4oOVMBemFLdlqRiZ4nC+7463dIODdURLSSIfGC?=
 =?us-ascii?Q?7ZUJGfGuDDpHjdilqOkkrVaQKTm4lo4+mYDNhcdihrLSJeY9F09oe7p1ocM0?=
 =?us-ascii?Q?vSNeur/vS6wUFsMQ2j8lwyBLfbI0ynTqUd1+9refSpLcxFN6F8gGxibldWlr?=
 =?us-ascii?Q?zkVCQrxZjKzbjuV1AwFah/ZsB+BwQIeHQ26CONvQcUMVTI7y7CQ26GGqPpZC?=
 =?us-ascii?Q?EXwzc9HylC4P8dS+uFT39UuOH7f7+6lWFrKiCRHCt9VqjFLENmTZo2NDxqce?=
 =?us-ascii?Q?aWnkJvCz/HT2ctCNKeJJnZpO5Nz3FkZY9bqze9lJQKSyNiqWq6k4gzNb2otr?=
 =?us-ascii?Q?vsqFpajqBVsGkk6t7EHD/wbeWI83GvFbJ2ZXDj3h4XoipAEUvLrJndbHLRo9?=
 =?us-ascii?Q?q+4g/Z0hNi6nSbvD01sMNF3UUwRVKF2FTuyYQG6HNUPxZbP76FTZAMRu8Yai?=
 =?us-ascii?Q?NvWsDPOwT4YoQyYKYilVkMslXSx9c5BCOV1SMVbLDgP7Wx76+iIaaDMCmN0u?=
 =?us-ascii?Q?xD3hhNzZ9OU54DOe3GS8E3QLpqY3x0eIYq882iTyu+U5ByqUa4NxwKst4OZx?=
 =?us-ascii?Q?p/jkZMOOkItdlNo48Sl19+JY/lr37U0WD99L1nt0mCAWD1zAMs0sHwD5ShYT?=
 =?us-ascii?Q?Ey6sGg1c3UDIMVx6GqicPVqmcGGpi5f8YqVUJqOq+9oj3LPtxZUvJwtRWbvo?=
 =?us-ascii?Q?77bpewWMJcqL8GNMEShfedUWgJcKcsnkvoT1Uu/ljytMleb3zzyCjdNjBzn3?=
 =?us-ascii?Q?/ZKfnC3ySipcXPHE8meuDOldG4zJrgKWUnynC/rlqeHfBg/uvZu07JxKOppB?=
 =?us-ascii?Q?yNapIYiFXr+kiT+5ckz+E6qrJGh20LR7THPX0YJJ8+jEi9KbTIqN?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 70290d38-5b3f-4a24-a272-08de5b57e595
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:20.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Swawd/VRqLNxxCg8zpLw1hjAPR8zf0F40ivMYvbtBdoP5xOJIZcA1Sm3LST094hV7g7aRNQDZDI2mRl4hhkeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, shawn.lin@rock-chips.com,
 christian.bruel@foss.st.com, thierry.reding@gmail.com,
 linux-kselftest@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 srikanth.thokala@intel.com, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, marek.vasut+renesas@gmail.com,
 shuah@kernel.org, hongxing.zhu@nxp.com, kernel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, rongqianfeng@vivo.com,
 mingkai.hu@nxp.com, roy.zang@nxp.com, minghuan.Lian@nxp.com,
 linux.amoon@gmail.com, linuxppc-dev@lists.ozlabs.org,
 yoshihiro.shimoda.uh@renesas.com, linux-kernel@vger.kernel.org,
 vidyas@nvidia.com, linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: [Linux-stm32] [PATCH v10 5/8] Documentation: PCI: endpoint: Clarify
	pci_epc_set_bar() usage
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[valinux.co.jp:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[valinux.co.jp : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:cassel@kernel.org,m:Frank.Li@nxp.com,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:shawn.lin@rock-chips.com,m:christian.bruel@foss.st.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:srikanth.thokala@intel.com,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:s-vadapalli@ti.com,m:marek.vasut+renesas@gmail.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:kernel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linux-tegra@vger.kernel.org,
 m:linux-omap@vger.kernel.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:minghuan.Lian@nxp.com,m:linux.amoon@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:mcoquelin.stm32@gmail.com,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,rock-chips.com,foss.st.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,kernel.org,intel.com,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,nxp.com,pengutronix.de,vivo.com,lists.ozlabs.org,renesas.com,collabora.com];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,valinux.co.jp:mid,valinux.co.jp:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: DC88C7DD27
X-Rspamd-Action: no action

The current documentation implies that pci_epc_set_bar() is only used
before the host enumerates the endpoint.

In practice, some Endpoint Controllers support calling pci_epc_set_bar()
multiple times for the same BAR (without clearing it) in order to update
inbound address translations after the host has programmed the BAR base
address, which some Endpoint Functions such as vNTB already rely on.
Add document text for that.

Also document the expected call flow for BAR subrange mapping
(pci_epf_bar.num_submap / pci_epf_bar.submap), which may require a
second pci_epc_set_bar() call after the host has programmed the BAR base
address.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 0741c8cbd74e..4697377adeae 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -95,6 +95,30 @@ by the PCI endpoint function driver.
    Register space of the function driver is usually configured
    using this API.
 
+   Some endpoint controllers also support calling pci_epc_set_bar() again
+   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
+   address translations after the host has programmed the BAR base address.
+   Endpoint function drivers can check this capability via the
+   dynamic_inbound_mapping EPC feature bit.
+
+   When pci_epf_bar.num_submap is non-zero, the endpoint function driver is
+   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
+   the EPC to advertise support via the subrange_mapping EPC feature bit.
+
+   When an EPF driver wants to make use of the inbound subrange mapping
+   feature, it requires that the BAR base address has been programmed by
+   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
+   twice for the same BAR (requires dynamic_inbound_mapping): first with
+   num_submap set to zero and configuring the BAR size, then after the PCIe
+   link is up and the host enumerates the endpoint and programs the BAR
+   base address, again with num_submap set to non-zero value.
+
+   Note that when making use of the inbound subrange mapping feature, the
+   EPF driver must not call pci_epc_clear_bar() between the two
+   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
+   BAR register or BAR decode on the endpoint while the host still expects
+   the assigned BAR address to remain valid.
+
 * pci_epc_clear_bar()
 
    The PCI endpoint function driver should use pci_epc_clear_bar() to reset
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
