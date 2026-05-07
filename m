Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJGUNVFe/Gm7OwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D804E625A
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CCD2C8F298;
	Thu,  7 May 2026 09:41:37 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE36CC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 09:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODXefTMOXXYoRO8H4nqgnvxkEENgY2jOnDpAjEyjh8kepncNmMzyMg0bYIrqLjsp+ZjN79suLJYtM3XAoXaMFQRGORCg1joKh2h2jLiBqGgwrpmDFC3JE7qob5Xo4ogDqUc8PgbwfTXF9icfoyw2X8ZGznVFn9chP8jDD4t3svMIC4SXFSkcKarWZPCMIg/eMKi5XcdrahbNIvIA4iycXAD0Y00fYbJWGsJM3W0LAKzdzcwngjfLYu5Q+dhK82Gg5HxZfsg2Ht/ZYJTdwrIl6dFZyRz+OkanM5/Ot3SXOo8qKoa3dpnWbS8t8jC5SnJiCwNpazoCIm/C9SF5KmsuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQyyfoZkZaaFa793sy2hUvCqzPHhvuT7JE84/S9tm1o=;
 b=KZDgrs/IbFi54CGIoVWo3MAOkD6wA8/mA87JLCUGAe35AnSB3P+LO3NQUsdvXCFCwDiAxcRWWeXqUQ6sm5OBAMkoNymDz68AaQZ2u2bqLR0I/3akGGdu+obMxkk8O4QzspqfR/mvWCanuzB8fCiLQKSnaxtLY9YHKkCUuEZBYFoqGM3+3kSyt4u5pmO+RyRFIXYdmRWckdHzj3EES1315p78ZnGUOsskCBXSsp25YtvGbi8IozM1okInuE56o9ONav2YIVueWqJL5hvj/4uK1H8AXPxsw4+zoM03nyKy60XKIFqIWnsIHNBrBkf5Uc321JB2Z8nRP6CZYz/arjnluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0870.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:41:28 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9846.025; Thu, 7 May 2026 09:41:28 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Thu,  7 May 2026 17:41:13 +0800
