Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPB+Evz0w2lZvAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 15:45:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6142327026
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Mar 2026 15:45:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 539B0C8F261;
	Wed, 25 Mar 2026 14:45:15 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013016.outbound.protection.outlook.com [52.101.72.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21CD3C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 14:45:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHuqTMNPYntHs0VJ3KZ0QOImjXKlEh68cxcHnEAPmmFjcu3zFwAmClaS2bZEbSrQ2aOPLhQ+o1nAL8emJlzvF1edMlDznyL6AZ+0dsBhdgPspV694uEdk0xF9L7TMT927YEZTuk94GfcDAJ0M45NEjfIgnMacvpYlc8fRLG1OO4+5+3C5ozMrITA3AXYfC56hETe9sj2h0y4uwtTzC9YoVDXD3yUcEmaACOl4gBEuw/Gf8imT1R7NlLNdnswyOPIdXYIeKNyBGNurZCrGIrCkby8anfcA0wTJShsupJ87LFRWVTdGbFxiwLFgoGDAauvHDhogfbMBA0wu8B4t5zsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5RRD3wf9aWOZDjla3ylpxHPMpUQ5H4qTEmln4BOEyk=;
 b=NKfxIwWUO/sj0uwRmzdA5AQDKjhNN+lvj/nt+3j5cXpnQ+OFRtdCev/zS8Q7NRMCAU555A3nN+//3Pu60NuGv6syCt4SetWJpx98JZ9h+f8StbwJ6RcZ02GOp+bHEHcUJOoHqnAJiqjkbHzmtGpSKKujU+hJbs0oA05ycYeoQwXe3fWheR0AqewjMcxH8O3nTPpIPS9jPJxBfVuAtk50GxYXWfamSKms9Lg/zvZHw5GhaTZKICK9DQ/kKpobtny+M26Q3aiHrNtmru08ixg2TI05SFhXsW306HPVc2c5kP4voYOQnFXfa3peFM8EIPhmisJk25O2gMOexKc0mpAC5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5RRD3wf9aWOZDjla3ylpxHPMpUQ5H4qTEmln4BOEyk=;
 b=LojPukD0YklbZ99BZqyDsrkSeSa5j0rdVoxcpDqHoXJ7s05fm+sjc7iP9ZA1XESwA335t9I90CNk7M/fS8AE/fDk33gisRmuIFgyxydF6t8KfycFQPYDFoznD9LnmR6m2h0wBrCL3ZkMiyCzBcJRP6nexxsKix8Zu3VkImj+RuyH3OK60ylPeTr/1EjNDmpUo94PpCkk8VwPcEXxZMGxz8h3qhKHKdUPv9hjs6rCIhsDC5S/W+cO/DitQjvkXvJ5tIDA2xwpJGmlPOhcjuL6N+nU9lXskow6KG4+tp18DHU8e4Juwj9WZmI9U0rbN+evBvP62xLjg7Hfa8ZYjb7vHw==
Received: from AS4P191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::24)
 by AM9PR10MB4038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:45:12 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::a4) by AS4P191CA0039.outlook.office365.com
 (2603:10a6:20b:657::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 14:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:45:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:47:49 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:45:10 +0100
Message-ID: <ed2ae5ee-af2d-4aa1-90c3-eb13bbb1de69@foss.st.com>
Date: Wed, 25 Mar 2026 15:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000048:EE_|AM9PR10MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6d990a-d88a-49df-e90c-08de8a7d1e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: KqTdLzWCvnF5KEHiVGw797LUIGDz67Pv05cmR8Oyc1gwqoJzpKWg2IRA7MzSNPrLMCyFy2ADEtsbeqdlIlSYzzuB3xZly3V8IO67d5I+gShkAT0jO1I5MeFz8/UUlZ3zRxqvIACGVnFBQzFqBxKCKq7wF5/+uOCM8jRrrtoF/ChWn+e2yyfsyDShtUCqW9UXN0MzmZ9byd9Cb5L35NNnqWJINEMXN5TepI4Eko6s8RJvlwnmlAdOHnAz+I507mKJGthTNU3Bx8XWjsJD/Fr+9vjp1NFZClk6Awfd40NZjosna/uS7g0FzfX60CGdT6g93DAddwvC4Rq9TVmOAZ0uAczMrbL3jPDJlriQWLMYXIIQCm8fVaa7jju+4NCjqFdxYDALs308O05wXpaDbpNAVvf5DPtcBovOplgN94mgT6GjzwYCcds7Y0QsnI3LBFpgh1PhV2+G3nnFRbctJ1vJWf1Wg2ORWGPnKwJ2uMcLIa8mH4X6ioSIDim+a3beSNCXcPAQOkf/8DD+FuyibMO42qz1pgypibl92+EQYaNSl+d1wgIRUlrlpAXSK5AHK6iRM/S/gKkJxFcO7nV5/e3ZCrSeEVEJU6Tt40OsoWjnzt4yVR9Vv5MdWrYQia1j9KhcehAU6sD1U32KJuMIDYgaJCndgU7I/SunVmJegphOE7e1iAxRH7PMf3HRfEWyoYXonExwOj15BFvCCyQIxMt+xSpioSqPd1Gage/jjnTMAIY6b3agyWBs0AdR775hbt4y5X9J4zE0vjMzmQ4hWNexYg==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: czKLHLUEpvZl5wOdQcxdeTJ2bPVT0cFxz4ZTOOoDOSqqthvQf7NTWrv6H8rlr4JMLPAuy7urySO4iJByTn0m5QUeqojNxKG9VDF0y2EETzYm8WJSWTdP9zskXZWRcy07vaBCEr9uF78qmK4foFdD69AYsYgqZI6xECEp7qXNmQ8fPt0oMPlK9UyKluLdyE33+YUQhOGfJYoKotPQiGWhyYbs3gtq5RC8JhygbheoTlAQxoQTT1tN3s6V0Djf2Ci3kOZysH1nUXAbsp1PVo6/GingR8APdzwrBsNl89qq3sahUFURtzP9aOjvUAt6xQhYWal/WUu45+pqH/xX5R6cm0yQcWp5ZfwggERdjxvpA4Q/ZAZ+tSyrnCPnZ3/BKGsfbxC0WApReA4O7nrpv61FHzuNSTrNauzR8pTwPu55iZoAIV7+iYEjgenVteLomapx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:45:12.0166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6d990a-d88a-49df-e90c-08de8a7d1e9a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4038
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/9] Enable display support for
 STM32MP257F-DK and STM32MP235F-DK
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:raphael.gallais-pou@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:christophe.roullier@foss.st.com,m:devicetree@vger.kernel.org,m:yannick.fertre@foss.st.com,m:linux-kernel@vger.kernel.org,m:rgallaispou@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.961];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6142327026
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Raph

