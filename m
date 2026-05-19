Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPuJIdsuDGq0XwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 11:35:23 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CDA57B60C
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 11:35:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53BBBC8F294;
	Tue, 19 May 2026 09:35:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E8BAC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 09:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEyg4k/ZR0XyVXQ47OSBM/Ms2kCZNdH1u6qVihONcNYEUgcyqLr1O9G3EghnySM8TcsYQ9j9nC0DzWDRgV2rI++3gqQBw9RJCMu+F8dxpdcNfyYSsudvu3J21hN8MIlhryURDPZ/MEnSXs0TrQTARr2Q58FT9FbqIT6gmCHz/n+SUMkn+nn+HefzMeP2LtWkaqmETVfipcpGj67jDBOqcxC8e8nqbFy5BW0K8FnXU4H01DOBq6YRUiwMdjpYCv5jrxZX0e3ozqdogA9EkOG5u1lHvDjLFEFIl20kLDzwVo/8aNeBHq2KuVxZLmwEFt9SWpLyOTyDnkRkzMF0oqiVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSFg+UFRjwK9IqByBuuwelj51afBYXQCLX71OrGxuo4=;
 b=BF1/PS7T+ZchbeU6enQrBkpqDBMb9uxawROV/IO5MWNVLYCG9+wSJE8wPoGE5DH+0sf8hHU60qwS+0u0A0gEHbEbnpbvsmnh3TRVdq7I3zYkscAFtayjtevqgDAnLqmu8/21h+GsVQ8U2nf5XFtL/7L2gm7Hudl6oiOxfC55KjLSXAVR7Ikk8vaS/Q+DhRF1PMSoyhFbdk+jBw8QrFRvBwgCxbaZZ1liPpnGrameFt5RnxB64dCRbJRDO4Q1DsTNmOn109ZSsv3tWns+aUXsDlHhsRf1955esfpJcuJovozw16V0GUlxkB75EZML1aIV+oarAWl1Nu6MAFIMKLT+Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSFg+UFRjwK9IqByBuuwelj51afBYXQCLX71OrGxuo4=;
 b=azAy6+2hbfjDU4i9EOueogw0aPETI5066sKyEOv7SuPXoIvwIozb0Jai+TEqqsLi8BnmYdR6Keyy5KcCePQS2ia7T/LTNZAi9KC5DYEkyQISuYuDIRgaiL09GdCN8Ed2Myz2S0kDMgEfhFe2vedcMHno5p5tTY7PND7/zyS589frt0djOWYsu94PzY+4GDeE0YGYWMUcaaUbnwqL9JHIBmm5zqgP3//yjBIJOwWZxuLp4UQEX3AR1wr+EkWwQ8tidnMESKmJf+8Lir3raYr+epDDp94JPu0jmcdBEDyX+Ez6uThYWKhUhFoB6nnGBtjTInDoa/FBr5ZuXgjcx9deWg==
