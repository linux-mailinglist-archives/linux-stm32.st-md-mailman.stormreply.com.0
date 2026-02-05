Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COFVG6edhGmI3wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 14:39:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960EF365D
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 14:39:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13A21C3F944;
	Thu,  5 Feb 2026 13:39:51 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013001.outbound.protection.outlook.com [52.101.72.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47935C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 13:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCQTWHeacSayGk8gPKefeY/3Jz3SmvpMqyULTVyIlh/xO0y+ChiumXy4hrKsUDq5jooMAbr1JIcz7Kl9dV/AtN6z+AFQeHHybqRhS9odRQRW92QuSuEfflTK+2J3MjazYXgBQ9JlWwbic9f61fiC50+HIIWjNf4AYStWpZwfIMeovxIjDIVpWHJV9JJ3Nku2faj3ftV4y0NL/hnbB8uwu2k982c+H838GoaEkukn7Q+ujlqU8J0619xlPufGJaCIJFoeyB9VGuUZhq/yxWfV4DPlrBRmFv13C+DgfBHQyfZvqDdHOBE4NAFmObHJJq7TK2CKJhlj81Oqig5ITHl8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IkIWeurHhJd8jxOfDznSUhFJ93l82pViRpCPhjsErM=;
 b=DlqRtqb7gqwcOAkOVipHT99Yz8L24obUkZKg/HWniR8hjUX6CBqM0MoiCEE/xCz/WAjLO6RiGTqSljD2K1JXkM7iK3sDozyteRb1c2SzzVD6fgSDo/VQgfs5mHTfjc+k4GfPMLi7a6bMiogGlsmmrxWtaTx0vSfwlXn2i9DRYvKuypLR7erGDTnKcU003qFVzZCELvhWmc+dxbuHZX1Kp/vsTxBKxfeTbzEpZQpgNhwZJsnBaDO/gXB08nc/slo70+OBGWbNGWs7s+io9QN9uaobRbfgdO0hsriM/XXNIlou3IND/pw/k3qQrGrObJBpln+1up83b6U+Q46WiVavwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IkIWeurHhJd8jxOfDznSUhFJ93l82pViRpCPhjsErM=;
 b=A5S2o66QymE6ckc0Ddyv0HDkX6hYO3QxuRIyAVOfyUqtjHwU2U9mA23I81jHK/idaNzcF0lfARo058kg1Dp8X7RnsoepaRIzJdKKzNE8c8u1/yCGbcz/skdaSeXb45jxgrIaZXH61O2+f1De+Z0jIkN/tTkZQh9ycdnhmof7Sk9YS+ij+tfX9+Iu3wwAgGPEmjgpNZwK6seJyeHPqTfGQLEO4Q0hZPybWROdYj7zKLr7RxXdnCMaBFsvHRrjQtAfFU3GM6DgTcQjAOeJJAhJl9mToIZ2AL1ZMwScStXg+FF9IOvxRdqjLA+9xXLUjVIzHlfeA9U0gW7j4v+ZnypO0A==
Received: from DB3PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:8:1::44) by
 VI0PR10MB9741.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:33f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Thu, 5 Feb 2026 13:39:44 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::9d) by DB3PR06CA0031.outlook.office365.com
 (2603:10a6:8:1::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Thu,
 5 Feb 2026 13:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 13:39:43 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:41:31 +0100
Received: from localhost (10.252.13.241) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 14:39:43 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 5 Feb 2026 14:39:40 +0100
MIME-Version: 1.0
Message-ID: <20260205-master-v1-1-fe6399aa3aab@foss.st.com>
References: <20260205-master-v1-0-fe6399aa3aab@foss.st.com>
In-Reply-To: <20260205-master-v1-0-fe6399aa3aab@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.13.241]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|VI0PR10MB9741:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf399db-ab47-4e06-c611-08de64bc055d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDhwUjNiN1k0SjROSzVpZXYvMmIwQTgwcEdHWmdmb1ljZWRpeDZ2dHZ2MzJk?=
 =?utf-8?B?Z2YxRXdCUzVTMzBaSEd1K3MxTzZKcDlyU3dSU2RlakJQOFNpRDljQjkyandM?=
 =?utf-8?B?bTRNMnpuNVBYaUZnamhpQVEvMVVsbi94SVdtdUlJbWdOODN6LzNFLzhQeXJn?=
 =?utf-8?B?OUI1d0ZiSkxlUGJQYnpONytuaXBIOG0rcVhHcm9vL2Y2TWwyVTNQTjBuTVFr?=
 =?utf-8?B?emtaMWsvR1B4dDhaTVUwUFhHYW9KQnpSQlZJcDBkK09GQkVuUGJTa21FcWhu?=
 =?utf-8?B?dFJvRzEzWHZUNVIyY1Y1UjlsRFJtR05vQmZTNEw2NFZIemw3eXFRVElMQm5I?=
 =?utf-8?B?OXFYRm9LMkx3YTFFSlJPVjA1T29zRnhwODcwdFpNY253a1FhQXY5VXFTZEtR?=
 =?utf-8?B?d0pkdzRKT3JxejFTUHlkN2lDN0lyOC9VUnQ0cGROcjd0amtxSGRZT1g0aDkx?=
 =?utf-8?B?UnF5OVI1T2h0N2xBR2pNSk9YTkw2Q0RtVkEvaVNoazNQeE1KVW5lRU85c2Ez?=
 =?utf-8?B?WUU3NnVVVEZpTWtSMm93V0NOeXJuM00xWDVYcHBKUEJyVHFKRkJ3bUdNRDho?=
 =?utf-8?B?RjdYT0g3cFJXY1VzZGk0VVp2Q05Ha0hhVngwR0lRaTd4R3lMbjE1SW5HekNG?=
 =?utf-8?B?V0pqVFEvTUNhbHhQK2t6dENoNzdTQlBZN3hJS2hWdngwK2U2YWxLUnlwdnFo?=
 =?utf-8?B?NHo2L3hSUHlFdzdsUVFBcVduNTlXSWkvUHB1QXkvc0VPRlpvZjdia1hUMXVj?=
 =?utf-8?B?eStsei81emFvL2JndER6ekgyelB3ZVF2a3hvRWhpbVVLWHU4VkdBRFdGaWw1?=
 =?utf-8?B?MUlVQ2pLMW5jR282T28zbXJrZ21nekdvVlA1RURxeGo4VzFocW1DVEsrb1FK?=
 =?utf-8?B?L09PQkdFUFNZc3A2anlQVXUvK2tnUUJSUVh3VVBWSmg3RVVsOUt1YTFYVjJp?=
 =?utf-8?B?R0p6SHA3NUFSSWhGUVBNWlpUVThYeFBucDVwNG5XZGJnZ2hSZ3p1cUcxam5t?=
 =?utf-8?B?eDhra3dKdXpQNUdwODJRbnBsYWYzTStIZlZ6OUt4UFNHcUIzYW9tNEZJK1Vi?=
 =?utf-8?B?YTdRVkpFb2V6Q3pNd3QyZFRpeEtXUWw3UVBYL2xlNWx6VnNjUWlyV2g4SzJI?=
 =?utf-8?B?ODVZM21YSHpwODkxZ016VFljcVYrS3VVMTNlZHhxdU5Mak8zMm5aWlhLSTdO?=
 =?utf-8?B?UmNsdXNBeXo3d1ZtdGdGUEFMa3F0ZVJzUnpyTzMzcGZWU1BjbEdGTkJ5MzBY?=
 =?utf-8?B?VzlpUWtETmUzS0NLOHAreC90cmR0aUZWMndLc3hqZEtDQmEzeFI0K0o5a0Vj?=
 =?utf-8?B?aW9MYlYxSzhUNnpiNTg1aDl2QzZ0ZGpFTzdMcVRrM0x1eTF3cDdNT2szLzB3?=
 =?utf-8?B?cHZ2UGJXUjNzc0ROSkFXbUh2eEovUHZYQ21xNWowckNaSXYwZ2dLQnpVRFJo?=
 =?utf-8?B?dGhvQ3pHZko2bWpDc2ZtKzd3aVk2eXoyb1NYaHA1Ym1aTWtaY3E0cVFxcGRV?=
 =?utf-8?B?UThLTzdxZGhid0VhL2hmWjZvSkhVNzZpUE5Rb1ZZSUFTUEk5ejNKMWxyR0lP?=
 =?utf-8?B?M002Sm5sQTlKeFUwam02b3dxVE1RT1lJNHJsMVo3Z3JRNUtxbEhoR2NNb3lj?=
 =?utf-8?B?Q2F1SmhVTFJVek9WK2JsSVhrSHNjaUZWajVCUFpleEtaZWRFWjNDQksxdGxH?=
 =?utf-8?B?eXdGOWppenVVZ1phR2ZvQUFBNHRrem56VmZtUzJHem1hbXQvb0sxZ0x2T1V1?=
 =?utf-8?B?bTFYNW9iVlV5d011elczU1A1Vk94YVJMZ1A3MmYwK0s4c3MxRHMzVVZFOE9k?=
 =?utf-8?B?bkxaQmhjOWo3Vk5vSis2ckR5MWlyYkpGalNFeUtpNktmUHNOT3lCT3NJSVh4?=
 =?utf-8?B?OXRUTG03UXJuNGtjSXFhTjRzQThEc2ozcEQ4dFg4dHJudWN6VkE5MkxuSmhn?=
 =?utf-8?B?bXRHS1k1TDN0OHd2eEplWkVNdEUxQldJZzJPRjlYYkFVcE1OTHBkVFJqL0s1?=
 =?utf-8?B?VzJqRGI5NUNLNnlSOTVvMXJ5a1BxcU51dG9QOXJGVk84Rnp2VnNyM05jcEVv?=
 =?utf-8?B?TUVzOEVrcmFCaExsQXdudU5SOWNPZnA5WVpjUVpqWGowTU9JbU9FZVN0Qmp5?=
 =?utf-8?B?TFR5RTlpZ1NmM2dOZ3RsR25wbnZQWklEK3VhcjY5MXZWRnk4Mjl1YXBlUzRR?=
 =?utf-8?B?WlFicUh5MVU4VkswQnV6Zm52V2p2Z0RTMGtCQ2ZCdXRmQlNDNkdBZEJLY3Jj?=
 =?utf-8?B?b0lmUGtCU0lyMTNxeEVEYm51eXV3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7W3AYgypQRQCzxJFiw5N8uo6eyfR/Nx11hnhvb/6N0W67JlE/FSJpZfBjHHxPV9itQxvxV7MbW6lxKwjOtlurgGfm6kpiVHdXzNN9nTitLBnvioMpfT5UNAvOaaqYSBsJq4DHWCSu6JIyzeVN0S35addhEsnzZkq3uxPNs5TrJvTRXeNf6CHpstJTxgZeKq7acOla3QIDCNNyBQB7lRS6RCwGDpGRB3YbX1aGxGQ9vaz/J2VUHMcCipuCoVTQ+sx7gpJYeXrNSiTiDIPQFy/QL5tSsPlaakVqnltphIElGDGGys3EwOnadxACjushbth+ZlnZlG7btpUz6iJ0RFyEIG+dwjcUD5B9mJRtp6hXc68mAACz6UMvKhD4FVeVNOgZct5o2QuPa8rDXrO2aX133tzcru4sPPECUpjY4JJCpJCGrYIKQjOBNqIoCyuUu0P
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 13:39:43.8745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf399db-ab47-4e06-c611-08de64bc055d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9741
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/3] arm64: dts: st: add i2c2 pins for
	stm32mp25
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email];
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
X-Rspamd-Queue-Id: 5960EF365D
X-Rspamd-Action: no action

Add the i2c2 pins used on STM32MP257F-DK board.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c34cd33cd855fb28b65a39b59b49e089345ce9a6..2f853f3fae6d84756300f19da32d6cb0297d9e20 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -212,6 +212,23 @@ pins {
 		};
 	};
 
+	i2c2_pins_b: i2c2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, AF9)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, AF9)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_b: i2c2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* OSPI1_CLK */

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
