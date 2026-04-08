Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODBcInMV1mnwAwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D53B9423
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E30CDC87ED4;
	Wed,  8 Apr 2026 08:44:34 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19D2BC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 08:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYQQOlGbZljjn/B01BFH9e3pRkQ6gAGX6ZKtdYWtJhNaLMMk9N/gOcQlg3OAzATvqrCFKA0B1pTeeRx7T6Saz3gfcgHpmlj3KDCXC2H+sD+WvJmIybio+kqRDmEjQ0Ut3Xz7koYFGfhVr0K6BXj22SAfOwGqvrEIsWFeIM/3Xn3iuvCf5QgraGhI/PPTlrzwHV6+y9ZY5mnIr2+XxfMUHNb+U0z1KC4znPr9NXNBK3JUgzUc8LKJlUNtVSXzxBxDCFobY6pvakmQ91/mYcqQNyzqwT4gZVe0E5MnWUgyhwcFpANJhRSOiY/Ar0yMFsTZenvMegGqjx9+1Oz2gOQgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7epneKxWjCxS5EGIJIdGZe6tTKjC+CRk0dYlqaVA2w=;
 b=SunFdonKZR2OCELS3Whub8/d3ONowgmtJHXgvodFOaQqGt2KkqBHxxADAxle0qGUcSaAAj2re4Kq2Z9ev+4PRQdIxt2Uqk22/tis8i85i56VVLuF5vduFhH8UgsMM04VRCWg+/WojCx/YwRA+F15nry4YmDhyPCasgv/6BEfvlg4A0+exo2CRjyovJ8JJ5nInjUrQC1uLIAZyPQ2NZD/TPJvCBcoia2ENYn+Oqg782wHEqldtFz8FQqi3Jn86IKS7LD/vTnF+VV0wxjTtYjL1JswJzCbV66KUWY9f+0dLLTpCLXaPanlqCCMHZdZBaj2n1pDOZNq8sJ4MLaxUiG87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0719.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 8 Apr
 2026 08:44:27 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Wed, 8 Apr 2026 08:44:27 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Wed,  8 Apr 2026 16:44:13 +0800
