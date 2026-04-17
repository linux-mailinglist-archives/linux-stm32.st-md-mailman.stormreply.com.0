Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zu1jBtOe4WkJvwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 04:45:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF5C4164E4
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 04:45:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E7CCC8F298;
	Fri, 17 Apr 2026 02:45:38 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2121.outbound.protection.partner.outlook.cn
 [139.219.146.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29317C87ED4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2026 02:45:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVaLNUsZzLQQcuOx4oLdYivX+1JXkecwdYJn+zIcpaHp1seZD7/h5Rty0/4M4OQbXuRV61GLyyV7CFjkUXWLCCBsduxfGrWBjDgE6h54YQUJ/HXebJaLxIZmTtBE7bkf/5l3DZ97fbzQgjVwh+zd9VGKmSu8cFx5J0RRxLzIGdMRCF7NqivZwZg/NLGUIt7Um82upLKFMFAjdv0+PRRjLqwj//j3Wji6qYcjgVEheLa8M9qvbtPgxescGdgLQFpBrxg3S54H98f+uwQ3nXcJs/uxjL8vFyBBsXeftgsuhluVLXgEhYlJiKc5d5eadmsFuqpOrbJqdXGWuLzInFpJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coqlAB+uNol3k5Z0v3akqjmQJM/eqv4ACGEOiujkLKY=;
 b=QsCY6vI15FSukePg+4YMfPFrvfZMvqSwwJ+TrPcTaQOP6EZyNK/tCmSEcpVYOJSbjil7UrvvCq54mX9+GhjKdm9x0A+RsoOYwCHvdhb0eoUOY5LgUVPCS/YiRM/EYO6sKwO6vgua1lXq9F86U8PLqR8MWE95WKAA9r71/IbsokYCU2yIPqT3XNngrORaoYEL/1jTPBZk6+jAWt+V7+36/Tn/+CiiNtIS6DGptSjeXZ4ofWai7MIVqG1sFO+kjyD3s8lNHS9h7AKa6QGfcgcEwJc1il21momRFdlry4/35F7xfhHc38KFcYe3kFDRSO8uBusDFXAmgnslajuHQpwtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0517.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 02:45:34 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9769.046; Fri, 17 Apr 2026 02:45:34 +0000
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
Date: Fri, 17 Apr 2026 10:45:20 +0800
Message-Id: <20260417024523.107786-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260417024523.107786-1-minda.chen@starfivetech.com>
References: <20260417024523.107786-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::20) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0517:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6dec3b-322e-4196-64ce-08de9c2b65e7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 1Gzmw+cm+uxmy7n9RfGoh/YVDW6eAOYFXamLmL75Om/HT52JS9MxjlU2nAN5oynAqA9PKNUiEMXpkpaxVrJFR2760CyPQ7lan3x0F3oGLixmafJC3Eu8Upje+D1H9zV2EM/WW2mZ00n8TEr1i34ySV/qq/t9VDBx2qxW5y9UIK20qALduTy5X9HVCTG2Xq/W6DEhc2/4uat7APpi7b4jeetK303E8bzaIGWTMjFKvXLkfmrNRzoTvNvbcu6qTmrxm8jg+dlKr42vEOWC0mpBgFHfGzxf0C2ptlP7ndqIH0Hudh1nroxMmTOeR8V8IAYzfyOuv8EfKAppQqRRxhtk7DXmB4CTdhcyHiqc4BRZPQiDLdOYftScf697v5fuq9+e9vJWwfwv+qHvsugUQMCtAVLS6ZFL3/1F1nPdCb7RrKSsPzVUioNz18bQHp392onq8fjoSxhIkU5wiY3ms0BDzUCDLdG0TZNFA8OeiKr6Trf4fhGh34kyexs/iXCOQzAHrRwZGBhVWG9rGijsDL7/OxHRavO4nb53j1JV1urOf1g0RYoz5GVRREvlgMfzlSr+/nt7YxTYPlZXOVcNktukqAMlq1HBzLR/qY8BjvkrkKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(56012099003)(22082099003)(18002099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ymp+L2fmmTaNP5/X2CLmoDeDjRw+8eNCUw5UsBdBw4RWpSzyNt48pmm8K9SW?=
 =?us-ascii?Q?74TAeOM3b4hLw8yrr/wOBu0tm1yzqV+geIW7oBMLA8VNgtqW6aj8m6169PVY?=
 =?us-ascii?Q?iZYStRDIEjw1VwiTs3kOOiaEjs8q4JoSBCiCi7yiU90cWjLI4IZu/DBlm6tT?=
 =?us-ascii?Q?UDsy/G67uPFFTFQpolEOOO9TQ87hK22rIxWok/YJl9gxkG26UFMgdb6u7QbM?=
 =?us-ascii?Q?vjPw3oXSHjYjV87YrBMQd9YWLm9orjHWIi2f0QromfNKBjTC5BV4FzcQ/a7+?=
 =?us-ascii?Q?GKT3hJ+5YZ8zx0ww8/vLvN+3y5Q17A4J/LqgVL1b2zyJQxG2l//skTrZAjHi?=
 =?us-ascii?Q?q+wbjHwxvVoQA3HEr0dC+Sdra/3gRzzy7f3VrwYpMqYp15lR7QDrYVrU4cdf?=
 =?us-ascii?Q?YOl2vQnHjTPAkbEoT4QiH0KJYBPn4Jxz+6bahEFBv54fI6LtjYijbHNY0fvt?=
 =?us-ascii?Q?Fd37PbEgGV5xmR3/m2m/mJCUku+1X5jfJ4bhn5G1hTGplMVP1SI3RXzC28IB?=
 =?us-ascii?Q?1C4G++U1LXqCt7wgq0MAsEarm8hzYhzpBqGcjxYjFovFa4LmbcIK3UiNUm0W?=
 =?us-ascii?Q?WTTS1Dz3oms6IV1LDWFobTuAr2T61Cbjw60/bRixMSXVpOI/oquNEV+CSrhj?=
 =?us-ascii?Q?d1GcWh8ONBEtfAoEjcuKsfzRtZmtkuhdP+Up47T7lJCQKk7ePL/hWDKEDVl8?=
 =?us-ascii?Q?A0FmEsTqzXonkap02nO0/t4NCD6zIXbwfGSrWgKHvS6rIX3+O2idO+HVICxS?=
 =?us-ascii?Q?RwvBi7skJr1rE49NdGVJ8WQAsfKF/2urzxCzt84EQTH+0ULDcYXNIc5IdfyV?=
 =?us-ascii?Q?vsTSk9YYkVtsjleiQ8DTOHWVpSO3b4jqxjhOT6mvvrybXaHD5PAOczZAkP4m?=
 =?us-ascii?Q?495Zw03unoj0tu+OMAp1Tkb30K64nbdOe7VFH+fsbnWjN18uA52wNFsiIqdx?=
 =?us-ascii?Q?dX03vTY3dFa5seltvZwIaS+E+ifhnCV4y2cFkSnyYJfjT5NmpFLAWghFlfmr?=
 =?us-ascii?Q?zROXZfDjIaF5Yfh/eHgfMGezu0vP8YdOTZK+6PeRgAF4sPEl55WJHnsXyCgu?=
 =?us-ascii?Q?fgwIa2gTeX/d4HBItbiSTcMA3c7OAxhWFSa9+om/EWz539EIJFCXPTog0dGl?=
 =?us-ascii?Q?CUrvcW3XbmIKCtxxkOLGbOg0hrYYrF8c3iW5YOL18WGcPDLAekFfs5p8rT4i?=
 =?us-ascii?Q?70r8H6lsZo+0CRSa9F0rGb2Sre5WGvyqdpo+B4S614g8UQmoWcTD/P1qhRsT?=
 =?us-ascii?Q?u/Lk51w++Etcxe/pdHLvdjW1aBoDq8L3wxOQjSzJ5wSniJK/Ae5HfvWzQH/Z?=
 =?us-ascii?Q?84utps6RI+7QyxaTtvX3+YfDlbTyXawX/3ZogpIoawOsj/HWSZioIeObtdZ2?=
 =?us-ascii?Q?ut7zZn9ItRJUvn/s8m6Z9s4MPwwzYHWwHaI3N28Ufezic732ZgwpObzPv6hj?=
 =?us-ascii?Q?Ji0HXmjBBnHxjtNQ3rYFlbljHAZ38tahAMRHNljpJL3yPKjgUkj06B1ExnpG?=
 =?us-ascii?Q?pikMOUb0Qj5pIhtc5b+uM/4LL0uRgDzS68SQI5p3bFFT73Oia6Pj3CcN3ylk?=
 =?us-ascii?Q?kp1YLHEl+EGJsTHlmqzOyU+XVvCz2FpJU4thKAklFX+FhRPdlhdZG6812v0A?=
 =?us-ascii?Q?OQsts289evKv/yw79f2Reyl3MbPyfQ2dXzWYDO1dm9P54ksbZ2DLZnwMyuYU?=
 =?us-ascii?Q?6xEj59HPD2/idPMlqqwS0/Sgut1hGbGRWKGLuklSdOwKFs80D+EveyKLuAU+?=
 =?us-ascii?Q?XXCBwLkI5wKUjwoE6vg/fyrrt812QPQ=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6dec3b-322e-4196-64ce-08de9c2b65e7
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 02:45:34.1510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1b//S8jfdLFg1xJfieIWWHOWeGO+YueKyluPH/4hjakh7VBPg86mFFDYe6LdFJR+pMPRMn2Ih6gHhnwNOmQXii2HgYWPAr+tM6CKqzTQnkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0517
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v2 2/5] dt-bindings: net: starfive,
	jh7110-dwmac: Add JHB100 support
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,vger.kernel.org];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.779];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 6CF5C4164E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add StarFive JHB100 dwmac support and compatible.
The JHB100 dwmac shares the same driver code as the JH7110 dwmac,
which contains 2 SGMII interfaces, 1 RGMII/RMII interface and
1 RMII interface.
JHB100 dwmac has only one reset signal and one main interrupt
line.

Please refer to below:

JHB100: reset-names = "stmmaceth";

Example usage of JHB100 in the device tree:

gmac0: ethernet@11b80000 {
        compatible = "starfive,jhb100-dwmac",
                     "snps,dwmac-5.20";
        interrupts = <225>;
        interrupt-names = "macirq";
        ...
};

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 38bc34dc4f09..85cd3252e8b1 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -115,6 +115,7 @@ properties:
         - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - starfive,jhb100-dwmac
         - tesla,fsd-ethqos
         - thead,th1520-gmac
 
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 0d1962980f57..edc246a71ce3 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -18,6 +18,7 @@ select:
         enum:
           - starfive,jh7100-dwmac
           - starfive,jh7110-dwmac
+          - starfive,jhb100-dwmac
   required:
     - compatible
 
@@ -30,6 +31,9 @@ properties:
       - items:
           - const: starfive,jh7110-dwmac
           - const: snps,dwmac-5.20
+      - items:
+          - const: starfive,jhb100-dwmac
+          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
@@ -122,6 +126,25 @@ allOf:
         reset-names:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jhb100-dwmac
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+
+        interrupt-names:
+          const: macirq
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          const: stmmaceth
+
 unevaluatedProperties: false
 
 examples:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
