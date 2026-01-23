Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH8CCyFNc2lDugAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:27:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85323744F0
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:27:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3961BC87EDF;
	Fri, 23 Jan 2026 10:27:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64ABAC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 10:27:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NAOALB2226706; Fri, 23 Jan 2026 11:27:21 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011026.outbound.protection.outlook.com
 [40.107.130.26])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bunggkgwr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 23 Jan 2026 11:27:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBZdAExv1ELyXyUHp8cx1zxDE1UkGoRzA50kr+v7svbsCVt/Soa9rBWGBZrouH5ySOiS+znk2N5lE4Jz74TRxMvRFmaa40J/p18fHekCkIzI1JlnKEY9e7fqah4V6BWS/7sayGZOOLtZeTl4c5c20tygWM030/fvebIYxBYKHUomx9j3ozhib16MC7ygHd0ZoNdllfwqPvhmm7axt9tVddNd15OyHApufxdxznmQZaefPpmy0CYJQCn9ddlKTfC0nFj0+fJ/FMgHOru9QCjFiHqtgSygyMBHuPH02lPYzDqaQdcjYEGk0D9N4u5bv8WKd28368i8ad1puA9g/M0rXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOLE4r0ybgkKTXXlFIJ8UaMQWbIr93PBBgeK20WQGT0=;
 b=TMs+sHDqurxLiTcXLNmgaoPd+vYUIVb/YGKDI/+I2kRkmJhzIrd0RrwMHLQr7wC2vg7aeSGN3pGpxGuYrMdCK6DTRU++fsyHahgJ67vqEAajQmukdsksBm49O/0q/mnVLQ6T9gGpfv4WiPQ4ioJ3zSa+1ifiDBcE45c8KlKDLSuXn5u+TnX6SI8v0qP926fXcET7LVMTZShycGZ/dlGC6tpMtSv6j2aE3/GYFgnvtfcgF2/5MmJDgfSNYleLuEyT51q7ss6f4SjWOhyoGvXbl9b0nqKg1mt2NivBUVxIHN6LzGf9eu/WZMXoIpZuKd+uDbUHfr5ZkRklkdqLLcYS5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOLE4r0ybgkKTXXlFIJ8UaMQWbIr93PBBgeK20WQGT0=;
 b=ka/vzG3GLkKmcomEPVMQBLnADfqD0OKIh70mOUKOG+6kunzJNHIiFpdz8pPFFJCtLe1Y2O34ludNKI2HWOOAatfrJqLwTN3wUgtDxzg4oPho+BrPQDHprej4vGF0oSs+EhQ9X5urqNf/qeL2DQ6Icw/xH34g0pTpZU9przV6sp5FdHEdkchB/xCVxbTDTwOb47ZxREXpFGduBqLrRWYrtClk1beQbVq/IhhYXe3Hqh6JRYD7qrF+4gAvddUL2T2JQ9jwSiqwQ2SpH7PYAsnBX70T9PR21o/hKWOBzoY9RRif0ARgys4c862JYd1cCEn8R6J43vMJ/5bQ44DS0Wkq2Q==
