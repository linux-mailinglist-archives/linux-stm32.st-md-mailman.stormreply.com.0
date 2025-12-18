Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31174CCB783
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 11:48:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC771C597BF;
	Thu, 18 Dec 2025 10:48:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 651C6C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 10:48:56 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIAfQsU1646882; Thu, 18 Dec 2025 11:48:47 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013061.outbound.protection.outlook.com
 [40.107.162.61])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4esu0e5t-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 11:48:47 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJI8//AsALCM2Izi1sMxQhXF6b3nc+1b6MEpk2pSuA6e/sjjGw+uA0CVMsHbEmECtjLFwYA7mI3Z9Pjgx8t+ElGqmgbKdJoeW3JqgQOCBnnmGdMscCJs3/fzpYGHfH38v2KSXHw6RjVhRf+Pa9TX7pZ4YpCSake5Nj3C6HVa+p3o1LZ1bJNoymJGPAFaukkfN6G0ANOb0aoOyoQoUzXc+D5mb0F8aMmVtXkMCLBGa9FLHM2PmuzyqcKFN0Xg7TM+bAaUA28KNsrjoDexCtU/gR8SUdSYvvq8YojXvgUms2nb+0lEF+5HOabktMSKFYHmNA00pYVfS4hXBEojKgWQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Use63C3G4R6YDPmF/jDp+/NCCmb5SwBBj4HGdwqdNi8=;
 b=WeDKPcaUJqHV+MFhVkUap5/oBKjH5hYue8jJgdcs10+fxUgAvXxll4D0DdBATNOoGlOB5rf6WgQWCztnvCjnMJYdZVj7u5wa+cWDBZyK55T9ZmhO4dvfCYSemBPu0uOq2wAWANGYl/RSkaOOntS8RJoVF71u40/h1wKFBXxlFOwcT+DYHWMozsKOhy/wrpWe6F8DmMurpYo8vKyL7wUu/ot6BxJ/oRNxG32Q1WNONBo1wOEKRHcss0u1zv9g28iVnkzv0SdSBW96vPqcohXh/gtOM2YOzz6SETu2hZ/29RqKv9unHKY4QA+m4cX17H3i3cfXxIaIwSuI2ayj7CVs2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Use63C3G4R6YDPmF/jDp+/NCCmb5SwBBj4HGdwqdNi8=;
 b=MmdjWutvjmRKcR8R3Hplh+Q8rz0ZflwjR9Zd6baWXIodJNNp+DhW2meS2V13uZUQ4lMUqQO+w66Ja0qlipKXM+AMqv/ZeHuDLJItkqZUdX3UCCdjYX2rerDslXtdwQR+QVYrR/NZ32S3TgrxBX8YgrgSDHsnVjpfVi/Lk4lbhf5gYfAyeLpE5q8cWAJCQY54OfRr0c0U5Xcgf2Xf4IkVVlTJLPP0nk+t2+w2298Nj8maYRXEBXlYjRWPOzHQqpkTrWHlBOnkvmGtFHy473pqx4umOZAib/6TiOKGCU1gTDDcwC0A3SgFWbqknbsamNEEQHmpHIZMeDgDhRVgqirF6w==
