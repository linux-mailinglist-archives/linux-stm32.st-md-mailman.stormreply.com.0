Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CA1EEF4A
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jun 2020 04:06:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F17CC36B22;
	Fri,  5 Jun 2020 02:06:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61B4EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2020 02:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYtXYjiebBer9c4KtMt7mFAMle8hXEW4uouSy1hdcfkfmBrOLdwNQd/W8JvWmcQ3clAp8SzBoVYlPFmio3qdSEZ5Km8PVBGYBXuGzZeyRVUEQ/CKaaSuetlXclBFQ52OZrHZbHRM8bsW6QtXXel3iwKtgN5p8s3IlDvZ+F6jBsr7nUSoM0nT/qZEGmDrH/vsw35BkmRjFo04FVliL73IHcHgwLkQrYx25Za8t8mxCE4pCgL8Yd6Pv6zKD59JS7mETwn6H3sugEMAzJ0VWcWsK3OyITSliVBHbk/w4glPsljEWPH6vNe8qwXw3+Puz97pBc2gBKIdpMe+E08iJUbr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfJ7EJ4gbq7IK4kVbrnIC5vn6Jr813fCp0IZxx46sLQ=;
 b=QNuzdEWbJBzHgNIAtgrCMTu/wS7LdSR48zBvbLj269Lmap0ONdQ2aU0aH0aH8tPhGQU5TgmLtnRC92HUZ0nCBxbILeI/YfnMJhRJumlECSdC2NFxbgmJpVd69Y+FtMowVxCo3BvKuEp+NSA6Ga3iZDRvdXQLOavwLwwyVfUYF06IKWd343JmTqurp9nC+crdiOkRI27UB1A4em8W/Y6tGPQtc2d5iXCy7u4/9CYgtTPGYM+ead1ZDAE+KOnCniXymAzlQRRmp7OAOwrAewZYxbCTIypiT+rs4tG2oLVMKs8YsmOEaTUeoYl0Fh6HUx0lbU9DmWgbOaY+8ql19YvvCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfJ7EJ4gbq7IK4kVbrnIC5vn6Jr813fCp0IZxx46sLQ=;
 b=IUs+gNRpaQQzHkhD8u+QJkmOKQ0n2aIku3g2CydVdHbgqfMsuovdA9sgvODQvJS44fPSDgD9etaXvi50x4gF/a0h6BqVqjlI03d0nR7CLlc+21/KfWVir0SMH9uINsHfI4JX2p/gTzZsc+WUsVk4mkUafrZFgWIGTTpHw5HYD/0=
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18) by AM6PR0402MB3928.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Fri, 5 Jun
 2020 02:06:14 +0000
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1]) by AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1%7]) with mapi id 15.20.3045.024; Fri, 5 Jun 2020
 02:06:14 +0000
From: Andy Duan <fugang.duan@nxp.com>
To: "davem@davemloft.net" <davem@davemloft.net>, "peppe.cavallaro@st.com"
 <peppe.cavallaro@st.com>, "alexandre.torgue@st.com"
 <alexandre.torgue@st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>
Thread-Topic: [PATCH net, stable 1/1] net: ethernet: stmmac: free tx skb buffer
 in stmmac_resume()
Thread-Index: AQHWOLSWclUv/VcTx0GEq1TzaGMl+6jJSjfg
Date: Fri, 5 Jun 2020 02:06:14 +0000
Message-ID: <AM6PR0402MB360722C28396BD995A4AD2FDFF860@AM6PR0402MB3607.eurprd04.prod.outlook.com>
References: <20200602075826.20673-1-fugang.duan@nxp.com>
In-Reply-To: <20200602075826.20673-1-fugang.duan@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: davemloft.net; dkim=none (message not signed)
 header.d=none;davemloft.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bcf0fed5-107f-43d8-e458-08d808f506ce
