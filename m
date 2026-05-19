Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NK7JB84DGq2aAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 12:14:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C657C01F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 12:14:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25EB0C8F294;
	Tue, 19 May 2026 10:14:55 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E1D2C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 10:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvWL49ybmW5cT6z3iZIXPswLA271dRbpB3vv6U228CMpbTn09isR9nF7zT3lOqLXY5C3efzOTHbaCAkcP2WMNf0Rjzrgx87x4TLwjvyZj7K7N2ZjOKOOHVD//lRsrgelnbmghULKElO9RY6yZdfJMMdeddRXEN7Waeggun7AE3XH58nGy05l1DjaN5CU7T8y5DUqGFlHAek73tG2iNukdSSwX3QwreuMTXSLWsrvNtip/UL3Xkg8RSZknUXsHCd91Aytz70gAy6ikxAXqQBgu+dHFlq4jg34zrjfD6fTBC4PXUCsq2d2Ahqc+Efku8dgoN4Q+HNSHHBtfcWgqKFX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l34g9rnab5hWH1BOjB+vqpxHyL7/EfwlClP8njP04d0=;
 b=QL14efi+W1ZN389/qiwmKTJpd1dfDhMpB1G3N+85uD46nWS76HmxEmNTlB3Oy9xjTYXeZzK2lgj7kNZYuEAok9wYAIZdpRYkqXVFGYX7sK9oCLgx2gflKqL8KKfFwDAtpCyg6LQz0rS5CNE3LrlRPEPV3nR6q4M3vjVyA9tWULiI5sbdElIbH5k915Ub9lwsGcXXKej5i3AAx9Uh16KDxFa/jXLbP9zxHScDVdhmx/bipCol4BtXEBk9cskVyh54FZr91hFGDbYOR2sj66BnQ5jRFXC5m1DAo7F9ZPKhOH3RtxrpogoSw2gGJVACnR7R9Ihpcm94lH1TU9JJtB85vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0493.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 10:14:50 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.20.9891.021; Tue, 19 May 2026 10:14:50 +0000
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
Date: Tue, 19 May 2026 18:14:34 +0800
Message-Id: <20260519101436.111476-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260519101436.111476-1-minda.chen@starfivetech.com>
References: <20260519101436.111476-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: BJXPR01CA0056.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::23) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0493:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e85be7-091e-4288-0f06-08deb58f7626
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|7416014|1800799024|22082099003|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: LSvIyfHlE9cHBEjJ08jhhBrmcjDi6z6UTRDwJnMNXoHiP5uAwV0tik3LKR83xkqsXcCwbNULsJbVPMFkNoX1ev04nQE+0RROgHmJjOS3q3Lbig6JQu0XVFpLMQT3lvy9kRi1Gqdyehrrwzf+ADs+av9qaTh/3xCldsLl+qvPGORRG3WayjInTj7bsDeCjo1abnQw9czc6u/9Yh8jZWi0Cyzr5kEVEjUW6iabLRKxctDtUGudqCIu2uTtkxVA6NbfWo2zVUgYa3SEjf0GWtcbE1E1NqyqaXWLcJ+IZ6II6Vhxb8h186NOeiQsDAw+ldazgTjEWuO6KsLeqho+wHVVFnneiUeL2tGejHiB70+MSOS2HOugfLSBZkG7n5VUuk+NxWn8km2J2OAxQjDpt3VM0pY49ot4+auFYui9R3hEZq0Ziy8sJlSRGXjKsJ/SoL+blzwJTjWHHdPEdG8Q4gFM/6dki0iTizl1xX1m/TUxq53qHGY1WuOeXb4tUEsVMDJK7lXb7045x+adFKLeghh9UVS8rFjg262MM1M4j9Mu5d8EQDWNGiC1bnm3xoXVZXlOAHoCXb0i+Rzkoa/tdQAWxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JV4PFY73/gjdTBayILLWouxMBGaDuWQMWlTbxuTIz4AFCk4pwWqIM7/q7TPc?=
 =?us-ascii?Q?2F3se4XcmEh/L1F6mtQi3qBVqB8CMmF5huyBSUq3ab25PG0859Fjnkbi7VDS?=
 =?us-ascii?Q?QfV82cvRCfIYpyykbsreGcPPqnApNLKF31QHUwGH35ePqnlsWXrsmkzyB7pk?=
 =?us-ascii?Q?DaH1cq9nLWp8U8EevUJjpqLaU/D9D8jjeTGqNXKkKL3cKmaEEGAmUc/eo6dQ?=
 =?us-ascii?Q?W25Jy0QABt0k2DTOWrV+Vj4n2dCm4fna42xrpqdOl6jwD9QAr4JsXe3Z3I6Y?=
 =?us-ascii?Q?3IvklSXYSxX0VF+NPTJP2940Y5hpHzoSO9tNR0li3KICrmN/VmoPLr86B8GB?=
 =?us-ascii?Q?j/Atcc0jlC5/iz9hPegbkr5E7JO7zdebKAvohRnwAvYs60VM4nTv7UTnsf1b?=
 =?us-ascii?Q?+1hkPQrkvCmbr0BQVrZRyTPF/uW4MioJl68tB9LqZi08+VCankgyAEwE1Ee+?=
 =?us-ascii?Q?IiyDvsOzR9HnuUH40aDDReDCOQofinEKrbF5+Vk+ABuBsglr0/ML0dTb54Zx?=
 =?us-ascii?Q?tvpkkomL2IIT0njUdgpsbUCWWhE+49TpiFaj1AYydjjEd6uWY48DyLdF2zpH?=
 =?us-ascii?Q?STNddwQFiCo7UubTVQoxuGYvPZuf5avEatGdtFEiqzYEHs0ubT3YPn42Mps0?=
 =?us-ascii?Q?xBq1mZ3Q0Gr/DzcdYhZjPm+RPSLB0MnjsJPEdkPRUf3xG0EFDi9H3DlksH/W?=
 =?us-ascii?Q?hMFxukVIyBbL3SM/W0ctBtY9FvKc/9DO7z/cEHncxa6MhEAPU1WSgxrPz3zX?=
 =?us-ascii?Q?+5uaw9eZwqUz1ZCUfsWS2j5NFGbheh852Tbw7CbxIflofFsjTuq/kQLoxvro?=
 =?us-ascii?Q?V9IO4KeB2mQ4DSM27hW80BNP5J1iWZebdkXiflgTtiZ7rCb65+5sxf5KY1V4?=
 =?us-ascii?Q?GgprObgjywYnTaIx+bmKV0CbSTtH/4x2ZfnKRAfvrBgkE7XCNGiIIRErOBKD?=
 =?us-ascii?Q?zHp/R9VP5s3zoBYO+oCMKOxV8GWJpJGopbLQIzA9gZg0+orvXEp6GW0nRPlA?=
 =?us-ascii?Q?sJqjga/Eaohg8nDAkEA3XFAwN41YhH8WkefyMYX2Hl26MAcf4AUOs5UuX/fT?=
 =?us-ascii?Q?Onw++QDY/HymKJKsFYTKBkAltdXR9v1un9DXaKqYaMSRtx6/103iMSWDVR+8?=
 =?us-ascii?Q?TJ9yFpAAPr8H4dOoWnPcNFy79ZSsKqTjdDMm9fuLgVKLj3umC2ubRFzAihr/?=
 =?us-ascii?Q?p8y5tdPG+lqUm2PcD9Iqg40Ts5GfU759JfRpnptnY6+/cGrq2j1j/NLucSFv?=
 =?us-ascii?Q?qB9Y8zQ3Vp3aS/5R0VxDFN5UjwzFRge+0ICAADaIFFFNbctVb95HBMr8Gy9y?=
 =?us-ascii?Q?LHz1cxEhymOmuH5gZFf9gTQWBhiG8PTUHpD5jcloBJxxvh8XkA30CBSBBWVP?=
 =?us-ascii?Q?0rhmT+8xaFMO4+GUwm1MUB8ZdB6sjxGbP8vqnrZRKcP9gdDR2BUEFyC0BGB7?=
 =?us-ascii?Q?MlwsZ/QiCbuGztOKkSJ/LcJkTstnz6xOxibZ74K6lKt6dAp4NRjPsVM0Gtdv?=
 =?us-ascii?Q?iLAPr9MCTl/aLyfMchSjTW8N4skXBsw05RG6SBEQfFmjFP/swult0hvgdh+L?=
 =?us-ascii?Q?wE2ztvbW6eVaIICM4wcWP0WnqIqBxZaUCgd8/2rnB6gCdxEMep7KGhL8CnDU?=
 =?us-ascii?Q?ecozj7JS2wXgH4GqPFh3QY9P+/XXhOMvHBEDZNFJaLmWxAnO88kHZPvO3T+V?=
 =?us-ascii?Q?uycueH9ykrv15XWpMkL+gR910Lgd9SwTEvzWcpe+4LKS/bGAN8TaaTPCBlYs?=
 =?us-ascii?Q?3i4gtW7uvaon665lFTL7Jv4cZq++7TM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e85be7-091e-4288-0f06-08deb58f7626
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:14:50.1571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypPMu95VPrJ9Seulw/wpOxPFKcBcAn0+nXeiY+ypPCSYdCdq/5eNzvDA//KZm3HYCxjIfp+g2/m8J8KHp6ukSZUVUU+ofJ65NR42MY2LssA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0493
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v4 3/5] dt-bindings: net: starfive,
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,vger.kernel.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 650C657C01F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

jhb100 SGMII interface tx/rx mac clock is split and require to
set clock rate in 10M/100M/1000M speed. So dts need to add a
new rx clock in code, dts and dt binding doc.
So in jhb100 SGMII interface contain 6 clocks, RMII/RGMII
interface still contail 5 clocks.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../devicetree/bindings/net/starfive,jh7110-dwmac.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 06aeaa0f6f00..fdcc61c65f87 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -39,20 +39,24 @@ properties:
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
+    minItems: 5
     items:
       - const: stmmaceth
       - const: pclk
       - const: ptp_ref
       - const: tx
       - const: gtx
+      - const: sgmii_rx
 
   starfive,tx-use-rgmii-clk:
     description:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
