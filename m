Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAJkMqhxnWmAQAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 10:38:48 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65750184BF2
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 10:38:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF9CFC8F285;
	Tue, 24 Feb 2026 09:38:47 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AB26C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuFp+OOZvsFtX70fh7xP+PVytw0xb/pCSjD9tkK/Mx3TPuwppuZuGGwBzMNzrauPru/meJvJrE5YDu0WboAlSh2cTO/cYZ6pyKcaV3kpqJqrOsfN2eES/t2dT5r1BK2gLyG/9Rx8a0N3zzK4asV+CxDlxK3oQRAR2+vseFoQIiADO7vjlMRy3cdmsYqg36x++Vm8DEs7Xypgy6SQrp1Ud4x4FwchQN/cmHNkDV/p0XM040KLy+8g6pjaHnBeVLDn91KrjijZO5QbF4dNzaDPWuMkJGLncow5bKcH3jYgqYGY40yEDKwyvBdQL4cOBLmIVuYxnEuWcmTMOGSuyX1KiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbMrX8dEjwBmXe/M1xKs3MrYROJDUxcdPy0FKieOI3w=;
 b=x/ZeSpaRyKNHXxGvxPjHbxt1JPWP8RaLT+5LO5KcJTTP1x2Chd2Zxf+aKLA/9unqc/VA/wQOI+4uT4FS9+EPJoTiDfqW5Y2IDeNTGlv6ltRDWuY6SMqcvA6wrGdWo3DLEwezG87AvcqLZBqdogVvSyVhp4hxoZN1kQP0gPIkX7vIR07m+qGjwLAbwAmM0B/rv0YD6YqLVzv8AYXoQ5OR3aW7cygo6ykrOjjwHUDHu2kMiaiAfwThkCL3alsL+FTlkDCVE1AiXcbDfeOhgJ89u0b6jrO1GFTKCQeX3AVZNWOKZaTThHTxD199dPS+IDLbL4rzJFdTNgCx44S0mnDnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbMrX8dEjwBmXe/M1xKs3MrYROJDUxcdPy0FKieOI3w=;
 b=m5nwIRE0gayxfOWy2eEib7UPnG50knDm6JyxWJVu61leQL4JFf34vUcJ9EasqsqMBY8opmWxvzCjrCkalu80QBI786Xk8o6trp2tB9ccow+42Vu9bbbfVTfHXcsHg2gqan/Z+qw+ohTB0mWq5T7j934fcDp09r0XrC3KIOliBbTSnuVCMwJ5L7KVCDLCxDGboKfcTP8/IBiv6u6xZJy5MHHY5hrOXGFN2OxHneQ8UXqTGYRjBkHOkE9A2J5Znbcx9pL+a3kSMmaFS0QPj0dlOKOP4Zoc+vo+9d+k8J36b6LD6X+ivuLVRh8Gf8P0onzHkQm5MVcFLqK5gVHsnU/8rw==
