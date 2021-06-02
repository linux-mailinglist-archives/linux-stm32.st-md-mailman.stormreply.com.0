Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F46398917
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 14:13:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0553C57B75;
	Wed,  2 Jun 2021 12:13:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B139C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 12:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obbt51DOpAoSVMNZWcfYdxCJ/2aD31EJ6ki17AnaVWRWqUrUuha2scEfKnBKZGXdBuFR1ryVZ5VY6ehZK85fL/5BHdX4I8v43TxxtHrnneFt55ckPDTdPOLxWXhjdmXCRXYl7S3x70bnDnl/SMDzjYZ7fWE3crcUq4N+CVJBfpM1X9OGCEUxFmt4RT3dXbHFb9Lg/LzBSeEE7mDe/aE9ZK65Bst3BhX8oMx1vXQon738R27+YXd3mljbMxa2FBI5aI5jGUSsxsy+emZcEHcKG2rz5h6Q2Oc1cm5Kje2qtZwkExITysnZlpjMC75aijuwkzycDPyzgL5RoNGKTKLlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H85OxNMfeKkGr+YsvyL9ZrTif5J99fhLol3iZhPK0zg=;
 b=ZtIVb0hHlREmhT1I1FHmxAZkD0wXuNle0UkCamSWggwWbYbL6rWuePKDlMXDkhsktNHZYPt8sBWPr1WcSE1nUi2ndz/zgOmatPrYlX6jc0YQrj4/95H5lnIvtw/1+UtqfITHvyzivo7j1yaJP6BpZhKYVuGKBZriA/EHJzY1jmmvkZHO8bVjiWTXVfn9DS8TI4jegZelwzJfT47CX+c9gNMOMIJqzV1mUScr16CjbLZ9ANrEWMx8F/WQbi8Aj2RPPO18c1YudcZ5wNF66ezZkplKb6P+7f8zsv14LmOld4IU/cnYKDaNclSj7i7yg3iAzVIy4E+wzvR+vR73MK7ZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H85OxNMfeKkGr+YsvyL9ZrTif5J99fhLol3iZhPK0zg=;
 b=e04hyy/t1k6tpJu2wHxsf6KnxwNi7wfIbioKeu5kK45K8RsDxIlUZxc1xfI7yF2pZN3TtMQR6ZQ2Y0Z1KisRLf23b/hjiBdd3bG4UpibJY1+XPl4998jzLT3ivXC9uYsyDIqnOUv7sie4llQKOQjksp/GwfXtB+GsePqzuWij00=
Authentication-Results: davemloft.net; dkim=none (message not signed)
 header.d=none;davemloft.net; dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB6PR04MB3208.eurprd04.prod.outlook.com (2603:10a6:6:3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Wed, 2 Jun 2021 12:13:01 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::3400:b139:f681:c8cf]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::3400:b139:f681:c8cf%9]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 12:13:01 +0000
