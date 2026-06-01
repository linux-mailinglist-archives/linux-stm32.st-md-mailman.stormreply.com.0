Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK5+JFU8HWoqWQkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 10:01:25 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E573461B39C
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 10:01:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2821CFAC40;
	Mon,  1 Jun 2026 08:01:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013060.outbound.protection.outlook.com [52.101.72.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB64EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2026 08:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRzzmnhUwyquc8iDiuHsoX7B7N+wzAoz45f7jvJMy3MmD2fsPnP0XrRh6u0yOX4x4ZL+zPr94BR3cPxP4IXMOeXO6oE0NGRCec4NbcE0kej3GrApScwz0JTPkq8NyXu9Z0C9wGNGJedqlslAOrKCbX6kygTk+QP6nL+WCWUeJBcVwHOJaSe6x4MuLDqaWkXhY50XS9wg9SX4rusG24rVPMM5PYYapn2iRpPTNqf8mEsGNzQS7iQ/QBjBwpkwZkNYaUnuTjtbt1J49ScjGcB0XqnYPyWsUcpdH7gAPMGH/lbrSKSq9+W6ApjstIb9taZUbuI9k84oX2F0wkdE6ycIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUYk8lD+a291OHqguuiEfZqGcNUEgLeGspxyAkjLdRU=;
 b=OQ4Nd6yvt+QXvQ5Ormd5xZNy5JwbhTJhPMyIGnKK8EclzxhUDZySGYDo0/0lqT5q5H0BOG48HQleTYlCnGe0HNspQ07uMPIHbHpiHtgREGZf6pll3KPKL/xyaLTxlnh7x5N6TrzMBo9qMkRuaKJ94wN7+SArCJAKQmsvATkd8IxaFc1m2AEL8SP19Y35G0lUHlu5gP+5FbFMml5tbDC+Uh82f5VXxUZs5q91E7Z+Kz/70VZpZeVtY3hJTJ3+R69iaoy2WDWYR4tkwmPzTsQ+H2WG+0WwkkP+lwH8COjKuwW8CMPlw/5vfYkiHAKKP1He0uBH00CaM345gEnR7E8MsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUYk8lD+a291OHqguuiEfZqGcNUEgLeGspxyAkjLdRU=;
 b=PQ5kla0ePEj6WL7BmJJ0w4iRpZXPTVom63jP9CD7M1meiEGuAVuylFbvneY190MxrTOUoHa7ShZOjVaLu8l6De2i4uSaeuLMkL1LwHVDlMrCN93jvghAB63IBEnwE3iQUZv1N6dO/mr0yBMi2ure8SrtHkhcmFANWHGT3DhW/evuWyIT8J6GgfAwEZD4KuLsVsp4XhbWAAOfWSLIK26EZ6KmLe21fMoLxi8UgkIBHlZn5doFgAQT3BVakyfbjJkW94RTgURk9efPsIX8v+VwujZoj8M6EtICK9rZ+y0+VKSewzJzPUnpf4OMmC6mpOdt/rJL8UPgmnM41nFnJWjXVg==
Received: from DU2P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::29)
 by DB9PR10MB5977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 08:01:19 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::24) by DU2P251CA0020.outlook.office365.com
 (2603:10a6:10:230::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Mon, 1
 Jun 2026 08:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 08:01:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:05:02 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:01:18 +0200
Message-ID: <d0bd6b92-328e-4fdc-80e8-b4e5f493e19d@foss.st.com>
Date: Mon, 1 Jun 2026 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
References: <20260411130300.19603-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260411130300.19603-1-marex@nabladev.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DB9PR10MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 372fe290-a6e7-4982-bfcc-08debfb3f6b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: aPElhx97ZD4r2DPi+Tz8SkeH78izHX/qNZX59Zw6N1l+7UcH9Ebzs07fJggw0RISAl72g/J48uWJ1aqt9tvlSnG54JELojDWUBVMROLHS/2f0nPkNkPv2XhaOh98upNkxsjd5CfwuENSWvcmFAHheBSpuTUbIl2GrKzWBZC0lEe4iuDlt1K9azaU+h0HnxksiNQxWbCG3JSemG/C/D3in8PUVS10/EGxsuXXWq3UFlw3kjk6PDPwsMzuRRXJsWj+BlBANpOgF/lwu/HN8lQvSs8X2HylNC+4ukq00uAxcgNBZ2skjVlIMdca7qZOmXiuW2tRdOhukAET2Wj4FAWc2kEByISL+BuHcqviB5le9JlZUGRiG61htSoBJUFVL7+T816ju58V4M866GDnrpJ+S2I57MYwTlk30tRHKRxfeMInBaPJ6nbkycKsimjLX1HRHHcCheAnzzt3I8W7imPbUY7iD1BiNxonV+M0fTx+g1uuHG+hdo0RyxGTqr6sBQhN69UY83mSdgbNEhYuO7sSPT93Cn6DTLd34P3MI1rWLgdysX6dEcW9ET2OcnNvm+BvhPOiw2H8m/trXGxk8MTUPuUrT1ccOFvOm75tZ6LsRacthxfpyevtdWcxWqftxDhnBUHDFz5sJCbvuQ2MCBpCqofrLpET5OcjIiOhqQCt+bnV/zz6+j+eeJfU52LdO0JrAg9iFkhYLPufMlrn5sjUbNOkJvsucTaWeDyY5qaCYfg=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ziudcibVk8rBqC1AEjIqg4t4zu1giFF7rlsol8u2Sw6fNYUUIo7H3E9Pq3dYpbU1OmFqxEU4kgryqe47+pqwCoWDm7gzRCS/cIqzEnZXtkYLCYZYNzz3J0NAaoQbeeUf85nVcTr+W1rixQtJDroHGL5IyKf0O5wFiOmkWyXDzd6Wr/LSEk46LXJUf7VJOu2jk4/bH6RhFty166Hk+6DaANaFR7gyC5T2/JwWhVp0hYyxRoERchxki8vroN++glqG1ejnVzvCX1rtiFFbE6rbU/3MMAjgyLwgKL6LV75UaSpixDwVukkG4nW3571XQ+5Ln041FgJPwegqgpe169fww175ylyUWjz2AhnstY8x13fxUPe1iB6vcmFFYafyBwvWGu1gStf8o/kTkurOWDh7HroTFeagBO3PgTx7fi3+5/8j3km5CnZRpKYFfcoEN0zs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:01:19.1241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 372fe290-a6e7-4982-bfcc-08debfb3f6b6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5977
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] arm64: dts: st: Fix SAI addresses on
	stm32mp251
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.981];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E573461B39C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek

