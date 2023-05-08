Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4725A6FBFB4
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 08:56:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E20F7C6B441;
	Tue,  9 May 2023 06:56:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13A5AC6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 15:14:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348AGYLx006000; Mon, 8 May 2023 17:14:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=a/KcDtn8N85d+MiH98qFT89Q/gTz5TY/6lfN8RTozPA=;
 b=xlDrE6LcMC1eN52iOfiKMEdxIzzkKrQSG2xyPFgcveEHDhjPP2i/ULPHzGBNRGk/hAR9
 uA7ttwAMyYDYomYrjKNuCdvi51HVqz7w3NDJV88y+v3T2O8jvs7DpDm82HNEU32DFib1
 FmKfX50RzKc4SmYh3pNOV6bBdFBiE5yYE3faFllQLlgVd4PKLmAebw/gudYCh2bf3Kzt
 BekzIpE46JmYuai8FjzfDqFpg6O9QvuQjkh9NDSUlc81YCwqcSfa/pPLZNjtTPVhGcs3
 0sU7Prvsho4HOjjgbjdtMGAy4cR7/lc/wpk8avSLO23zotUTaQtBXIx6hwPqMurMsGGw IQ== 
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qde832ur9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 May 2023 17:14:06 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqO5ssiyNam+NJQMIHM8Y2xtblJgrmpiYUJXrrNlsufwYWjqtT4e4jknZLYggai0I+0hKeWNPOJY1QNsbhpBcCZ0WdA+ZN/Y0m26siFILNmMYo8XMfDYid7qBPXXZEDt+E7M51fx+ssskQt7FBephuDXRgn+QVpKk6SCwsna0nr75nVDDjWmS9+DJwKddu1N7zeSkcXLQstni9p+KOsfNRET0JELI9xakRGsZqJX3bhHaUUwj2SsAKKHubNbmPKu8Xz5KLoPBOrmpeffHPFCNQwRpca4lgz/LOG2yJy+JX9JtXrSxejqnesmojF6rN9ktAfD5wgKpGsXEJ5w6tLaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/KcDtn8N85d+MiH98qFT89Q/gTz5TY/6lfN8RTozPA=;
 b=HTz5q8RkC9JbOhwFpkkMBS7EThY6mFb2vGrfKE/ttq/zevQ2Pz5hBz26RKi8TNTcT5cHRE3tvtrQz5jFfxw0trBY65ImDf9KidgLJ9EkhyDbc0GiXLKfs7y1lc+ks1Zpxr5Uv2NWg9o9JumfWJVgN61Z8TR2fgvBN/yNvLx5oWIKoTJpQUM+koP+Gi46+043JVoQVlqtpj+D9KYAaIZ2d7xiHMx8Zu5kbcDjlHqtytyA4+lIQ7SswOPm3QEDNIyDQBsB+xrgceqeYeuKZACS+LbAizCy4XwOqIaezyseP9WQhtfCnBcbMG8RJNnlPx/cSqZnkFEnT5fh0wbsG50pxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:213::18)
 by AS8PR10MB5829.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:525::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Mon, 8 May
 2023 15:14:04 +0000
Received: from PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2901:7ea9:c140:b51e]) by PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2901:7ea9:c140:b51e%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 15:14:04 +0000
From: Peppe CAVALLARO <peppe.cavallaro@st.com>
To: Teoh Ji Sheng <ji.sheng.teoh@intel.com>, "David S . Miller"
 <davem@davemloft.net>, Alexandre TORGUE - foss
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Eric
 Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Thread-Topic: [PATCH net-next 1/1] net: stmmac: xgmac: add ethtool per-queue
 irq statistic support