On 2/10/26 11:03, Raphael Gallais-Pou wrote:
> This series aims to add and enable sufficient LVDS display support for
> STM32MP257F-DK and STM32MP235F-DK boards.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
> Changes in v2:
> - Added support for STM32MP235F-DK. A second series would have dependant
>    to the v1 of this series due to the pinctrl.  Better send it though
>    one push to reduce dependencies.
> - Link to v1:
> https://lore.kernel.org/r/20260205-master-v1-0-fe6399aa3aab@foss.st.com/
> 
> ---
> Raphael Gallais-Pou (9):
>        arm64: dts: st: add i2c2 pins for stm32mp25
>        arm64: dts: st: add ltdc support on stm32mp231
>        arm64: dts: st: add ltdc support on stm32mp235
>        arm64: dts: st: add lvds support on stm32mp235
>        arm64: dts: st: add clock-cells to syscfg node on stm32mp231
>        arm64: dts: st: describe power supplies for stm32mp235f-dk board
>        arm64: dts: st: enable display support on stm32mp235f-dk board
>        arm64: dts: st: describe power supplies for stm32mp257f-dk board
>        arm64: dts: st: enable display support on stm32mp257f-dk board
> 
>   arch/arm64/boot/dts/st/stm32mp231.dtsi        |  19 +++++
>   arch/arm64/boot/dts/st/stm32mp235.dtsi        |  18 ++++
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 117 +++++++++++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  17 ++++
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 118 ++++++++++++++++++++++++++
>   5 files changed, 289 insertions(+)
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260209-display-516c2cedc734
> 
> Best regards,

Series applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
