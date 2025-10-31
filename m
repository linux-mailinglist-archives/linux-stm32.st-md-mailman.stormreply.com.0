Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF6C24503
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 11:01:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E88A4C57169;
	Fri, 31 Oct 2025 10:01:19 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DD9EC1A981
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 10:01:19 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59V9xj8O4116008; Fri, 31 Oct 2025 11:01:06 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a4sck8gfs-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 31 Oct 2025 11:01:06 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNvgLEZNQzG+UvL/RWpwe7mEGQUTAOXoZhW0QMWuZS/SRBeBu2pd2mk03Bp+t5VoUWVUPrUd8xs9XlG+fjgZ62HqsvjaTb1AY9orUScwChcaoffA3D+doBgwlsxWwIcFx9TGAHkvvSOa4BnSdmVzpgHb6388SCDzhx/SBWpcdr2CFh/p1PuG1hFUg4z1+qt0lg43tlVSldnCXIxBOz031BstO2NRgRAChRnGI19J4udrPRRTCg0ViwYOwQqji1qD9rswY/MvJbbzort8G3DDLbR0e20D1QN/8uX+DXUI3move864dSMjRpiaFy6mhvlqezRtEKBh5FPkctu4jvWeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRVyQ7sE4vlPSsVTMuHJUeL/050zjJ6+tdOF4hQnpck=;
 b=v4YRImi6yMCbs33gNTL4Z2xI1jb7otL4hc3VMkkiHXRR/y7LrEl5WEj7+4oPr1xdt98yucfxya041NKoCVcY3fZKJjwa3PZAHitUsJmVFryc+dsiuRje8WgQ1APcTPXu7+NCoIEOpfSPhtX/DaRDfWS9hO+1dcFFBK74+yT5HFJR9LD3E1PHF28916FgUurjjJ1Lf6mo7JDXu+Fh4dJZ52Z2q4MA2Q339zt0adqSqj0YYBdm2+mF5rXN4AsESgCQLyq0nvT9+XzZN2//pH8mlVH0B/3kKVMA5Wx6AYA0bwGcGuxWiATruPXHeuzWekUo4cJ+62fxx4Uh6SCcZNfD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRVyQ7sE4vlPSsVTMuHJUeL/050zjJ6+tdOF4hQnpck=;
 b=Ywj8VUtEZfTmq5XNmLipIkKGadjJAxhmuXlkeIl+M57siVxkNr/YJDJgO4AdeyOG9pQ1+h5SzhN4hOSu5unW1A0iiz+LXKBGOcjjrOSPYFz35I/kEFEcsX0WAUIFm4ZXgSpwZs0dgkOunHjV8dN7GlLc89KaG7W0Gp0qUtszBXJHLkrhVwvM1Xb1hzv3eMa/bWclvgfoZXqxSysgk2gkFVUX/UpAnvVFyhHPB5uXSD5GIb7mtD5vJUanufSByZcBk1KZBnATTFvj/WJfFkvQmEsJ+Vj6GnuOZOflHc9/jwGyPvWcv0ufnwsbyOk3pj6HjupvfyzvopKMFYjbedDLRA==
