Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C191F4BDD
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2020 05:43:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8C32C36B22;
	Wed, 10 Jun 2020 03:43:52 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2056.outbound.protection.outlook.com [40.107.21.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22212C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 03:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZb5qqjDI08vTaIOoHN26WGWazyUXN1oz8Ghd+fuVnR0/vgiViPLqgdn3LHQl8KcyWaskUld/GyMEdYRWXz+ThKJdswx/j2AWdkNe60kxbRaFSu4TV5NVFxGLfykABuhMNO4h8i7zOmgjpKerzhCTSXaFF2eIPb7k0UyE572kZaMWLoN6gG8sxKzTbQQDIgWJ9d4+ZUQjvUM6cDSRDPo8Qg4dtrSdIX7Pq7BdL3oodPUIoRYFHZvzLGjpI5MG4/4QxwwS4B/2w3DtpYyn7yjgdJjVLn9+9BkD1caWXR4HyQFAuCESAeDbDtOaUp8y3I2F0/vSwpWoggJuvhjmHwO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu/ATQ3R6umbDj93QkgxFjDwUgbWg6fnfda9/JPWqLE=;
 b=KatRVe0LqOnXHrrVJxY6uE2bZEC9UPESgibbptXrAYQGX1Sfwl12/mpsXImySsp7AaGw12mxnVbaCuQtbg/khWpJhSKp4MX4rehzsMOTzOK6q8Rckf+gm6t+GskyQbHGjP7KZ4bNmWTSho/o8XJORDCvBHEvO4/WZh1ASAU5LdNdGo+YeiiDtVWwBl+mtuuQdgzAVoPFydwR2CMdDS3NWp7D3zliA/o/G/neuPFIX7XtTW2FlyQoOPsrF+al0fSAnmRhJ/iR8u7P9zCLy4VjUwAQBh5dD2GIPa7m8/kjBaFfAJ7nMnHZHL30NlM8y/KlYeharQNvQcrFLs8MXXIL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qu/ATQ3R6umbDj93QkgxFjDwUgbWg6fnfda9/JPWqLE=;
 b=XPGKOtUYezSpPGI+V9qlZJmZveObpsftQSYJkiW+5UpZx5Q5VHIJ9IwX2/obYBI4ezW5uMjkePJxKlmIZcvrX+YBgU6C6Ejmwa49iEekGOxaizuqKeuTuZJouvOXsQSnlH88LFJpvFgzbuCwm6jncpFaQvJEA6pTPXHrsMVId6A=
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18) by AM6PR0402MB3893.eurprd04.prod.outlook.com
 (2603:10a6:209:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 03:43:48 +0000
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1]) by AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 03:43:48 +0000
From: Andy Duan <fugang.duan@nxp.com>
To: "davem@davemloft.net" <davem@davemloft.net>, "peppe.cavallaro@st.com"
 <peppe.cavallaro@st.com>, "alexandre.torgue@st.com"
 <alexandre.torgue@st.com>, "joabreu@synopsys.com" <joabreu@synopsys.com>
Thread-Topic: [PATCH net, stable 1/1] net: ethernet: stmmac: free tx skb buffer
 in stmmac_resume()
Thread-Index: AQHWOLSWclUv/VcTx0GEq1TzaGMl+6jJSjfggAf2hJA=
Date: Wed, 10 Jun 2020 03:43:47 +0000
Message-ID: <AM6PR0402MB3607193D973D43A2346754E0FF830@AM6PR0402MB3607.eurprd04.prod.outlook.com>
References: <20200602075826.20673-1-fugang.duan@nxp.com>
 <AM6PR0402MB360722C28396BD995A4AD2FDFF860@AM6PR0402MB3607.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR0402MB360722C28396BD995A4AD2FDFF860@AM6PR0402MB3607.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: davemloft.net; dkim=none (message not signed)
 header.d=none;davemloft.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 79c4bad0-3b14-457c-606a-08d80cf07bcb
