Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7F2A2C594
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 15:35:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F860C78F8C;
	Fri,  7 Feb 2025 14:35:58 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2135.outbound.protection.outlook.com [40.107.21.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0203CC78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 14:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzuPxDv/hvXMoXGG6WVK/su6W5ivSW8Qnv+rFzPC9ubJnPplu60iiDuwvorAaPQc7sIwxqN5pZgxfqFQaiPc+zNdrYuAnIKZOG7DwY4TPKZW/6l2mIXWj/r5RuJk1rG3+9MWslDNHTVtrDIiFiKfTOAJi+U/7cqdDt4vwmqQMVzVS2Jc8vWZOnO1KhIl6dgLnY0G6numg4RmlI4rKEl7pG8dt4CG9FJd9Qj2yKyqwHoLubmG+24TTQPUbEGB7ART0kBcwuG7UeEugB1cFv9XMYqk4uPMnUp4XQy3rCUmbygFTcP27ktUOGLH0ojzBbiidNLz3AOFftKlFXx82fa1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQO8uPwiRnegS6YcE6ygHHVuR9M9l9c6CwSIO+xOeZI=;
 b=zN0BswAkfb5HXSV63yz9SFeNGWqG/J1ZE0pHF5MOW6qAIFFQk2UY1gGA4LDKA2BRt4D5/DlxltEog+2ngJkojhRkiqWJvoxtKUqMjOweaPNisOmSDK/tbLLvJv0ei6t6d/bQ+HYGcpwLYb60Q/d0ZK8FAZv1Owyh3tmdBop7ylzlR7K70N55P7GDmc38mzh/HAvv/CXIXrWMnqSj8xaIsuWQMWk6Si70i1GurojtNNuOPwHy6BiClJer9xvGpF6Z/wivvk3Tc5I8PNekKQTznSDijcnO6YPl69PdeocJsxk/YAZe9O5wy/oGFwI/ps02VZZDjf8nXa2aO228P6KMQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=phytec.fr; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.fr; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQO8uPwiRnegS6YcE6ygHHVuR9M9l9c6CwSIO+xOeZI=;
 b=uH9An63wDk5dz2D0+rhf4btB1awm42G66A7qFwCkEaHRhFdw0/WroYfLc2uu12nZot/u4ocRGZa34UKBRxSMu7xhPFICR+9s/g+xuRvUPOK6V5MVTgO0SM/18Te2GbwV+p8drfOcaNv7FjIjh0qQwV1jGyW//dOUdZxvX6d6Wb4=
Received: from DB6PR0301CA0101.eurprd03.prod.outlook.com (2603:10a6:6:30::48)
 by AM8P195MB0817.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 14:35:53 +0000
Received: from DU2PEPF0001E9C6.eurprd03.prod.outlook.com
 (2603:10a6:6:30:cafe::7e) by DB6PR0301CA0101.outlook.office365.com
 (2603:10a6:6:30::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 14:35:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.fr; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.fr;
Received-SPF: Fail (protection.outlook.com: domain of phytec.fr does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Diagnostix.phytec.de;
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DU2PEPF0001E9C6.mail.protection.outlook.com (10.167.8.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 14:35:53 +0000
Received: from Diagnostix.phytec.de (172.25.0.14) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 7 Feb
 2025 15:35:51 +0100
Received: from idefix.phytec.de (172.25.0.20) by mailrelayint.phytec.de
 (172.25.0.14) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 7 Feb 2025 15:35:51 +0100
Received: from pc.. ([172.25.39.2])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2025020715355157-60 ; Fri, 7 Feb 2025 15:35:51 +0100 
From: Christophe Parant <c.parant@phytec.fr>
To: <linux-stm32@st-md-mailman.stormreply.com>
Date: Fri, 7 Feb 2025 15:35:42 +0100
Message-ID: <20250207143550.432541-4-c.parant@phytec.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207143550.432541-1-c.parant@phytec.fr>
References: <20250207143550.432541-1-c.parant@phytec.fr>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 07.02.2025 15:35:51,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 07.02.2025 15:35:51
X-TNEFEvaluated: 1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C6:EE_|AM8P195MB0817:EE_
X-MS-Office365-Filtering-Correlation-Id: 3492e470-46da-4cb3-1bc3-08dd4784b9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vR0iZcg6wV4A+noLCY5A6UCrwXPXscDD3mUw9+VATkUcXNyPiHN5LHfylRpf?=
 =?us-ascii?Q?i4h/WrPch8nqOrk+7RxqOoS73xOAZ2n+gSfb49RQkJORbfD4hFoaDt5rWsn5?=
 =?us-ascii?Q?92xuiGwL7I0KYIwgdmzoOkrE4HqNCeX803GK2VUh+8957+QbGBiaro3bTh2M?=
 =?us-ascii?Q?3Bl0e4cjwnK39lnmRflKzVyt6tE1LGIWiHCJAilV0+TYNfkbc8g1Imn58ZLO?=
 =?us-ascii?Q?+YjrwHf+WfZPlFlH5A95wT9o2EVApaX5uzo8GEWDG9FBJ99paoQ1CFy8YkFv?=
 =?us-ascii?Q?WXxkf9L6IPouPfMsBeQ8jQjbHNcJmzqKoy3M/kUb/zxMfpa1ENlB5PXiGgrq?=
 =?us-ascii?Q?dZEaJ0BQ+sFPzR+/rHyBlog/C7BN87ND9tw0emGZrHEIcyO4c3CucSOjUqmX?=
 =?us-ascii?Q?4uircKUxr0fwXTdzSZDubvq+HeD8SfQIjLan7818iIGhjoX8zMOfHxph0398?=
 =?us-ascii?Q?ReEQP34sVcfQ/GRyI3inYm7jBQW9n4OUdwyU4nTO4EFePo6Gjz5VfHiI0eN/?=
 =?us-ascii?Q?TiN9vYd+yoY1Yw+KbMkNtZY4MM3YmMXKCy7hbiVFh+F6/jWKWHkF5dyAgMII?=
 =?us-ascii?Q?EFHdxDdB1evYNN3cJdeUzEcejzde1wxMfIFCB2oES+7QQ+bi0u/1n3ht8Yoi?=
 =?us-ascii?Q?68J+NSYNV60tesduEFNjMrDUqQxttfmFKmYhoxxDlXsLXM26ErR1Bk/HfBVS?=
 =?us-ascii?Q?VvvOJuUDnHF6S93yPGVSUSLhG2i7guc/QkkOrXdPUnDs3fEeQAFhTRNhmTpL?=
 =?us-ascii?Q?LJJ7sm8aFnZh4oRvmHSKNmJ338GuZE1Yhm6N31mjQkUM0RCwuBuEOGHmr4uA?=
 =?us-ascii?Q?WJUxweGSWK2PKVqOuovi95zHywVobMmyh4K2tbi9mG2/q9ogtKTFumJefXmx?=
 =?us-ascii?Q?N9x4YJMI9YQ/DV6yOSUp9iZvI7phRbajCrnC5YbUzA43daQVx+MN02JI+ECX?=
 =?us-ascii?Q?cxxhOBcd7k774b6RTKMpl/FabXUZOIFyl+t/dEKx7ueWqJ2Ob0W1fPtcpFbx?=
 =?us-ascii?Q?RYbPiSlzo2eyoJLwNGNmuxb+50leOYitDagy20axVINmci78i1u/jfROTtqh?=
 =?us-ascii?Q?E0VtZrVkz/+4+MBFlp0nZLy5sReeqKrCkrZ1nLHWxpyIcNjJYT1N2ItWn6JN?=
 =?us-ascii?Q?9zVzODRZ/XyAxe+4zpSFKUWhFQX8oAvas+EB4+rp6emvNP0tcf8VkFf58Cxh?=
 =?us-ascii?Q?GgAJGfSr+0OAb5nA3v5UT/GxZbJ+H97VFxP4nnS/li6ASuvF3/KYTDzQwhME?=
 =?us-ascii?Q?Wz8GqR2HU+6QOujlUcREic6ZdI7FvyCeY9fGpnSgz0cZXwO9OxyKLCJhkUnb?=
 =?us-ascii?Q?qSZ794huSK1ppzySvUTiT9YvYg0vE9dLuae2CwLydq4DLm7o2HSDr1KwHZIW?=
 =?us-ascii?Q?fcJXOX6tB1DhczuTE1F0f9NWqRXAVMEFEFZs64ujJ1zRnexKapQLyg4Bj4wN?=
 =?us-ascii?Q?SN51Z/Sm47Vb6mvl2q3EP6QaOXjJQCOFthByRJ/YEVredlyLKa38QJskJ3/6?=
 =?us-ascii?Q?VQtNDtPUQjqpoh0=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:Diagnostix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1102; 
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 14:35:53.2651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3492e470-46da-4cb3-1bc3-08dd4784b9c4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P195MB0817
Cc: upstream@lists.phytec.de, mcoquelin.stm32@gmail.com
Subject: [Linux-stm32] [PATCH v2 03/11] dt-bindings: arm: stm32: Rename
	STM32MP15x Phytec board and SoM
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

Modifications following new PHYTEC stm32mp15x SoM and board device tree
naming.

Signed-off-by: Christophe Parant <c.parant@phytec.fr>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index b6c56d4ce6b9..11b3f59ac550 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -169,10 +169,11 @@ properties:
           - const: seeed,stm32mp157c-odyssey-som
           - const: st,stm32mp157
 
-      - description: Phytec STM32MP1 SoM based Boards
+      - description: Phytec STM32MP15x SoM based Boards
         items:
-          - const: phytec,phycore-stm32mp1-3
-          - const: phytec,phycore-stm32mp157c-som
+          - enum:
+              - phytec,stm32mp157c-phyboard-sargas-rdk
+          - const: phytec,stm32mp157c-phycore-som
           - const: st,stm32mp157
 
       - description: ST STM32MP257 based Boards
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