x-ms-traffictypediagnostic: AM6PR0402MB3928:
x-microsoft-antispam-prvs: <AM6PR0402MB392837F4E40CBF83F5DF4221FF860@AM6PR0402MB3928.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0425A67DEF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DTzUYxfncV7PTK3f6UfW+An/XkdaZQsdHicY8chknsbpN0phLrRqvCkTCxtPTn3DJsjdB/jILgnRH6YDImiC6DG6vvFzNx5/xZnjnA/nROEANUfRZ6qJdbVtN+VAipZa0RqTAE3BVCfhqRnTeyGvuFRLcQXL/OFArV+5U7lMMu5bUYPQm391SwXIIrRpjERqPiZIThOGsN5v+lruzDlcg/WC6duRLQbIw9XhmenqSBcEvokmflEd3Unn2ScaW1uZQl62c8HSE65zbytthHUCLNXvV9CausTULyRsZBBMwczACrr0vwFSZNiczHowNWsGqNm46+IoLcrDBO9qOMTPxQDz+aqDPgLMXsJa3J6lqsUz26Hu0EuxZPIjPtQWChA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3607.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(9686003)(26005)(55016002)(54906003)(4326008)(316002)(71200400001)(8936002)(2906002)(8676002)(45080400002)(110136005)(52536014)(5660300002)(6506007)(33656002)(186003)(478600001)(76116006)(66446008)(66476007)(83380400001)(66556008)(7696005)(86362001)(64756008)(66946007)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: JjJSfx9DZ9ovuHOVPrOlJFuLYNuVHiv6YMaEaWzv/GOBQGlwfQSPQSF2kTsS2w7eDJNLyxrGq11AlzQZ2x2U+xmdqrJNaaav9EGKlE97iuND3ZBmsFPnM9JIDSxuXrA5ACk8ObfTCqayDz8ztb0TYQNVBTz1xkdu9rvUO05+H0gTXbXhufEqrSTrEyUHfyUZ0c6oOqe4m/JhPYbhrFKRJquGfLFLuOWnpHaw9xL91QEkgOUJvBTTtPLKKZbDPtl873fZf0YlAg1pw2jyJhFH+ZdYMFKM6BwJDtGp4pMS9NuLFwy/NClv6ReGduuO2ogXBj61vjTFyfc7Qa6oskMuCuNLnfs7NLaJMeUcyDZFjKJpxtp7pYnAXKmVD/m557flLb34wwoAWih1fXFjp79Li7F/To0v9CXh3K1BKbKfxleCFrEi5mXNWH7sqIrOG0hfOOsLHgqSZ94cBERT1KmRPwfssh7Iq3xM43aggQ6f4uo=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf0fed5-107f-43d8-e458-08d808f506ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2020 02:06:14.5505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S9Tp0oFy/HtzgLS6pylqhlcxvTw/fLfY36zuP8RMSut7Dzbxik8A+eK3zRFzG9mQ7GMXb7gerth0ivmajN0J9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3928
Cc: "kuba@kernel.org" <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH net,
 stable 1/1] net: ethernet: stmmac: free tx skb buffer in
 stmmac_resume()
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

Ping...

