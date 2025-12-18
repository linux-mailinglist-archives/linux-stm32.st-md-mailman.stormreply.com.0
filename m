Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF10CCA6FE
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 07:22:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F8F3C5663A;
	Thu, 18 Dec 2025 06:22:45 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0E5DC030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 06:22:44 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHNW1xA238011; Wed, 17 Dec 2025 22:21:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=pfpt0220; bh=QnU9W7deeMrcvpR9ljaEaTJJv
 JbQij1DQub+QTx1CYs=; b=f2CfZn3oBtXySP0x5i/PJl4htTdJqX8wloWnZvOqU
 L4apeJ7lWzwsdpyIi9aPBkG7S00oJUpxS7uO2JFDGCPRsMTiMMuFg6bV1iMkngbt
 T7Zmq7cwZLrStHo5pIl1rh/tYxt/cLwQ7EwR7J7v6aUrvGs2/unRFZUE8yPPqCnM
 9bGoEKfvHGQjrTtH3sSPcQewDQlrZ9rsYvTf1/ksDwzftxWJVilnU4j70n9sp5Mf
 AAbHkptOnY5PcORBdLd6jGMuS3VcWmPf3geMfteJZIdkdYn60d3W8qrmojtZGLiO
 JXySOmppc+Anm4cc+AW7FbquKyGVfkdOADtXOD04eFFgg==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4b3w5s1yju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Dec 2025 22:21:51 -0800 (PST)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 17 Dec 2025 22:22:03 -0800
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Wed, 17 Dec 2025 22:22:03 -0800
Received: from test-OptiPlex-Tower-Plus-7010 (unknown [10.29.37.157])
 by maili.marvell.com (Postfix) with SMTP id D412B3F70C1;
 Wed, 17 Dec 2025 22:21:43 -0800 (PST)
Date: Thu, 18 Dec 2025 11:51:42 +0530
From: Hariprasad Kelam <hkelam@marvell.com>
To: Wei Fang <wei.fang@nxp.com>
Message-ID: <aUOddielBMkrmwhd@test-OptiPlex-Tower-Plus-7010>
References: <20251204071332.1907111-1-wei.fang@nxp.com>
 <aUKPHdtAPDnMqB7X@test-OptiPlex-Tower-Plus-7010>
 <AS8PR04MB849779A6392D543049A3F5BE88ABA@AS8PR04MB8497.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS8PR04MB849779A6392D543049A3F5BE88ABA@AS8PR04MB8497.eurprd04.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1MCBTYWx0ZWRfX58H1lLqEekM7
 GAUAaaNMq92E4QYI6TfFDXq0fJJqIS59lalZ5uiZH9wNP/NncPI2UmdOu9Z2tvqtv4ZGNQRmuTR
 iwd0TGRySBMwD/0/cpLUUdS0ZF866dcE2BOqhDtc5VwFsEIPgH9fXxYJsHx/sqN7fFVgZFamETQ
 x+ZgiZjftcnNNiGd08amDKjaTLQfjZg621kK6aplA2/vPHM6NkSCLp+ZXD7zNbFW+zQGaxOiDED
 y0YYNXwcYzsoYNLswpV95c8TfWARaqi+gnu7cnVdKYCVXvO9NUGML5W9uiHdD1V7fk4sRzzXuLr
 uVRRjABUGpUGo8nx4kyWOHKq3iq6D/DrC0tPdwhHC5y/CHcD1C0geHW3pBcVCoajui7ccUx90fK
 L6hn/qoQ9qj0Rf2Gzn4cYrmKc2iR3A==
X-Proofpoint-GUID: jUik8wHEQLBJBYXI0BOoajfYtHppzs5j
X-Proofpoint-ORIG-GUID: jUik8wHEQLBJBYXI0BOoajfYtHppzs5j
X-Authority-Analysis: v=2.4 cv=Zpvg6t7G c=1 sm=1 tr=0 ts=69439d7f cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=w373o-ZMvzc93a0z:21 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=XlXf_pu8Z8fFeJWwk6sA:9
 a=CjuIK1q_8ugA:10 a=ST-jHhOKWsTCqRlWije3:22 a=gFKHwRTsc5ICqspHuaiD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "0x1207@gmail.com" <0x1207@gmail.com>, "sdf@fomichev.me" <sdf@fomichev.me>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "hawk@kernel.org" <hawk@kernel.org>, "ast@kernel.org" <ast@kernel.org>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix the crash issue for
 zero copy XDP_TX action
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

On 2025-12-17 at 18:19:19, Wei Fang (wei.fang@nxp.com) wrote:
> > > -	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, false);
> > > -	if (res == STMMAC_XDP_TX)
> > > +	/* For zero copy XDP_TX action, dma_map is true */
> > > +	res = stmmac_xdp_xmit_xdpf(priv, queue, xdpf, zc);
> > 	Seems stmmac_xdp_xmit_xdpf is using dma_map_single if we pass zc is
> > true.
> >         Ideally in case of zc, driver can use page_pool_get_dma_addr, may be
> > you
> >         need pass zc param as false. Please check
> > 
> 
> No, the memory type of xdpf->data is MEM_TYPE_PAGE_ORDER0 rather
> than MEM_TYPE_PAGE_POOL, so we should use dma_map_single().
> Otherwise, it will lead to invalid mappings and cause the crash.
> 
>
 ACK, found below code bit confusing
		case STMMAC_XDP_CONSUMED:
 			xsk_buff_free(buf->xdp);
+			fallthrough;
+		case STMMAC_XSK_CONSUMED:
 			rx_dropped++; 
              
     Ideally in case of STMMAC_XSK_CONSUMED, driver needs to call xsk_buff_free.
     And in case of STMMAC_XDP_CONSUMED, driver needs to call xdp_return_frame.
     May be you can move all buffer free logic to stmmac_rx_zc with above suggested
     changes.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
