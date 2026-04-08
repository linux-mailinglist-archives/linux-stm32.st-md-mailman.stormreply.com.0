Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGaOJHUV1mnwAwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A26B3B9438
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 400F2C87ECB;
	Wed,  8 Apr 2026 08:44:37 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 257A3C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 08:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzelvsUVhgMEWq6nXlAZbq79xruTyIN4JmXNy6IlpmIPAehr5kjPvsZ3uERsYxsRcckF/vedO2yDu+NMyYacO5MT4xohhBGZWvLLgZWwHxF+W+6iR4mXcKK6FztIMpr2FLK5PQ0XRU3oX4FnHyy5A6BQAperXug3sraK3TjIKW2nA5YQG0KmrsC8FjW2AjEYZJD1uDeFNh6ruxguRaPmh+M/kciNVhfyeAoRiLWgDX0aZboFqLlg+30LtyWxCrQn5VlxNl7EoB3oQI4DomiBNQJlzepqsc4nv51/D9jwBe4IVWMWno2A4uAIS7Z/ojKaoZQzNoRnJITYMHLrWY/NDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxnpck7TrVA5wMP2NkTWH/2B/ZaP7UQX3MOJvDE63LM=;
 b=fjU/sN1Zsfsz8Ilk90q2E8LnP6WKw8OuGVjLL1DWIFTRnxo+i9IepLdLlDZ/dLkL3wsaIxyOm68zoyctBCWqupGxBd9hckG6tbYCJZB6N8Z01yk7KQd+EnPr7B8NMSxWEQ7sWlHqF5vablFsmsvX2DOaRrQURH0C+UWQKpcaKq0z06NBhNPgjBKrBoZd6hYTtTcMVZywbQX/vn6zD0LIiUmp40ybipVahXLiDsRh6h5aithb6p37XOOpD0weyZIadLQf/njud6gidq3pE4v/TXk9k9WnpH1VvHkb+nbuf2kBKR6ABjUCSUDSO1ISTaEH/WljzPF1CAZHdCsTVncGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0719.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 8 Apr
 2026 08:44:30 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Wed, 8 Apr 2026 08:44:30 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Wed,  8 Apr 2026 16:44:15 +0800
