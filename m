Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EDZBbhEHWqlXwkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 10:37:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D161B8DC
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Jun 2026 10:37:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01A87C030CD;
	Mon,  1 Jun 2026 08:37:11 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97BA6C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2026 08:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivtYY59XfvWKFeowSC5qER/GIHx/UFF0tCdweaCQT0kF9qda+cEuKSD0UXQdFZtLBvTxNkGuDrlDBkRlJCXtFapB+hKi9XZcXV6z9p7jHjS0IAze+gGDnZtBqXDnNvAk1ANiXZx6HarcY+QGQ2alFk26znluEAfZw9gU4rq0ci5eNTsGVWFSjDgHRHA7jfVhDs+qlW9Hc8fUERN0P/pz1BvBYYew+JRKjh+3nwB5MfjXhfAQnKAH90Vg1XHWG5Tjsrb/EjuBw/Ssk1GzTm7oIFoB/MB72SMEVMG8owQmyn1EiOGGAunhKS1W+0/6lB8XXNe+G8/6f6DU/XZg1TY0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6tTEa2oLYwRstok30decRqOUDGO6bNbpjTQaPevAcU=;
 b=LF0k0sHMCzCZ2NkQNd5D9d+C1KQXgEQXPW42/IVMqij0OEVZ8PED9VSKC+EwajteupeoXkp1KvBwpYkm+MOSUSe2WC9xdz5LQda/IbqkttWziImGobjRLY0892GOo86aY4EYkAWEPZArIL1LyqHBIoKuuOBJ0k8JYQMHWblGcoesYw3rDUzObFN9b/puB27df8QpVHevKuAfPbE5Y0sRw/N57n5+8sOHN1ViFodOoceco54JVzxb5t7XjhHt5vN5GdgkVq1En4gCGBfbmpcKsrdZ0+l4cSBxllxIP6y/EL/LWqxqfSMF/WHNVz3PolmbODyj5Z5rpPtvaT66PmXofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6tTEa2oLYwRstok30decRqOUDGO6bNbpjTQaPevAcU=;
 b=iF0qyXVtVh9Ln73e1jWubKiUNddAo+6znyKNVNXb48c8zUpljND2txiP1xQcDC6/IeyjU5G4j0TgI6qev6XzS8aBErokKq1/W9jj5slCpNDQH0glGVyE68AR2qrl7cGE8nfg1iDz253n7XZAi6vDiCC8RmYapsQrpKx7RJVDRsPt9Lfx/3eWvoDboCEoIZqZ7U0f2eNehCyDcsm4R68c/VZzhgks8VXUeCM3BDKthdHJeP5HeC6ESxx1IGrgyCqvaY5wCBIw4abAkDMFaexOjbZwiElZa3QennF/KTJuF/TF3oa9UjnN+ryaXwyQ/ePjXMidhTIGTBh0f/LvNLBzdg==