x-ms-traffictypediagnostic: AM6PR0402MB3893:
x-microsoft-antispam-prvs: <AM6PR0402MB3893A1B20F35C7D47898B176FF830@AM6PR0402MB3893.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gh3W6yr6GokG/vzmD4M75suoO3XPT5zTAkCfTwobTmKaj8CzwE0lzKoIUeJ41JoR9zXC7qZkLV13omJYRHKjmaMdn3o8XfD3mx4BzD0ludSCJykbSE+Y38tQNHwltRjf480AfoM96EHuXQxXNOVz+/Qxeu+tj38qaivcJPK9HiR2qvDrCmpdWckoy34/hYXUNYPDmTTB7EaTOpBBjo+LccFQRRpXSM0wNPecId+xvXwCjHaKjSq3YSnE1ovq1JCBVnVTxk6b37LQ793BuVes1RtsErr1cmVfq6SJyvJ8lUjkNv0vFp5K9Zo768i8DrLhiRLdScQlnWabkdSTEfSWvS5AN5yg+dVWI6cDFhJSV5C5p2Lts9PP4GNF5SIVa+PA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3607.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(66556008)(186003)(66476007)(8936002)(110136005)(6506007)(54906003)(83380400001)(8676002)(52536014)(66946007)(55016002)(9686003)(5660300002)(64756008)(76116006)(7696005)(4326008)(26005)(2906002)(86362001)(478600001)(71200400001)(33656002)(316002)(66446008)(45080400002)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: I8jwqgt30ep68wqo2r5XE8ChHtUi/kguYPVcIVMjwAu3xQg4cCtk0vgTeVh14Podm0NGk9R65f8u5IZWfOlb1jxrFsl//sFyv2zrTK2a6iFkGTEhyzP7qEyqqzR+vfnfWK+9uCECqUUtLGItlnoSiCV+PHCfkpbL3aEqm7eRKUOjTxfl13IEzGK8lqy8Mc1li7BX7AKinjin7t+f3SYc++cOXZMQB4XSQc+Ezi52Y22FJlNioU+DtQq9QNIOmCoZJNQbSny7O6V1nn4MMt+6Myix7j7mIAFZptdY3H9sLB/0mPu4oNJclPxOfDJy9uj4iB1ywYGq9kfktrghUhSKqkaR2IiLpBrwvTx/18oHA/TABpe823TElX0qaEGWjeHvWczeweNIYJXHXdK5aSDwSP8qtH+U+pPFOpzhsikQjbOtY4i1+kjagj6rMsdiPUvgglMrjctVJA2ho4rgsF3DQQjO7WIzC0nJnheQOMHhuYDCkLDgR3vYND3MBDsla39B
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c4bad0-3b14-457c-606a-08d80cf07bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 03:43:48.0306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8PcTGj+cEPdU93b1Wt9SECFSrj5n4G8j7ECcyN7h8pI/cztN7I/zGP/+3dyoGq1SeF9ZLnWzZ1hvNepRg8cNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3893
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

Giuseppe/Alexandre/Jose/David, can you give comment on the patch ?

