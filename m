Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB15498A00F
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2024 13:02:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64665C78006;
	Mon, 30 Sep 2024 11:02:25 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2102.outbound.protection.partner.outlook.cn
 [139.219.146.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA67C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 11:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz8debZpQEA4VGPQG2+sog62IQtffQSgDGSjj5hVgJ24Zq2l83mKz4QvFHNpBC2YsB8NUiFdFKlIk8rTr2Tm/xS/RjiaVbcWvsYNE3jDi7I7VAhmyT5oZO4QlOMLOSfD4VIM+KZX0qtvEIPKwCq/bFKrXuThS/U31U4kfjbkOyhxl7tVqiaATUNpNpjQw+zhnQHRpvRXVZylBEGojWs0MI1SJssiEqxQ87X8CShVXG6y9/42Y2uoHLmXE8bjPhQ9wf8KArhCE5V2x+gFl60iV7BwLiy1C7KKull1Foj7Nz2xMdvZrLw3IkTuCqXOQR2VYbwAlzF6bUCFG1ksi24WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqsoYb5k1LSAkcrzkxqTgmH6IDoffy7Xn8r1q04dCLw=;
 b=jDLg3YxsAL7uo9fvLuNINVCoD3/tpttnPoXdxQOPsiKnCYnD2WrDzhXxWf6NYGXjGHUdzkXTR44Y66HfjwibUhST4nrzxvO0h9tK8/Lgxn36vT7kmsbQgKzyqBLt228z+ldsVFo5yevCtSnQzalrX+hUwRuEVvz+Re91jszc+52/MGcOkvZebv/8KIKJmOoE/SvUWHKssV7L28k7NGKbkeElouLZIec95dbycDYBt8pOgddjCkThIEjjgmJeiyn1q2y2jVOUX09+1dA3907vEE33AXHdkTrfSYNh2o7I8y30LRvCuVDjVefBaQtchFflGpnpF8nkK9GfiinOi6oLhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0749.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:27::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.32; Mon, 30 Sep
 2024 11:02:14 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::3f35:8db2:7fdf:9ffb]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::3f35:8db2:7fdf:9ffb%6])
 with mapi id 15.20.8005.024; Mon, 30 Sep 2024 11:02:14 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org
