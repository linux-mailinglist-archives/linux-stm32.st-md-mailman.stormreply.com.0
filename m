Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF1XAslOcmnpfAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:22:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A932D69D22
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:22:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72079C8F26B;
	Thu, 22 Jan 2026 16:22:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9DA0C8F26A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 16:22:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60MGFp8T783661; Thu, 22 Jan 2026 17:21:19 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btcn510us-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 22 Jan 2026 17:21:19 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDR1CDT2rk4hN2am0tnGlhTDY7lQAic8ksbsOO8U0V2I3y5eMWXm/BWPssLG78DggaFEC/ePRpS9QizkJGiKB1GBwU72kmmig7/MQl9A5vauptVBtYxnDGl/FIJZtXgUgyPwjt/yfMnwxUymrVA3EUvA6rqTITWFE9AtCWo32zElZzNo2hmTxvF2lqjAXLLqF2Dke2LV8WIIAeJY6vseVF4xhiSLb+FZrK3wmKykXT+AngtQWCL727iQhCqjzDqpOY29ilnx7qQrZ3ejp4nZnGWZpXAcc5i2tSADlpWln0rGEGNxJTTE9vTZe1b1txStSHcm2aD7sV4j9wZg/gCE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=fgXZYxhwTrPaC7TA4/ttZWZNH/exE7+h3xEyMcT1iXr4HScjMgJZs5tQ8oPD8vhcGIUXA0cCIES28FrbYkicIV6ZUX3DGCIizVJodbdebtDctFGpCjOkca/nS44aTxeUwBN4i2uuA7jtoEkaIiYBJ0UVC19PLWCtewfFUyeycewJAI+K07QlvmuciMxE3vIlOMaY6B3oP3K7QUwUKs+U8UrZSce296i4eimkSal6ngZIWfYqmEL2oqi1jZ/+PhqEjcTDpmH9kkDl3oEdq04lriO3W/GaQJviM8pAjAXXIe3rC8oHZj+4VTXbd6Z/DkpvcDdSfwVjGWXRfvLw3YYKJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=EzpNIJADCvzCsodZLbj+LbDMugUYeFzFzg129CYkC/wB9UiMKrz4iLGR0d+cXbd77RJgzmuS9WL+g9bNnYa9BKNc5kiqXInxroqupIo/UIxD0Jj88YBASc5saO9JMcnILvnZhh30zKlfX7EM8TEBd805YRAeGziOTvEw25pfO4h4b/Nr4EGfSwEEdGOoClZ3FIvXjzLDBj5zDuf83vhcXZXOryQsgjs9WEvqsg72rncwby/Mu99/u09gUPAMj8fawPzPbiD4EPxJEj+jrpeKxyZuzm/wohuA0yGv09pqBRm75j21QoJy+BKnHzf6T4l0V0s+YDBLiF3A8PdFXv8Llw==
