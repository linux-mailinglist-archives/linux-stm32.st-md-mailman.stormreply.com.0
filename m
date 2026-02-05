Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIv9LaOdhGmI3wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 14:39:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55485F364F
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 14:39:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F205BC3F944;
	Thu,  5 Feb 2026 13:39:46 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013063.outbound.protection.outlook.com
 [52.101.83.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10E9EC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 13:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX5qGLn4AxAYbbgDjS6R8Avr8MdpH/vFCbB/Ntsjtc16dvPka8i81zx2S2zGyohaj0tm00Z5jJvuOShz5au7HbF+rUp4CWRMI9iZvBlPd4PsIpwlcze7Uh50cfOJIBolY0Mjhz/QTIGOnnU+JtGlpC8GhdNlYLxbtiSetNV7vLjQ+BzJEmObSqLye0g0P8mOv1nF8TQ+sR9s3uLBadQ+ZLH3WtShUBurLpViwcVUW5ne90//Vhzr5iRnJXlkCPB9kxj8Mo12L5hgvglkOvMAu/dqaEQ+esHKzOgdhech87IkPpie0Y2oqhSkTCo80cBvQXvhOw0ulZJ+4pwwSNRa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=388WzPcc1qexD/0AEeyI3mTDP+gdBLVPlhckg9V1mn0=;
 b=gzGDTrAenM1DdprdgVFJMukmKwtTd/g7yzmaPBxdNbQmyQPR7sDj0WujH5kvx1RkMi7TQ+KjPbVe927fSglsM3OtvGvrXRfFlstHCEVtjYGxXPh9OcI+wsVQYax8lEqvZuASKaydu0DlyhEv7CaPqlLGlXwENDzrGmV2IAZPj9OSzyDN/Y3hDiJORLTO7ksBhiPrkSnRKBarnG6gHlKgcWsLNcqKBBeoAS69uJ4nzGF7O8Yy8nOujCn5RiXSb/84gz5wW64oEM71Wg48WG5i+NtgWNx35horfRl45n8SZGt/MS1qBni9aXBUceioERBsEdA+h+SDccrzRFYT9X7uwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=388WzPcc1qexD/0AEeyI3mTDP+gdBLVPlhckg9V1mn0=;
 b=IPpZlLhANU9bhGXDMtK4WOH7H/fciTpv45dl3w5xwbeI8m85nKYs9oc4epusjPijIFYgXmgUKee4z/X82TTUiRUgd9jmX3GSOh1voYaCfIhA0ZA3J4vvAWhMM82Yft+uvn4IUeQ2BP0iXh1Dxo39Ag7TGFNBGQA10Thq6rsH36C8Z5cd7PpC8m0LaKTKvN4n48elSXN+qRLz9bGHXV9uCAvtif3dTDyhxVi7Wn3/NziMb6VqzFyRGBEnfsofcEguvGwB0eMkSE3apKMVtUZEx1XQKbl18LcndG0oY+JIYNMShkLPkJhzzVxN79F5252LjiaRiRIV8cKFyNjkGYiIYQ==
Received: from AM6PR10CA0050.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::27)
 by DB5PR10MB9737.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:651::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 13:39:43 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::e9) by AM6PR10CA0050.outlook.office365.com
 (2603:10a6:209:80::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Thu,
 5 Feb 2026 13:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:39:42 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:41:22 +0100
Received: from localhost (10.252.13.241) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:39:42 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 5 Feb 2026 14:39:39 +0100
Message-ID: <20260205-master-v1-0-fe6399aa3aab@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJudhGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNT3dzE4pLUIl0LQ0sTA1PL1CQzEzMloOKCotS0zAqwQdGxtbUADiy
 h1VgAAAA=
X-Change-ID: 20260205-master-8194059eb646
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.13.241]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|DB5PR10MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: deeb6cfc-86d9-44b9-94f8-08de64bc04b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emRPK3VSOFVUeElhbzhERnVYN3BtMkJCRUtyRzExMnZNd3JUS3dqWVVPYUo5?=
 =?utf-8?B?Z0tFSjdDWnhzMC9EQlhWVitJLzFKaUVheURxdldhakVHQ0Vvck5ZTHQ4ZlJU?=
 =?utf-8?B?RFJWeHQyb0hvRTdoYjlQODBQb0FKSDJUVEtXZ3VRaHhKeE5rUm1FRFFwWndZ?=
 =?utf-8?B?bTljckpFSlZYamxRZ1NIRUsvalJvU1BGVDVlOWkveUVpMjB6WWYwWmR3YlRj?=
 =?utf-8?B?RlBhV1BoeEJRMTNqZ2JvZHhCVW1DcEtrazF1eFFxeGtnTzRjNG9wbkF5WCtK?=
 =?utf-8?B?VmxuRjVZSE1BRnpoWEs4c3BHTG1qRWloVWFIU21vdUZQTXdCemJRaG1ncDhS?=
 =?utf-8?B?NU82ejZiMFJROCtVUlcreG9ITEtmLzU5aGMvcjdjZXpNVnJIVkVsQkRyWXBO?=
 =?utf-8?B?VGVGZThWdkFHdXd0dWhsaU5DNXB5NmErVlRDcjhLNVFMcnBBcGc3VVM0N003?=
 =?utf-8?B?ZEJQeUVhQ0JiaG8rYzdCZUtWY25NUUkyRmR1K2Fmd1ppKzlYWnNETzQ0bmhZ?=
 =?utf-8?B?aTFzZFZ4a0t0ejBOWEN5MTQ0MEwzZW5jaHRHdWJROUNKendkalhTMUJSK3Qy?=
 =?utf-8?B?UXJyU3hOV0RNOXRtVTBLYUd1M2pEc0JKWVlGQ1RqaUpnSnh4NUdVYW9tUzVU?=
 =?utf-8?B?UHFueFRXVW5WVXpiYmJXaXJ2ZHdrVE9UWXZDcjFmU0g0bGJrV3VCemFlTk1w?=
 =?utf-8?B?b3NmcElJOWk4cTBGUXVSa1lSdHl1RE0yMjRjaENQdzltR1NVTWNsRlAyc1ln?=
 =?utf-8?B?WGFkTzdGUk5RalJRbmwxbEhjMUNtdm5IWmF3QU5TT2J1QnhwckIrUGQyaFh0?=
 =?utf-8?B?MXVoblhDQnZZd1ZSUTdWWER0NUI1aUpPSStjOEcrRm54bWp6RFc5NXpSQmRu?=
 =?utf-8?B?Sm51MHAzWFZjQ3Uxb3p1SSs2NEtCU2EyNktlNjJLNzdhSFArSEFQbGRpeVQ4?=
 =?utf-8?B?N1haWEd3ai8zb3pDNG5PTzBqdGlTUXR5S1BvOEMwR1BsUW5sOU01OHRjWHZW?=
 =?utf-8?B?eWdkN2I3TVY3RnJJZlFzL0ZVeXNHQWR4VFVMRGJ5cE85N0lxNE9KSk1LcjBH?=
 =?utf-8?B?K2VhN0Rwc2ZDWVlsemp5VmtuUEorSHhIYzJ2TFlzalc1amNpU0lsT3pXVTdl?=
 =?utf-8?B?T2dCOVpqdUZFWWhGdlRqZi8wamMzYXoreDhnNWxnR0dOdjB4M2g2eVlvK2tE?=
 =?utf-8?B?N2RhaUcxMmtOb2VsTmNKZkFNMVNSMGRVVlpWOS8xM1pOcDY1ZmRqdlgzRmNW?=
 =?utf-8?B?RnY0MjF4UEhlLzFSaXVpbkpRTE9VYTB6ZjJadm9tWTdkUjE2VnNYN3hBa0Jr?=
 =?utf-8?B?UkZjelJuMEpzK0VtSXFzTWhadCtWRW4zWWVFR2lBcnoyeHVsZHROd2dyc1Nt?=
 =?utf-8?B?ZjhsaHFLdENIQU80b2NzZ0JKVXpoNDZyN0J3ZjlVTm5YekgzY2cxcGpCcGNX?=
 =?utf-8?B?UmxUbEdzM2QxeHY0Mytra0pOM1hPaDF0Q3M3UHo5eEx5RzRrbkVkdStoMTZh?=
 =?utf-8?B?UVpXaWtZYVp1dTRMUGNmb0RWN21HQmpkUU1abWUrMG5FbWU0V1BVYmorSlFx?=
 =?utf-8?B?cURiTUxyK0NmUWtvZUZPT0ZOTmc0NmRudEJYRW1yWTkvMTF0eUZUQXI4SGVD?=
 =?utf-8?B?YlRxMFVUV0J1T1hhUnQ0RkprK2paaWVVWnE2THJhRUJsZmF3d3VwVU12SjdX?=
 =?utf-8?B?THg4TndIY0hHUzl3Y0ZrR1NZSjAwRkI4YnNYNkNJS3JWYlpmTngzNUprMGhY?=
 =?utf-8?B?K0RxcWdvem5tZDlWUlRCMjFUd2VCdjdVc2dsNWhaUXlXQW5yMDllWDhEOVJk?=
 =?utf-8?B?bFZmUUV6akZYa05XWlB0QnJOajdZd093UXFqMi9ma0JqSmFwMEtPSVRkY2Z5?=
 =?utf-8?B?VG1oYzFwQm5CL0RpM3U4R2k2UGxUK3E1THgrZUtqeGVxMnhDR1ZiRXJjUWVQ?=
 =?utf-8?B?WXlBdTZBZC9wNUVPS0JFWDFhSHRyNUdseTdLWm1VY3d2VmhLRDZBK2x3dTFH?=
 =?utf-8?B?WmszNnlBbzAvZVdXMmM2SFF0UGJ3K1lwanBrcHh3NFlGVWwrL1h1YVFjNDhu?=
 =?utf-8?B?TGNxUnkwR21FNmRXaFYyeGQxd1dxRzJOdGZKeE9DVlpLcStwSXp3SGVCeG9F?=
 =?utf-8?B?VjVROEo2R2RrT3kxaXp5K2VhZmNQUm9UR2IzYjZtV0lYc1JDaUpYa3BhS1Zz?=
 =?utf-8?B?MGlENVZMeFRFNUlwNG94RU1lTkxSQXRDTEN0aTRKRExKS2FwUkRzRG5LTW5S?=
 =?utf-8?B?V3VablU3OE5Mb3hzaGJKampSUW9nPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ubELgBQRjT4T4QLAddnuUFyizDIvaRQW/MURA9ImNUay9CoCm6NMX4cw9enQv3aGZVXFg0mGtoDi745c0peG1GqkZYAtoxinvy0zGrl/Ld1nx70tBB/P9INUshRZN9Rvgq4HsnTLmH7HVGi2VVQ6gKSgua3r79d0dG2nqL2SMjbZLorZ1T63+9B7SD9SLZ2LFlLtX2Kvc5LWfgi7CK2drlS3UqPBIorGTXcoCY1sGsLNGFcE7cwCl0SsJQHWp4eRVgft06XE81cFcAsYd1B4wJZj6fGKy+CWfVI2WcO0Hlw5La1PMdDkwz3oaWMJaSG4v8gkQhgHM+R9Xk3kD6HOVzmER1sJ8AGOo/Sdel1lIaj84ASw+V89r2NdiK2UaOUVkd3DZBmpXu+yQRTVuA+A+/CMkr225uEZF32llgMYIp1UbNf0i97Um24nBi6kY9Py
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:39:42.7544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deeb6cfc-86d9-44b9-94f8-08de64bc04b0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB9737
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] Enable display support for STM32MP257F-DK
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:yannick.fertre@foss.st.com,m:linux-kernel@vger.kernel.org,m:rgallaispou@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55485F364F
X-Rspamd-Action: no action

This series aims to add and enable sufficient LVDS display support for
STM32MP257F-DK board.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Raphael Gallais-Pou (3):
      arm64: dts: st: add i2c2 pins for stm32mp25
      arm64: dts: st: describe power supplies for stm32mp257f-dk board
      arm64: dts: st: enable display support on stm32mp257f-dk board

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  17 ++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 118 ++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)
---
base-commit: f14faaf3a1fb3b9e4cf2e56269711fb85fba9458
change-id: 20260205-master-8194059eb646

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
