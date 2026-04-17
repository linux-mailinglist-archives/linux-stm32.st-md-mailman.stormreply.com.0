Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJdMFWwR4mkg1AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 12:54:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB641A763
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 12:54:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59CC3C8F293;
	Fri, 17 Apr 2026 10:54:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C20DC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2026 10:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYjhPKaJ3OQfcXSOyYu5LfHuPfWSCxJZN/Y60pFSbHfy/VvV6jGXQ6fSNSRpAJBU+1alFLJSN7AokyWJjsagLdEcyuAzQ7qYlv/qNP2jOPjx6ymqhx92z5HSBLPpSdcjP1HIcfyJVHLRoKVEFOPSVckQkUB/KTP5l8Aa1x8Z/D8Ikny7ui6Xg4yMawHnAH0NixcJZ9+afa+md2h7uKXanoEum1o1MS9yfe+zQ1nXngW9VaRFrM5/FQ//fS0nP48A8cPqnxnirDs3FlWiM/GeR4gcRNSDvF0R+uOHYz+gnZBuTbLr6o9K8/+GrCs/x3Sr1dck8QSxJsK07qHHHn+XMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woQfhFEn5FSa0ppfe9qWJsXaXn0pHCOU3cNM2c2E3iE=;
 b=BUKA1V3ut9M6MU3R+YwkedaFryVuc20t9B9Geu8q2Ua86p67RC3vVwYYma/nW7LGipGeJH5I1WFaVg3wkXmQaOk1DS4Ac7tiSHs1wcs6TcxpiabM391/G9zc3I7/g62d9dbOJwmGsPgnEsBFSKtKcILt6eLF2NHKyWbRP4Aop+5Lsp0fMZXw6XaXl3CI2uk15t0/uCshLAOxTwBuJEUsbkvjnQ59zX9k0uTROUHcIOYcER0OQ5WK89e+WFAOZaK6jVEjAA9MG0Y4SgTT/FoBy/EivMFckFNlS7KyB34riut9QKTgiAQjNq0x7YSERdrTbAKjTUPi4M0fqsrLa0wLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woQfhFEn5FSa0ppfe9qWJsXaXn0pHCOU3cNM2c2E3iE=;
 b=mOmOUxYX0cS5En1cGLriucj/fs99HUGfawwuUG3BCMtC627zA+/V6BjH3neeqZXXdYkF9OUpXk+MHYDMOXImI18zSu+MgnCq5wTpWOTbofAxoHr+dR7mr2F0f+xnTwrZPaGNAwsRR2zUJ6wiy/dgFPzPL/dwgtrO8L/qWGKAt4vtoyrxvG3nwFr8WTEaMtq4IeWbprcHdL2ulEHkNbpiqiWTIIlsXEWUvZW2MzHsrKU2U0q48sM8YPVmFXPGLEsns8tpmqXJWLgtfcl/7OmOrY01pqiOeJiC2JDH7Ys3rmJEPa6R+SlL9uTMrqkSomBVpCqp1WqeRKcttmNYo7S1HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA6PR04MB11871.eurprd04.prod.outlook.com (2603:10a6:102:518::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 10:54:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 10:54:27 +0000
Date: Fri, 17 Apr 2026 06:54:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
 <20260415140420.282084-2-benjamin.gaignard@collabora.com>
Content-Disposition: inline
In-Reply-To: <20260415140420.282084-2-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA6PR04MB11871:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce48139-5e1b-48b8-9626-08de9c6fb1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|52116014|1800799024|22082099003|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: zrbV9YjNvoQfgZI89YypY3LJl2K+YwuhcmqEPx58swgqJk+BXMEQO1d33756gMrcBxjFTK5yanWI3qAyl2lq6dcmDQl08hJz1iHZqZ7PAA0N+eXnoXpJt0kkJ5eXDS03eFGqgICi8CXTPvoW7C8fQidvPEHD3Wh4IsiTiFovz5PI5163o6FmOMlTc06TTpkPkpveHA/PPo2vYCnCWpoStCLU/8aa57/qaYrG1tY4alaQinx6D/I5rOYYDOr2QhiVazNJ1V/Plmd39d86Av7LQbAufpdX5HqlPptWMSFlAHOdJtQD501AvJk4iFJoAh41qpUDtSx0kvIMXWCnZYjOIWrDnD+MRzG49On/h69YLJEGdfaYiK/m7KanRigavtjOZWeuSw5ZpgcJ3MfjfgQBdE9PDBiDMWTx/kO+HDqWFZ4a4qN9nfSCtwoT/esAwV/7gGzO53Hibek8c678H1gwpUhud0KjlTSpnyX+eTMjDDESNCj2h087INrd23RY8mSMUh4e17lv9VgsSUyBZqZA31KYYvC7e05G52rZm1B2zrMW1Bd0QatIdZGuOmmivJtkTftPUWIaC8nno9Pm3AeKt+weVsUUl3qxfzH8jq7kFy85XuVd7NaEJR+7MK4boCD04filkHx0A0zTu+R8zT0FTQB4KEvh5KLn2x5KNCQ+E67tTzozFWGoBZZj+8stuTgzHKG9h5D7pqz0s/EwQBC+USA5nYIcW7W33AFURA17ucvVfHNl7l2TV3IFY+LgecjCtCijJY67OC+Q3DrfOMOjH8q6j7Iq/A6cgM1WFqeFOnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(52116014)(1800799024)(22082099003)(18002099003)(38350700014)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xFCPMzoAPf/CaT4cgZIpDOf8UZ7mGpl33g0BddHCTUPKuMtVyyaUCyOCLrsF?=
 =?us-ascii?Q?gaZ2YcRSlIl14cakx2QVX11f/w20u9ChUcvLGCQGPiTSRPaBenJt7xZnZc2k?=
 =?us-ascii?Q?lrzuxW/GXaj1ryLKG53uufjrhXSOCzwFETv/vHhPsI4V5cpv8uBW1yzqoziT?=
 =?us-ascii?Q?XFGWK/x1U8WhgO+5QQ7QQ2QM3g+iaBRkoPXXGrzN9JVT1FFJF+rzBERyDbdd?=
 =?us-ascii?Q?GJQgHTLKUWJvMq8dPbrmJkjijgo9CfcXra4K4BNeXWZiUDmD9X/CwHoiwDhR?=
 =?us-ascii?Q?8sZjuz7iA30efmWM9Ki64Uz46b4wfzpiau975yN3CHe/+AW7l2t7Y3Ae4U94?=
 =?us-ascii?Q?XUJmf40olqyCxXF6mc/pBXYHy/llQuTPj47P58HwQP6FIILBezH4TI6DiNUn?=
 =?us-ascii?Q?P7SfGGiFx1trddJO2nq2QC820JTgslC/J6iH2ps4eLEDLSb/aqB6Ls6DTdnY?=
 =?us-ascii?Q?FcBxgKT3PDJKNoDxcmeAaDb+kfXTPJNIOrZoXFQEichd+ot0w+48yBSn+AoG?=
 =?us-ascii?Q?djjcGaIgICN3I8kLom97KfS5VHHqflOpSMRRNhFft7RTG+zrIUAD3gd45pBT?=
 =?us-ascii?Q?5bHjqkNQhIfEYce1UMY13UAI8UDQJnMaJdPQ7dO/ny68XivReAgdr6QwUJ00?=
 =?us-ascii?Q?3+IO5Gymi61cqKDxb5x6aqVvE1lrLiz5JoO5na7fGzL75TyqCiguF9VfchTJ?=
 =?us-ascii?Q?m2kGiHlLD32FcFM3PXCnfg4qZC8VPmQpW/2i64l34b5dZiNl/RqZly6+8WqP?=
 =?us-ascii?Q?6FUsgGfhcfCpe9x2HVBXDcbI6ZqjXZK+N31JtckcvhFNlToy4QORMmsONRWk?=
 =?us-ascii?Q?rrAsE1vhCk1pcIGKibfFQrtiZFexeJ1dxo7RQJtLZfCmd3I4xakQ7r/uAryg?=
 =?us-ascii?Q?PKBvfUAxbj4HImG9TYd1BmuOwfIvRM7htX9DG8hvcVLgWK3XUQrQWJcbjYRd?=
 =?us-ascii?Q?gJviENnBy8V0a0uwAEinPWi87q9elmHjU/vdqfUlC9N1Z1IU6neu9d+3ACQZ?=
 =?us-ascii?Q?nOucBhs2tfwQWIjkBOaNdOpuUig4vrdEVVHZifov5WRveOUl9QTVWXqIejO+?=
 =?us-ascii?Q?AWxKCRMNsEvLqRoLAG2faFsUSIumkrIh6yNLEGFwXGbAPmi2GrBdpWK+QWo5?=
 =?us-ascii?Q?ME4g1IpMqzQaHEveAgk0wSCaoX74ih8CUAuL5QrULS5qLtabyJ9Hk+o5wERT?=
 =?us-ascii?Q?LXzhNQ+Se0433uKSGpr7pKQN9K77UBU++/3w0k5TlYlc9MXghFztXF4KwW18?=
 =?us-ascii?Q?3BkbbwpKFsWSH2hF7pIOZy0wxvwjXM7GZ3d29uIlpORUaUPUlBHneGZhBpQz?=
 =?us-ascii?Q?m4fuQGYMnNuiNN+TUVfQxJ+JG6eVZ7htsBs4sYOaUVLFOoOKmQPhhvdx8JCZ?=
 =?us-ascii?Q?Z5wYwBgDqmtXzYWU2BDIHr6nEUjkTgvMi5hJ5SvOTZMDtZttSBSqlhZSg/MR?=
 =?us-ascii?Q?ujxXo5mcqCL22WVKwm68FkTeZWLzkEt68lSU9au5CWVPit2maLCkFnNi39cX?=
 =?us-ascii?Q?FQvVMcCEX/uzT6Z5qtif3CX4BC06nQ75Ig3fnfiOH07cy7u7bHEbcW1pC6vD?=
 =?us-ascii?Q?CR8n7+yW5S2Q4//C8PW03ngvMS2UjUn2AZfPuqJa/9cl1jgN6p4NCyjy6HzI?=
 =?us-ascii?Q?osmGSk/rmY2ASJmUHjyiVk3Hy1fxJZ8DVjT5AXDrmT+9PVR8kuBvF/nEo3+3?=
 =?us-ascii?Q?lOvHYFf0w8F9S5uUE3fqHNqSemGASEn/y+VcEQ9x0mGB2wSJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce48139-5e1b-48b8-9626-08de9c6fb1b9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 10:54:27.1958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0NXFuSXBA9Q6Ru7tHndJjIBlQhiQ9Qf9d8FJ2M/9MhsBvehY9aJOfeMSpBswe7CWpnV+3G87nNubufaNB6RtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11871
Cc: mcoquelin.stm32@gmail.com, imx@lists.linux.dev,
 nicolas.dufresne@collabora.com, kernel@collabora.com, p.zabel@pengutronix.de,
 wens@kernel.org, samuel@sholland.org, linux-sunxi@lists.linux.dev,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@pengutronix.de, mchehab@kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
Subject: Re: [Linux-stm32] [PATCH v3 1/2] media: verisilicon: Simplify
 motion vectors and rfc buffers allocation
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
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[nxp.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:benjamin.gaignard@collabora.com,m:mcoquelin.stm32@gmail.com,m:imx@lists.linux.dev,m:nicolas.dufresne@collabora.com,m:kernel@collabora.com,m:p.zabel@pengutronix.de,m:wens@kernel.org,m:samuel@sholland.org,m:linux-sunxi@lists.linux.dev,m:s.hauer@pengutronix.de,m:jernej.skrabec@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-media@vger.kernel.org,m:kernel@pengutronix.de,m:mchehab@kernel.org,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:heiko@sntech.de,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,collabora.com,pengutronix.de,kernel.org,sholland.org,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,sntech.de];
	DKIM_TRACE(0.00)[nxp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.725];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1CDB641A763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:04:19PM +0200, Benjamin Gaignard wrote:
> Until now we reserve the space needed for motion vectors and reference
> frame compression at the end of the frame buffer.
> Disentanglement mv and rfc from frame buffers by allocating
> distinct buffers for each purpose.
> That simplify the code by removing lot of offset computation.

Can you try split to more small and straight forward patches, for example

for example create patch just move hantro_h264_mv_size() to header file,

...
> +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
> @@ -44,30 +44,49 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
>  	int i;
>
>  	/* Find the reference buffer in already known ones */
> -	for (i = 0;  i < NUM_REF_PICTURES; i++) {
> +	for (i = 0; i < NUM_REF_PICTURES; i++) {
>  		if (hevc_dec->ref_bufs_poc[i] == poc) {
>  			hevc_dec->ref_bufs_used |= 1 << i;
>  			return hevc_dec->ref_bufs[i].dma;
>  		}
>  	}
> -
>  	return 0;

Move this code style change to new patches.

Frank
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