Received: from DB3PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:8:1::29) by
 GV1PR10MB8567.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:21:15 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::e2) by DB3PR06CA0016.outlook.office365.com
 (2603:10a6:8:1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:21:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:21:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:22:35 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:14 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:23 +0100
MIME-Version: 1.0
Message-ID: <20260122-debug_bus-v4-10-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
 <legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <jens.wiklander@linaro.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|GV1PR10MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 80561afa-7b1f-451c-1622-08de59d243f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0tleHk5a2JHRG5IU0doVGVqTmVoV09OTnc5enRxRlV0SWsvOHNqOHJ3NkZp?=
 =?utf-8?B?QSszRmFrb0cwUVRlYjU0RE8renVvQ2g1cGt3amNsL09BUEdmTTFWMjF5cDBR?=
 =?utf-8?B?T2ZwdmErNS8vWFBGMXFzenc4YU02WEg4U3QzY1RNN1N5M1hJZHEvaG13NnI1?=
 =?utf-8?B?UlVTdUFnRFpxV3JvVWNFQWt3ZmZ1RFRDYkJ4Q3dGd1pmYWlObXhkMVRMYmxm?=
 =?utf-8?B?a2dPdDBTdTkxNk9WaDgrUmVqcittN2ozbE1qdGI2OW1EbmZRSlNWZFFERTJi?=
 =?utf-8?B?bHFTUlRxMmlPa3I0eVNoRkF2clpsZ0d5ZHRxMi80S0plYy9NaFZKaXhtcitJ?=
 =?utf-8?B?T2svUjg3Z2xrZVBXTWc2RmxNR2o2QmFaMmxRclk2OThNdmVHYm5VSVFLd1Ev?=
 =?utf-8?B?MjVpQ2FSdDhTWFRsNVE3b0VWejZscnFrUGNDMVU4dWkrdVBMV0tFbkw4M01S?=
 =?utf-8?B?YkhPQXZ4aXNjSzgvYk1PUnlSdjc4clVGNGtmWXpKK2hkTS84OEsxVUk0NkF4?=
 =?utf-8?B?aUxTRTE5VXYvWFkxNEJFK3d5bVR4ekg1TzFpWnlwQ3VFUHUwd0ptb2cyQWNT?=
 =?utf-8?B?bnB2Sk9HVVdzbGVFZkZBZm9RclNmcHBOTzN3bkJpaVFkdGd1UWNwRm5rWmta?=
 =?utf-8?B?cVcyekpzUFRzMmRSVUxzdlNrd2tQaStodFlhSkorcWcwdFJDWVo2WDhZWThx?=
 =?utf-8?B?Qzlza284eHBYdlVKSnRET3FueVhHdDVMZFhwVHM4cXJBT1A5ZjBma3JSaVBr?=
 =?utf-8?B?RmhjQ2FueDBveVMxR08zczE5RnRXeEJHdUlJUU5lTmVMdXFmdEI5Y1FZY0Jo?=
 =?utf-8?B?NXVEZ1Y0OWNldXo4Z1NOUXpiZDRQTTVuWlJGMjNSMkxPeHBweXJ6ZnpxVkMx?=
 =?utf-8?B?QzB1WS81dHdiNDVLSlI4Ni95cWhPUVA1dnBuUk45TzQrbXI3dXRwY3pXM3Jv?=
 =?utf-8?B?TnJkMTd6VkM2eFVCS1lTa1YyZWhjVWJuQ29JNkZGSE9OQ296M0s5dlowOFBD?=
 =?utf-8?B?VTZJR0xORXZHQUxiUkVUTC80ekNuN3F6WWNIdi9DYkIvTllNanlSRFltYTNr?=
 =?utf-8?B?WjFURVZNQnB3cTQ3bUhHeFlCc0p6UkduN0RkQ05yTE9pSStySXV6YnVoaHNx?=
 =?utf-8?B?MjZoOWRLTHFnc2swUS9LOGtERFd6bllWOWRVdlFYM01FUkVHT05SSjNhcDRP?=
 =?utf-8?B?dmdjM0N6emMza3BFOHZDNFpSR210eVZtcExyMlBrTFNZYlBvL2JUMWoyaWFn?=
 =?utf-8?B?Y0VMVHZDOWdFZFZ5YW1BYWp6VnY1ckkyVEJMWlBQWlNrbTBEVTJ2RWM0UzNQ?=
 =?utf-8?B?YjlJTVhQSXpqMWNTK0FIOVl0Q0Rvd3g3dUR5ZDM1VDE3WmhsdDF1WXZFTFZ6?=
 =?utf-8?B?NER1cDZZZDYyUmhQM3FRV3FReS9jb3VlampBcVlWcVVpODA2TlYxNGMwaTJr?=
 =?utf-8?B?Sy9NV3prSG4wQSt1RmY1UFFzUGRTekJGYjkwSlgxdGc2bEN3OTUrczk0cWRW?=
 =?utf-8?B?UkRwTG9ORDcyMjZqUEN2SWk4U2wvRzZOb1JxOE9HakdwdDNjVFAxenVIN2lD?=
 =?utf-8?B?WnRvRUVCV2gzTmJvb09GQ1M1K2xmM3QzL3JOZS8zcDQ0RVdqVXR6bXZSSC9C?=
 =?utf-8?B?RzJOOHJUL3YyWUpVVmdOeEpHS0ZYY1RHY3MyemVnZ3doVjlsdkNRSHBtcnQ4?=
 =?utf-8?B?b1VIVVdTc2FYcTNpNmptNTd1dUtjeHZyU3NOdytNUTFVL283Z3RpSEpYWkxr?=
 =?utf-8?B?OERuQ3FDUE5pUHpwdUl3ZUJWZ1RnNEEwdWpDcUFkNGs5Y2RVMlp3bmVMai9r?=
 =?utf-8?B?bWZSeWQ4R1FyTGdNYmtKUkhJaW9BM2I1d2VKVDRpbGtPVmRnM1FKc3lnUDBI?=
 =?utf-8?B?LzhubTM0K01IRDI5VmpkV2VVM2duOFdpc0hSMWpTVkh6emg2ell6M3luaGRo?=
 =?utf-8?B?TFJyQ1VhYk5Fc05CYW8ralpaTFh1bkcvQm1ldm1Pc2E4YzYrMHJPUGRraHpG?=
 =?utf-8?B?eitpL0w2c2tiNGxLVElIZ01pY1BYQUJXN3h2b3RUa1BUa0o3TGpnMTJmTW9w?=
 =?utf-8?B?N3dVQndwcFVWKy9kTGRxVkpXRmJwazdzYjlFN0ZFN3B0Zm5oY1lidEpzZlI5?=
 =?utf-8?B?eFlSdmNIZkNac1VDUzNnbVNRdnJKaVd1SUhGaVlxaFp1RUJmNE4wZk85aVNh?=
 =?utf-8?B?QUt1UmlHeVhSakRnenpqeVl0N0JFdmpIRzlvTWd6REQ2M1l4TWVLT3F2VTE0?=
 =?utf-8?Q?vyp3BSEhm3ydkPad8CvBY1rmN9r14t0AdVfLiFaD2w=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:21:15.0033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80561afa-7b1f-451c-1622-08de59d243f3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8567
X-Authority-Analysis: v=2.4 cv=Fec6BZ+6 c=1 sm=1 tr=0 ts=69724e7f cx=c_pps
 a=o2r0EXsQLJAwA017n686jw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WyXvt1svF0yAhq5Ft7oA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfXwmyn3JUtoHmw
 czkJ8ZxKUDzcMSjI5qY4VZP5NZVA5mXj0Jh61DnLUkk/gglF+8XfwBRngaQdOZEVZ762amMAcV3
 YvoanwjqxTqp1HEFXlhUncJTBzMLiJH7A+hvZOK28uYlneFaVQCA91REjLvYxExsnnid583H/39
 QNFePr72T5EAp/5mvizSM9AH6BpOpenbtsyrauNttre5Ztq3xTLlWUh7ZOtv1s4knbyVsR7kJb4
 ND0/olUN4aFn97wvg4fzYfy2m6Jn0wdO9xPkrUGdLfGmvPniOTI8liw9hJaaSePYIdcH1SVxa80
 nF9YRpOw7Mm911CWxFjzJxlpH0KV1srabKawNZJJ02t5docaa00kIQJ0WAv2qnHSH/3283sF6aa
 WpC77yzfdVY5iBUKd2dWzz+UWUD9XTQrOMNZcomj7ehARWwYaPQf3T7jyvv0l6n+ZUjRPmqfsmk
 CeFq0+WasU1snnKM4IA==
X-Proofpoint-GUID: pE9bDH7XAzZYb4vIPAukzSO3W9iWziV-
X-Proofpoint-ORIG-GUID: pE9bDH7XAzZYb4vIPAukzSO3W9iWziV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 10/12] arm: dts: stm32: enable CoreSight on
 the stm32mp157c-ev1 board
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jens.wiklander@linaro.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A932D69D22
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp157c-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index e69c8e282c8b..913c20e31196 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,42 @@ &cec {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
