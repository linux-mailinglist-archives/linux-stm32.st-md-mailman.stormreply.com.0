Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOw0H3MV1mnwAwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BB03B9424
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0819FC8F281;
	Wed,  8 Apr 2026 08:44:35 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C677C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 08:44:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxzVJAKy39PSUOXtQzRtqxoLQRuTsQfw8sogKCWvU62QXa71bsX/dT1cMFSfXvWI+5tV/hTzh9ycUPl/R0A+77+rh94UQaB3mCMFyT2bRuZqWtl8/cd14ZUUplCyFwBI1PDCIvw9CEg5Y2GykTmApJUBh08/xNqcDBhF/OIaO4/pGJkE19hhUd0JodYbRmQNzmxfVQybUCYagS3BnT0y3BNaQwF58phvhL4sg9Eo/px8RZBVJzVaIEG88G4u4PAJAVDQpKS7towHpPvZ5YOMQGVntcjXLKVLKBSbE/uMdol+OlbTTa8tqn/SEsOr0hPwHN5waD3G4wBel956gpfa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXuuOMHHSfUu2UhzVV2gR81hJAVgoA4523Wl5PEofZ8=;
 b=Ap2wkSQhUoNjQ4CyJ2BEv1AyiVsa/hCXd3d3R/PIG5kb7QSY/umWT57RrbyH4BrHWqOz6UpO0l53buyN+Cz7iKEIhgYIhQy0vKqebCBGphZKSN6M252SRJ6FnZplWEsuChDKq2pH/k8tSPB6QoFKGIUOm0Q5m7ucSO4hzweWsBs7hz4Ji3karTJ8VxxUkNKUDnwzSavbLkyJn2zhUSrMLflrHbE48h59i1w29kZrYtkdvJ4A0zLELkzbVKFv5Uf05N97SRhnojt/OGJIo6ub0SjTPZnMuzkA74EbMEbgXrtS2Cwcnkw0oJ5py+efjRuIAkAg5MvOmxV5O9+O+MKZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0719.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 8 Apr
 2026 08:44:29 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Wed, 8 Apr 2026 08:44:29 +0000
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
Date: Wed,  8 Apr 2026 16:44:14 +0800
Message-Id: <20260408084416.29753-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260408084416.29753-1-minda.chen@starfivetech.com>
References: <20260408084416.29753-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0719:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c490310-6a4a-491e-ca91-08de954b0c22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: LJi8nXNHdW8kETlRdF9V3YyRRIslCAwcn99eCH/RWLYCjydBtd/QiQ2aP8MF7+VxL+uY08zdlQBTJp+yVln7C8sAW5VboLwe9SMb0iLUnAqntGorzonaz0FJOYpNokCcGEfWnaeQfOeD+UzwTzwGkmbnxx9iRyxazVBY0BttDH4bz2ygpjEwxxRZ+iPjeXcbHZ5gc6C551y8Tr3T63/n0L+IkkqQ4f4Cq1yHX23pcnxQ0i9tYaK1CuC6RORLxo3tQ17p/aklfPzczNTd4AJ+3Gdvzy5jXPqzaWNYzQg9yGIdWN2XST3yGhFdCWi3TeyLpv4qc/iF0VuIBD1+ilAN4pxCVvobi5ud2sXKpez9qfkg83ZfVN3gwVrQvkztttW9q3ppiZNXRb5Tc/aFTfaY6HGkqz0HiW53JIxcHEd+9Oe3zDhROd2zFzYzI1DVZ5UIqea3siDLPoL0v3sKIL4waRLRTThKKDDcz3YKnStsFaUmSzFqjt09fB98y2vM4wjf+AvTEC/WyD8qQPMdwM0WOy0q1Lz8O+GGu+ZV6Af4v4v3CK9xt2+ozaD0GGpZ2zFVoiokQBD5TPe0tSKV7v/9yoLiC3dD/aiDhplYTz5Fm/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(56012099003)(18002099003)(22082099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cac+75mQhusAuE6aDnbY7DvIWUT53/oGaLuyY666boa3BcnaLEyz6DpxVeov?=
 =?us-ascii?Q?p5+eW+hFtGgKEh5+OSobD6rIS5AM24vaLaFRwVAeDeyB5mHDYwKiiBY0IF+G?=
 =?us-ascii?Q?qfwho+aCVLEiq9OHSQreoe8qxKbh0V2kN1/9/E7dM7pu0b71rBKk1EnbxhnW?=
 =?us-ascii?Q?HEXNvxozdWe+Gih2Cnhj1dBuYoKSdHlxrsv3hJqinDnCPwGy+2GstP3NyZeq?=
 =?us-ascii?Q?gUlczVFBLp6lTDTf46i6Rl91hA2yfYXt/sTjZOf6xqtC0FwBdeWxC6D7P8eG?=
 =?us-ascii?Q?xOU0CV+hseHcyMVoU96BuH7E8CEAx3C1YODbBAp3pJrLlqps1KOM2lt0lM38?=
 =?us-ascii?Q?T+Sy+K8AXxujGQNXrHrXqnL/nng89PGEvGfB07CPNk4OmAL7EetSLiThUlvg?=
 =?us-ascii?Q?I5DbfE9D/gtySIGWZMl00ATdUPsXMQtQMokPwH6U09UOs3syx6r8wRntZU+M?=
 =?us-ascii?Q?1QSV6RYn1euNpBgTk1LY0CIpAVsspRsdAHXh68ovqVeiEaZMTXhNgsz1TdYf?=
 =?us-ascii?Q?jzzEWWXrGcUGWKN4GNOYAQKzWLyRJY2AGSmKoioO4MZ1m00kLcnSyRCwZgL8?=
 =?us-ascii?Q?9WbjlreWwA7ivAv62q8vzVb3IJDBFLuQLglbgdg9nMYQtYbEz2s3J8P2i+wQ?=
 =?us-ascii?Q?zxu64aJK3wxbhvbApqRzR8ZXMDgrkbg1XfMeOyqu4l3NBSGnPAd1HF7qczj1?=
 =?us-ascii?Q?QQMtxBHsi3HpAO9A0Rn9EJ2AE5SYDNk47Rat1P598PW4L9sPym8/Fs4Iesu0?=
 =?us-ascii?Q?8oUKQUUcZuKYRDuXUZ3YNjc9AOgAY8RskPVvEihwGG0IAMJzh1MpPXcDX4sO?=
 =?us-ascii?Q?s0yHXOXc4TJbCe50LhofpleHrtBGKVyrBeDjJqBB4vUmmoSuncwyknnKI0jB?=
 =?us-ascii?Q?s0xNFBn2lEahtYJXDt5tRWboHHjyPehqbJyYLPo7aarMalD2La94zBIHePrH?=
 =?us-ascii?Q?kSJUeXku3EkN5o+bfme1B80hCerhv7TV3tl73ySPAuCiORn0hy+/hftHp0gF?=
 =?us-ascii?Q?iYc2MLP+A4lwhOqpAYorH1FDtKmU66tg8ab6eXomnaxv7HRi6aijhtWsHlDh?=
 =?us-ascii?Q?jjJLrrzBLNt0D4kpmXe7zVOdlfeJNSGXjT0ku2bjW904YfixgKrp62zgRioB?=
 =?us-ascii?Q?QodQqA+Msz9kFdBI7exFRVG7H2quOlfPEde+TCOyAEMP5RysiQk0fEaedBHE?=
 =?us-ascii?Q?U8O+C7ftA+TZuL0sms+Pm2THVc+reWUIGSi/z6B76YfADndXmTMvlaBY+hj9?=
 =?us-ascii?Q?RdGCF6QcKsnBsFHG249lauh+dQDMIr6hAH17tJRBb0eTWJ8eP3O82KgtWJ2a?=
 =?us-ascii?Q?AQTXiYAHOuKjhSeRKPugvOhf+R4QEDnxLmMRq/5K/ig5CfvhUPTiYj+ejdZJ?=
 =?us-ascii?Q?GiWAKkH+u7Ni7VqU+U08oKAa0s75z+cBaqE6deK9V0+gMb0oS28Ew0qNBqQT?=
 =?us-ascii?Q?9mx2AOTyhBNc0131PMQ8c+Dqdc6SFHrCLEiRF3gv4sLtSY3DrwYJpBd/Fbyj?=
 =?us-ascii?Q?8nMWXHSqSuwNJOIojFSb5mBz63oYilUOJY8J59vTFSgwE/MJUjOnhCXPY2k0?=
 =?us-ascii?Q?SdahGpRcjijfJ1ejzAPoQDsLIytyy79GytrVvdaUNgYn/MnucVYWrj6SykPW?=
 =?us-ascii?Q?tytV4LWMmlaboCEB2Em0MF+T1VxEaOm5sGAhpYEBMwJVN9A8Xu1MDexNRJvR?=
 =?us-ascii?Q?BiM8gCegj8hh9o2xEiZ7mv44VqP8AyngMWXFHcC9PcjRj7WKfNptKJ0CfCuX?=
 =?us-ascii?Q?R7xDFNHAFU1pOxAgxosHKvWRCJHl4sU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c490310-6a4a-491e-ca91-08de954b0c22
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:44:29.3291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFncX8EzwMCe0IMuQCygbMmAlhxpTUhjRDDxKEOobDIEpNp7kdLFXS+20uLXVmCdEGovGR3soDx+TGj3d6gnjsjD93Ys1O0FJ32QyLfVo0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0719
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1 v1 3/5] dt-bindings: net: starfive,
	jh7110-dwmac: Add JHB100 sgmii rx clk
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
	NEURAL_HAM(-0.00)[-0.437];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Queue-Id: 67BB03B9424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

JHB100 SGMII interface tx/rx mac clock is split and require to
set clock rate in 10M/100M/1000M speed. So dts need to add a
new rx clock in code, dts and dt binding doc.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 42 ++++++++++++++++---
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index edc246a71ce3..847d67a2c1d5 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -39,20 +39,26 @@ properties:
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
+    contains:
+      enum:
+       - stmmaceth
+       - pclk
+       - ptp_ref
+       - tx
+       - gtx
+       - rx
 
   starfive,tx-use-rgmii-clk:
     description:
@@ -99,6 +105,14 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          minItems: 5
+          maxItems: 5
+
         resets:
           maxItems: 1
 
@@ -120,6 +134,14 @@ allOf:
           minItems: 3
           maxItems: 3
 
+        clocks:
+          minItems: 5
+          maxItems: 5
+
+        clock-names:
+          minItems: 5
+          maxItems: 5
+
         resets:
           minItems: 2
 
@@ -139,6 +161,14 @@ allOf:
         interrupt-names:
           const: macirq
 
+        clocks:
+          minItems: 5
+          maxItems: 6
+
+        clock-names:
+          minItems: 5
+          maxItems: 6
+
         resets:
           maxItems: 1
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