Received: from DB8P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::35)
 by VE1PR10MB3952.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:168::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 10:48:45 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::94) by DB8P191CA0025.outlook.office365.com
 (2603:10a6:10:130::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 10:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 10:48:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 11:49:30 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 11:48:44 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 11:48:28 +0100
MIME-Version: 1.0
Message-ID: <20251218-stm32-spi-enhancements-v2-2-3b69901ca9fe@foss.st.com>
References: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
In-Reply-To: <20251218-stm32-spi-enhancements-v2-0-3b69901ca9fe@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.7]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|VE1PR10MB3952:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d6cb11d-81f9-4b01-edad-08de3e230481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmZnUlQ1d3dheUFaajVyR1VoSnpYRFJNNmYxbWlKSXFRanNKRnRsL2p5ck1h?=
 =?utf-8?B?UW5XN1IrRWh3c2VZTkJOTExWdjgwamdqb0kzVUZ4VDhCZW1DeXdhT2RpYVNC?=
 =?utf-8?B?V0FrS0VWYzAzZDFvVkN0RG1OaGRqdzdjQm4vcWFob254N2lKS1d4ZzJwNjFQ?=
 =?utf-8?B?WGF5ZERLS25yUk93ZXZwbm1renRsWXVEZzVXejR6U0xCUC96VDh4cHMvTHhu?=
 =?utf-8?B?bVdtc1M5WFhUcHBIYzY0VFo3STVEbG5BNkVGTGhxdVVIOXhuNDJaWXFCVzNh?=
 =?utf-8?B?VjgrUFF4ZXJWSUhyMEhKZXM0UEhpby9zVkNaSVAvUy94c09saEtpVDJObklu?=
 =?utf-8?B?L0hLMklDYllCbjhXMXR5ZkpKbjdkOVArWEVOSzMrZ2svNXN2VmhCTThJTnJv?=
 =?utf-8?B?V1VKVElCY2haZEF4aDBYb0l1bU9kU2RlSGxoS0UrNmVGODExVDhKSWN3WEZr?=
 =?utf-8?B?eUZZaVR6VXFscnlSOGFLNzVlZWQ0d1lJOU5ISWh4NFZPTkUxZDBRQXBJa2l2?=
 =?utf-8?B?d1JyMGdzUkFCRytLMzY4NWE5U2tzNnBoeEQ2NUZ6b2tpYXRmTmx6THRSem00?=
 =?utf-8?B?ekNsaXJuWHRkWnRVMDk3K3NmZUpvc2ZhLzE0TEREUlRWUTZvL29NRzN5WDl4?=
 =?utf-8?B?WlBBTUtyRmdYSFY4a29NRG1DVUxoZ1BEYldCbmdQRG56OXNSU3EyN1lYZDhC?=
 =?utf-8?B?RTNYaGNIQStFVkJURFkyS1ZoZmFXZGF4YXBxQnRrZ1owYkxKODZKdEZNTEFy?=
 =?utf-8?B?V0drN2FWVHBrb0c1WlZyMzgxbGE0RDZoaWRnaUZtamc0K1BNQWNUU0hranJV?=
 =?utf-8?B?WnFrRnRWcWE0anY5Vk1XOXptcUI3UWtYdTY5c3dPdElHQ1gyVlhZUjFZN2VT?=
 =?utf-8?B?Sk42SWc1RmdsVWMwa2VXcGxydTBjbGRYN0UreDB6di9pL3JDVmlWdUErOTZZ?=
 =?utf-8?B?VTcvV25od0VZcm44cEw4MStuUnYrZm9aQzVLSTJ5VC9hMFd3TEkzeTlRRW0y?=
 =?utf-8?B?Y3R6TE9BZHhjbDZDazFxd2REVFFPVDhtdU4wcE9sTmxHTmpmbjRtcXNueVRa?=
 =?utf-8?B?eDBNNS9mYjZSTDFrZFExRzY1VWdEQWNhL2VSeHNVdUhmd1ZkdXBnVjVUbFo2?=
 =?utf-8?B?UGNTcDdlMExycXZYV2tEMmZrWnpDVFR2Vmx4NzA2M3kzQWpBSmZjYWIvZTJJ?=
 =?utf-8?B?UXY3YitFRURZQm5hMzNYU2pLN1lDaHhROXRiSyt6RDRCTWdiT00wajhCSGFO?=
 =?utf-8?B?L0pjSW5ISi9DQm94Z2MrY0QwU0VFTjJWTUUxSGVyQWVqQWJ0N1JRNzhLak9B?=
 =?utf-8?B?M1BaNHVLTXZDYVd6U0p3MDh5RFNpdm5NeG5QZkZXRGJjdm5VcFZrZHVyQ0c1?=
 =?utf-8?B?eXJwZWNpcTBrNG1qZUNoOVhyejd4bm9iOTZ4K20xWUpIVytQZkthQWFreDFB?=
 =?utf-8?B?SkFUZW9SSUVKRStCZmpmbzFyNGZhYUlPVWxNMHp1SkgwRG5NbVg1T29uZVFr?=
 =?utf-8?B?RmhiQ2lQWEFPT1ZUdmIwYnRaRmpuV2VNdFNQNmVMNXV6eTI1UlZ5Tk84Q1ZM?=
 =?utf-8?B?S0RiaHZXTkRYZEdoNVhyZW9zQzJmNHZ0eVZwUlcvNDNvNmExaFB2UmxGemw3?=
 =?utf-8?B?bDRvYWtGWWhJakY4WjR0d0w3ZUt0TDgxQjZna08xcEFET1VYQTlOUk1jRFh3?=
 =?utf-8?B?M0Y1bXE0UnZuZ1NDcFBUSC9sRkZBU2FQRkpPOXRhYTQwb1lqc2tTejdoZUNa?=
 =?utf-8?B?SDUxQU9JUDByQWVwY3ZWaWRlbUpxS2ptVXN2L0Q2b2I3WUFZSkppVHdBMzRC?=
 =?utf-8?B?V2VXL0Q3OWszVWxrRDFhWEhvSjhYdDNhTHdBaHp1QS8xeW81Y1oyOWhPbEtp?=
 =?utf-8?B?cnkyM2h3MlpHaUFNUDI5SU9JREdaa0MzRnJBdUlzOGp2Z1BnamZWOHRSOTRL?=
 =?utf-8?B?VXE4SWNjZWVCd3FvbVFCNzdqd2hadmd5dno3MlllcHk2cFRGZys4eGdaZlpG?=
 =?utf-8?B?QmEzZmNqbXRwQTlBa1hPSHBBeTJnUVlYL3k4NHBnYkdkYUZzeUZENzZ1Y0tE?=
 =?utf-8?B?aHQ5VklzZWdOZ2FyUVRoMEhueEkxYTRjWUQ4SUJJQzkzZFhuaUJxajNCZmIv?=
 =?utf-8?Q?xIz8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:48:45.2547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6cb11d-81f9-4b01-edad-08de3e230481
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3952
X-Proofpoint-ORIG-GUID: g-XAvXQeRJxnDADa3d7tVvRpZfv-553K
X-Authority-Analysis: v=2.4 cv=EeLFgfmC c=1 sm=1 tr=0 ts=6943dc0f cx=c_pps
 a=ryZca31HZVFZanq5R5fIDg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=XWWnaGIsyUaM4A8MAfMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4OCBTYWx0ZWRfX7J3bXAsMj4yk
 RIu0F5Hkh7mYRQYnJ9qDqOMjyGdhbcuE4+xzlJzrd1u1eH3MDPmRrULhqGVUqsBnhMqFlx3vCCb
 KVU9wYyPcMcShK2Fm6kGIosIaqom+hwVMopQmuj9xujk55Zgsl5OaF1dTebAPRuc+kUv8Xiv36d
 0sVxv7OB9aSJ/YptLJ24qbALY9Svi48Ml51OWAKAsIZ7aZJ4A7NcXL7+U7JJcpSEgUc2upe6ydJ
 f7ijeBdlE3U8jndjDqYgD+FYBB94+VdgxEL1JX+6nMtFtM3E6LxTk4UJ6VALDnfJjVf4z69gRB9
 LO9oI3JWdjuTpjj4ZQEiJ+w1GcRr7fRvxJF5uKSAChGZ5PElLvB7ACgQXBApvwPNwoQL29CmnMK
 wyjSV7UvWnZu7GYYA640aEByLzqmRg==