Received: from DB9PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::10) by VE1PR10MB3805.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:164::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 09:38:41 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::e9) by DB9PR01CA0005.outlook.office365.com
 (2603:10a6:10:1d8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:38:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:40:56 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:38:39 +0100
Date: Tue, 24 Feb 2026 10:38:29 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <aZ1xlV_E1NqsGm7P@gnbcxd0016.gnb.st.com>
References: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|VE1PR10MB3805:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e59ee4-bc84-42c7-9c44-08de73887e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OPgXd0NQJ/5RcVWu/r3YP38H8Sx9yAnIV/IZV6XiIC0fuOMokgkaiXtan0lC?=
 =?us-ascii?Q?nmfXeOvloHwpdBn/MuQOOlxpCDE6nF107O+2Iq61VKIsLcTN2to1I1kqe59c?=
 =?us-ascii?Q?OXwtEB+ryflzTxR1F1h8UtwZnbgh9gqtW4BYUm2LDFJx8BqPO9hCZGciAD7S?=
 =?us-ascii?Q?qwsYmPFW9ImFscR8a9azxNVBE1UNx7H5uZJZrBC1b5mIJdOA07EXqqQM7OMh?=
 =?us-ascii?Q?8A9ZXGswjSnQyi5SKIB0JPNbJ4wSet46Ao6bLkXbalUyMZMynoCh2OO9BV3+?=
 =?us-ascii?Q?FEYYSU7J0H93/lNeHfbvxOAIPKYm2KYeEKmMWxmlQAC98FxIQJkxayHXWnpk?=
 =?us-ascii?Q?wIb53tR9bTECsTHfbIimC2gYaM/O38s4Rrwg6GhmWMuVCqy1vyvHcp76XLWr?=
 =?us-ascii?Q?bYsu/DdWUIpKNtgAieKW1NruYEqEWAPEWZOMo81KMndY7gM8uDCBbXGQWm8k?=
 =?us-ascii?Q?pccU/XgIDwa1qiXsJJXfuKlBW3z4W5mJ84z6GeZm24ma5hGAiQIM9gqg/4Tl?=
 =?us-ascii?Q?LCVRHHyLn7yNwSm/5kI4kkUb0ePG9mcTh/KyLAlFi72qKeqUCLyshU8ZqRRw?=
 =?us-ascii?Q?3jsncx2/1qSBhG99lnwZW66tLhSZ5EDvuKbqQtbSLDZ7NYErbB0yPo47Tudv?=
 =?us-ascii?Q?J3K14PEAcIROhExLHTgoOb6lOjVkAwlNhbmO9rntUXRfheiazgcAbeirZFs7?=
 =?us-ascii?Q?Bi4R2xsLNKFI/KStNvJ8uvplQRuEFaMrfi7hXCGmIjNOK7dSxFMlaugNbhXn?=
 =?us-ascii?Q?GCiURqlsM20fK/uo4kFiiNSiYYeW6bYzFaB3SXkjdG+uW/K5zDeoLakbSGg1?=
 =?us-ascii?Q?gIsZCOEzgN9f3deZhumhskw2OE6mGz2S1Xcg/i3WybShIDXzrtt3LigsPIXX?=
 =?us-ascii?Q?wP719GEExPmZP77IUlOK93UD+6djZvwerq/QcVByF9gKDRV/9rejQnj2KEC6?=
 =?us-ascii?Q?LLqqVMe5t++3Fm6bh4I45MiC7TuUof3BCK3Cj+M031TVu10iMAXNczKbXn7A?=
 =?us-ascii?Q?FY1InEE1XQVL6Wz8XNgQifGeMpkbhq4y+v3Jqmt8/FRaWy4UPxz66wntxeA8?=
 =?us-ascii?Q?smQA85jWxf68MNnr0zWWl4Va05FEmvnoyw+X3X0qaLCuoXn7Kfp8lmInbZ4V?=
 =?us-ascii?Q?q2m6ahBduXvTKnv/IJPSABSCo7SYp+DfG8IdbmrKJkB6qImut/ThplxEfQdv?=
 =?us-ascii?Q?tH0FNBzY8oqS0wzkjhoc86UQvzBBo900+sJa9NPhqxCti7xt/8wwbzMv6byl?=
 =?us-ascii?Q?dDRa+GYVFzaOic5vx/f4NZwjHy1AWHDL4XenS+PtwpcPtuH3N5q2l07Os4PG?=
 =?us-ascii?Q?TZOf30MUzI2HmDT9vLlX3NJBCmqPIxwUlE98TDEQdUmqtKCRQn5W6RyJ1aa2?=
 =?us-ascii?Q?X3/C+KuIm/zXaePdHruta02MU9rVT+780ycLSvbpnsKgGY6gBBS3npwEiR8b?=
 =?us-ascii?Q?aL5Tbz73E2gRLv/0+rkwYRDaL8008C+ZQJYL62ETg2qAHuCxrrLSgVALsx+Q?=
 =?us-ascii?Q?8XtYbkGCty9KBNa3Xnr14eNLH/qKj+qfNQotpt/2tq0nJuHaSadgDJrwpThi?=
 =?us-ascii?Q?yHpPgwEYjZIxEmxH5FbtK9QZD1njIM+vazz2hzofqqorCDvQu6ZcYz0R9ZcA?=
 =?us-ascii?Q?eWT+AbyTDctDHCm5DUmWzE1cfL+7fjaizuwti1QZEk31Z0Ajurs+hwKEQNm0?=
 =?us-ascii?Q?+UBqcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: neYYKSCkRBzA+Ss+7bAatA6YjXXnu1Cb3pcd8ebWFVXHTeMolMoJUJPlsqc1+/7PZJWAHy3tkLOf7xLcFP7zJFVcrC/nbC/p9V5XFjODjAKlkJ1yvS00cDZQ+ZhFA83jrXYZgEXcyT+G4EgjyMO+fzC5gRhY0mbmHdeIE1i21lk1U2guqtV7uoGzZPH4R7pdDda+l+U6FtTqr742us7nODLD4R9ZyCOdeDYOFwPYIhqGGowqB0UVUG4KSM0ZQyDZ6UQijI9xOohDR/FcTKa+DjKlXi/6KiJT5yr/ID+G1BDJn383C3m3imS15TReJvvC2B1OeiHS7uqrJNXhXFI10ZO45Wakbq8dbAFJqj5QgwVt46nWqjG2oFfD515xoo5fafOU4q/j97bDbEfD71ZS4Ki1WCMcDlKw8XieebT2GOckaczmd8aUBz5ZHqRzPw9k
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:38:40.5118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e59ee4-bc84-42c7-9c44-08de73887e61
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3805
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Use NULL instead of 0 for
	pointer
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,qualcomm.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65750184BF2
X-Rspamd-Action: no action

Hi Krzysztof,

thanks for this patch.

On Mon, Feb 16, 2026 at 09:58:17AM +0100, Krzysztof Kozlowski wrote:
> Pointers should use NULL instead of explicit '0', as pointed out by
> sparse:
> 
>   spi-stm32.c:1659:65: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/spi/spi-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index b99de8c4cc99..38f6bba38b07 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1656,7 +1656,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
>  			ret = stm32_spi_prepare_rx_dma_mdma_chaining(spi, xfer, &rx_dma_conf,
>  								     &rx_dma_desc, &rx_mdma_desc);
>  			if (ret) { /* RX DMA MDMA chaining not possible, fallback to DMA only */
> -				rx_dma_conf.peripheral_config = 0;
> +				rx_dma_conf.peripheral_config = NULL;
>  				rx_dma_desc = NULL;
>  			}
>  		}

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.51.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
