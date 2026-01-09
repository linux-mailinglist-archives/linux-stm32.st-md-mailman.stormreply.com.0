Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E6D08281
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 10:22:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24E49C8F289;
	Fri,  9 Jan 2026 09:22:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1102AC8F287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 09:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcSO5jXjmuVpDn6ra/zbtmaehVi4Ukc45IU7xnsr6B2WXtfoOHG2BpZXkCLakDNwXCjUD/62gUkVDuvQp78VLL9j4bIHR6xCc8aqNosk8x8VnArQFGlJ8+E5sradDV+33iNNOdgvmVVN9psGg4xGfMmkfu/yFHvORe4B29mFbqM76cVorbDaOp1wL8io70rbvuqjE6M+jTPdvkRU9okWUb+aruHL/jBhFyxF7mDlSh6SAWDaKwzGLEObwfFCYYjvzqAEWSEMZO4JRkKaFAETJjVOw8xMt3+XdMiU+IpPdnMMDvPiSs7a0fIUt6z1ERXcw56lt2rxn6L6XzIoRrViXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=;
 b=FjQclJKNVN34PA6IFGW1PLZZzHgrcCA9TDZphRDLepUqGYCtOeXaw/BCvDAgRQiGnEblVIdAoAilXKj91/hCky/VaFbkb374m1HdUT0Yrak0G9JPMqFo0ubq2fYxa05DuFozvmyme0T1ORXMh8NXjia+PdHPXfuOTd3P+dbAngPYkEhWKVUzMBJ0WBmlyn4PKzRdb+gelXg9pGGHkQ6QQGvLHKQ07WSIzt7iI5SWQOjRPm/06L9kKj0Bp92l00XWotpIyZd8LkXNS5HW3Q/lmvRy/JNf+sgWeBn5J/J2zBqx/dBz16glhiUbNIfHeE/RW8wANg4GDll7jnIJ3shTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YExCqRFrfDEsaunpy04sLQ8JOdIM85t5EPyjuyqYBAU=;
 b=BaZDdppKwmRH6lkl8JIJg2zsaupuxcMKgOkIvyWAuVzkQwDZTIT9hwtvm4g949QtYZRUHSeUtXCOMVsVNu4RtB2sdp8TshsoLilpXUcdO3IOMjduHI7NLZZ6G7Db0lXExYTNJ7xTEhY91JDpCC6XirXu1mTrglCp3SdZgB1uutf6dYpXLL3uo22ZPlzdXb6azxw+caz5FOcAYHkP05bBeKBei9Tfkm2nsJL3xPvdQ+lqeYNfo57WtAcrKVpJ8X7l5aaTOVYnf9vDmXyt3h31+hqmVfNgDKripEb+NFl6irnNdj0yPjaKR9MjSeHKEon266B3q84/mZ4jD6BFRfO9oA==