Message-Id: <20260408084416.29753-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260408084416.29753-1-minda.chen@starfivetech.com>
References: <20260408084416.29753-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0719:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df93bb8-afbe-4115-b8c5-08de954b0b45
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: O9V+99GZqibBXb8b3nrgQAPOW2+Vf8BfxSSaJ358pOkRhpw2ZTGR1RX9XV65YcqxDYdAWmvWYJ6Hi8wW+0Z67w0x/hQvnel2mZy7fqUClunVOt7/A+yyEO8mcj5ZI8MSwHLt4uE67k+ddHghG3e65EBU5BxKnliRf3HNvknuphRFhxcInjLVZwdHzSrCZ2sluQGK/YqM1wERMzP9UxE3RN581545ipN2P388jpG6hhUKov0fJSFt9C0nm61EBATiKO5RbFsjAIHNfeAglbLDF+evL82Ex0tB6oqGoE1V25tFkHCPQP6UQs9Rrr8yzSok22208yBMkOnNU6oiFb8D+Ps2Vc44DASGsTARl06DBQvHHmM3hHl5hcpTEC3uzFfg40XD6QXxQ3YeUkhyJ6+gYzrky+dDTMGtUuzwh08yPx804Lr0uzJZg8BvqTAwRamgDOL3+8V8UHjgc/wFImmq2KZwtbebfRysKDdEMojFwxLOGINoT4Gd+zG7y0+bx4HX7ElT6KgbkaaRRnIzvvc8iVfTelf6GLqXQPO9URfJEoLLrRarU8ROATWzc6//+SoLMUZ+THRLvaSmgZZt3Osdyt81/lP9fs6jTbwAZYDb0zU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(56012099003)(18002099003)(22082099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQO9zBO8Mg7VNQUS8HQO7BOExkBYPPlNGYaEJVHO71bzQKHyXDvwd0CREaFi?=
 =?us-ascii?Q?WZNI8XBfzaYrfiqaMN/eO+JEZsuLvvmujIGPqVi3GDPojX8wzyjnvXwds65Z?=
 =?us-ascii?Q?wy5ldlig0OINsL5b413L+2bEzjGV6z08GiS5fIshXTbuwEhXKMRCsCAdN9Lf?=
 =?us-ascii?Q?2mTdL1D2DFCfgiOFgwjzAE2BCUUPtk91MR8PvjeBebeS0LCEY976UfxKf6Bg?=
 =?us-ascii?Q?p3/LiJsKYHO3JrMoJPuT109unRWKiMviJVNgJjTJIXsqOEL62+VC4RIfiEvE?=
 =?us-ascii?Q?DJ1WcdQhdQ+saHxlTTfIN9pGroPCvbJpGNlfodr7bwhCOvZqzUSBZ+Eq9L/r?=
 =?us-ascii?Q?QM0QTNvEcu2hMAU5+A98aNvxr2HHG3WNyuOO8sWDduAMGPAp7e0hMNrsx8bK?=
 =?us-ascii?Q?YlJ24bH1p/I8GB8LAXAQfmqCp7ocLTjFSKY+ljMzeK3RqOdEtpCKm9MDg4eV?=
 =?us-ascii?Q?v5RA099ILZNH8OjbA8YUL9p20YAlyRtLzTsvR5mDgWaTUyuzho4p11LrwMyg?=
 =?us-ascii?Q?Y3hfsejkcbPXjStnim0tCD9GXP4zNYPRdAAWfL738itBfvgO48vY54DFCZjd?=
 =?us-ascii?Q?hWBZVRJQ/gmVgLfgtTwVzfH3Z3EK15CuZuulj7QENUOIGUYeVMxROR1q82jT?=
 =?us-ascii?Q?Wbp65H/L+BuvYA2JJf7+EwpzZ0q4+STu7DVgp/rJMZgFCkwGBwjl/6Ju5Y14?=
 =?us-ascii?Q?3IfT/p07FGONAwQTnqteQKPOKGQ74iHgHHkCvY7NTTi5vojj+TKpVPu88Tkb?=
 =?us-ascii?Q?uGMb8sURyaNbLw7LZWfNn+WC0mw3VufB3dzFL4Iog0aX/yBK5JWk2thImjzh?=
 =?us-ascii?Q?iYGs6mRsETsHqAvf9gQAXFEXQrAXAMbGFjYOpyDTGqBCYoNrvkI9jg5h7t3H?=
 =?us-ascii?Q?OjNdgIp2TqaNTK3BAXikcbXC/AAKkwC4ipPaGoprqlGGO5FXd7MacWV1U7Xb?=
 =?us-ascii?Q?HZ+ZCtAigNvRbcvO/aPzEQi5AyLeJaGIGCCMTCWzZBb4edRcckRsFZGr8/1o?=
 =?us-ascii?Q?5x0Vy0rKN/OzV+2mB270vK+CVk0p157e4v1NOBo7GS1poAYQck5S7bHxkEuy?=
 =?us-ascii?Q?Kp9RfO7c95SCQAznO07yOVbF46pM0ZbBU6zHuetAfD6PQc4pxvv3JoM75Kw0?=
 =?us-ascii?Q?HhjIUlyGRE+Mf5A45N3IH6UXbRkV9VEKoeg2y/3orlz47TwSDrFl0pQ8ihEb?=
 =?us-ascii?Q?TcaDA+nq/s2+601noy+LBB7WroZKkOlT5Od4TQ9FnDA+MKSJMjuqB7iD/qP6?=
 =?us-ascii?Q?GrBvIBo/TgIvKKrOXvck7fK8Fh6uHOELUHwiUd3o6EyzzCNyiDQhuRGDokcB?=
 =?us-ascii?Q?XPDUjnorB7Fh/6qfypQqkKHEIQxKsIv4LIHPXsivjDsCuVvBFahJhCZ77sEK?=
 =?us-ascii?Q?Bbvm6oDCATvQNf58BR2pJS6YpwUV2TveHjnRCAQJWZiykU4915cUiUd6p9Gc?=
 =?us-ascii?Q?8fxVPK4r2vBXCOMOXP20qmOfvOjNLmc6YTObUS7LA8GhuOb/3NBcOTwa824d?=
 =?us-ascii?Q?ia1tVkunE9FrUC590N2oDrGoQHvRRPl0bmhey6ORDhHZfhw4/tzTpiQYo7ek?=
 =?us-ascii?Q?jSwXc8RVu0T0WSMGZpLEN2XeNoGtYVtrmPZnszQfMXzq+VSTrpUKWDdYWY+r?=
 =?us-ascii?Q?TNwyGEs6aIty9cK01cMFLcBUcuc7CMV+kZZ6cTDKarMNOYBLslVIqxUqzbDM?=
 =?us-ascii?Q?RHXH/8AYnZf4vyIUfLYFEqSokE0mPW8OPfeW6MKJvlO/wGL2ZgWGi5Zu849e?=
 =?us-ascii?Q?IaEudkQm6CVRjyKEAj2kSBscA5kN5b0=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df93bb8-afbe-4115-b8c5-08de954b0b45
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:44:27.8427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4j8bMRJlhpPSaQxbn/6rlF9GOU8e4HfCA591G8seIBSxgeOqzvXtEANcMceSNITxKFFtlC3gD2WmHvqv1nve6xE4ZEJ42+ciOPtKTy2xa8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0719
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1 v1 2/5] dt-bindings: net: starfive,
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
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzysztof.kozlowski@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,linaro.org,vger.kernel.org];
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
	NEURAL_HAM(-0.00)[-0.498];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,starfivetech.com:email,starfivetech.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,11b80000:email]
X-Rspamd-Queue-Id: 592D53B9423
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add StarFive JHB100 dwmac support and compatible.
The JHB100 dwmac shares the same driver code as the JH7110 dwmac,
which contains 2 SGMII interfaces, 1 RGMII/RMII interface and
1 RMII interface.
JHB100 dwmacc has only one reset signal and one main interrupt
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
