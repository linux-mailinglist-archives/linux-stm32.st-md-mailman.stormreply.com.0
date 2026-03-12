Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA5gDaexsmmYOwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:29:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5DF271C3E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:29:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72A7DC8F28F;
	Thu, 12 Mar 2026 12:29:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013018.outbound.protection.outlook.com [40.107.159.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1CCFC8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 12:29:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQuT7Vds34GmDBWWKebJHMbfT190ByWmCV3jiWb5k91BMblhtUAp/n7RkWI8yCBhmnHHgwkS2bICvAj53a34b9Az9WK4Enio8t/NRDu1DKIyQvJ9GW+ICFE1eDGWZFpoasLrBxkqA51imXYkUHadKdYad+5KWK/F0MYlNSEncR9eJQeTNMeiPynHSW3I4v/X9akUu0aRUi2GkUPUVYjXiHM9xqVo5LAo56uvd6EZtUNrzDx7r29hR+m7XmL8y8w/u/+ZaG5ijXnXm8iY0U6/avJZtiKG0krQnhBih/9W9fxRw05MImuTH+swRU88W8LEKl/OYkHUqcB+B3t7kh5DHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxGYC5mRfJl3mAwui4FDoKmn6y8ODP6aaHPdAGtnxfk=;
 b=ee/WQpN1sE5XV/UJ9elao/h87x3PZl21bii7fQK4X5DBb62yJL8IvK7DpV5ihiNdNmnTYTlY6NWPS2tgdPY9WEHPIYbZWk4M/ctn5g9dhu+0G1H7M7OAShZbebIzawR23tLKEjYB2SsyZiReoqksr1T8jC6c+MIDE6zdC5OseMjkYiR7txmpCc5klJ+danK4OtIfMzOcbL6GuT0b8lAuQRveU6hQlDswcnMzqBOcCC+qiDT1F9I6pSuD54dekj1p2TaBTIZqEq8uhzSoC+pBWKwPqXaXQwXYG+ofatoPu4vqA41oNktclULnDgyaybxj/y/LAw0v0/7j4o/SqSfO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxGYC5mRfJl3mAwui4FDoKmn6y8ODP6aaHPdAGtnxfk=;
 b=l+ZpVJ57LcBhw6I4AqN+GPD01s5LCesc68STFwA7M+1tCjwV8qmrJydDCZ7fs0NY6o3teRcHyQUypEie6B46nc/fBx+S0p2k/efVnWm4/wk5rOLy4r0EQUXLqBY0g0E3JRc1nV9WB9zFWz3ARHl6RTAc+APh3hN/QwpZijBmGEGu6XXGDKp55sdjtJJ72Vgd25TKPejC8nnsrNUR4iqaGq2oZlwGL7uFcJ7xJVzenP9NzF52LfUgKc3Rk3pKcgc6y+4mhZA2fDxjxN2HBq2OzAjm+r/Ap8XcbOaGNXgsqSkBU1GR8AHyyGesFT2LB58Phl8sD89oWc/6K6BUOcdAHg==
Received: from DUZPR01CA0289.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::20) by GVXPR10MB8314.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1df::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:29:21 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::8b) by DUZPR01CA0289.outlook.office365.com
 (2603:10a6:10:4b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 12:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 12 Mar 2026 12:29:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:31:50 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:29:19 +0100
Message-ID: <24a1be11-8c4b-43eb-9223-919eb87efb17@foss.st.com>
Date: Thu, 12 Mar 2026 13:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|GVXPR10MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fbbea0-f422-40d1-94b5-08de8032fcd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4ATxXA0HZSrmv94Gx79UOx/kDZfZ4ONjOU31jDz2iPt+WCPLjF9eIL8ey2+FPNBMQABfFlpXl/vjTnq7I0eWfGTmwMn0o+l/gXy0zGTcjWz+XlJkyO5dofmZS59NktJbVNLd70eIzYz0pd/Jp6f9mfRSDwFWyh+MWdCVNhqOjOTclBFl8swiMEkwGi/bmy8G51T/yOXJepFQo1LwFFPQK0gH4HWgLYlgzdXOcbYwy+xgeIBW4H2A5+K5R6hW8rUsfHsAEsR0ZkRAgksc8c8FsLLK6QJbrZEszUjjKHbN6vei7qB6pjVHaXLdd6oE+PgNWvxI2+j9jzTMJ1ZozYzYz+u4x4GwjeXl4OiXnGkBNSYuNzVTJzsvXgWJvs3u1/QCAE7eyitxNBKK/H5dNTak1kWcpNFiMboCi3D6sXgGUhe4+oNG/uLRNHNPgI7FW7Lv/kDPkwp7PNkn5rUUrXRqHu1Yu6VaU3bL94zYJLvncRw0YKRPGhM3SB2XDyRmrWiUNUarqRCRTQnqTSAht1xgMJMGlMYOW80MprVGBgHVQRY49SENic90NUGQ41zBZzLdCfMx+k3x1dCEEq/sfMnMBsjAamfegfs7SIAQbJXSchHv6Tj2zZDxh8Ody/3lrIGuJTojXW9bE9vl5Zjj9YIW9gM3786NahDT/GTnzDEbflQD9uo2mWru6zN/rRqJmo3mS3cRY8Xt1QMUA2hpNJ+rvp6d4FY0RjkPT2D0U1A7jUBaosbQOUaep4x2c7CZ1iK5sGmxoAKtYfsQZ+TOlmjDiQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TAPZPWHrMpG5FAnuVpw9Y95fu3naq6WO6FO7QuxohpgkcNIRQkc/Ic2LmJxTmwNLpErEq6FSY2PYQ0PxRbcr0srX4njY6QLIZpz5wtAjpHqPaUAPuXGxrmS4FifVViB2Y0kXYpxi/FwxSrm08QN/QHWVwHh0BGEsOaO0IFe1K5sk19HHeSPkPguV4i4GtQgfdR+D9hUb2rwW0AiqnR21a5fihOO5muq26OVk3MHJkt0p8yATINSrRXqtFhTHWL/rZ6vJlrGVYOLK3glsAbGGHIXfE9O7P8IE2xiu25ZpzEV7vk7GgPT2kdxIwAzkWfuCkgNXK357yra2f6qTOtYUvPpU5fz0QfOadFqqKpkp8N2Xi8PcaNWfVqPdCJgjDLv7MYTAyQ2+S5fm0bi0nTBXGNg72yqZJ/S/zMUGQW7hegpvwTbz4xXSHRwu1eOd4cCl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:29:21.0864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fbbea0-f422-40d1-94b5-08de8032fcd8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8314
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/9] dts: st: various additions / fixes in
	STM32 i2c nodes
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.975];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF5DF271C3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Salut Alain

