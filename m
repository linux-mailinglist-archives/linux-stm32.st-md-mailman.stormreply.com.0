Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jqEiIZARQmq7zgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685A6D659A
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=bLrsfzFM;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39EE6C9AE44;
	Mon, 29 Jun 2026 06:25:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80B07C424DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 18:31:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvNXmCvlqmJJjRrLWOb4Q2CIhyQURhuEVioAk2M0Uu91ms9b5WfTDcirbqxwomzq8fItm5/QCGa9Fw5y2Wnvk3u9kL5+yNiI9I/oa0T9CBsTr2JMXjxuVSaQ1giWReBpLfzeXhnS2gLmm+hU27IL3OixyXy2kUN17jC5EGomxXsvb83HFuxuJtVEZypwSEyhHukf7fri1SP+uIo54tsEqNg5f1wCGcY7sHpiz9SAtC4EZKf4uGe+FDcIO3EXsZQhLsMmKwaqAuexIj2lyx9n/3NQ+U6ePxnFUy0CJyr5IBXGJNhYQq8wOBmk44B6js4UDed9OCwFys0loHv7ExXeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knZGSNK+WfsDl49FolwSmSyQOJgxNJi6A58awQ3htQ4=;
 b=E2NTxYGKBtFRYa1V0z50j1616K/JbKcPiAa7ThmeKgmPD6jsBDAMnErVwxqkFyzA05wZdMUd9hIPxdL9fSF3/LnePpRZVOzMuD+Hu78YLxRUm3C5vE3DR2cc9Xzfd7+9gForRo0wfoUSiFd+DcUGHTVENSgFQpTHcj6iyWsDNfjXIvxKqihENnWcV7X5hjOKIcKwu11jdYqBbjDor2WbB2nakcuXd3js43MC8AO99lLzrKI7w1ohnF13UgZgy5GRnh778K7FOHL2+y8JhpPnVDGzzx7P0cMKxLoVEqe8rlG4DYije38dO/HECooJ76B/FW/76PD/15ccsSfHW0WwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knZGSNK+WfsDl49FolwSmSyQOJgxNJi6A58awQ3htQ4=;
 b=bLrsfzFMuPq2QIdAg+gNJmEOrki8viXpgHUugURu974/bHMSFJ8xQ3D/B74gTZgXK/neneKQ+4/HmvvRg4n96fqtcYhYJyOBblP7F9IhQ87GHm7382YJhWTQLSIOFDhQf5Fj0uNQuGsckFVB80J7AtUveHUa8laeoInbjVIkelu7zFtug9bcvGm+X19lQLiVfN221oxT74hitlLzbtRUdn+Vayo+rQyjojLvP3C4kO20NoTWR5h8qpoK/pUIG6BqtXP7q1Qd1+S5InRcnJV5UXYY9NxJfEPj0CLhi1ziFdNaEhrVeCcur+CB8dymlKLzj7hwfbGHF2NTCPZM4FF4tA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10951.eurprd04.prod.outlook.com (2603:10a6:800:25c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 18:31:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 26 Jun 2026
 18:31:49 +0000
From: Frank.Li@oss.nxp.com
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linusw@kernel.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32
 ARCHITECTURE), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE), 
 linux-kernel@vger.kernel.org (open list)
