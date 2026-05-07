Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sB/WGE1e/Gm7OwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAC4E6245
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A36BC8F28A;
	Thu,  7 May 2026 09:41:32 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C00F0C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 09:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/dK7Ht4cRR9QuAem/T4887vpWGxhD5jBXbFqAIF9BWQHlQ/6pe+d0PIdx3jgJbU8lDYThEjq7woDMqYKH6qSl2jT8XmxvKreEag4azHLJUuleXLVbGYK0ddRXO9yFLh9iP8dJ0J9cXA/l/OVUb0KibU80C9Aa0+kmnKKyJL0HI59GCOiedUXrUSujG+Bogl6djIXr6OaQ1Tn8lkb2AVOYskUn350Zq3GVj/lhFgO3wzshnmPKFapU/QvBQ14pvjPpSQHS/sZ2I3jC3OKrUu+A/K+wc+hK5WJhyEiGEM1VyRIOgrcC3pMsVRN8V+WUR8RpEBIvYzu5TPESWoaDL1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U11VPWbpd4j7TLgXxRtFAs1tqcR9cTHlVxX/m0z/H3Y=;
 b=ZCqJU0Ht45Pwj9E89KSVRe4YyKXts3TZakWMjnuquXFmcpOcC1ySBhXtdZcLxy5bqzPpqlAQODOnWep+1CDgqRGKjjHuZkpBTw9v/MIF9aLSegva9rXa9xFgfx7Dem/yy7BAtymyE7rTRe9Mzvuck1DKuxR85AhoT28jqvhkbVwuqKq8xm2lWCTrjNa8kBUh0DwIGLX1p3PvkLY6AaqrCpbfrNein0qlXxE9nZe0yYzEVWQl76HoUCuhh3l7SiNCOl/8+eoE5O+z8oEYUqesngAlwKmiGxXkzKl+5VZH6iS6hhvedXeNv+vr3Ikp45Uv6mkxy+OdCYhF9sdTPntGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0870.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:41:25 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9846.025; Thu, 7 May 2026 09:41:25 +0000
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
Date: Thu,  7 May 2026 17:41:11 +0800
Message-Id: <20260507094115.8355-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260507094115.8355-1-minda.chen@starfivetech.com>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::22) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a89e1a4-d4ce-4322-2331-08deac1cce6f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3Pt/ZYaEvToWlRXx9sFftKKKSKO6fM41R2mlYtYcR7joK9SEHVBENJbzvjEBucu6KA9oEdYT96ucdHm401PCiBOrhEEsvXqKF0FdSGZU4A1Qrb0P2cfumBfub5qOW5dimhW4T2U4WMIEFBbe6/h864Yqqy/BB1Vkj6EXnXf2Ezj6LlSEXa26cKMk2fqugnp6TuyTZ3CWkttbo0pzO3Qs69My3gLQTUG6v/wDQdhpMZyr8KuN8Im3Ql5qFRa+Q2uQH8Y4XUqbsO3wKLJqXaavWpO4m88a7mzchP/0MJ7MF6tZRpuHdQc2022tkWhuNEG0b+ZUZS7WLt61fxfXBTndiyTOgvqkHXcijXQ5GmryZBtFmN3iWSWxJTrYf+oVk6zGDnnnQWSqNZwsz+gCc0YgmtlXdDwRNrXZx3huSrepNDTXljzqjhcDRM2Gmf5ulDWKe64HomgGn6tU6urOX9QkRuBFjz5HO8QJHg5oc7bPgAUKQcb6Np5cZT5qF4EEXbOxPHftGPqzmzossV8wfAoSAkcu0o8U3a01RoVcz34iW1IChXQ0xogPjw0+rn1uce6n5uhHoKmz44X4L3EFvehUNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2ItyHvCeSBQ9aQL3yECb7f3tcsVF3V/r9wnpn3D0szjlJyLTkTqaqZyDP0er?=
 =?us-ascii?Q?TMTFFX8akm1x3QIoFq2+dR95b1z5QDl00yzIdYhWMuW67Xjyib2solFsW/9E?=
 =?us-ascii?Q?JlLfiR9fxrSKYR+mFnYC2H8+xuULJlmGTEbe8TFfxJ+mhvjlIOoI9A4bNbZw?=
 =?us-ascii?Q?Iby8jeyyHIoS0TnYeuUwA1Jyny5pFJkdkiqBQ+l1CyQxSm7A2X+fLvWBhSek?=
 =?us-ascii?Q?67X7QfKmbamjDFq8k7bGG/jGmsS6XfFvlmP7jRtRiys6BbbVbW5lmmIE0hB4?=
 =?us-ascii?Q?3UiLn1w7zXXpKfiCiEDOrgCMiOT40gzbQxpRJkqZdOBHsXnSklmBywaYk054?=
 =?us-ascii?Q?gXwLBP/gMErnSLCrJy1wmCaRmsc/Rcbm3h48lndIkztlHDSmFh/gHE0F9fDG?=
 =?us-ascii?Q?Oo4g2tgDBS/T0brWW+H71m4EkI9hp6HBNKv9RqE/GKqjitmWsuOiVj7rly0n?=
 =?us-ascii?Q?AMwMeBiQCxWJ23augiyyHvisTbDUcjeqZ2rfff+WlNAEHlK3oMS3Q2efVGQZ?=
 =?us-ascii?Q?pQOxlIjXZoVV7kl9h0z7mAevA0q33UW6vzC7Zep4PNwPeUN5GEM8lf5L9+Tt?=
 =?us-ascii?Q?9NZvomk7w0YTAZupYg3+Dl7xZ72zKLR6ILgSxIDwXLT8RHjK6k8a7jSnCjNv?=
 =?us-ascii?Q?1eLtmjnKLrNrDw7B9Z5K7YA6iEUm9V266YBG1EgJarAlF8vHghO56h7i3pck?=
 =?us-ascii?Q?JManrurKzvShID1ymVzo/HIE4fkbLVa8MGoqahxstTHG0uz1qHyI3Nd9IWXE?=
 =?us-ascii?Q?kEjDr54pz2Y/x9hr+dum+J7EkGn+PF4e/FoJkGikdJLGYbiAyDu293Jihlmf?=
 =?us-ascii?Q?1HAPUUtS9oVTUFWvGOvshCDxASgxiyLUPBCcmP3m3Qg9qrYAbRAjYS9ewbxs?=
 =?us-ascii?Q?RPYMABcf55hWARgmcn1jECK7ZwGWdYXZMisX8jnJufKL/Ff/Rr/XDHiVaIch?=
 =?us-ascii?Q?V2H0qCMt1JfnuqOdt8WZkHLrOuR0flXvS+aK1pkFrvjwJAjdrs+yS8glM+94?=
 =?us-ascii?Q?Efu69IGniUgqEKrRvmsBRlpAARCEEFGrc0Wb5VzlR+Mjmh6Ry1s0ibbZuWnF?=
 =?us-ascii?Q?/qtYbhtHc1V6nbZgb9agsVUMkPJiQP/GMO0UMQCoGTP5k4EipTmddXiqIu0L?=
 =?us-ascii?Q?wR/ZxJjC7jKoqrRpSXzojriVxI5tlWAJtWFC1nZGNBSiDOQ2o5kjiu6Xejo0?=
 =?us-ascii?Q?evW/1uuWUz5M/Ymqx93onwzGSG+o0b5JX2baxs2xdqawGgix+9SYrR20Dxmc?=
 =?us-ascii?Q?o6bBjNK0Q3mfyrHcipwQlDPPCVQj0JMZUrrI/6xZQRr4VydBwwlyQILgnt7y?=
 =?us-ascii?Q?sz2ORSu+8UBDayLXQ6+C+yss3BYA0nRLUS5MQGzpWQQc+7eHr+o2EMfV04Ys?=
 =?us-ascii?Q?vKbNC9eB7mZSlMGkey7PscbAB7WChwWJYzW+LXF8mLF4zwjDJU/sIRk8QZlE?=
 =?us-ascii?Q?6Kp8gfNsOe/giP7NPuDMgoRLAkusoJ3OGOltvu8/8MSe3BvWS0VfmcAVaJih?=
 =?us-ascii?Q?BZ9fNEHC0YFc9kvmKctM9dvhWgvRTvdg6h27AZPxEjl4TPMBg6N0PXiLx5SJ?=
 =?us-ascii?Q?vyN20Qo+DzfCFI9XS5OG73FkvMFxTBGYICThmeQ3dDEJs3GlPG0dN0UEVt1F?=
 =?us-ascii?Q?0GLnwAyivaIqP0woCnVQHBw0DzUd2xvVi4YDc62dSXon0UIcMe7XIessoyqT?=
 =?us-ascii?Q?IPntMGNkvCoYOrjZbEY0o2+3m+rc4QSIkg6Fkz215GYutREMDBlL3bJ9x8s+?=
 =?us-ascii?Q?Uy9JtDMK1BLxsO2VKFVs+x1mnm/45Do=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a89e1a4-d4ce-4322-2331-08deac1cce6f
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:41:25.6709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f22Ppz/gITobr7bW5f708Q0LcjAZK6IfjALq157ijd9jN55+CDAVzc0sDIqCz/h1ADYeLLJjdjaVw+mC60y+cRzNBzwqZxZwKLe4WBK8+0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0870
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v3 1/5] dt-bindings: net: starfive,
	jh7110-dwmac: Remove jh8100
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
X-Rspamd-Queue-Id: EFAAC4E6245
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	NEURAL_SPAM(0.00)[0.187];
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

Remove jh8100 dt-bindings because do not support it now.
StarFive have stopped jh8100 developing and will not release
it outside.

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