On 2/24/26 16:48, Alain Volmat wrote:
> This series perform various improvements in STM32MP1x and
> STM32MP2x i2c nodes, including:
>    - usage of exti interrupt controller in order to allow
>      wakeup-source
>    - enabling of dma mode
>    - addition of boards i2c node
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (8):
>        ARM: dts: stm32: update i2c nodes interrupt/dma in stm32mp151
>        ARM: dts: stm32: update i2c nodes interrupt/wakeup-source in stm32mp131
>        arm64: dts: st: update i2c nodes interrupt/wakeup-source in stm32mp251
>        arm64: dts: st: update i2c nodes interrupt/wakeup-source in stm32mp231
>        arm64: dts: st: add i2c2 pinmux nodes in stm32mp25-pinctrl.dtsi
>        arm64: dts: st: disable DMA usage for i2c on stm32mp257f-ev1
>        arm64: dts: st: describe i2c2 / i2c8 on stm32mp257f-dk
>        arm64: dts: st: describe i2c2 / i2c8 on stm32mp235f-dk
> 
> Olivier Moysan (1):
>        ARM: dts: stm32: remove i2c dma properties in stm32mp157c-ev1
> 
>   arch/arm/boot/dts/st/stm32mp131.dtsi          | 25 +++++++++-------
>   arch/arm/boot/dts/st/stm32mp151.dtsi          | 42 +++++++++++++++++++--------
>   arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  4 +++
>   arch/arm64/boot/dts/st/stm32mp231.dtsi        | 12 +++++---
>   arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 26 +++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 17 +++++++++++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi        | 24 ++++++++++-----
>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 26 +++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  6 ++++
>   9 files changed, 148 insertions(+), 34 deletions(-)
> ---
> base-commit: 291f393298f72091490dfa70ab4a0ebdbb4c7d7e
> change-id: 20260224-stm32-i2c-dt-updates-418a40f03734
> 
> Best regards,

Series applied on stm32-next.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
