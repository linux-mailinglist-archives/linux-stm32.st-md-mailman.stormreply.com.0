Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCPOJ9Omb2lDEgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:01:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C19AA46F65
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:01:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8928DC030CD;
	Tue, 20 Jan 2026 12:56:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79932C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 12:56:38 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KCV2HS2146557; Tue, 20 Jan 2026 13:56:21 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4brmv603ht-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 20 Jan 2026 13:56:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJnzaimgz6K2xRcPpcj90OJjxA0ym1Llr3BwB0peykVNj+Eq75ByCAuwMLexW7draaTzDE+xJZgLJXaLq7ZgjQDnJ0AwjUFmALcSOnM/+HF5/l8J9vVgQvdp9UsDujy6h22bUKqtWNsH7/6QOzj9dOB+BBuTt3BvWk/ezf2HfipbtQK2NpZ6WcopKV2X0s5+MYF14VN4FXECy1j5b7cL9sudx172IPM61bRR7boOu8RXndUM/WkfwHOtMutLyXa8CmHFqdh+vF7cZ/Attn1aGI/XYrIL5sVDmG3bWLzntR50RO+yCoLRfOOOc2NPKSDL1ju2vxjtcQuTGzJdfnkvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3p8aBB42zS52uHhClBYqCHvZaMcQIl0iaCXt28PN3M=;
 b=tz7aYyXpNQ1PbhAqOSU58/+lzy9eFfA3ZmccVZ0deqXAShlZHoioTT06XqxIKRxpiG2KlbYORDOZ0VWtsFQPN7t0ow9lyf/YKjnQAHJt7NW8h4z2rC0b3TBDQRts9EARl4xnN1DnXfj7bpDtoXkg3p14SlAw6EcN8cltlz1ynsrNIMQk+wPbiyfR17rwbbcxWl/5N+hx5Y5eQSJYjF2ab2koXM3MxXpTkQ21Guo9IcbUquDzuFcof/HZTynm7CkFf22HoLgHTTtDRFN6I2GW8D9cNQvCcgfhtYYzdC0EuObvKgnCwT4LNTvTsGosJ7RGkrlg3yo9kgiN+bAH92NSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3p8aBB42zS52uHhClBYqCHvZaMcQIl0iaCXt28PN3M=;
 b=MM61J5F62ZAvxdOzswzpQH/h6p1ohtJA4R6ER6QrOEkBSkaJgukwlZY9bqqc3pKUZvGHeKsJ5xfHEtqFoSVoGJCrY9c3/5HFw2973w+drWQyKIkBAYluaXJL3EZc11dqRJdN/ikJ/E24JYyQOujrt0qfrJ/pC6nS6+DbaHZ9jyJUxxAu88QExUi5URYDppRbGB9WbyBiFgSSXFp/DTMK6B+fO0xG25kcsl9ctGOzZAJDVpS99IY31lnlac9rulZRqj736XPKFqAFCvaIXmMAnblmDrvHBkaj3u23q9Vd0aqrOehK8fKPliiF6CHn9/+eww1TBAlBx+LsrNi8sPuMJA==
