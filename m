Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP8gNXIV1mnwAwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 322DB3B941B
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98EEAC08D19;
	Wed,  8 Apr 2026 08:44:33 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14254C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 08:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/brzEhUAKADELg0/kCKhmjqqDuNzX/1W+9pGl72oWRDOJj1ZZtZrARo4hd96uuW81AUOAT0I3iT2teCy+OJclbE47TiY+rAhi3Vc7thOXNmNVhQkf+h2IDznFG6X8BV4SuuBIvNTbm/4ejW1YoylNVo9e17Ciu6zAcVKib7LdGVr90lD2AgY7NAQTEKlHPdMMEAbaAr8pzntEBENW79BoShV9ORTXQyOPaPAjbBMtKTCaDt9GN2qhorP9basusiywwPhr6HTGmgVt6hejosgzmqgeqmz5oKccSqK1paWUA6rEEiI+IgHQbCeOzcG6/ZrvNHhH0rXp2sdG8Z9dImGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i71hVdTp7nIZDfEEoJFGmsCjX4mTAqZdjdMemIA5FDg=;
 b=PYrUKppwOGBQKc0T7/0XFXEcBDT/tWhJtREhPW4EagJypwMm/OS1R6YUfBrp9Ll92KHZtO+lINi63iBsE7kJ5ffpu43H5dtWN9ih0U25OmBmCDfmfGGXGERaqKMWQ60GlGZnIKrcnIy0q6OfXPpj7IJTvl7zynoi/h6aJuW0AZZFBsAM4lP2o7tEJskSlakQDhRz5iq0z/bF2haBYf04hC92H0A6txHdyBMpywviXUaqRD/wK+ktomXV1xikhUSOUPUCAb5pbJ2GzwGtoUi4Vd0sNDZsnafB0v933IRZZnpKsaTruLmQNdRw4I3wyzxsphJPNYaz96kK0f5dkwa4LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0719.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 8 Apr
 2026 08:44:26 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Wed, 8 Apr 2026 08:44:26 +0000
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
Date: Wed,  8 Apr 2026 16:44:12 +0800
Message-Id: <20260408084416.29753-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260408084416.29753-1-minda.chen@starfivetech.com>
References: <20260408084416.29753-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0719:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa485cb-82f7-45ed-db02-08de954b0a60
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 8/a4X5seQ2TnUqOvOpQKIt2iFVp3qAPju+h+NyZO/qFIGrFpPb6ujeeVtMHDBCqvRoBKd1bodFrSjnYWOw1NUSIumLvvKAK7F0kend4JKCLqYW4zUS50VIaWqGiD1PKirqEdvtgHZzjfxVBK6Cg41YD7kwVRi95ovVKXInzxNbdx33ycIRpnB4F6BrLBhu9qC3hXgTIR/jPCTlBv8GXqTwJkmxmf1VaB56x86eLtGdUDENVrnz9Lww6Oy9J7cY1ssb5NPvUI+oPn7sza3TEPX6e3lkaEAQZl++qOoxUV8QijuZ1r7AMuhBIsoIb9vtQZoipFHTRr7KZFdLuNJu1baMzr6oXL6oGJo/6AexnCZuje+UvVgDd85bezxBJ4V7PTQR152f6nw/cgQ9PZfKhVEeB/Jg4GgQy7lDMVWN73sfy1y/738iPQYHjbW47mEjoH9n+8+CfcgWs+tUSxcNeqazcDd5ijNx44deGcYV/etTDTo+OH3ylZ9n/oQASjctIZZQKp7K7r1LhzT1Ca89CB8lZ1LoG0iIgJUnwx+fgxYKWDCroM653VeFS2tVyK23mc7QpcjjBlLyL9vPCQe9hEVKaWi4MshRMTtxUWOFjXTbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(56012099003)(18002099003)(22082099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHU6VU5JQJzi+GGjayDsayxHSmrYfpAX70Pizq3qSrzGmg1bqqbf8RivXATP?=
 =?us-ascii?Q?J1weQ1+lxFUmm3IsshXl12SR+5lIh7LdIRYlD9wMQaK0luk9JMVdUsUF8ETB?=
 =?us-ascii?Q?vzEsm5mExSC/So4jENhPnDgxActbMYwPOUMi5SUMZvlrlpuVABtJdVK+nQIG?=
 =?us-ascii?Q?/SIMPxbk7PSC4htrYDu7ymYi1TpNE98bFgDm5IkEmKEnE53h+Gs49w6PxDkF?=
 =?us-ascii?Q?Kk9M1qtm7zzy9e5Jv/HoBo0ZVq1X52WYpa7cqJPCOhbT65EK5HdnwFY0Ruor?=
 =?us-ascii?Q?NuZtvoGVAAUx0GboYEiWpfDVGTpvbWt8OG0OGZW5saa4x0dmX1fAL0JqENGc?=
 =?us-ascii?Q?Xr6wfI1DsUeY3VRs2ZeXMOMAbUTYUa4QkLo15iZxOnQKRR5i/LzEO1QI+sXf?=
 =?us-ascii?Q?ulv3qxWJuZr/n+etg6gkrXkymR716UD66aE6CajmUf3P9j2wLVdEw5AQGyB2?=
 =?us-ascii?Q?OqPtR4Vy2p326VWRvhLBmaj0sefywJGQrH5h0fMyGKtEJZYfnMNyhAdzJlU6?=
 =?us-ascii?Q?BrdHiH5tcy93u+27HZjf7DAmQrkpYoU+5zxXj8iUP1jcl32DukUwb3DUhgeQ?=
 =?us-ascii?Q?5a8Vw4oiCWSbchzYFuwm3FUqi+4o+3voN5HzKKWwDz3sQm/WQvoQ1t32Zkg+?=
 =?us-ascii?Q?CDC9wbJnKBvnHPgYiyCf/bRfx8FbOl1rIzhTcUv+BYoRcLTEPNpvco7lE4VQ?=
 =?us-ascii?Q?TVY3V8Aj9dV7534zAkvY/VSgkOqkdJQsWdwcQuN8SpJxPtxLL5WcJ+PvXjyB?=
 =?us-ascii?Q?osAHMBP8qT4h4nll95kB8/70mroKpsjBqdGrvfUgI+pLa0jnYFYn2bOf8hnN?=
 =?us-ascii?Q?mbQTml8ppBBBxzvz1PEibV9QB1ovOCvCiqgGk23ANKIod+kIMjloW0//m8mX?=
 =?us-ascii?Q?P/fdeAWrgLflbZV1wYeXM3vyCOkupSDsiXO+rbgVUag4iJdjfdW/BhXNQuq/?=
 =?us-ascii?Q?uYrXxkNJHmEuR+imKVI2PGPgaq14DD2sV7Dixn/2J7tzA27Y05wuN9ZtcReO?=
 =?us-ascii?Q?Qp6Bx4XcH2RkQraf0gaRZzkoZDirGy+hOsyq4lV+vwh2qz9IxrvKm3fSnnDE?=
 =?us-ascii?Q?eZ6rkNrPK1z9QKpLW/QVUZAEXG3SoyOTMs8IRcSe8spWwQisdKGUjYZ7MbCw?=
 =?us-ascii?Q?mlI8yr9vum/LNg7x3teRklj/Gni/l+ciso/8VPfZalwyAPBV0wc5KYt4rRLM?=
 =?us-ascii?Q?pcXUSK3lYwPHSTUovICeaPwgMoJ5mUUXIeXEvrH6JmpyoE1LcS00veZ914dS?=
 =?us-ascii?Q?n17QkBuC/8FN/LpOPQfnixTFc+siI+gipM+2Jh/Ujl9P/yk/A3ZlEwgJer7i?=
 =?us-ascii?Q?tf2ov4/l27q58a5ImUoH1EqWN1Vs32wuaYkgRHpY+tWA034/YKJr1Q++Crxy?=
 =?us-ascii?Q?gn69u5HSe4jN7EK0JQNCAAqRO1EW+1dR3elvMaAi5oOmIpD08g72rPUgHTgO?=
 =?us-ascii?Q?37+B+M68qOmZy6A47o+GGPwVb69F6voOq8cgxavznTelo8Jo/4cUzMLkhD/5?=
 =?us-ascii?Q?F/cahhB0Z66X/ZG5G98P7Tm8Kg5S1DSMFtMCn363fN+Nm1dbSOrj02CV75CE?=
 =?us-ascii?Q?TmvNgBebaxKXvj/3xxuyA/rH2us5C5vbMMlbS4ENmw0Ural/pCtfrwV/OBOD?=
 =?us-ascii?Q?mg3ALCR85NWjCKjp3twCQjt+UKEVMr7Tw0Y8KhbJCcWpcFJ4UPOi0PBMvbhY?=
 =?us-ascii?Q?FKAsyg9hJV2uM03hjWyW1c5fFAFdJJgqqoLsjRDNv252tUkkICHXQmWtD+q4?=
 =?us-ascii?Q?IMcRgy42yToZmhmRt9p+c88t4+6Lcis=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa485cb-82f7-45ed-db02-08de954b0a60
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:44:26.3802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q50ksj1Be7H0X0p3Nmnaf16EOPaYbVgv/9/+BYbumUMQArk0FXJdrGjg+C2vNG9Qv2FgXrIzs5OG1lUpjBvZSLr8C9a6a5ThKRujlru+Vyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0719
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1 v1 1/5] dt-bindings: net: starfive,
	jh7110-dwmac: Remove JH8100
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	NEURAL_HAM(-0.00)[-0.451];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,starfivetech.com:email,starfivetech.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 322DB3B941B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove JH8100 dt-bindings because do not support it now.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 28 ++++---------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 313a15331661..0d1962980f57 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -30,10 +30,6 @@ properties:
       - items:
           - const: starfive,jh7110-dwmac
           - const: snps,dwmac-5.20
-      - items:
-          - const: starfive,jh8100-dwmac
-          - const: starfive,jh7110-dwmac
-          - const: snps,dwmac-5.20
 
   reg:
     maxItems: 1
@@ -120,25 +116,11 @@ allOf:
           minItems: 3
           maxItems: 3
 
-      if:
-        properties:
-          compatible:
-            contains:
-              const: starfive,jh8100-dwmac
-      then:
-        properties:
-          resets:
-            maxItems: 1
-
-          reset-names:
-            const: stmmaceth
-      else:
-        properties:
-          resets:
-            minItems: 2
-
-          reset-names:
-            minItems: 2
+        resets:
+          minItems: 2
+
+        reset-names:
+          minItems: 2
 
 unevaluatedProperties: false
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
