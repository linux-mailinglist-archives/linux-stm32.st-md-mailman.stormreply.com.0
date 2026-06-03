Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WGOYH+/sH2r6sQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 10:59:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27F635EE2
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 10:59:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=j9iFMqQP;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B52DDC8F271;
	Wed,  3 Jun 2026 08:59:26 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013026.outbound.protection.outlook.com
 [40.107.162.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 519B6C58D7C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2026 08:59:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPeKAqFQcl1aIHO6wj+OwXyXflCFarURAuPz72jOUbP+0jdxntW3JUyP4JSpoAjq0UVpYFSF6TeTGXhxjbxhbBmUNq8Iucvohs+bKn4ODyDCI9+AzrOVyo/vLgHy5MSe9g5sBOn1+ZcSAIdeVY1AAX7OQcXmW4tZjpnLU7zGnJ5Z2/RlMS5KavOmH7PEbi+2idxUFfLm4nHyL2I/mhkTZY/2nkHEb3bCpfu8ZpLRDFjEIIL4qjXBxCbo9/S0HbrlA7m+9rWRrW2P+8/F9NqrUW6jLFOWbYdTYIB73zs00LAoa7P+xOWRDhQxgb9SpEX6Du4iwVvTD8bmRVDXKEkFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNOTBXCN38+2RyNzrO3uBkD4t8BJgScnmbAFK79Q7+U=;
 b=eFXmqRyZMLszBUXYT2KsdNfJyNvInwte7r0wuWsZOkTT8lxSwNE4hKMUoCwaTWe02EKr8iu1bTxsCF6Wz5fSVMcXB5l/PRt2swYtKtJn31zfvPPvF/WcBMIiq6cpbGk/RoyWnxlEwQUILQzeYCH048RfVL8nOXpxI04t3kK31mNIT+uFXC0+eil9iqyZtyXUO+/fml4bNcHhaO5m4ZAmCbVovd7kgA53sAK9zJyH27b6zqOw9lUCzWyhXDbAHeeyKLJpv51+eUu8FWnqBG5OeiwaP7o1GhHP86wornl806PNsOC6BGYaDJoOAK/iffsk36MzJ+Ez3SrREPzGWQhW5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNOTBXCN38+2RyNzrO3uBkD4t8BJgScnmbAFK79Q7+U=;
 b=j9iFMqQPsNB0l80jONKDwQOwaCFs6bLh5Szn3mKVDZjxSUJLXMPKr1TG7rpE2y0//kim65WChUy7iUhOgXbWIQvUsbIgUdAnSZG4Ub92Lch/qrfQSoLUl1SGJSYxKagSvcTy3VH9ZYrbVlUVC0vSdcqUa50zfe8aj3Qjvz2huKtVErMN70BYYcU18c0yyYhqUg6txiF6+/RtnPHV99tlPzYolgtDs+3dU5wsg1ErwhZAMqMZcpOZNMjEP8OnbpOeiQeHcsW34oaLNATKInHlgZlbpsqksTsS2jo3K7Qod1b8hpYJxSaLGib7fUb1MvBti9TRdEKD5l2clAu/Fu0JTw==
Received: from AM4PR0302CA0028.eurprd03.prod.outlook.com (2603:10a6:205:2::41)
 by AM4PR10MB9404.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6cf::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:59:22 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::19) by AM4PR0302CA0028.outlook.office365.com
 (2603:10a6:205:2::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 08:59:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 08:59:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 3 Jun
 2026 11:03:06 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 3 Jun
 2026 10:59:21 +0200
Date: Wed, 3 Jun 2026 10:59:14 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Guillermo =?iso-8859-1?Q?Rodr=EDguez?= <guille.rodriguez@gmail.com>
Message-ID: <ah_s4nd99Bit9eAU@gnbcxd0016.gnb.st.com>
References: <20260526091210.20383-1-guille.rodriguez@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260526091210.20383-1-guille.rodriguez@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|AM4PR10MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 12200be5-17c5-4e70-c7a4-08dec14e67c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: DrO0UUcR1bC14SVQLHbI6luo3TowYdUO/oOmSAnE1MEcP4j+7aH+PanoyiIHF8JFlvtBEIJVMa3Z+FQy4tJRQaWTJXUyOs2+HhjVAp8Og/gBfCyy1S1JzU+hi+EtI0VNv4PJ1zGQExAXH3E9OH0nTXi8Te12zADCNxtP23mpLMEzapvkQ+ei6MpYpPNm0q6YOipHUdCPDxOXxMzlxci+IZnJwIVq4EYr9X0EyGMLBl5eLmEFkrXlfM3IZSs/91faa6LsnuhjGayBLmRzIV2OBdSDGXnBUJMCY+EI5DHhIcWkVOdMOzo9zU/sB15VHNWWiT6y+mYqB71MpWs8m7phIQs+h3hEBBLTT7Sxv4SZZ39h9QXRfHRV9zhC+Qpdar2MdPGMLSTcCJ2AGDr4xFKG1IPtCboYi/WIRSfd4FepsRwQOm2O2/2pEDpCeKMSlYCGlCf9VwnFA7+5EgTcJPPDYvonEBiwfsR25DPEhqkgjLP3voKZVRJQy+plfJ5BgP9iDJLVlKOOiM2vdn3cmse3h2B0LgSJzuWrk6kB5eZo8vlMwIH7JHpYfvYM88pPFMfOPR46xJ+UMKcBMMOo3w9SrxLHzY/rLuUl2AAhqfprjWvlCRw4HeCUgBHqkccYsTFlediszAtX472538JDX00CODtV/HXG/gOBQd2fNwmQ+uZR24j3mImasVTP7k2rFFU874UBFBN6ptQk/+Y+c8NWZD2kaqvn97NaoasECSF0uVk=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zbtgNgEfWf99Dfem7x7TpZ0stoX6luZOr7uCU9qMjLI/u5QxC4/Dk3WPpOu0HHXBNmfMm6KfWb/qZEibzX+rYw0dAn5IImXpeBkwPPdH046SWrjOqq5NWuBKIU9oElZMYl7Zy1v4zaBsgddNHRtFjbBkbq26hVhCZcQkVHhUNRIfIhAMXkC1NYpciDAcok8D7oxiREA/JyzfoRhigXgK5VkjK1MAYROCGS/yivala69S7adeQH635tA7c+sqqTXKrTcspXlnl134gh7avzbHRSpyiNZd/BpvEumHTawQJEbKnYUqM5Jn/DOzk0vCLAq1/KTe/FIUHgM26nUzJyv4WBq3ETj3mMSJZZjV77sWYwCfwZmv22ddwsjOSM6EMm8Y2mttHp7zTSM4wZG6pAiHaB1Ev7ocxEjkmIaE6ZevHDq6Dr/vD6j0yN1KaQbwBCES
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:59:22.5095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12200be5-17c5-4e70-c7a4-08dec14e67c8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR10MB9404
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: fix timing computation
 ignoring i2c-analog-filter
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,gnbcxd0016.gnb.st.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:guille.rodriguez@gmail.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@kernel.org,m:linux-i2c@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:guillerodriguez@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A27F635EE2

Hi,

thank you for you patch.

On Tue, May 26, 2026 at 11:12:09AM +0200, Guillermo Rodr=EDguez wrote:
> stm32f7_i2c_compute_timing() uses i2c_dev->analog_filter to pick
> the analog filter delay, but i2c_dev->analog_filter is parsed from
> the "i2c-analog-filter" DT property only after the compute_timing
> loop in stm32f7_i2c_setup_timing(), so in practice the timing
> calculations always ignore the analog filter. On an STM32MP1 board
> with clock-frequency =3D <400000> and i2c-analog-filter set, measured
> SCL frequency was ~382 kHz.
> =

> This also affects (widens) the computed SDADEL range. At high bus
> clock speeds, this can select an SDADEL value that violates tVD;DAT
> (data valid time).
> =

> Fix by parsing "i2c-analog-filter" before the compute_timing loop.
> =

> Fixes: 83c3408f7b9c ("i2c: stm32f7: support DT binding i2c-analog-filter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guillermo Rodr=EDguez <guille.rodriguez@gmail.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-st=
m32f7.c
> index 53d9df70ebe4..067af255bd22 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -694,6 +694,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2=
c_dev *i2c_dev,
>  	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
>  		i2c_dev->dnf_dt =3D STM32F7_I2C_DNF_DEFAULT;
>  =

> +	i2c_dev->analog_filter =3D of_property_read_bool(i2c_dev->dev->of_node,
> +						       "i2c-analog-filter");
> +
>  	do {
>  		ret =3D stm32f7_i2c_compute_timing(i2c_dev, setup,
>  						 &i2c_dev->timing);
> @@ -715,9 +718,6 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2=
c_dev *i2c_dev,
>  		return ret;
>  	}
>  =

> -	i2c_dev->analog_filter =3D of_property_read_bool(i2c_dev->dev->of_node,
> -						       "i2c-analog-filter");
> -
>  	dev_dbg(i2c_dev->dev, "I2C Speed(%i), Clk Source(%i)\n",
>  		setup->speed_freq, setup->clock_src);
>  	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
> -- =

> 2.25.1
> =


Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
