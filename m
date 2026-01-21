Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBgUE17IcGkNZwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 13:36:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD51756E21
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 13:36:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A55BAC36B3C;
	Wed, 21 Jan 2026 12:36:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F370EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 12:36:44 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LBujs52252556; Wed, 21 Jan 2026 13:36:30 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btca6btb0-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 21 Jan 2026 13:36:30 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKcDDtApxL0Mkw41MH+gmvrkmXovEGOhXBkuDcM+nJo+VB6sIesK6uW5vnMWrW6je6ED55QC55YlSjBkjL7ZmoiUvt/lS8twebDDhA9JtXEKGto3hRY8BuOrl4oVbIwN48Tv/xI/904PQmEIYpKNI+D0mfkZV3RNu5hcgGiIofwqthHnx4yZTYcHqg8fweMLLTUFQMNGyzIqQcGtZyT+UA2M3PJPua6yQaXTz7TDbjkjuYWO9rbJWmxoR0GsnTdnLEVYuYtQamSFQXVbBGU1dEoMOKM8tEHgxkdbi3XKe8K33n4TwmdcZxjQ9f5L5uQ+9Rh2QzMsHYbsBL4pFeu3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=MceGP2JgSmAkUQVT25D/hQDjKjVrGEGZFN0LV3UizaRn6SagrqJtpGsIfK3RSTge176cS+ArGT7LC9eW1XeTqUlHOCbKriQl8ZlhGaAosR25V3Xxwjyzl5EzOZL1XnN5wKcA9Y9TS63prwE/QMwcKkVYsrgr5zVmw5jyyszZOp+6te5GDyxmOHiXCVEoeBCQ430kkX9koanUAvPX9HJxoH4pwDHaNyS5hzMCdufkp2Qvb0QkrfiQmJfw2Dmq4kcDpjhQAs/LLNVYL8+5AvT9LXLPaGFHe/X9JgPHFbWWLLlRN0o8gS644jmTUulqfsPGQ5YbTlfD9GhZsmIw9qZelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9l9OD5UtJ51yyhOAdrv6McKpN/7vVd0EQ1KH39HGq0=;
 b=SmAV084mxD4P69BynKTa5Re4W30ZpkTisGBXqsGfyUakj8SG63bvgVGAQLMebnSw6Bw6NEofqVB/S/2+OMWMxrF/VD0Ly8uwRFStYXpgYYbZI3Ejk9crO+IwJeLkgXsl9XbkOF3jZddc8o9iV/OXv7Devl0k8hh57ktD0Z5YJ6m+lKaUFaH53qIpLGp4etzsy9caIwi6qDY7eE92nZIrr3r+0ymMNy5l5NKHjqrH48GN1S5klSXuhIj0qw4WRSU7tJkw8/X70SJ0zltQBcxzJJif3tylWUDhTHLH4r8sQrqbkPQ0aAP0R/BqNit73MU2vCfJaVbx4ftPvroe6wb6ew==
