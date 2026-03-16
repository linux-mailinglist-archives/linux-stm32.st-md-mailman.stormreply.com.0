Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBUFG2v6t2n1XgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:41:15 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3472999B0
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 13:41:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E378C87ED8;
	Mon, 16 Mar 2026 12:41:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2EF7C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 12:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plr7mGkKohhlBk72S6qefmuQMGhdGq5t2UDSZIkfwj6yQRpxACWuKG6ZPy2O99It1Vy5NhLYL9hpkpac8nCnAKxeBSfKISdMGz5Ffu+FP624iAtCYtWfkJOAn72jpJmmTFu25VgwBkYeyEVjzTPYdCuRGkKSbQ5IYcqXM7W8tNCJpgZm9R7NgS2fvsN8cjqOT1vWhzBuHSWILZL29dy8TEjrarPVzYz0qCi17xGF7UpP3YdAe4lhzixk5aByglqnJDP5MWo1a+H/Y3yuLS/yvQJMmb9W4WvJJDgVNF6zu7AUJDL8bZbKMesPM2KtYNCfmwwjY++f3W/TEa5VJHjRuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFeTKtO1ufI5gH/H4m5HJwsDUC2IS5k935VF2z9Nx1c=;
 b=Nan0sTpyKOJkK7EooSRfsBToB/vCA36ze6ixdDqy0B7e/BwxKyNZXIu23pdQoQiDZNWxtbkmdMa+KsMhhG1rrfgNNUeLtJSisJDmc1BpBbRc2FB7SOvpJlt/ArnyKky9qB1w82gw7S8/7plik6jwCXCQplQgcq9zmy5+V9RmBe2rjvA9msHQ+H6opLOyapA/unYRZTkg+6Pg6KjwldBCgOqCqqFCDbIpnxmduDv4Jx5ccZ/uHpU8QfHsfi89sHyhUvNOQMGB+bKcVKUuIPuLq79z45+G16OMQR4ON0DxsC+ECr7EY09YXj/ZNQcmlGpEtuPT1cfGInkGGLTTiC63kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFeTKtO1ufI5gH/H4m5HJwsDUC2IS5k935VF2z9Nx1c=;
 b=liO/lMASiQtS7DjhTtyfORdBJkSHW3/jVOr6IEyHK7yBjzm5ORKGeKI/ZMi80jY6NeH6iGh6LwdhmAD9fiQREkWfU+PfeCOSfw2uHRxqSXUGbHql6BueymhKo3DwSxtWsf9vokCAX7p0GlcSkrLfx8QeDOBlVYbabrS3NjkmjBZ2HeJ+C218WZr4hCOzcy2zdNMUz1NZV9iQiS87hhI7M0HnlikEDARE+ust61G4JoF+gFnJ71xp4c0PlAeANogTF4PojjJjNNgQzRBU9v3g8+v6xN3J/Uql+l/yz6jjm2k0YeDxCrpe9ltTzWQDbFexa6EWIQIkdRBYKZAcAXK7YQ==