From: Andy Duan <fugang.duan@nxp.com> Sent: Tuesday, June 2, 2020 3:58 PM
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> When do suspend/resume test, there have WARN_ON() log dump from
> stmmac_xmit() funciton, the code logic:
> 	entry = tx_q->cur_tx;
> 	first_entry = entry;
> 	WARN_ON(tx_q->tx_skbuff[first_entry]);
> 
> In normal case, tx_q->tx_skbuff[txq->cur_tx] should be NULL because the skb
> should be processed and freed in stmmac_tx_clean().
> 
> But stmmac_resume() reset queue parameters like below, skb buffers may not
> be freed.
> 	tx_q->cur_tx = 0;
> 	tx_q->dirty_tx = 0;
> 
> So free tx skb buffer in stmmac_resume() to avoid warning and memory leak.
> 
> log:
> [   46.139824] ------------[ cut here ]------------
> [   46.144453] WARNING: CPU: 0 PID: 0 at
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3235
> stmmac_xmit+0x7a0/0x9d0
> [   46.154969] Modules linked in: crct10dif_ce vvcam(O) flexcan can_dev
> [   46.161328] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
> 5.4.24-2.1.0+g2ad925d15481 #1
> [   46.170369] Hardware name: NXP i.MX8MPlus EVK board (DT)
> [   46.175677] pstate: 80000005 (Nzcv daif -PAN -UAO)
> [   46.180465] pc : stmmac_xmit+0x7a0/0x9d0
> [   46.184387] lr : dev_hard_start_xmit+0x94/0x158
> [   46.188913] sp : ffff800010003cc0
> [   46.192224] x29: ffff800010003cc0 x28: ffff000177e2a100
> [   46.197533] x27: ffff000176ef0840 x26: ffff000176ef0090
> [   46.202842] x25: 0000000000000000 x24: 0000000000000000
> [   46.208151] x23: 0000000000000003 x22: ffff8000119ddd30
> [   46.213460] x21: ffff00017636f000 x20: ffff000176ef0cc0
> [   46.218769] x19: 0000000000000003 x18: 0000000000000000
> [   46.224078] x17: 0000000000000000 x16: 0000000000000000
> [   46.229386] x15: 0000000000000079 x14: 0000000000000000
> [   46.234695] x13: 0000000000000003 x12: 0000000000000003
> [   46.240003] x11: 0000000000000010 x10: 0000000000000010
> [   46.245312] x9 : ffff00017002b140 x8 : 0000000000000000
> [   46.250621] x7 : ffff00017636f000 x6 : 0000000000000010
> [   46.255930] x5 : 0000000000000001 x4 : ffff000176ef0000
> [   46.261238] x3 : 0000000000000003 x2 : 00000000ffffffff
> [   46.266547] x1 : ffff000177e2a000 x0 : 0000000000000000
> [   46.271856] Call trace:
> [   46.274302]  stmmac_xmit+0x7a0/0x9d0
> [   46.277874]  dev_hard_start_xmit+0x94/0x158
> [   46.282056]  sch_direct_xmit+0x11c/0x338
> [   46.285976]  __qdisc_run+0x118/0x5f0
> [   46.289549]  net_tx_action+0x110/0x198
> [   46.293297]  __do_softirq+0x120/0x23c
> [   46.296958]  irq_exit+0xb8/0xd8
> [   46.300098]  __handle_domain_irq+0x64/0xb8
> [   46.304191]  gic_handle_irq+0x5c/0x148
> [   46.307936]  el1_irq+0xb8/0x180
> [   46.311076]  cpuidle_enter_state+0x84/0x360
> [   46.315256]  cpuidle_enter+0x34/0x48
> [   46.318829]  call_cpuidle+0x18/0x38
> [   46.322314]  do_idle+0x1e0/0x280
> [   46.325539]  cpu_startup_entry+0x24/0x40
> [   46.329460]  rest_init+0xd4/0xe0
> [   46.332687]  arch_call_rest_init+0xc/0x14
> [   46.336695]  start_kernel+0x420/0x44c
> [   46.340353] ---[ end trace bc1ee695123cbacd ]---
> 
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 73677c3b33b6..3c0a2d8765f9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1548,6 +1548,15 @@ static void dma_free_tx_skbufs(struct
> stmmac_priv *priv, u32 queue)
>  		stmmac_free_tx_buffer(priv, queue, i);  }
> 
> +static void stmmac_free_tx_skbufs(struct stmmac_priv *priv) {
> +	u32 tx_queue_cnt = priv->plat->tx_queues_to_use;
> +	u32 queue;
> +
> +	for (queue = 0; queue < tx_queue_cnt; queue++)
> +		dma_free_tx_skbufs(priv, queue);
> +}
> +
>  /**
>   * free_dma_rx_desc_resources - free RX dma desc resources
>   * @priv: private structure
> @@ -5186,6 +5195,7 @@ int stmmac_resume(struct device *dev)
> 
>  	stmmac_reset_queues_param(priv);
> 
> +	stmmac_free_tx_skbufs(priv);
>  	stmmac_clear_descriptors(priv);
> 
>  	stmmac_hw_setup(ndev, false);
> --
> 2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
