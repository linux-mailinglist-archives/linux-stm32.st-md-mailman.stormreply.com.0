Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJrrOh9YFmo9lgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 04:34:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CFC5DE92E
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 04:34:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F258C87ED1;
	Wed, 27 May 2026 02:34:07 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012019.outbound.protection.outlook.com
 [40.93.195.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 131D9C5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 02:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFUVhMNiGO4s3d1ujwkO0I5ucbNJ4NFxVjpr3CMSbRCsidb9pqjA38MFi6i01zmPUNV5CeNtVh2w7MU3qF04az00BaSI9fBdzbKsY3abPXHDESb2ykREpWtHYEJuNUbt4nu4JLh0UVHxfiMdk6s3qp55DtL90kFKT0WmOj9thO24k6loBH68MpNFB2iRmXLAwriueO8KfbXvDdz4nq0eygYWplRnS8m+l42ySKYD0oewKFdCJEUfBQTukF9R7L8gwKzJUid8xoU/IGAtX25TB+BqdQp5LLrkFJAsPzF/UOQaoAwmlJ1qk8UXhVqhUSnYfxCL7ubEnDNFx1rYJS0n8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ+Vi4+B5kPJUFu/fodRO6Xgp2oKpWw/SA0EwT0Bjy4=;
 b=yDQTKILlkKjJ8Dr4Ny/gC2ogar0SeJgAM2a4Fp80iV+BsrpCDmbuKpUeiaCtHuSLh4TtyCi949mkEWJW1L5Ip/IQpJ9atzFAU7pfrMsSuclwGuxu0EvCHW98t9tYJrN90d9nms0wA2F+OvM2/+D7Z9hCNqSM6kqt9DP02m+XhfcoMwPotA3SB9WIYyidsJIQxhWoxYlDEESUyuU6dfpzn/5VDJwJRv6B9Rzpu0i1H7L87jt/VpmTyiNELgCzOsFUyoCgD8xlCK5X2hqhHbZWdAggxIks8N9KiH/dBn1M/Yti7H4oQOaIC2oRsO9p0QfVGIQAMt7jVkVfzKzmHZWsSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ+Vi4+B5kPJUFu/fodRO6Xgp2oKpWw/SA0EwT0Bjy4=;
 b=KTDWkDZgq08Es6uRHO5cB2goYQGBVRb9AdzicJdRbhhAY+Dets9yqWBKyFCIx7mFpaxLosCWRonMeJIAY3Z0K2r9XyanVDkBoh5KvDg4PUfJ3IfxHjfBnRQNLIc7r6RiDc5iCqGajdsUz3OfsrTWuJM0O1jZwNpK1ibZnJ9xMA/fnCQytrsvK/ygtj79vo4yitHc/xISqVpJ/n63RhWTaM/mDeDQqhn3gRBexT3kvWVguDvPtNoOz3FlZgsAUVaoAKHKHVQmh7xewPMSwZRxDfbb3aUJfIvGjHL+mfLC2PER3CC5LYGkf5xBJdjIg/AjDkXXj0A0xO0tMiOkyx7X1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MN2PR03MB5069.namprd03.prod.outlook.com (2603:10b6:208:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 02:34:01 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0048.019; Wed, 27 May 2026
 02:34:01 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Date: Tue, 26 May 2026 19:33:59 -0700
Message-ID: <20260527023359.18876-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: BY5PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:180::31) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MN2PR03MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: f5ea7317-261e-4cf6-7441-08debb98691e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|55112099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: yB7M6wOmRWApJkhcxvi7vW6ti78OC4XwouAr+EkOpyfwMyEoOWZxvgCgAD+2eUK7WVbYUGarlh9TSE5j9uezFZq0lyJHJ8T1QqWeQSl9QZPpTgG2Fw00P4ZbfDT97NIsDzBEKd+86KhqcMhwf3y3OPvcgPmKlVzNcG5bbCXWwMRrcrTdZHmORNqxSO2h/2aydgTF4zKxPO6WaZm49zPOlGKgiMx4X84/LeF7tOpirQc7vk7vqClqcc2Ztoanmm3RGqY6rEha4lIGqpDInJfmmprORw9ghmcvhipd4P6bEuCEje/6JCHArdthpxXBU9II9kjPO8mnm9f7SdUsFS1P2G0wRsa7ZggHViFWWThSUxYO6sOUlcfP/UOkD5TP9C6BO6ZkjzlbrTV0nOuMmyk9tNt3W3hS/TnxXvGQDm/oZ4IjNDRCXwm9js26iOcg+DoBSnH/CmT4G3m/ffRU7xkz1iRhBF6oHoFR2VAPFk6qRFGc0nFmspYq052CL7Re3yIY7YL3F5LnusjAzFDlOk00nQt9VsdVskisNg7aeO6H0+f6OB2AE7IGg3eH+Ywgi+tWtoCxsWWBULM5tUSEhh5eQJf/DHi0DrnOkjqa+8NqyHhyrxKMhpbr2OFcZ6vUFLurq+Kf0WF6J82y0i0ptEMQGcIDL3e3+e+zHmX06TLDpyFrXYovHnhzS0su4q6sCp5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(55112099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VCfM0uCrSVssg9w5Ub7EhD01JEQ/aRMIh1RSBBzJlKeSxktdfalDZx6HXWAJ?=
 =?us-ascii?Q?hV2WhWIGI4KlQQ0aZuSMPSZYrKf7cnYB4btRGLv3IyLMV/gXFSxjCfnK6C0X?=
 =?us-ascii?Q?F2DSDH6EkVha8z0TQ4W6ZBllgEm24lQD0JrBxc9cgU/e6n6fXGLAEpFzytHD?=
 =?us-ascii?Q?lbm1CQNzW8oo0xGdm9mO6K+1KbhXxW0cAoNHnZcME13QeA3SchkJidx6jzDx?=
 =?us-ascii?Q?4sQJCYIi8XT88TJqki1SES9Gyz/8mAd9mrHbZUlaW15yxraBlM+WzviB8qu9?=
 =?us-ascii?Q?nFwMWBaxyqH41Net5u9SDAObVembNPx7duIVAApC9OFMX7WeByprQGfIEUHv?=
 =?us-ascii?Q?XDDW1QCV2lfelMI/TSezngTNFTSgTAq1/PDg97H2pYNkpLghJeZdJniBu6yK?=
 =?us-ascii?Q?BE/1ZrKwne+1hjBH3KsfxpfhKj4uRwOYYAzmg0egLyeDvDo8q5pzKzVkm1u0?=
 =?us-ascii?Q?jzw82/n+6AHljgQgVmKYFNwnV6EmTsvB58Kq8gvr+tLJ3NNt5LCVZ8V/2mFe?=
 =?us-ascii?Q?X6MTvTzEQXoom4dxOW588pFkL0UoYKX+innaljmmJzM2EA+qJgC8I/euI1Pu?=
 =?us-ascii?Q?n82wAogI16Tl6PO2K8K15Wf2crRpsyKInZ+eoUUICx/UpipzfugnWAKLMEt9?=
 =?us-ascii?Q?+/k8yaFl0k29/npoUIk+4DTHcKuO7U6LxNQt4BYhrrWiDJzI38KoTO5xE2SS?=
 =?us-ascii?Q?BYRe67fwF6BnJpLkhBj87mK2JGnp0LHNxcNCzrimdwdfF+X66aAcaY8KJYLM?=
 =?us-ascii?Q?QzXvsTkJkWKMcik4oJckl/5VUWCpXGtHpvkuDMz2Mt4rt808uECuMFd8C3an?=
 =?us-ascii?Q?h5XVZ45QtXIPY9kyAZNc7uuSJ0HaxsyQz+FoW0kXZEnNAsRjEiXkYUSXEW3+?=
 =?us-ascii?Q?KgdDrMfoZVPLys567hfUPGzNj51y9Eg/0gFWcvGN4lwApxJIHnXSNcyhW9dd?=
 =?us-ascii?Q?HMcLZaHTpmihUJkyMMrVmcNQhX1fAT4O2xsjRWECWZEshcHodEJlnAGka9SM?=
 =?us-ascii?Q?QH5m/plo1ZsfRhQ30qhC6n89WUQGsIBu0/ggQ773TwsL2JYRHijlUYEwf2qe?=
 =?us-ascii?Q?aTcPocZyWZorjFBbuqZTTfU17BpLSTl6gh8YWYwJ9WTEkAyqP+uMgCb7pU8v?=
 =?us-ascii?Q?SO4j4CIMPkChn8+cLLBPMYWLZekOIBiyfZPFCBz83RkY3L/szL0MUbuwJ6e9?=
 =?us-ascii?Q?J4XIIHI6MWOmt5/ZoEMC838Du8DzJlDxsqA4FSJIVgvtgSn05Wp31xh5cxmB?=
 =?us-ascii?Q?7upY3zF73lrthdP6QPVTEGI8N5SlLiWpaX9O07NEAhidE0UWJaSxepv2Jjw5?=
 =?us-ascii?Q?AUNM9ShSH37NOXv9ByB/5ZYMdl5drRMaxaD4esthutCTUh1k2pkQgkQ45UaM?=
 =?us-ascii?Q?9XqpUbxi7jiRrQiccc0p/+V9JD9Be55hlj2tgEI3U2iVU7DVaiOpzDod6eP9?=
 =?us-ascii?Q?WR9PK6sSVQBUGuFUBBL/cnVtRPfRlvMPwe5hPvDQQNeQs/4pffxtdeUTKYZC?=
 =?us-ascii?Q?MSiDEp/oSZRfQL1RTG4Hdr9oU3rcsIehh1Lv9teejE0dOckEi1Z5x/NUTEZb?=
 =?us-ascii?Q?BuqCTH2Jgf4OW+R/I6k4LqPsSOblhLqbqv+Abw+M2QzhRurfiwVS/AlTOU3f?=
 =?us-ascii?Q?jZZDHvHli5EZ685eKu1pvkpfLVo7kSuPhoMHJZ7YsguJLWbS4njYOrzFiG1Y?=
 =?us-ascii?Q?dkTe+CmvAEr29vXvAZ3XJ+2CGyS37v7ino91N3yRC+SYVJsF3hHpgeh/2Hw7?=
 =?us-ascii?Q?lUzQ6XNIAKWC460jpztQr4IOnkiQwJegFw6nEhGHEA8HBJhMrmBSApKPVnO0?=
X-MS-Exchange-AntiSpam-MessageData-1: nsiR/6ykUIHbsw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ea7317-261e-4cf6-7441-08debb98691e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 02:34:01.1639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWym74kbOsupokpOyC9fY00USygOisxoEbEAfl15DKoRyzm1CZSlxbwSKt2zv5uPTA9epu+LCYkKBnoh0YcONyP6yNdUPz9oJvK5UsQH7JRj/RcrbQEndMTmWppfYvDFIDJyteJyLwrx0e7gJ+nxoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5069
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] net: stmmac: Improve Tx timer arm logic
	further
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
X-Spamd-Result: default: False [7.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[altera.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[altera.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	DKIM_TRACE(0.00)[altera.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altera.com:mid,altera.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 85CFC5DE92E
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Calling hrtimer_start() on an already-active txtimer is unnecessary
and expensive. Skip the restart if the timer is already active by
adding an hrtimer_active() check before hrtimer_start().

This avoids redundant timer restarts under burst traffic and ensures
NAPI is scheduled within tx_coal_timer microseconds of the first
packet rather than having the window reset on every packet.

There is no race concern: hrtimer_start() is internally serialized and
safe to call on an active timer. In the event of a race between
hrtimer_active() and hrtimer_start(), the worst case is calling
hrtimer_start() on an already-active timer, which is identical to the
pre-patch behaviour. The meaning of tx_coal_timer is unchanged.

Performance on Cyclone V with dwmac-socfpga (iperf3 -u -b 0 -l 64):
  Before: ~45200 pps
  After:  ~52300 pps (~15% improvement)

Additionally, ~10% improvement in UDP throughput observed on Agilex5,
with hrtimer CPU usage reduced from ~8% to ~0.6%.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
Changes in v2:
 - Expanded commit message to address race condition concern and clarify
   tx_coal_timer semantics (Andrew Lunn)
 - Added performance numbers to commit message (Andrew Lunn)
 - Added Agilex5 performance data with hrtimer CPU usage improvement
 - Added Tested-by and Reviewed-by from Maxime Chevallier
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions()

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea30b..35da51c26248 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
 	 * Try to cancel any timer if napi is scheduled, timer will be armed
 	 * again in the next scheduled napi.
 	 */
-	if (unlikely(!napi_is_scheduled(napi)))
-		hrtimer_start(&tx_q->txtimer,
-			      STMMAC_COAL_TIMER(tx_coal_timer),
-			      HRTIMER_MODE_REL);
-	else
+	if (unlikely(!napi_is_scheduled(napi))) {
+		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
+			hrtimer_start(&tx_q->txtimer,
+				      STMMAC_COAL_TIMER(tx_coal_timer),
+				      HRTIMER_MODE_REL);
+	} else {
 		hrtimer_try_to_cancel(&tx_q->txtimer);
+	}
 }
 
 /**
-- 
2.43.7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
