Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNHuKXHGu2n1oAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 10:48:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C562C8FFD
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 10:48:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D452BC87ED3;
	Thu, 19 Mar 2026 09:48:32 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013067.outbound.protection.outlook.com
 [40.107.162.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A682C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 09:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tr3m8jPs3G3KNhyzj8m5wUlO30XvHAHNy71ZerOnOtm9EdJrZFjQzN5x7Mf8uCEtQm/CFbh8QA0jwZ7FsntiwR734ZdwCJHcP6G+kOraGgtWYYyKGuxLLl9iX3TOMCLjxBFazP4COIT5nuWVNYKub69vkZ04Pv+H+Cr2MfEfOsh0mJKPXFuIHwvbnVbIjTOIlHXY71V16hAcyMAVsy++H6uavAVZLKD/K2aEL6jAS1M97h3Wex4IE+gmKm2q23LK7YTffhIb9aJ1ReJKlYjg3LAGOnu8GD6qEoIuN8YIafWMOZrln4rilGUjAMfHhvmeQpHQNrwYeybK3Iep8yjtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8irBykowPt+uvQoGdqM/C5yPJ/WiG3eDnhOjMuzfnU=;
 b=VQPOayFfVtzbkWmE1ZRqaZV/Ej3y2pVhGY0HyUYDhR9fP1yEaQwlkLVDEbuD+mIoi3hktlYMZyvI5alICDM6m8iJ/v/fYHeWZbPkrWUi7QO75AIzrJvNcmHuBRiMgSU3bXHtroQ185qfA9PDZqw+qtwq8dEQhcSg4AS4PKz8VTh9DMP7PX3e5iPF0UvlMMmRJvjwa4Us5NYj308wPpVAMprhxTDmJ8jDdava75FaAeiiuJUouKKPOFHAX+6KmqPYbFcO7zNcPSVS8mYeyF1bsLSyh3D5AvkhtgbJjjbGyT19OZ7T2hfWgorjT6r7XcnNmBL63lIlpFwRRgvH5nbwyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kylinos.cn smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8irBykowPt+uvQoGdqM/C5yPJ/WiG3eDnhOjMuzfnU=;
 b=hDBfhb92AcbQH9dL47ruZVUQqjTu5mNw17TMz0ax31r3FW6OrJVUS7tx4lGYz7WzrgHyLDB3f40rtaHyQ8BWFvwf8bWTUTcnw7MgopGD7LVSTuCKS//fmsPp2uhD/NFxXZL/ELE8RjGHtGuw/4Mzvbs5GfvOAiOUbilaou0SGdAS/oNOkyMOeZEel5Wubi8PjBRIHfcbYpAy+JKHak64b7t3dxB2eRHRq2SQne384TVLADb4xvy6erqjOIDAEUDcIaoSermdKdOYWvSFR3TLFyzwih0rgN7Pg0ZbcFI7DoL6thVs4cMJpuvMRMGrdgVgsaN4KjnoYGaIyMfKuZC6Mg==
Received: from AS9PR06CA0361.eurprd06.prod.outlook.com (2603:10a6:20b:460::13)
 by VI0PR10MB9075.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:214::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 09:48:25 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:460:cafe::75) by AS9PR06CA0361.outlook.office365.com
 (2603:10a6:20b:460::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 09:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 09:48:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Mar
 2026 10:50:42 +0100
Received: from [10.252.1.11] (10.252.1.11) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Mar
 2026 10:48:22 +0100
Message-ID: <e0675843-19a1-42da-a784-c3364deac785@foss.st.com>
Date: Thu, 19 Mar 2026 10:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pei Xiao <xiaopei01@kylinos.cn>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <openbmc@lists.ozlabs.org>,
 <linux-rockchip@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <broonie@kernel.org>,
 <Frank.Li@nxp.com>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <c8259f582596fd08541b94dce5dbb4cae513e295.1773885292.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <c8259f582596fd08541b94dce5dbb4cae513e295.1773885292.git.xiaopei01@kylinos.cn>
X-Originating-IP: [10.252.1.11]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|VI0PR10MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 20481b7e-945b-46fc-10b8-08de859ca988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|921020|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: dXA8tdkTerByHge+1jzLn7mBEtACVp5VAwYVNtkOF/bCWL1Mp36dSDesSLfQ8XU/x2iORKECITkcCVB/l9TIc9WKkciAVdxhJb/xDjSm+X+WvFGg40fYKVxXK12p7+tPdW62FI09VKwt3JXHfHmRD+3O/A2GGgdJUOutlDWeRg1Kqa150tIYv4aP0mRwRxP03a3iLpTRlkJj1dSaKS2C8L7JHwmJOqbSibXMvRox7t56kxMrGzmEEA/q/zytFyHxcWZntCcKtvgtZkx2+Ji602A+Ds7PAz/YFFoNPZp77JUPGtVWPG+4n2n9U+/9N7yr6JaZ/D3hk5ai7FDbUQk2ATsI0DKSQVVMJkidNVIf512i7tuUkjI/6loQHfp8La8umcTwih1hfU9czc/3xA4XNRYwNzg7ZarpZfWpWPea1Ga9ZY+D+9bxY+cXyr7PPN4wsjvGFZYT4JDC3w9xyqlv+MIsM3+PSfQWbp1wMF0+2LaYhsRQ7tmuyloRiKnnCd1iCn2GM4S8rJJxjWyfFelAoR/QJ9JhceYzM67KjtZzF5YO1QZVB/CvbkpyKUaNsJLPclfuBlcmJPHeKHzqtGJPk/FQ4stXBdrqOPkCHLmBrnUV097arrwm6hlewWcl7vWF1VygqkVJ9tY9GYafh7fBM6ZToy/s6gLmUaLm/Jdk0oI5EyH3IKk7IeEpgYoFqOwJa5W/4OX/qALn9KOy/teQxqL3Cpb1OptGfARGg8WFaakTIY5MpYoQc+RT6lVgKhhghUYDggnX7HW4UhqgjiM/hYSyQwRI7uL2q7qWkTvVZPpga43oza27fG4WzFu/SR4y
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(921020)(22082099003)(56012099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iVPU4El0mriIi6rcadh4F+91RRV6u/zh1YZ+j/a4s82HKv8HXsUq3wQGPy+I5D7Vswet4sCVw3Uq9/AqCHA/BJDHepDqaCOhmceRdCUqun+VmGkB/JekN+fiK8g0bpIuPu3s0XvECKh14B8g9lrIDQeoZZBvKd2Bj3dUwTp90t3bFWyIqWTswDf4mBcSI7Tr14QfIhGxbH++gKGjkNnHQBH81yb1nfjx/EAETbxJ1KyiwejPLC3nnDQkFxu64EBU/idJWveyxOPTN0PPVsRsPhQ5qqxjK2Q9oPjhqeJLBdZycH6EZD/44S9ls2GVZEsUGtuXp1CHnXqTwE431Tg7M0bhgiOt5vPybKTd6FsjWkN47CPoT8HTOSApH8HNGyQridnMyIrDYZ/QszyRhJCAs2jjQvsFTeh/wTrHG0HOZM5PK75fi4Cr40u8NLR42/KR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:48:23.8001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20481b7e-945b-46fc-10b8-08de859ca988
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9075
Subject: Re: [Linux-stm32] [PATCH v5 13/17] spi: stm32: Simplify clock
 handling with devm_clk_get_enabled()
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
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:xiaopei01@kylinos.cn,m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-rockchip@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36C562C8FFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/26 03:04, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for the clock. This removes the need for
> explicit clock enable and disable calls, as the managed API automatically
> handles clock disabling on device removal or probe failure.
> 
> Remove the now-unnecessary clk_disable_unprepare() calls from the probe
> error paths and the remove callback. Also simplify error handling by
> using dev_err_probe().
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

> ---
>   drivers/spi/spi-stm32.c | 62 +++++++++++------------------------------
>   1 file changed, 17 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 8a7f5a10d4af..be88e62075af 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -2360,25 +2360,20 @@ static int stm32_spi_probe(struct platform_device *pdev)
>   	int ret;
>   
>   	cfg = of_device_get_match_data(&pdev->dev);
> -	if (!cfg) {
> -		dev_err(&pdev->dev, "Failed to get match data for platform\n");
> -		return -ENODEV;
> -	}
> +	if (!cfg)
> +		return dev_err_probe(&pdev->dev, -ENODEV,
> +				     "Failed to get match data for platform\n");
>   
>   	device_mode = of_property_read_bool(np, "spi-slave");
> -	if (!cfg->has_device_mode && device_mode) {
> -		dev_err(&pdev->dev, "spi-slave not supported\n");
> -		return -EPERM;
> -	}
> +	if (!cfg->has_device_mode && device_mode)
> +		return dev_err_probe(&pdev->dev, -EPERM, "spi-slave not supported\n");
>   
>   	if (device_mode)
>   		ctrl = devm_spi_alloc_target(&pdev->dev, sizeof(struct stm32_spi));
>   	else
>   		ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(struct stm32_spi));
> -	if (!ctrl) {
> -		dev_err(&pdev->dev, "spi controller allocation failed\n");
> -		return -ENOMEM;
> -	}
> +	if (!ctrl)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "spi controller allocation failed\n");
>   	platform_set_drvdata(pdev, ctrl);
>   
>   	spi = spi_controller_get_devdata(ctrl);
> @@ -2409,32 +2404,18 @@ static int stm32_spi_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	spi->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(spi->clk)) {
> -		ret = PTR_ERR(spi->clk);
> -		dev_err(&pdev->dev, "clk get failed: %d\n", ret);
> -		return ret;
> -	}
> +	spi->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(spi->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk), "clk enabled failed\n");
>   
> -	ret = clk_prepare_enable(spi->clk);
> -	if (ret) {
> -		dev_err(&pdev->dev, "clk enable failed: %d\n", ret);
> -		return ret;
> -	}
>   	spi->clk_rate = clk_get_rate(spi->clk);
> -	if (!spi->clk_rate) {
> -		dev_err(&pdev->dev, "clk rate = 0\n");
> -		ret = -EINVAL;
> -		goto err_clk_disable;
> -	}
> +	if (!spi->clk_rate)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "clk rate = 0\n");
>   
>   	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>   	if (rst) {
> -		if (IS_ERR(rst)) {
> -			ret = dev_err_probe(&pdev->dev, PTR_ERR(rst),
> -					    "failed to get reset\n");
> -			goto err_clk_disable;
> -		}
> +		if (IS_ERR(rst))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(rst), "failed to get reset\n");
>   
>   		reset_control_assert(rst);
>   		udelay(2);
> @@ -2461,11 +2442,8 @@ static int stm32_spi_probe(struct platform_device *pdev)
>   	dev_dbg(spi->dev, "one message max size %d\n", spi->t_size_max);
>   
>   	ret = spi->cfg->config(spi);
> -	if (ret) {
> -		dev_err(&pdev->dev, "controller configuration failed: %d\n",
> -			ret);
> -		goto err_clk_disable;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "controller configuration failed: %d\n", ret);
>   
>   	ctrl->auto_runtime_pm = true;
>   	ctrl->bus_num = pdev->id;
> @@ -2490,8 +2468,7 @@ static int stm32_spi_probe(struct platform_device *pdev)
>   			dev_info(&pdev->dev, "tx dma disabled\n");
>   			spi->dma_tx = NULL;
>   		} else {
> -			dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
> -			goto err_clk_disable;
> +			return dev_err_probe(&pdev->dev, ret, "failed to request tx dma channel\n");
>   		}
>   	} else {
>   		ctrl->dma_tx = spi->dma_tx;
> @@ -2579,8 +2556,6 @@ static int stm32_spi_probe(struct platform_device *pdev)
>   err_dma_tx_release:
>   	if (spi->dma_tx)
>   		dma_release_channel(spi->dma_tx);
> -err_clk_disable:
> -	clk_disable_unprepare(spi->clk);
>   
>   	return ret;
>   }
> @@ -2610,9 +2585,6 @@ static void stm32_spi_remove(struct platform_device *pdev)
>   		gen_pool_free(spi->sram_pool, (unsigned long)spi->sram_rx_buf,
>   			      spi->sram_rx_buf_size);
>   
> -	clk_disable_unprepare(spi->clk);
> -
> -
>   	pinctrl_pm_select_sleep_state(&pdev->dev);
>   }
>   

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
