Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51203C5E8D0
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 18:26:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02650C628DE;
	Fri, 14 Nov 2025 17:26:32 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47F07C628DA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 17:26:28 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEHNjWT2820002; Fri, 14 Nov 2025 18:26:15 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4adr7j3xhk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 14 Nov 2025 18:26:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNIsVx2UM8e2TA9cPJDehaFdApjr1qFm5xAyRTUY++yiHyeW1ti3Uw0wG4QfS8DgICe0t3SOMEPURWzI7OitkJlZ9b80wjsjS8+BixxD35Ttdn7rlvQjdWb8Fi1dgkM16laSBzNo8KL5k1T8kkCfas2xrY815LnnD9vj47ZOXaC2AmAjbCSnBemNwuexw5UTzCqRnKGLnubgtC/nX0AvxK2mTrOYAE++q27xmAiKFZvFU1xHCHwcvNFmu953HGDYcpDvr86MrpYVJ7/tXtHve/ITLx2pxbq1G8CI265zcOGbqzzoidjbkHpJn5Um7rBGrHMw0A1ZITHmPfbfMMqc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=sOzcu88+QQ18D8NoTeup60WuCiO9G2+LDtY0QC5tDu+suW1ju4Rdy+yPP2g7jFVIfcPfqyT/OY/hRSgl/hRGq0enAtY5rDhPk+MN2jcjtyWZsV5tVTDCTqamGhQXIfqLN3XSiF6FEo/wNkNg5BBhOtB9KQYCzymZmr05Qh18xu+4/ZRMuBqQ8KQKihAlJQLsNApvoZvKbINT/J4DXh2MIEgCQ1hCgVa25odYgVGhV+QKLz3DbC7BbMG5q9Vr/t3du5ouroO5dtLt0oj8NA98L5HMdfp1vdmd0c2o+44UNU3ndb5SGF6oCgk8qqgHegvPQVCtObax2W1OQeI65aru7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w3rrJHDXH3gZJo7K9Cu48MXav0WVtIvRr/eQOeJnZ8=;
 b=cJyvbvYvy8U44NZ3zowuMqaP1an+HQXSa8r/0rT0w9DmjZadk7+3FW946t6I3pgJaTptUjfjcg6Vpngz4VSQj47n9PZiXfzkKJHgCzKzYailzlYdTpKAQnF7NPPNjKZ7eh1R+RQSdI3SaAuc6WdGqbsJfjsLGVk7n01yfQOd8sO083zyMeWg22ONFo6lr0m4LGfozyE9WPmhTJaa3ndx1EARNcslngFbNgebsTJGXyBKg8Jt64XMRBxyxgjoIbBhC3Shye7wl+7DCID3OZAPNA0FqyKv5qhcRvRQcgIgMsg3k6ddA6SDqZ8CxH4NfWUKbILfn9gkOm/IG6Srlyxhog==
