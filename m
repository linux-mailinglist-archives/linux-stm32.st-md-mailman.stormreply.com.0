Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE022EC1E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 14:27:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C41BC36B27;
	Mon, 27 Jul 2020 12:27:36 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 681E4C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 11:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuTu1OrisARg/xJ7e2jpna6ApWPVpQtkAsDKgqFdqga4hglZu6op3gDe/70Suln6I43nDMVmA+2SnwgCH74t8GDvRTK9hdwmMshJ9Hc0pi5lWdTZbuWXLQQESO4v7xSAj58d1AoutozX3CW5Tww9grC4foKowhrTgYMFgwok0k95VB8rDQf5bjuhD4BxzYOZJVaO74pBuWcOFqUrkpmFZ6dytgjgF7QPjhVMwKVdZrxf9AUQPaSfGehbcRHvp6iO0Bxa+Y7b3PR9Yz9HfI+nAIECM5eFZrL9rWaPjw3+SwZtpwU/hZow1/oqQQMO+7Xnjcp1misme0ZDGK/oxDLgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0mJ5fOY5w5YplvJ8PfMzlPu/g0W4Z3tgtxf/esFL/M=;
 b=bV+DanoWHUNefzO7YbHNFWzwGKgqGn9QYWnBy3ZGrDKuEaYpRiqoGhKHuJgnJKpaMZ3p53dqflpSaafyfYFe/0cwB72hMVkESG+LVRbvxeSG88MTs66SbBE+XOJYm4fwthtNoa1VPTq2Tdrk2wkKODh/QPEdY9zbh63WM1sJqe8/YnUCgoht+FpIgrDe05/bJi+KqMgp5UiTZAMjGF5WCc97ElNupSdiAjt8dHajYJ+NXgEmxAM4q/TJBJJBLswrhf5m3H6cnzDREz4YPPVKebVaUozloqV9+GjXwQl1sM0Ur7EooO5lxCDVvtjTnXWXpVOBRLhFsp+y8ZWH0Pk4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0mJ5fOY5w5YplvJ8PfMzlPu/g0W4Z3tgtxf/esFL/M=;
 b=Plq9fievo6phw2KZvgBDESbDe52wqj9AoBQCvG6xzOd2QqC1AiFXJV0Tz0bJsb38SGIPhRCsUEEAQ1l63c+X8WT9NRAXYB4qYrk4R5Db/x7Fz0vWExk7XvJ2SXJrkbd5p6w8xJL7c+dtk+Qmu+EHuUaFmJU3BYULSulORUQHhF4=