Received: from DUZPR01CA0183.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::21) by GVXPR10MB8222.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:11d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:27:16 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::1b) by DUZPR01CA0183.outlook.office365.com
 (2603:10a6:10:4b3::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 10:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 10:27:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:28:47 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 23 Jan
 2026 11:27:14 +0100
Message-ID: <c66f60ef-851a-4037-8233-58f0bc3d2314@foss.st.com>
Date: Fri, 23 Jan 2026 11:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
 <20260122-debug_bus-v4-3-28f0f2a25f2c@foss.st.com>
 <b8175f5e-f6fc-43ff-a36a-dfb8e15230da@foss.st.com>
 <20260122232139.GA3717629-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260122232139.GA3717629-robh@kernel.org>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|GVXPR10MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b3c3de-65ea-4b81-7a4f-08de5a69fb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlZZV1U5UXhTSHRaajRLbGh0UkJtWDIyenlWc25HcHIva1dZZlJuMXAyaWxH?=
 =?utf-8?B?QjQvTnNJUHp0NktVZ2hjRzAzLzcrZEVBTlZ0M3JHWWRoU1NyV2V6YkMwRjFn?=
 =?utf-8?B?U2U2N2hQaXduWEtDZThCMHV4R2xWSFhCNWtKY3d5NXptSi9xY3lTYXlTS1RJ?=
 =?utf-8?B?RG9HOUp0bE1hanhmZDhuVzZ5Q1JkOFh5Q0V5VWI2YW41YVhtZy9ndFV2WEwy?=
 =?utf-8?B?QjllQU9pd2huOWViNUxnZDhQYWRiSUJCWWt2eTl4dVdoNXhVWnNpUEF6ZHRP?=
 =?utf-8?B?NFVuNEFlcE1mNHhyTWh6OWQ2b09MR3NuSjBkbVptbHY2VmJTTUxWYWxzMFBS?=
 =?utf-8?B?cGlVL3ZxOTl5T2ZZMWZ6TExLREFtQTZnY3pVaXdJVUpoS1QzYzNoNG95alJM?=
 =?utf-8?B?VW1oWTMxWGtCZC9XeGMwZGZDVGZ3dGxSdEsrSGtuTksrSTVNL1liU0pxS1Bz?=
 =?utf-8?B?RjJOREhoWklKV0x2SXVSNUgvWDVzNitzeStQbUJmN3pBaHZYTkNFa3Nhc2x0?=
 =?utf-8?B?Y2VmU0xFWjJ6Z1VmRGdWNmZwUlFFVnZ0Q05KQ2t5U3BTQjBnWGd0cUhibVNs?=
 =?utf-8?B?d3pyeXJVZlV4Tm52em5LTk1ydGNqbkxFVDZKMDVaOVhKUlVuWnYyVnJnSHdU?=
 =?utf-8?B?V3ppYVpodm9jdW4ydnFNMk9ZNzhja0ZLTDlQMXFLQnZUSWNkZG5tZnRNV21p?=
 =?utf-8?B?cmpsNVdCL2VlcnJtYVVHVGdSV3RKYjR4d280K1hiZkdVRmtwVUN0Tk5USGxr?=
 =?utf-8?B?dkkwZm5JVThZb0s5eVRmM0lSdXZrM1ZtY1IrbWdSdzZsVmZQMnZrY2c3Y3Zp?=
 =?utf-8?B?ZE1ETTJvczFjUGI5bzVtRU1zYnZIcDNyZDRLSGlwRDg0a2hidEgxdEp3bDdn?=
 =?utf-8?B?TjVCM2tRMVdxVTRzVFltZjZaeHlrcm1VZFB4SFBONXIzVUZraEFWS3dnRTRH?=
 =?utf-8?B?VTZLVGNVL0EwK3BqK2lvd2ZEKzRNS3dWd0VBUlVKbDQ2bW43cWhhUkdjcVpK?=
 =?utf-8?B?OXdjU1lmVjYzQVBiTGNUY3B1cXk4ZDR1VFVrTDBmOGFkNUJkdUFhSFRROVND?=
 =?utf-8?B?bk05M0pZZ0xxR1AwckpvL0VKQThxR1ZYTGhBODdjRSthckd0ZTBUS0wvYWp3?=
 =?utf-8?B?TTJlcFl4V3B2NW55R2Y0V1lsaDRETG05SjA1UGUwdmg1WmF3RzlmTU9ZaVFa?=
 =?utf-8?B?YkRBMDkyV3YvWktMbkRWSXV4UU1GTnZqa3dRTGE1V1l6THhLYXh0bTluZERC?=
 =?utf-8?B?bE9tVXVoUFZBYVpFMllLcDhNcWZtb01NenZBMU5tT2Rzb25xbFVwQ3hYVUdN?=
 =?utf-8?B?RXU3YWdSWG9GZkFPdmlmejBGWU1DRFpzS1MwSjI3UFArOUE4cy9JcEtqeUhr?=
 =?utf-8?B?dXZoTzRjUEFEZHpLMlZBbXAxc2JEV2pUVkdYNGkrcEMxQURzY25oVTNvZGtl?=
 =?utf-8?B?QjgzNmJocE8zUEFmRmVJNlIvVWtad2MrUzRlcjZZUE5zY1QrZVh0bFQrTEtq?=
 =?utf-8?B?UXlXQmlSSk92c04zdERHUmUzQUw5d3BwSTg5cDVVLzV2a3hYakFXUDdpRHJQ?=
 =?utf-8?B?M0ZTMTNPV3h4UkhPQzQrK1lvOHM1bHJsSWFFd3doYVM2UkwwU0tTMTMyeHNL?=
 =?utf-8?B?S3VubzkvbW4yTGFkeDRTeUJoekQwSXBhNDhCNFpUUmR1am40YzVHN2xPOXNv?=
 =?utf-8?B?dXB5S0plMlZKdEZqaWpQZ3RnR1QzNkhCRTI0dEFDeTZLSEdEN2hPdlVZWVM4?=
 =?utf-8?B?NWZxaDRFdk45OVJGSGZXOXlPSkVZNElZSVpwRXp5Z05wc1I3TkFzVFhzQ0kr?=
 =?utf-8?B?YWFkVFo5TG13aG1HM2VQaUkzVlkrc0cycVdIR29FNmRMWGN6VzBMeTNPOUdL?=
 =?utf-8?B?K1lSQmNvcHFwRmx1UG5oUzR0aGE2ZVZjeU4xRk9jeDlOaGtMRmZabVBRVGg2?=
 =?utf-8?B?blgzUUJHQjUzTG1XU0g3U2xBZkM1L0FRNXczTzZDUVdmZkZOTS9vSkY4WHBk?=
 =?utf-8?B?bHo2ajV2bHNpSmRHUmJHWGtnNmRBcVp4NVVzNlZyd3h4WGRyeStNdFMwUlhG?=
 =?utf-8?B?VWUvMmtiOWlob2dpMGhrNkdjNmxTekh5QUlzSmZNNEYwcExOUC9NbGV1dXJq?=
 =?utf-8?B?aVFMeE4rU3p2enJEc1BmSElESzc3aHE2RGVhSUswY216OVM3THJCVVVpY09F?=
 =?utf-8?Q?q4GZ79tsiUgZAFZO/4Sq8GU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 10:27:16.3220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b3c3de-65ea-4b81-7a4f-08de5a69fb1e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8222
X-Authority-Analysis: v=2.4 cv=VdD6/Vp9 c=1 sm=1 tr=0 ts=69734d09 cx=c_pps
 a=eE+qLHXDGUwwSs2WNjMcQQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8
 a=iZZOVQa0wO8LDaThZ-YA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 5E3YeN7SsctKCfU2v5djwDqJu-tFQDNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NCBTYWx0ZWRfX8g31ASTlhpF4
 AhiMvxN7Oi1r/oS9cUcino4pYtF/dxOv2se528e5Tfap47kMy8zmGwvJvUEytTY0eZLAR9AQHxd
 kbTa8sgmy+S28OWTKy/mfR3PxNa4kAY+DakNhggkes/gTsCobbwYZlpd2XPKXH2tnql6X2TMLQm
 Uf1Ft/MPHiNn41h9G2f/4WahFcsTPo6xMg7hFZ2sE9RqlykgeATvyelZ5l/zKHusvX0A7WyZH58
 UeF74cEMgq2LVdXXYdfff0alEkmZRtnDI8zbUQhUq260dvbFk+eymd7QWpekSRsBMQ77nYJp0lD
 UOzII3x6ASBUE78c3UsBgN+DIYJSUMTu5EIwXHDmho9w70NdE+axuoYQ0ZOBkrD9rnTkTY2otzp
 NpvyRbv1L3ELh0TUGvyjKUUPrrXQj61EiI0KTLiPln5MPmwL18BSn+9mA12gyMpun8IsSh3J1hx
 QkVshAjVhS1G0RaL6rg==
X-Proofpoint-GUID: 5E3YeN7SsctKCfU2v5djwDqJu-tFQDNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230084
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 jens.wiklander@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus
 Walleij <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
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
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:suzuki.poulose@arm.com,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-gpio@vger.kernel.org,m:leo.yan@linux.dev,m:jens.wiklander@linaro.org,m:mcoquelin.stm32@gmail.com,m:coresight@lists.linaro.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mike.leach@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,stormreply.com:url,stormreply.com:email,st.com:email,devicetree.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linaro.org,arm.com,st-md-mailman.stormreply.com,gmail.com,linux.dev,lists.linaro.org,lists.infradead.org];
	DBL_PROHIBIT(0.00)[2.252.41.0:email,2.252.95.176:email];
	NEURAL_HAM(-0.00)[-0.891];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 85323744F0
