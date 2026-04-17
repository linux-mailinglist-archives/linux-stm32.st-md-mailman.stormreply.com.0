Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK98Ed8O4mkg1AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 12:43:43 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F12DA41A564
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 12:43:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7082C8F293;
	Fri, 17 Apr 2026 10:43:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45941C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2026 10:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLLBJXov32MCrnHSCjQKCwltcBr2dkHeDWSXGF4H3M7htoQIFJyc0PW3ZZaqsdS3+3ne0dmiOPOYt1m5nONtR7Yp/+rxL1S8fPO5FMuPmvNu8rIWjefEqWA7KAx6dGXL9yYrrcBaRf/P3XO24lOK6PRI1IIn64QsjCNjWNOfJ/GzvedWNY9H/A8Yi32mW2rTfY6JSUxo8zjZvJzGUf1c1Y4UluzZ5PS/i1OGVVid/9AKuFRvQ+dch7GxhXbVXjfimWa6ZPuxGlrS1UEGYYi1QkwBm/pSScJ2PjM6/yRfTF/mNB84coN4b9gYxyJTgo434iIrYO4wyNRQTA14WjGaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O07yf8tIga9QXXoZxlNSkh1BqEl9QlRdrtl5qWMDG74=;
 b=MegONJCizm+FogWrfhBsi3d5O5o4JhG7wtcCcHQijnGb1Xqw3RBBEW//VYxd0xEfzoJbxYy2VThvbYUdCrnimjh4Ps9j3iMHjF30hNbm3w7TJa3ghdKoDRwATv7S5igFG3Vhthg6+lw31SgzR0IGLmjDlbYAWXd8CskpnMncO5RXHLANw9FKa0EiMXiJnAQt5AmLMSmvhM/GgZkZNILpTFRZWNuUAt8Eu9wtkIyK0cvkFmqvfYATscK8oYRBX/wNAkQwKNKbhiMEiPpD1l9vnpZgrYoxb3wsXLYgiso8SWG5++1TycQ2bJG8kDCaP/yRn13cWIdoEexZECcoQGQt5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O07yf8tIga9QXXoZxlNSkh1BqEl9QlRdrtl5qWMDG74=;
 b=IJYSN4lbTg0z1Zr8FCFyPL6WLylzSZU6arneFz7cevEX3Q5bPiz/24WoIGOcenU2QYzSL2tMPrBrXaFXfCqixf6naQfY9HRvvYC924plh6lhlUSFMO2RNV5Qx6oVE3v5NIq5vrfXgGJL5wjMtEf8ADPpeWQzrI5kkL3honE07WZ4Cfwj4ZcduPFUBWSj53P0N/MkSFW7udpy181+tkEfgQenfidph+FMDXUXeb+npPu7stF+zPtXZIU5q5E2wZyVoT3eUh+e738P2veiYcwIQqqaXvHgD0N27s4ulzIbY6fnTpM8iFYZ1TPBY/2tWsV/AYnhJOjzyvtVtSRuAmZC/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 10:43:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 10:43:34 +0000
