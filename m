Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE456874943
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Mar 2024 09:12:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AFBAC6DD72;
	Thu,  7 Mar 2024 08:12:01 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2084.outbound.protection.outlook.com [40.107.14.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DB5FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 17:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mo6F+/zej/jxG08mPoLntqRK9QLfEjR1ZC63ILXyVJGg33N+K2GaIqsdAF+SYGoWVK60sisNseuce7X8XsfqKKSsj2kGFxR8uPHUnKQ4J/oQyam6WUwMy/FeC0qyJRaNLyy5BS5qJBbd+4iUrYgnGqe89vSlcx2H4kvW3lRixGJ9gkBNDmZIlorv9jFXuG8XCsATw6FtpXPR/ngvkXIaEJ6x/FZJSecZn4AHy1tqDr7UjOskvtpUAiSYJPPCcPRA/UX2lncW4oSR2eXo8/Y9/DwS55ybgpaUF6+KZ4SsgZgtiqg69b6VndBoelv4L4LmOHj7mSTDr8/SdusJqzE/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Sl16cHBNQAbXFgM02+tz761jWn2RvyeXV/YFlT1QP4=;
 b=nT7mtss+MadhAYEmHw8PMLWUnPRjUzR8xLrTQ0IXaIR7XEc5NyIbVMU0xAURRAGClII1pPsxt7mxhNcIeS3Eys+dfaFITftluVNrZ5zDDT0Yaj3WpgVnu02ISyfPhbsRWAak2uKLl+qLoolVgBBHrS0mLWbIIUbiMbw+GpjCQwHVX7BU+p6toHJ8f+cuR8myNSPitr71Dp3KYSbihKscBuHKiXcVFflIWsdDD5REvK5w74fYTj1ZZIbpIAx6MWOKS0cIF0SigiFRDhcTa/LKLTxZX0m1/xR0LqCorxGXeMQa4vHoaPRYlbj1DNaqFHRHcmkBOCpJQsbf1GTiFn6gwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed); 
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sl16cHBNQAbXFgM02+tz761jWn2RvyeXV/YFlT1QP4=;
 b=nUYB3w69Gke6HzaaUchh6znea0WAz2bq8xLihC6GoPNgVJhCnOvLybIyGcJAO6YV79wCnmTg5UuPpXlRcwau6quWyHHwlByPIG/fXmaBpkoEwgKYOSNhApD4GlSYvKviuLEB0UsY7xFu1BqmwV6FtnQAk8c50Qeq7nI4JIQ0FBE=
Received: from AM6P194CA0029.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::42)
 by PAXPR06MB8176.eurprd06.prod.outlook.com (2603:10a6:102:1a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 17:24:11 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:209:90:cafe::1a) by AM6P194CA0029.outlook.office365.com
 (2603:10a6:209:90::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Wed, 6 Mar 2024 17:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 17:24:11 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com
 with Microsoft SMTPSVC(10.0.17763.1697); 
 Wed, 6 Mar 2024 18:24:11 +0100
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiaoning.wang@nxp.com,
 linux-imx@nxp.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Wed,  6 Mar 2024 18:24:08 +0100
Message-Id: <20240306172409.878928-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Mar 2024 17:24:11.0104 (UTC)
 FILETIME=[1A5B4E00:01DA6FEB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DB:EE_|PAXPR06MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: fc656947-0149-4f99-c53c-08dc3e023cf1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7iyUzfx+1B12uI3gbYGz4mg69YHHBhRdD93YmgQ19WUIHIMBwZ0MfNiTb+8peT92awycLbEcbBzAP4VlKWJGyUjkYpUhp4vfWuCk3ePyEjqzDgj2ezoeGrwtykEzMVPKrFd8r4qMf9KMWA9Vhi1E7nQpSeWekEZnMq7z14DNoKppXPFdLveZ2XvQz05xfDM2ntnhsVbEKtbJE9xvR0FCt+i723XIOxSw9GsdXdB8pFG7ofbA151E4ICcCMztIphHR9O3h+z4STajAoTFzJ/+g78Ol0RJTL+zFcTl1sIIL6pqJ3UYohrvxk+C4QRc/OcQl0LJPV0XLRQ/k0poCeWguiw6yqSa8YKVEcu9VibJfhz4gDjqapJI+qk7jshV2AgYBdV7hrimFGm2+cx4LkP8+qjPdmK3D9IR69s1pyrmepuwc6ghR+NATMv0oApELRxf0MnZRUjZtBlLLMvFLYgzLoMOA0F1kl9NM4qUxmvutMRY+HpvvmqiOnSEYWtg4wtQLYWauXN0QCsjn+ZhQ5OrU00jjEXG2YctrEqINzyzMhiI3wm1pmIYeaiWmZBW0epEGT8pj4fhGyFSJsPqZaiIucBJ80PMgDvmjfx8j7KYk3rl+KqHr2oPUpexZVwIBwMKcaPgZeZ0WpOwCgaQWro8zUu0JoaTGwUcskSvnRHQh1YyQMiQxAJF7M00FGjVgkGnU6zEdIioTVWitR+cZfFVRX1LKieWhgwbEtFmIG2TAUFsxeNdYYNpzhcNLfBtvC9l7kM+khjkBd8binlclq+D6Q==
X-Forefront-Antispam-Report: CIP:193.8.40.94; CTRY:CH; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:hexagon.com; PTR:ahersrvdom50.leica-geosystems.com;
 CAT:NONE; SFS:(13230031)(82310400014)(36860700004)(376005)(921011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:24:11.2789 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc656947-0149-4f99-c53c-08dc3e023cf1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a; Ip=[193.8.40.94];
 Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8176
X-Mailman-Approved-At: Thu, 07 Mar 2024 08:12:00 +0000
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com, linux-kernel@vger.kernel.org,
 m.felsch@pengutronix.de,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: dwmac-imx: add
	nxp, phy-wol
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

Add support for PHY WOL capability to dwmac-imx MAC driver.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index 4c01cae7c93a..6cf373772eb1 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -71,6 +71,12 @@ properties:
     description:
       To select RMII reference clock from external.
 
+  nxp,phy-wol:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If present, indicates that PHY supports WOL(Wake-On-LAN), and PHY WOL will be enabled.
+      Otherwise, MAC WOL is preferred.
+
 required:
   - compatible
   - clocks

base-commit: 61996c073c9b070922ad3a36c981ca6ddbea19a5
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
