Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vYt3ALzzQmozJwoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 00:37:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A36DF0BF
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jun 2026 00:37:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=HXZYPAIr;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A7D7C424DB;
	Mon, 29 Jun 2026 22:37:47 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013014.outbound.protection.outlook.com
 [52.101.83.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C110C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 22:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yL+DxOCsx0gOqLUnXS0somW/cykbso9x5z4dKuZa4JDypcBSGB6nlsTnINxdGxqA0knmGL3HKWcWd1YvWXROPkOPvrQWM2AhOCYObX7qwi7FXpTrd+oe0Ax7GCuu2OqOyxLkzLYFUWYDRnDR3zDczted8aWxfFsmw3UvRysQFYQst0KHXhi7NS2ZJleAL6VO8VF6edyxRv/9wZ9xKtkwZLz7exZaXIAVjcssc/EZBfvwK3Vje6csluPnU0hrcOnjwAIDVA+Z5Dh3mzyzT1uBZl0eA34eohTUchuulBKBuX045TgKIc9VZqra13Tpbtrev3WsW87+s5rmGCQXOsm0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbB0g0k+eJAAbUuCaK6lJgBquI09p/pQI6KleW+gG3U=;
 b=R+Hd9MMZM2sNWOCfhYqF74RBXf7h34oR9w8HCVYnSmWlOWeM9vSc/UH9GAVUohKbi/gHLfFdbIcTcoSatwpIqcOwAYvimN60aRkxYU2owCPPpalNBArMMKWznPWEd/IJEZNy7K6j3Ti0jbcm7JZeFUtaXvaaLzpnx3vRMDlhXrnLMNSoNQZjmCc3UAVumKrRaatnFbWNhZ6UQEzRWkOq0OWco70rLULEfP+UxSVqYnsS1oRZpi1NxScwtjVPHR+51oDEIjc5HnfSGplKi6DL4yBqiJqYzPFPEbmoUdrPsUst5YOHg/qLu//MfVojI/5Ev3NkgF/W9AoUYxiRKgnKzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbB0g0k+eJAAbUuCaK6lJgBquI09p/pQI6KleW+gG3U=;
 b=HXZYPAIrfFf+Kcb46HzPaHGURBjAcd+TpFDcbzLbqrG4qwn6d4QBkr8xJSbN4vZkKRgqMqGHGtwNas19CppT/uX950k7SHtJCAxgeXL+tM5HYpWK6f7a4xuMDSwk+THqMoIwtz6uGDqP1/X/Cv8vcWwxGuXWFux25dScYCXqSi/YCS1C3CWLv7CapdsOYI1LqAsCYzAjzDEHJ44AE9icrne5Uj916yS/kUyRYNa1e1DsjKCtfhv58hLvAdX7D4UdccrEFdQjbNWRwOe0Mz6lglOC7dAGVDPC+fR3vBvKhYx8o2NWfG+2zUh70APNGTH5OYlkMQHn7A6IGgbLN1H2vA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by OSKPR04MB11389.eurprd04.prod.outlook.com (2603:10a6:e10:95::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Mon, 29 Jun
 2026 22:37:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 22:37:41 +0000
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
Date: Mon, 29 Jun 2026 18:37:34 -0400
Message-ID: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: SA1P222CA0193.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|OSKPR04MB11389:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5a9ca3-10c6-4de7-43f8-08ded62f07e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|19092799006|7416014|18002099003|3023799007|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: 0+Q3vjsQUx741Ec2GglYUm6zWzx/ztsfOI8ugW9YX9P/LCBwH4uoQA30K0fxqaPaDI/hCYOeeZBssd0htLYqTvktEEtbCrRV1hAioYylE+cpi+MQlevGZZFSkACBjfTmLBakXogQG4l7rY7gFWRa/cLDqxm6qjqOBHZUkfDNLfZ6ifRWcG6NiS6Yn5+uFsI2AVucwsvxKSFr48YfA5IY89AVLHPwKXf6AgCA9bpF3MZzaFE1WlCBBw0HIRNC14EyS7cB5n2tQPK85xJXuUNU7FTjjyPKI8CLAkMOjiWebpvC5qKiaow7ueEVpBzNfRtxgsUJNvLk54EqIllqVnJjkB2/pPldON7/iLRa9wLV29XpeNK3mz3FD/nXS099AP1fw/JzJYPqtPLULP4B9dQixuAy6/W2/1OYu8mqa7Wb88jJ4Zmg+Zsd9lYrwvRRlVi4h82LYXn3BIcTFojxz9VA+GikS2Fpt4aXgp5VJ1MmWjjxxbn2MJTlO0xSfA4xqJ9GataCbgscVYowzr7a++88ubH28nTdHunrNkzROz381e4H4tNqjVcQ2nQURFHI1OortwZXlYw/hk+0A2pbmwfbv8Wxlh0Sw3/8dovJEk777glHPIAVU11IXSRuDPLG7M8UPcgyY3UIecsAB9s78hygfMGBM7/ar07bse5kb5AUWACWRQTh+I9M6aj4BOi28vRQASD98Dv5JYuusTuu55EubQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR04MB11799.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(7416014)(18002099003)(3023799007)(11063799006)(56012099006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1qrlmemXaTFzQBHOsL9QdGu/3KoeZ/bHwuO0dRvc7IBbU8BMVH4Al9pzUm87?=
 =?us-ascii?Q?f8m1HwMb1n25Zo//BYfqGpwptJZEzBLk6lUN4cjobU0BnBDwM+MU8qx/rmMy?=
 =?us-ascii?Q?algQvazRW2MvSTZ6BZKtr9VMdgNwDBllF4BNMwaWmqUWcA3JjodVEIJxf/WG?=
 =?us-ascii?Q?jJ8QOtoEkevvp9cM2rB6spK0G3uMoZ0f28Z5pV4P6ne3fpyrn1m/LWbpLZSb?=
 =?us-ascii?Q?llkuSpCzc33Ux50VbwKU4NUrhiomNE+pAauSZPjAMZBHaylXo5hdGhH90MMq?=
 =?us-ascii?Q?sh9NfXjSlSF/mk345b8kGP+N7+w1V3LPQid8ASFlHiYu7kNEDbdmi3YkaauC?=
 =?us-ascii?Q?yDHeNt9+GuuW9KEhqfcMivWIOO7pRy6jaYjbirY27VUcT0EzapY146zAQi8z?=
 =?us-ascii?Q?CYMhHXDCLTXZoMFIfY7I90EzxnusXH2GMipey03ZBLof7yLVcsnEvBESSW9y?=
 =?us-ascii?Q?LMKdr4sV4tqns+85C/SzpU9wvLIhxdzDgRk+kKosS0Cx0ihI6pQic5yP1cJI?=
 =?us-ascii?Q?8u5xR2H9Atjtp6M37eQdDklwX8EIdsMaERG7tLCK3lDDThkqXs8sxHF4Dj/p?=
 =?us-ascii?Q?zzDXnCm3VHIFYz3HTsMWMB1GNZqM9TC0LzOpJW7vMhl/926sjehfegJxjzvH?=
 =?us-ascii?Q?xbEt7JHn3paVmKayisiwiR1GpeAn9cVsxuafJVtbjnZMWekT9h2FqX4P0HgB?=
 =?us-ascii?Q?l6/h9zZyUHlhRZNQ0xCkVeZJab5LzmKUgRzS0ZfZCfxcmao9Bky0XTV3QKyc?=
 =?us-ascii?Q?JOHUlzPAkO7qHHH/N3gAbED4Xdoa8GqD+cMPdZnHnTCCNVi7obRG+ZwcsKIX?=
 =?us-ascii?Q?g2o78+t9rQD/aQqNchRg4wTiQ30Bh7Dn5nbeSaNXXwlC4Vf/XX39+nEf3j1V?=
 =?us-ascii?Q?gav9LUdXR6hP4tFhTmhQhCu8fMMWkk2J3pGCJQRbk+J3VFsjTd5RfULjn4k8?=
 =?us-ascii?Q?WhMdyISX/CjdzCziHHU0pQhbLWUfrZ8xSj9bPwo74N6zHqga2/YzOkKcCp1b?=
 =?us-ascii?Q?zFnqUBS4wMQur1gE5PF66kuHPadz4N9CL73mFGMqKx7oKFIatAIM7cBceH9Y?=
 =?us-ascii?Q?iMbAtq4u6FEiFD12l/9U6y7EoySOzfnpgpQyMM067U4ctmUUSFMOvfN1va/Q?=
 =?us-ascii?Q?BW3HNuaSwoLl2S4CquKEiz+z9jIvfGAe5EHD6fIrZhVVSIMHScrUtXf0om8E?=
 =?us-ascii?Q?SQlOJDW1z0EP96lwAy+VC3TwToH+Bq9R/bZyii092+OXuVbT+mtF2Gw3wBbw?=
 =?us-ascii?Q?eqKov1o4cd1s6d9YWZyCvJPKkJpphqQdXyIvHPws+XYh1ovsGHb3XqY4sXuH?=
 =?us-ascii?Q?JPBNahORRByo+HAoZvLG4VWSaICKRmfi+d+noMf7BfRaEhOnNBMwg6fdHnwe?=
 =?us-ascii?Q?YJ0mxX2rSLALlIFORqKuHZtTHjNGO/xzOwntnk2bVtfwR6PnVGtkmpsWUYJG?=
 =?us-ascii?Q?RZkdXWEpzB9TwESFJ5q41/kKH9aqA/yuq7iQdosLlok44et/mz2i+TYHsd6S?=
 =?us-ascii?Q?TXo8Wjq8SAW57Zi+24s9OmQHpNg9xZhgVOGd0kQ6TtldKIQzVpLqbrrE0JBL?=
 =?us-ascii?Q?DEVIeKy0wSt4/MwiSDpj1tQywiM4TqXJeDbQYnoNo5L/o5kEDy4LZuAIfoR7?=
 =?us-ascii?Q?9I0iiKDAJ0hB+lr4I10gL5XpllZq7mtagWNDn4TiPd2Us5wOv8c0mbaJNUfN?=
 =?us-ascii?Q?0DzfiR4Ms5o95cuhAcVsXP21QY4ADidX7fD0+BllzQpSP1bs9e8/IsnjXR2l?=
 =?us-ascii?Q?lvukiaeZfMxutJ/VvSZJ03tEj9xZqfFNo5aViSJ3mGyeA7RL8uG7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5a9ca3-10c6-4de7-43f8-08ded62f07e3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 22:37:41.8582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5pOIEbqIu851knVdiU0nWt6udjMjYpsEoxXW46yOsYVF57b+6GiuQrT5fNA9+WdI83/L9XHkp8/Wf/tPV/o93FXxExBA9ubgw6bulk8KBMKhtNrslLTuRvwa4Ii+HYy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11389
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [Linux-stm32] [PATCH v2 1/1] dt-bindings: mfd: st,
	stmpe: fix typo st, stmpe601 (should be st, stmpe610)
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,nxp.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 788A36DF0BF

From: Frank Li <Frank.Li@nxp.com>

The compatible string "st,stmpe601" is a typo and does not correspond to
any existing STMPE device in either the driver or DTS files. The correct
compatible string is "st,stmpe610".

Fix the typo to ensure proper schema matching and eliminate the
following CHECK_DTBS warning:
  imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 4bb05d544901c..ddb27ae64ba37 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -20,7 +20,7 @@ allOf:
 properties:
   compatible:
     enum:
-      - st,stmpe601
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
