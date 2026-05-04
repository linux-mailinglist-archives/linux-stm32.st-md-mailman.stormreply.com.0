Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIBMMPKH+GkZwQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 13:50:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FCD4BC9E1
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 13:50:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7A42C055F4;
	Mon,  4 May 2026 11:50:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013062.outbound.protection.outlook.com
 [40.107.162.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEA53C2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 11:50:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIrhhXvKkrYMrkKto5TCceaZS1eepRBLPp+Op322zREXKl60BtB0unR9pT0Hsq6pm7T8haN3fruDS58a5l4DbK7BukiupxZIaGmAJr0bNy92zmcEb5J/+3Gz1/y4tYPXsfXZvIsREpWl/sGqNv0HHjvDOh74bwn4DlnJCYzhrlGCXGL0dm2VSXNPKRG0P4q0jf3sGpPhDXnoZcMg3fpufI8xhZ8qZKlfbIybfwWGWnH6svwD2TJzkfWvVgrBB1xwpzvBRNktWAIds07mS+FSy3DYJGQZ5bD8Mo6ATfPcyngoiFuNbQYa+WeDXw0O9xqMARCDxXY5YCRpvm+2unOevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcoNVnqpoRp4lUINw02TRaJLlaizuUuGQxPscEfzY9I=;
 b=j8TRYdrmYCgEkwxBw9/YbeNNSedZavopgukdSvxF+o2foX9KLRYemzcRHehlM6j128BzGWHhgXIqoc79C8fzcD0ODj+ar60Kr4BwjLPnRzFFJEdsZPLq6v4adsPJRVCcRy5IJBZK9kPBcL57G2QYlHkNuog7vWxNkGzIKZP5xZPZUkGEA1FH2op+893IJnYEyss1O9Jm1waL+YF9moYcWc2quSyHvRv89ULkDzZQA3MsxcOMpXFcCg2p3J+U/fDjIrycB5yKUV8gLMCPHbn15RgpalsVDfMeHValavbcD88Z3a6/tvP3tGR1gxNIoS73Gm8G7zXVULSgu4RH50pNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcoNVnqpoRp4lUINw02TRaJLlaizuUuGQxPscEfzY9I=;
 b=bZ/guL58MjRyRZst7TzOVvPn61mVOpBMCKqCDwiJA25ZGY651ZE/Vqtuvlryw57HbpRvCG5lF4y62ObFlgUfCkwgZp6tDMEOdhl9D8EAeaWT/yfAFrahEI0HQAOmjKugLf3//MTtkxE4dlo0XTens+rtIUKJCHDTVGfDCTZhGD6ZoRsJcDNkMrdXoI5JvmKaK0fMyvnXbHuBku2EH2zoTXIldVjcgUEpywwEsmQJPFup8Xd3r0GHGuivrNhfTgbDWf9n2CF3CYIuk3LsWYI1yxClWxaveKssVKlhHcJx+9+/b9LLY04Q9RW1qKwdyLjBBCp4ee+Olhm6jvJLUfnPNg==
Received: from CWLP123CA0172.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::7)
 by AMBPR10MB9925.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:75e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 11:50:03 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::f) by CWLP123CA0172.outlook.office365.com
 (2603:10a6:400:19b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 11:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 11:50:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 4 May
 2026 13:53:19 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 4 May
 2026 13:50:02 +0200
Date: Mon, 4 May 2026 13:49:53 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Message-ID: <afiH4cNyG_vb2Dwf@gnbcxd0016.gnb.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|AMBPR10MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd2bb67-7975-48bf-913f-08dea9d3478c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|30052699003|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: QrHujKkZgm0W5OvoBExyjsKiK8GOHgGT00Y4QX4wS3Bjr2Z5/Jks9U9GIWiFlTmWFbWlKz95yWWLoP8/f/EcW80jQU5AMFG++b8d0bPhBftSh67xCylqlB2wl6JA3TP1QQZf3iY8fJSjJM+8681DT67uchxyDiW+H//VsFcIPzmvja1P8vLnaMUgsQXXyn4GuKjR64821sK0qHZGEfiQzGgNzB3Jj/s0IyzrtIj42w3JenRwCTr6E2CRmjlqhL/hOFGCVnrrek8LSq1LvHydr96SwxyHCB5gDzu11nqYFyuH0NKfVut8GK1FiEhSMN8d7Wh7LxgQnr9TlrXP3ayyai6HUWU5XgRikDFmA9MZ2OPEeBIYliRpQ/D3cLXZall5uxX/DuLnt9ZssrS0KfnxiCdywZrjueAJC47LGgrs1a8oSONDv5BV0I+7v2X/Q10XTTsOH7vl+gDtCUKR49ugAghwWUhbAXFmAdsmkG2dwm27XShbo/P8Sx9AtgLBQcswi6piSDoX+GhjlvhX/sjZfWjQB6bzxI7RsZuv1NbobTme6mMxL/zzLFV4spmX+jb9qh/nfcyp64WDKO4+5Jpe9cUqkVSFq91W62n31E9vxUJxHLvEOyoOX03Iiu4xqBi5mzFK5wPLY4GISz/IVGCIpWU7VXHE7dIBCgxWRZ6xUfL0XQGfgY2V5Z2aMOwvnbCaDeNaw2sHLh66qVP+Es9NramS/bJIeXEnhouksRF7XZE=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(30052699003)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 48rVSUdkvRs86m+yTOVOj87quZpDAqdx0QdRVOwxqfvroXngvEgJQYGr7nVVH02Pp2wehIzJb/WIXGYORg9Kvgyn/g6p/0ccIWCecxdlRn+xZjjPfSxYRHhRUdn0PCsrm3zP3Hlfxo6snTzkLk9PS6oOF9GrY7Ej23s+YZlk/3b2zXbJ29GXwxtPL6tMrKrdEeCb2/q/1nWK56TMcUNyPpkyHy+POzLoHrnmUhmuqokr708tBdAo/Oj0zTMs4Okfz0lqoynPLgysRLp+kbSVTPgWWZdn0T2CCmCkrayLlxOlFv0dSte5Q3XSQDx341EXEBxn9IUc7K9CCY/T4nHaM1gBKiTOlVWa6nvPlEhj/13jsIAkoaddQ8cr6C71a8pMVOE7L0SplMDRhqHKftn2QtOHsoopIDD/nw80n9Yd7aOKbUrOTvoywm1jw1F6jx6V
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 11:50:03.5869 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd2bb67-7975-48bf-913f-08dea9d3478c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9925
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@iki.fi>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/13] media: stm32: dcmipp: add support
 for MP2x pixel pipes
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
X-Rspamd-Queue-Id: 51FCD4BC9E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@iki.fi,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.866];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Hello,

