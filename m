Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RuWDB/QBLGrdJQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5B6798B9
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 14:56:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=Y+Krjupz;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4985C8F297;
	Fri, 12 Jun 2026 12:56:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013014.outbound.protection.outlook.com
 [40.107.162.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D491DC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 12:56:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJARFJHiGIIiUjIl3UyLhiho7IIS8iPehP2WQtbq+21mkc4y0SlQsMwjO+7BGEoNyKCS4f3N30MERTobj3pvjwJlmD5iuZ9dn13sFoMvlVqaAdWne+oNXaXWWxO1TJj9hQjmV7ZqLLEL6Zbld4EXvUs+EUyPE/bgwr5xxXMkqEsCXLMis9FHA7XR8K1v7RaC0nsnv0MiPLmzO2l0sF/laJGkGZnPEg94qYssCMZkWfJq7Y78dCGrJzjqH5l6gGBFUJkrGjo3XrWiIQczwmJ/OZbmq8x7clMKvUXL91DlDThxxmy71H3zun/xncyYxX8tpOpOuMDEOYqGjo+o4WfPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDi1MyxrSLUx6GyqPfPavwF3oH1yQiqEJj/415VwtX8=;
 b=V5xPkCEGoN8iSBxWR05yVFXNy3q1C0icLBbUbITc1AzB4h1YjdcSlgqQCRGR3UgnJYKCVBZzcgF9moafeK5Js3xyrWZFf37UndqWVfOnbDWvZxhkjStDEn+wvEbT05FctXVnBqd0swLgGhPyxPgI3LN7dUIvqlusKZjouaRMp6u7F/icWAPrazvneDgzkYetsN53ld+wTNhTnMxbk1NWiVofIjXGqLb4QA8i2sPtjSofXs7Yx+4+ZTLe+bdM2ZzaGnIS7fNkMtYsvezXalnhrISyAYuUyfpc/mqzv3KryxHXboykSi/+tWWSMAhngnBhpzqbHReHxnBFvIpeP+rqCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDi1MyxrSLUx6GyqPfPavwF3oH1yQiqEJj/415VwtX8=;
 b=Y+KrjupzucNY42rBgLiTFMrd+hoQAv3IFHwArsYoMv28l0kjJjhQszMHkFNRe6vXsw2fl17K3FSeKPbGXLWWK8D/j98iaFKeTVjb91sR1E+3akmX9hRemghyIptOkrkw6T9oIGNmm2Yui1DCE0Zntq+FqbdugrvdMKcGSokpZ/M3nLo+DiPaEADE5nnEBDirZN/mSjtVHvm1mcCg/P5q+6kmW0639+MXSNtEA6FvFyJdR8UjGQElgGYu/OKl3MsKt0xShoc4Cepo+aqXj8TVAdV4LX0LuQFtO/jjd4fPm1OCGUVLvxXZjYepiDs2W+0SRgWaKjPAise8JBckW8ZJnA==
Received: from DUZPR01CA0206.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::21) by VI1PR10MB3341.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:13b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Fri, 12 Jun
 2026 12:56:13 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::9b) by DUZPR01CA0206.outlook.office365.com
 (2603:10a6:10:4b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 12:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 12:56:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 15:00:27 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 12 Jun
 2026 14:56:12 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Fri, 12 Jun 2026 14:56:01 +0200
Message-ID: <20260612-node_reordering-v2-0-f68032ca3088@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOEBLGoC/3WNQQ7CIBBFr9LMWhrAlqauvIdpjJShZSGYmYZoG
 u4udu/y/eS9vwMjBWS4NDsQ5sAhxQr61MC8PuKCIrjKoKU20iglYnJ4J0zkqhgX0dnRqrO2Ug4
 eqvUi9OF9FG9T5TXwluhzHGT1W/+3shJSDNir0evZdr25+sTc8tbO6QlTKeULA4Jqo7AAAAA=
X-Change-ID: 20260611-node_reordering-4b9b132b007f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|VI1PR10MB3341:EE_
X-MS-Office365-Filtering-Correlation-Id: 82752a1b-a070-445f-36f3-08dec881fbb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: TUj594l8vFYfvkEQ6/oLVKlZ2sHb1OJ8gJZBsaWl0fNeuFkUwTwN5uaJQ/0f0sA6v0rjMksEOhlxTFs8ecBk8g3Kzbt6k4/v47YPYDnDk1oUm430m+563Q+EpEE/AEtUMCYjBcQ7badO6LpDmwcYkfwQtewxKLtRH4dNx0l/UeD27dhPyGbuBFnbDKUNrKwd46xQb0AgMUXPcSU0N/wz/8PVoMZS/dBBvMF9gbLkLt7izFiYNXCky1KqFV2RPwGCPanjzuVuzF8J70DqtRU3eXcYo67f6puhpYRdy99Q3RnhIt7ISOMtUUUstXZvs1dL4LgIXR2ybaRv00KOpyJniCm+IM+tUBAJGrYBL1p51XwlJ39bmUC+Xkm+qMMqUxwFLM+W6w/0FEhnkFZsbh5P3nsEi6sKHZfzqIckWAjPz+JixEzHiWs9gkLLXIqGyQNmy64Y/m42EHimaXIJFZF7lSA+FKO9SQTsdX9oJTpRqELepysW/NR5z6zy6WHCtUJBqtuViKRw94l28in4Tg9tSVz71Ftez0F1+Cdrk7MMjCgWoTxFEo1ZJRNYShkkKtqTmfuz/wCIg0ZobWSYipIq10egUjA8fno7xmFzhB8KkcsjUNBdc4WL1YruwIs63XFEbXa+Hv7PycWmMqOFwC84v0bWb2M6bAgLCYVq2tQvUX2MVggPIAUHdCJdwuH3wXdXuvHtl11w3apTQaBhzoIEiVd76DH72CLJZKXvuwQSsqA=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TfC8qMInxvbYQD/iwuAoUuo4uoxQjpO4OqBbQwCHY271ymHK4NkdCpUiPSxbcyK4upKXruosrIpuYEKFUXHFx7v0Y7T7T8tzMR2E1Mhs4f00tIG8RIAFXWVYsl1T+PItfabEoLwAxzTz7/gempu/NqNxs67rD0b5uep2ZO2Esl3lEOs2+et9YqDhGihJ1HorxiMOnbCvQtfPLPV06Vhfbb/5VrMhmQwJDw4jS9R7yKUqIYZFyEQDaE/98eMr5rQtVJUqko5nc8d6lGLbTiLGlvJ7q/Ki2jVr12AJlj4z/ZZYu7hGpDFs7LlR58pHX5lE/h0dC2PfGXY8yP3FaFOdlt2yUQn0sdKqgtpQP+ONs9EHV3fFPQt8E2dz1rFT5DG1bgy8Pby0yzjQmu7JWjn/iCxfFKDogbtVltC/SkBrSEExZHqzgbc3SlpQzPdkMbJl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:56:13.1363 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82752a1b-a070-445f-36f3-08dec881fbb6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3341
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/5] ARM/arm64: dts: st: fix node ordering
 in ST board device trees
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,foss.st.com:mid,foss.st.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06B5B6798B9

In the ST board DTS files, &label entries must be ordered
alphanumerically.
Over time, several nodes ended up out of order as a side effect of
adding new features or refactoring existing ones.
This series restores the correct alphanumeric ordering across
all ST board DTS files, with no functional change.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Changes in v2:
- Fix typo in commit message of patch 1.
- Link to v1: https://lore.kernel.org/r/20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com

---
Amelie Delaunay (5):
      arm64: dts: st: reorder ommanager node in stm32mp257f-ev1.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp135f-dk.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp15xx-dkx.dtsi
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp157c-ev1.dts
      ARM: dts: stm32: reorder mdma1 node in stm32mp15*-scmi.dts

 arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  4 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  6 +--
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  6 +--
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 56 +++++++++++++--------------
 8 files changed, 52 insertions(+), 52 deletions(-)
---
base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
change-id: 20260611-node_reordering-4b9b132b007f

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
