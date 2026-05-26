Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA3eI14tFWpmTQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 07:19:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DC5D0CB7
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 07:19:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A127FC8F290;
	Tue, 26 May 2026 05:19:25 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012068.outbound.protection.outlook.com
 [40.93.195.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14E08C5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 05:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbtwVvo4OG1HspWPmvateho+MvOmBDBAmE/JsipdWqTVhz6619K7Op6MiU/tpCy4+719XTHO+g0/o32cnPfweoRyUOAxLgt2Tp9fKcaZY8AHds4DlDl5i1Hs5l3rbdIe9hmzn1YiR26W99UZIUm1L3ugTDQFvKee6kR19ysj5WBGmzLMkacswOpsDKz+QYFPgTSRtfbFSRozsnAQ53vuEm6nvIWup7B+gP3lieY4y9PtQPcc7NPmTwT9GlMDajScoJX+/9xCkJ6NAOySeop7mjjp6DM2/mkyhNljKtPaZgasahYhu4bf0hIMz6OLLZkSIamG47NS+9DDV/2pSAU5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ+Vi4+B5kPJUFu/fodRO6Xgp2oKpWw/SA0EwT0Bjy4=;
 b=fpX8gV1vaypJw4YQ9nu1S+tPN4gyt3qEWcOm7I2dhqm2aMi7jVurnlAlvsYoVx11Rr1EwmP5KyzOmC0QrWP4mAU5KxKyqlC+uxdEQC2t2njc0VSNetFaj7hVNhB+/UQiBUPvQ/RfzRXCE/xUmsfMuURUbDCJ8xvwBZjC6hr5VbEdqTap4dnViKpyvuRsn2VfteCmFxNImJxa0aDLgxUnM5dv2peEOyfIL9UyVQbK61hvc8NoMt8kNOCkQnBG1cw2cgsMUqov7y/bn40QwlwmbSpT9CYlf3um9ULDZ9UVJeAdFJGR3o/oFsdwZHlajMwCJtiWHLAIj4mjHE4PXTXcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ+Vi4+B5kPJUFu/fodRO6Xgp2oKpWw/SA0EwT0Bjy4=;
 b=asirksYik12U9qwYXLOeFFCVVWPIemLoaA1DG4Djs4JLbGJFOkUuaLzdTRGucjDXQGFbyhML3N5MkM7vi3Sfs1QXM9GH1ADfxqHHRJApjuoWU2eaCi1C3roE08bki5bcFrbq+p2htAydEHf3qucpdxev/xwt2EDWw8L2YBalmDprInxAuWFI5ulsJR4VDr1GOhI27AaDHXUIIX/Kw/v5FXaQLQFCaipLi/qMyzF58KMYEnx7cZImRBaO81Uy6HvHgXz47zWjDyFWJAVuuKNNupqtUz3Fjrc02M2gGlpnczsw0/m24+8R878UX9N/4XhC9YRT3XT1VLzAW7HakXMwbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB989270.namprd03.prod.outlook.com (2603:10b6:806:4f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:19:23 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 05:19:22 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Date: Mon, 25 May 2026 22:19:21 -0700
Message-ID: <20260526051921.14540-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR03CA0199.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::24) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|SA1PR03MB989270:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b7257e-7371-469d-1409-08debae658cb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|55112099003|11063799006|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: PTV++ier5csNlMPFdMFAaJLPmrL94YWJtII/u3E5pvdIMGUngqfNySyhvxBb6A7Y/yu1+SbX1+y+lKqogfULh4YlJN44gSEcTLhGWrTFCPG+nvvG2O0vcLDwfw2CzzKJNMaw9FVpT1DiDqynubTJOH92FN43R5P6CusQ9UkD7P4k+l4uUK9YPorhwl5Lm8glQNeQWQ2xNwOci6XVcPXWU8MQbhRqot12TwZHF/TJP85JN3AHhIt0TIjiyyAEIdksTyQ33lCaPQUGfadBRQjDE+Vt7NCu0n2vksvtrEXVk78WnGI5taEFOyz09VqrwaXj8WMN9syZJ0b4/H6fJ2iTB9Pflk0vsLGGOVt2FOZPwhUkHgIZhsTrxl6RyrnXrnPr2gA353Y3+cMy4ax159LiPUE0Ku+IRALt+IfEPn06tO5bgowR9ZN22ZD1aaYsLU52Zw/sF//sgOY3Ley/6SEtabiMmoUBSTlgyzjilvMaOpJAa9vVfVmuujNcyrOz07yUGMltJ5RN2+Fi0D43jxKv9VDXRw4hnuIjxIF1DWFG23EicgeKq9A8nw2cJMR7zdfmR2lehMtN3xvQrAsXL3CGbOQuMWyX6T8p0i7EYNUvNvYDdVWWGV69Gq7PlSy4AjUzEAQ3ZBEiAxp2yqt+LkWMskCQ7OcGiF6fe5QBurZqookGymdeQMMPJS8eVte+Taxu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(55112099003)(11063799006)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u65+tg35OUOV4CLq9G0hzLAos5KvkOP/6fK+1LPFZHboGY/A9K5OYHKRv1xs?=
 =?us-ascii?Q?bOpYWYqaDy+Pigu+xiT+x7AO45BtgPA/NFoXlO6v5A3ov/RfWCa4lJMvNqAF?=
 =?us-ascii?Q?OWVeDZQeB3EUhsYh5YY0zn9MDTF029+0qISKwV+NZiv/1tzli/xXkKjEopWg?=
 =?us-ascii?Q?bVixLS0Uy0EUo3ukwr3vVcwuGYZn/mZCACQgW0OrVGshyBMSj5PMCaMqYXjQ?=
 =?us-ascii?Q?QG+4vOZ0N2v2fOGUA9MacR2c696fC377wFIepz28+1EX+9ng14N6YW5MJZ5v?=
 =?us-ascii?Q?2drFfBTXs8pI/gAxzSzvF7Je+CJGFLOCWudP9b+LvW3C0KBTjXEiuxEMoPZR?=
 =?us-ascii?Q?Pu5ks/FC6pFDJphGbmZubbRHZd1rPzx2iM08R2NT3R0wWp/CZnS7QxiFgo+C?=
 =?us-ascii?Q?W6Xo89k9ANp+yACqSyhnB/LcAVJrD0O2QaSL/Y+ysoJ4c5aCmF3JdQdYUCne?=
 =?us-ascii?Q?InjPPg3WsAiexqI1aGuv+AlygHXOdVuT70rxkqruOx/VpQWfSybhamG5cCda?=
 =?us-ascii?Q?aSYcabD+4fPrUhNzbJSQEvtzeKThHbzTK1rA3DL7NPLoGwh5InJbZUPp3/yW?=
 =?us-ascii?Q?QRrn2kidBsKE+yg2DubNf8JMO5qZHmcmqHgSVcVNj/qZDWHDLZ3JeYL+J8xK?=
 =?us-ascii?Q?czbgKJpC0ljEIE5RaU3B9MLG/+KrGfJCaNVJn2EF96ja+PvJA0L8af5jUuXv?=
 =?us-ascii?Q?nUTWWFAw8mcR7XbLa7+GryqhT7eIEB4F8EqTQsb5l56gfQdd8A5xiOB1Zwcn?=
 =?us-ascii?Q?7GgMfBM14z0hnb/zusJY9jfYbtZ+ebJA4ply/SZZQ+adbCh+skkizhjoTOMX?=
 =?us-ascii?Q?heIEpm7/Pf3oaO3OfQaH1GpiPZ1qyLfAZDTMANs1HvMi1x6QPryQmeGeVX80?=
 =?us-ascii?Q?2d8aZhuEBHmmBnW2FKJ5udmDKlP7D1CoqrisBBjr/pM6OvOrdmvGC/QBck/6?=
 =?us-ascii?Q?lehUcXqVDmLeVtOl5SUqX5EbSnMCU9suo9sKmnN1lKpQuZWc+joeqTTLmasx?=
 =?us-ascii?Q?UJ5xOZ4olbAiruAMpuoH8gs6XnnoP0XxIGGZ8u0oXnUzuTnBDaktw+62I1HC?=
 =?us-ascii?Q?fiPZlZfsZJ6WpjxcXl/fZZ7n8h4s+LafrvmXx/iuGtph+vralrDRmpTVuDAc?=
 =?us-ascii?Q?QfPcEiESZjj5TPYdSkerJPfvNGr8BKdHfaT3vuX6UJOt9l5s6h06VQoFt+X1?=
 =?us-ascii?Q?KB4b3yCWJqh4UuCZRnp+P2se7iTcI9UoQJk0runj8bo8+gNQS4pPZKZh4qu2?=
 =?us-ascii?Q?BN7wm1tXRWSuoBLHkeTDB1TsrAP173p/2T3Or3778TEA1j0+ZYhb7Gk9rJF+?=
 =?us-ascii?Q?6FxDkT5YX2YJmaL8aewXSXgmM2ePAUXWrzFafecZCtf0ShHTkQuRpwjE8Ra1?=
 =?us-ascii?Q?Vj/LYlCE2oc0J7Wr2uSLRefGutZXeEkOJzRKBSKb5Qlefz3LhJWD0BsK3/IB?=
 =?us-ascii?Q?wIdaAM+n+S6SmIMXrI3Q/IQQ7ePZh/5TecHz7gxN92ENKJaKivWzRlYnhsI7?=
 =?us-ascii?Q?wqGqEgogpkGZZn48vO6FoldLlESP7aBBFGsEnTqRjGxf3SdaUkstXbRcxnm0?=
 =?us-ascii?Q?88ZOceytMGcsgpW9WqZBF8oPYeA0MMqA5qSI++kRok3ly1l0zP8k+1nnqXD0?=
 =?us-ascii?Q?bViQSgIXa8UweA1HQLLGtmTl8MbipBlXYu988g5OedWurFveWIK/QdJKCx6H?=
 =?us-ascii?Q?27/19zeXyINsglNzZjYqcjT/JBr6kk/rVND4kc88vXkxcwzV5MyvYCnADYzx?=
 =?us-ascii?Q?do2XNe79ZBIuidb5LqM0GAxdiFLrfwh16GfubtBopOOP3SzvP9B1hJOxyr6E?=
X-MS-Exchange-AntiSpam-MessageData-1: 5vs0yLLhHIAdHw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b7257e-7371-469d-1409-08debae658cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:19:22.9058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQIURGYrut8GK2Y8eHQFTcNDCuvA5bvaNzqtcmHAvFgEMsuPdvPDrCOkz0jN/18Y9LGxxLHnHNEI4E0m9EF7zb3nwSaMTXjqYKFla4T0mdGOSpHyBm7VZ5fPTwxNffh1+SByAyx/PTM8uxTZoxQsUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989270
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
	NEURAL_HAM(-0.00)[-0.958];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,altera.com:mid,altera.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 245DC5D0CB7
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