Message-Id: <20260408084416.29753-5-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260408084416.29753-1-minda.chen@starfivetech.com>
References: <20260408084416.29753-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0719:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d9d1b3e-e680-4497-1c8d-08de954b0cff
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: PBbu7FVSdwA5jqkyNFGLZ19jX+Si3dlLtV3Suoj/SEZvJI0tgJxgfsxV7Bp2hWQMOTnU71pj+Ug5xjXMXJrHhwlXpLLnK0sPZaUnQRWZb/B/58IZRqV2CZtXgdSjVJdujd4stabHk2aSBB9++dlq0wDQ2heY/sn3UmaayU9ebWsmLI7Un8WriRW9RDtPrV7f48z0rbhYT+HQPKbPxMlUO332LRIBavihrmDskCnW565j0QfI7IalleMCDsHrH16L2+PPGHzH0YCEouD0SbB2w7OIJn1FY5ylW8wgm+G6RKZGARZsEL7oB4pKe60QENZ8E9hw5vMIEGYg6d+3PPYRh89bHbsCmI2Jd3htYgBE4wi8NtnUQtdoZeV/0SI5Q53MwBerj+XKXVLuyMTIG6anHCRe6wddX/oVMKs0GRJnXlRPHu+0PXsbTHYTdgn9gX539dYa37Zw7KoUgBXIl4eyWcsoA2HtAdydDsVzQDj+l5mvogK2Wb+IYYDJqR1S/wwQqUElq6T/wHAfAFl8U4s9zuuWiYUQprWvnuZfBkCJym1A71DDQNkzmIvq/WWBvdtZQMnkv5le8NjgTrSsoq+DzOr1yC19qeOKmmKEudEPd6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(56012099003)(18002099003)(22082099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jfV5NZCZx0l9n6nC0xXvbkeb1hM5ibgJv4Xi7QD5iteDRCe0OJD2dJMZv+m1?=
 =?us-ascii?Q?KsWFi3N+y/ut0HMdlOb9XayFnG1nwn63Qug45tIiEVPvCHGtNBH34hNgIZqb?=
 =?us-ascii?Q?Ha6/BMpS7YubGc+nrH7GYQs8bQD4KJLrZquUYaNIWMVi+fAIuEMwXYuc6kw2?=
 =?us-ascii?Q?79UmksinX7fBeZduX7qwwHeEaU83S0rOqYJ5N+n2gSyKon/2vXbvgZ0xbMYI?=
 =?us-ascii?Q?Uxh+jz14RgohMAhDq3FlR8AcIQLwgp+9yDkcO2GTkGWMxlcE37zPRjz44tVs?=
 =?us-ascii?Q?28ySDsgjJUqbKPIaaxjxO0VRQ2ooCuJCYbTmUlyEMUb2vtsFEQq1gPa34Hvt?=
 =?us-ascii?Q?cOylNojAoNinxcVvm1j5avpESTsP/vcYuD4Jbl1VNj5JCFMbC5DAt6iDXvGM?=
 =?us-ascii?Q?z+gOfmLJpWijjVXhl4JnGWZ+yOgZ7Y62C5I8ubdm3RtjkpIqVhwrinahaZUC?=
 =?us-ascii?Q?iMT17dN9doXcb2oS2w4e/pYLh8dxN1YhJQuNOB4TOFCnCm86Eo7M39iQ5FbR?=
 =?us-ascii?Q?SNmz/hKT0aG/SpT0rhz+XSWsZzXp+RKFKS6xOvnXp+PZxBw4vBeyjhiu0NsR?=
 =?us-ascii?Q?TkatmGLkOYLfwL93VoVuds6/n3TBoZhBfMGxcDgUEilY0idZWxXwjCA3eCaR?=
 =?us-ascii?Q?vVl8S2iILUlUlyEDUsyUfbLQS0um4m6S9qPTxrIdxQuGq5olB8KYIxnAbrWq?=
 =?us-ascii?Q?+oJQVnlG5rjITEHIMMocP3raC3c/C9BNy7cT0fXIMelGKFMdbVJc0fQjzDy+?=
 =?us-ascii?Q?Mdn3eSpBfKW2ivs07wM9f2ZmhviuBDMV8WXuDQLrc9Vd0fCX/gxvoXmuISY5?=
 =?us-ascii?Q?iv/m7To5aMk6wotinH5+as/2amBkOlb+wPFYmsgkgRmtvcnXRAbat0cRL9rO?=
 =?us-ascii?Q?fuEWxVUpbQo8wC/DvAerXSVjjMydjhGqy5k/nVphqVwkiz0eqXhPO3jELAvW?=
 =?us-ascii?Q?qY7qPToqBPNyf+uCQDOcjOz3DL5RffTGQo1hK5xx8zzeHXPyoYs+Jj0CAQav?=
 =?us-ascii?Q?KfyyQwsM6Sz3ooyv3U8YRPkHw7PiRCHjhUnk8P5aBun8eqRxFJlXtOyeUgPG?=
 =?us-ascii?Q?yNUvg3KqcR4mFFYrXzQNd9CJMQLeh668D52RQtKtusNZ04B+B40VzvOcjFLn?=
 =?us-ascii?Q?hNVRNPjJDbqNhMewCI+Aaani1bY1Ub3men0kSq1GNkLMYNRisF//qKRXrRxG?=
 =?us-ascii?Q?0dTX2/W+3fF6KijwLgx58WLehnS4tJJ98RZPB5MnIYunq3/PYVtK3K7Wj15X?=
 =?us-ascii?Q?jCHC38jEyvuE7+8SEwPz5EQSV+7gEAhs+mVw8MDyKIZ9SDrZ7/qe7a3ZKEtW?=
 =?us-ascii?Q?c62xhBbJeXPAXi7r+DDTBJf857XtvCYU97jvZkYvU1K/hvFUP9aXP8/3twdK?=
 =?us-ascii?Q?+bHw7fLb0E7wy+U1UyaJ9KJBhM4ITy8vvXFughKIb9xQuuDvWFBVcI2WFCPf?=
 =?us-ascii?Q?ihPF4yRYY60kpN/CgguUDKX4nK34KO/2amTPuS3RnuRkgqgfUCPdnNaWTvgC?=
 =?us-ascii?Q?rDaztNz2bfHT1gDtV7Y+Dsa8c3VOOPH7qV002yryPC0FdfIK1f4KtNQY9wEf?=
 =?us-ascii?Q?FnRLH9cvJVAOPf+1Ud1wJKNgtS2Ts9xTzVqi2Zp6lkV0WT6KD7g8/oV2nVFL?=
 =?us-ascii?Q?SRBaLVh+KTjiLL37DZ9hpD8ouqaLYt33ETqtCUa0zZ6fNBysgNM6dIoyO2BU?=
 =?us-ascii?Q?NCsYsosTpzgMTFfV3M7KhK3Jdvc8AP77tWSMjmNuPkWYjX5rgfGu+peO11bK?=
 =?us-ascii?Q?5r6YNvV122VFgV7eBtqP1mEKMK0kFIk=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d9d1b3e-e680-4497-1c8d-08de954b0cff
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:44:30.7842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQx7cIthsroD9Nb/QHgnIJFuX1B2I2RXDg03wI58izYajqUoT2HIKBzr38kcjY1w72fYKxvy2+vQTsk7bxu1rsGIO2SVqH/hcU4FV8X7N0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0719
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1 v1 4/5] net: stmmac: starfive: Add
	JHB100 SGMII interface
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzysztof.kozlowski@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,linaro.org,vger.kernel.org];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.519];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Queue-Id: 7A26B3B9438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add JHB100 compatible and SGMII support. JHB100 soc contains
2 SGMII interfaces and integrated with serdes PHY. SGMII with
split TX/RX MAC clock and need to set 2.5M/25M/125M TX/RX clock
rate in 10M/100M/1000M speed mode.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 16b955a6d77b..df7b2fc9989d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -26,6 +26,7 @@ struct starfive_dwmac_data {
 struct starfive_dwmac {
 	struct device *dev;
 	const struct starfive_dwmac_data *data;
+	struct clk *sgmii_rx;
 };
 
 static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
@@ -36,6 +37,9 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	int phy_intf_sel;
 	int err;
 
+	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII)
+		return 0;
+
 	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
 	if (phy_intf_sel != PHY_INTF_SEL_RGMII &&
 	    phy_intf_sel != PHY_INTF_SEL_RMII) {
@@ -68,6 +72,24 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return 0;
 }
 