Received: from AM0PR02CA0152.eurprd02.prod.outlook.com (2603:10a6:20b:28d::19)
 by AM9PR10MB4133.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 10:01:03 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::71) by AM0PR02CA0152.outlook.office365.com
 (2603:10a6:20b:28d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 31 Oct 2025 10:00:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 10:01:03 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 10:58:46 +0100
Received: from localhost (10.48.87.185) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 31 Oct
 2025 11:01:02 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Fri, 31 Oct 2025 11:00:41 +0100
MIME-Version: 1.0
Message-ID: <20251031-iwdg1-v2-2-2dc6e0116725@foss.st.com>
References: <20251031-iwdg1-v2-0-2dc6e0116725@foss.st.com>
In-Reply-To: <20251031-iwdg1-v2-0-2dc6e0116725@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.48.87.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|AM9PR10MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7573a155-47d6-4567-9e06-08de186466a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUFDUFYvNEhrY3RzV2xEQUVFa1B5Z1padDVhRjNMWG53bjlucEZvNGNSWGNN?=
 =?utf-8?B?MElQbVkyamRvSmpVN2UzMTQvZlowT0VnSjAweXhoN3pGa01BMHhKT1czaVVB?=
 =?utf-8?B?ZzZ1dlFuOW1haHErYUVxeW9zQmpleHdSdDZrR3JEdG9VcnpYcU55UWozTUQw?=
 =?utf-8?B?aWRnbm9wb3MxajAxSU8vdERCMXZUTHRMS21JS1lFQU9Ud1dTSmVtRitiS01O?=
 =?utf-8?B?bXpHSGZQbGRmbm9hNVdCemdFUGdPRTNidlZUSFU3SURrYmxoMTYyNGpncTZy?=
 =?utf-8?B?NFFpZGdaYXdBbDVKeHM0MXBuMmJzc2FUZVpLYTNBT05BZWY3Sm84SkQ3RHI2?=
 =?utf-8?B?bEdCSXV4ZFJUS0NYdUZoQ1YzNzQ1ODczcWhPUWNOYS9aNUxHbk0xc3EyQ3pZ?=
 =?utf-8?B?S1hPMjYzQWs2a1hESDAwSDZFVXdOZWdYdHJCKzcxdlFyYkFxWVBHZzFQZjRJ?=
 =?utf-8?B?aDlmbHRxZXBBVGNqNVEraVIwVHpqSGRrSTN3R1hVTnRXRm9XaG9SeTJ3eVpL?=
 =?utf-8?B?VUxpTTNzNGIzV1lpL1RuR294ZkNmVGpubGdJeXU3d1Q3Q0YzdXd5N285andy?=
 =?utf-8?B?MXVkOWlTVDRuSjROWkhXTVZmTEtHTnJpYzFBNEpHQkIycFMyTWtHNzc5ZkQr?=
 =?utf-8?B?a0V2UDQ2OFNSTE9mcWlkanlBZmFyWXljVXZEWUpQS2JmQjltcEVmTi9kdFVi?=
 =?utf-8?B?YTBGS3Zwc1ZpZmw2UktqaGNUbndmbkxBQmc4NU9MSERwNTNjWmZuMjh0dXVT?=
 =?utf-8?B?TVJlTW11Nit1ZXEwbDhrTkQ5QWdQc1lTMXFXMG5GQ3lyNlZsZmhNRHZqNEZ4?=
 =?utf-8?B?SFMxVU5BRDZjb0I0Mm15K2ZMN0lCWEszZ2I0bHRIMi9xMWJ4VTdRY0xrRnpp?=
 =?utf-8?B?RXd4MVM2cWJWNit2azdkeGhNVFFPUUlDbGRhdURQODdYM0c1dTFPbkUxRmtB?=
 =?utf-8?B?K0hFUGdaKzMyeHE2NXJjZTRnUHB4ZFpCUVJRSy94bk5wL3lsMGQ3NFQvNmdn?=
 =?utf-8?B?MWdGR3crTnRoVDFnQnM0WGZLdVZIaHNnUE82U1ZXUUpJaGVyMnpyK0pRakdQ?=
 =?utf-8?B?bGRjVkJsRDI4aWlFTTVWNFBlRUtGd2hrV2lEVFdvL2w0cXo5N3RJM1N3ZVBQ?=
 =?utf-8?B?TjNZWEdveXpyWWs3Um1KMkdNTUUrLzlOR3RTdUxkTjhRcDRIZENPWTRiNFBJ?=
 =?utf-8?B?aVBzZlloNmxud0hrcHJPK0ZscDdWNzQzeGpPemVNS1dLQ21OdWtXWHRYQUNO?=
 =?utf-8?B?TzdGSll2eGRCWHkzRElRZUp6YjhxL0UxR04wTjVmNkpOVnVxVk84dmYxbjlN?=
 =?utf-8?B?Nnhqd3RpellEZnBEazZuWmpZUER2UU9TSTVyN0dQQllDd2tNS1QyME5jNktl?=
 =?utf-8?B?dVBIeS9uZzYzQmZQZ2lTYk0xK2c5emdoUjc2OUxKQ0dqd1pzb2hFalJEYWVO?=
 =?utf-8?B?U0Y0cFVEU2FxRFVzeUFwbklRYmxCOUEyVitHT0Y3NlNBYkp2TUtEanl2Uklo?=
 =?utf-8?B?TFVwU2ovYTNad0dZVHZYSU10SnpIZjUrQ1l0ek9FRlBEUE16Z0pCQzdTdkRa?=
 =?utf-8?B?cEIwSGd4NURYMmJ5V041R0djbzEvM3NVQVNZMzFyR2lPVEhQVDJ0clZDSzBM?=
 =?utf-8?B?VjRNUWlNaDk4bzNGUXRoamtVZVBrRHJWZ0s3ZThGUVV6MmM2WS9HTVpocnlF?=
 =?utf-8?B?dzlremtNbkdPYmoyOFdZeFQ2NVlNUUVKaXNRZDZENnFlaUN3RG4zU0M4WVc0?=
 =?utf-8?B?eXc4MDladWhMQWNsZkNSZHZUS2dYWktXTW9rNkoxYXFIVC9qdjhVUUpseUhM?=
 =?utf-8?B?VzlJd1UwRU8wdDFJV2p0YmYvZUJuc3dIYm5pd0Z3YW9aWUFndFcxSkoxblFC?=
 =?utf-8?B?OVdlUEo0K2ZRRTRyNnlwNHo0M0pWNEF3NmZSWTJUbU5vSWpKalRGTWhoRmFs?=
 =?utf-8?B?S1F6VHB3YjI1Zk5jaDB3eDFmM2xlNk9KUG5YM1dVVURzR1NPOG9YUWZML251?=
 =?utf-8?B?V0pUSlhIR29KVGxnbVVKSG1idStHY3lMeStaSStMYWllS2MwNFBUTDFaakJy?=
 =?utf-8?B?eC8wWFdERFIxQzV2SVJIRGlWbFZhbFkwN2dudll6VFgrZGFYc0twbDdjb0hK?=
 =?utf-8?Q?DRG8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 10:01:03.0060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7573a155-47d6-4567-9e06-08de186466a3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4133
X-Proofpoint-ORIG-GUID: FD5C7-mcXIvpleRnwHNSvAfzm_cHXcSN
X-Proofpoint-GUID: FD5C7-mcXIvpleRnwHNSvAfzm_cHXcSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA5MCBTYWx0ZWRfXyJ2vM0dpisIf
 nwiqY55k5ypcp1+kJc/mG8LQmq0V/pLbpprtyDff+o2kWt7qpQR6MyiOvtmy6uI1WyhE8LLvKdl
 e2axO2Cmw6Yv0VZC3UZCVPs1mqak70z3r3dobjwqOWWj2gv7rATOfWhUp/aC0llUvwWJzN/wlv4
 3GWwA+vyvJYn8iarkVBgzKgX+KdCqIzxD4G3EAIGU3qqeYhElDyuW+Zgi1ykBJ/gz1//Zx47Vun
 KDNzRWeAu8qd3xOBG1s9hnzoqI42Z9WkwoYZDlu7Ex4T6xHRcgTWvKmG2Boij3ph/cOLPIZRGhi
 fQiSTjZ7c1KeyBHypw8a5rgaWCDIhlVfBBD5vjrhmlMJWUEH2iOsBqeCNA/gJU7i+zgUvtZ3/1l
 5Rw0cnmZSfeToneBSRaNAOmYTIDxsw==
X-Authority-Analysis: v=2.4 cv=a7Y9NESF c=1 sm=1 tr=0 ts=690488e2 cx=c_pps
 a=zl0lK08+uPTYLSgcG3rUMA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Wpbxt3t0qq0A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=2HN7e8rGrflJ3QlucGcA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310090
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/4] ARM: dts: stm32: add the ARM SMC
 watchdog in stm32mp131.dtsi
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

Add the arm_wdt node in the stm32mp131.dtsi SoC device tree file. When
the platform watchdog is managed by the secure world, SMC calls are used
to interact with it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index a18da1a04fe3..6506b9109b90 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -29,6 +29,12 @@ arm-pmu {
 		interrupt-parent = <&intc>;
 	};
 
+	arm_wdt: watchdog {
+		compatible = "arm,smc-wdt";
+		arm,smc-id = <0xbc000000>;
+		status = "disabled";
+	};
+
 	firmware {
 		optee {
 			method = "smc";

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
