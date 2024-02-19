Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4F385A12A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 11:40:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3479C6B47A;
	Mon, 19 Feb 2024 10:40:31 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2049.outbound.protection.outlook.com [40.107.6.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1476C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 10:40:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GU2VTH1eut77oclSE9R0wcSB+rnozKpoSNk9+pSwWEoAd+fCS9PaOCwJIBXPCTbn7x9N+5Q1D8a0cLYQ0bL/dlREnRbZAn1kl+pmh+IaO6aiV4MUn4MSHG4cLU74P3IoI8Y2ueyXTbDytG0FCnRI5WX2D52IRLTv55SfUA70laiKwNy0ZWv4DGBSf05tnxW+Vbrycd/Wv/V4l3L5zTAXnUqnk4p7UD8R95FN0H5cwUwWHi3wuT0NN87BqOS2S4GFhr/ivDZjE4IG5f6pACEkQ5EQxSZaE5EF175Yta0YkH9QtVkSkxMtKrJwgG13qgbu8lqtOC8BszQXvV+dfZqbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDbCBNu3oeyi5MymT0a6IQczxYyYAYRyEjLwSRNj4Vc=;
 b=ZwrcZqnLK9LuGVddo76C/RGqxWeCuYdt0MzT6pFVC+D48Qb7s6CSp/Tr4NefH+xSXW4YRzNdlnJdiFqVde9AmULYr/BHKa31zJ+Kgqn1S0DvJvbfR38b57lnIAip0BjgZm0PfAtoAe+wvmO83HazR8QVsuPphv7Y9iL5Z8AQR05Sa3W0dUGdRuiahj6TS30R8rePll3qL/umnLCqsvuf1fHp2bcr1wL2DSBR+hx4k8qA9cESazcJ+ecJ7TCnxoEJ2YyuIx8qN0rK1MN9z+FsXoKHI80Hhqs8AnKhcRY24MojahSOjToC7ZlFfHhXXhNQgQWGGAr+6SGw8AyD6CpFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=davemloft.net smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDbCBNu3oeyi5MymT0a6IQczxYyYAYRyEjLwSRNj4Vc=;
 b=rqTFRqoB48C6eY/HNPmSM2YXunaLNeM4Qi4m7Os4fpf3vp0yfSSsifNODnNRYANIRKnTLL3TOeyCPBjyPY41GT4wiL4LWiOpk5xC1cdzOzqiNp9aonoRADAU3Jh460tRUlUE/GjgvsHB6WDqrV658J2g2xQcPZs12ljM6MTuFy8=
Received: from AM6PR10CA0059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::36)
 by PA4PR02MB6511.eurprd02.prod.outlook.com (2603:10a6:102:fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 10:40:27 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::f6) by AM6PR10CA0059.outlook.office365.com
 (2603:10a6:209:80::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37 via Frontend
 Transport; Mon, 19 Feb 2024 10:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com; 
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 10:40:26 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 11:40:25 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 19 Feb
 2024 11:40:25 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 19 Feb 2024 11:40:25 +0100
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com
 [10.88.125.175])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id A1D7F149BF;
 Mon, 19 Feb 2024 11:40:25 +0100 (CET)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
 id 9D5DE62A1C; Mon, 19 Feb 2024 11:40:25 +0100 (CET)
Date: Mon, 19 Feb 2024 11:40:25 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20240219104025.GM22484@axis.com>
References: <20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com>
 <61bdd802-abe4-4544-8e48-9493a6bb99c8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61bdd802-abe4-4544-8e48-9493a6bb99c8@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|PA4PR02MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee31ed9-da99-4c0e-3369-08dc31372f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxdo/kh1rWZBn3lSzFN/H9ixiyoYfzpQZNSXPV1rWjTUUPJBXpqrcfggHt/Yvi1gDUOa48fEO5SsDy1CMoMzS9V2dXr+yP5jpNYbB6XxWpiI57alE5GP+DrJBMPtoR+MlW1GeQt6afWEmCOBcX3wdZY42jxBjUfNT3JfN3ToX1yLe3cyXn9q7Z+xPtSX+GACak6WQvidj52YvBBL7UG9Kn8zT7MziDwQfIfxN9bDb6qmXbzf8VUE19r7jzrPTpmRHyuDqftXu8KKTGwgAQbFtEHQjoolCbg+W8Sp5U4v/i7mOTEGIX7iGOxqQtQyiKw6STYCBQPEaxlgBTq/FBERMI8Zm8YmAtm/dTcQ7RQ6pA9x3k1f/faCu7QIz6y/nYtfscvvdgF1s1Nrpz2LUxiKh2t8ZocEmdAOSP78di235bL/2lj0v6byIZYIsEd3/jkYTUH4IILsX6JIAvqoNXu5jPfVfHIwZrGVTPTV5j3SWqrjMd0gIyXlaNw1eqlnlr5daZsthvqOAPnMguRudLKZT8jAFRCu07Mp5UGBPtn7ghYGV+aNHaW757+Sr59DtuHE9Imz/vfP6a3B688CoV0WxP5gPBkBHnvBugvunk0WRj1ILYA7GieMWrBQZWmH2uipunso5DjZWXS9/BeQ/DDjU+EI+9KGs8XOtUR3+w0ugVY=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006); DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 10:40:26.3556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee31ed9-da99-4c0e-3369-08dc31372f49
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6511
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 kernel@axis.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: mmc_core: Assign,
 don't add interrupt registers
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

On Fri, Feb 16, 2024 at 09:13:51AM -0800, Florian Fainelli wrote:
> So in premise I agree with the patch, that incrementing those is not the
> right way to go about them. However these registers are currently provided
> as part of the statistics set, but they should instead be accessed via the
> register dumping method.

You mean extending the dump register code to dump the MAC Management Counter
registers that are not counters?
From what I understand it's only the Rx and Tx interrupt and interrupt mask
registers that aren't counters. Oh, and the MMC control register itself?

To be honest, I don't think their use can justify the code churn.

> In either case you will get at best a snapshot of those two registers at any
> given time and I suppose this can help diagnose a stuck RX condition, but
> not much more than that.

Yeah, their use is very doubtful. For me, they only introduce more nonsense
data in my logs.

The Rx registers looks to have been added in the first version of the MMC
back in 2011, but the Tx registers never was.
In commit 1c901a46d57 Giuseppe mentions the MMC interrupts as something to
add later (if actually useful).

So Serge's suggestion to drop the entries completely is actually quite attractive.

> Florian

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
