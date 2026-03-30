Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPHuIxQSymn54wUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 08:03:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334F355CE7
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 08:03:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 566BDC0693D;
	Mon, 30 Mar 2026 06:02:59 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E116C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2026 06:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ro6EwkL9KPeDFnOD9G+XD25l8wAIkpUsiIFtoisQTt26aNxbFXaY3wNNEdW4sIFlX0QXBJQBoU0LIlW3L4Mz/xBBB1NU/S5ND6sU6QNA+IqMbvcSkOnozZLAYx3UvGYAjiwOGpka4t+UrSMQ8hZuAbuvtgOdjZYQl5pSleE/p7TP+MzQ8QKFNhlMiCdTDm96S+GIU0h/6EzMM7iAim0TL0Ij9VSHYlO9nZEvhGb7kYxyLUZeLu9kPC0aQAJcaC/JPUm322xiq/bRdMzSbnpAgYqYHREBz+kFrvjelo+LvVWSD2IIk3b9HlYE0jzj8bBcyDT6XRtjv13+3q7Vwf0G3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NV5KHMa91ytPkFWV8Phit+K6SI36of/L0YBVKeZbhg=;
 b=RIwNqzydR9wjO/v6HTcqfR9xNzyES3wuMTZJa0Ig3Nhgfo17MuyJToKMVQzSNxhVuOM0Mov61FuRln8t0byJRa565Bn/L1prTGi1TPLDGLffMotQhNuPIW9X5qpP2euv1cNa3wLuffk7DgzTZUj6sGup59OpB3MMrz2fb/cJBx4nYLmmvUlVyLiUuVrBOI3MsDsOKpaGWOwc7FzhRkmRlQu8v3uS9g6mjs4oeG1VmlAEo6k78k2SEyEoBEOrcLlB1sRJQ8VZsOqlJnLO9psHOL31hkCxdF2jh2FBbdUKLwv+hqIsYaVdcVU2lyiPTkmaOdR3yMltMmHUnOaj7bf7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4NV5KHMa91ytPkFWV8Phit+K6SI36of/L0YBVKeZbhg=;
 b=P5YoVCm8M8L1StmPeN2wp8Kcq8Kaz2I9LCyj5s6qf8Ht7eYHUWMwsmG02Aj1+7ARNMAYnrSBlCvSe9uGmVR3qs6lhkT+f361mRWEeAFRQ5kV+16+jsn24iAlKwwwnAd2HP6ecEuXU+oTzTCmqdI47AwEtMcSxCiJaQ1CxFfUuNF+lOnJ2sSjvzpkMVnDfnAHpUAP5fYu94x0ZZhCucONcOl8WiRWhNnjod5cvkiGFzNAo5nUH2sVzdwYZ1+oevzyvPLKzs0HgW03cLGMK1cg+Tpkvd1PRS9ou6u4mtdoCcqlToPG0K1GnkqUm4vL7y84xre7IXMVuYuAMiUVtOUt4A==
