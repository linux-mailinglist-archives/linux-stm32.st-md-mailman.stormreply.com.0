Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA6lN5MCi2kOPQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:04:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17911958D
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:04:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 236DAC87EC8;
	Tue, 10 Feb 2026 10:04:03 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82ED7C87EC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 10:04:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9zHhMAdskk435ocIHzgQduN7KPjbM/AzyHOUNa9lzJqWOKNK4IGKKQqarhLor08Dd/H+tDsKDtDl+V9UHzhdx00A0qvDx1Lni5C6cg663TZuNz3kthSDcfSO6nZ1J7m+uLPLodCdAvCEeVMYOpb1dybVNFauHv5Rp6nvoF1AYKMCsLYfSAsuxd3jM8UOQ2nZkgwJJwmslugV8MfL28pJNQ+vyjtBLzyUoX5nXcU7OtkFEgcOUuyQZbOzCSQ4FJhOPlib1akaoDP617+ekg+7aI0VEGDrlwsEjbyQOib3KKqunu230R7QcaNWKzBTe9/gDAH0YglvW4rB7oUOwevOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQJ7lOMjfw5XVHlrxfQbD3fwFUv0tNC+ive2izVVosA=;
 b=I+jm7b9Ix3rq07Wpo8p0Y3P958vG33gsW0O+WYvk7ct2Nl+KmxG5cmd4p0HMb52O/QQvicLgtMHxWbaeTzOZ0oEismSCaHOUmQwZoJvR/HLkVsTPcl9pQe8wBDOPjcnrL8e4bhRjakx30Gnl36AJedqcIXGtlM7zgq0JI+mLqSoTFWXf/orJFJp4D3xLZ4/X1cHoM5BuQUQpk3z+dOtowFRG4SAwjY5pLX9bFuL9Nh4D30qxLD2qTfZBtRcpViTzMnut+vhPY5YwRqR6kHgSGYR53WU76ZNbka/D9c+UDr9rwPn+Wp/c+jPxxBWF9V3l4gSA/2zXirq/Tu3bs1+tZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQJ7lOMjfw5XVHlrxfQbD3fwFUv0tNC+ive2izVVosA=;
 b=cV8onsL/5fsr2KvY400G45jM2wNrxeYLSxQQHTHu9Ud8Iob86nJws95QTP/F2753LrwwhvGVWA0oG0Vwp4yLfUHkUHI1X2NjQtmgCaCbVY7UthJNhm96Oh1SgchaDbUu8sv4GXD4C+Mr6fIUNY+uA4X7MQqMxkBpYadPoFRhjBQq03EpoiUnZ10UAMxxnpyslkMaAyunC5+7hbG2RTEBvikfDm9DEzc8fhZZcXPlwSsFyZh1SwmBzcF91dk76Mdc8Xj264UA2jYVdW+SnPYpDCqj2ep9XjedBtyGaPM5yxyga6Kry+uI0tu+aFvc5duiU5F3NukB7ELurm+YSDrbbQ==
