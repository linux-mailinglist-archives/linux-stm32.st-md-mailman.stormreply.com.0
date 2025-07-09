Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64BAFED2D
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 17:10:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE8A8C36B2A;
	Wed,  9 Jul 2025 15:10:21 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2098.outbound.protection.outlook.com [40.107.249.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71FC3C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 15:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZignBMhF2c+1rx/e7ue1T6bgrfxWPQr/s9ToNDS4zyxhi2seb1uD80szfo+VU5TSH5SUr8+LCYFWrNzcis+u5P4+KDTc4uIZah9PHoX/SGxM/axxTYeeWKB4iIb+qwp9Y/nBsCny3qhWzlu0H4B6SG68HPS5WpgJXnqIrjFYp9VHFYlFJ4yyiWnQKR/F0A8IP7wwhU25yyIhFtcLmQQBGNewiES10PBPAV9JA+wpLzMY6sZbrN6qW6yzqoybL2FQhmZLye/YIyC6EgNO4CYR5fs36P9KU6vGmoshx5X3x5rQdQKAaFWGb0KfvZO9q68GiePe19BsALhB8KjktjxRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Vds/MnZEbft5fXkvc91e7/XEVhS7rNlDKfebxzTZQE=;
 b=pyRsdJN5FhKPG6Lcnt/Q6dUo8m1q3bOAdzNgHarssCo2o7Y9L5DQrZ2BjJGwRTn6ZKnUNZKGWcKDtlgITv1i8jOwsD8bGyxPu0IZhSDTj7HAZa9QWB5NCcKhxrGqw0IYM11HfV4UetHtJN32ZqcXp6y3uabL7tzCkD2EV3lQ3FgHpfHb7rfYpWJfjIrmJN2cwZopFkt5CKq79ZqwR0QIOnpYtQDAduVqqHJHYrJ7RXdyuGVqaX4+WCM4SyMI6KRabApnmWDOOWam0P2ObI+7DpeCA2sFAYHzRtODRzwKkEuQecZDAz4CVW21qo/lle/+oJkS1hRMQSzO8swa5hLfww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Vds/MnZEbft5fXkvc91e7/XEVhS7rNlDKfebxzTZQE=;
 b=IJINvdheNKBotcj/COW9CVLCUuA0/JMs4gi4APW0qYZ506j3f5X3lhuKT42NYxMddzFjJRnfOUeZaa3jeA70l0SQdjyKAjY/v1GcYRIyDIz3uR4LXZ8jUkQaiHgP5P/SpDmJ2DQKC+XplBK92ZiZjlPqSsC8buSzWQIitGKFrIk=
Received: from DB7PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:10:52::29)
 by PAXP195MB1213.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 15:10:17 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::5c) by DB7PR02CA0016.outlook.office365.com
 (2603:10a6:10:52::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 15:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:10:17 +0000
Received: from Berlix.phytec.de (172.25.0.12) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:13 +0200
Received: from Diagnostix.phytec.de (172.25.0.14) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 9 Jul
 2025 17:10:13 +0200
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Wed, 9 Jul 2025 17:10:13 +0200
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025070917101288-209 ; Wed, 9 Jul 2025 17:10:12 +0200 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 9 Jul 2025 17:10:03 +0200
Message-ID: <20250709151011.366537-4-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709151011.366537-1-c.parant@phytec.fr>
References: <20250709151011.366537-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 09.07.2025 17:10:12,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.07.2025 17:10:13
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|PAXP195MB1213:EE_
X-MS-Office365-Filtering-Correlation-Id: de192625-d3fa-4495-4ffb-08ddbefab6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D6b7PknTc8vuWCJRZFxaRFVFYWl7YOF4UFR6mkxPNVIGkv55Wk/muerY9Yx2?=
 =?us-ascii?Q?qkva3q6OIJ1eNWbrmNlPB5Kd7i2eq0B4DaNQEZ0yFVuR1r2A3eX/sdt4EHWr?=
 =?us-ascii?Q?dYy1xD486e1+3qRo7mrRCFsy0tz+1tHIVcHm16ObgYg9buvVwXii6iMyo4uE?=
 =?us-ascii?Q?OXvNteTLGx7HJ5Y9EVd7dwKa1MNXH7omkOsy2ZHmdjEN/j3rA8Lsx5B0Hn1v?=
 =?us-ascii?Q?DjToB3SbB2U8CTf276EaewjvNNcKl3FsSiZjHjb5gnqVZ4ZYFIaPJOSQf/nL?=
 =?us-ascii?Q?CyTLUXLdVXFrRCz4fNAFrcD/1gDOVjg5BpTHfcwRJNZA3cVVRVUXM1eDbnDM?=
 =?us-ascii?Q?F9PhBDaJ7XVM0kJ9anya77fie7d2pRifGzA8ZTdPtPALFsW6CMivemczV+NU?=
 =?us-ascii?Q?3866rsHW7nDVwZl1ikAodyLcjtF7OM/CK3WWNCLuFahHxopqLq7u+URP1q32?=
 =?us-ascii?Q?VqvNLwfMGdgS8Lhbjywngrco+87MhlR6UyJLrcRfc253dEp26Twd5VCnT9cA?=
 =?us-ascii?Q?r4Ud7fd00x6x0+hrEGYFrqKeNA6Jlh61CqsWPEoV6nOZVGCjwTHaE0E+4ht9?=
 =?us-ascii?Q?5g5zIoltt94SOIhQHwxWDJaqrSOEQpdQwHlTw6rUhO0HwZUa7kK6VeorOt73?=
 =?us-ascii?Q?eDVkevm0dx8R7ZbIiVRktB7Cmm2MrRVgp9dVcrCldD1yHoQOYeH5E90VW5am?=
 =?us-ascii?Q?2OZd3e0iRQJ5+RYWuZIsD2tJt3z0TyZMZPpcXmf9L1dozeJq1SADOnqqIz3P?=
 =?us-ascii?Q?PCvnv5LuRHpHpbS4bnYSeEpcYWEWMIEFgUuvDpRXNd6uDHRZG7eqzWT4k8KI?=
 =?us-ascii?Q?b1lMzM2MWsaR1eG68T5Poc2VOtaAOTG1np1QhIM8PEmZtDxdA8IJtzA2RUUr?=
 =?us-ascii?Q?++enzS5eiarpGRIjFmZOqGwCAnlcDJgsIAMTnnAyauFOPNaUiM7cI/CP8hjj?=
 =?us-ascii?Q?JYLmd398pbQjPmx0qaElkZrN6J3hvmWSu8HEnqQqM727nZ8jYXzWjI3xmgE4?=
 =?us-ascii?Q?lnv0FXcMb5Wc/T9HdNuzox5h4QwqJYqXqVo7tUejgOEGRRW55TBqypqFgljR?=
 =?us-ascii?Q?xLJrFBZ4NsVLQACv4wvGyF1JG4/zVELZ9Z1D2g5ViZELLlYTj4yNwrIlFBlH?=
 =?us-ascii?Q?n2ZLF49AWv1cSYVysF/IdEiYQpIwbANDTg4lI3MbxEVeP3sg0EZzPQGg1CSF?=
 =?us-ascii?Q?G9qHvzulE0fc6As4fFVB3JJESONV+1dachV32OBVCvta2mmriFMJSGe9eVaH?=
 =?us-ascii?Q?fNAnA7/aerSWI55WuZCiCyh1iFR8liRoqGwc49ALAfFe6vPF5FwVWOajOWpm?=
 =?us-ascii?Q?k7aljgB7fuoJV3v60nJHn65Jv0hSVsgxZ1B5NrQBzz64alrf3QbOEXNuQDzD?=
 =?us-ascii?Q?0sOshu5GrIS5kJ2FHJ1bHv509z9IAwAUcPmSVQQXTe1o50FI2a/gdD/UdRfW?=
 =?us-ascii?Q?KFRlntw68C/ebMz/ymCsdszJXc3x95pXU0KNEA4V4N7vvEcTf7WsP6xVSyI7?=
 =?us-ascii?Q?rK/2vCJwnpahAUVy+A2V4c6XAqyx8IeFTOei?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:10:17.3441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de192625-d3fa-4495-4ffb-08ddbefab6c8
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1213
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH v2 03/11] dt-bindings: arm: stm32: Modify
	STM32MP15x Phytec board items types
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

As Phytec manages different SoM configurations with different STM32MP15
SoC versions, modify the phyBOARD and SoM compatible items to "enum"
instead of "const".
The description concerns PHYTEC SoM equipped with STM32MP157
("st,stm32mp157" is "const").
Also add comments in front of the enum items to be able to identify the
compatible string with the phyBOARD/phyCORE names.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 408532504a24..fbd3d364c1f7 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -182,10 +182,12 @@ properties:
           - const: seeed,stm32mp157c-odyssey-som
           - const: st,stm32mp157
 
-      - description: Phytec STM32MP1 SoM based Boards
+      - description: Phytec STM32MP157 SoM based Boards
         items:
-          - const: phytec,phycore-stm32mp1-3
-          - const: phytec,phycore-stm32mp157c-som
+          - enum:
+              - phytec,phycore-stm32mp1-3 # phyBOARD-Sargas with phyCORE-STM32MP157C SoM
+          - enum:
+              - phytec,phycore-stm32mp157c-som # phyCORE-STM32MP157C SoM
           - const: st,stm32mp157
 
       - description: Ultratronik STM32MP1 SBC based Boards
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