From: Andy Duan Sent: Friday, June 5, 2020 10:06 AM
> Ping...
> 
> From: Andy Duan <fugang.duan@nxp.com> Sent: Tuesday, June 2, 2020 3:58
> PM
> > From: Fugang Duan <fugang.duan@nxp.com>
> >
> > When do suspend/resume test, there have WARN_ON() log dump from
> > stmmac_xmit() funciton, the code logic:
> > 	entry = tx_q->cur_tx;
> > 	first_entry = entry;
> > 	WARN_ON(tx_q->tx_skbuff[first_entry]);
> >
> > In normal case, tx_q->tx_skbuff[txq->cur_tx] should be NULL because
> > the skb should be processed and freed in stmmac_tx_clean().
> >
> > But stmmac_resume() reset queue parameters like below, skb buffers may
> > not be freed.
> > 	tx_q->cur_tx = 0;
> > 	tx_q->dirty_tx = 0;
> >
> > So free tx skb buffer in stmmac_resume() to avoid warning and memory
> leak.
> >
> > log:
> > [   46.139824] ------------[ cut here ]------------
> > [   46.144453] WARNING: CPU: 0 PID: 0 at
> > drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:3235
> > stmmac_xmit+0x7a0/0x9d0
> > [   46.154969] Modules linked in: crct10dif_ce vvcam(O) flexcan can_dev
> > [   46.161328] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
> > 5.4.24-2.1.0+g2ad925d15481 #1
> > [   46.170369] Hardware name: NXP i.MX8MPlus EVK board (DT)
> > [   46.175677] pstate: 80000005 (Nzcv daif -PAN -UAO)
> > [   46.180465] pc : stmmac_xmit+0x7a0/0x9d0
> > [   46.184387] lr : dev_hard_start_xmit+0x94/0x158
> > [   46.188913] sp : ffff800010003cc0
> > [   46.192224] x29: ffff800010003cc0 x28: ffff000177e2a100
> > [   46.197533] x27: ffff000176ef0840 x26: ffff000176ef0090
> > [   46.202842] x25: 0000000000000000 x24: 0000000000000000
> > [   46.208151] x23: 0000000000000003 x22: ffff8000119ddd30
> > [   46.213460] x21: ffff00017636f000 x20: ffff000176ef0cc0
> > [   46.218769] x19: 0000000000000003 x18: 0000000000000000
> > [   46.224078] x17: 0000000000000000 x16: 0000000000000000
> > [   46.229386] x15: 0000000000000079 x14: 0000000000000000
> > [   46.234695] x13: 0000000000000003 x12: 0000000000000003
> > [   46.240003] x11: 0000000000000010 x10: 0000000000000010
> > [   46.245312] x9 : ffff00017002b140 x8 : 0000000000000000
> > [   46.250621] x7 : ffff00017636f000 x6 : 0000000000000010
> > [   46.255930] x5 : 0000000000000001 x4 : ffff000176ef0000
> > [   46.261238] x3 : 0000000000000003 x2 : 00000000ffffffff
> > [   46.266547] x1 : ffff000177e2a000 x0 : 0000000000000000
> > [   46.271856] Call trace:
> > [   46.274302]  stmmac_xmit+0x7a0/0x9d0
> > [   46.277874]  dev_hard_start_xmit+0x94/0x158
> > [   46.282056]  sch_direct_xmit+0x11c/0x338
> > [   46.285976]  __qdisc_run+0x118/0x5f0
> > [   46.289549]  net_tx_action+0x110/0x198
> > [   46.293297]  __do_softirq+0x120/0x23c
> > [   46.296958]  irq_exit+0xb8/0xd8
> > [   46.300098]  __handle_domain_irq+0x64/0xb8
> > [   46.304191]  gic_handle_irq+0x5c/0x148
> > [   46.307936]  el1_irq+0xb8/0x180
> > [   46.311076]  cpuidle_enter_state+0x84/0x360
> > [   46.315256]  cpuidle_enter+0x34/0x48
> > [   46.318829]  call_cpuidle+0x18/0x38
> > [   46.322314]  do_idle+0x1e0/0x280
> > [   46.325539]  cpu_startup_entry+0x24/0x40
> > [   46.329460]  rest_init+0xd4/0xe0
> > [   46.332687]  arch_call_rest_init+0xc/0x14
> > [   46.336695]  start_kernel+0x420/0x44c
> > [   46.340353] ---[ end trace bc1ee695123cbacd ]---
> >
> > Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 73677c3b33b6..3c0a2d8765f9 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -1548,6 +1548,15 @@ static void dma_free_tx_skbufs(struct
> > stmmac_priv *priv, u32 queue)
> >  		stmmac_free_tx_buffer(priv, queue, i);  }
> >
> > +static void stmmac_free_tx_skbufs(struct stmmac_priv *priv) {
> > +	u32 tx_queue_cnt = priv->plat->tx_queues_to_use;
> > +	u32 queue;
> > +
> > +	for (queue = 0; queue < tx_queue_cnt; queue++)
> > +		dma_free_tx_skbufs(priv, queue);
> > +}
> > +
> >  /**
> >   * free_dma_rx_desc_resources - free RX dma desc resources
> >   * @priv: private structure
> > @@ -5186,6 +5195,7 @@ int stmmac_resume(struct device *dev)
> >
> >  	stmmac_reset_queues_param(priv);
> >
> > +	stmmac_free_tx_skbufs(priv);
> >  	stmmac_clear_descriptors(priv);
> >
> >  	stmmac_hw_setup(ndev, false);
> > --
> > 2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