Received: from DU6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::8) by
 GVXPR10MB9428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 12:41:07 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::5b) by DU6P191CA0049.outlook.office365.com
 (2603:10a6:10:53e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 12:41:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 16 Mar 2026 12:41:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 13:43:24 +0100
Received: from [10.130.77.120] (10.130.77.120) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 13:41:04 +0100
Message-ID: <5e485218-becf-499b-8a07-d25358504807@foss.st.com>
Date: Mon, 16 Mar 2026 13:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Koichiro Den <den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
 <20260124145012.2794108-4-den@valinux.co.jp>
 <b2b03ebe-9482-4a13-b22f-7b44da096eed@foss.st.com>
 <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <tkfhaovpmaoodo35attvmbnpukcqgmwyrxmfgiwjy2dga65cgl@hmj4mx2n44ki>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039230:EE_|GVXPR10MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 40765379-7348-4900-8e15-08de83594b29
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: QqAcbgBlXt6JRa8dGSi2Cxdiu6q3lBdEv0/nJ4sp9M7FHeF5cUmCuVrOSmEqjvwn+CVZhG8IOpeBxpnovf+xL5mxjamgTPkJ5kojPmXyjFeHILkoC2neCROylq7YiZkh/NbpBOYzaM+6qgPBGo4VhZ01lg6n3qiGKZ7umw0q8isEoDRa2LiWTTOBrag79phrLurCgkzkBC7xYvjDxRhYm71nLFUYx0M8On+AD4Ylgxavqvs1jG5OXfBeR/phXf040DsGZmWZU0t2V3SVKU6UFSUFMAGN+FmsnPDGgOqNMx+eN+Yq/P+qh5nbo6PhwzknMeTCxs59ceyZ+NZdFDbw0ZMMxl6/X0SVWb40uIwGG/QtthmCbR7bjPR8U7pJblPAL7MUgU75I4MLKixSqcWhtXZjlPse4R3jxryUWlEwkUqFhRWeuTb4mx0979CkgICSdnMlwvAznj0RC5qB07dm5Kjnkjs7XHkXqhb7MUWzpU1S9sISSHoVDoyrzppWxtPuDOlNqQ6WITFQ6y76px51fgOHsML8Ec7g5L242zYhFcqoLPraRV61EAXNIwd12oixkjBBJbUKTe36VYVJQqFxsZxt9XgQtSeb84gzpy+uXlH58TF5mg4TsjKPeiE231PR3gwB/XWxxyD7a9XLVDbyi8ty4qQnGf8yMp7EO6w8SyBcnZNSQxw+2T3WsboMOlN7aZyiRv4CEgKuh/Cnud2dyPSsonBSvlrK10whyY1gysMSfRia2EZsg5l34n/dHjRk9/DpBYbZ/Ffoktl4YH8MYA==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: myyTgjPCpS6E9Wq7PZExwdOA/nLUpsH32pzqkeb2Ityek2ZD6/RtoZRmKcPOGJ2MlrIiC5cbVWH0LqTa+0vFAof+AtA9zgZoO9euVtBY4nPjmO1OF7gIuTGFZ/+RkMtqWKmgZAXp2nV7AVp3GWNNMklMpIGXYL8LEI9ZMPi9dIUocHij+5OWLFvjf7VvxukYzN6XdJa0BsdT75KXAhi6kYVCIyiZW8dxYNTZssRpJvQDDEO9MYadsjXe3Cb7odvx9M/+jplwnSC7Fask53tqL899njMgiQoVS2VwkzDpuBzA50MkQ8Ik8Dhw+yKKzO0IxsQ974zjfJhGWrRsRqq6vvzlUF7xRGMGgw3+sL2D46VhhBPH2iulbB9t6OXGOlmrE/D4GMPpFJvUpmxYAHaGFx3vTrvxb9DkIIJTXHZsL6B9C2gWcutDnBzLyPByHpY/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 12:41:06.8725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40765379-7348-4900-8e15-08de83594b29
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9428
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com,
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
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:den@valinux.co.jp,m:imx@lists.linux.dev,m:vigneshr@ti.com,m:geert+renesas@glider.be,m:linux-pci@vger.kernel.org,m:lpieralisi@kernel.org,m:Frank.Li@nxp.com,m:minghuan.Lian@nxp.com,m:thierry.reding@gmail.com,m:linux-kselftest@vger.kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:heiko@sntech.de,m:kishon@kernel.org,m:robh@kernel.org,m:jesper.nilsson@axis.com,m:hayashi.kunihiko@socionext.com,m:jirislaby@kernel.org,m:magnus.damm@gmail.com,m:linux-arm-kernel@axis.com,m:jonathanh@nvidia.com,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:18255117159@163.com,m:marek.vasut+renesas@gmail.com,m:s-vadapalli@ti.com,m:kwilczynski@kernel.org,m:shawn.lin@rock-chips.com,m:srikanth.thokala@intel.com,m:shuah@kernel.org,m:hongxing.zhu@nxp.com,m:mcoquelin.stm32@gmail.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:linux-omap@vger.kerne
 l.org,m:rongqianfeng@vivo.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:linux-tegra@vger.kernel.org,m:cassel@kernel.org,m:linux.amoon@gmail.com,m:jingoohan1@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:linux-kernel@vger.kernel.org,m:vidyas@nvidia.com,m:linux-renesas-soc@vger.kernel.org,m:mhiramat@kernel.org,m:kernel@pengutronix.de,m:shawnguo@kernel.org,m:nicolas.frattaroli@collabora.com,m:l.stach@pengutronix.de,m:geert@glider.be,m:thierryreding@gmail.com,m:magnusdamm@gmail.com,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[christian.bruel@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,ti.com,glider.be,vger.kernel.org,kernel.org,nxp.com,gmail.com,st-md-mailman.stormreply.com,sntech.de,axis.com,socionext.com,nvidia.com,lists.infradead.org,163.com,rock-chips.com,intel.com,pengutronix.de,lists.ozlabs.org,google.com,vivo.com,renesas.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.bruel@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.818];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B3472999B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Koichiro,

> 
> If I understood the problem correctly, would something like the patch below
> address it? My expectation is that the subrange mapping test would then fail
> consistently on platforms that do not have enough free IB iATU regions.
> 

Thank you for your patch. Yes, now the bar subrange tests fail 
consistently, so that is enough to say this is not a regression.

However, I think there was a clear BAR missing somewhere before running 
the tests in the EPF driver, as the BARs could be reallocated during the 
other tests. This is not due to the subrange tests, but the EPF test 
driver supposes a 1:1 BAR/ATU mapping. Now this assumption is broken. 
I'm wondering if this could be improved to make the subrange tests pass 
on all platforms

Cheers

Christian







_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