Date: Fri, 26 Jun 2026 14:31:39 -0400
Message-ID: <20260626183140.3499179-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: SA1P222CA0129.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: f39e96e0-d7be-4f3c-981f-08ded3b12f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|23010399003|376014|1800799024|19092799006|18002099003|11063799006|56012099006|921020|3023799007;
X-Microsoft-Antispam-Message-Info: N2dIWUpPdvBhFg8KMGTcy7vH7qPsq46yEXod4Yzq+npZg0ox58xGxmmsywULIHWeWtR8obpU0E6badHdRZKVj0HXquqMGGXVfAILv1YN2weOcgyd21NhFlCeYdnQWfciIFTrWHQv9f0T2SS0ffv10CJQBE+JmRcv/5CpZ3EVGAY6OIuIS9MQW1hm/Cwna2Hz4rVXcuq5wsfYQ/0Lhm3CcWUxQCNdueUbPbnbvXD2OBQURnwEz//l84LXviUYZaoRKeEJDqYjEd14nnEKcM4o0ggQ4o4eyvuCwHwGYHGpcnd+788Y3PyZTriSBJU1/1itTUMN/C3uhOH8pgo2/ERdv7eGf6MB30GoUkB3dCPZHdL5ZkJoRc9+rTweQK8VQfywPDjT55a61oVEtORpj6CWcG7gWg/7zwrvSwTmrZvD2BwND2+1hLcYw/so76JozOIAoW3ZVI8BsMP1fM6P1O/LnqqRmcG+zjPUYvXg7RLjiuDOoWODMytbzJEjAQUVhbNoDFFiYKHDyWhVDLi/hJ4ar+RbC68+NbM3SDs0vcB8UvIbs1KXm1vN8hFOFSyklCfb4P1uEqYiiz82hkbP2sxaVVeZzJQX1FieB/uyNb7O06X4P+FPCgR6vVZB61/yJDa+ZJXOi3V6fHI+zc1wH1sRQKU9+vJ5IFscYihkFWkmZaxjJMyoLfwaZz7ApOxLwWLVIYWr8bzCjm2A0g5z6lL7gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR04MB11799.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(19092799006)(18002099003)(11063799006)(56012099006)(921020)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yRjfk64wPIRKxlSMGRDy447tJRTIdIp3XQQwsTBUqNvgjxnR/O021X8AKj1B?=
 =?us-ascii?Q?BCydeSyDlgAc5fgBDaCT4wBWX6Gs+l8mvhifsi96Jo+eraccrw318eqmmjOX?=
 =?us-ascii?Q?lKbLJd7spVsP0dcqRXgIRfMIMpvLnATwgA0pol1KY0EsGbbVslQdWXNahWfE?=
 =?us-ascii?Q?7WKJOQUCWLdH0YTal8He1Jp1/0+M7PXY3A40sXkpFveqKh7MTCm+dTRTycgm?=
 =?us-ascii?Q?BB/ygN2l0od5I+hV+FoVA6vr1mDb64r+On+3K1ZBApnxpT0r0er6CUW8cbbb?=
 =?us-ascii?Q?t8sg5FhTzKUPK+g93iAF5/hNd5WQ1pxOubVFrL7r1Y38Uh/Gj2aBSSswyarc?=
 =?us-ascii?Q?TCtFf0e82DzJc41POlFot+zeiWgpRRJj5z4eT8znpDVkLmXy3uD1sPm80Lkz?=
 =?us-ascii?Q?1Kuo4QUYGi9pbGfv9pXZ3nsWCgF2aXxJ4FKHfZvGT4QaQ+PDipVkZJPD42SB?=
 =?us-ascii?Q?yyAbHqaifyMo4V12eRkEkYdHRIWRHS109dNB2rth+thpzAnKONSwTY49mfyP?=
 =?us-ascii?Q?EbHSxqryQxAG4IF1vNuxUFfY5Fyb582pYUVrxEJ6ekQ9t40DQRBAvOfUhsp1?=
 =?us-ascii?Q?lgZFxnWwB6Fg7CReaHm5FAFDZRNAd+Qw0tv4mFIM2kFo0OqJtVeM/igoFKhn?=
 =?us-ascii?Q?tdH+M2cim+CtW6orEhaDtnOs18A1tvAmze+PNgKhrhIMfHiLYZX24dQXwgnm?=
 =?us-ascii?Q?79OgyeLvXYIpWph/0sJZrfKoOmb2WQLSvthLTFEIZqRhpK4UGqZkzl73dFh/?=
 =?us-ascii?Q?rTCb2ObcDd2r7AFkv7ilDBUUOWopPwkR4dKT9ZCKN7MXEbQ9FNcbAA7XOL2/?=
 =?us-ascii?Q?SvVjZFSNgx6tkOkZAOxVjhICIxortLouTBH0KyDG9Lr+KWDeF2xyFkTN/QIh?=
 =?us-ascii?Q?emCRJmK4DhlsIWamiTOX7NjW19xsgUASYEebSinM0vAyvyi4nLf6kvc2Wi6t?=
 =?us-ascii?Q?n8e6I8RWvVjofYeP0zTDhb4i65YiGdGiAJux0naEzimO7tYGXCmYMmTOFnex?=
 =?us-ascii?Q?MT32G/E/MM8JWj4W5AoD7cehCe+Oy4mXXiCTO7vLzpLJxYsVN5vVwSiNN5l2?=
 =?us-ascii?Q?gODgfpRKTT/Qb+TEVExhAUvgRAyPEyvO2TNoynXcroXABLM+hjL2QPAYp/JP?=
 =?us-ascii?Q?UY7iOer5w4kyknF13bYtxbxrgX8vrJOMGWeziyhUI0dm57I9mmqBlwFo0RTk?=
 =?us-ascii?Q?YrScmcAWPoQlbjrCteCNX6yCdmCfvKJCwhdnE90J9Y+19CV431L/CKPQzS10?=
 =?us-ascii?Q?EbUZoLG9syG7Udg/PVTHUMBb43wrfZHPD7WsinCql+Pk2Bl6OnMi7tTSqnny?=
 =?us-ascii?Q?R9yjS0x+YdBuhQ4OO6UqyaD1pLgcWHar38irbsOGr6XA46rw9l6ytetGijvv?=
 =?us-ascii?Q?AUaLmqz3Ld7I3dcyPeLVEwz2jwzcxTbVjxSyr+2E3N9er41CkvS/ssTG/co9?=
 =?us-ascii?Q?ffHybvldSI+nXiUwDDOvK8rhfn57FBM2SPnWV40NyzGTdNCRdIYbux2mmqIx?=
 =?us-ascii?Q?QW5sLn1/5zVs65p2T+IRunkjcCGO/6kF/Rl9PkQssPeyHs6KTZTYONQiqcbO?=
 =?us-ascii?Q?wZSUNoySoSpdwqEfqAzg/qHks+MujXz27aR5fkqHHDpuF9Z8y0Z+7fg5dDvJ?=
 =?us-ascii?Q?GxS+nWcdRQIFQeVMJ9VPn9Xl06Uzoo27ZOEOPIgNd7nipUBOAN7OmHxrnZEI?=
 =?us-ascii?Q?KdUT//bEUEkYLtnu7tI3tEba/mSn2uwC5vSFMm8q8Uqge8ZOW+EeusDgIZHM?=
 =?us-ascii?Q?WMsIRVPxmS3QU8WpZbub0OmzKN0oE+v2DWludZjKCbXEYf+ZhJlS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39e96e0-d7be-4f3c-981f-08ded3b12f5f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 18:31:49.2539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWJlDyrrjf9AeCf8KBXCiMQxTZP+F6j5o1ag5xHbjHRTCAEjSFlPa/BOgC72NdMZmEJiPllrKR3xt//Td8EN+XuoRQ5qUwjata6qWGQ3jDmasKUH/E2J2PiYq0ejWKPG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10951
X-Mailman-Approved-At: Mon, 29 Jun 2026 06:25:43 +0000
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [Linux-stm32] [PATCH 1/1] dt-bindings: mfd: st, stmpe: document st,
	stmpe610 compatible
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
X-Spamd-Result: default: False [6.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[60];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,nxp.com:email,oss.nxp.com:mid,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0685A6D659A
X-Spam: Yes

From: Frank Li <Frank.Li@nxp.com>

The STMPE610 has long been supported by the STMPE I2C MFD driver, but its
compatible string was never documented.

Add the missing st,stmpe610 compatible string to fix below CHECK_DTBS
warnings:
  imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 4bb05d544901c..70afdf68a0546 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - st,stmpe601
+      - st,stmpe610
       - st,stmpe801
       - st,stmpe811
       - st,stmpe1600
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