X-Proofpoint-GUID: g-XAvXQeRJxnDADa3d7tVvRpZfv-553K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180088
Cc: devicetree@vger.kernel.org, Deepak Kumar <deepak.kumar01@st.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/4] spi: stm32: fix Overrun issue at < 8bpw
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

From: Deepak Kumar <deepak.kumar01@st.com>

When SPI communication is suspended by hardware automatically, it could
happen that few bits of next frame are already clocked out due to
internal synchronization delay.

To achieve a safe suspension, we need to ensure that each word must be
at least 8 SPI clock cycles long. That's why, if bpw is less than 8
bits, we need to use midi to reach 8 SPI clock cycles at least.

This will ensure that each word achieve safe suspension and prevent
overrun condition.

Signed-off-by: Deepak Kumar <deepak.kumar01@st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 40651b6050f6..ced6d7b215b9 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1906,11 +1906,12 @@ static void stm32h7_spi_data_idleness(struct stm32_spi *spi, struct spi_transfer
 	cfg2_clrb |= STM32H7_SPI_CFG2_MIDI;
 	if ((len > 1) && (spi->cur_midi > 0)) {
 		u32 sck_period_ns = DIV_ROUND_UP(NSEC_PER_SEC, spi->cur_speed);
-		u32 midi = min_t(u32,
-				 DIV_ROUND_UP(spi->cur_midi, sck_period_ns),
-				 FIELD_GET(STM32H7_SPI_CFG2_MIDI,
-				 STM32H7_SPI_CFG2_MIDI));
+		u32 midi = DIV_ROUND_UP(spi->cur_midi, sck_period_ns);
 
+		if ((spi->cur_bpw + midi) < 8)
+			midi = 8 - spi->cur_bpw;
+
+		midi = min_t(u32, midi, FIELD_MAX(STM32H7_SPI_CFG2_MIDI));
 
 		dev_dbg(spi->dev, "period=%dns, midi=%d(=%dns)\n",
 			sck_period_ns, midi, midi * sck_period_ns);

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