From: Joakim Zhang <qiangqing.zhang@nxp.com>
To: davem@davemloft.net, kuba@kernel.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Wed,  2 Jun 2021 20:12:35 +0800
Message-Id: <20210602121238.12693-1-qiangqing.zhang@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0119.apcprd02.prod.outlook.com
 (2603:1096:4:92::35) To DB8PR04MB6795.eurprd04.prod.outlook.com
 (2603:10a6:10:fa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by
 SG2PR02CA0119.apcprd02.prod.outlook.com (2603:1096:4:92::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 12:12:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24600364-49d6-4da8-79dc-08d925bfc433
X-MS-TrafficTypeDiagnostic: DB6PR04MB3208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB3208F0F6290C050F665288A5E63D9@DB6PR04MB3208.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elgDNFcpf5HX4imjgQQnfhdqkcYtWyRFSwwE60eCDMue4AUeBmDYVPFfbicBRmuvySGwto6HZpaKmf6ugWSiPcP5bVuhExYZ+BcqkVl74NyKcJiQVak8YxSQXCUlUtDuIPuDuCO48gRqBRUw/mhx3wVDLW/TDz+y1LvU1Bf6WgKDmdPjU6b0hnT0rpCH0H09kH3V5Gi8/iy3nuZcW/l6J/nCV5CoP3Ew6lC3KkKCpN/CX49lBNz8K0+yJaneBgQDQ451anQPTqiWwn6mc5q705jGgutRsXjfnvS6waRdX9HOWujNE9wBKH80wp37iXkz++d9kz4k1azyPlr/N6YSBwq26JXV94y8rjm0CGWi/FtohejeLQcYrtwDYTLZA5SuhLtJuodhGHz4Q79P/okq/U8Y4dLfRYBHGO1C8P9AgJtHsnwSlPNEb3KJ0HoYuGdPBqkYKNvNWHxug8KOQw/P3Zd0YJXvV5ZBsSUnysW+obt4RXGBK12p+RS+BiwxofqqO5SNS4NaS0hRhAaJZeHeDnJeSA2hlg/YH4ukfsTgatvrtgoV38yZV5cI9fU4Y2cS3kKqMroSH7C8KG1zIsAhZ0JLkxEePTplNzKsqkB72s1iMHCjZ0TZaeDjxcwcMETkK3HMwLFAMCdGqWTIywifSKdS74LurhFwpx1fDSOqYi8bMGYd0AbkcZYqyQsx8nvY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6795.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(66556008)(5660300002)(66476007)(4744005)(4326008)(2616005)(66946007)(16526019)(38350700002)(956004)(8676002)(36756003)(316002)(26005)(1076003)(83380400001)(478600001)(6512007)(6666004)(8936002)(6506007)(186003)(38100700002)(52116002)(2906002)(86362001)(7416002)(6486002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hIR7SMqgTaM4w/9VxqGHQcJtAElvxVUapNUh5vSUZ3N4Mpj6Qc2tKo5WlpYS?=
 =?us-ascii?Q?a/HZEqWwu0W1tV+W3GjJGDILxruLlgiAhFi69mSpG5aCxzpkdrp4az3B5oo3?=
 =?us-ascii?Q?wWU8hG88WABJ/B7NnwjF1TX3phGIpIiRoPiU28JE8EAjFP8KCv8RFVBuNcJJ?=
 =?us-ascii?Q?Z/WbYJgCwcFGUOP3P6IuCqtAc9tAW8yIn8/EeMmYC0K+TGjUvdYYa4SmnafA?=
 =?us-ascii?Q?S8ZAcYaOBIqDQ7mFdK3ACsiXLCVVIacubKFK+jYrX0v1nHbTdeGLawi4Hza+?=
 =?us-ascii?Q?ND8nFuWdd3vlJSVf+sHlpevqygi4+XYtT0zjLHa9FP3eniw5+4R1OCQ7oCT9?=
 =?us-ascii?Q?MnHIDqe+7iAEBfBOj4XS0uhm6PqrxVLs6DWFL+G0OGwqe2K+dgh7oELXwvhF?=
 =?us-ascii?Q?KLdsrIRHH6Pgxe4NjP7aEULx+hVBRXOzfxnUxSZqzMpkvWawJb/sNGVF3mck?=
 =?us-ascii?Q?wBPvGb5oZvG/J3NmGUvHJy0Y1OYoybhqAq8th5ZUpHfKYN9YIJ3yDIAyay8O?=
 =?us-ascii?Q?O0P1ij+Toby5CcrbZgP/PrAVkLGOIsHeEzXq5ePA0jZ6t+hTl5YBjYzEd/ht?=
 =?us-ascii?Q?h/Kb1y2WUF9Yz8Z3Jk3EJBpSdCIrpgikYA+Dnkdmp1GxSnNiQQ9/4acpMPpX?=
 =?us-ascii?Q?6Lf+ZS0ql3kD8/MW+aIyGL3IT6NANi/YaCc7qQLUZnnKcrkhIsbR+J2PJEU7?=
 =?us-ascii?Q?N/3h2A951hK4Dp5szcYwv7E+9HVNc7krIvPb/zQB5Pc0eN0MBxewJt8EjZfb?=
 =?us-ascii?Q?0ppNWXmWvbUM+c6oBu2zbTYqyucrQdzTDDfAQ+Sh1VMVOKm33pl7VcjDQhG6?=
 =?us-ascii?Q?9/DJMVw9vvbDTOuq5ayygxpJymeLiZNt154dGowdiqGGtxKkbFbL///RMm7S?=
 =?us-ascii?Q?It9WJqg0z/xI9obrbE/isE32myBcH196l7DqJUGs2bVPyEBLUKXiWrYLzp97?=
 =?us-ascii?Q?hGJmkG9D2GlHKW+iLCXbz2sbBgPwt0g6ujMV9097StcIv1KKdMPOLfEhLB18?=
 =?us-ascii?Q?Kfk83v/Hrl5WBZLLs8dfBMRs626UHHxCmD0cOFkKmLfojk8JOs3pBhUfRP3C?=
 =?us-ascii?Q?HSJvYyGhUlAEIm+710JLpddZZfxNAEisFS0EARC8vH+WSNgdOBNLXa4rxAC+?=
 =?us-ascii?Q?9ZWjMXv2FXZ/FQy+HudmsimLM8t7SWWRcjZIJ8FW1Fvt/yQ7SgupP5nJORn7?=
 =?us-ascii?Q?4v20vW3KS0lUE9z8X9kotdIjFcFhuphNKZz1OciSqpXo56UbSai5+a4s4DF6?=
 =?us-ascii?Q?b0WkmwMpabVKlaQfCjVyYN0kNNSAMULXphO1AFJKhH0uAnSt+0xgoHygyDVZ?=
 =?us-ascii?Q?D56Qshu/W7O1/4QlKVIKEv7W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24600364-49d6-4da8-79dc-08d925bfc433
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 12:13:01.3959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6VP66Gi3BJB3Uu7UdJN6GtK0qpJLCvYQoiOrzhX8z3bFFvtghT+u4JIfulJAkcCN9IxDEirUafqsD7U0rcwQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3208
Cc: netdev@vger.kernel.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net 0/3] net: ethernet: fixes for stmmac and
	fec
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

Small fixes for stmmac and fec.

Andy Duan (1):
  net: fec_ptp: add clock rate zero check

Joakim Zhang (2):
  net: stmmac: disable clocks in stmmac_remove_config_dt()
  net: stmmac: avoid kernel panic in tc_setup_taprio()

 drivers/net/ethernet/freescale/fec_ptp.c              | 4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c       | 8 +++++---
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