Received: from DU6P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::25)
 by DB9PR10MB5812.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:393::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 17:26:12 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::ef) by DU6P191CA0025.outlook.office365.com
 (2603:10a6:10:53f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 17:26:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 17:26:12 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:22 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 18:26:11 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 14 Nov 2025 18:26:04 +0100
MIME-Version: 1.0
Message-ID: <20251114-upstream_uboot_properties-v2-4-3784ff668ae0@foss.st.com>
References: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
In-Reply-To: <20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFD:EE_|DB9PR10MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f108c6c-99c8-4f19-4184-08de23a2e878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXBybTF0NmdYU2Q5TE5qQVVtTy9la1dDNmtwQWlveE1nb2Zrdjl5NWlxNjRE?=
 =?utf-8?B?OEdjZFcxaldsR1BTSTBTblgyYVhTNWg4cFprakNlV05UdDdBZ2wwWHlRbnls?=
 =?utf-8?B?MGxYNHhNS1FORDQ1WXh0ZjQxaFBDb3BOQVhYTUNmT3gxQTc4a3J0SldzMTk5?=
 =?utf-8?B?bUJVc3NqSFdWMEJDT2EreXZLNVJENXdlWWw0VllKNE40RldzYzRuZHJpV1Z6?=
 =?utf-8?B?elo4WjNGeXdBcTM5Rm1ZM29FU1NrUTR2S1hKdzArbFNnYWtYKzlQKy9tNG9Q?=
 =?utf-8?B?blJxM2FiYnpYbzkyU0tZOEdKemJIVjQ2cVVxQ2xwSXE4N3JuY1hZWVBKdUcw?=
 =?utf-8?B?c0ZaZFZjaFk0YURXOElaWGd2SEMrUDIrUndiSTZSRVpuRTFXcWd2VGUvaWFr?=
 =?utf-8?B?c0ZLcytNdHNUVEJiUWdBNEl5RnBYbEdrMTg1Z1ZhdWQ2dHFCcmlOTFZwYXEr?=
 =?utf-8?B?cktYTTg4Y3ZsNGVlTXN4aVFneGk3d1VmK294S0NtZTFRVHNnTkZrUnJCZzBo?=
 =?utf-8?B?RDZVVzBOME12dzJTMlN3cVBKeW1jNGlwZkVzV295dVIvZGRHS3RDWUhHaHFs?=
 =?utf-8?B?VjJCcGhqN2RGSTIxNHF1NlVLdzY3VzREZjRwUE1kTDBtZHc2elB6WUUzK0lm?=
 =?utf-8?B?bUIxL0JNRHhIOE9IOGczSXEvSkV2L3laRHlpWG9EUDY2SE04ejVXcy8rTWdh?=
 =?utf-8?B?bXJEQVh0eXRKTk5UbUVzQTR4VjZRQjNEeWxHcko4blpmdzJ3YjdPeWprOXpJ?=
 =?utf-8?B?alhTd0ZjbVdrODJzVUYraW0wRGgxMWphYjUvTnpORnN2SVFXQmJ5RGZQVDEz?=
 =?utf-8?B?YXJKNVZmY2FRNTN0VUM0a3FUdTdsV3RYcUkzMXJ4RW5IQVV2ZFNZSlZnSnVq?=
 =?utf-8?B?aGxsVXNTS2UzS0RNK1lySjl5SnNDOXBsSGFJMnJMSXFpUlZXaWRyT2pKeHdO?=
 =?utf-8?B?L2pqdXh1U1pJWHI2dWdTenpNaHdpZmtNRnczSDNkWFpieTlIQXBxNDFMQ3Zn?=
 =?utf-8?B?c0E3OUpBSjM3Y0g3TDVRYTV3cm03WHBPK1BURStwN3dZTmljUVQ2TlpuYWNi?=
 =?utf-8?B?SVM3MUpYTmtyeXhLWjNFQ29GSHYwdHV4S2UwQk91OWR2SWVmdTNZUFVpc2lu?=
 =?utf-8?B?VjdOc2RyS2tnczlxd2Z2WEdiOEZhOHRFVkRnc2c4SGNMQVFrY1g5ZHJqWnhI?=
 =?utf-8?B?STVOT2dyU3dnYUF3WlM5bDUwK3lMSk9aZ0tMOGdvcERNYkQ2RzNBMWYrNGpx?=
 =?utf-8?B?TVJzdTNmL21EeXJ4NlhybmFNMmtsNXdFL2ttQ05GMFh0TysyY0x3NGFjVEZE?=
 =?utf-8?B?b2JYVTRJend1MWJmY05qNi9NaVNybkhEMXVvVlBDbDBDS3NQaWFXdEZSS204?=
 =?utf-8?B?NE82ZW5yUGUyZUd2UXArZlZkVzFmUlkyeXJvYlVXdzJrRWgyWmkrZURJSjA5?=
 =?utf-8?B?bFQ3V3BJVVVqOHpvcGxSeUJIbmd2VWdhYTV3dEVMaGJmV0h6SGx2TnpXakRn?=
 =?utf-8?B?Um5ZQmQza0phcWFOQ2ptRE13Z3RUdWN0T0pURmpjcWJXSWtBdGNNR202c3A2?=
 =?utf-8?B?M0xmQ0hxa01iTU9FV1dKT0VrUEsvQWZ5RE40Sm5zNnhrYUdYd2pjU2UxdjVK?=
 =?utf-8?B?WmVGWTkzUkYwYllnQ29GSDhpcEZYcWd4dGtNQmFtN2x2OFlSTmt2eDh5a1dj?=
 =?utf-8?B?NzhrenVhTEl5MWhGbmJDaHVTNndwbU1nUFVWNGkvZXVERjB2ZS9nQmVkZ0JG?=
 =?utf-8?B?bzRDczhITCtYbFB4WTNmeUh0UXhHVjAraWxncFVzSXMwdUpLTVc0SVl6NGFO?=
 =?utf-8?B?ajBlbWZOV2kzTStxWlROa1FHTjBUbGlOQmFxalpPdE85c1JnTHRiQlcvVmFi?=
 =?utf-8?B?ZFFFOWxKYWxRVzRMVlcxRGU2N2R0L2VncWpENXRzKzNOWlYrbXZLdGs2c2pB?=
 =?utf-8?B?VllLZGd1Sy96dXlhR1UvU2F5VlhhU1VXNTcxR1hXMXpQYzk2bmpub2Y1eU9t?=
 =?utf-8?B?WUY0MFBkeHUxckNKcWYvcXV4RWpBOTZRVGlsWTZWdlA4blo3Q0c3QnhFWGlO?=
 =?utf-8?B?VExUZ1JrRzBac2RsZ0FVSW9TNmVWcGkyNnJKYlEybkRkVWpsdTU5RTRka24r?=
 =?utf-8?Q?DeXY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:26:12.3910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f108c6c-99c8-4f19-4184-08de23a2e878
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5812
X-Proofpoint-ORIG-GUID: 5MymalhWBt1SlR7GNxVmHf2IZZQB9y_8
X-Authority-Analysis: v=2.4 cv=DPqCIiNb c=1 sm=1 tr=0 ts=69176637 cx=c_pps
 a=TxawlT2aps0DIllr65uazQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Ml00H7WYq3aDj7q0dhMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE0MCBTYWx0ZWRfX4GXPSwMMzmWk
 T6QjPfwndw9ouM8DHIz3tMx/5jVscz2wUYce7VLHFXtvibT8U93gHYFTotBfGXBc76nrM31HS1e
 d3RWMwPG/eySe2B6mCzh+3bRcXzMD1BbIahLfX6Zf4lGCDXXEmralmYf/ZkaxDUT8Xyfkf25IJt
 AiMSQjLujGNyq21F1wqvTneXmswL0aicvobPtRbwmuPTfadWhg8qppaJFe/UsJKfPVChujFdBE5
 Xzyctx4STauRLXLkZ/gBI3ooWpNxDBvLpOm9WNjOhPzPKVBatKpJ4Bo7VHpfdSr/85QLFg0SfYM
 aONOJXZfoUYT6jBnhAgWKFpn8+4VsdcUkYwBqPNQNcckkTNXYhPro8XoTi2r0BLSP7ev7AyiB5O
 HJMjU9yNLvqbJxnOnt16VVLEdPzkCA==
X-Proofpoint-GUID: 5MymalhWBt1SlR7GNxVmHf2IZZQB9y_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140140
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 4/6] ARM: dts: stm32: Add boot phase tags
 for STMicroelectronics mp13 boards
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi    | 21 +++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 11 +++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index fd730aa37c22..26c3b5529582 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -35,6 +35,7 @@ optee {
 			compatible = "linaro,optee-tz";
 			interrupt-parent = <&intc>;
 			interrupts = <GIC_PPI 15 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+			bootph-all;
 		};
 
 		scmi: scmi {
@@ -42,15 +43,18 @@ scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			linaro,optee-channel-id = <0>;
+			bootph-all;
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_reset: protocol@16 {
 				reg = <0x16>;
 				#reset-cells = <1>;
+				bootph-all;
 			};
 
 			scmi_voltd: protocol@17 {
@@ -88,6 +92,7 @@ intc: interrupt-controller@a0021000 {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		bootph-some-ram;
 	};
 
 	timer {
@@ -131,6 +136,7 @@ soc {
 		#size-cells = <1>;
 		interrupt-parent = <&intc>;
 		ranges;
+		bootph-all;
 
 		timers2: timer@40000000 {
 			#address-cells = <1>;
@@ -791,6 +797,7 @@ rcc: rcc@50000000 {
 				 <&scmi_clk CK_SCMI_CSI>,
 				 <&scmi_clk CK_SCMI_LSE>,
 				 <&scmi_clk CK_SCMI_LSI>;
+			bootph-all;
 		};
 
 		pwr_regulators: pwr@50001000 {
@@ -900,6 +907,7 @@ syscfg: syscon@50020000 {
 			compatible = "st,stm32mp157-syscfg", "syscon";
 			reg = <0x50020000 0x400>;
 			clocks = <&rcc SYSCFG>;
+			bootph-all;
 		};
 
 		lptimer4: timer@50023000 {
@@ -1003,6 +1011,7 @@ iwdg2: watchdog@5a002000 {
 			clocks = <&rcc IWDG2>, <&scmi_clk CK_SCMI_LSI>;
 			clock-names = "pclk", "lsi";
 			status = "disabled";
+			bootph-all;
 		};
 
 		rtc: rtc@5c004000 {
@@ -1020,6 +1029,7 @@ bsec: efuse@5c005000 {
 			reg = <0x5c005000 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			bootph-all;
 
 			part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
@@ -1646,6 +1656,7 @@ usbphyc: usbphyc@5a006000 {
 				vdda1v8-supply = <&scmi_reg18>;
 				access-controllers = <&etzpc 5>;
 				status = "disabled";
+				bootph-all;
 
 				usbphyc_port0: usb-phy@0 {
 					#phy-cells = <0>;
@@ -1670,6 +1681,7 @@ pinctrl: pinctrl@50002000 {
 			ranges = <0 0x50002000 0x8400>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&exti 0x60 0xff>;
+			bootph-all;
 
 			gpioa: gpio@50002000 {
 				gpio-controller;
@@ -1681,6 +1693,7 @@ gpioa: gpio@50002000 {
 				st,bank-name = "GPIOA";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
+				bootph-all;
 			};
 
 			gpiob: gpio@50003000 {
@@ -1693,6 +1706,7 @@ gpiob: gpio@50003000 {
 				st,bank-name = "GPIOB";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
+				bootph-all;
 			};
 
 			gpioc: gpio@50004000 {
@@ -1705,6 +1719,7 @@ gpioc: gpio@50004000 {
 				st,bank-name = "GPIOC";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
+				bootph-all;
 			};
 
 			gpiod: gpio@50005000 {
@@ -1717,6 +1732,7 @@ gpiod: gpio@50005000 {
 				st,bank-name = "GPIOD";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
+				bootph-all;
 			};
 
 			gpioe: gpio@50006000 {
@@ -1729,6 +1745,7 @@ gpioe: gpio@50006000 {
 				st,bank-name = "GPIOE";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
+				bootph-all;
 			};
 
 			gpiof: gpio@50007000 {
@@ -1741,6 +1758,7 @@ gpiof: gpio@50007000 {
 				st,bank-name = "GPIOF";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
+				bootph-all;
 			};
 
 			gpiog: gpio@50008000 {
@@ -1753,6 +1771,7 @@ gpiog: gpio@50008000 {
 				st,bank-name = "GPIOG";
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
+				bootph-all;
 			};
 
 			gpioh: gpio@50009000 {
@@ -1765,6 +1784,7 @@ gpioh: gpio@50009000 {
 				st,bank-name = "GPIOH";
 				ngpios = <15>;
 				gpio-ranges = <&pinctrl 0 112 15>;
+				bootph-all;
 			};
 
 			gpioi: gpio@5000a000 {
@@ -1777,6 +1797,7 @@ gpioi: gpio@5000a000 {
 				st,bank-name = "GPIOI";
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 128 8>;
+				bootph-all;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 9764a6bfa5b4..a05d458c9b37 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -517,9 +517,20 @@ &uart4 {
 	pinctrl-2 = <&uart4_idle_pins_a>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	bootph-all;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart8_pins_a>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
