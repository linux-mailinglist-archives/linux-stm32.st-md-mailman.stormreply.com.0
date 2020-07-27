Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBD22EC1F
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 14:27:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44FF5C36B2E;
	Mon, 27 Jul 2020 12:27:36 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3C8EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 11:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXQtcFkhDs2keY7JzCLc7z77CQHl9PU2qqjswyCPPB6Bk64qbyQ/HOyu3AJ73fhpI4owWbRPArXhhpeQu5itRJ5ieZYtBN3gLX+dAZAcGoaafQoajQz7tBY+eQ91cUFrV/WpGfpgJCSjIMkYApmkmODAcOTn0qUZdpBOzFfe7RBx8F7Npbc3XzoevidnNul4U+Tk2BtdYfk2mBaYhpWeT7Pop41JJ11thbB7DrYTVYCHuUR+gaD3nSKKWFRUzSXyHnbWMSHtj3VAKexhHxwYuVSV7dvN5oy1F0YZP9bdruyGnBZlbJYdoccTxwx6KYydkugtQ0JPWFTq1SUZ/RqaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNKXLP0PbagGacXWTTUo8OuNepD5XC5OdU1vyNUQZwo=;
 b=IbNZEuWbRWmJkp65p2+kbyFtLUibaWr5wLWB4Cg6ClilRD/U+YRkBJVl/5HSCaavnZKVtzsD1/QYlIB/EJP7aONv/NM/pPNfc24XmdOzFbWg7XTYMrW0fYp2OuENTYTAdRtwh458CWqlaBmw5t9O5E/IEt3yrCWSTq8YPgVd7XUxTzQpCrDAcaS2zq5rkuYFmMujuJuAC0gNeg6/0xjcTp+9EsWDnLVnzcVYDj6OQZoU2AYvnqOXNa/noUisS2ALdgz722qebrAIhwckeOsoTVUkhj+p7oqXU0jYgR7x2suL/O36NLXSed5Q2f/bqiZU0rByI/Kh7LAbhgMF5C2yVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNKXLP0PbagGacXWTTUo8OuNepD5XC5OdU1vyNUQZwo=;
 b=KqtCWh0rOKSpBVJe6vIjdu0oOT61aF0cURji7PE2+nd52FGkxlfGUaWEFkyxGHFo7NN2qId5bQgrLtkETIdnYYN43fUQpFrTJhQBFkqlfHDd1Ix/bpRMDxe93MOTwMZaS1XLmikQIzHvVEArSPrTuuUN4fkHVpXkOLSDJI3eCsE=
Authentication-Results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=synaptics.com;
Received: from BYAPR03MB3573.namprd03.prod.outlook.com (2603:10b6:a02:ae::15)
 by BYAPR03MB4198.namprd03.prod.outlook.com (2603:10b6:a03:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 11:06:04 +0000
Received: from BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c]) by BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 11:06:04 +0000
Date: Mon, 27 Jul 2020 19:01:48 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>
Message-ID: <20200727190148.78bab66e@xhacker.debian>
In-Reply-To: <20200727190045.36f247cc@xhacker.debian>
References: <20200727190045.36f247cc@xhacker.debian>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: TY2PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:404:a::24) To BYAPR03MB3573.namprd03.prod.outlook.com
 (2603:10b6:a02:ae::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (124.74.246.114) by
 TY2PR01CA0012.jpnprd01.prod.outlook.com (2603:1096:404:a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Mon, 27 Jul 2020 11:06:01 +0000
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93c91045-0083-4ef0-ded5-08d8321d0ddd
X-MS-TrafficTypeDiagnostic: BYAPR03MB4198:
X-Microsoft-Antispam-PRVS: <BYAPR03MB41987D08FB847D6CBA388FB5ED720@BYAPR03MB4198.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eUW1zVOEXA4gec/Wb5cLC/SyfKbguX5niFfk6JrcySfO0Bymy1NYUm71h2c6HiR7aEaNQGPLP270mpWxGFGWyRrzJjedW6fVrhxYHdlhZ6xu1KHXJFatt/Idw9rnksOetzA/dho9r+hGEEBZWkzoI3LArVPThqNRwLR7QKOAPkv/iLAjY+afvBqZB9+xWVZJvMJ5yI1Tm4KdY2EwuLfica0O1R1MVUSXLuFH/F5ClxbFgKsUpHD5PevVPE9QJ6PR1ot3q4uNecZY6dnbrItJmV3zVt26ylMUDOVRr9IBAbOoVKMGwV4gZHFO9GhtcJuWJ0M9kWTiccythIQldv05Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3573.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(346002)(376002)(396003)(136003)(66946007)(66476007)(66556008)(5660300002)(6506007)(55016002)(86362001)(52116002)(9686003)(4744005)(8676002)(478600001)(110136005)(7696005)(316002)(1076003)(4326008)(16526019)(8936002)(26005)(956004)(83380400001)(2906002)(6666004)(7416002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: hC707TNY8xa9vG1wxowy2Qf+fmgKH8W2Penc6eo/2XP/DFcWMrF4MXqYz2iU6ZAuFUqiiKRxu7nJGUp0jt5k68larAYBTIe/7xCbJdW4BuMqpOgjK6fzJ7cIWS164YSzK4y4lEuwzquVDXYdpW3hM8UBupu9/pLxfzMz7h9IWYsGC8ea62teAXvDKAUlIJ1OW1H/r9lFgiBrdLwLh4DvwnbNvGXt4elzo6Ot5dmb2LqQxAcQaMbp+HJv1ydgg0Nd5dPYlkYNi72Z4I/Cc/eVoxYcU0FX3+3O4vzLApLKTVFoxCntPC2/BBTsRkcKl9neU7ZfKv9c7FERuPGzXNSxiCuBzz2Jh+TcDu3CiDuD4T8f+BgdpyqMOnwuo/O2gDhSZgE927vZuZHYR5CXIMUB9vUgfRAcI0DZhhDKDmgFj6q2+UJ1WK9RiCw0mA0ddd8itY9ja6PWV2wY34Xl6fXXu7Qp+honhuBza2e9dARCzruvq2p+arFW8a6lSj7uv2by
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c91045-0083-4ef0-ded5-08d8321d0ddd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3573.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 11:06:04.6886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LLoOWfjiOOgopwVEMPrK/tugYc8gfA+jw9l0WkRy/LcOswipjictuGK72Phd2iGEaH2ISEWLtoesGvlb7oRGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4198
X-Mailman-Approved-At: Mon, 27 Jul 2020 12:27:34 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/5] net: stmmac: Remove WAKE_MAGIC if HW
 shows no pmt_magic_frame
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

Remove WAKE_MAGIC from supported modes if the HW capability register
shows no support for pmt_magic_frame.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index eae11c585025..9e0af626a24a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -603,6 +603,8 @@ static void stmmac_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 	mutex_lock(&priv->lock);
 	if (device_can_wakeup(priv->device)) {
 		wol->supported = WAKE_MAGIC | WAKE_UCAST;
+		if (priv->hw_cap_support && !priv->dma_cap.pmt_magic_frame)
+			wol->supported &= ~WAKE_MAGIC;
 		wol->wolopts = priv->wolopts;
 	}
 	mutex_unlock(&priv->lock);
-- 
2.28.0.rc0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