Gentle ping. Would it be possible to have this serie reviewed ?

Regards,
Alain

On Mon, Feb 02, 2026 at 02:57:25PM +0100, Alain Volmat wrote:
> This series add support for the main & aux pixel pipes
> available on the MP2x. In addition to the byte pipe
> already available, the DCMIPP is able to process two
> other streams in parallel, including ISP operations
> such as demosaicing, exposure etc, post-processing operations
> such as cropping, downscaling and various pixel formats
> output.
> 
> This series introduces the whole DCMIPP pipelines including
> static configuration of the ISP part (such as demosaicing).
> Dynamic control of the ISP as well as statistic extraction
> part will be added on top of this serie via usage of 2 other
> video devices (input & output) for statistics extraction and
> dynamic ISP parameter injection.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (13):
>       media: stm32: dcmipp: share struct dcmipp_device among subdevs
>       media: stm32: dcmipp: make dcmipp_state & cmsr2 read common
>       media: stm32: dcmipp: bytecap: protect CMIER register access
>       media: stm32: dcmipp: move common structures in dcmipp-common.h
>       media: stm32: dcmipp: correct swap in YUYV data with parallel input
>       media: stm32: dcmipp: configure csi input of all pipes on stm32mp25
>       media: stm32: dcmipp: introduce a dcmipp global media_pipeline
>       media: stm32: dcmipp: add pixel pipes helper functions
>       media: stm32: dcmipp: addition of a dcmipp-isp subdev
>       media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev
>       media: stm32: dcmipp: add pixel-pipe support in bytecap
>       media: stm32: dcmipp: rename bytecap into capture
>       media: stm32: dcmipp: instantiate & link stm32mp25 subdevs
> 
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   3 +-
>  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  27 +-
>  .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 593 +++++++++----
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  98 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 124 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 113 ++-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 482 +++++++++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 ++++
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 937 +++++++++++++++++++++
>  10 files changed, 2322 insertions(+), 276 deletions(-)
> ---
> base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
> change-id: 20251219-stm32-dcmipp-pixel-pipes-support-b42924c0b4e5
> 
> Best regards,
> -- 
> Alain Volmat <alain.volmat@foss.st.com>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