X-Rspamd-Action: no action



On 1/23/26 00:21, Rob Herring wrote:
> On Thu, Jan 22, 2026 at 05:22:21PM +0100, Gatien CHEVALLIER wrote:
>>
>>
>> On 1/22/26 17:19, Gatien Chevallier wrote:
>>> Document the stm32 debug bus. The debug bus is responsible for
>>> checking the debug sub-system accessibility before probing any related
>>> drivers.
>>>
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>    .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 77 ++++++++++++++++++++++
>>>    1 file changed, 77 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>>> new file mode 100644
>>> index 000000000000..57f01d301e75
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
>>> @@ -0,0 +1,77 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: STM32 Coresight bus
>>> +
>>> +maintainers:
>>> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> +
>>> +description:
>>> +  The STM32 debug bus is in charge of checking the debug configuration
>>> +  of the platform before probing the peripheral drivers that rely on the debug
>>> +  domain.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - st,stm32mp131-dbg-bus
>>> +          - st,stm32mp151-dbg-bus
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  ranges: true
>>
>> Maybe maxItems:2 is preferred here, no?
> 
> Wouldn't it be 1 as there is only 1 range? Up to you whether you want to
> limit it or not.
> 

Hello Rob,

The Coresight STM on stm32mp15x platforms needs to access the stimulus
area, leading to the implementation of 2 ranges.

