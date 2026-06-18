Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pAfpOFKUM2qsDgYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 08:46:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C2969DEAB
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 08:46:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=COt5uV97;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1B7CC8F291;
	Thu, 18 Jun 2026 06:46:41 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E261C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 06:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuYu5S3bWp5m5DgPLBdb7zcozW1oAuDamkUV26Pn9r4fN0mroe0R9gNcZ531YE/vDV/DK6pt/ENGO3O23cnyvTzA7uXHEqQt6fGNZT44nIeVA+1mArO+xU/4PXdVGwrmoV/LYE4xBvxDxqUnBTyVZl1rmowXam79uAieFknM+MweJk725yA4JbpYbFxAJoCc8GeYvldP1wqKnPOySC7UVLCeEyRgdkZO4qU02lVCmArPgb4dsMMgrGGprezJvWrLU6MNGvBdw7iFIaAt+GYgj6bfAubv4vSU+QMxlR+SVLeWLWBi0RDg3IDUexnqJbT37lOA/tlqYVXDAiNEfhmMRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYtMNvW9Xw7V4xV8rViwKBHxvNdU5b3bYhK0upuj6Qk=;
 b=e08LOvpUD6hO+lEVLVGPXqQl6bklvddon5sBNedZyQqpB5VFSJG1xjTUS7PbNNizaSolCljfuu8o0oX/18RQg0JmotpYWb64IxacTcfj5pTE/wW3FLjcIRVKU1wHZ5o6JOpTjHNtyh+5ssAh4KjNfhQzuEG8PjfGGYbd7LULmYdQODKmjO6CmeXPYMnwOwFGn7JV6E9BStZ2yRM/ldee9Y40YFbPTTaDgvzjvaF1WVpFRKBL3vLGfu6yPUbQsfLsiJ1Cn4Zgr8leRJgfFsLTwueEbA+3obbv6Kp6fAnmNFCyrdvGyX5PsZckaClA/Qe6HrnlKLt0NqJ7NS/GSSPITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYtMNvW9Xw7V4xV8rViwKBHxvNdU5b3bYhK0upuj6Qk=;
 b=COt5uV97XsbKb4nG46UxNNilBf68jyQmFj2tpzShciylcN9Q1ou0B/qKNr47A/FIYueiAULzEXgAyVanSn9w/m2DEOc6io4mNpvjFGD11YOmC+tcVFVcnnbQntvSrg1ubUnzMI0NpM4WzguTn40FDmt0eZT7m89xAcplB7F1oeuvWO8YuSyEaMmhOPMkgcnY147Nn8mWAKQynhpKa7Ufy5A90i70sKkKjfdmkWz3n6S7wr1eu9E4PxTH/fmITTHpFUYrvUg/SmetSzNp5tXrQaLI+J0u+x/vsdlDO21jNN9am2o5W/2uuqfjHmcpaoAp1J3QOPLuo+urwdsx7sgAjg==
Received: from CWLP123CA0009.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::21)
 by PRAPR10MB5373.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:292::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 06:46:36 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:401:56:cafe::88) by CWLP123CA0009.outlook.office365.com
 (2603:10a6:401:56::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 06:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 06:46:36 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:50:40 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:46:35 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 18 Jun 2026 08:46:35 +0200
MIME-Version: 1.0
Message-ID: <20260618-add_power_domain_for_qpsi-v1-1-4d7e57bcfb9a@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAEqUM2oC/yXMTQrCMBBA4auUWRtIsyjRq4iEtDPREUziTP2B0
 rs31eW3eG8BJWFSOHULCL1ZueSG/tDBdIv5SoaxGZx1gx16byJiqOVDErA8IueQioRnVTb+6NH
 RmJxNEVpfhRJ/f+/z5W99jXea5n0I67oB4MGtY30AAAA=
X-Change-ID: 20260618-add_power_domain_for_qpsi-898d2ebf20fa
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|PRAPR10MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ad1308-d262-46fd-81b9-08decd0557c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: kSh+SqrRy0gt3gCEkr+GLrwCeDKPoVIoZDWPXMIhdl4q97hohyd/fXJvr335b/CLJFPJvgVkoA37gXH81uN+kQlOBqDTMAu093DleuDFZELw1fL+aL6FgPfF+uvpXUaM7+4XcR2VqZl+Zb6wAp1D3VunKAFYt9XDhsKcP11N0qwFNIGRGQyhszRIVZIaoH8nkGK3rL63N5NkR3usAOwX7Z6uPrG/3MTrdJzDIMAb2qfg386BEj/CDiVPHnKCrPnoZr6JgQyxp4RKNLpupXIm7bg6B+DQuUbud/WLjTxiLRP6FmIHXFiWpE1Qr4TyRos7NsRDAbcir9+N9VLmufxCG4t2C/32kX00LkvzOxfgKbkaFTHl4/XbUGMtepWEJiLzKfpvSfmA1JrLGTJahvBpKpaHNwWLp3NkZN28iO03URVQijavkQJ0qIOtuaeKYzdwNHNpO5+nhbtwwst/97Dqbue11us56bAiHD1bA4LfnAU8eSVrZSqCrsRom7kHn7ADQF/a8pN942ixAJ9FgPsxO/aykFIS9isk6pEE9gxr2SGymuH/rtasNMumk3drzRc/4KUjJa9xMkV+fVH1Tqw5jAzohgRNMHpmRrq+5rGx/78bY5Bd2OmF7fYltYrfCsVjiDqXZQno/hce7rPHu5qfmadrc3ZzcaSv+R+a3uN6KiJWJGZmXQdvqMog2yrpmn2GCF2mida4GRfYxj8ebUq90fG8dh1DQ2mXku42ui12MBA=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(23010399003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w1Bqostu1zbNpdTrNBxl+rEb6XANUMrApRvscbYd5+2gthwMyteZEGbO0fst4H7sc0ysp01VrmpCTkMWBeTmDka0M0biu4qW4u0CuMHoAltEMs6JEQ0dbuvARnXuU//Dg9G4ctcMIB9cmvxtgeTMwqt6T5cH7xQx/RDrz1fy/WvLyBK1JuDxEyxo6vc5XqOpevAgP0piz13rDwUmhxK6PGeYOYlegVtvHhItPqpfbk5ojHiXMCKtYYWAn4ooKx1Bfhih1o2eLBo89/JA43SeeZN1O8tUoLzDwM8VR0WrzAF+/lVsCUv+PWCx2Tq2PMirlQyTXZVcL6x54Ic4Uo8cAoB+Y1cC8SSdwfwyX6NyjhalupQSKYHzzlITlH/uODGfCb4ARd6WoPMXassnCxRuQ12JandcghAsl8nN1WFmJ3RGk7ps2YkrTvF/JithDNT0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 06:46:36.3322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ad1308-d262-46fd-81b9-08decd0557c3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5373
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: spi: st,
 stm32-qspi: Add power-domains property
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:christophe.kerello@foss.st.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:from_mime,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19C2969DEAB

STM32 QSPI may be in a power domain. Allow a single 'power-domains'
entry for STM32 QSPI.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
index 3f1a27efff80..ee57739b73b8 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
@@ -50,6 +50,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260618-add_power_domain_for_qpsi-898d2ebf20fa

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