Received: from DUZPR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::7) by DU0PR10MB7168.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:44c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 09:22:50 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::66) by DUZPR01CA0014.outlook.office365.com
 (2603:10a6:10:3c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 09:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 09:22:50 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:24:06 +0100
Received: from localhost (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 10:22:48 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri, 9 Jan 2026 10:22:47 +0100
MIME-Version: 1.0
Message-ID: <20260109-upstream_uboot_properties-v4-3-75e06657c600@foss.st.com>
References: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
In-Reply-To: <20260109-upstream_uboot_properties-v4-0-75e06657c600@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009526:EE_|DU0PR10MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 811aec03-6455-4abe-dd9e-08de4f60a905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3hiY0NXR2RkamxJb2NPZTRQTk1zUisrdlorRmMvUG0ya3ZHNnlyZHRaNUwz?=
 =?utf-8?B?UjVyU3U4QzlGckJLRHo3MnIrcjNDclBQTDc5OFdzRk9HWndyM05tNDFjSTdO?=
 =?utf-8?B?M0NtV2NzOTFTTGZqaGhLQnpYUnpHZStmL2xtRm1DN1hxOFY5a3JpQjBTSVZo?=
 =?utf-8?B?aGNaMFljNmdhSEZuQjdPS05ZMFpjS2lpNVBwMGJOUnNwSGpVU3dUcWFNTFFK?=
 =?utf-8?B?elh3aTBvNVJGcnU4M3F4UXFPSk9kajd0Z0FjV25ldlRBeVhiQStzdDUxMVB3?=
 =?utf-8?B?b3Z2VWE4cVQ0bldpRUJzZzRyT1lhYTMwbk5TNThOcSt4N09pOFJCdWZGRHBX?=
 =?utf-8?B?RkNiQXVxVmlHajYrTm9wWHJFN291ZFZXbEFUVVZQa2x5YWsrbGxGck83MFNz?=
 =?utf-8?B?cStQMHRpdk9jSFZ1NFcrRVRjY2NjQkdNbnRnd2NXN3JubTRML0ZVejd2WHZX?=
 =?utf-8?B?ek1EbklOWmZrQUxUZmoxeDJDWDdoTnUzZkt6cHBFRmF4bmRoT3VRaERpUlhv?=
 =?utf-8?B?MUZwcURaKzhuRmprVTMzazJ1c0Fla1lHbS9oaUI3cnV1Z2Q0TFo0eGlMM3dU?=
 =?utf-8?B?QUVYMzJUL3JPMmlQVmFyWFA2YWFYWFN5b2M3cTF1Z3JQeTY5ZjkvVmdzNUVu?=
 =?utf-8?B?Q0tWNXlPMXlQaGhWQXZNaVhnM3lJU2RYd2pibEJBY0RrQTZ0MnkwQ212WjMv?=
 =?utf-8?B?dm5oTlBHRTRGY0cydFZiSHpOQlJTUXhzY3RnQVdSbnJ4dm96ZjdyUlpEUktk?=
 =?utf-8?B?VzFkazRYUXZXcW9FVGEwVGJhNk5tU3FYc3Z6Mlpac093V0U5Rks3L3BLL1FS?=
 =?utf-8?B?WXd0cVdiTGVhRGRVaTFVKzllR0hsZ2VPWUJNNTlBdW5QWTdzRkxCOEFzTkVE?=
 =?utf-8?B?ZkRQaExnUk1ZMlpIZHd5cUZzMkVQSWxXbE1OR3AwTzEzSGplZUl0TnA1Rkpi?=
 =?utf-8?B?UkYzTzhrM2o1T2N6MUtna1dvc3IrU0V5d2grcHRvK3JSbUpLN3h0V3ZrMGxm?=
 =?utf-8?B?bXpHa3U5b0UwT0VDdWN4NkptV0JnajI2Z1BCblg5QVl0dHhSa1Y3Nk96MEUw?=
 =?utf-8?B?amlHRk1RVWdYdXM3UlRhczR4NXZ0dTNBbWY3ZlNuLzllVlI1aWpUcU44UGdm?=
 =?utf-8?B?eHJPUHNYb2pOdGF0a0QrWjRmKzAwaXNXZ1l0YnlZTTl4L1U5bVU5akNWRHdl?=
 =?utf-8?B?VjRnOElVZkhqSVVVWjFwZ1VpTXRBZlNPakM0N2t4Q1dOM0gzZVdhYzlINWJB?=
 =?utf-8?B?bnFBc1Q0QzF1ckV5MWtoeGhndmtxZEtIN1VxTE5YRk1jci9HcUF4c1lDUVdp?=
 =?utf-8?B?S0RWZWZaOVJabHpSZlBwMlp1VEVFenhNNWxSNnVHNTFTNSs4SDF3MEptK2pJ?=
 =?utf-8?B?NEVSbldVbFgxUEZOS0tYaHJ4cnhVcEJJM29QUWZqK1pNYUFGeUVPc2RWVzMr?=
 =?utf-8?B?cmhaSjFpcjdZQklYYXBXaUNYUEVhMEJ5OGNGRUo1NDNvczBIYm5zV1JKSXJS?=
 =?utf-8?B?YWVWY0pOR21DdjBXSVdtZVUwUkZuTERCL3VDVnlRZ3MyeThGOUNSeVNnWUZV?=
 =?utf-8?B?NUMzd1BkNXdaTU1BZHVKZjR6eUU1bVlmQkFKZU1tVXFrOEJGWnlhMlNUa0Vv?=
 =?utf-8?B?UVFSbkVkeUlMWFp3UGV1SXM2RGo1U2JORmt0SUpxN05FcCtSaG1WZDFuRkQ3?=
 =?utf-8?B?YnAydWQ3UGlsZkZzbTRoNEtFdzNqSkRXZ2djZG1GWG4yWUM5OVNuT3RxUWYx?=
 =?utf-8?B?QjQ1RFcvUWpweFZDL2drUUJGOFhyOFc1RUJCa3F5Y3dNdnpmUjFqRFRZZlp0?=
 =?utf-8?B?cklRc05ZMGhkQktJRXVoOHRJTFBjYmlvSVZQa1VJQURhbkkwSGFpWXpzM2JJ?=
 =?utf-8?B?T29HSlVGTXJOQjFLV2h3SjN3d2o4T2dLdTZOYUNNVVZCMys1eGloaDVRUjJu?=
 =?utf-8?B?S2RQZFJBWGpNOUN1SlMydzVJRDVJRTZPeDBhVC9LNXhibGcxRmU1SGhsOVB0?=
 =?utf-8?B?Y3NGWWdBSWxYUVZuUUNQUFMzaG02N2FWWEdVY2RDMjFrRFZyUFlSNlZNSU9L?=
 =?utf-8?B?VXNPUHhxUHRXR2hTdjJmOURYUDdhVVpsWDNCa21JL2hQY1dETnZINTRWVmkz?=
 =?utf-8?Q?B/tU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YHmrKZmsns+eUUdJcUzcnR4W52DFa7irKCOGFOle/SMVFmXtSxTy+ywy/vnCRn/0pgNpUrz/qCqQAvWVjem3zQWd9zN37oGhcZ8luDAEVfotYvO46A4/a9q8znPzR+32mbDuzZfAOaTRWCWeZ9bxPxR/WetxgVvA/j5yEU9uXCPY49DNGISwEnyEM5yxTJjvlF14jODcjk4iNRLH5HSviQS4bXzKIcJEHxJbbep+oV4plReMbjrzgYbMiByGcxKYLSOKX5pP9rn8zKkkiYoaIefOHfB4iLt4iiysRD+EbmrO/NzFZTmnvF0PZyRwXWH4g19QRoFbO2JC61WqFkgYl9N75fvGvmFW2fsO/SOartQzWurQFppgwdcAdkly/uIhRpPXiRtIpn1xvOSoPMEFWAWxEZKOvU39UL0MpO4KWR/aTWL5WPytd/6ayb/OkUVN4OWJBkZH5egZ66I0mXlQEebDG9RVK5BlPlS9mo30pt2TkCekMBZMTzCuxhHkYgyOBwARnzIwIva1fTAkAOHvvbXGPVeBFly4Ji3pxwRFfpGeL35eYhIB7hf/my54+S8voPcQ151bnQ72JV471E8SqR7vnztHtBxBQNXiptKPTQtSZBqDMhSERRRIdrseD661kpbIpIugnevakG7bIM9D+9QZtA47/NP8fY7OBW/f0BznZz1oXhAGQ7kWOqii1KH/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:22:50.3255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 811aec03-6455-4abe-dd9e-08de4f60a905
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7168
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 3/6] ARM: dts: stm32: Add boot phase tags
 for STMicroelectronics h7 boards
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
 arch/arm/boot/dts/st/stm32h743.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32h743.dtsi b/arch/arm/boot/dts/st/stm32h743.dtsi
index 2f19cfbc57ad..790e4558c905 100644
--- a/arch/arm/boot/dts/st/stm32h743.dtsi
+++ b/arch/arm/boot/dts/st/stm32h743.dtsi
@@ -50,22 +50,26 @@ / {
 	#size-cells = <1>;
 
 	clocks {
+		bootph-all;
 		clk_hse: clk-hse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 
 		clk_lse: clk-lse {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <32768>;
+			bootph-all;
 		};
 
 		clk_i2s: i2s_ckin {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
+			bootph-all;
 		};
 	};
 
@@ -75,6 +79,7 @@ timer5: timer@40000c00 {
 			reg = <0x40000c00 0x400>;
 			interrupts = <50>;
 			clocks = <&rcc TIM5_CK>;
+			bootph-all;
 		};
 
 		lptimer1: timer@40002400 {
@@ -547,11 +552,13 @@ rcc: reset-clock-controller@58024400 {
 			#reset-cells = <1>;
 			clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s>;
 			st,syscfg = <&pwrcfg>;
+			bootph-all;
 		};
 
 		pwrcfg: power-config@58024800 {
 			compatible = "st,stm32-power-config", "syscon";
 			reg = <0x58024800 0x400>;
+			bootph-all;
 		};
 
 		adc_3: adc@58026000 {
@@ -596,6 +603,7 @@ pinctrl: pinctrl@58020000 {
 			ranges = <0 0x58020000 0x3000>;
 			interrupt-parent = <&exti>;
 			st,syscfg = <&syscfg 0x8>;
+			bootph-all;
 
 			gpioa: gpio@58020000 {
 				gpio-controller;
@@ -607,6 +615,7 @@ gpioa: gpio@58020000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 0 16>;
+				bootph-all;
 			};
 
 			gpiob: gpio@58020400 {
@@ -619,6 +628,7 @@ gpiob: gpio@58020400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 16 16>;
+				bootph-all;
 			};
 
 			gpioc: gpio@58020800 {
@@ -631,6 +641,7 @@ gpioc: gpio@58020800 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 32 16>;
+				bootph-all;
 			};
 
 			gpiod: gpio@58020c00 {
@@ -643,6 +654,7 @@ gpiod: gpio@58020c00 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 48 16>;
+				bootph-all;
 			};
 
 			gpioe: gpio@58021000 {
@@ -655,6 +667,7 @@ gpioe: gpio@58021000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 64 16>;
+				bootph-all;
 			};
 
 			gpiof: gpio@58021400 {
@@ -667,6 +680,7 @@ gpiof: gpio@58021400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 80 16>;
+				bootph-all;
 			};
 
 			gpiog: gpio@58021800 {
@@ -679,6 +693,7 @@ gpiog: gpio@58021800 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 96 16>;
+				bootph-all;
 			};
 
 			gpioh: gpio@58021c00 {
@@ -691,6 +706,7 @@ gpioh: gpio@58021c00 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 112 16>;
+				bootph-all;
 			};
 
 			gpioi: gpio@58022000 {
@@ -703,6 +719,7 @@ gpioi: gpio@58022000 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 128 16>;
+				bootph-all;
 			};
 
 			gpioj: gpio@58022400 {
@@ -715,6 +732,7 @@ gpioj: gpio@58022400 {
 				#interrupt-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&pinctrl 0 144 16>;
+				bootph-all;
 			};
 
 			gpiok: gpio@58022800 {
@@ -727,6 +745,7 @@ gpiok: gpio@58022800 {
 				#interrupt-cells = <2>;
 				ngpios = <8>;
 				gpio-ranges = <&pinctrl 0 160 8>;
+				bootph-all;
 			};
 		};
 	};

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