Received: from DB8PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:10:120::32)
 by AS8PR10MB6892.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 06:02:52 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::ea) by DB8PR06CA0058.outlook.office365.com
 (2603:10a6:10:120::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 06:02:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 06:02:51 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 30 Mar
 2026 08:05:46 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 30 Mar
 2026 08:02:50 +0200
Message-ID: <48310ec7-490b-42d9-b3dd-46084a3a7efb@foss.st.com>
Date: Mon, 30 Mar 2026 08:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, Mark Brown <broonie@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20260329-stm32-ospi-v1-0-142122466412@gmail.com>
 <20260329-stm32-ospi-v1-2-142122466412@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260329-stm32-ospi-v1-2-142122466412@gmail.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|AS8PR10MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fa7b63-f492-441a-fb78-08de8e21fa4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HniyeHbHKUgJXGQpCM78AjVt6WGu4OBmXIFdv3fxLP+Hczam6/stXejVbevMkJp4UFiJMT3cSR3QSypjOXtieheHQ5+ueampsH0xQQbw+rzbQ26bBbH9uJYzMuUtWVAotOa+21ahJwA5GEoNcIjZ3NsNMs+kEazLzjI4NFtQ4l99o8DnTeCxNno7F1ooNzqYvvUZT7//6zlKkgWiA9X2rLO233uHlMoDil5pfzZ0rbm1FMFFbvthdi968+qYLbj8/HApxSVa2rVJnFYz0pY5xedmBlKNq6OEydxBR5FZB7Y9gr4VObE1dhpxRJ0R8xvx9X7ftwZVwTFVA+bvxjKSzafvPgxt4MbX/0rq8qkgxrQ2zvuz7sEAVfmikw+edt9tQgt2dubzmzQgA10mc7IokLj3n9IXa4NIFQNjsDW1c7YUExCtEc+wb+O6pbEiedGhxNXcFfl+zWt/zdHxzyRIGFmJglCeQwwpir9/jPt61Ts+aUPre/NttlwNA+X88Fn56QSeDFNhUdXjy7DNRodi4AbYCGGJB3/TJyBboqi4/PJ8sLevRYzos3wcnvEzJ/h6LxbKO8ll/ivGPAguDGWppcVAmhYJDcTjDbC1+ndKDnD6A94ju8lWR1Us6sEyAY23+cs2JrxZTatyKAXq/e3gA1GH1ZsQIOIREmB7SxbGeeqvDcDAtSFJ/Rjq1fWhyF3tfegwL8ZYgH+65bsGv+mrBz/h2jEZ5YacFZwOf1Ejz2G7PeJPY38dkOUs4C8lkRNBM/+7iDQJbqpEJQ2REinCnA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cSCiCcOJ7cmwVF0FpkYPd/1jcWHd+9YW6OaVACi8XxRf6arJENQa/qmhDjnf8XMnQ+EvA+aYzSWN0Y5YIgo++ADMyUnBj7zpTj6/i4SxTYk+XSgOq3gPsqo2klFTR+krX/+KXkledzzSH5geBkRWRKk+QzaZyqyiFexjgGXMMvxA2hhiEbzpUz9Sy3f3eYeZHR/C+HAiPblsqIQbblMl+M1/xcq8evq8wmyngM2XXbEkRbrbjKHwJdCsWEO6EVU+9QXtlfmOdQMNIpWIghN9ODQfq7jMeGt0B4h2b9uQLgDHJsSCNM9Ybcq7iu7CR0dOhHmo+uLdcJZdtuXxoKC7iA+nv3+QkMkcvCJlV823b9i4pLnGlaiFGZx5PIBcHt7AoXefI9xwPiEErEpawGKCLwzA2Foltv6Pw/GK/cm3t0G+wzuP/pEHjJ793zbGd3P4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 06:02:51.6517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fa7b63-f492-441a-fb78-08de8e21fa4e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6892
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] spi: stm32-ospi: Fix DMA channel leak
 on stm32_ospi_dma_setup() failure
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:p.zabel@pengutronix.de,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:ustcgu@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com,pengutronix.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.044];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3334F355CE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/28/26 17:07, Felix Gu wrote:
> When stm32_ospi_dma_setup() fails, the DMA channels allocated by
> stm32_ospi_get_resources() were never released. Add proper cleanup
> in the error path.
> 
> Fixes: e35a7607e05d ("spi: stm32-ospi: Set DMA maxburst dynamically")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/spi/spi-stm32-ospi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
> index 52997c3f7174..34498939bcdf 100644
> --- a/drivers/spi/spi-stm32-ospi.c
> +++ b/drivers/spi/spi-stm32-ospi.c
> @@ -923,7 +923,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>  	dma_cfg.dst_addr = ospi->regs_phys_base + OSPI_DR;
>  	ret = stm32_ospi_dma_setup(ospi, &dma_cfg);
>  	if (ret)
> -		return ret;
> +		goto err_dma_free;
>  
>  	mutex_init(&ospi->lock);
>  
> @@ -975,6 +975,7 @@ static int stm32_ospi_probe(struct platform_device *pdev)
>  err_pm_enable:
>  	pm_runtime_force_suspend(ospi->dev);
>  	mutex_destroy(&ospi->lock);
> +err_dma_free:
>  	if (ospi->dma_chtx)
>  		dma_release_channel(ospi->dma_chtx);
>  	if (ospi->dma_chrx)
> 

Hi Felix

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