Date: Fri, 17 Apr 2026 06:43:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <aeIOzjNv33z72-i2@lizhi-Precision-Tower-5810>
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Content-Disposition: inline
In-Reply-To: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
X-ClientProxiedBy: SN6PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:805:de::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: d231b5b4-f3fc-43e4-43b0-08de9c6e2c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: A3DwihLuGfJTMUcSaSgD6cL22pGGjBzwB7CXsw8+1tlw1YFvmXdBFRCHfZaGCK6c7RpPDD/M1yPjmML6PWnDbd1kz9DRWrSrrMnF2GfSopHX06nnBvhF0ByT+sgsQFv7DMKvrtkZGZKMhzOBWYrR7BqcPScb2qy8K7DdTZDw4QTTkrwnuqIv9dcgmEKHPqbwUnDGOnNAwBIIQUx6QKexkJJ8bV2ts/hgzYAnWn8aLmf/Oz30oAZVwksQmFrCBy5W0naZG8ND7YgPxXNdzetQiBH3uFSZo+PyYA/Zx9kYJ0C+DjxvMbrkfKDrrldzIkHxW4Wz47z6D/geYu0O5s/JkkP19RH5xGM08RnkeqRxaNfiJuR3MT/BRNGfEctoWr7jnVPxafkKrXuWvIELKk7iln3X2gX0NTYylSYOi05coAtHJKIoKpes/+IGxOzO95R3rtS9G7Fniwxuio8/IQ5NnQGdE0YQapT2NWAx0gu4BM77I6zSXhqD319UiESHSDeeRh0USxslfxCD6Y75o3BUS26z7prvnj1Uj7QPHq8eqlSZyg7wVL3jDv5pbBcDzlO+VYPTwF1RsO+wvLjX99l2S0ZSkusSxeNciC36S84sQJPgam3QEHWiBy0ypvuJSw5YTqGLqCrfNUAqb0IDZOzxkqRkKOeYTzkL60n5m4VQIulsbm+wz6XLmqlchRFHaNKTqJRB/zlCmFNYV3ze+dSnYUSgsptkids+8e2HRiqO9lP8cK1IN/lCfbxeH96VSRm27CzBQk7uFTiSSymjEooeSvKSVBz6R8yGP+ab3XkKjDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB9366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EihhU/Vp+YexsdPvTZkVG7h00rnBdPTagXrR0WNqHXer4dl1HHqzp/ZOhqje?=
 =?us-ascii?Q?kZn1un0cCINkzBhZt7BjjH7H8PrlfKsvqcKjYXSp6Bk6dPeSy23LNBARSpCJ?=
 =?us-ascii?Q?5rtNp5Y9uvhI5Yn5RtzOJUBrffN4Xgu8Isd8clhDM5Wdvot5dyqoHNKwQOuz?=
 =?us-ascii?Q?ec0/XnacdvZVIILWmVWJjzEZPdkZ7KlI4aEG5PHcnnhxg7cH+RGRg4un/tKk?=
 =?us-ascii?Q?lM6uIurOuuPinGgi3eXwyb5paWXevXUCC4HguZnVYijnO2yD+G2/XVJbM/Lw?=
 =?us-ascii?Q?AS2LyvS0TuyZAA7Y0zhkKxIsk6a+qy/rl6hlunPpZ3FJxBogCXy+FHvNoT8s?=
 =?us-ascii?Q?Tmh2KD4D49gkkIKz6F9Q6l9s4awQE9N21VxeB6fSH4UaxC0Bvle+evEvvsgm?=
 =?us-ascii?Q?6tSEaZsH3HCed3XcGZusbKhEy515vszEANRJw8J05OOGtXzTWCqC1b3Xmxcn?=
 =?us-ascii?Q?MyALH1geHvMljJR95FfUccH3W+axB5YCLl6HuDqIweTGKk457gVdkm1ZVX68?=
 =?us-ascii?Q?jUVwjwV5i+0dJOHgl2ZetAA7uS40sn/G5pc1iz5x7aSnkO2HW6plLjbMtTc+?=
 =?us-ascii?Q?TC1Z3tIbNxnspuYyuYoCMcJtKznpaJxcVxhz5wfpwlKI5CHqqzrqE3kZpSWt?=
 =?us-ascii?Q?+fy8+ICV/qNKYeCZsz9oSiBUrqGihAgM1qxJHQjuwVOa/r6hggvCULLL052V?=
 =?us-ascii?Q?N7F4wqTwACykim+S0LYONK628Xl+cbkfqfC562YuqepLEs6vfl/9cc0XwmwP?=
 =?us-ascii?Q?UfS1+f+eufXEIy2dW7FlLQEa+/lTQO1H39TussRFN0LyTI8i8EwHEyFgFwsX?=
 =?us-ascii?Q?YK3GQfg7Hndjv1tQNvuOebAQkg3DCKXxfZL55THq0gNDz/8oevVsrY6EQwhY?=
 =?us-ascii?Q?CmeZ+iF3BVWrKwNrDHl8uvHToWz2G8+2uTq74Lo/2V6rJYZIVBiZEu1Q8hMM?=
 =?us-ascii?Q?2rEUHnN0TsFcdPeFckjeaZTePd1RCKRw/dGyowKI0mcSdRiVPqt0Vcx9jUa1?=
 =?us-ascii?Q?kh1FKnKFL1PQvEZVoM+REsLRMxGh1wdmbpUqAn1AAtG/dZnQu5FtPjpqiAd7?=
 =?us-ascii?Q?2FCoft+Lj0syEM5dEuFRe2D3EgpHq12q2HsT1UJ+Tuk0P8LiWvC2HFBxpCEE?=
 =?us-ascii?Q?NWybFhAuz0wlXtnfOeZWx5tigSLSkswB+ekFjtmICPgwCb6RnSgDqsAbPgbN?=
 =?us-ascii?Q?kdcZlwuNNaMwUR5yls8B5hIR8AjRpEp9KHZHQmqd9d7Ru8sCLhJx8298wVW5?=
 =?us-ascii?Q?IjKkA/MCZvOkP1Khdn2dnSFHQQRFcVNWNHzCG9igKgqH7wuGdrHvyKqtYjZc?=
 =?us-ascii?Q?YXhOdIcf6GP5oAE46+HhVgfItGJFxAm4vekay4cv4KshCbKoSAL+w/wifmsL?=
 =?us-ascii?Q?wR/BbRpFG8t9lGizqkyJ8UWqJ6LUOuYRB4i7dzmkpfQ4aRT9RMFFrj+iQh0T?=
 =?us-ascii?Q?vohmEVH9fxHJTOAo/H9IRx5KMIt/hGyXvPjIHl0ONDKCxgKoW/rETt7g2X90?=
 =?us-ascii?Q?ii5uxcz8Wj7OJeSHODEP/YJqU+vbzM7ujDjzS6WRVbYnKbsko8Ql31IJadgk?=
 =?us-ascii?Q?ctLY2zlGonndP+p337nCmDrRyIzsD5LwZPbpmqIXX2/PpmW5Eyw+4y3FkVeh?=
 =?us-ascii?Q?9voQ2E7+e7EV8jst6NweFuOQMxm/XRkrNhb+m5Eqvux4K0x4uLBvDjzS8SSn?=
 =?us-ascii?Q?103wFJV2NPebfSfLXutdrCTBQEfdf/EZ4ZOEbYNlh8LKFLdiSbViFfTUIgBY?=
 =?us-ascii?Q?wzJpMXDaBA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d231b5b4-f3fc-43e4-43b0-08de9c6e2c63
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 10:43:33.9774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHruuLd/njBLmzTja/qNnyYxSOSIHfqhaYXMBmkxXGeCiqLeA64iQ1oFZ568X5G1byWR4/KBnWE4SxFFzOC+HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261
Cc: mcoquelin.stm32@gmail.com, imx@lists.linux.dev,
 nicolas.dufresne@collabora.com, kernel@collabora.com, p.zabel@pengutronix.de,
 wens@kernel.org, samuel@sholland.org, linux-sunxi@lists.linux.dev,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@pengutronix.de, mchehab@kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
