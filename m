Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NMCFBpOVM2oADwYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 08:52:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B32269DEDD
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2026 08:52:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b="KFI/WbBi";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C516C8F293;
	Thu, 18 Jun 2026 06:52:02 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47D81C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 06:52:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ9jUOkeyA5fWJ3apYgGkle0viTtzNewUA7t2uF/iskzx2OyrWinlOY/DgjCmSIDicn+Ws/5nTlU+nndjn9/u3JDeaPv4zLL5G1r+4n813FwPtwf0mdrKpCd2xpeVqkR3H91Gx8VEVT2BRoERFwB6EnjWu0wZAxKS03qT1NhgVCPR0uWwpRnHgKbXLCKomQVd7KNR2+ECWrINPP2A5jZVLG1lsFu9zcbDUbt2ac/6JIr3muW4gbl7QTXNO8CMORMYdX6SKNY7wfNwAHCke1+jW09fPHx1HmndrLqfmw0fe+qH0bRQ06pN0YemL3d9FJLOgVy+iTJJQcyO2cYY0xlkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=didCccuAAYPEtxBbxReNM4BP5K1f+cECvIgX7ofcO0Y=;
 b=tHnnvr9xVrfgyYKCUGkwx2HWLUdU+7GFUa5/0ecw14+tevLj5Bterpsh3TsN+4ZwvQs5Aun4M7h4DDgjmr2nuMldTRIZfNazUxVB7t1J7H73WpsoRoPuUP5iK4rTfzyp42ZE8mFFTExiFq/ISaq6lrhBWKELBs+6iaNS5lJTH05k+sHidkA6RqJJ2oLtnHHUTYkYsaC0/zLGpzt5Rv/BO9RJC9032ay30Sc4gD0PWCVS9tG/vrk1Rb4QDPfkkwW+RboNsmMznuEXzBWuX5BGmTsrl9nVUd/V0/dRdFiNKz4Byw/D6Ue3BJ1MfexTfpCM5sDjl7PgdvDp8TcrwImgGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=didCccuAAYPEtxBbxReNM4BP5K1f+cECvIgX7ofcO0Y=;
 b=KFI/WbBi0IbPuXIau5DQNE+p7NYtWME8JMXcbgMi3tTTQ/ktTED6TQf+POQz0dpp2OW19+mkNGwNhESa7PdtUGivH3XLPNSKMxuLXQYGVu1sofSEm2mFBgneNKqISoitvrM+z6R+G5Bvd7byMujxSC306DKPMLfxTunNO5Q+1ZjiwzYJyQluly/bsD2VK0tvbacJEkNq4xrqRa3m5o11LlVDvZIaH3OgPRW6JfrKknwpP3olmv4flXDKcg5JQv+3CYJ4p9JJy/BKxTuZeLslEfip0KJKyJuQvqV9tLBeogb91HpxLMSdsNv5O9S7c5MNzSmhwG8RhseP6rwQUtOZ0Q==
Received: from DU2PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:10:234::34)
 by DB5PR10MB9690.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:654::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 06:51:57 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::4e) by DU2PR04CA0059.outlook.office365.com
 (2603:10a6:10:234::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 06:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 06:51:57 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:56:15 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:51:56 +0200
Message-ID: <5d965c04-04ac-4591-9b0d-c8324213cdc0@foss.st.com>
Date: Thu, 18 Jun 2026 08:51:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ruoyu Wang <ruoyuw560@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20260617182202.961843-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260617182202.961843-1-ruoyuw560@gmail.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|DB5PR10MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: a998188c-b8e5-4ccd-fefb-08decd06174c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bsyiydGPqUaM16yj9hoDGLFgeRfamYlqpBEaCYsqymMwvxAszUxkeomIGTNcfYTi8KOz+TbywvZVq/jDPybyAJDSspi4ywU4JK5rmdDk6TctNpN5Clxmvj/5Iynahfu6Msq11vSDxD1Oran33TNXgj3HdAg70DNzw8G1HN+s7LviRhw6D+Fqau/64zr6yGZ4Zc6sJP/Aus0I3LxA5OjArWuBlRr9ezvItkRMdlsDQ4+798l6rikGB6OZYCNSBJ9cmPBI1dAF8B9t9lxf7h21h1VICux6CRS2b3ADyoTsZwxbSsKp2JRYjCzU/V7jtGJT+O3+RiIx+lK9wbNzYG3YeushYLCmzEBssnmXinhacivea02OXPlnH8ee56/5G4dIqeoQFZE4xSQFLNLhIKMWAZowpvY3wEjR45xaJvzeS1OzSgMvgR21MXaCiUlytD3f/eUco2sp1MSxaQ8GTpgv4ywQ9RQ5FCtB4NvQoqxtkFHFjCPl8fRTghaWC8Q6YYGOABm/E+bCp5r7B8W1SvsBJfVcfUVlzA9Q90n7+Gvw5uOtpBaFNCwZ8le/TtANyL6w7AkqEvx38qfXKkfEPg62PYbpW8Dvv5Q4/OH2fev4mxXtMwR+gMqmzh04VRlfZhNaELNHZuhdIIrEXIq/wRX33mxNqP3KrbifZZw80IBA328gde2QxJ0cQxJp0eXElKlVQThzVTHqSd5kGsjjnLCyPOQs3wZctTHFVP8DZbHbtWY=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8VnP6wqv/i/ZaSUkvk4/pcOxVfS1AaicjDf8n59CJDpXsMtF2KMG/6IuHMiFjTcH0wkaIRMUfmmE3kKwvYShXmb7psyPX//1B9iNopIFkiPZZcqbIGuz3Ht9Lslc2dncIKIoYehl6Zgfb5Flc6xrOtxQkF+ywOZKJDDfE1BghPfSIGLNQHdtZ06wKJ8FwfRTwD+m289SV3tUSxb4AeuhnJpgAlZj3IuNnEoflOnCET39Wcz7rfubJ8QbNb3SufdPuld6BQe5wSM/8y+2m9HNTV0dOY5ec8Gre0a2UZsirpZoDoPA/ZzXj4E0yBHfEhLCGAuXbD7r1UOEmeGV24zcrlfp3FRXDUwtixXbByWivCUWSNmIpXYXYkZCwgkKIHiq/QcNNU1rRb/sH/0F3C5myMCN1kdEmeR0c1bL2kwyfibLQmbYXjMk5pd3SmAZrmw7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 06:51:57.6358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a998188c-b8e5-4ccd-fefb-08decd06174c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB9690
Subject: Re: [Linux-stm32] [PATCH] memory: stm32_omm: initialize ret in
	stm32_omm_set_amcr
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruoyuw560@gmail.com,m:krzk@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:from_mime,st.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B32269DEDD



On 6/17/26 20:22, Ruoyu Wang wrote:
> stm32_omm_set_amcr() returns ret after checking whether the AMCR value
> matches the device tree description. On the normal matching path ret is
> not otherwise assigned, so initialize it to 0 before the checks.
> 
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
>  drivers/memory/stm32_omm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
> index 5d06623f3f689..2a1af229d2444 100644
> --- a/drivers/memory/stm32_omm.c
> +++ b/drivers/memory/stm32_omm.c
> @@ -47,7 +47,7 @@ static int stm32_omm_set_amcr(struct device *dev, bool set)
>  	struct device_node *node;
>  	struct resource res, res1;
>  	unsigned int syscon_args[2];
> -	int ret, idx;
> +	int ret = 0, idx;
>  	unsigned int i, amcr, read_amcr;
>  
>  	for (i = 0; i < omm->nb_child; i++) {


Hi Ruoyu

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
