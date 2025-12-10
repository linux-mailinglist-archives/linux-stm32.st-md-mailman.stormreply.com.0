Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CACB2A71
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Dec 2025 11:16:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1CF7C60469;
	Wed, 10 Dec 2025 10:16:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023078.outbound.protection.outlook.com
 [52.101.83.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A03FC5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Dec 2025 10:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjyk9OhEv+m/pEeykegoep//jL5KEjl/G1hdQMK4FFPBxeoiT/o6Lv8kJmmod/jqJbRY0be7DKdpApvWPAQMHTl40xPggJVbiGSEcZbsdizNuket+5dpcDC/I17KzFGqhVyKiLOf2mpDLsnq/4Qr+eRpWhSSS7guylCYo5hyLUZ/+6O03Eo295RT0CDGFxsfvEgofu/IMbqm0L6f0maNhX1KcmaKsjfZkhwhjcd6rQgSKOFiYqgPVfUBF61kFm9lAbPWwFF7DZFIJr/mlFP4hT2MR1b0BxZ7zphsn9bhGbIZylxCxNYG4iXurzt4pITjYwtDAap/4h1itN6sIcRiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Vds/MnZEbft5fXkvc91e7/XEVhS7rNlDKfebxzTZQE=;
 b=nJWGU6sFVuT1SpXCanmWL0lHOAcRHmXvoYMZHcDLLxoQ9wEvuGxWpNdZVEmrAMq7t0YHHByo1VkaCo7XhFJOWpgdCWRUgO8/GUmLXZ3izYZzea7MgH9QT4mcscTghfapV7FPhCSVR543NGfW6TnkAtO8KySae4xhxZ/sU5aNrWJVZwUgX4DSaaJbMZsGV6cD+Ege4vNurshIg6eaK87mTt+mX1dqWMUalVnKpU/3bMze4i0KxAiqAA3daxFjHxzRjnAiC6fwv0UwI8SWByjEwj2whmZylK/ZG73l55lh5w2OfbNFbaZ1BGJj7QqkU5VlG2xQZyfLH3rN06zA3sGQUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.fr;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.fr; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Vds/MnZEbft5fXkvc91e7/XEVhS7rNlDKfebxzTZQE=;
 b=h5Lq8K4TA/8bLCYuRm5ZelkPENgmI1LwI/E4jXHmpe3av3nZSlbKJ8hBGwgeFdfKoNGUQfGeAzHDJ/lbgZkyrceLpSujMwFAbAPgNjuxgKjLNh+QaDleiGkVRV59iVpihrAmfpTEtJEs1ILfqkSX4pwr0xt1N9V3ADbcKj7oSt4=
Received: from DB9PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::11) by GVXP195MB2028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:3f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:16:14 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::f8) by DB9PR01CA0006.outlook.office365.com
 (2603:10a6:10:1d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 10:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 10:16:14 +0000
Received: from Postix.phytec.de (172.25.0.11) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:16:13 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.11) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Wed, 10 Dec 2025 11:16:13 +0100
Received: from pc.home ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025121011161306-312 ; Wed, 10 Dec 2025 11:16:13 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 10 Dec 2025 11:16:03 +0100
Message-ID: <20251210101611.27008-4-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
References: <20251210101611.27008-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 10.12.2025 11:16:13,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 10.12.2025 11:16:13
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|GVXP195MB2028:EE_
X-MS-Office365-Filtering-Correlation-Id: 5244c380-90ad-4ef0-4b81-08de37d52698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vPYOagR9F4fsOmKk1TAy4vPMQo+3P2JlQ+IazgFgyeFI0RGfPnVyTim24vQO?=
 =?us-ascii?Q?PQubknp6AEDMDLIu4o181yfxP1yPD+WxeD940K2ZlQJrT2FxTs/Wup0fO6vd?=
 =?us-ascii?Q?t07jom/Fkz6231ft7psbwyE71ZGF55jk56tDneBBOunI0+LxadfeurlGxouC?=
 =?us-ascii?Q?ryMyzpH0Vi/Wsy1/7Z0I+SK1FS3opidCZ5ngw0+2r52Zf+uSy3KQGJvjOlsN?=
 =?us-ascii?Q?8EBTWwmn5mbpkZun4Cbz5Sb7q8ldTyzQ+kLAk6GlHTgTaQhrMXvPRajR8qPb?=
 =?us-ascii?Q?KJXznV/ByGvyDTSIw+d4wRtfi00kHpin5dQsih2i2qDv9M7fFUuf7wyt7aTN?=
 =?us-ascii?Q?CDGk8cwaR/7bN3sbKuEIASNAA7CvnMkQawloMvNzdPtRiuBPZkbkoFIXXq+L?=
 =?us-ascii?Q?1vgshSjEo7ryVScW1yBqguAiEJKzmtR5D8d4p+O8lbf74Rfe8lu9adjzoJZn?=
 =?us-ascii?Q?GbWKtr+1ENaBPoE5SixuB0aqSbmYSX2ezTczxbUxReORYATCC3Yev0ciMlz+?=
 =?us-ascii?Q?LHrnWenHbEPOGQzNKt+G3vWUkEsgSdMe4aPxp+J7YUaDJTQD1tb4OpvHk5X0?=
 =?us-ascii?Q?yMWabSdyWPCOq2n2olM8ZRNqPG5zqPYSQ6CUpntBKHwRQ/HaRBbOWAXvOL6S?=
 =?us-ascii?Q?jf+KFKIzdn4Xg9ha2RaqrAK3QrpNMBqmCw2pJQWhqrogbDefNgedkqTKuQ+F?=
 =?us-ascii?Q?ZBIqMDuK/Kc9QzHuwn2jeXN5o9mAiBPqazEok6eZMwl1Eugx97gqdbzfWMDG?=
 =?us-ascii?Q?UpspBNdsIkfGAFv29TPA3bj5tS+V3RLdKwlGoKeFpMXxCABlIF83kfII5vYS?=
 =?us-ascii?Q?jXWe33QAtaCRVZLMeyBVnbQZFMdfGMYcwAQVu8ZkhgPfLL+4E/fKg1emOLul?=
 =?us-ascii?Q?akSddZYVqv3vdth4OMWHfEeylas9eKU2rd4Mn51DoxFXCDo6eavZjg6UA1k6?=
 =?us-ascii?Q?3ybrWE2oLOGxgH2KlK7LfxUcStzkfzZJn7R8OLo8TLSP98NWM/UwH5koThmD?=
 =?us-ascii?Q?K0Kyiai3uK03TA/bOYadgMQQUvQJDJMIwyT0YRUEKO4mCqykHDJczq+KyTuq?=
 =?us-ascii?Q?qmxHJot+KOtUuG853P7J9DE5JwUyBjeUoyKYJXttwIx/hKa9y5nworsh+fU/?=
 =?us-ascii?Q?VOwK9HACEFSSH4IGqxZdvtbxpWjGArS2uWUGgwuZHRmS9/kKK0BFJ0EQwdbc?=
 =?us-ascii?Q?B74UlUVu9aQYKDYCotrMOPi88mdyN4D8evkg58TUy9aLWXXL60YMtcOphCOr?=
 =?us-ascii?Q?9lkq+yz60u5zapxbjPJqdFLC4ZpxStEzbwFgwscPXvX0pW5CW0nptIjkM4vV?=
 =?us-ascii?Q?AjODHsbQjSqVIAoE6BlPLPrJoamMPedlN2Hs/usgTgQ0cqCSJ5cLX+aFUPb9?=
 =?us-ascii?Q?CxxfTsdXBootnl+IihtkkaBRAOt4j+ofnvreU77lezIVnP5sXAuJCIuuMbBH?=
 =?us-ascii?Q?dlWab1F8HBwj7g3+1GYxrm//8RE6+S7a5rxn9JufGl7S5wWqJt94XRzj39lx?=
 =?us-ascii?Q?PPbuQqFnzPH+fjdIq9vafrZUKM7yRtDOx326UqVZaIQnHZgKkdgt7mJVpaxp?=
 =?us-ascii?Q?LpxFmCrTf7EtKQGTUJs=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:16:14.7542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5244c380-90ad-4ef0-4b81-08de37d52698
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB2028
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 upstream@lists.phytec.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [Linux-stm32] [PATCH RESEND v2 03/11] dt-bindings: arm: stm32:
	Modify STM32MP15x Phytec board items types
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