Date: Mon, 30 Sep 2024 19:02:05 +0800
Message-Id: <20240930110205.44278-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BJXPR01CA0067.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::34) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0749:EE_
X-MS-Office365-Filtering-Correlation-Id: 45db4570-8a2e-4062-cdbc-08dce13f56da
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|41320700013|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: 3upQ8eIBjU6viMDSQkXW8Mx45wyYUf9HpqbN+BqjqIvk1hO8OYhkJE70nN4nwKMwDY3aWfHhUZISYa+MTh4OUPc+qbdij3a+UDpwVbhEIQbdEHUtY0w1JTLiUmOQJxJ/SESSDDkTMS31Rr0iQIPQJObqXy+oN2pvNvb1lTBeu6ay/UO3d1RoFvsh6e0wv42iX1VeNHjBU9KkOsGB1/KB+abeYqMqOLUCmmAsR3e+9w6mP5CNnunkj7xAICtlm2T605zJwWMfEE3KdMaeOeN2ox5EiosFK88HAAeez+6cCZgLhOAC6KQMfIYWVcjbIRRZ3uVJbzEaFR+/0A6VzojzkMImv9J/OOBUHAaJsU82MLigbHI3bTHdYXzIdQMrFEA8ctTnF6AUCv7DG3N7e5immnHJLhJf0OmT8LfNt7+xrk+qB+2BYNhGsrSpk5DHx+oG9uj4QvPFTY9SNDEUaaBA2//lfLQ9o1dxxuHTY/szKExATrjMdGIfGs3m0AABct7geBg2tiOUCwj+8vCysRp+Q0UwnVXVTm7HsCLQqzN8EKDhhIvwKI7E5EH0FPPMb6dhQXqMFozVgUxLM77EbniZfGQnj41hfTw0wQTKkkbs/8VQMeni24EsP+6gSphtycnZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(52116014)(366016)(41320700013)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RbmMg+fhKjIPAWAT/8BnwJEVxMF2LfQmKvkHGyCzlDnbzRDZNs6ZRnfV0vCn?=
 =?us-ascii?Q?9HjIoU8/Hg31Hsu10s28RZcwM/VxzjgEBeDnKN3EWIJz+UFZjbIglFTRiLBR?=
 =?us-ascii?Q?nlrI+hN14qQ0hP9zkECt8ScfbkAdfjHcwwP+lDigju25q6ZS/+Ehr1NGkp8S?=
 =?us-ascii?Q?tP8zxRxcmwK/bn/ub+joAF+MZNvtyFX2nUWgY0ZuXNv236R6uIiqQVeygcMA?=
 =?us-ascii?Q?182Xz3vuu2quZ+bn0+vEJXGALUt0ZtrozixnkZxD0iy5ntmJB49tQXYuqYFn?=
 =?us-ascii?Q?yOz1Fl6eW3fKUTPQAvnUzji8B923g+uxRXTQOtKtDrlCkkKpKW61NE2JMMOn?=
 =?us-ascii?Q?DvKIoWBgFojtIfPhRi2tVG70a6CUkqQDdCPk1RSAoKjgfK6moVeFVs66flze?=
 =?us-ascii?Q?HTu7nq/aUemv/fehAEzqCf2xOMcsG8S3exciBDgCc1nSprNjFhF1+IxK5dA2?=
 =?us-ascii?Q?IZD257uBgr8H099cBjt49rBQCKSJIr5B+CCFj73PPC8/XWSSkDSlZ78ojzLc?=
 =?us-ascii?Q?pGFFDBDA1VFeOHaeqxR0J7j1t47frfZncbSED796F5Mf/bgRrbprjiG0WAK8?=
 =?us-ascii?Q?SglzA4nTE3Sje0IVzH6qLv5arlrZl0vPGlSb5ecTu5R73PdbwK4xoyiW+kqq?=
 =?us-ascii?Q?aBm5JRp0JvBWvsqzAXRFgdifMriaPPvO5lXP8icFxojEO+Wm/0na2Dn0vzro?=
 =?us-ascii?Q?k88OiZO7iFGmz2CAVp1GWn6IkkqUE8CAreiTM+iWZqV+SnaL0RnxABg1KsEI?=
 =?us-ascii?Q?Vo0bd9IZZLaH6vXCYtm9wt3Kqa5lpEP8tvqOx8JJpcQhmRMb+otSvZ7hTmqo?=
 =?us-ascii?Q?TEjC89KzkgAUHCvcyfw5sWhE20JvlE0OCk2XjzgPWzYH+rdTo1vIE/6qz93o?=
 =?us-ascii?Q?mWLN0V1U4V/fkHPvnPVS5wnBtOgoy2oPs8obzREdTT2dabGJDwjYmzIWmXWj?=
 =?us-ascii?Q?2cXU6lPibNfdypzT6Bn5wD88vTNX/fXjqLTXF+4ILEN/MoRC1ehdOD+z3Nc4?=
 =?us-ascii?Q?113rMMpAuKhhwtuhTeme98HuRav2xSxPgDFnG4OB3b+PoohuDRCd3+987V0L?=
 =?us-ascii?Q?67+FUlbl9QRor1gWko3qCV6Nw4bCPXR0ivX9euwmFwz24CO6bWBh/pLpnqB5?=
 =?us-ascii?Q?4PZDknPwYWfiuzsawHTNUZVL8rq+miRTxptcvFs5gKFho4Z+45hfTgxLgd2b?=
 =?us-ascii?Q?oY/I/qCHwLGcSO5IpHf9700iwuSrqecG3zcktoE/tKrZxbZaYjYlDdC7vPvr?=
 =?us-ascii?Q?ygQQqLXATGR4ealz7yP8eO18Zi0uLirBxMX4Qopic55M989p9LbuKyRDJ1xd?=
 =?us-ascii?Q?FiKU0YEpl3HM+UYuyQ1d1sixdyhDlv4YEZl6yuajs4oYq9J6/7FqbiWcVTvn?=
 =?us-ascii?Q?f1BFIOQoDamG/Q3Xj4VCkPWXEbagdiPcSnDGHh4wkaeoY76b60vgTlPxC6iv?=
 =?us-ascii?Q?PBy6R2SUx7QCBG1XrklXds3me2bt67DsPSkeZu8AA8bTHTIEU1m/ZxI4ObvL?=
 =?us-ascii?Q?7GZu98yTMw2ZpmFiOLy6Da8mWeD+C7gqRUBlmoY1j02BWZkYYJqsPU34z5Nk?=
 =?us-ascii?Q?bAW/PryaziyPyYIK26OE6AUDsqM8WtEmXAz9uNdd5V7U/ZiPf72qPRqGHJel?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db4570-8a2e-4062-cdbc-08dce13f56da
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 11:02:14.1691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMggXJ5v4zmw59d+F6K7qMMQmCfcTRb0+nTjnPcqx0Py5AeBTysXYhEbPqcu0vho6kIUaETzn9b2vDddCVBVYxmv0mdyNRUOEFo4eWadyx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0749
Cc: Minda Chen <minda.chen@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: dwmac4: Add ip
	payload error statistics
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

Add dwmac4 ip payload error statistics, and rename discripter bit macro
because latest version descriptor IPCE bit claims ip checksum error or
l4 segment length error.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index e99401bcc1f8..a5fb31eb0192 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -118,6 +118,8 @@ static int dwmac4_wrback_get_rx_status(struct stmmac_extra_stats *x,
 		x->ipv4_pkt_rcvd++;
 	if (rdes1 & RDES1_IPV6_HEADER)
 		x->ipv6_pkt_rcvd++;
+	if (rdes1 & RDES1_IP_PAYLOAD_ERROR)
+		x->ip_payload_err++;
 
 	if (message_type == RDES_EXT_NO_PTP)
 		x->no_ptp_rx_msg_type_ext++;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
index 6da070ccd737..1ce6f43d545a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
@@ -95,7 +95,7 @@
 #define RDES1_IPV4_HEADER		BIT(4)
 #define RDES1_IPV6_HEADER		BIT(5)
 #define RDES1_IP_CSUM_BYPASSED		BIT(6)
-#define RDES1_IP_CSUM_ERROR		BIT(7)
+#define RDES1_IP_PAYLOAD_ERROR		BIT(7)
 #define RDES1_PTP_MSG_TYPE_MASK		GENMASK(11, 8)
 #define RDES1_PTP_PACKET_TYPE		BIT(12)
 #define RDES1_PTP_VER			BIT(13)
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