+static int stmmac_starfive_sgmii_set_clk_rate(void *bsp_priv, struct clk *clk_tx_i,
+					      phy_interface_t interface, int speed)
+{
+	struct starfive_dwmac *dwmac = (void *)bsp_priv;
+	long rate = rgmii_clock(speed);
+	int ret;
+
+	/* MAC clock rate the same as RGMII */
+	if (rate < 0)
+		return 0;
+
+	ret = clk_set_rate(clk_tx_i, rate);
+	if (ret)
+		return ret;
+
+	return clk_set_rate(dwmac->sgmii_rx, rate);
+}
+
 static int starfive_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -102,14 +124,23 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
 				     "error getting gtx clock\n");
 
+	dwmac->sgmii_rx = devm_clk_get_optional(&pdev->dev, "rx");
+	if (IS_ERR(dwmac->sgmii_rx))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->sgmii_rx),
+				     "error getting sgmii rx clock\n");
+
 	/* Generally, the rgmii_tx clock is provided by the internal clock,
 	 * which needs to match the corresponding clock frequency according
 	 * to different speeds. If the rgmii_tx clock is provided by the
 	 * external rgmii_rxin, there is no need to configure the clock
 	 * internally, because rgmii_rxin will be adaptively adjusted.
 	 */
-	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
-		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk")) {
+		if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII)
+			plat_dat->set_clk_tx_rate = stmmac_starfive_sgmii_set_clk_rate;
+		else
+			plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	}
 
 	dwmac->dev = &pdev->dev;
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
@@ -130,6 +161,7 @@ static const struct starfive_dwmac_data jh7100_data = {
 static const struct of_device_id starfive_dwmac_match[] = {
 	{ .compatible = "starfive,jh7100-dwmac", .data = &jh7100_data },
 	{ .compatible = "starfive,jh7110-dwmac" },
+	{ .compatible = "starfive,jhb100-dwmac" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, starfive_dwmac_match);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
