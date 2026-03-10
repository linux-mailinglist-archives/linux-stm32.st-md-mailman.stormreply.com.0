Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFVxOojer2kzdAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 10:04:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2DE247DBA
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Mar 2026 10:04:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70F5AC8F269;
	Tue, 10 Mar 2026 09:04:07 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FCDDC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 09:04:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bp03U7UJ7CSwnD9rHaTmr4RoDr6yzxEs9Ic2q481C3V4z1IawLDJDeiy1x2R/JqgkPlu2ocuAAJxLPjRgohkM9l2y7TH9n2b/1y7epimBdGe6eVEW4edEHFFEF7hvJ2mBrDcXiMRsdfLfKaaAhhb7YhVywHH8a+WDCQUDUXKHPpZtBPjzpOo3N4w2ZERF9kp/gIdQ4cyHsb79sSdGNLmfS/cbo7cddgwUferkhCr9Rzb3y9VTqxUl1Jk11EIYvPEyrKjFOncYkiPJqOPS/9PlB74oV4qnOJUnV/CDa8slzWkz4gp2OFL4FWKcd244yz0yUZ4UZjKtbck1R08yK5kVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7COihU5U/wEICzhZ+ziyUbFf7yA3W4i8HZqKn9Kmtbw=;
 b=dnXdmDttF1YKmw79Mm8MD53/BtyxYLR25SyTvb7wI7w0UwhOFl++8mkHIq3+npjtsEi5cvY0RbxZiWOZzjxxNuVBvEgS0t5w2FOgzfApAHuBQ85X3swNQ8oaun4pqY5Se/GAA3o6QYXUms9k9ivWy1WQI10eTO/1jJJs2HdCQqVC80Mz6LQvPBA9D7m4O/OtBgKlcP+C5qToHc1brfT30F+zTF0GR6r9EJBjsdRqHziP1ztwVFUvQWNJgBTa8EQItM8a63rnHf1CVq9dwMDwTW4LIrnEa2B5qW+FDsi19ffSeC/IzEs6Lpzzq4FaFDkTfGWw5B5FvhunJHoG780KvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7COihU5U/wEICzhZ+ziyUbFf7yA3W4i8HZqKn9Kmtbw=;
 b=F4C/mEYCxFPTwasl8n4XPm5qFJbaiLa0xmhDMFj1kH3giIbktAPSp490kKQg8ULycOxu4dWJ2LJpYJBWYiQgpWjXkm+Ukor24PtYPmTQQPBn5VYovwZX0ZwNVuML9nvkOP29XD8OJ6rHeHCgwzZvm1XFrdEkx1z4JpuqYHxp+N6/+uU+z6RUUN5HoUI+bYrQRKwEN0RxGGeuABYhwW2L3LHFTLUFEOA9u/5XffjqJJZjwlvvvkueMb1DpN3kRDoRXdOYbpROw8ExOhbH2IwQUxnOlNTBMerOmFNugl1rU741eY9uiqH9q3HIoUtD9yjOE7Maxg6cb/a5tiTOs/d1Jw==
Received: from DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) by DUZPR10MB8189.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 09:04:04 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::9f) by DUZPR01CA0031.outlook.office365.com
 (2603:10a6:10:468::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:04:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 09:04:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:06:31 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:04:02 +0100
Message-ID: <ffbfbbc5-96d0-4ae8-acad-c9c8fb6e0171@foss.st.com>
Date: Tue, 10 Mar 2026 10:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
References: <20260129-fix_cid_check_rifsc-v1-1-ef280ccf764d@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260129-fix_cid_check_rifsc-v1-1-ef280ccf764d@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|DUZPR10MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: d393117d-9c14-4287-ab30-08de7e83fa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016; 
X-Microsoft-Antispam-Message-Info: 0VSrOrmLwm1r/sHHAFQGVUYKrtYSfhH3pVaSALI5zsCamNp+4Gk8k+lKGItjej+RW48isxrhhJGYZtPE783TP04d3CQPNyFaAJH2plizcuj6Y0O2tx6U5BfH3bdQxZ2iqwLaUNPnPogomPYdxgiIMObo2hapqUxelebU1pstEgLLu1m5DLfT61C3Fcb9JSZ5oZWRwsTXOk9k0ZW6pGmtKzTNWyBQdtAy2hzBcBNtFq2U1UW/Kmz7pVPeLQdQt3tHVurGJ4MqSgP43KLUWSkObYTQJrYtDbbTYnWPxnCk4+Jg5jAdUciF4qfVzNdRY0TO9EoK+nY+DARNqShFuoxySjvysg0bET5Eqt8xnGnZbLilrjz2xAAgpJwtgn/Ac58TaciZQ9s5//ImOhyq9al0cOKTQEnTLpgHTI0sNVI37+A1viamriN/jvQ3IFkh1DGDMJcGjKvJMTWJcpaiPCizKTpSJKWjkxqo1WbTTA0K7VyUA0ddOTmt87RxQtW7vZsTwDuz+R5FNn6vUQN6+sVKuz1RI2mVOa8J0RLIlcaJjrs2ayBTv543jKUfNSCNiNrU9P/7NGJR+2nHPF8SgnENXpenznBwOHqZsLjVAqnRMY67LQwPAvXr90K6CG91prRlZ3xrUHTWOre8yfNuJK+UOCFiZXTXSmeWtIpBxN6+s+ghtkAp8o3PuBfmTZFmaHT3Pe7GChq3blOujgGs1gDJ9TPE3YrJprsirX0aYskM5jmQZNWEytHP4YnosM4nIgjd1Oo2FDk4Iu2foBh0x5ODPQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9NnFgJp5ddc9B7rNtwLhshFN1OBwjPOyzVKacTpy0CMzt6RxgNxNmHB91Fao76NystXDTpDwXVnGW8g0dDwL5NJbX3WZTvC04DBcDPXNyoR3AJCikfAo20tZTwsxxB4bJjBF/gQxJDf+2I16fLaaD/zdMTqCStMJx5aDpdI6hBBNrCokodw4fmoR4nPl6ouk7RhOY4bI5Vur4oduTwGQ2bGpJJDeOH/0krEBIyw9Bjde/2nNXmVPKmPBkhaqqM6U6f/xJtPZQt/2dw0I87L6DAP3+saSv5FMukw3LE2R8mzuvWkQWKDxIgtIvDpSNTyZynpV7vQuIN3Ue299uYJGMfu26pM246van/5wzU+q5bqQxltgumt3jJ8P1QnaFEf/azihxUqSOJ9wC/OQe4CHwmXcYHwT+/KKjZPf0ATXgYGdkOt9LgTnzn6oJqlziWdP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:04:03.8615 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d393117d-9c14-4287-ab30-08de7e83fa6c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8189
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] bus: rifsc: fix RIF configuration check
	for peripherals
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
X-Rspamd-Queue-Id: BD2DE247DBA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Gatien

On 1/29/26 13:56, Gatien Chevallier wrote:
> Peripheral holding CID0 cannot be accessed, remove this completely
> incorrect check. While there, fix  and simplify the semaphore checking
> that should be performed when the CID filtering is enabled.
> 
> Fixes: a18208457253 ("bus: rifsc: introduce RIFSC firewall controller driver")
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>   drivers/bus/stm32_rifsc.c | 52 ++++++++++++++++-------------------------------
>   1 file changed, 18 insertions(+), 34 deletions(-)
> 

Applied on stm32-next.

Regards
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