Received: from DU2PR04CA0247.eurprd04.prod.outlook.com (2603:10a6:10:28e::12)
 by DU4PR10MB8832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:560::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 08:37:01 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::68) by DU2PR04CA0247.outlook.office365.com
 (2603:10a6:10:28e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 08:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 08:37:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:41:09 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:36:59 +0200
Message-ID: <5f52acde-00e3-4f9c-97bd-9ab068320bc2@foss.st.com>
Date: Mon, 1 Jun 2026 10:36:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 <soc@kernel.org>, <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|DU4PR10MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 79669a22-8081-4d06-c081-08debfb8f34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: RpEoVmU9UFIJr1e5QjUX7sLWPEvfPJRFlFkH79Hh7TzZGYSgatfOJ1s3Sznsst8OJbL9hACvrApsLWkocuyqmsY8MRVff7ULbDBeQKfI5RGjXB7dEz1ie105TopBPnCCMjjSxLPG2+LdeXLUL2EGyloOCXPa+v6mfTtiybUjpYwdnwyLc7Ed8GwIAz1lmGB22kW2x9E2xGjYK22wfFGBQ8jq5ofAhWL4pxKSWKh+R5OTZ8Kw9GvkpINB70EnttUsCRNY5TxYhrU2xqoutxNGXtnTc8w2w9Icgf+3gNFaCiOLr8i+Us6o1FKHpbnkaCPUjcwYM1ly06F2DbrPizZh9+slRHs4NOQQbaetCKdGX58j10m6HOxWhMN29Yh1pFxgcWBsn4pGIiPxpBczdtpRmcxNcnlmGd/PuKLmjiOAc1ONmiwGjG6hoOTMhVBveYWiXYUEEDrvCoCBWKy6bTdlHV1edKthFk0NrlMATmnigCJWG+eIr0yyK4QoWFscVf/98k6r6CQ1cmsRQvm7uTHAxL+ooEHQd9R9B1o7QY6aEytNSi0utMWIueuZVoHveFtGDTCA2LAjC2uQ4N6dlhxclDWz0sIL97vU0PkNjwE9sFkOMt6gduCxF7fIKgu+pOOX219tOEO4IvJUC8UWijKgFh0rlTV6fE/vx7uW2qfZdg0f4t746yb/vKA5722st6BHzWauTzSmYaCymsaK4zaa+HYNMjap8R8zkiO7xUWvj14=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G1NizXP6zIgqdIdWzJxdcJrF+UIgKaL1zqpslXrZ/3Cfa8sY5pwLXA1yEbzf1bZU0WKRSRzjeOf1sVHjCZ8S0eyc8YWr5hNQYTsPuw4ZXnRRImoAFgM/+UNlRZkumj1iE3E4gwyN44fO8JJj9QHf6W09CGu3lQoN81P2l8IMy7A+XCBfW6ZNPTWjykVW5NiIOq1lWcAFO3ZcFXIGeDuY9p7rCOt+6xGCANxyecnDopNqSjp2zOxS6Bej7l5KwNxBpvUF49d610zE30JuwNIQmul4ZGoawDgASiuCOsNh9ARQq0rDV0m4vW/6/kT57c2aI/+EEpaVge06PfGS/zt8BkoPVAQy/xfL2QpupXrMGAgimX6uP6kkPHnPbgt4v0OmR7gqXIWxiBh2+3BzgC1s5U1dZwqBmXw77vXz0XS3bgWOLWQZGt9Sn8rA9F58Q611
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:37:00.8848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79669a22-8081-4d06-c081-08debfb8f34c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8832
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v7.2#1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:khilman@baylibre.com,m:soc@kernel.org,m:arm@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 961D161B8DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQVJNIFNvQyBtYWludGFpbmVycywKClBsZWFzZSBjb25zaWRlciB0aGlzIGZpcnN0IHJvdW5k
IG9mIFNUTTMyIERUIGNoYW5nZXMgZm9yIHY3LjIgY3ljbGUuCgpUaGFua3MKQWxleAoKVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyNTRmNDk2MzRlZTE2YTczMTE3NGQyYWUzNGJj
NTBiZDVmNDVlNzMxOgoKICAgTGludXggNy4xLXJjMSAoMjAyNi0wNC0yNiAxNDoxOTowMCAtMDcw
MCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICAgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2F0b3JndWUvc3RtMzIuZ2l0IHRh
Z3Mvc3RtMzItZHQtZm9yLTcuMi0xCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZmJh
NGEzMWE3ZjNiNmIyOWIwMWM4MzE4MGY4M2U3ZWQ0YzM5ODczODoKCiAgIGFybTY0OiBkdHM6IHN0
OiBGaXggU0FJIGFkZHJlc3NlcyBvbiBzdG0zMm1wMjUxICgyMDI2LTA1LTI5IDE4OjUzOjExICsw
MjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpTVE0zMiBEVCBmb3IgdjcuMiwgcm91bmQgMQoKSGlnaGxpZ2h0czoKLS0t
LS0tLS0tLQoKLSBNUFU6CiAgIC0gU1RNMzJNUDEzOgogICAgIC0gRW5hYmxlIFBIWSBTU0MgKFNw
cmVhZCBTcGVjdHJ1bSkgb24gREhDT1JFIERIU0JDIGJvYXJkLgogICAgIC0gQWRkIGJvYXJkIHBp
biBkb2N1bWVudGF0aW9uIHN0bTMybXAxMzVmLWRrIHRvIGhlbHAgdXNlci4KCiAgIC0gU1RNUDMy
TVAxNToKICAgICAtICBQcm90b25pYzoKICAgICAgIC0gVXBkYXRlIE1FQ0lPUjAgYW5zIE1FQ0lP
UjEgYm9hcmRzOgogICAgICAgICAtIERlZmluZSBBREMgY2hhbm5lbHMgYW5kIEdQSU8gbGluZSBk
ZWZpbml0aW9ucyBpbiBib2FyZCBhbmQKCSAgbm8gbG9uZ2VyIGluIGNvbW1vbiBmaWxlLgogICAg
ICAgICAtIEZpeCBBREMgc2FtcGxpbmcuCgogICAtIFNUTTMyTVAyNToKICAgICAtIEZpeCBTQUkg
YWRkcmVzc2VzLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpEYXZpZCBKYW5kZXIgKDcpOgogICAgICAgQVJNOiBkdHM6IHN0
bTMyOiBzdG0zMm1wMTV4LW1lY2lvMS1pbzogRW5hYmxlIGludGVybmFsIEFEQyByZWZlcmVuY2UK
ICAgICAgIEFSTTogZHRzOiBzdG0zMjogc3RtMzJtcDE1eC1tZWNpbzEtaW86IEZpeCBBREMgc2Ft
cGxpbmcgdGltZXMKICAgICAgIEFSTTogZHRzOiBzdG0zMjogc3RtMzJtcDE1eC1tZWNpbzEtaW86
IE1vdmUgZGl2ZXJnZW50IG1lY2lvMSBBREMgY2hhbm5lbHMgdG8gYm9hcmQgZmlsZXMKICAgICAg
IEFSTTogZHRzOiBzdG0zMjogc3RtMzJtcDE1eC1tZWNpbzEtaW86IEZpeCBHUElPIG5hbWVzIHR5
cG8KICAgICAgIEFSTTogZHRzOiBzdG0zMjogc3RtMzJtcDE1eC1tZWNpbzEtaW86IE1vdmUgZ3Bp
by1saW5lLW5hbWVzIHRvIGJvYXJkIGZpbGVzCiAgICAgICBBUk06IGR0czogc3RtMzI6IHN0bTMy
bXAxNXgtbWVjaW8xLWlvOiBGaXggZXhwYW5kZXIgZ3BpbyBsaW5lIHR5cG8KICAgICAgIEFSTTog
ZHRzOiBzdG0zMjogc3RtMzJtcDE1eC1tZWNpbzEtaW86IE1vdmUgZXhwYW5kZXIgZ3Bpby1saW5l
LW5hbWVzIHRvIGJvYXJkIGZpbGVzCgpNYXJlayBWYXN1dCAoMik6CiAgICAgICBBUk06IGR0czog
c3RtMzI6IEVuYWJsZSBQSFkgU1NDIG9uIERIIFNUTTMyTVAxM3h4IERIQ09SIERIU0JDIGJvYXJk
CiAgICAgICBhcm02NDogZHRzOiBzdDogRml4IFNBSSBhZGRyZXNzZXMgb24gc3RtMzJtcDI1MQoK
VXdlIEtsZWluZS1Lw7ZuaWcgKDEpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgYm9hcmQg
cGluIGRvY3VtZW50YXRpb24gc3RtMzJtcDEzNWYtZGsKCiAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDEzNWYtZGhjb3ItZGhzYmMuZHRzIHwgICA0ICsrKysKICBhcmNoL2FybS9ib290L2R0
cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMgICAgICAgICAgfCAgMjggKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTFjLW1lY2lvMXIwLmR0
cyAgICB8IDEyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NTNjLW1lY2lvMXIxLmR0cyAgICB8IDE0NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
ICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4LW1lY2lvMS1pby5kdHNpICAgfCAxNDYg
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0
L3N0bTMybXAyNTEuZHRzaSAgICAgICAgICAgfCAgIDggKysrKy0tLS0KICA2IGZpbGVzIGNoYW5n
ZWQsIDMyMCBpbnNlcnRpb25zKCspLCAxMzggZGVsZXRpb25zKC0pCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