On 4/11/26 15:02, Marek Vasut wrote:
> The second field of SAI register addresses should be within 0x3f0 bytes
> from the start of the SAI register addresses, the second field describes
> the ID registers which are at that addrses. Currently, the second field
> does not match RM, fix it.
> 
> Fixes: bf26d75a95f1 ("arm64: dts: st: add sai support on stm32mp251")
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index 673fbc5632e69..9c63fdb5a885a 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1202,7 +1202,7 @@ spi5: spi@40280000 {
>   
>   			sai1: sai@40290000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x40290000 0x4>, <0x4029a3f0 0x10>;
> +				reg = <0x40290000 0x4>, <0x402903f0 0x10>;
>   				ranges = <0 0x40290000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1236,7 +1236,7 @@ sai1b: audio-controller@40290024 {
>   
>   			sai2: sai@402a0000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x402a0000 0x4>, <0x402aa3f0 0x10>;
> +				reg = <0x402a0000 0x4>, <0x402a03f0 0x10>;
>   				ranges = <0 0x402a0000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1270,7 +1270,7 @@ sai2b: audio-controller@402a0024 {
>   
>   			sai3: sai@402b0000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x402b0000 0x4>, <0x402ba3f0 0x10>;
> +				reg = <0x402b0000 0x4>, <0x402b03f0 0x10>;
>   				ranges = <0 0x402b0000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;
> @@ -1362,7 +1362,7 @@ usart1: serial@40330000 {
>   
>   			sai4: sai@40340000 {
>   				compatible = "st,stm32mp25-sai";
> -				reg = <0x40340000 0x4>, <0x4034a3f0 0x10>;
> +				reg = <0x40340000 0x4>, <0x403403f0 0x10>;
>   				ranges = <0 0x40340000 0x400>;
>   				#address-cells = <1>;
>   				#size-cells = <1>;

Applied on stm32-next.

thanks!
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
