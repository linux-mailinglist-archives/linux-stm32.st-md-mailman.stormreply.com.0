Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lSR6HzgRKWqFPwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 09:24:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AE6669CB
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 09:24:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CF82C58D7A;
	Wed, 10 Jun 2026 07:24:40 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2127.outbound.protection.partner.outlook.cn
 [139.219.146.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79197C5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 07:24:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDD5ta9xuLzlOW0PywSUyiBqDfMG+hrKPlKihVmupG6/SJx01PUhTWfPcIw9j7hBiQAMJmZaHpV19vQt5Zw6dBG+epCOGvaxBBJdG+ggA8dV6TKibUcyWS/8QyvarVHPLGsmrnPIK74p56TuMziJaJTSqjnZUGzUs8pfrGeIddaHZYPGlZ9cAjvNZTISe6mUjhEH3MtdXGMRGBZHZ6MfI2SqOyU7PStZ5nCBFbf0SpW/uX6PYo1SMCBWzAvGXNKXQ9JlmJKLIrg9+ziEceQVilbY4AOpTWcfkVWsaN4haFvfGY5CGhZZ15sCIBZ8up13TJAY6OltSasp7+qfh+l65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InpX30kLV6j6y1pktEdVB4ByqdJlg7uYDA3SRiJYWv4=;
 b=fT5br+uFYC3r7lRB4lNby1NGNZTo+yg1MkFnLJuIHy1jESNL0+2Sa26FJT8lGa2m7cKLZ7IygOEdtdEwE/zV/gksc7qcBZBU7/IZWCKdUmJvA46cLcn7Y+xmQIEyNmm1FqERGFiUCbUskw5ap3i680C8z/+srv2+29WvBhU0eKk6k6zWGc51VAiAUfaDRrY2Lq9FhbstTtU6vc9IEAQm3HtQJFVKuBncVCqBlc0Zua/fFo6M0RGBhHIjkaP3b3RLS6C8PLCYpVI5Kj9d+B1CL7UlWEzxVrYEsnjm3wZXGEMM9lYrp3hxM+pjlMpaVYx8XeWHTmMJeAsjEkVduCLRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0512.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 07:24:33 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.21.0092.014; Wed, 10 Jun 2026 07:24:33 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Wed, 10 Jun 2026 15:24:19 +0800
Message-Id: <20260610072420.64699-6-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260610072420.64699-1-minda.chen@starfivetech.com>
References: <20260610072420.64699-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::15) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0512:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7bd859-6635-4299-39ce-08dec6c1519d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|52116014|22082099003|18002099003|38350700014|921020|56012099006;
X-Microsoft-Antispam-Message-Info: OhizK9a9QWKpfD0TrbLK41fzQBC+JmpxAbeeLdGmilo00Hh+RwSNUJMHfyFfgkKxqgSSN++eYDGjUA7N1caeM2ne5WzxmxExoME7WpQI/j1DtR9q6dpav8YT7ZKgRybOl51YVSH0K29RYTB/s1MkS3NnpbR+pDLqaK9H01lQ2rtjFL1oaILa7w7pKGzhDIXJQ8n0roEMyq8yfBjKTTAfl+3ZYANErqLOQe0t9AKAi2IKkg0DHuCnHr1FychGvbt9xgZsoK4pnT1egdFtWTmoX5S1MJ2EppH3aYeo6mApXCw00rIM3ptitXD0aNifxhIPbAzE+/UbwXabbhCxpKSeOEO3aocYYKL7cC0X8LZjcTcW+i9QtYBjJmvMWSYet0WY6ip0pVe5ESpNBVlqPV9LE6DcrfySVOg1NM/JVxXUfv1a+GIUXjqrS7fj8BfGQ7tOcMumF9T6frRBvkHUlWPJrbwFAHrlq7MMEnnVzmcGvbWH0QByhyLWZeeaglSmPRILCgz05w1gtm+vUATkw3X8h3iaVRDozWPxt4csgLalv99ujt7hGSL19B7rh3ySbgJPXd7ALlA85jxUJJPeMH1JtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(52116014)(22082099003)(18002099003)(38350700014)(921020)(56012099006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GXhVKwehCrWR0siaDlt0oPrMAQeeJGt7SKLbdkvlS0ODPuVQNMguclL+Mjbj?=
 =?us-ascii?Q?qiSEhVWxWnAWbLyoynGildhpW/YzRBCz3Z+86Us41FhV60JsRsa6Sfujyhdn?=
 =?us-ascii?Q?RajV9Vi8EBngJu2vrnGuMQJByI4RkxyGFORxvDBU3n9P+a1ssAkOb2EQiEkO?=
 =?us-ascii?Q?RFEdkL4jv8P4II4C9RFYMs30u2KDypNliz/HhU36WM4GilBmCeyCozNo5Tyc?=
 =?us-ascii?Q?hk+eF0UBeqPjOh+uszQ1iZevmIBClxjwJ28IIw8FdT0Fp63k78Qy0uXjUsCg?=
 =?us-ascii?Q?U9bmBVUb3b4NoV/IoK2ZUbZVVGNJLpQt5ZVxL4PcbS82lLf5g3nino9X6KxF?=
 =?us-ascii?Q?Uvpc5NMoryCRoUpSw6QJTToPSCMiscFqenHYdRitIFn9TIHxs8ihBzD3nZ/D?=
 =?us-ascii?Q?p4SRjW05ZqFJe4cB2WDF62lf5bRToduk7ReUVhG01KtGJxpuCARr2WBWqb5p?=
 =?us-ascii?Q?TO4Z3aYghedK+zEPSQ9qxzvkmY3/kFkMci+Z78ltme2MaVlvPp+fi70TXFC3?=
 =?us-ascii?Q?1f+qqryw08uhIq7fg/PeIRbD3KgcI4nB0e8Jkm8GdCjHuU+JQL+OcDIdfFaS?=
 =?us-ascii?Q?RYgjaPrVBXqQNfYxz5gVsNpcwyAJIRaWoyYwueYfxVYJq05zoLWb5B2hvWJi?=
 =?us-ascii?Q?RGnk4dQQKe9XRKoAvJCwGjaxpqofkYx/y3HcTUK5dkXMRvxbzPhShRYDzevM?=
 =?us-ascii?Q?h5qB+zWnXSzXC9640Uttt0fYCYBpznWsvj1jmb4cpkNMjNlVFsv/7YpNpGSs?=
 =?us-ascii?Q?GVC1lAk2L7DvWSPJkKW1y0CdadwIKs3p99w7R7rkoXmilnsbwc4e6XvOR2gt?=
 =?us-ascii?Q?LttW3364aWbTfJm4uEaF2M8RTjPE/zzg7R2S5ekTsL15Nq/7P4jkZADdqVWs?=
 =?us-ascii?Q?07jL8X2GQSEUTX4tHFJdLmbslzEbZUxwwV2E+D3VMlqScO1fpauWJDzv/mbk?=
 =?us-ascii?Q?ktC182/me7EGZf1uijCFdiRaw5PoiOAy1LFD4rgE0bNGM+hvtMfpVuU+5qLE?=
 =?us-ascii?Q?2Vyq0+m/T7Jjzb6HUqp66AuzX9sZ+OShxH75TIQv3hz885T+GvE7gh+61d6Q?=
 =?us-ascii?Q?Ekitol7wLUCK9LNKuWL5h9Wln7OCA0rcyOYxZaGa6jxG9uD3hEwUiCTNOehD?=
 =?us-ascii?Q?VsYyNddGJG/RTfmD9v0N6iFMu86BctFPrNaDxdZMhKNR+jihAC6sVuURdMOD?=
 =?us-ascii?Q?zM3mHf5M5vp7U4r5SkrR4hWgpyQpqXyuPcTLqNOlIZn4uLgWN98b6WwtWHg2?=
 =?us-ascii?Q?kGVtzOB4m5nIK0IjEYZ8lAXfregXKOJmDXtJuhkK5SJE5m+lm2hf+3VQJT7g?=
 =?us-ascii?Q?YDRvDcTnxFD2O61S6cwe77I3nYWXhWEL0F0F4Cy/g8ZEXjv5yhPpq++NrcoF?=
 =?us-ascii?Q?YZ5PPfv0KjIb/sEQhfqlcY5BR8OXhudhBUIC6QhHPcAigyWStIl/14XNOgei?=
 =?us-ascii?Q?ZVlknH3uZiIywPZy8FFvOXeX3YpzJWIlQjip39K5stnnOunfUU4vW6ROdq+R?=
 =?us-ascii?Q?xhh9OUrT83sif/S74p9donEZbyUCoJMHNY+HMYkeY69cRQh/tJHjmbpEqbi9?=
 =?us-ascii?Q?y2M3R7sM1HRoQ9Wa94ngU0d/f8UwQWO79vFyRCZczvBsBc42ZAm8Ou4Wt6ZV?=
 =?us-ascii?Q?T5hqO4mZDZxGdmXSVThEzKmOW28Ib6uqZXoxucw6kxpp69CUtY5ZlZGrkNog?=
 =?us-ascii?Q?3jhWs/+GD+3xcA3duDp08ZKv/zRCdmNMTYZCyWw2vX1bCZo0/GFp9800RUkN?=
 =?us-ascii?Q?aNC+phaYCkVV/PyMZmFZOWCkckp+20o=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7bd859-6635-4299-39ce-08dec6c1519d
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:24:33.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyzqIVijSGKpdwky3Y575whHm81eiMMGXe90LYcxrIcgBBn9Gryo+8FGllhP+ADKw4zSdnEpg1StaxCZ2jazalUCepu1il/dilVbLWYaTW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0512
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1 5/6] net: dwmac4: Add NCSI mac speed and
	duplex setting in NCSI case
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:joabreu@synopsys.com,m:mcoquelin.stm32@gmail.com,m:linux@armlinux.org.uk,m:peppe.cavallaro@st.com,m:alexandre.torgue@foss.st.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,synopsys.com,gmail.com,armlinux.org.uk,st.com,foss.st.com,vger.kernel.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 640AE6669CB

Add dwmac4 mac speed config and duplex setting in NCSI case
because NCSI lack of PHY, will not call stmmac_mac_link_up().

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index c6fcfae27c3d..7db4c5dc1f80 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -46,7 +46,20 @@ static void dwmac4_core_init(struct mac_device_info *hw,
 	u32 value;
 
 	value = readl(ioaddr + GMAC_CONFIG);
-	writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONFIG);
+	if (priv->plat->use_ncsi) {
+		/*
+		 * In NCSI case, because lack of PHY, will NOT
+		 * set the mac speed config and mac duplex
+		 * in stmmac_mac_link_up(). Now set these in
+		 * core init function.
+		 */
+		value |= GMAC_CORE_INIT;
+		value &= ~priv->hw->link.speed_mask;
+		value |= priv->hw->link.duplex | priv->hw->link.speed100;
+		writel(value, ioaddr + GMAC_CONFIG);
+	} else {
+		writel(value | GMAC_CORE_INIT, ioaddr + GMAC_CONFIG);
+	}
 
 	/* Configure LPI 1us counter to number of CSR clock ticks in 1us - 1 */
 	clk_rate = clk_get_rate(priv->plat->stmmac_clk);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
