Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIP0FQwpoGlIfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 12:05:48 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E21B01A4CCF
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 12:05:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E80CC8F273;
	Thu, 26 Feb 2026 11:05:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013033.outbound.protection.outlook.com
 [40.107.162.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39495C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 11:05:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O6O3xP6TRi1H47nHVxBGe7qU98ZH85/dR0sBfPQrncRndLaTTgbQnQPNwjE5ZTEO2Qs5+VRynzxQ3+v2RnryE65BaKKEpcOfjfyhl23n4kxlHfYX3iAUz6ACBC5JP//zjsCUPDX+r7y1vSuy0G1YXWUL2FkYzpna7Uc9y/WR4XL/hzd/Cs9dSlsRMiL2VFlkpAnxffOLo+wxbaiim3TS0MI2xODQZATCcT4ePPPozccppFF8n+pWXtbbey6eWB00Jn4UhCaCmd0X+V8JQOx3Z72kePeakGUZTOZ+PBit1n/3/ClH+vCTQ9mswNmLyNiKIuoliGfrUkIHS8dEDiN/aA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=ZLOo3soJCSehE7WzFiL4c8CS1uGhFlwKvFOgyG+7UxiozrzmcsudCEoQAjK5/3hIJo8KP/xV08o0uw6nR0HxqKV4kHlNH2MIGcDya0jzTkrZbEwAYih2SW1xvE3Tw3EcyYk1nJsORkKFVUfTaFZzjA355H8zl1bai+h/EUnEoebKH37j2LxG9YtaPdw6HWRQ/MzT+N6oGtpy28FuIw5q+NX9AC+ZnvYXslAZXF/N0EcCZg0PlGLTy1yZdfOtFda1TtxvazwU6s0Pbppdy25xyo+5CMkYlCXJgsS5ORzcBglcO+PLOkQ68itiWvn+/LynC9dTeApcGum5Qeowy1MBUw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=foss.st.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=fphy8PUmoOnzcD8PCiY3MZJlmn/4tJZXL9d7mZoQk10IrH2OHNpoql/Ss9ltHoXRtWxQDbGtSt37Aufu3o2fGn8PVFyv4/MaYs9ZLj7e3YBjwHuN+XH+CRyEYaohVurXPzUWNLtVqbPYOq2eR1rtS6bj4xN/hQzu/x4bLdG21Js=
Received: from DUZPR01CA0179.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::10) by DB3PR08MB8940.eurprd08.prod.outlook.com
 (2603:10a6:10:431::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 11:05:43 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::47) by DUZPR01CA0179.outlook.office365.com
 (2603:10a6:10:4b3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Thu,
 26 Feb 2026 11:05:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 11:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kG5CzKKg9a5YCzwImXluMIPGQM3yJyubeeSm7u4WL4/MrXe1St0T4jk9SrAuakhl+14gIC46f4h/MCcky9toKxrsJntlFELbNAMbNsLfvCRCMiFn8ZqKBo4J/7S/QwP9SChhszjErnxsNtV01HegD74T8mVzNYM8Q9mle+MQaurF7d01zXJdH5r/DpsKSRjayZH3FKKguz5WvmNm2HDcIBhTVNpApnBFtmwzkHvsKqyNkRcMzFkQ8Ec6Cr/eCdeInZXP++44r0JHeI7WqruQGiV1fvcZVhMnqoiYcOzDBo9/V8xUZ2RZyqp6Aq1nRtVgI6+sBdiX/ZxNq0QkETiuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=Ju772H8g0I39yTAJTRm/ZtifGkxs5IBYR1eylE9qbubGEpyYZQHazqYru1+gxnZwUbswgelQy7ZRThol8mi51Fj9C4OK8817OenUT9Y8LbIiByzZByWNkXZ2wxkNL1+iST2EG7T9QKNmByg1nMnfMZOA9apddtatC2sXuU+JJ3dFVJQlnhnuVzw2TuySuPgL3iMZkSIc70D51RsGrNvNuNILUPonxtqzSKeZehwuaWsSurAtqaj92vZ3It+BNcQLm2QHSxCok4wYVp0vlg67mmzFqNb0b2fVkV2azvLm2dLJvAgj166rXYer8vry823b3Fkz8K8eXabNfHmqxsdLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDl1y7nnE062V8Ek+TQdKoIj+6AlItpBqDQ7wZ9xzyE=;
 b=fphy8PUmoOnzcD8PCiY3MZJlmn/4tJZXL9d7mZoQk10IrH2OHNpoql/Ss9ltHoXRtWxQDbGtSt37Aufu3o2fGn8PVFyv4/MaYs9ZLj7e3YBjwHuN+XH+CRyEYaohVurXPzUWNLtVqbPYOq2eR1rtS6bj4xN/hQzu/x4bLdG21Js=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AS8PR08MB6631.eurprd08.prod.outlook.com (2603:10a6:20b:339::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 11:05:15 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%6]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 11:05:15 +0000
Message-ID: <b2e8dbf1-f492-4fab-ac17-8237a759a427@arm.com>
Date: Thu, 26 Feb 2026 11:05:14 +0000
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, cristian.marussi@arm.com,
 jens.wiklander@linaro.org, etienne.carriere@foss.st.com,
 Sudeep Holla <sudeep.holla@kernel.org>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
 <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
 <7c60e928-d99d-4341-966a-eed759069f5e@foss.st.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <7c60e928-d99d-4341-966a-eed759069f5e@foss.st.com>
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|AS8PR08MB6631:EE_|DB5PEPF00014B9F:EE_|DB3PR08MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b682ac3-058b-46ef-0aad-08de7526fbd2
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: Ck+xwoKXH0aOrC4IC1U5s1rX06ERh7WIeaqI46P+axK8D+JOtYJd1szaXJY6ZNb/oRC7sDkIL6EV5Ki9euvwxMHeBTClBwkV7UoPzYDvReqyT/k1q819fMgK9e3Lm3woMODfu55ISJPIrjj1LZihYbYBpDoy+Ly04xRaEsa6TRGvqnLDFUOPRNQ7dvlc1K5fmdxTh58ESmFRPF7gdttJeHJrSTPKHq70gc3Ivnc8yypgI3LIWWiJ11gGn3+Zm2fCY7WmA2MXwksg2KoLDDZVAGLqK58QYzIuvunDeJFzXeKSACrov63ppjfX4k8TQI7WShbBzpJK0A73bNkAzWdW6tz9DNqFTTekORhOgfsyzV5ZhSJm6azbpSJ/fMcW3/2uvzych0HF3j4dOTdmL3zo2n/kisTKgdFP1tDFfyU8m9j9+VOn+5KZot7BByLLVQqqj1W0pDBjBdpJ8PLmKfkXMZoJAAH969djgQu/qgpU5keoAYpOB4gae5eqcyBgG4VubDmgszUiua/Q3UHc+Fty7VxbLbPyCLSMQONAtz+MabIoblYmUyxP1icXzAo7oRIJTN4oyAtVvzfiW3Wj6a+ts9YuaZblgolHgjozRLK3CFjsg2ABFVR25ZgTL7+6BkPXCWnWZHbzOWVxjlfcaVpdnB/MYTvF0vddJz3xVZWFvDC3QrZrhoGR4LXY+gNdpbK3qiE5fwY2+RCWlBa7GCFU7zNpAAKdLlQPNRzAyVrV8pDfkIUMFGV7VEC4ncOzuEDRuCdLriQIKbHv7/bsm8yP1A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU4PR08MB11769.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6631
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2bc16013-572a-474b-6722-08de7526eb44
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|1800799024|35042699022|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info: 4qBxew7zSmdeizISpR43bdtwZv2Z4jb59l8YKukF0F7sn3i5Rbn1w+3qaGhh3PlslO+CE8We2xGf3GAt5dczBP76yu0o9rK3tnwQnyVvCMxN3mldir3DTu62pASwm+cYFiUd2+jbTs0R3aWt71L2njQj7AxDqRmcN2aIzRK6c8cGF67/A1E6Xk2RrQg43gcdwEkSN1pbI6+BVzP/ooANj31JGvHXJ81DORXTFacJCGTqM7Kn4Opg/YAfumT6EKYo9bA4KjA0nU+2VU16GOuxLnjNVUgPZ9K157ef7LtAbEV4qYVLRIlRYtiUvp97SoyLwbpwSBksl/I7Ps6iWw3Q0KjHWaEjSiqqwzdgcAljCvPHyAOzNbHJhG1VoeFVUwAUwBXXa7wY474e6DzJF/CXM0t5AMcPueSr5xw+hLjfH7Quypy45lkJ58ODhZcvYfjryk43QvvhsYyYPN/NUg/QxZ1sdYSKMHwESbMfp2PDIyL5rDu5Shrz70CVaeTeZ8IieQZ+aaAf30Bi29ZULcVrxFYZ05lRLwvO50i2oo47CISOsAzfbj31F/KNtEiP9WPE34XcrOaN1hDRW32y+/eNa1O4oY1Yz+aPIs2Hv2zyhyXg9udOGLBUqWdCLUwCtGCgzPKS8xiteEDDU2MY+sKve+3xPCAKXN1bBMWoYzcv+IEQMnTKuA5g/RKQM453ae6By+6fDNrWbnTACm4kZVJ20498YxZYgGmy5y48L0pLlFB9xyehF96w2PpxWc6go6msavrxCwT7zlE4X34XgsGEAg6z6FXpY6IceBa7XsvXWc3rcw9kEA32IGrzBVK9ANp29WsAQKw8GOPLhPpg39VL7Jh0f/cTmoxMmnl0Xf0pnbg=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(1800799024)(35042699022)(376014)(7416014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v5RIaY7bw905NERDMCgKD0tlci8vTeJZr+AZvj+UeR6a6QrrGr5PzIQsTMIoetXF2cDirJkOwioIHWmFG8NO8T9Fbeb+t4894BBCfkQJ/pen97QV9uSuL2z4CFoba+aQHQDxX/Gf8BKVmhPl3mAoeI+JH2/Ab4bMfLHwm/K+JiTy2hXdnvNinpzw6GV+5KF4hnf7YyJkhR7C7+LE6o54QfMXyWBWJYl98CkjSRNaCbc3AMP5W5ChE+z5gqEfZRl3L6ZoQktLU5kWLVQy/G+K6WgwaR/oUxHwvB2m1q81BRiPRkP71KDFZnHJEztlW/HN9ZckeqNn5SPMCTxODEVnPPO6NcbXhyhj5ST5vnNL7F6nx4JswJWibFcI+MDCf+F2REOgYlLDqqg1/Xz8a9OmxQd10lTw7qH28TQkwuAGseq1JhDKNPfmRYLrqihyels5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:05:42.5086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b682ac3-058b-46ef-0aad-08de7526fbd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8940
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 01/12] dt-bindings: document
 access-controllers property for coresight peripherals
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[arm.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,linaro.org,kernel.org,linux.dev,gmail.com,arm.com];
	FORGED_SENDER(0.00)[suzuki.poulose@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[arm.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[suzuki.poulose@arm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.148];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E21B01A4CCF
X-Rspamd-Action: no action

T24gMjYvMDIvMjAyNiAxMDo1NCwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4gCj4gCj4gT24g
Mi8yNi8yNiAxMTo0NiwgU3V6dWtpIEsgUG91bG9zZSB3cm90ZToKPj4gSGkKPj4KPj4gT24gMjYv
MDIvMjAyNiAxMDozMCwgR2F0aWVuIENoZXZhbGxpZXIgd3JvdGU6Cj4+PiBEb2N1bWVudCB0aGUg
YWNjZXNzLWNvbnRyb2xsZXJzIGZvciBjb3Jlc2lnaHQgcGVyaXBoZXJhbHMgaW4gY2FzZSBzb21l
Cj4+PiBhY2Nlc3MgY2hlY2tzIG5lZWQgdG8gYmUgcGVyZm9ybWVkIHRvIHVzZSB0aGVtLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBm
b3NzLnN0LmNvbT4KPj4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJu
ZWwub3JnPgo+Pj4gLS0tCj4+PiDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FybSxjb3Jlc2lnaHQtIAo+Pj4gY3RpLnlhbWzCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMg
KysrCj4+PiDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1keW5h
bWljLSAKPj4+IGZ1bm5lbC55YW1swqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArKysKPj4+IMKgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC0gCj4+PiBl
dG0ueWFtbMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArKysKPj4+IMKgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC0gCj4+PiBzdG0ueWFtbMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMyArKysKPj4+IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC0gCj4+PiB0bWMueWFtbMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMyArKysKPj4+IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YXJtLGNvcmVzaWdodC0gCj4+PiB0cGl1LnlhbWzCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICsrKwo+
Pgo+PiBBcmUgeW91IHN1cmUsIHlvdSBhcmUgbm90IG1pc3NpbmcgInJlcGxpY2F0b3IiIGluIHRo
ZSBsaXN0ID8KPj4KPj4gT3RoZXJ3aXNlLCBsb29rcyBnb29kIHRvIG1lLgo+Pgo+PiBBY2tlZC1i
eTogU3V6dWtpIEsgUG91bG9zZSA8c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4KPj4KPiAKPiBUaGUg
cmVwbGljYXRvciBpcyBub3QgcHJlc2VudCBvbiB0aGUgTGludXggc2lkZSBvbiBzdG0zMm1wMXgg
cGxhdGZvcm1zCj4gKE9ubHkgcHJlc2VudCBmb3IgdGhlIENvcnRleCBNNCBjby1wcm9jZXNzb3Ig
b24gc3RtMzJtcDE1eCBwbGF0Zm9ybXMpLgo+IE9uIHN0bTMybXAyeCBwbGF0Zm9ybXMsIGl0IHdp
bGwgYmUgbmVjZXNzYXJ5IHNvIGl0IHdpbGwgYmUgYWRkZWQgaW4gdGhlCj4gcmVsYXRlZCBQLVIg
YmVjYXVzZSB3ZSdsbCBuZWVkIHRoZSBzYW1lIGRlYnVnIGFjY2VzcyBjaGVjayBtZWNoYW5pc20u
CgpGYWlyIGVub3VnaC4gSXQgbG9va2VkIGEgYml0IG9kZCB0byBtZSB3aXRoIFRNQyBhbmQgVFBJ
VSBib3RoIGluIHRoZQpsaXN0IHdpdGhvdXQgYSBSZXBsaWNhdG9yLgoKQWNrZWQtYnk6IFN1enVr
aSBLIFBvdWxvc2UgPHN1enVraS5wb3Vsb3NlQGFybS5jb20+CgoKPiAKPj4KPj4KPj4+IMKgIDYg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtIAo+Pj4gY3Rp
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2ln
aHQtY3RpLnlhbWwKPj4+IGluZGV4IDJhOTE2NzBjY2I4Yy4uOTQ5NDQ0YWJhMWY4IDEwMDY0NAo+
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29yZXNp
Z2h0LWN0aS55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FybSxjb3Jlc2lnaHQtY3RpLnlhbWwKPj4+IEBAIC0xMjgsNiArMTI4LDkgQEAgcHJvcGVy
dGllczoKPj4+IMKgwqDCoCAiI2FkZHJlc3MtY2VsbHMiOgo+Pj4gwqDCoMKgwqDCoCBjb25zdDog
MQo+Pj4gK8KgIGFjY2Vzcy1jb250cm9sbGVyczoKPj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4+
ICsKPj4+IMKgIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+Pj4gwqDCoMKgICdedHJpZy1jb25uc0AoWzAt
OV0rKSQnOgo+Pj4gwqDCoMKgwqDCoCB0eXBlOiBvYmplY3QKPj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtIAo+Pj4gZHlu
YW1pYy1mdW5uZWwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
IAo+Pj4gYXJtLGNvcmVzaWdodC1keW5hbWljLWZ1bm5lbC55YW1sCj4+PiBpbmRleCBiNzRkYjE1
ZTVmOGEuLmIwNjkzY2Q0NmQyNyAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1keW5hbWljLSAKPj4+IGZ1bm5lbC55YW1s
Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jl
c2lnaHQtZHluYW1pYy0gCj4+PiBmdW5uZWwueWFtbAo+Pj4gQEAgLTc4LDYgKzc4LDkgQEAgcHJv
cGVydGllczoKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXNjcmlwdGlvbjogT3V0cHV0IGNvbm5l
Y3Rpb24gdG8gQ29yZVNpZ2h0IFRyYWNlIGJ1cwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICRyZWY6
IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+Pj4gK8KgIGFjY2Vzcy1jb250
cm9sbGVyczoKPj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4+ICsKPj4+IMKgIHJlcXVpcmVkOgo+
Pj4gwqDCoMKgIC0gY29tcGF0aWJsZQo+Pj4gwqDCoMKgIC0gcmVnCj4+PiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LSAKPj4+
IGV0bS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29y
ZXNpZ2h0LWV0bS55YW1sCj4+PiBpbmRleCA3MWYyZTFlZDI3ZTUuLjEwZWJiYmVhZGY5MyAxMDA2
NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNv
cmVzaWdodC1ldG0ueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9hcm0sY29yZXNpZ2h0LWV0bS55YW1sCj4+PiBAQCAtMTE4LDYgKzExOCw5IEBAIHBy
b3BlcnRpZXM6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IE91dHB1dCBjb25u
ZWN0aW9uIGZyb20gdGhlIEVUTSB0byBDb3JlU2lnaHQgCj4+PiBUcmFjZSBidXMuCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0
Cj4+PiArwqAgYWNjZXNzLWNvbnRyb2xsZXJzOgo+Pj4gK8KgwqDCoCBtYXhJdGVtczogMQo+Pj4g
Kwo+Pj4gwqAgcmVxdWlyZWQ6Cj4+PiDCoMKgwqAgLSBjb21wYXRpYmxlCj4+PiDCoMKgwqAgLSBj
bG9ja3MKPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FybSxjb3Jlc2lnaHQtIAo+Pj4gc3RtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtc3RtLnlhbWwKPj4+IGluZGV4IDM3ODM4MGMz
ZjVhYS4uZjI0M2U3NmY1OTdmIDEwMDY0NAo+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LXN0bS55YW1sCj4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtc3RtLnlhbWwKPj4+
IEBAIC03Myw2ICs3Myw5IEBAIHByb3BlcnRpZXM6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVz
Y3JpcHRpb246IE91dHB1dCBjb25uZWN0aW9uIHRvIHRoZSBDb3JlU2lnaHQgVHJhY2UgYnVzLgo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRp
ZXMvcG9ydAo+Pj4gK8KgIGFjY2Vzcy1jb250cm9sbGVyczoKPj4+ICvCoMKgwqAgbWF4SXRlbXM6
IDEKPj4+ICsKPj4+IMKgIHJlcXVpcmVkOgo+Pj4gwqDCoMKgIC0gY29tcGF0aWJsZQo+Pj4gwqDC
oMKgIC0gcmVnCj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9hcm0sY29yZXNpZ2h0LSAKPj4+IHRtYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LXRtYy55YW1sCj4+PiBpbmRleCA5NmRk
NWI1Zjc3MWEuLjlkYzA5NjY5OGM2NSAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC10bWMueWFtbAo+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LXRtYy55YW1s
Cj4+PiBAQCAtMTI4LDYgKzEyOCw5IEBAIHByb3BlcnRpZXM6Cj4+PiDCoMKgwqDCoMKgwqDCoCAt
IGNvbnN0OiB0cmFjZWRhdGEKPj4+IMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IG1ldGFkYXRhCj4+
PiArwqAgYWNjZXNzLWNvbnRyb2xsZXJzOgo+Pj4gK8KgwqDCoCBtYXhJdGVtczogMQo+Pj4gKwo+
Pj4gwqAgcmVxdWlyZWQ6Cj4+PiDCoMKgwqAgLSBjb21wYXRpYmxlCj4+PiDCoMKgwqAgLSByZWcK
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2Fy
bSxjb3Jlc2lnaHQtIAo+Pj4gdHBpdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LSAKPj4+IHRwaXUueWFtbAo+Pj4gaW5kZXggYTIwN2Y2
ODk5ZTY3Li4yOWJiYzM5NjFmZGYgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtdHBpdS55YW1sCj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtdHBpdS55YW1s
Cj4+PiBAQCAtNzAsNiArNzAsOSBAQCBwcm9wZXJ0aWVzOgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGRlc2NyaXB0aW9uOiBJbnB1dCBjb25uZWN0aW9uIGZyb20gdGhlIENvcmVTaWdodCBUcmFjZSBi
dXMuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJv
cGVydGllcy9wb3J0Cj4+PiArwqAgYWNjZXNzLWNvbnRyb2xsZXJzOgo+Pj4gK8KgwqDCoCBtYXhJ
dGVtczogMQo+Pj4gKwo+Pj4gwqAgcmVxdWlyZWQ6Cj4+PiDCoMKgwqAgLSBjb21wYXRpYmxlCj4+
PiDCoMKgwqAgLSByZWcKPj4+Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