Authentication-Results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=synaptics.com;
Received: from BYAPR03MB3573.namprd03.prod.outlook.com (2603:10b6:a02:ae::15)
 by BYAPR03MB4198.namprd03.prod.outlook.com (2603:10b6:a03:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 11:05:54 +0000
Received: from BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c]) by BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c%4]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 11:05:53 +0000
Date: Mon, 27 Jul 2020 19:05:20 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>
Message-ID: <20200727190520.3c07cf41@xhacker.debian>
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
 15.20.3216.23 via Frontend Transport; Mon, 27 Jul 2020 11:05:50 +0000
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5d2d1ba-c36e-46db-6fd2-08d8321d0760
X-MS-TrafficTypeDiagnostic: BYAPR03MB4198:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4198983DBB48B1BFE7A29079ED720@BYAPR03MB4198.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zSC9B9vVhX6kYEA5qvR2ioC8hPtz9Ck7Hi/zT9gYl/8NuyQ/v/6ZZWu9D+AJ2vvNoVB0nvDc4cNTiRRABAwOcL9jHcYT2Cp/LCo/i5ywgEB/d3E3NHi7A6DYd1xpprGRhG09AQfndcbshFbIRQFd0fqIfP4F4a40bh3Xvo7pCKI92kyvEPhZD+wNtSroBBOHRtpK88FpUtiYvdr1236V2WccPIEo3V7TwsI76T2djMKgmXw13ZqpVDcQ764JQa6FbWJsUBbBwj2Nu/oOGRy/tfjvM6NEdQh9vodn0F+AE5f0iaVDXirtWnfSCMqQO9MA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3573.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(346002)(376002)(396003)(136003)(66946007)(66476007)(66556008)(5660300002)(6506007)(55016002)(86362001)(52116002)(9686003)(8676002)(478600001)(110136005)(7696005)(316002)(1076003)(4326008)(16526019)(8936002)(26005)(956004)(83380400001)(2906002)(6666004)(7416002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: U9gOipn4XE70Q401JoA2yP1BanG2qA/6l+8h8T/plTJyPUxqayZTe6b5Y3mLUPLYKZOsBgikWCh3hH7w5zofrFJaHiRtTCZVRv7HfuAc9jsPT8alN+iwd5sEFajJkanLrfI3zNCSK/k2RMJK3JSjUiAmuQUPlzytKoWdO0F4Vk2PaCUmLr7pGtSFJkkBAM+0wMjYrkodYy1HNvguaBQwEs3tbvXCq/WY9DmdAr6870sqlSadaPodO3+ZNs3vgOEkZuMk/o0y4DGbQdKwOoaKW4ovHH/Kioc4Euabw0K+myXrSp+qSvZuOxumdCOdlt4WOQNGgb/utO0VajsVMYtO8OT9ihaJDtYV2+yZ70VX7NCYMF/kceRzm2Qfgn2Tz0+FtTdN3/Ni1EBkz5Thnh6xIz449a7ItOcEZG9nWFG9hhRzUad2knl7OTeRBPdxHwf7zK5ZRMBizRLyIRxQutfOicua2vr+GflYr9xFkCz7rg5hY/jveLjHd56pQwBLqMHy
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d2d1ba-c36e-46db-6fd2-08d8321d0760
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3573.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 11:05:53.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfP9CxjVXZVM0coxsJV+6H25yvuL9PgXyLsOJgc4fgX7nLEE3Ikd5T0ivZYNOUURfpJa4lWe1wS60NS4ztmdLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4198
X-Mailman-Approved-At: Mon, 27 Jul 2020 12:27:34 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/5] net: stmmac: Speed down the PHY if WoL to
	save energy
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

When WoL is enabled and the machine is powered off, the PHY remains
waiting for wakeup events at max speed, which is a waste of energy.

Slow down the PHY speed before stopping the ethernet if WoL is enabled,

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 32c0c9647b87..89b2b3472852 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2823,6 +2823,8 @@ static int stmmac_open(struct net_device *dev)
 	stmmac_init_coalesce(priv);
 
 	phylink_start(priv->phylink);
+	/* We may have called phylink_speed_down before */
+	phylink_speed_up(priv->phylink);
 
 	/* Request the IRQ lines */
 	ret = request_irq(dev->irq, stmmac_interrupt,
@@ -2896,6 +2898,8 @@ static int stmmac_release(struct net_device *dev)
 	if (priv->eee_enabled)
 		del_timer_sync(&priv->eee_ctrl_timer);
 
+	if (device_may_wakeup(priv->device))
+		phylink_speed_down(priv->phylink, false);
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 	phylink_disconnect_phy(priv->phylink);
@@ -5095,6 +5099,8 @@ int stmmac_suspend(struct device *dev)
 	} else {
 		mutex_unlock(&priv->lock);
 		rtnl_lock();
+		if (device_may_wakeup(priv->device))
+			phylink_speed_down(priv->phylink, false);
 		phylink_stop(priv->phylink);
 		rtnl_unlock();
 		mutex_lock(&priv->lock);
@@ -5207,6 +5213,8 @@ int stmmac_resume(struct device *dev)
 	if (!device_may_wakeup(priv->device) || !priv->plat->pmt) {
 		rtnl_lock();
 		phylink_start(priv->phylink);
+		/* We may have called phylink_speed_down before */
+		phylink_speed_up(priv->phylink);
 		rtnl_unlock();
 	}
 
-- 
2.28.0.rc0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