Received: from AS9PR06CA0177.eurprd06.prod.outlook.com (2603:10a6:20b:45c::34)
 by DB8PR10MB3548.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:142::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Tue, 10 Feb
 2026 10:03:59 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::94) by AS9PR06CA0177.outlook.office365.com
 (2603:10a6:20b:45c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 10:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:59 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:36 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:54 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:03:57 +0100
MIME-Version: 1.0
Message-ID: <20260210-display-v2-4-0592bd514958@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70D:EE_|DB8PR10MB3548:EE_
X-MS-Office365-Filtering-Correlation-Id: ae05cf68-e9c8-40c3-cd99-08de688bb5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWtXS0wvcVFNbGxmMTQxNFZwcGUwTEZVL043dWh5dmVJcmdIQjR4ZVJYdmRr?=
 =?utf-8?B?VXNKYkp2VTA3ZEJnRFYyMGxVbTlCM3FOdkxsQk13aFpHaE9sZi9rUHVoaU1S?=
 =?utf-8?B?azA5am9EK0p1bU1uUTlSMXljVjhVQzBXZ24vSGJtb2IzRFFaS0Y0QUxLc0FC?=
 =?utf-8?B?cnB3M0dpblVBQm5lZGN4Zm83SVcxSmF1alFCSGVmRkRzd2VoK0ltejhFcHdj?=
 =?utf-8?B?UGY4RW1PT2N0YjlEVWs0ZW5DaTZ6dnZ6NXZWNEpHOXV1d2Z1RUxnM0M3Uzlh?=
 =?utf-8?B?WGIvQXprelN6T2FnckV3UjBDeUliUnA5V3NhS3BsODBlOWkxZjJPUFVnbHdt?=
 =?utf-8?B?S0s3cGdpcDJycGNjbWNSaWlUMmJGemo0TE1mMmZSdzlTdnlPa0sxM0g2VC95?=
 =?utf-8?B?ZjJTQnB5Z1JpWXp5Z1NxZGlYMHpDeXVJUngyL1l6OUNlMFJkdDBFSUdpTlh3?=
 =?utf-8?B?TTRybjlTNHBJYmswUzZndndKOGt5TGcrcTZwY1ZueGZ5dVdRZWtYYzA2eUd0?=
 =?utf-8?B?dmpkNXVpa2Z5NVlrVXltK2JIcGZxRWVvRDVqRmhVUytidmxHZlFWbmdLYStt?=
 =?utf-8?B?cXF1MTI4ZDQ5VVdUWHpTOFBPQnR4S0tYYUQxalEvdjZyNlRidEV6eHd5N1Jz?=
 =?utf-8?B?NWx6WWF5ZER4THF6SmFyc0ZTSVVrSkoyOThSZ3JVUnllSTdGbk9NbnVZRWR5?=
 =?utf-8?B?Z2x4bTNvVjM3VTRUaXVzTnNmRGxCQndOaml1enFKcGtvRU91QVg5VGJGWHB1?=
 =?utf-8?B?K3FKVmo5blpEUlM1QWRsOWFIYmRBVDZGbjVtb1Vvd1F0eHRDR3ZlbTlzSGI3?=
 =?utf-8?B?NkM2aEF3V3o1anArTEZPakp5LzBxQ3o2RHkrbmZzMGZwVjd2NjR1NzRCalpl?=
 =?utf-8?B?My85dWo0eWhSMm0xcEZwZi81aUxwVWpTdkg4emlKajllbllJcEJYWkFKQzgz?=
 =?utf-8?B?UDFVdEI2ZHMyUWV1eG9jL1ErcHpHVFgyd25FZlFISkt6OUFTYjE3K3lXVEJi?=
 =?utf-8?B?Y2JuUk53eDl1UVFOTDdyY0lwSkxTTnZ0QzBseUZXalNWQVAyUWo0N1RBcjl2?=
 =?utf-8?B?aHVVcmFsQnQvbE05d2hGeVg4WGt1RXhIQ1dGQThsRTdLRlRVQzZ4ZThTNDc2?=
 =?utf-8?B?d21Da2tjWDVlR0h3OHVNaHlJdndoaUNmWVlEdnRKTm5MNk1IQlo5alNRczBa?=
 =?utf-8?B?NHpZS3NZdU8wM1oxS2lwdlNyK0V6SVkxVHVOZnJCQkdtUUV1M1dFVHRXL2xO?=
 =?utf-8?B?bGdnZEliWmlFcG9ZbXdXVy9PZkpVbmdHM2dIay9EclA2eUdIVTFZYzBKd0VN?=
 =?utf-8?B?ZExIbDRZZVVORlk2cTRXM1dISDk5TDhLdkE2UkxFMk1MRTRRVlUzUkg0QmVt?=
 =?utf-8?B?RzB6enV2U2ZvUVpyWGlQT1hpSEtUejFWcVB6L2pQRXUxV2s0VnYxYTJOcVdp?=
 =?utf-8?B?TENuYjJ6UEZIU0NsVzI1RFR5amljc0FWWlRzTGxDUHZGUWJMNGQwZTdjdHJ4?=
 =?utf-8?B?cm9ObDlra1N6YlQ3T3YxK2ZVM1pkSHRzeWFYWlhMaE84SVpQN05rb3kxK3NS?=
 =?utf-8?B?TldtSG9ScFExbXI2TExyeXdEeHJGZ3JPSTE0UTRGOFJ3VmtlVzFzZWtZREU0?=
 =?utf-8?B?VFJlSFlWU0pLQjhySngxT1pVL2cvL3R5dW9IcTVzY1hMcnpLQUczQUg4eGtF?=
 =?utf-8?B?UDB6L3V5NUh3ZVhkbmcweXl5Y1lnaGlZL3FMNGZsZ1NDNUV0am44Uyt5SEJG?=
 =?utf-8?B?WXMySE8wV1d6R2JiU3NKRlFnU0M3S2RvQ2tHbms3NjRmaG5ER3VTWGxRYm1R?=
 =?utf-8?B?dXBJSDZRT29GbzZIWnJBK29EditZR0xHeDgrWGd2SVBvYWUwSkxqK1hlQlYr?=
 =?utf-8?B?L1RQQTQyZkVZajFQdXlSM3dtOElCUUNQbncxTlIyMllOOEpTMGR1QzB4cDhZ?=
 =?utf-8?B?eXhnYzV5ZTBlUVN2b1pQYlBsNklnZTZUN1JteEltV1BFNUw4MnpkU0xrZDNS?=
 =?utf-8?B?ZU54VWdxV1JqN2RpWXJlTkdnQUJPeUlhUnFVeDZZLzV2VlQraTRaaEt4Y3JL?=
 =?utf-8?B?WVplMjhkK253TGI4bEJnMVFIaE9oeUtsdWZqM3NaS05GZTJZaWVHUVZZT2xv?=
 =?utf-8?B?MjA3dDRQODZMV1FqSnhHU2krQjZKSUp6bWdSbVd4QjRxM0FRcEV5d3ljUjNz?=
 =?utf-8?B?ckFoZ1NvTFVVc0lSc0VZeEZMQ2VKdXp5a0xjbkh4c1NZUGkrTzR5bU9TUXFL?=
 =?utf-8?B?bjZiSTZJRnBGUDRKUlNCTHkrZ3FnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MxOP8yrJ8OXPWA0v/BZGEv4RS0fNw/tfCcbkjuJTweDMZyPkXfXSvDuoi4hB+iNG55zKr3XGJgFOlHPKp6rygzcVsbBqzT+OlmZVNuUojiTcBhpgia/NAXVc6S4U298+597B9OgRAfVYnil1vDMg+gYAoHDFVV3zJQYAN5Z0nTkZ7GuVn3zE7Chr5rjCeVacsk7+7PmzgK4h26PXm2DOq33cCJFa6zMWyB2ojOfCcgDtf69zwwCnJP9mYipWtmYQGu1suPSpXyt9nj9/zMPAZa0ZKAe3cabBn6I49NDn6bO/Ij71KCti1HSSrkZdVYJLyN1Mftflkz8j9Np6LCqHtwNHKJHSk9OZpf8RXc2rFLIZNPiDdxwEErDSZ+kfTCjHxXEFLPlInKEA7401+DeaJO6KaN442U9vzLhhReeLVM4JfyidkX8GavrQYNnqT2v2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:59.4327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae05cf68-e9c8-40c3-cd99-08de688bb5ed
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3548
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/9] arm64: dts: st: add lvds support on
	stm32mp235
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:christophe.roullier@foss.st.com,m:devicetree@vger.kernel.org,m:yannick.fertre@foss.st.com,m:linux-kernel@vger.kernel.org,m:rgallaispou@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,2.221.86.96:email];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F17911958D
X-Rspamd-Action: no action

The LVDS is used on STM32MP2 as a display interface.

Add the LVDS node.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235.dtsi b/arch/arm64/boot/dts/st/stm32mp235.dtsi
index ae98f503529f0a2473f250b4d9195820135ee1bc..7a87c344a4fe3c5c6af154721d4229eb330d4cb8 100644
--- a/arch/arm64/boot/dts/st/stm32mp235.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp235.dtsi
@@ -12,6 +12,18 @@ &ltdc {
 };
 
 &rifsc {
+	lvds: lvds@48060000 {
+		compatible = "st,stm32mp255-lvds", "st,stm32mp25-lvds";
+		reg = <0x48060000 0x2000>;
+		#clock-cells = <0>;
+		clocks = <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
+		clock-names = "pclk", "ref";
+		resets = <&rcc LVDS_R>;
+		access-controllers = <&rifsc 84>;
+		power-domains = <&cluster_pd>;
+		status = "disabled";
+	};
+
 	vdec: vdec@480d0000 {
 		compatible = "st,stm32mp25-vdec";
 		reg = <0x480d0000 0x3c8>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
