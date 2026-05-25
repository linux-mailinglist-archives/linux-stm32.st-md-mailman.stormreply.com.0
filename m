Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L4WGrzwE2pIHwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 08:48:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 081125C6B83
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 08:48:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 917F1C8F298;
	Mon, 25 May 2026 06:48:26 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010062.outbound.protection.outlook.com [52.101.61.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1A6EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2026 06:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrY/CqU1XdsJphoEZjRNlNGbFKD9luhV2l48MukYu+EMRHRrN+lytCaxzgY9xAy7TZq+BbhHZV37AI0dEzVJp7lX9JuH+VpQJmeZ/s4ud7uV5jP2dRcJJpipMezGQY0z6dsxQJptCXIxaG5uM5uV07VSCgJ4kN2bhbJGc8ktSrFT77wB9KrQ2Zt0ydAsSzVSU3Gaq+2yNXwQ+djQA8v6AI5kCPOTFZUGSLYdpcZyA8Q0SBSjvxl0O8dvPU0KJYLNv7NDo2R1Xph0ImrLiEV+hW9DAmU1Dds0pDu6OVJ5ZconAdo636PW+mS3hUMITtlMvAJYEd6H2JC3K1NKFnEW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPYOByuvTPG2+cNqGP4MwRHgirvm7Gjf/E3R0XCXxMI=;
 b=YyU4/fkzIfLpb3Bc9copuD3V8vbw4UijwSBBGHivdMYEYc2WORf7QjO3UMt02W2ZzNXQxmiz9Yp1nq8NwFZxlJaojXkJxfIHVfzY9K0owTVgKL9qPoCbGkgbs2qi5tYhE0MBRcB/yqhz8jd/QNKSqcW7LWCSnCsc/bH9ujQKN15Hr6sKJsXvX//sbYGUk72yN2YZqe87xGTsTZsYvn1HeMJ2D6qHGcQYWITwP8RI96GW3O29YgHQqFGqZAowtF8cqIaaHvmdQQZ1inSEIy45kNMmjNefNW2eDQFDMQcVlOFGsKgL8crmZHeywIeUmYjZD/fahz6BhKKb4r4o+03w1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPYOByuvTPG2+cNqGP4MwRHgirvm7Gjf/E3R0XCXxMI=;
 b=pVv3rvWoLLxJbD0rTJUHVPAfJmPyMwnPaON4w8+kvLw5gOq/H+u9fmGtb07iSSAjmcVie6yRPxwpw0YoIiHAwKMesdrAfNYMwJ+kotQDvWfDJ2L55x0A+I5tlpYwZmPqZkk3OrA2x7UcP+MP9hUVln1rA0kaktV8apPXwqpQcBSDUpH207mVqB0Q6YO/NfTGwiRbFFDW5alB16oHLES4Lypw0Ljs2SSARGgv/wnpoRBDsY0YqdJsbDS2OLsSb88NzobS7dLMA57NFO3CVM8926qImksynhraMg9UPAs3SLirRjlc7vdSkRMzdiFNmdlBBXf1t8cc43BnydX/xWlNvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by DM6PR03MB5177.namprd03.prod.outlook.com (2603:10b6:5:22b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 06:16:55 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 06:16:55 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Date: Sun, 24 May 2026 23:16:53 -0700
Message-ID: <20260525061653.22548-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|DM6PR03MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b622ef4-ae29-4003-03ba-08deba253829
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|18002099003|56012099003|55112099003|11063799006;
X-Microsoft-Antispam-Message-Info: +KzQIR9TbAmeL4TqYLfwwGYYzZeUXE0pzSHg3vDGyPO0UnHOE4Fk8L+z9+WHLe1gDGkjr4OdkoN6vLsIrks/ot1sVXtKo6joK6HnHQi4dx9s0B4wcTxHSmbxTQk2KzQjJDjVH65Q0FnlU4O/KwEc3FukCDaCzVnOltXTulYQgk2/WiPxVVH95ujH0WdJa4lVn2fhmjvzM23v5qKlAsiUpaIF+R+jDBn/on/JpAx5+v2Uudtna55jSppfSk/Lxayyyd74Dw8b1I1tcHhPezJ1+9AZYCv0uUwqd1m41R9xgsgPgXBNwNaGBe6+/KKwlSThl9XkBpwstdhetAi5kmHPGJwSovAjHY0f4aCfKh5S+41v2nht6/OkGYKSEEA086gTlHQFpjX4BxfM/sZMFs2I6Y3zEaMM+F/xZ9Wm3dY46IpdDXiyXrJbLlH4FYS6POWv9rDq/btb5uRRi0ozKTMmU+sqIdh98KkXP3tu+tU9VqBhGI+N6Xi1yqo9JGsePdLoE/WBJGmj2RGL6S9Yf5MA0NoLq+KBrOM6KJiPduWpJXjCbcBAtrLpKUEvqCNtd9ISWGEEgraDY8Fe96ZyyQzJnulwVic/iXaoBoKo6TYTmsEC/kDfYx9urzRYKbDCpglg+vG2CVY1PTW71UfuOGi5Av72gwo34Y+CiX9we3io+Zk+tcT7MexXe9FjFDlmLs2p
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(56012099003)(55112099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ym/lamggAuIEqwEZlRKBpid02yyNIVt9aiDzPBGqc2aWZKK9OSa7KBuP4r0C?=
 =?us-ascii?Q?RteVnF7SwggR1KnDiQ4zSu634JJzc69Z1ZAVGSJNGVZMLg4slCCS7MyrPTOL?=
 =?us-ascii?Q?3r6rlnVIydFGBmlhRXd1uFF2ow7mD8P1a8P0E9QGtgUygq4r0jsvaGi+zO4c?=
 =?us-ascii?Q?VPNYdJngluWn5iBaFn7o9o3CO4141D06EG3wE/n/JvFJw9l1sjgromyCFsSu?=
 =?us-ascii?Q?JEryJZu7fGRR0Qzmxg9Cyys6nbBNrqUmYc0msvu2EO9vpccEqWsB8/SwsQaQ?=
 =?us-ascii?Q?XANf2fJj+yZlMkOc5Oveucciy5I7BBPynPCrWhVdm0QVyJrAaZpoeF1Dy0PZ?=
 =?us-ascii?Q?7XNmn+xqOyY+c58OnYdUkNB878y3hKD6Evml3tXAotvIrIeQLadBnvz7g7qm?=
 =?us-ascii?Q?mIO7zinezcL7hDjoxREjLMya7YFSJgreSvjhWGm1bYPokYho0evh1HGZzx1h?=
 =?us-ascii?Q?vHATMLsv7jUYJ5TifQwQS+8Xvy4RWn+x1dv+E0GgthTYnwFKuWitM0wa8SqT?=
 =?us-ascii?Q?vYYCtTMlXDMwd5owVK1x2ISiVJx1WvCMZpHck23zWtBOmdz/Lqd1QoHY/spY?=
 =?us-ascii?Q?ytuVZwMzpdHcaS1p0uPM4bZyn3mZd2KaM0DP03QbWug4i05wT/Dd8gCRavZD?=
 =?us-ascii?Q?08u1OJ2rsa9F2mHri03g40AKkMloFHZ0ZFSJQkg0a4YV5tCeu0qFL8is0OVl?=
 =?us-ascii?Q?ArF+FGkiWP+LZEH2xaMv9753J79ItcZoC9SwdUPIdDNMUVUb7k6qhhaH1rus?=
 =?us-ascii?Q?2vlNeY0MaVO9e/SKnQ0eWP8w6ySOD5OzoXo9nWaM9uW8zdCJGRek4sXSfM2q?=
 =?us-ascii?Q?sxUSnQY7odbzvkn9TCQP1a+6/t9kDdhpkQOgOCV1Mj/eZ09Jm0KrjZVc7xUC?=
 =?us-ascii?Q?YvX6wQuCHo6BjmC5sYEe9BOhMy8pALV6yKikZ6ZcphvT1QvZ7t/huM1/sPPd?=
 =?us-ascii?Q?DZdq+R1ALQWaefTnLmT3d4FlGaOad0kWxCiuvVn2KxJagKIKnuu7Wp30ueKL?=
 =?us-ascii?Q?Oc8YOjCoaNsYsPr/YvW5FmIzHDzTIF/NLSI+jbptQe0jJ632XACJTitFZjGu?=
 =?us-ascii?Q?ud76ymZh98Z7C7KWZD6fZefD7ssnEv2U7PI7DKDohhLoZKdvcklMcr/etvhZ?=
 =?us-ascii?Q?VLXn3t4gcyhO9LkOGzS1xjU6MfzC7cG3ekPNdmoCxkAeaFSOcXwD3C38bto7?=
 =?us-ascii?Q?SEt4Rhhl/g6UpS0hq461fWPTqZrcjrfGL0OlErZOkVW6c7fHdudFzMK2VxA2?=
 =?us-ascii?Q?CWl6cscYijfJbp/Auve0Tqn44ekzztIdkNkJlFGFgSp8Cv+9GxnldoQAqUEp?=
 =?us-ascii?Q?cmfrI/GJhzUFuIM3xtnA7ktewdBFtUHsprg8vdh0YnX/rphki3sPjxop4I+w?=
 =?us-ascii?Q?EoaD7S1pgJ5J1onJMolntlDAZKqxFyuTMtso7AjcqWuHshBQQoJF86SS3yzV?=
 =?us-ascii?Q?+A7gOvmfoM1yegAB2QSP06KDS59RSMvpCzfx3XYVViEyR5P7gnYm1+y97L24?=
 =?us-ascii?Q?4/Y5dCrU/rnEjstixFREjV3HkRD6cRzcuconJv74sh+qR/AjlDiRkg1vr7cn?=
 =?us-ascii?Q?+0YGZ9rw4ki6H1J8jJmFCSqsKe8chjsFeAaUHIyw5ZaVoNtBSuERTizm9obz?=
 =?us-ascii?Q?KCU9yXUaOiiq5r7yY0NWQglDg43Y3mn7X2qvavLo9mBUafgCqDIxEUoXK0Bb?=
 =?us-ascii?Q?eIOJSWq0hhQvGv/v9CqkugpBXDQvIGCZpSMWPHjYgVPLe5KrC4vfdNjH0TGu?=
 =?us-ascii?Q?4J5FVSZBCF60tTE1H76TfZeWkswz4nikC7o9klzZXrSU/uScTRqbs0TzsTsa?=
X-MS-Exchange-AntiSpam-MessageData-1: yJDdzOjMEasyBg==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b622ef4-ae29-4003-03ba-08deba253829
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 06:16:55.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZQcPjxDcnZp8i7Y6xsI3X22mB+WKeWpf6eC3VigADi17ohCbMHAUPvTkon3KPO8J/NGSZ9wMR5gJ7Y1h1WXgjFGxd4v/0DzryEbF81R0csKuzK+ZTvv3IFr85qO2PZkCw9iAAxOUI04grNYEqSkyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5177
X-Mailman-Approved-At: Mon, 25 May 2026 06:48:25 +0000
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Improve Tx timer arm logic
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_HAM(-0.00)[-0.938];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[altera.com:mid,altera.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,intel.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 081125C6B83
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Currently hrtimer_start is called even if hrtimer is
active. This is unnecessary and expensive in some targets.
This patch avoids calling hrtimer_start unnecessarily.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

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
