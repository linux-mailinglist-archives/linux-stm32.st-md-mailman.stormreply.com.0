Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBUNENdOcmnpfAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:22:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1069D29
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:22:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82EAEC8F26B;
	Thu, 22 Jan 2026 16:22:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A1C1C8F26A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 16:22:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60MGKBuZ261255; Thu, 22 Jan 2026 17:22:28 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bumsf0q97-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 22 Jan 2026 17:22:27 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euCPVYEQ9NJ6jmvPfGce1jmEszV6iBtd3D3L0fpykFAkDWI7HTI2v/iNtYZiIoBiRbCR55m6BLlTCTd4Nog9VKok9Tnsz5ydo+zzJKXugu7f6McFQ7PLL/cwsU2p4SJ0UDsh8uFFm2loqzjW8ooIhvHWIYwhK/g6uaSHeotUlC+dRf6FrZhQvwPbwDmO0soEKyRnegOHn0grSlk47llDWvFhtk32w/ivmtjtRVzPoFesb3ShzTzL9QdCU+iSHm4XAUXoKZd2doy9zBZotmg6+h3gjHlC+erUZGcrQ1LAxOZj9zsJls9M02UdaIUEQ8p4e8qiobG728wQZ2uiewlpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXAUxBfArW7Qc27/XUKebhPfhAqf/Gk9b8Ae8kxlevs=;
 b=SGq35mikBqMBM9jFN4smbk2jnv8UFlxeYMb3/QJBSFy5WVYEY/gM41gCx7cI7XcY0Ar/DGEZgMIbzS8nufSsXtcBrAqsTzSNSo1wii9mGwGqlmuAKFpsZQDlhLxN91wVQWyx6MldlYcqIL8RSQRPm6MnWYVylE3HQS6U5Or3iqmD1ut6MXVeSLcGvDnky0/MBn7t6l3ILz2dXZKyqVAbDydg3d/5LdWZUEZreux8+eXe7bHpq/CQss7j+1ETvZ2+58inoI10vRhH6JSleXXaCI520Sz8SoIaZ7t3FirbNEtXgTSO3hUvxCKzRvnGOplqG70o4bQwg4GTuEY5oZKgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXAUxBfArW7Qc27/XUKebhPfhAqf/Gk9b8Ae8kxlevs=;
 b=BswzkGk6c2lKn2/bsoRe7O5ojBCoEV43euIJrQAwvYfhDLTcJNJNUfN4941KhSVWe6xE8snq0Nlrv24Z7LPA1TcdULQ/CJcDEOf/gU1cKpwyvBo6nwdeAOSeXsjWUQk0fhWh55NT/l8DeayC9bx4P+w+BR7RKnZtk87vpsqmJVreOwTDC6C6fek3mY5q3GEphjHzkPn0c8LvHpJ3tTb5lJx/5hnLAqPdor3G7yxZW6hCY/uz4eaP0KjLBrk+9rxm2oLYMUCGtwgTV3rfUwa0G/t0QcR26459DtayyEPNyj3zL1uE7gN0ADPOyh6DYqGVHh9lNvsr3q6I52OkRBWi0Q==