Received: from DU7P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::28)
 by AS2PR10MB6926.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:57a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 12:56:17 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::c7) by DU7P189CA0016.outlook.office365.com
 (2603:10a6:10:552::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.13 via Frontend Transport; Tue,
 20 Jan 2026 12:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 12:56:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 13:57:46 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 13:56:16 +0100
Message-ID: <662f3c8a-7235-4a3c-adf1-eaa0e4921408@foss.st.com>
Date: Tue, 20 Jan 2026 13:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 <arm@kernel.org>, <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS2PR10MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ef1d8d-9914-4647-3052-08de58234d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHBrSVVxRCtxT3lrTXRyRThFemdvR2hRRjBrd250dWl3VnJjVjgyVEoxVEVl?=
 =?utf-8?B?bzY0VTNvZk51aGc0eGpnMk9jZFZ1UTd0T2tPbm9FL2Q5aXBLUkZsWFNMZU1E?=
 =?utf-8?B?YUJvZWdpdTVueUJYQzB1aWE3bTZjSitVdlFsV2J4a2dPZ1NWMjVWaktveFRF?=
 =?utf-8?B?QkdDM0VpdUxGY255OEhFdzVZWER4d0NHTTlwZzhIbVRQbW9rN3lkTGVPZ3p5?=
 =?utf-8?B?QTM5WWFxNDFQOGd4eWFBNlVUL0FiL1RlbGZ1dUZQODZVSUxIc1FOdmdBbHpK?=
 =?utf-8?B?QUkzWXk0b0JoaGh3dExMdkc5NXFVbU1EZjBTUnV3U0xUS0grQ1pHYTZDb1hY?=
 =?utf-8?B?QmNTWnVDUDdOL1FTQ0NjV2pPekpjRXg5Uit6N01ZNkhla0g4Ky9IMG1PVXVu?=
 =?utf-8?B?Rnphb0FmZ0hkNlNmaUN0NFRPdjIyaGxmYTZsdXE3TzNyUURCVDFWS2l2TS9v?=
 =?utf-8?B?UkdmaG5TUCtUbzFCNHNXR0NJbG14dUFNN1VjZWIzMkVFMzdXSmp1TWppSXBS?=
 =?utf-8?B?ZmNZc2FQZUtLRG9lTmhjOXV5QlhWNHpIaG84MEJpRWtLNjZWaUNsMllzMDQ2?=
 =?utf-8?B?ZDZZc1d2bnMvd1owN3hvYVh5cHp2NTNxYTNJWFNMUjYyUU12b3ljbU8vUG1j?=
 =?utf-8?B?WjBJSkd1bzdydkh1ejVFR2piQnNpWTJBQy9qSXJxTWt1MmNTT01hRWt5R1hi?=
 =?utf-8?B?Zlo0Q1VTWUdIVmhlRENvWklyOERZNXdGdzZoTTZMVWNVWlRMNjBSR25saWZN?=
 =?utf-8?B?eVdOR2dTVmFBMmwvczQ4Y2JFWFgxdVZteFZzMmd4R1RDVWhQQk1UN2I0dWd0?=
 =?utf-8?B?eThMQVQ0S2tMT1VDUUJyNnplUTlMZGE3aUkyZEEySEVnQlJvN0dYTVlra3Zt?=
 =?utf-8?B?dDVONHRveTg4eXJHekdTdzczZndsQm1paEpGWTRhWUtMckE0MHRZNHcwaFNm?=
 =?utf-8?B?T29HakhGMHpZVnNhZUZkRnRtMTVWcDZoek1DK0VCSERMTjVOZG41cWlGMmZD?=
 =?utf-8?B?enI0SnY3OXpPaXBlMURuWW96UUJYUmdwLzVvWFZkVnVndmcreFFEV0t2NVJo?=
 =?utf-8?B?SElLVHEvV1VackZGS1pqajJ0Nis5NmN4aXRKTFlnb2pIQk9uQ1pzSy9zSUdq?=
 =?utf-8?B?RWZmSHlEVUg4STc3Q0haRkFIRFJxdkJrRnFTNDdldCtUbmJTVmJEencyaEU1?=
 =?utf-8?B?d2FKRk9oTjdKU2ZNMFdOdm0wNzZPckRNVXo1QWdIeitjQ3V1Mno4Uk9mWVNn?=
 =?utf-8?B?VDZGc3VBSWRKSzVFMWQ0QTMveVcvYVpqS280WVk0MktXeGg4T05qeTFIenBa?=
 =?utf-8?B?THZ5Tzl4R05SeWJhdEVPK3NKdDJLVzk5RHpESzkvNDJ1T3grN0xodVNxWEZI?=
 =?utf-8?B?dU13L2hGWWMxdHlCMWl3Mm9xd0R3STkvRmRXdGtVaEx3dWVwSlRVWm1hN1Yr?=
 =?utf-8?B?VVBiK1BGVktuSjNlaGhKOXZ1MDdzd3gvOVlsR0RrQ2kwYWRsODNXNDhiQmI3?=
 =?utf-8?B?QTdicy9LL1I4V3d5bkZTVkZrRUJYakZPMUlvRklXbGhNOWZQTjNGeDJTTlF1?=
 =?utf-8?B?czVIYmM0RE8wRTZIdlJXZGQ4UlM5K01tVElXRmhzMlVwZEFFM3Z2ZSs0VlZ1?=
 =?utf-8?B?OGRUNTBlYkJKS1BzYzJPRThFZy9FRnRhUlVQOXZHTG9EaFVEQWFVL3pPN3A1?=
 =?utf-8?B?U2RBV0dHeTdPRHVtREZ1Z0pHeXNPN0hzUk95QW9oaEFVemNub1U4dmExQmVL?=
 =?utf-8?B?YzRZWlc1RVcwMnM0ODZBZmdzQkpvQVRCaVRGUzF4YUFiekxkMjZxMW9kQStr?=
 =?utf-8?B?U1JVUmdRYXJkVVVUV1VQazZJMG0zUndTT3c5QWZpUXUya1RwMzhaVFVMeEVQ?=
 =?utf-8?B?RGtRMlZtN2hUT1VST0NkNnVUTWlCQmphQVhhVFVEUEdrQzFSLzdDc2N1Nm53?=
 =?utf-8?B?Rnc4WVJ1QnNXWndGRDRkTEFRQWFGR1ZRWFo1anNPOUorNUduQTZtcEgrTEl6?=
 =?utf-8?B?NmRUcXpLc3lwVU8ycjIvL3pCVFhXemFkbndyc3BuN1UvdklYWElERlExc1E2?=
 =?utf-8?B?aEdsNE5WMlZBcngyNVJKaFk1VTBES1VFNXpHVUFUdy9NMERjTm0rNThiR1pu?=
 =?utf-8?B?cGF5TXB5ZnpwdzMzMzdnQ0pPQUZPN1JucmdhS3dsMjBPUU81Yk0yOVB2MUtV?=
 =?utf-8?B?WnhXZWZvSWJ4ZkcxNkJ0UkE0aVFBLzZaanRraFluTmN6MURLdGxPeFNrS1Fq?=
 =?utf-8?B?c2xyMXl1M2x1QWdodUdDUWgxRS93PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:56:17.4569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ef1d8d-9914-4647-3052-08de58234d36
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6926
X-Authority-Analysis: v=2.4 cv=Vf/6/Vp9 c=1 sm=1 tr=0 ts=696f7b75 cx=c_pps
 a=O0dsbvRe/WPT3j730UY7lw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=D-mElihrz8eyQg9S2k0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3hV8wIiZrLhX-76Il3HanRb0p1rf0JAF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEwNyBTYWx0ZWRfX/MUTTfSkUeAB
 IHbKqzk+X4zWz7xaGbqkh2kSjuwRGtB9hvLGowZGHhrFWVJtGrj+x3d9X9p5s7gTCsQ93x2Lh18
 XRUUOmEuX1ImsvqXxlaGUEbBK6IoS39d3eQBoRmCIkda+0e8zNSDGeQHSJT2xW9CqJl03aybMQg
 YYDeFoVQtp7j/UNIlkX8lDsgFmx7gwOPK5IFCYeWhqvfv8SIYUcwmAU4MY55rRiASB5VFjKkKYe
 53zq3hJAO/DxXWzVTvqRgrajF4xyp0njzQDz34qnVnyGsha+Wsuk50+dZtq2lXygPd+S0R03RkX
 eZG+ZHc3CezNGBl/yNvbZLYwOukot2DXg481QAdEa9irVYucmJpWM9S35e2Jrn42E/o1+Z1ZByH
 uxYZ+hjhKDpwWW2ObT+U1D69fnbc9nxrAdWZeIwLPC0p1ddkacybh9fTFsysBogOTlD41p+Rgu4
 SUZQyNfPcEHVtSGnBKg==
X-Proofpoint-ORIG-GUID: 3hV8wIiZrLhX-76Il3HanRb0p1rf0JAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200107
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.20#1
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
X-Spamd-Result: default: False [2.99 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:khilman@baylibre.com,m:arm@kernel.org,m:soc@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C19AA46F65
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQVJNIFNvQyBtYWludGFpbmVycywKClBsZWFzZSBjb25zaWRlciB0aGlzIGZpcnN0IHJvdW5k
IG9mIFNUTTMyIERUIGNoYW5nZXMgZm9yIHY2LjIwIGN5Y2xlLgoKVGhhbmtzCkFsZXgKClRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOGYwYjRjY2U0NDgxZmIyMjY1MzY5N2NjZWQ4
ZDBkMDQwMjdjYjFlODoKCiAgIExpbnV4IDYuMTktcmMxICgyMDI1LTEyLTE0IDE2OjA1OjA3ICsx
MjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogICBnaXQ6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXRvcmd1ZS9zdG0zMi5naXQg
CnRhZ3Mvc3RtMzItZHQtZm9yLXY2LjIwLTEKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byAxNjM2MzQ4YWFiNjA4MzBhMWJjNThhNTU5MTZiMjE4Y2UxODcxMmI1OgoKICAgYXJtL2FybTY0
OiBkdHM6IHN0OiBEcm9wIHVudXNlZCAuZHRzaSAoMjAyNi0wMS0yMCAwOTo1NDoxNiArMDEwMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KU1RNMzIgRFQgZm9yIHY2LjIwLCByb3VuZCAxCgpIaWdobGlnaHRzOgotLS0tLS0t
LS0tCgotIE1DVToKICAgLSBVcGRhdGUvYWRkIExlZCBzdXBwb3J0IG9uIFNUIGJvYXJkcy4KCi0g
TVBVOgogICAtIFNUTTMyTVAxMzoKICAgICAtIEFkZCBib290IGxlZCBhbmQgcmVkIGxlZCBvbiBT
VCBESyBib2FyZC4KCiAgIC0gU1RNUDMyTVAxNToKICAgICAtIEFkZCBib290IGxlZCBhbmQgcmVk
IGxlZCBvbiBTVCBESyBib2FyZHMuCiAgICAgLSBBZGQgU1BJMSBzbGVlcCBwaW5jdHJsIGdyb3Vw
LgoKICAgLSBTVE0zMk1QMjM6CiAgICAgLSBBZGQgZ3JlZW4gLG9yYW5nZSBhbmQgYm9vdCBsZWRz
IG9uIFNUIGJvYXJkcy4KICAgICAtIEFkZCBTUEksIEkyQywgRENNSVBQIGFuZCBDU0kgaW5zdGFu
Y2VzIHRvIENMVVNURVJfUEQKICAgICAgIHBvd2VyIGRvbWFpbi4KICAgICAtIEVuYWJsZSBhbmFs
b2ctZmlsdGVyIHRvIGFsbCBJMkMgaW5zdGFuY2VzLgoKICAgLSBTVE0zMk1QMjU6CiAgICAgLSBB
ZGQgZ3JlZW4gLG9yYW5nZSBhbmQgYm9vdCBsZWRzIG9uIFNUIGJvYXJkcy4KICAgICAtIEFkZCBT
UEksIEkyQywgRENNSVBQIGFuZCBDU0kgaW5zdGFuY2VzIHRvIENMVVNURVJfUEQKICAgICAgIHBv
d2VyIGRvbWFpbi4KICAgICAtIEVuYWJsZSBhbmFsb2ctZmlsdGVyIHRvIGFsbCBJMkMgaW5zdGFu
Y2VzLgogICAgIC0gQWRkIExQRERSL0REUiBjaGFubmVscyB0byBTVCBib2FyZHMuCgotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CkFsYWluIFZvbG1hdCAoMTQpOgogICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBwb3dlci1kb21h
aW5zIGluIGFsbCBzcGkgb2Ygc3RtMzJtcDI1MS5kdHNpCiAgICAgICBhcm02NDogZHRzOiBzdDog
YWRkIHBvd2VyLWRvbWFpbnMgaW4gYWxsIHNwaSBvZiBzdG0zMm1wMjMxLmR0c2kKICAgICAgIGR0
LWJpbmRpbmdzOiBpMmM6IHN0LHN0bTMyLWkyYzogYWRkICdwb3dlci1kb21haW5zJyBwcm9wZXJ0
eQogICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBwb3dlci1kb21haW5zIGluIGFsbCBpMmMgb2Yg
c3RtMzJtcDI1MS5kdHNpCiAgICAgICBhcm02NDogZHRzOiBzdDogYWRkIHBvd2VyLWRvbWFpbnMg
aW4gYWxsIGkyYyBvZiBzdG0zMm1wMjMxLmR0c2kKICAgICAgIGFybTY0OiBkdHM6IHN0OiBlbmFi
bGUgaTJjIGFuYWxvZy1maWx0ZXIgaW4gc3RtMzJtcDI1MS5kdHNpCiAgICAgICBhcm02NDogZHRz
OiBzdDogZW5hYmxlIGkyYyBhbmFsb2ctZmlsdGVyIGluIHN0bTMybXAyMzEuZHRzaQogICAgICAg
QVJNOiBkdHM6IHN0bTMyOiBhZGQgc3BpMSBzbGVlcCBzdGF0ZSBwaW5jdHJsIG9uIHN0bTMybXAx
NTdjLWV2MQogICAgICAgZHQtYmluZGluZ3M6IG1lZGlhOiBzdDogY3NpOiBhZGQgJ3Bvd2VyLWRv
bWFpbnMnIHByb3BlcnR5CiAgICAgICBhcm02NDogZHRzOiBzdDogYWRkIHBvd2VyLWRvbWFpbiBv
ZiBjc2kgaW4gc3RtMzJtcDI1MS5kdHNpCiAgICAgICBhcm02NDogZHRzOiBzdDogYWRkIHBvd2Vy
LWRvbWFpbiBvZiBjc2kgaW4gc3RtMzJtcDIzMS5kdHNpCiAgICAgICBkdC1iaW5kaW5nczogbWVk
aWE6IHN0OiBkY21pcHA6IGFkZCAncG93ZXItZG9tYWlucycgcHJvcGVydHkKICAgICAgIGFybTY0
OiBkdHM6IHN0OiBhZGQgcG93ZXItZG9tYWluIG9mIGRjbWlwcCBpbiBzdG0zMm1wMjUxLmR0c2kK
ICAgICAgIGFybTY0OiBkdHM6IHN0OiBhZGQgcG93ZXItZG9tYWluIG9mIGRjbWlwcCBpbiBzdG0z
Mm1wMjMxLmR0c2kKCkNsw6ltZW50IExlIEdvZmZpYyAoMik6CiAgICAgICBhcm02NDogZHRzOiBz
dDogYWRkIExQRERSIGNoYW5uZWwgdG8gc3RtMzJtcDI1N2YtZGsgYm9hcmQKICAgICAgIGFybTY0
OiBkdHM6IHN0OiBhZGQgRERSIGNoYW5uZWwgdG8gc3RtMzJtcDI1N2YtZXYxIGJvYXJkCgpLcnp5
c3p0b2YgS296bG93c2tpICgyKToKICAgICAgIGFybTY0OiBkdHM6IHN0OiBVc2UgaHlwaGVuIGlu
IG5vZGUgbmFtZXMKICAgICAgIGFybTY0OiBkdHM6IHN0OiBNaW5vciB3aGl0ZXNwYWNlIGNsZWFu
dXAKClBhdHJpY2UgQ2hvdGFyZCAoMTEpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiByZW9yZGVy
IG5vZGVzIGZvciBzdG0zMjQyOWktZXZhbAogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBVcGRhdGUg
TEVEIG5vZGVzIGZvciBzdG0zMiBNQ1UgYm9hcmRzCiAgICAgICBBUk06IGR0czogc3RtMzI6IEFk
ZCBMRUQgc3VwcG9ydCBmb3Igc3RtMzJoNzQzaS1kaXNjbwogICAgICAgQVJNOiBkdHM6IHN0bTMy
OiBBZGQgTEVEIHN1cHBvcnQgZm9yIHN0bTMyaDc0M2ktZXZhbAogICAgICAgQVJNOiBkdHM6IHN0
bTMyOiBBZGQgcmVkIExFRCBmb3Igc3RtMzJtcDEzNWYtZGsgYm9hcmQKICAgICAgIEFSTTogZHRz
OiBzdG0zMjogQWRkIHJlZCBMRUQgZm9yIHN0bTMybXAxNTdjLWVkMSBib2FyZAogICAgICAgQVJN
OiBkdHM6IHN0bTMyOiBVcGRhdGUgTEVEIG5vZGUgZm9yIHN0bTMybXAxNXh4LWRreCBib2FyZAog
ICAgICAgYXJtNjQ6IGR0czogc3Q6IEFkZCBncmVlbiBhbmQgb3JhbmdlIExFRCBmb3Igc3RtMzJt
cDIgU1QgYm9hcmRzCiAgICAgICBBUk06IGR0czogc3RtMzI6IEFkZCBib290LWxlZCBmb3Igc3Rt
MzIgTUNVIFNUIGJvYXJkcwogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYm9vdC1sZWQgZm9y
IHN0bTMybXAxIFNUIGJvYXJkcwogICAgICAgYXJtNjQ6IGR0czogc3Q6IEFkZCBib290LWxlZCBm
b3Igc3RtMzJtcDIgU1QgYm9hcmRzCgpSYW5keSBEdW5sYXAgKDEpOgogICAgICAgYXJtNjQ6IFNU
TTMyOiBkcm9wIGFuIHVuZGVmaW5lZCBLY29uZmlnIHN5bWJvbAoKUm9iIEhlcnJpbmcgKEFybSkg
KDEpOgogICAgICAgYXJtL2FybTY0OiBkdHM6IHN0OiBEcm9wIHVudXNlZCAuZHRzaQoKICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3N0LHN0bTMyLWkyYy55YW1sICAgICAg
IHwgIDMgKysrCiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0
bTMyLWRjbWlwcC55YW1sICB8ICAzICsrKwogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9zdCxzdG0zMm1wMjUtY3NpLnlhbWwgfCAgMyArKysKICBhcmNoL2FybS9ib290
L2R0cy9zdC9zcGVhcjMyMHMuZHRzaSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjQgCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyNDI5aS1l
dmFsLmR0cyAgICAgICAgICAgICAgICAgICAgICAgfCA3MyAKKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIGFy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyNzQ2Zy1ldmFsLmR0cyAgICAgICAgICAgICAgICAgICAg
ICAgfCAxNSAKKysrKysrKysrKysrKystCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNDI5
LWRpc2NvLmR0cyAgICAgICAgICAgICAgICAgICAgICB8IDE1IAorKysrKysrKysrKysrLS0KICBh
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY0NjktZGlzY28uZHRzICAgICAgICAgICAgICAgICAg
ICAgIHwgMTUgCisrKysrKysrKysrKysrLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0
Ni1kaXNjby5kdHMgICAgICAgICAgICAgICAgICAgICAgfCAxMiAKKysrKysrKysrKystCiAgYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNzY5LWRpc2NvLmR0cyAgICAgICAgICAgICAgICAgICAg
ICB8IDE0IAorKysrKysrKysrKysrLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyaDc0M2kt
ZGlzY28uZHRzICAgICAgICAgICAgICAgICAgICAgfCAzNCAKKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyaDc0M2ktZXZhbC5kdHMg
ICAgICAgICAgICAgICAgICAgICAgfCAyNSAKKysrKysrKysrKysrKysrKysrKysrKysrKwogIGFy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyaDc0N2ktZGlzY28uZHRzICAgICAgICAgICAgICAgICAg
ICAgfCAxNSAKKysrKysrKysrKysrKystCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEz
NWYtZGsuZHRzICAgICAgICAgICAgICAgICAgICAgICB8IDE1IAorKysrKysrKysrKysrKy0KICBh
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1lZDEuZHRzICAgICAgICAgICAgICAgICAg
ICAgIHwgMTUgCisrKysrKysrKysrKysrLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NTdjLWV2MS5kdHMgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKy0KICBhcmNoL2FybS9ib290
L2R0cy9zdC9zdG0zMm1wMTV4eC1ka3guZHRzaSAgICAgICAgICAgICAgICAgICAgIHwgMTkgCisr
KysrKysrKysrKysrKysrLS0KICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eGFiLXBp
bmN0cmwuZHRzaSAgICAgICAgICAgICAgIHwgNTcgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0
Zm9ybXMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiAgYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjF4Yy5kdHNpICAgICAgICAgICAgICAgICAgICAgICB8ICA4
IAotLS0tLS0tLQogIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIzMS5kdHNpICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxOSAKKysrKysrKysrKysrKysrKystLQogIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDIzNWYtZGsuZHRzICAgICAgICAgICAgICAgICAgICAgfCAyMSAK
KysrKysrKysrKysrKysrKysrKy0tCiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjN4
Yy5kdHNpICAgICAgICAgICAgICAgICAgICAgICB8ICA4IAotLS0tLS0tLQogIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDI1MS5kdHNpICAgICAgICAgICAgICAgICAgICAgICAgfCAzMCAK
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9z
dG0zMm1wMjU3Zi1kay5kdHMgICAgICAgICAgICAgICAgICAgICB8IDI4IAorKysrKysrKysrKysr
KysrKysrKysrKysrKy0tCiAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1ldjEu
ZHRzICAgICAgICAgICAgICAgICAgICB8IDM5IAorKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNXhjLmR0c2kgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDggCi0tLS0tLS0tCiAgYXJjaC9hcm02NC9ib290L2R0cy9z
dC9zdG0zMm1wMjV4eGFsLXBpbmN0cmwuZHRzaSAgICAgICAgICAgICB8IDcxIAotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogIDI4IGZpbGVzIGNoYW5nZWQsIDM2NSBpbnNlcnRpb25zKCspLCAyMjggZGVsZXRpb25z
KC0pCiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3NwZWFyMzIwcy5k
dHNpCiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4
YWItcGluY3RybC5kdHNpCiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDIxeGMuZHRzaQogIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3N0L3N0bTMybXAyM3hjLmR0c2kKICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9i
b290L2R0cy9zdC9zdG0zMm1wMjV4Yy5kdHNpCiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1eHhhbC1waW5jdHJsLmR0c2kKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