I'll change that for V5, I don't expect more ranges for these
peripherals.

>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
> 
> Should be dropped?
> 

Yes, no point of keeping this.

>>> +
>>> +  "#access-controller-cells":
>>> +    const: 1
>>> +    description:
>>> +      Contains the debug profile necessary to access the peripheral.
>>> +
>>> +patternProperties:
>>> +  "^.*@[0-9a-f]+$":
> 
> This can be: "@[0-9a-f]+$"
> 
>>> +    description: Debug related peripherals
>>> +    type: object
>>> +
>>> +    additionalProperties: true
>>> +
>>> +    required:
>>> +      - access-controllers
>>> +
>>> +required:
>>> +  - "#access-controller-cells"
>>> +  - "#address-cells"
>>> +  - "#size-cells"
>>> +  - compatible
>>> +  - ranges
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>>> +
>>> +    dbg_bus: bus@50080000 {
> 
> Drop unused labels.
> 

The "dbg_bus" label is used by the child node in the example.

I will remove the cs_cti_trace for the example.

>>> +      compatible = "st,stm32mp131-dbg-bus";
>>> +      #address-cells = <1>;
>>> +      #size-cells = <1>;
>>> +      #access-controller-cells = <1>;
>>> +      ranges = <0x50080000 0x50080000 0x3f80000>;
>>> +
>>> +      cs_cti_trace: cti@50094000 {
>>> +        compatible = "arm,coresight-cti", "arm,primecell";
>>> +        reg = <0x50094000 0x1000>;
>>> +        clocks = <&rcc CK_DBG>;
>>> +        clock-names = "apb_pclk";
>>> +        access-controllers = <&dbg_bus 0>;
>>> +      };
>>> +    };
>>>
>>

Thank you,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