Received: from DB3PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:8::49) by
 VI1PR10MB3582.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 09:35:18 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::69) by DB3PR08CA0036.outlook.office365.com
 (2603:10a6:8::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 09:35:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 09:35:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:39:11 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:35:17 +0200
Message-ID: <ca7971d1-b86a-4530-b86a-33e1e1c9bd39@foss.st.com>
Date: Tue, 19 May 2026 11:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
References: <20260411130355.19670-1-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260411130355.19670-1-marex@nabladev.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|VI1PR10MB3582:EE_
X-MS-Office365-Filtering-Correlation-Id: c9acc6c5-8f31-4477-4148-08deb589f090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: iMql3HljEkfVX1ZWQh1IyBpB8n4bC5e6C+MSEFBcxcwsRic5pjNYzi2o3PCMvq9iWQMaYdhgyJG0OlXEAitteXo1ZSW+8Ik0p8ipDD7ddB63m61PQ3CauUrrfCRzgpSeytdivOaYHTiOxL49eFHcNgfTPe9acPOSlBiZ+b6RDD0YGdpDnQ99MGqNI8o6c9SvHMZ65U3jQIKXcQ91HlgbsDrTNX5lDU/YnLobASnCmBOQrf0i9gyGZmbKBaX0xaNXIvLvtrkB2U6xALNgRIWbOzSFZnf9Lrjtypou2To+9O4SAZfMP1f5rgp0ew68CyUrIKJt8nLLhQL83OsrwXdJbktt7AZaXYPrWNV9DFvrpX5BbbQPrjDNevr0IvSvQ4tkMLxFdBmqgb3xhqCPc1wsLyBh9YHDzJPIBAFNzrwklsXZ8pnyJJvMe692xwblZE9okPhZ6Xs+iTTVZw8OwzaKS/qwhd/vHcZLLz7QS2a/JKUrSR8yXOBud6RUo58VGhecYXVd3lZcLMj8EvbZbdpmZWEpaqiJlMWkKNKWXs5nUP/yTJDM0aWjNr3x4DRRUmYzq2DogOxFgGZgkhDH5kl5VrO207cvx0V+HqTMOiLYLtGdr5dFgHP9bOj2BWw2EU3jvdktCh8OEQGr+zzweQNnLZbUJdgeGnOgHcQOwTMBZNpL96gUGTk2O3Xs2x6n/Ol7J0HOPt6/YfB66gXT7paIVm63wqC91I/6vbSttYQJyLk=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(11063799006)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EGc/6YzT8DeAkGPqb/yWjqRU47CQpvcOEsafHHzMOcIbTc/h/t8jnBKCsJMDkGklV5ZgbbxNtxfT9pv4a/kikiZ4avZ9OvT2jywAmfxktaziWq3n/m1R2siHXUP/jDufvOkyx2hamKp3ZJh8P5cSSiw9bDlaftegzxx5ddLAFkjirW+7EDeCqy8a8I2MtycvyypkdfEG6TF1y11zOXQolO8GVOsehX2MOeZC4nCSHvxl4G8UzSsJleIiS15FKDYAcGf8qoDXPwPN6CxJVKSehaVNPLUAZ272+estTLMT/Cx+V7Wl1HqZ5x6iOGxRSbpTzg/POub4eYyEBlryHhNWkQAVSloWhw8WLy0KVr1UTzvVcV2kIfDJm+usUi6nIcReWgaHomIIyOZ9TBgedPGA5NjFV+mxpfcjq/VDum8FY8ihEQrpBNxBkQCkM44b0K2D
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:35:18.3233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9acc6c5-8f31-4477-4148-08deb589f090
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3582
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@dh-electronics.com, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable PHY SSC on DH
 STM32MP13xx DHCOR DHSBC board
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
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:linux-arm-kernel@lists.infradead.org,m:cniedermaier@dh-electronics.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@dh-electronics.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[dh-electronics.com,kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A7CDA57B60C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek

On 4/11/26 15:03, Marek Vasut wrote:
> Add realtek,rxc-ssc-enable and realtek,sysclk-ssc-enable to both PHY
> DT nodes to enable PHY Spread Spectrum on RXC and SYSCLK, CLKOUT is
> disabled and therefore does not need SSC enabled.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> index 9902849ed0406..70d85af467353 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
> @@ -97,6 +97,8 @@ ethphy1: ethernet-phy@1 {
>   			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
>   			reg = <1>;
>   			realtek,clkout-disable;
> +			realtek,rxc-ssc-enable;
> +			realtek,sysclk-ssc-enable;
>   			reset-assert-us = <15000>;
>   			reset-deassert-us = <55000>;
>   			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
> @@ -146,6 +148,8 @@ ethphy2: ethernet-phy@1 {
>   			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
>   			reg = <1>;
>   			realtek,clkout-disable;
> +			realtek,rxc-ssc-enable;
> +			realtek,sysclk-ssc-enable;
>   			reset-assert-us = <15000>;
>   			reset-deassert-us = <55000>;
>   			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;

Applied on stm32-next.

Thanks
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
