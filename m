Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lhWRGVSpT2oLmQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 15:59:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F08731E5D
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 15:59:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=TdHuNWfE;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=vivo.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1485FC8F293;
	Thu,  9 Jul 2026 13:59:48 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012032.outbound.protection.outlook.com [40.107.75.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BCCCC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 13:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfCY8zvDyRbfiiA6JN5YPc5geSrsDBd/Om7Pvr5gkh6VQuwWeL18v1+yqqp0W/2sCfniXhmhtY/tpEP/LXHrgf4nP3hzO9n1Iv7ezvRT/GhIXmmZOEpL+qLfCwwOteynLg7PpjexVsehPTH8mBG1tIokVmBDyFMqozAmLEfu4AunQfLd67+hXA2Pwellh4HWKC5jvXEaWmibzQwcdr3EUkBkXxe8/CrmLoDdNyLLxgucY2AFle1VpDE7HwvD3xNq5J4s1Uv5UWQbNdkHBiO58v7I4LRMcMTPQ5W+MsiYTNNEhe2ygz353kcFMZdSBy59ugVhLKpkxtoMUCrrpP+Bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oj+jq+4k3J35lzLRn7Tyh0IxsilfX1uXZ4AEr+ySruc=;
 b=H5xNaK9Hommpk90YofYAs5zyAJVFRRa9rqh7YXmHynPdQlqmcqBzgQMM/q1AELiC0b6kf8eq2hdzsBEQp1foBfpq1LJOUKdYQzl+Ig2vl14SJxguHgvyk/LIHpxRMTZ0/rKLj9W4u0A42g2vC3ogjlBOGo2iJu/ssD6/GltrNnPmF67r2bSZQiVMjSQAgDn0JQKD6gsef+IkyW43w+n3c/8cwRdvMZRKzfk0LCoOVlG0rqN/XjGz7pwEMdP/GUy7KiiltjJ99zkBr0WuBcvfCqF7npwd+hHgseH9EfhrdUJtPzVB3oO8pP/Fg1RNRCJLSZt+6IKKg8/6VzWt8JwY+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oj+jq+4k3J35lzLRn7Tyh0IxsilfX1uXZ4AEr+ySruc=;
 b=TdHuNWfE9JzZ2aiqxNqns1LJwtYEltJZjFMOuHKsZ7ybj9RWceQZtv9ZFAJ6Y//HEZYjo/bxEUnfdJ16i9vgxjQEBDZ+sCQ4twWceBDRuAzep61yj5qM/wx/TgpMRHRsYmTjQRpXuTLjzM4dH8bO8zFwWwKgPwMWjcJfEHN/Tk6cJU6kJASkKhsSkhve7+2kj+w/nS7jKzHKZIC0cegIKsZskKSzMTQRhBVJd9Te4DJGoZKPbCFyiwQdbp42UZ0XkTvEV4G5IO9f2e//TGPsFn0xlxmUAj25y8vlyj5ydIvQVYCp7cQHo6+pHSQK4ZtFF99SQeNC1EbiyERmqskvmw==
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPF271E4F3E3.apcprd06.prod.outlook.com (2603:1096:108:1::7c8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 9 Jul 2026
 13:59:42 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:59:42 +0000
From: Pan Chuang <panchuang@vivo.com>
To: =?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dmaengine@vger.kernel.org (open list:STM32 DMA DRIVERS),
 linux-stm32@st-md-mailman.stormreply.com (moderated list:STM32 DMA DRIVERS),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list)
Date: Thu,  9 Jul 2026 21:58:23 +0800
Message-Id: <20260709135846.97972-20-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709135846.97972-1-panchuang@vivo.com>
References: <20260709135846.97972-1-panchuang@vivo.com>
X-ClientProxiedBy: TYCP301CA0073.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPF271E4F3E3:EE_
X-MS-Office365-Filtering-Correlation-Id: dd50d460-00a3-4b4c-5299-08deddc252f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|52116014|38350700014|18002099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: ywTcV2+vRJm0rdpyPyMD68WydP5nHVxKSidKGhkeUsfx4HiHFNS0YUHDKLwakHtApBOOAVLE9Z2OEe3jlOZer89ZS0JO4HzM7yEM2zTYm5qJQdBUaGNpTt3pTZgkSmtCiaQDZyfZBJkMPxN+kGkVRPpd9boNwxDSuS/7JSwVgBScAu5O17YlBWsJeszMHTJklzTepuIVA92/9mDZnOwbv2F1FkPpOS5QeG3um2z/EpWXNvPil42zTjavf6SuRf1oE3KBWutdEFaTBDkHLHapS9RoXwTXiYgVhhOQAIHSXa0nkU9QkO2BDobffpYgRUtgrDz/NaGrPfwBwpJvZ/8o7Ibd3lahMH4cOawUSxhXeu9UdUlSQKp9zOlluOg9VbwWa8dFmFU2/A5CALLRnbg9MlBq1i7eMFAtQGDvy5vSOW7z09ndy3f7eWlPLIT0Xy36ai8tVoHC5U7eu5VewP5dWy373nKhbT+bfQ8Ah/KHYGIsIZL8i7p6W4PfHnmnywZfp8d3JIhYb/Fb2d2p5aRqUl/XtEq7OLOhiwMmC3TYHXENTMDdsw3tT0OJp3ZSRVQSO5hiSfql3jaGVTE6j0baOsgSmSA2LzzxctSOkOa+vp1CrawOosLP4ob3WNyeVfp9cbRiCz72a2UbCSFTffP+HPmHGfAmyOy2OFkGxpIYRsikEO6AB3u+XKDhFr6+QqWX6saM8SuSeyrlK3ZNRcO0MpFb4aW7ngNeK9UpK7lFpbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5832.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(52116014)(38350700014)(18002099003)(11063799006)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?USPcUMr0U0MhCr5H2J01V+iZi8XnxwJQSNgd3rSbGoYMM+mBQrg629482T6V?=
 =?us-ascii?Q?DfWCN3nRP4UBWjd6musoouRLzWw5h5m8CzA3n8J/zqJr9ifN7ojxcbrABHZ/?=
 =?us-ascii?Q?lZB3oaNWmixROmSDPI3UoCbjSIEt+rqSLMG/ECllp77S1mJ4Rb47phP4m6oz?=
 =?us-ascii?Q?Fws4tLtTP2ekiYjKzwKTTe4X4uwyfO2b1fbZtdlhrEe3OYEH6hxKsbSA9ThD?=
 =?us-ascii?Q?Q8eB+ojWRk6D70H3TOGa/T7G5SdR9n0rYaFHKY8gzrLb3asMPZpmpRXu/wjE?=
 =?us-ascii?Q?uCvUUan837SbDoJvgGD/mzgWDBrZhmpsP6BMXSA8jSwNi2IaFzhm6OUdS5Sj?=
 =?us-ascii?Q?NcnUKDkVq7g3ccCkartpOBUwsEAtXx0c5K8xtZINpCUl47hctO/m2SUdG92l?=
 =?us-ascii?Q?lJyJ1Sw+uMJtCk84eeFxt4u7+fK+q06bxJ2gyISKvuwQxyJtHudarqN7YjZa?=
 =?us-ascii?Q?uPeBZGy6egualJmpTapzJSb1Jr1FUqgBq103ly4IRiz2KPpj1GWnKmj8+blL?=
 =?us-ascii?Q?Te0e1rtRaJHjOv96oZ5JN6RDlsdI2hn3wmZ9/x1NWXXc0gF6c4jy+dkNJhMn?=
 =?us-ascii?Q?2ddxYwQS7gHpkqLiInBelb0jzObJe68m1/wF3eji5EP6yvkOpuhYKAIZvtsX?=
 =?us-ascii?Q?mYuhcLQ9XuCBiFEXhpvFN8O0syYBs7IsTzzgOW303BlMSD9hhsqHNxGiWoqT?=
 =?us-ascii?Q?gpyVJQwg8dfN0exkvaAryjWKJGho9+q/7Mr4+N4AFeEhPojYUjr1Q0PLjgC+?=
 =?us-ascii?Q?pskMMSykR9QhsfP66dkCyibJ6dkbKfiqymSlVZKFAI7OMCA/ly9n/eQ8q7ba?=
 =?us-ascii?Q?JwiewahvhEpmZekJwQJAKngZTxWv/yuO6yVHZRf1m5f7u0UDWN4GJEpCn2jl?=
 =?us-ascii?Q?w5JXVFieWYGT1BF/rlMKd8GXuphIGybBaVBQA/i8pn82LpZh+KiC8gU3oRax?=
 =?us-ascii?Q?IavSpevdPYzmjB1HBcHJpOQpFKILJKOs6LyNoMOE+oHRQlr41d+uVHA+yAAQ?=
 =?us-ascii?Q?vX3aqQv5W+F8j4G3XAHyoF1SIdugCCNzCK7ySZ1Y6go+aZN/aQsqQxpZn+1v?=
 =?us-ascii?Q?0hJqNM8My9kANniVlIgYHWgKZ4rO8KrpxnflbM72GCc5KLxiWi9UKXHNzVFD?=
 =?us-ascii?Q?4dJ3DtcKbzK6AVam5Ui/JOXVvRJqB/PLrj1gy1CGRb5hZUBZ3hNZLO0ttxGM?=
 =?us-ascii?Q?w6w/JnIZaimN2siZUsWME0aFmK5Hx8hk6f2SxCILelWm25O2qXhxyxjrOwls?=
 =?us-ascii?Q?oCxHDkcu9aFc4vKdpotunTIXoMZrdeyKvAdE+OdVQ6K25kg2rQnGkwio+dAZ?=
 =?us-ascii?Q?kZr8brB8f+3wlfYnmu3o15KuXmoP8rOqp7FGJ62VlMHzUaStec4m4nvBhJV/?=
 =?us-ascii?Q?Atpbr66KEKvsvBkPYqz4xlLX6jfQpenTKALEqgfLwxLOoAJ9XAWRfCYDlMYT?=
 =?us-ascii?Q?UIYQlsSNhfkPXf/9OoPf7fbxQtDL4X19PjIXE1Gud7X5mw4PIPGqsE6odfMt?=
 =?us-ascii?Q?OmbZqb5TeQmXQcyXD4lzjfw3JJl9yDT+gBQphw7PNFdg4/4f2Z2z/7smZmcc?=
 =?us-ascii?Q?r3DQCmk4IiWckyw44rynbUFLs4LY5RPvqjAUWiKfD44u0fBOFoJvX9XjMypV?=
 =?us-ascii?Q?V9jQa1Gfkr/T/+7NXL6COTWzrdoKc8N2RKbvRYaovGW+dxUsBvN4POYmk3zk?=
 =?us-ascii?Q?Qm3PSKx+8l/TPdXygIRrSBn388JK9/Et8SfNmFOLJakTfFJGCsr0tTZfcSVt?=
 =?us-ascii?Q?zTgoRaE4Ng=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd50d460-00a3-4b4c-5299-08deddc252f0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:59:41.9197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XhiaFSwVbMbQNFoOwQIOIzT7URNIVZJnR4lqYlhvctmXqP5V+6DGFd1Q0gqW2dAtosH6SvJOZM0Kr7UhOxlIqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF271E4F3E3
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [Linux-stm32] [PATCH 19/26] dmaengine: stm32-stm32-dma3: Remove
	redundant dev_err()/dev_err_probe()
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
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[vivo.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[vivo.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amelie.delaunay@foss.st.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:dmaengine@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:panchuang@vivo.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[vivo.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[panchuang@vivo.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,vivo.com:from_mime,vivo.com:email,vivo.com:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49F08731E5D
X-Spam: Yes

The devm_request_irq() now automatically logs detailed error messages on
failure. This eliminates the need for driver-specific dev_err() and
dev_err_probe() calls that previously printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/dma/stm32/stm32-dma3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 4724e7fa0008..68ed1d695f1d 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1893,11 +1893,8 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 
 		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
 				       dev_name(chan2dev(chan)), chan);
-		if (ret) {
-			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
-				      dev_name(chan2dev(chan)));
+		if (ret)
 			goto err_clk_disable;
-		}
 	}
 
 	ret = of_dma_controller_register(np, stm32_dma3_of_xlate, ddata);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