Received: from DU2PR04CA0185.eurprd04.prod.outlook.com (2603:10a6:10:28d::10)
 by AS8PR10MB6529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:568::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:22:24 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::5c) by DU2PR04CA0185.outlook.office365.com
 (2603:10a6:10:28d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 16:22:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:22:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:23:54 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:22:22 +0100
Message-ID: <b8175f5e-f6fc-43ff-a36a-dfb8e15230da@foss.st.com>
Date: Thu, 22 Jan 2026 17:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
 <legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <jens.wiklander@linaro.org>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
 <20260122-debug_bus-v4-3-28f0f2a25f2c@foss.st.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-3-28f0f2a25f2c@foss.st.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|AS8PR10MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8b8ab7-ff79-4099-e8c1-08de59d26ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|1800799024|376014|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk45eHV2TGNOSlhCN09MM2pxSkdXcTBkdDlGUDFvMFFWT080LzE1bXFzZlFW?=
 =?utf-8?B?WDRLN0hzT2p6RVhlamhHY2o5R1pRSVJpZVdTZFRIUVZoOXV4d3JzRUFNYUJr?=
 =?utf-8?B?ZHlRd0ZKZHJVa1VVUUZhOFh6aFFiWkNnL1VYbS9KcVplZkhvTkRwU2k4ZWlY?=
 =?utf-8?B?MEFVUklERnN6NFQwbWJ1c040cFYvb094VzJPVnhiOU5xMzVtY3p2Z3NQVFR0?=
 =?utf-8?B?cXk3RmZhTGFKR1YyQnk1SVBYdXZkdFNpNEtvT0N2NFVZUTVPaFRMWDhTQ2VT?=
 =?utf-8?B?U1ZwYVgrbS9Wa3R2NDNzT040MnVyYml5WDFQV2VEWm9ldVhqNG9od3RVRnJS?=
 =?utf-8?B?eGYzT2ZDNlJ6RDdkb2ZRVnRITkxyNUpIWTBvTlZ1a1pxZUMxcThyd1B4U1RP?=
 =?utf-8?B?TEZsR04vb2pDbi9EWndrUFFZZmhLclFiY1U4eUtvOE0xQlREZjh1bUo5ZVc4?=
 =?utf-8?B?UWdIazdadDFpQkJRWmlXWGJmck9hak1YRllLaG9xVDluZ3dvS2pGZ0VYUlFU?=
 =?utf-8?B?ZSt2Z1JFQUE3M00vWHM5R1lvYlRUOVNLcHQrZElDTk5oZ3hlZkU0NGRUNWFI?=
 =?utf-8?B?QmE4K1VYempQamF0M1NBYkNOamRGd2oyRFViNldKbllXd0xGdDJYV2xSR0tv?=
 =?utf-8?B?TGNPeGl4TDNzaERLc0R5VTFXVnQxUlVUdzRCQzlzalI4SEpZYmtoZk1jTkFu?=
 =?utf-8?B?amlGREhiNS9uc3BKNnltUXpkNm9pY3JURjFPejc2ZlRyMUhiRDlLZkJ2UkJu?=
 =?utf-8?B?LzVjUEJnb1pSWS9ENUJJSDFmekhEbjhra295djhvRkVNS3RSdWUycXE0QXI5?=
 =?utf-8?B?MjdGbkZDRjh1SjZkY0VxTnpqOGJCSjFyTG1qYVU3WHBTSlF3djAzL21YMHpy?=
 =?utf-8?B?TldZUnJNcWJnMUZFR1AvQmlVVk4yRGRPWS9yc1Y3QXpCWkZoZmErTElwWUFr?=
 =?utf-8?B?eWdyRjlEMFR5QzdLQnU2cU1jWkgrVVhGODEveUlaVm5IY1NoSWE4SDRjUXA3?=
 =?utf-8?B?ajA0MSt2czRJeDEzZ2t4bFhUOHRjelM0OUVQRHZiaGpVT0FSSFBON05YSUJ3?=
 =?utf-8?B?VHNtMFN6ODZqZVlWZzYwWFRSNSt3b0VieUNzSFJ5NGtLcFVORERSQ0pUYUNr?=
 =?utf-8?B?WXBZQ3BvN3YwSHNpVENIWSt5SFk1am9ndnBDR1ZTNnpvMmdjYUhHT0VuRTc2?=
 =?utf-8?B?R1dKb0E1dFVYVSs5T2ZybGdOVXp1Q0lybmk5Qm1HUjVja3VoVUdlNzNoTGk5?=
 =?utf-8?B?bmJCaldFUjg3ZjdoU0tiNmMwdTJjVEE3ZWh6YnNKZDc0MWJUUHBMNm5NQnB1?=
 =?utf-8?B?dTJqbG1FdUlXMUZvL3RDSmZOQTlwaXVQYVFVTFhOSDNxVTlNRUg0b2V5ckhJ?=
 =?utf-8?B?cUIvNXVXOHp3a1lrVFRoSHlUSkY2S2srdkNtTTM1M0JBa1hNcGU3ZWZkb3Zx?=
 =?utf-8?B?U3Z3VzM5WkxxbzVYa1FwQkt5Nk5zVitCVGovRGdSMUhrZDc5VldTNm8xaWpE?=
 =?utf-8?B?bnFoZFZDS0FuQm9Bblp5cVVwa1FIL3pCeHpaS1IwaUZ1Ukt4VjB6Tm55SVA1?=
 =?utf-8?B?S0RMTjEzdXAwdFlPLzFOcWs0NHdtK21xSGRHTHM0Yjl4dVVobmxIZnJuRTJ0?=
 =?utf-8?B?dko0UUlocTAxMDNyT1JUTXJ3N1pvdTRIcyt4Rm5tVjJqUWpMMDd4OVBrSmRO?=
 =?utf-8?B?WkJLN3BOR1R4T1NzYnVKeVdhcVQrVFRVbU55UVNrbkE0OUoycEo0cytFYStX?=
 =?utf-8?B?RVhhWWJxcG5KbTRZSk1JL2wyU1dzajFHaFFTbjNiTmYyWTJsWE1pSkd4MnVG?=
 =?utf-8?B?QjZoS01ZREN1VEhxS2FSR1B6Nkp1aHFzaDA4TXd6YlIyd1o2bG5DL3dON3Bz?=
 =?utf-8?B?LzFCNkpERlBqU0cvK2xVbGF2bTg3TXJGaFcwcmhzaVhyWVBvT2hjK2grcTZ2?=
 =?utf-8?B?TGNDVjloSWR0b1FjcG1wTmkwMlZuS1I0WkJUNEROVnJvYy83ZFNRMG8rY2wr?=
 =?utf-8?B?ZE1UMTFzR2pZdDRSbGxwV1RMN3Qza28weGgvUFJ1NE5QemhCa2xYdEhsMlB2?=
 =?utf-8?B?alZ1MlBHNDVwdlM5ZlloeWlvbjF2WE9SVzBJdkRuakN4ZlY2clZ6RS8vZHdL?=
 =?utf-8?B?MTNIWTFzNklWaEtXVFo3Z1g4MjVyZ2pua3dGYUtpSDd3Nk5mZnlzOFNkd09O?=
 =?utf-8?Q?KYj5+/m8qgzzK8NurVXKxJGLrm5rGuFOGFKM2YXXlb8u?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:22:23.7310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8b8ab7-ff79-4099-e8c1-08de59d26ce9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6529
X-Proofpoint-ORIG-GUID: AGLZSeP75Zjv5vGXlBz7Fqz6ixizLjgg
X-Proofpoint-GUID: AGLZSeP75Zjv5vGXlBz7Fqz6ixizLjgg
X-Authority-Analysis: v=2.4 cv=HbUZjyE8 c=1 sm=1 tr=0 ts=69724ec3 cx=c_pps
 a=RAmqSNJtJSKe9EuFyr+DeA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=vR-eFnANnCulSu6mStMA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX+Mfxg7FVmjRX
 COPaCi4S6mAUwBdDLFhW2H7YvZMOdlIbenwUDZflBgbP8ogyvkKVY1R2edjOn+ErzjD0Q8YSLt6
 YnYQeX77Jij7xWnlBqYDl49gRRspq/FUskzALzEASbdPm2e0YtUVGI/kMZGkk0Sf6+rml5FdM2U
 vWdbJ1yFF7awwsQT28pHzSRlF7pxr+55j9MedVXigSv8/sHtufEvk8IxBoeJSAqeKBn0b2UoHm5
 mW4O4oVK4uIatJDKLjZTyliCpDkYP4qcC+huQW8jrwxWe5weCKIXjw/mPy8trWYQlq930KvqSkg
 uSXBxpKh2n2c1ic65QeUPOsm9u5pEqnUblCVcPnt1Krt5sDBN0z5IeVn45lmcxbfHwxupcqcriT
 6iIJ6V2yJK+Uw2Lg4C1YLIwZQD5KaLWOQnxcxHAutkIpIkjrLn1q6Ac5qnCgc/SfMKpxxp1dmIQ
 UGPZSrqQxwm1nXM86Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 03/12] dt-bindings: bus: document the
	stm32 debug bus
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jens.wiklander@linaro.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,devicetree.org:url,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid,2.252.95.176:email,2.252.41.0:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C4F1069D29
X-Rspamd-Action: no action



On 1/22/26 17:19, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 77 ++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> new file mode 100644
> index 000000000000..57f01d301e75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Coresight bus
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description:
> +  The STM32 debug bus is in charge of checking the debug configuration
> +  of the platform before probing the peripheral drivers that rely on the debug
> +  domain.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - st,stm32mp131-dbg-bus
> +          - st,stm32mp151-dbg-bus
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true

Maybe maxItems:2 is preferred here, no?

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#access-controller-cells":
> +    const: 1
> +    description:
> +      Contains the debug profile necessary to access the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Debug related peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - "#access-controller-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - compatible
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +
> +    dbg_bus: bus@50080000 {
> +      compatible = "st,stm32mp131-dbg-bus";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      #access-controller-cells = <1>;
> +      ranges = <0x50080000 0x50080000 0x3f80000>;
> +
> +      cs_cti_trace: cti@50094000 {
> +        compatible = "arm,coresight-cti", "arm,primecell";
> +        reg = <0x50094000 0x1000>;
> +        clocks = <&rcc CK_DBG>;
> +        clock-names = "apb_pclk";
> +        access-controllers = <&dbg_bus 0>;
> +      };
> +    };
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