Thread-Index: AQHZgbv6LrzMlz9sJUuhzM4rADTWBq9Qe9/A
Date: Mon, 8 May 2023 15:14:04 +0000
Message-ID: <PAXPR10MB5056C983DACCC8F0A883395E85719@PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM>
References: <20230508144339.3014402-1-ji.sheng.teoh@intel.com>
In-Reply-To: <20230508144339.3014402-1-ji.sheng.teoh@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2023-05-08T15:14:02Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=7892ee29-090e-411a-ba86-48229a600027;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB5056:EE_|AS8PR10MB5829:EE_
x-ms-office365-filtering-correlation-id: 14414e65-0e40-4c81-98cb-08db4fd6dcb9
x-ld-processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5UctN/Hey5uV9trPi1gcG5wnNb0J7I80nGG1DNBn2/nmZ5xC3m9GvaeDYbbrakjldeoATrcLfsmgwMIGCHEptHg2yE5LWy/lfOrPDF6zO833s7cqFsMC5UdfgJQsG7J61lh3XQkLSvPk6e8uWijJr+wRV0V7GCgBmZlfWvj19QfhrfyMDWWNFIxu5JJx/yZXPHl+nBTg/UhYddWTe5ZCkXP3TkzpdJEqpYz3wMfmahWc5rkORF2WRjm4DeZUgH3/tALgQ3m8LwKQgTQezgauzR4JzPFlOIe1vpCFOojOXhfK2iZYxNkB6JbT3mHoiyX9rd9uRjF5KogbDafSFfH/odW/tE3LPvcGfBhjIqeyhqeHY21H/8OWIAUM3NuUxpOrqacUXU4vECAi5Em745NGEt8ciBsv2peN/s0ie0GHhlR/foEJMySTjmyyC2kt7Psl6EY3oVSSN5tvHQgYpeG6fnzldyjGjdAxmhGfPT1K03txCLySr3Ceu6beEEZ+SANzw/rliFGr6IUl1kLV/HlJT0vAON+gPYTg4Df/TQxfV4YueEFBMARXiiWJsKb49HnOppQ9iiqHXOzzugegNLUn0fqa2ZU7w0NV8wVl14xWEreZHsxYjEwlxY0ZZAs7l/o/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199021)(71200400001)(55016003)(122000001)(7696005)(83380400001)(9686003)(53546011)(86362001)(6506007)(186003)(26005)(41300700001)(2906002)(5660300002)(52536014)(54906003)(38100700002)(76116006)(4326008)(316002)(66946007)(66446008)(66476007)(64756008)(66556008)(8936002)(478600001)(33656002)(7416002)(110136005)(38070700005)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AJTD5xMkLtM4DGkLwiXSXYsubMz64YGL/3VabEy6z3mCcAWBt7zoV/79pCzo?=
 =?us-ascii?Q?wyBy1ssYLd/CpI5DK/k9jpsbxgL4FxeYr2HCq4i2n2iWn+K4eZzgfJS0ltzT?=
 =?us-ascii?Q?ejpcXloJlWDIVBZZ3oWVorgtLArDj+1aTLxfNl0YtGJVz2Hj0bDWzQPq2xj/?=
 =?us-ascii?Q?p36T0RSMna7GUD/WTFoPolnou1mLkfv9HGeXWTWNObGVA0zhroLi4m307TfI?=
 =?us-ascii?Q?7xZBMKR7673zkN9Ff7vvmYBNmoxYxrP1cgPA5w1ecrx9wyqNaMRZTnQS/XT/?=
 =?us-ascii?Q?FCKzSRUM21a/ccmshW7dyAWfBtfQTuWWeRJttIFBT5KCRBE48DvKspXY4rfe?=
 =?us-ascii?Q?AO+M7WvniW2uvbqGbANe1CqVDgUVAz929wRrqnfLAYMG5EHjYm+dgwDQBAHt?=
 =?us-ascii?Q?a2Q4Y6mhwKD1xsJMt0KclH1lbBCp6APASaDjB5i+ezvrzsj1kLBOf5UXhOnY?=
 =?us-ascii?Q?+Xdu2kiRhk40nAUO46y2Adgr1EVtd9vL2yxIln66GJN6mk3jg4QGwL+RtzDL?=
 =?us-ascii?Q?w3tobfgO06Nbij9kxUqrOFuxkosofgugDPuRglCYH0U2c/niASB3gDMuYD87?=
 =?us-ascii?Q?AS8kPFCUddS7pp2CSnu4YxbhRhjBDJhkeMbpffHF1p94/81xrd3/Fw/ncpem?=
 =?us-ascii?Q?1A8znBdRtVGyeI4Kwwy2BRXPC/wVF1+mykZXfoY+vFHHlEk1ok15+ha4/Thq?=
 =?us-ascii?Q?oRAmUCfoujqxra2AUFBNiwG9w/y/tIgzv4gWWi8s3v5wl2RbKW3UwOYXupBb?=
 =?us-ascii?Q?0ZC8yWLLXmS1LWfJIG/Rg0Obv3D5Gj7dgDReYO2jskDeQuzgsajv550uauzF?=
 =?us-ascii?Q?8Zgk5XmZD5kS+txJCkWJK8K9NBUHX7oefYHGE0pPZEP9DsoX4EY0PROpn5Cx?=
 =?us-ascii?Q?puoQ45Lo/vEvmSlsspjgBftNR4DJPVGz9tjJTOnnlduoRJcNhgjCc1u/Tmnp?=
 =?us-ascii?Q?8tLiKDlQt1qalqqPVbjoFmXPXlVfPmX+PTUdleCTTH0LWZDzrRHV02p1crQL?=
 =?us-ascii?Q?+6OTxFp9z7ORCY+ZNYZP6tFE/6/Jjx8OrtBMmOJS9hrBvJKj1OfAv4eQbG6P?=
 =?us-ascii?Q?jfThlN8TjxqWq0PMqU3aJ6awtqE9gy5tQJ+3jq9pfNoGQK7qbXK+D9ynguP1?=
 =?us-ascii?Q?uSIvjsaFbZK9ArwxRcyEfSEGBpLhOQ0fsIhfsb+V5pIpDqmQkXG1TabDQwO3?=
 =?us-ascii?Q?gDD9RpATm06RbahSyYL3cUnC1M/BFh0wtLmkgDjkULU4il7PatZrCZim2ezM?=
 =?us-ascii?Q?IJKd0Gffo89z+14R2kWqmjGRRNHcrqKiWD3BH1/aH3RDFR9iWr9kLcS11gpE?=
 =?us-ascii?Q?PraD32RgalTCD8byq5+7doKg5s75ZuPanGbT3oTu8t3kLAGADJSedC4ep5oV?=
 =?us-ascii?Q?Fn0BTjnuaAa/5LcDJzGQWqDN29m8IoWDVIzpKghJ8YPVZIciXG8VZWkGLJnm?=
 =?us-ascii?Q?5j4tpTliqL8ecVtUMQqRBz0quY4luGQ0YO2bPqdQYxlsB8C6la3AddzEZx1v?=
 =?us-ascii?Q?6Id8at2bk86NUl+8uaKJkZuJpJCmM/HnYnkiAjMXiAPZ7lHg+I+/lB96s35I?=
 =?us-ascii?Q?krPT7ofq2QTQWZHyHWosCJPjXC+ky+TushAbMyyH?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5056.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14414e65-0e40-4c81-98cb-08db4fd6dcb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 15:14:04.7559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6YL9PNtx89/+RKFccJCEKfeXAVBzs4Ao6PHJ6MhcXiChllpmq5s3W/j0S8UY0aQ7Z6iiBIojqBOH/uAzy87eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5829