Received: from AS4P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::17)
 by VI1PR10MB7809.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Wed, 21 Jan
 2026 12:36:27 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::44) by AS4P189CA0030.outlook.office365.com
 (2603:10a6:20b:5db::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:36:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:37:56 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:26 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:44 +0100
MIME-Version: 1.0
Message-ID: <20260121-debug_bus-v3-10-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|VI1PR10MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1113ca-0da1-4a85-2809-08de58e9b1d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzZJU2Y2eEtLQ1dBeXlvM2pza3dPU2lyYXpkdnV6VWJsZ1BwbWRqdGxrRzEv?=
 =?utf-8?B?ajMzSUJYVmFaUWwwcm04dksrTk14MjJhMlZBSjhoM2E5dFBnRHVBazRmTnFa?=
 =?utf-8?B?STduNERTY0t1R3RKQm5ldkFNQjNEL3ZuTG41NVQ3ZlMyNGo1THRjN3JHWWFH?=
 =?utf-8?B?bWc3U3l5L1puYVZQUmFxTjRQWFZsVFJEb3BBTHZuTTRhRTFLdGhiNlZPSGlT?=
 =?utf-8?B?S3Uzb2xBUWlDeFljMXMveXVmV2VYaVRuMk9HSnJOMTZoUmdvbHQwc3VERzg1?=
 =?utf-8?B?TWlrYzFkaktmUGxHZ296bkN1Z1dEcGpxYzhnRG1EMGNlaFBoU2MyT3pIWCtX?=
 =?utf-8?B?N0FheE00ZUhYTjFZNFJPR1FuOVVrK0xzZmdXOWkvY2k3UmNEVnpjdmY5a1JL?=
 =?utf-8?B?bEdyWHpKT1JuWk5LZlhIK1BGaG1panZHV2UrWW1lYTBONWtWOTJOSzZodktQ?=
 =?utf-8?B?cGJoSG1lRVEvT0hmWVNESVQyQ3VOalZMSlBzNU1kQlBJTTM1K0NwRUFJbUZB?=
 =?utf-8?B?SXdMMGJjTStoaXNsdHh1QUh5RVdIMWRRRGhaOVJuWW5YQkFoREFsSEk5QStI?=
 =?utf-8?B?blp1dXVrSUM0WmY3ck5LclJlWEZVTTZaQ1hLY3Q1MzNBd3VSdUdzam9Hdm1Z?=
 =?utf-8?B?ekxWTlY1SHpTL0lIdXpBb3c5MVk0cXphTXQ3ajh0Q09HSVZvSFhjcU0rR3pL?=
 =?utf-8?B?cTArQlNKTnZtQnlkMzZUdjJlc3A3Z3d5K0lXeFl1NkFlanh2OHBFRDZHWGdj?=
 =?utf-8?B?QWwwVFZwYmMxaUQ5Z1pEK2ZTMXdDM0w3YVEvdXloYkw1TmMwM1BCN1RKWHF5?=
 =?utf-8?B?QWdhTjN6Rnh4b1p3QlR5Mk1odnIxYUVIV1JjL0Nhdkt0WlAyYWE0WnhINUo5?=
 =?utf-8?B?U3A3elA2UWxzUzZHRmIxUGlTbldYSyt0ZFV3MVJoSDlRa1RlTi9WaGE5L0Nz?=
 =?utf-8?B?Q09FaGd3aVp0QW9FQVU4T1Q4dDY2NXFHMitSZjlsL2dyTUlBWXRPS2dxQ0s5?=
 =?utf-8?B?T0J5cXJ4RGJDU0Q4TktpWlhnbGRLbWRvVU9JTTlKN2dyQ21vYnJUL3ZWcGo1?=
 =?utf-8?B?aEs2ZkFwRmU5ZENGSkl5UTA5TVp6VGFvUUNmS0Z1bDhmTFhVY2FKOHVBZTlh?=
 =?utf-8?B?c25KQXNobC9Tek1xNHMvaU1JQlZiL3NnVklDZmlHdEtmVXNuSW1sQmwxQjFX?=
 =?utf-8?B?WnhhZmwrbFdLY2hJNGhJSTFmdHhmVkRXU2U3WC9GbWpsVlRRdlI2ZmNhZldw?=
 =?utf-8?B?QXA1ZlBlSWF3WDZNcmlxWDcyUC95dGZPMno3NTJqbjZ3Vk9hS0lLa3RzNWlZ?=
 =?utf-8?B?NEhLRXZYVUFVNjMzcEN4TnV5L3B2N3didDRpbUF2SnBTbC9vcDNDZUFJLytH?=
 =?utf-8?B?TkJ5YjFYVTY5NWhiR21PVE9jL3d4bDZvbVh6T2lhb21LdFBDK2VINXJ0c1VX?=
 =?utf-8?B?djN2Z2V6T0YvV1hxS1g5V0VESlJublc5NWpZcGJmQk95dS85VGtCSFVjalhj?=
 =?utf-8?B?am1ZSVMzVEE4dFArVUV6Q2o2UXJaS2xxQy9QL1FUWGJic2NsUkZBeTlwMXpo?=
 =?utf-8?B?WGRrQWFjRmNKOGFhbjdVZDhkbFBkV2RrQ0doRjU5c2hXTjdLa0RjNzl6TGU2?=
 =?utf-8?B?ZzJFMm1wZTRxRkRVQ2lRenl3QSt4azVHQzVjMkdlVWgySnM1YTJlcnpKOWZV?=
 =?utf-8?B?YWN4VlZ5ZFFhZUFuRDVieWpVMHhwSlJtd3VQRXgvT3dVMGRneTJjUU1GY29Z?=
 =?utf-8?B?Z1dWWHpkUDk3MjNub3JkWkRSOFFHaGhRQW96QmJXYmpIdDlEZ3gwYUE1OU9S?=
 =?utf-8?B?RFhvNU5EbXQxdWFXYUk3ZThJdXN4UHc1Q0E1YkpncWZZZFBqTUU4UHZuQWIv?=
 =?utf-8?B?MXUxMk1NSlZ4R3M5UW9tQjc3OEVtOTgrZCtuR3Z5WWUxa3dMK054b0dybklH?=
 =?utf-8?B?T0N5Z0tybVF4QjVZVlo2VmxVNldwN0FYM2wxcitqRVJud3BlaFNiOVArY29m?=
 =?utf-8?B?YlZQdzErOHlmYU1kQmw1V1puK3Q2T29oR2tDZGVpOE1xbGd1bEE2UWI5MlI3?=
 =?utf-8?B?UTI3eFZyejRpV1FOWngvOXVPQ3ZqdDJRc2dYSkNsc3hHUGU2bU9GMnlSZ0Ra?=
 =?utf-8?B?Ny9FSG9jSXZhRWV3YzYzeWxyaGdRSzZOb0hPaldpZUNVaXNwaGFvMy9Ba2Ey?=
 =?utf-8?B?QW85aGRERkhFZkw0Qzh4cnNldHlnS2thQ09WU2dxVHdEMFVDenBXYngwSFRW?=
 =?utf-8?Q?EnbP1VQAAsb9lLKBsNZbBNMjyNjLa9GE3xFEkCWQXo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:36:26.6319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1113ca-0da1-4a85-2809-08de58e9b1d2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7809
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX9m08xif16QtW
 0jjnWtfadOy6RSm5gALNVP2RxOW4FGLYkofEmQHG7ri8a1/zQA5t++tLkgtglPyI5I2WUymz+se
 oaqQjigYPW341gQT+FnNjcCyRhDfd/gFxE/YXBOnLHOhVlXlLqOlp9+Lj3L6qr5UulRRS8dzlyW
 9b9sfq0x8M+BuY3AI+v8kCCz7HESUp+/Vhgt/Y2vlb3/MLb76Vp8LrlzT0q8vYxOY7WxshLWoah
 kHMhQwK8ESjySHn7mGxreuqib1vdSahGvznDs19wlu5M2X90zRXPAS7Ir9xhNLo1alY/sSdBm9l
 VHbOtxMyeeWG4h5mWSO9LoLYlf3SYxgDmk/y9oDUaDIiTnuzU2XFX5Te597K/Ty7sG7Jt5jcA7j
 ntnH5IGpyldFZLFuTaJ2A6tehut2XMbEwZc5bmrl+Nd55L2emqNuXtqym2a5fIglIhxSfanCnjz
 ymDM4H+1v6rXOAe2Uqg==
X-Proofpoint-GUID: f56lqJIgwxtvP_EebpwJR2DbYeJ9z6Ym
X-Authority-Analysis: v=2.4 cv=dZqNHHXe c=1 sm=1 tr=0 ts=6970c84e cx=c_pps
 a=w3yz3AAp3lBg/DSphz97iQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=WyXvt1svF0yAhq5Ft7oA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: f56lqJIgwxtvP_EebpwJR2DbYeJ9z6Ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 10/12] arm: dts: stm32: enable CoreSight on
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns];
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
X-Rspamd-Queue-Id: DD51756E21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
