Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMX4KB/3t2mfXQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:27:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0B52997A5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:27:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A74CDC08D19;
	Mon, 16 Mar 2026 12:27:10 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013024.outbound.protection.outlook.com
 [40.107.162.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ACB8C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OsbYuCGJv8Np9DS5+skjXLVbpNB1fb5fU6L5tVXIZd3IyfSKm2JCwBLH5diXHoWEKv6gmeLEXDMF9KT9IWD8OFmTzAoa6GXOB+Nybowuldhp6/FDg6V8kbBXbvgLnZH6JV0kTkG5rJH7SjKVH9bXbJcB03SelrpPSzGvAgOL0q2XEELagu3KC5fxQ1j7p+WRrfm0CUl/j8mYcyEeFhcWoQwXdOs8G9EcuEKUFSzxJ9vtCeLvbUbhyY3H0VoSfjYq1XgEkUzSIVG69+PTaQtN7n5g9XYcaOzQJ3+J/2aymA/g5/iot3uW8qamuydCG1MIbFWBPjgxKy5yy0jA3mAhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXPVx8tZmEUGsO7BZr5w+XXCMNwcunqUZgCOrtBcpwQ=;
 b=A2d65HKFQsf9r4DaGlBy03nVW8xPN4dbz6kVTCublPa3yqyPMtSJAX06ZRil7iIhMR295vBzciDgGmPBndwbJohqz2XLqFV1z0T+mvOHojp5Xt5lNRxtTKrEE5iqVXWIYDS9RlvdzSqlghkPBTlpROcIhwPMTaXQ4f4jWcnnAOguEJOjoAi1I6WgrC1yLWLuLeYw3kjz9heaV5D5gpJ8JffB1Vu+s2jXCNJJlN7yLDUu/hxPd+A5zNidgLhu2NI75rZrQYmUQg+x7uUh/gROGiYN2k99DDOHmXUAdBAsWS9qnX9QRZJJS2rmcFiYaOacfEanotYdeJuDPXpMTRwcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXPVx8tZmEUGsO7BZr5w+XXCMNwcunqUZgCOrtBcpwQ=;
 b=OKKyGAy2mT2mVYANI7jTouW0qXFEyoSfAX3oqKR0jQMQC/hD2sKJ7oBOMJN/0xxYirH0D6YHtr735DSFTl5htrdqcZks5fCneDRnECt8Pt/TNlr2q5Rof/g8fAbdMq//DqZoRwZDYz58yH354LxHgMxsf5LSq3ZV6U0VVc+7dr14TXpob7kjapc1TVqZnRJne7f+x+Hw1M1bza4+vgaRfwdACcyuVEfzFj1f/evQfRF/dvsug99MX8R4wRRkwMG9B7EaId0sNqVOBNl51g+SX4yj87XkbzejJM1iVJOO7bISY2Ltnf1BEyGSCAJPPVER08J2lNA61CvFpsq7ZM7WqQ==
Received: from DB8PR06CA0059.eurprd06.prod.outlook.com (2603:10a6:10:120::33)
 by DU0PR10MB7360.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:444::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Mon, 16 Mar
 2026 12:27:04 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::74) by DB8PR06CA0059.outlook.office365.com
 (2603:10a6:10:120::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Mon,
 16 Mar 2026 12:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 16 Mar 2026 12:27:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 13:29:18 +0100
Received: from [10.130.77.120] (10.130.77.120) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 13:26:58 +0100
Message-ID: <004f0397-6b86-4a0e-9dd8-29293fb43ffa@foss.st.com>
Date: Mon, 16 Mar 2026 13:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20260313181858.GA1427542@bhelgaas>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20260313181858.GA1427542@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|DU0PR10MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fdf3841-643a-4f1a-4692-08de83575482
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qiJphQ11jsS5Or1DWD5TVOYxuUwA9G/w27HRBXq5sXheUkeFmm5fY5/xc1V0EFPD0N88ab3uHnp2FTPpmNB98fBJlEcq1M3oRT9+wQ0XzOvC1i4a6JhDbKHGRB2zGgfQx/lWL4K9tW1GfgCpX+de5Xl/vqFRtV79jGvHodauXDGhGkWCTYsjIziRyqKlwLvz0nh362iOM/fMGEDi2oWPEj5YRZO96j3pGWR2NI7afW1CjJr86AABLjSKd/pmbAce/SmP4GANGKmT2fsifLxK0TCls5CIMtRzRg1rWLTbCCDGwd9juqsfaO6ur6cu4vIrSIKONn+f5BL+X+c6NiscMuSmfTsnVzAzMW+VZxFApSkVqf9DOzqNDIFVgb1AZx9MXWqVBrzdrnst33HGDEBtDyq6vuLNA4aHan8uWBRKH8JwGhX1otvoAIR5NzIDCTot9X0D5ZxM1Ny9Fs/begTfqWEFVc9iBvYs468IO4v6SNNZ9vWA14jInsJEj5ybYEANJF/ENB7RXtfyBYiTmz8Q7pT6hdEIyDRjuoulU/y6grLSLXpcZU4rNPFj8YaHUj7D9w23tQGVrTk8cDw7moJcBRzuRUZYorM9Pk4MYjyWbRyT5S1RjD3czTXJnJIG1nqkMo2FWUDSoVXUVmJLuJR9/mSPoCQHl6KxfNsIiyH8/RNwGzeZnZhLhEX1MnPTX90Ryuj1QDJmdn1lYtMxBrfa+LzZmXIZpEEfxuXMu2pM3bF2Zh6/U8QyhwDbB85KAodtHSTQK0/kVmdFBew79Lb99Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O+y6cixgVYTv+K2i1qubjbolSYJOW9O4mVPhdpFbxKOM6jupnZH3nZ2YBPeWhnXtboEm09MwnnAgR9rYSDvXDgEpMrDyYmLsT2P/8qQEnK5gRCWZx4Pkp1PpfPYAZ6AZFk+IsLARMlZiqGee0aRTjxGVNXjY+pSdU+zxNy+fMhTzmsfLt6Mnu9vTOGlPkgwWiIYNdFNEX5X9cezpYCVQgjfw3gQuWljTyIbuimXBRiZn7BM1vyZaJj2yRrxmXkpdPUtRFBdRIj8+4WNJPAm7PWvL0Jw6WZhJF946RIF7dNs2XA4S2MyugiJm61auIjUfxc1fgmVIJQjtO4iNVGA4l29Rl9Cg+5bPFdGKH0lCa0FNKiT47iXafQqksV6uSU6lAxTpOucjrjFpAjacxzyCH9g5OEZqB9TkHjahh7g0/byrEZCpOP/IaOLyUVsQu+MG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 12:27:03.5651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fdf3841-643a-4f1a-4692-08de83575482
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7360
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, Koichiro Den <den@valinux.co.jp>,
 linux-kselftest@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, kishon@kernel.org,
 robh@kernel.org, jesper.nilsson@axis.com, hayashi.kunihiko@socionext.com,
 jirislaby@kernel.org, magnus.damm@gmail.com, linux-arm-kernel@axis.com,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, 18255117159@163.com,
 marek.vasut+renesas@gmail.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, shuah@kernel.org,
 hongxing.zhu@nxp.com, mcoquelin.stm32@gmail.com, mani@kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, linux-omap@vger.kernel.org,
 rongqianfeng@vivo.com, mingkai.hu@nxp.com, roy.zang@nxp.com,
 linux-tegra@vger.kernel.org, cassel@kernel.org, linux.amoon@gmail.com,
 jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, thierry.reding@gmail.com,
 mhiramat@kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v10 3/8] PCI: dwc: Advertise dynamic
 inbound mapping support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:den@valinux.co.jp,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:marek.vasut+renesas@gmail.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:linux-omap@vger.kernel.org,
 m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux-tegra@vger.kernel.org,m:cassel@kernel.org,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:thierry.reding@gmail.com,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[christian.bruel@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,valinux.co.jp,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,google.com,vivo.com,renesas.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.bruel@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.838];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C0B52997A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/26 19:18, Bjorn Helgaas wrote:
> On Fri, Mar 13, 2026 at 04:59:26PM +0100, Christian Bruel wrote:
>> Hello,
>>
>> While testing after this series, I encountered regressions on the STM32MP2,
>> which I am unsure how to fix. The failures depend on the order in which the
>> tests are run.
> 
> c0f1506f6354 ("PCI: dwc: Advertise dynamic inbound mapping support")
> appeared in v7.0-rc1, so apparently we added a regression in v7.0?  Do
> we need to revert this?

With the rollback Koichiro proposed, the regression is now confined to 
the EPF bar subrange test, and possibly to platforms that do not have 
enough ATU entries (this I am not sure). Let's wait a bit to see if we 
can fix it.

Cheers

Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