Subject: Re: [Linux-stm32] [PATCH v3 0/2] media: verisilicon: Simplification
	and clean up
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
	NEURAL_HAM(-0.00)[-0.637];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: F12DA41A564
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:04:18PM +0200, Benjamin Gaignard wrote:
> Simplify motion vectors and reference allocation with common helpers.
> Since it requires to move some of codecs specific functions and
> structure in codecs header files add a patch to finish the clean up.
>

Already V3:
	where the change log?

Frank

> Benjamin Gaignard (2):
>   media: verisilicon: Simplify motion vectors and rfc buffers allocation
>   media: verisilicon: Clean up messy include
>
>  drivers/media/platform/verisilicon/hantro.h   |  31 +-
>  .../media/platform/verisilicon/hantro_av1.c   |   7 -
>  .../media/platform/verisilicon/hantro_av1.h   | 100 +++-
>  .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
>  .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
>  .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
>  .../media/platform/verisilicon/hantro_g2.c    |  36 --
>  .../platform/verisilicon/hantro_g2_hevc_dec.c |  26 +-
>  .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
>  .../media/platform/verisilicon/hantro_h264.c  |   2 +-
>  .../media/platform/verisilicon/hantro_h264.h  |  98 ++++
>  .../media/platform/verisilicon/hantro_hevc.c  |  37 +-
>  .../media/platform/verisilicon/hantro_hevc.h  |  82 ++++
>  .../media/platform/verisilicon/hantro_hw.h    | 446 +-----------------
>  .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
>  .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
>  .../platform/verisilicon/hantro_postproc.c    |  29 +-
>  .../media/platform/verisilicon/hantro_v4l2.c  | 262 +++++++++-
>  .../media/platform/verisilicon/hantro_vp8.c   |   1 +
>  .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
>  .../media/platform/verisilicon/hantro_vp9.h   | 104 ++++
>  .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
>  .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
>  .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
>  .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
>  .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
>  .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
>  .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
>  29 files changed, 796 insertions(+), 572 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
>  create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h
>
> --
> 2.43.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
