Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPr3J2Pfr2nkdAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 10:07:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A16B247EE4
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 10:07:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9E2FC8F269;
	Tue, 10 Mar 2026 09:07:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011050.outbound.protection.outlook.com
 [40.107.130.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E011C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 09:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ca3k/ebXFlCc3gPfSk2EHxXJRJ0lSyWqCwYZZMREi/1ZQt7OeZQ5NMR6D4tl3MMINUg0GQ4ivB2u/zv6BS3sdgsxED/10ux6fu5pD2KYaUHaW4LJdIx823/QW/k3gMPuxozOqWitlGnzLc2oFbIah/1duJpLQR153qu9l9PlAnpzuaXw1nRdSNEhsFlybwsCt99ZZ0Y+xKIUu739HFSqi7qNJIP744S0PuBTGQfgvuntofWWhHJZiGFo97HKWY2MwwwL5l9qH04KwmJQrfY8KFiKU9o+icDQ5W3HxoBMZsEXvOTS5U7KxPFandAqsuuRPc9wYM1U3TtvKbhGxzX0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcCUPaPgLXaoZ1TpgYlHX2JIjLC4d4l4GFxl/fClsnw=;
 b=cbEyRJ1XUfp2NBp9qQ9khNoTMc2M76kRvwgp+K8+u0Pm0/7AqXFgWVe8qlgpuD4mznvNWgely/67sYuevVI0KH9gdF146YqYD3Dz9zoyIRDOhWfuKUrRddEbSfF1ZD5YC2kMftYlsaVGVvItzx9TsKLxUCams7uxfNo95ZHEbmDfAj8gyRzB8ZGwoctyqtxSD2Hl2szrKdZblPMaQmxwPJHQhVnrFVXcqCWhIpybE7a47tnn+zqagj9G6PDVX2YLc1ai2X3qM8MA/jk/bQjFvwcw/dCKUkJy9IiHUPScAl5LjL7B5xs6LPp75hEVfjk6RxfCHY7Kl5s63NfQyGTV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcCUPaPgLXaoZ1TpgYlHX2JIjLC4d4l4GFxl/fClsnw=;
 b=M8G5bt2uvxZC48AObfNnpDk27qU3HDmn2vFRdFGTzM6BscGFv4KME/9oD0y9OgL/EM2RKyABhvlmcs6xAm/fxwDc/I0sCS0VEbAwYG3Unktv3TGZdWH9o7LO2B9hofTQh/ZgubzwouIBOAheVJlO7FyGGB/JrbIdyEOvKZfmLKEAWceQmKBArrgJHutRvBXhWTYUq02e4is8VoONK6L1e74XWrjlY4wVys1rxoiJ+SC4Hb/F2iT7CkSW1WUqp1/L6oqLN5skMVoKDbr05E8mo0Nj8fddajgqId7ArOnXbUSLnpZEdX6ZROXDxtIQPGj9j8dpgNB6KJEeDAggPNH/ZA==
Received: from DU7P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::22)
 by AS4PR10MB5870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:515::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 09:07:27 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::3) by DU7P251CA0020.outlook.office365.com
 (2603:10a6:10:551::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:07:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 09:07:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:09:54 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:07:24 +0100
Message-ID: <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
Date: Tue, 10 Mar 2026 10:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
 <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 <cristian.marussi@arm.com>, <jens.wiklander@linaro.org>,
 <etienne.carriere@foss.st.com>, Sudeep Holla <sudeep.holla@kernel.org>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|AS4PR10MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 6551a6f2-f0f9-4506-3ddc-08de7e847365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|921020|13003099007;
X-Microsoft-Antispam-Message-Info: dwNWupVH63cMVFMLW1gR4I84G8MdRzRdvrSZh5M9n2qMWOngTmrLZg2deenntrWDYW30BOHhtHxyZ+o58ako5VuL4HrvY0BXvz44G1u4Z5inNO+MGveQa49muKYfRMeWLlth8ER0qDhP70ISC2/SQmrMG0qSxKzvgmwXOcmBZm+IvBFT0Gaua04I4rPvaNJkCGf8WHEbAvryKFmCbyVmnNKlnPYZKCKLAvECr9Lxip7nW3OeZUmcTfPA3QUjvxFb52pXB+KOhH92xkRGiPD1ri4p4MdtaYDTlFZM9Ui3w3QvGi2rv854MQQ3G/Hf1BxEkHMGrI4KG1cMGa5Qgm+38uBKRKbVNaUYmo6nKg+YRESXjSUmto40HnofdJPLdNEIEAjYn461nsK1H9pgLa7UkTRtqw8h4lv0IMyMr5eR4+4YP7lqU4jMhPBCMXXEfMq35sdwsLpAHDSaE0BLdu+PzPomcjRbJeOD+9uA/kY8e3v9SMZPCqte1vLC9S7pC/FQtpJc9fCDbxi5K7+uz5RSMKz8mTdveBrL/I/ox/iStrAJbJHgoi7ygiI+5vHxzyck2I85uHzsz3zobKjX7xe5hEszDlIuWCsDUy2ZHibefiTMq83Z7lgiaY7DOrvn5WygW7HcGJyS7iwcGzssQe72uiErVHGLe78ZwN4rMx20D5x7ksdBhCSzaeHnGzm5c93hCYtjuNRjwMc8rrIaAwkcSoylE3GgBLzVsPQ+eFHadsWlTsBfyeSte5sl0/ZbucM0ce2Spl1uYjw7LZjUkvk1Lw==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jWmY/rsYQ83gb2tzCrLhepHY+t1hQUyn1Wpw2DsZeyWuT1/HZEP4bIXrOnwFJ5A8zIjNaZhI+vfG1y7FSxd69OOco8ToY7/ZHMI3MbKZkYuIUUvpEuRA9/C+ZhKqECJlkd1H7xtIYYwRDOqO2NHLny50Lfr60u1wU2Io8JhcP3hbXgOMIrfOCT4Bh6TMRyidcQYadNHe3HxYASOCFJUHxfgYvNb6HYMcjbBF6SmM843z9k5afsaWMpI/DYT99H1V8Tliyj/Ic9WL1ZkjbuD9tJT0eoOr3tgLOYpFQHsHMlqWB2cVzHwIc9RzCARkwgLFxETRyAo/R7E0tewMse1EjhTgpkSnBgE34e3vlcyjcT5j6Lolge1xUrnZ6i/lWO94x3ausRA7c2rwE9p/YI6e0qHr07Yk2ryYB26xlpokqcpLA0XNVkbp+Ndz9fdZ0lbJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:07:26.8938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6551a6f2-f0f9-4506-3ddc-08de7e847365
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5870
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 00/12] bus: add stm32 debug bus and
 coresight support for stm32mp1x platforms
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
X-Rspamd-Queue-Id: 3A16B247EE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[foss.st.com,arm.com,linaro.org,kernel.org,linux.dev,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi

On 2/26/26 11:30, Gatien Chevallier wrote:
> Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
> can monitor the activity of the cores. Because of that, they can be
> used only if some features in the debug configuration are enabled.
> Else, errors or firewall exceptions can be observed. Similarly to
> the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
> debug-related peripherals access can be assessed at bus level to
> prevent these issues from happening.
> 
> The debug configuration can only be accessed by the secure world.
> That means that a service must be implemented in the secure world for
> the kernel to check the firewall configuration. On OpenSTLinux, it is
> done through a Debug access PTA in OP-TEE [1].
> To represent the debug peripherals present on a dedicated debug bus,
> create a debug bus node in the device tree and the associated driver
> that will interact with this PTA.
> 
> [1]: https://github.com/OP-TEE/optee_os/pull/7673
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in v6:
> - Fix use of platform_driver_register() in probe of the stm32 debug bus
>    (unusable since dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()"))
> - Added all review tags
> - Link to v5: https://lore.kernel.org/r/20260123-debug_bus-v5-0-90b670844241@foss.st.com
> 

...

> 
> ---
> Gatien Chevallier (12):
>        dt-bindings: document access-controllers property for coresight peripherals
>        dt-bindings: pinctrl: document access-controllers property for stm32 HDP
>        dt-bindings: bus: document the stm32 debug bus
>        bus: stm32_firewall: allow check on different firewall controllers
>        bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
>        drivers: bus: add the stm32 debug bus driver
>        arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
>        arm: dts: stm32: enable the debug bus on stm32mp1x boards
>        arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
>        arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
>        arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
>        pinctrl: stm32: add firewall checks before probing the HDP driver
> 

Patch 1 to 11 applied on stm32-next. Linus, let me know if I take the 
pinctrl one or you prefer to take it.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