X-Proofpoint-GUID: _8dvF8QkQ8ZbbOlZsmZADmc7tw3Xz_d0
X-Proofpoint-ORIG-GUID: _8dvF8QkQ8ZbbOlZsmZADmc7tw3Xz_d0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1011
 spamscore=0 impostorscore=0 mlxlogscore=917 malwarescore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305080100
X-Mailman-Approved-At: Tue, 09 May 2023 06:56:20 +0000
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: xgmac: add
 ethtool per-queue irq statistic support
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

Hello

Idea behind the patch looks ok for me

Regards
peppe


ST Restricted

-----Original Message-----
From: Teoh Ji Sheng <ji.sheng.teoh@intel.com> 
Sent: Monday, May 8, 2023 4:44 PM
To: David S . Miller <davem@davemloft.net>; Peppe CAVALLARO <peppe.cavallaro@st.com>; Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Teoh Ji Sheng <ji.sheng.teoh@intel.com>
Subject: [PATCH net-next 1/1] net: stmmac: xgmac: add ethtool per-queue irq statistic support

Commit af9bf70154eb ("net: stmmac: add ethtool per-queue irq statistic
support") introduced ethtool per-queue statistics support to display number of interrupts generated by DMA tx and DMA rx for DWMAC4 core.
This patch extend the support to XGMAC core.

Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index dfd53264e036..070bd912580b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -368,10 +368,12 @@ static int dwxgmac2_dma_interrupt(struct stmmac_priv *priv,
 
 		if (likely(intr_status & XGMAC_RI)) {
 			x->rx_normal_irq_n++;
+			x->rxq_stats[chan].rx_normal_irq_n++;
 			ret |= handle_rx;
 		}
 		if (likely(intr_status & (XGMAC_TI | XGMAC_TBU))) {
 			x->tx_normal_irq_n++;
+			x->txq_stats[chan].tx_normal_irq_n++;
 			ret |= handle_tx;
 		}
 	}
--
2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
