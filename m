Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAJmKLT2iWl7FAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:01:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81118111636
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:01:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4155BC36B3E;
	Mon,  9 Feb 2026 15:01:03 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013064.outbound.protection.outlook.com
 [52.101.83.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB014C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 15:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umbpWDF5zjn+yIMk4BlEFBerHFpY5W+i64GW2zKC7xV/Lvu6cV+zUTSlboLRnGd7CoPexHLInnyf885GxW+t/R8HaQb8cDzAZsmKVk+MXKmqtQTwXYGzeuO9WjETbrynDj3G320toIbfB5iuwqkWSwslYIM6PjTWXJTj5x5gCyT5qvXHVQTSzEiAWn+wziVMQop5BpQeY3D7w9cLd30EL4CUQ4ZlIGgMgRnlTm3kLb4wbB1/j3BvbRpTDocpQi6pHJuaPUhZ2oiluKO8bmEqnKnNtfQwHt6yVATs39Lw30KQCsjZpg+QJsOfQ4vDWoVZbLEpZ2fsUOlOV7LZna+bPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=;
 b=AebnKMvCQrYJTJLFKU3o+7ZlRwlkzmGlkwm1RvMCuVmtYOr/bbefPZnwbQYQEETPJzEoNCKMnI12/Q+RSryNr/SjPTuTSE/6elQ/KBsBS/My865M8KT2sphs4u4HDI3h9NvEStCV7xoa8XOreRP9/bdUntlTYDerQDCzKzmmOxLiFYjTW88MUb5pNTFa4WQwDJ+mD5fvyvV2S1GCJLpmNB6S5trfVwPsRsmuDCx0kZiJvWefYBuHtyaU3E3/8nbWfReUXQ/gle4aYeJsKLsYmoE+NOgvrSDm/oFkqagvaxFXrnlYyU0jECPFcdztSnT9A3QvtrhyL3o/PD9iHv3YPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOtDK8kEF4m8C7ohr+ZtXULKKLSI0rceFoaW8zl7XjI=;
 b=nw0RWuBCi7rkMBNrIELIpzEpsSMUxGyYguCmjbsPwn0ODhO3t5f2PW14928IXuN7PrIcdmWUr6H9gJlA0T8F9xYANYg4UbzZXT85a2nUfgcE/BY44wFOmNPTqu6MfG/wzSdv6rXHofElLohimy+ywf7j7D1sSdJQSiDSuVkQ3hcHaUA5r0iHfUQLVPK1vwWTEdfvoy4ywyBsjxHwQsewU/f78WvGR2ljxoc/4Cc8mmha3NguiJU7t/FkWQjwLEzEB7sT6LgGK2Jucyr8jTot0cVmkFBx29/2F7Hdp0pjLddJYtyJQGL0rxGM7hHGtdgPoz4TELEXAEkGW05oELWejA==
Received: from DUZPR01CA0268.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::16) by AS2PR10MB6895.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5fa::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:00:58 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::4d) by DUZPR01CA0268.outlook.office365.com
 (2603:10a6:10:4b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 15:00:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:02:39 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:57 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:36 +0100
MIME-Version: 1.0
Message-ID: <20260209-stm32_risab-v1-6-ef0b2b6a7e0a@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
In-Reply-To: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AS2PR10MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a2a713-aac3-4619-8b6a-08de67ec0857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFE0c1NObk9ob1Q0Z2NXNSsrRjJVYllsVEtmK1JIWTB3Mit3YmRjUWtwU3FN?=
 =?utf-8?B?N1FQNnorNHc1eGtrd0dOM2tFWDJyZ2dBU296TjExblpUUWZwd0k3UzU3ZVNy?=
 =?utf-8?B?emkwQU02eGl0enNhaWR6OVp4ZjdQc3dPR0twMmc3Nkw0MkNUN1BLZmpuTTJ3?=
 =?utf-8?B?Mm14Uklpa2hsaHdZa3crVGZWUmE1MGljbVpFWkdLZ3ZsbUU3anpCS2Q2WlFK?=
 =?utf-8?B?MkJuM09ySEVMSEc1SkdlWWFhdUFNUHZkMGdvcXV6WVhTSmVKWExCNk1EbUlu?=
 =?utf-8?B?a2t1ZnJDd29Dd3VvaUhBSysyVG8vUFQxZytOaWVsekNHOU50ZFZ0cmpWWFMv?=
 =?utf-8?B?dms4SnJCNUtZTDJhbWZ0aW5wbDNwYXdHaUlTRGc4ZG5USUUrMzlzRlRZa1RJ?=
 =?utf-8?B?MkNCTnZXL3grWWJkWUJ4ejRRQTZPNWRUNld2NTVpb3RxZDlYWEtXTlhVbmQx?=
 =?utf-8?B?T0RXbmtNVVYxVHhlOVBqN2tZQ0k4OER1QjhDWlJNVmtMYkhrcVpPMVB5dHFw?=
 =?utf-8?B?cDdGMGRHZzRDRHlrd2JMVmVsL1hqbnowcWxvZGFxTzR4NDZuWE15eWNBOVFv?=
 =?utf-8?B?L1Uzb0RneXcvdnBVcXVJVlJEREZyOUJjQktoYmdRejk4UzJXd01Ta2lDSURU?=
 =?utf-8?B?OUovQlNYVDRkbEJlaEYrZUtEY0RoeFJSaTdhMWRoQkVmV2xJYVhRNnNLU1Iy?=
 =?utf-8?B?UDdYMXY1ZTdRT1dnRmU5VmR1UUNZVWpmbDlVZmZyQTRPd0RjWDJRT1BSb1Zv?=
 =?utf-8?B?S1ZyaHErUDlseEp1N1FrZlpuZkZ1WmpjcjdQemtXN2NUYTFwck8waVNIc3FZ?=
 =?utf-8?B?Tk13UlUvY08vL3lFKzkxRnJHdjFmR09LRithMGdzVElzbGY5SEtpRFdYYldQ?=
 =?utf-8?B?WHE0UGthZ0hqaDdxcHJwV0ZIa0VTSSt5UTVhM3Npa29iQ0FtU0p1MlY1ZEIz?=
 =?utf-8?B?Q2FkZ3cxS1RLcGRWMUNGb0E2ZWtNWkhBTGg1VTRsaXc5QlNxM3NZcTdwc2dl?=
 =?utf-8?B?MDJFaG85Y0NlclRkY1FzcUJpeGlUcDNIMFRSc2hESnhXRDhoTEd3aFBRQ1Vn?=
 =?utf-8?B?VnJwc1hWQkdLcFpzQWt6RDFMZ0xSQVBBT29MUHpiTFU0SkxzOVlmL1JhKzVM?=
 =?utf-8?B?TzUwTmN0SCthNnA0Zit5akVWQTNhVDFEQXhCaHV5MjNXOXUxYlBucEJsMllP?=
 =?utf-8?B?TndoQ0R4YjR4VFVnWDM1N0pNVlRqMEl6d0k3MmdIMTVWOEhkTFZMUmlyakhK?=
 =?utf-8?B?MGlRNTlWTHhhMjVyaktJLzFJK21OZDI0SWEyMmNtU0tLcGJyTitCV1RIZCti?=
 =?utf-8?B?UG5kODhjd01tZWxLSHZtb25aUSt2K2tMVjZjZWNYWFowTUNDaTFab25zTU1k?=
 =?utf-8?B?YmRGY3FMRElncnVUSUFwejU5ZGhGeHR1UmpXZEQxTDdPaHMwajRVUTBsUDNR?=
 =?utf-8?B?bG1IaVc5dVVrUHFJRWFCaEMxKzhXU2lYSWRyNU9sYjNVaFU1WTZ5dWdrQjBv?=
 =?utf-8?B?NVgzZm13MEt1QXluNUdJZmkvL0tMTC9KZEVxV3JDMU00UVRRdmE4M1N3MGZ4?=
 =?utf-8?B?aXdvN0YvTXh2eGNGTlBxM05neng1RFpUMDZhNGMzU0hJWHdGbWRva2NGRUl3?=
 =?utf-8?B?MTFSV3JEN0N0VTZMNTRmSGhJWHloUUxzdGlBRHU4OEVML3huRFhGNkdidGRT?=
 =?utf-8?B?MXdJTi8zd2JRdjBoOGdNZjdiQzBETUwxTGZxUkpHRHdXbHNSUGoyWHFOZ1J4?=
 =?utf-8?B?UmIxS2I2RVJtOTVJZ2xiU3g2cldCbTFpQUhtdnQrM1BTRkFZME5Kc1BjMXJ4?=
 =?utf-8?B?M01ybkRNMzNkUU95dVdScW5kMjlkMU9IRGdpVXAxMVd5ZkV0cmFtZ3VyUkZa?=
 =?utf-8?B?UWtNWksrbHNMT0dzSEhNY2F0NW9PZXBpUjhURDRsUDArc0lxUkxCWmxqRUNn?=
 =?utf-8?B?SUsySEZ0b1hDRXpJeWNtM1pkVnorajNXV2pRcDZrSFRyTnd5bnFkc2YwZHN2?=
 =?utf-8?B?dnVaSFhjWHlybHVlRGM3anlRWFhHaTBRKzlvbHNXaG55a3ArRlhWVnAzN3pv?=
 =?utf-8?B?eEZqTFQ5V0V2eFBZTlRuVjBLekc3OGUxU3hCYzBGdExWTDc5NHVxM0lCbGgw?=
 =?utf-8?B?QjVEWGcyTklROVdwd096WnFxU0VBMXdwREhRK3BBTEhxTzZoRHFUS3BTT0dZ?=
 =?utf-8?B?bnViWmpTR3FsR3k5RjNkWS9pYmhWT3ZJcDE3RWxLalE3RGdGaE5VeUxJUW5V?=
 =?utf-8?B?N0ZlTGNCWGtqeTRtK25SZ0Z6Rm9RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VaBGbmVbegiQErnxx+zIt28gbmyDQSmLGWQ3I/FpH0w6jJufGEZXQSnZvJZR9b3X3RHlpYKISzjapKrNjBQHAx0StE39S1tmKuCJ3tSjj9S09mM8u9mflILAHNJoph65NDfTv5q28QI0xCop4FA7sNooYtMCDpGNLiAaeNu+c8TsUR8DEbwiUW7Z6h9mFH3wc5knW1hBqtuwCltrVmpy8QTxDwbdXrdrvzjK4CWxu3rkMW+OrBxh6K0y+LH4HjU5FdqFeny1khmGpYB9pmASDDkppzTYR3rRwtvjfWsgARt12yt0jvaVpprk0A0a0jQPfWCnZfT7QOSSKWqnYkcusoeC/7OPvx5y1N/bNh9x9NRrYvjVNIfQcVMkSihXtEutacpgmGR2JTGtXBRsi4bBP2t8ngURNecgUy/hWDh0TWFmtBEOUOo+bbHpH7eyWU3h
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:58.1874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a2a713-aac3-4619-8b6a-08de67ec0857
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6895
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 6/7] arm64: dts: st: enable all RISAB
 instances on the stm32mp257f-dk board
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RSPAMD_URIBL_FAIL(0.00)[st.com:query timed out,0.0.0.0:query timed out];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_PROHIBIT(0.00)[0.0.0.0:email,0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	RSPAMD_EMAILBL_FAIL(0.00)[regulator.0.0.0.0:query timed out,linux-stm32.st-md-mailman.stormreply.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 81118111636
X-Rspamd-Action: no action

To be able to dump the RISAB configurations, enable all RISAB instances
on the stm32mp257f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index e718d888ce21..42894ba954cc 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -100,6 +100,30 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&risab1 {
+	status = "okay";
+};
+
+&risab2 {
+	status = "okay";
+};
+
+&risab3 {
+	status = "okay";
+};
+
+&risab4 {
+	status = "okay";
+};
+
+&risab5 {
+	status = "okay";
+};
+
+&risab6 {
+	status = "okay";
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