Message-Id: <20260507094115.8355-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260507094115.8355-1-minda.chen@starfivetech.com>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::22) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cff223d-2680-44d6-4d5e-08deac1ccfcf
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7xTAPiI5gbgXLlKMZRYcxJIYmiwbMXgQ442NytO0WgFZk/wN5uGs27QWGbTAbS2lCxv2MLZ2SrTLvq38/3kdLJB3H++WC7aDq+sNQxhW9RMmHDOcwkYce6A6v3+mGzoB71kt8RA/ECmrEjHFukx8dTJT/WFviq5NmL8CdpaiyYoHkLMvxDOA/mbMUlNkl10xnCFRLwK6D6KukRVkXiF2G6q5TSPqzQS56uoyNuXatQ5efeFn8wmoRiA/2mq4B5hxd6Us64iGk7hnksWCb81M0YCDsbw5rtqLb/CzOjM/pr7nlCvpJJ3XRStuVilaBmXt64o63XbxrekeAJ70KFLs68pIZDoZPEvIRgbr0siTUTn/nZQ0uvhn8m9lK+R1+jr79J0ZqmUmoWl7nB6PmC6+yxIGqswmYBB3n+U5Au4UIaaDNWpvI6aWX90nVkvMk6Tj8K0DdWHQKBDzcc9ER2hriqOa2Tihxt8wG47BkZI8uyJEpD9GZp7150cDt969DlT431UbYIl4/tPC+MrMZvg8GUnrysacVwdAwIkY9+WnCwYnNA5P9cq9epB/GeGyc/sq6A8tNZ0seToPNWKY8VVwrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nKPs4xgzp2GG4mnl9nGhrZtolI4Ax7BCXTAfh6c+Xcvotal2CkOT8i7zLvvH?=
 =?us-ascii?Q?/kVXuIr3j8e0RAHKlmNXmX/PZrNXDPNKZ7eTFoVePcWsgSzCiWgo/NysFIrN?=
 =?us-ascii?Q?2JzBlmot9CMCEiIFZtRefqoBf8BSnjE3tt9wwQGlkR2tGT4lGcZIw+bIgjIV?=
 =?us-ascii?Q?rNg/J2ITDrFY9vw7zOv86G/ysbattdCGpjS1WMGUcPKhN8TNxDjgs+gQ9OgB?=
 =?us-ascii?Q?G4n7c+XvRxCkfTt4sNqWpT4jqPADDji6aeUHgI7DU/FQcjxTPlVt2hD3/rzM?=
 =?us-ascii?Q?9oOrTv8mGUCdmYSs0wR0SfD5yAn7A56qobTLhOMXGkxqvCx02PMyH/xg8NjW?=
 =?us-ascii?Q?258tA29UFSsEM9Q9ZbUI1hiuUgOoR5kZvTZuk15xMgJuioPD5QFT4Gs9gz5b?=
 =?us-ascii?Q?obBR+1aB6BJqBNwPb3ouKH41w+kuyutJEKPy0gV8UCqg5gra1Fo/OKudiIF/?=
 =?us-ascii?Q?X72fMmPWzWH+/oMnLen+fHOSUmqZTSccm0CFYvHoT6oVI+tDPB0EmYJRS26s?=
 =?us-ascii?Q?ieMXy1pBR4aw+Ou0jAWX2Phv/5+0N0Xqc2nKf/Z2Q6so2uFsOF0E2du7NzS9?=
 =?us-ascii?Q?T432NtGG2++XjhZatgnk99HfJJpAeuCa4E7/zkOWKPi7bK1/JF6cIg+3w6VK?=
 =?us-ascii?Q?YHPUM9SbwyGd+TIYX81t6AQqtLBoqeE8kFRILIvEaoanh85Qhnx9AinFCDDE?=
 =?us-ascii?Q?eGN30VP/JFaLTHSiaYu3UVyyErEsq4A6kK4aBlul8UBO2uE4vwyktt0n9ru9?=
 =?us-ascii?Q?8RFMK0YFbTcwhLa0FxsM3EMGIXpxAxWpCGQorITOdKGTPqSzd9FRLthUQLRO?=
 =?us-ascii?Q?HPi6Y0DkbdPdIINixEpNtfhpLieLeHJPKoqLGx+pYotqquXw6iDoJP6djFJo?=
 =?us-ascii?Q?iLxgdgNtt4oue5pxrBKF8UoDHoLqhzBFzbH3Bn1wawtGo4Z5F6xdobIzplw+?=
 =?us-ascii?Q?HCDqzMSnP1NI68DqwBxTAwWG5HEIfkPrKoyuETxiEGGJP6uw71QHaibWeXLK?=
 =?us-ascii?Q?Txsr7HFpWdjJFpeZkZdBLOOJ0gjFmK1HfdtJoxzSEMoUtQGz1F1Zo7GQvue3?=
 =?us-ascii?Q?AsVsSk52ZuKGlz6w5lQgXS8J3h7v+PGMjhnv95RDg1jJvKlL9mIGqiXD8YNj?=
 =?us-ascii?Q?QtNjlDs5YOToo72Z+9J7kaabfVVzl6ELAKJ0+nDa+PQhohbRXSP9OA+jyhxV?=
 =?us-ascii?Q?BC5Iv5w/QD2dIzuvZwtxxLdyDhnJ+KZ5pfN2JGBVrZC1t2kOlbaR3p56+qBI?=
 =?us-ascii?Q?cp3H8CMVnhl3XQrpXc6sB3wh6tiNFaaq5ARn/isxWufJS+SOG9z6M5tvRQtZ?=
 =?us-ascii?Q?8RoZsu2W6FCdc42+7hmS/FXoPWO8vAMe/5ki3nObRrNn1v9RQkZEvWFHqWso?=
 =?us-ascii?Q?RhjeLG8HTGWmonnTaNXalmlwJqzSXFm4ZIgIA+IU32WaCUAOQSuHQUfpjSOo?=
 =?us-ascii?Q?cyzoaw1on5yFSEAYv166miky4T6AapDsyS192kPSamFSqYpfdoHgPx400Ls0?=
 =?us-ascii?Q?p87H6u/8lDva5Sf8ul7wp3Q7PMO3i+m69NBCBjq8r1MsUV1qaN3bl3q+ilGC?=
 =?us-ascii?Q?1hhpcwOashMjpBm2H+SGapGCFv6Ej/FpqNmzbFsrIBB7EXeZeX+Rh3P2FR+i?=
 =?us-ascii?Q?Wf2GXIttXlPFLXTBuM0Sny85+LSa4ua/a8VUcMgLhbDcj7izehUiTWlzm7Pa?=
 =?us-ascii?Q?xuxXaWGuQCdEaG+Z/PYkB2mhAceuwkRfk2p5mTi2w4B1YzyW/vr8r3yET154?=
 =?us-ascii?Q?hLlUvuJsftet5XVluv0YUF/cWR9EmnM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cff223d-2680-44d6-4d5e-08deac1ccfcf
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:41:28.0828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FPl08qkLnVW/d64UhaR5vRdDJRMg4Qgcvim3P/HTGjSyHg7cOp3F4ECs0NqjlUc01AuqAv45TYDOcyMFFz/s/SXUmZGmnFTwxtSOuPE5D4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0870
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v3 3/5] dt-bindings: net: starfive,
	jh7110-dwmac: Add jhb100 sgmii rx clk
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
X-Rspamd-Queue-Id: C3D804E625A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,vger.kernel.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.302];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

jhb100 SGMII interface tx/rx mac clock is split and require to
set clock rate in 10M/100M/1000M speed. So dts need to add a
new rx clock in code, dts and dt binding doc.
So in jhb100 SGMII interface contain 6 clocks, RMII/RGMII
interface still contail 5 clocks.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 42 ++++++++++++++++---
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 06aeaa0f6f00..af160a8dedb8 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -39,20 +39,18 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 5
     items:
       - description: GMAC main clock
       - description: GMAC AHB clock
       - description: PTP clock
       - description: TX clock
       - description: GTX clock
+      - description: SGMII RX clock
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - const: tx
-      - const: gtx
+    minItems: 5
+    maxItems: 6
 
   starfive,tx-use-rgmii-clk:
     description:
@@ -99,6 +97,18 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: tx
+            - const: gtx
+
         resets:
           maxItems: 1
 
@@ -111,6 +121,26 @@ allOf:
           contains:
             const: starfive,jh7110-dwmac
     then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 6
+
+        clock-names:
+          oneOf:
+            - items:
+                - const: stmmaceth
+                - const: pclk
+                - const: ptp_ref
+                - const: tx
+                - const: gtx
+            - items:
+                - const: stmmaceth
+                - const: pclk
+                - const: ptp_ref
+                - const: tx
+                - const: gtx
+                - const: sgmii_rx
       if:
         properties:
           compatible:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
