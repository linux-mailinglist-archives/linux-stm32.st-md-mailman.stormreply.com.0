Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACF585F5B1
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 11:28:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA5A8C6B47A;
	Thu, 22 Feb 2024 10:28:13 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2088.outbound.protection.outlook.com [40.107.6.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 573E1C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 10:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCt9BD+eOacpE5XOfIoCogDG4j1GalETRo0Y8eTE+csfV4SNj0m1C0kjjFrO3Mqsu7NLxbMApL44TFWpESAeW9/U1Cpn+Yf0Qjz2jj3Viu4ob+/Vn0LusPVLg01BitWuy+KCFQLMRnFT+h28RtsXbOoNw1VXl5BItE2QgVqDyZ4c1YflMTcvXXKFeue+13nreMn2a/EEhLB/+GNZsr2PS3/DFSFRi0wVRu5vkt+cFxnNtvy+AOycFzXy9s/3Tk5RXJ+i7UzNIPktn28J2qTbu5Rkg1v3s///7SKAVv9kfW+cCVTx0VJf0TYG/EqxyW1OkeuBu0/u6k3aurT7BCoZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orMnOBxdCCwGfclyetHsTbVp8ku7B2oHijIo8C7dC30=;
 b=VtCzTiBb2iYd/yH6mg4kRylw0Q7mIetr+boJnEaGyVOxwR8xcDZJzFzUAZIl0jN40O2cwmZb69kf+G3oQY+7m7vJGC7BbWizctso2sFGA6gX6+5SwqgNGuaEIefONkcWAlcRN+l6U9hIUBhObDxZH40OqGbESIe74zv0kbdSf5zs2AMQT1g5Dup6M4M/VTIoILiMWb8mbNVBjdMfO50TZEEpVOjVb/GU1aXGzIsRm9HerjheyOPYbW6VlKijdPcWVtvT7j+oYzcePEnb0DN6UmT/6ohY60HVaIC1YMonp+gUrBxoFN6hI/BeCstETrVoaXZLLBlCtCp3QVqQ94s38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=davemloft.net smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orMnOBxdCCwGfclyetHsTbVp8ku7B2oHijIo8C7dC30=;
 b=rzNScH8pLlaZm43GpvVqZQtoLxp7U0M2a43MKLw+/7Y+VIU0qFfUXCXtTS209ueVopbSTMhdj4s8+eXXpkZ5U6BttcXlfO7GgstRlimu1wpfygDLX4l+ekV8HgYsZMsx/iPocxlIn6PPuWKG9J33X/uPGt1RCx3fKbJa4P+Z2PU=
Received: from AS9PR06CA0340.eurprd06.prod.outlook.com (2603:10a6:20b:466::35)
 by VI1PR02MB6477.eurprd02.prod.outlook.com (2603:10a6:800:193::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Thu, 22 Feb
 2024 10:28:10 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:466:cafe::80) by AS9PR06CA0340.outlook.office365.com
 (2603:10a6:20b:466::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.41 via Frontend
 Transport; Thu, 22 Feb 2024 10:28:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com; 
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 10:28:09 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 22 Feb
 2024 11:28:09 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 22 Feb
 2024 11:28:08 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 22 Feb 2024 11:28:08 +0100
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com
 [10.88.125.175])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id B6CBA1470C;
 Thu, 22 Feb 2024 11:28:08 +0100 (CET)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
 id DA139628F9; Thu, 22 Feb 2024 11:28:08 +0100 (CET)
Date: Thu, 22 Feb 2024 11:28:08 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <20240222102808.GY22484@axis.com>
References: <20240220-stmmac_stats-v2-1-0a78863bec70@axis.com>
 <55c1527f778ada6458dfc3d626d36e5367886dbb.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55c1527f778ada6458dfc3d626d36e5367886dbb.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019E:EE_|VI1PR02MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7da7ef-c060-4b4f-60b9-08dc3390f737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Ms3e+RuwyAhj2oPuEHoJs3lkpijt/Jgw+F7b1o9iYpjsDlywCapeMUs16fEmPKYBhV2OkQAADaab4yPRjdA64tGAV9NgZ2xOXC5c5+QY5FvKq6jo4ZJ42P83CfRBntMiQj+6jAnhlgw/yoPp3OZZyWps3MwyWL6AR3bew/Z6oilEl6HssT987rxIZ1Zhk1GWSIHxpJMPUZMAg2uFSPP9pk3t5G5tIcJ84P8CynNga9Qft+qNRyIubIbrqWb6yO2cEKa9swt7vCgjsOFnqT+Jnldc/kdeNXD0yEbQjO7eT6GjGy1Nlk5JC9EdzyY7WhK+dMD4r8pKt+tdcrJNuRa4opChHD49aw37Z+LbBXl64Qtf0LA/dkDMtxaIUCplawbZXM8bwsTfNQgFIZlHAoYkToXWenMSGTuAD0HhNn2u6okvVU9Y7O6XfqTjeVfppWMpy/e6mJ8Ep0197vadEhQ+ciB82kQuBZJ/nm8eg6tgvbM68Mx5BI2EV7xjmOnPDjpvqnQpnCiHin/YVEpPN17rsPYvd7wR0OYSEu1ozb4JXFgVhp60cKuSUG4jtr17YZ1Sb8r6V+d6Polw54Nd18GHB8dnTvg87ZT26BfxZRyUjevhmL9Xf15S9lLHz3vZxgVxa4Gi/H/OCykdwyE9jhvHKWILHwSmRcN17TkB3oGOlU=
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 10:28:09.5051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7da7ef-c060-4b4f-60b9-08dc3390f737
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6477
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 kernel@axis.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: mmc_core: Drop interrupt
 registers from stats
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

On Thu, Feb 22, 2024 at 10:38:53AM +0100, Paolo Abeni wrote:
> On Tue, 2024-02-20 at 13:00 +0100, Jesper Nilsson wrote:
> > The MMC IPC interrupt status and interrupt mask registers are
> > of little use as Ethernet statistics, but incrementing counters
> > based on the current interrupt and interrupt mask registers
> > makes them actively misleading.
> > 
> > For example, if the interrupt mask is set to 0x08420842,
> > the current code will increment by that amount each iteration,
> > leading to the following sequence of nonsense:
> > 
> > mmc_rx_ipc_intr_mask: 969816526
> > mmc_rx_ipc_intr_mask: 1108361744
> > 
> > These registers have been included in the Ethernet statistics
> > since the first version of MMC back in 2011 (commit 1c901a46d57).
> > That commit also mentions the MMC interrupts as
> > "something to add later (if actually useful)".
> > 
> > If the registers are actually useful, they should probably
> > be part of the Ethernet register dump instead of statistics,
> > but for now, drop the counters for mmc_rx_ipc_intr and
> > mmc_rx_ipc_intr_mask completely.
> > 
> > Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> 
> It looks like this could target the 'net' tree. Anyway it does not
> apply cleanly to 'net' nor 'net-next'. Could you please rebase &&
> repost, including Serge's tags and explicitly setting the target tree
> into the subj prefix?

Yeah, will do. My v1 patch applied cleanly to net-next,
but I didn't check the v2. My bad.

> Thanks!
> 
> Paolo

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
