Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB51AA3D8EB
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2025 12:39:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AAC0C7A824;
	Thu, 20 Feb 2025 11:39:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7648BC78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2025 11:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBT5w+rR1JchHQFlWzjb3YqSIJ4aykfi1xvqBp4E7y9NGFxW+XlzzqU6k4ChRtHpZ2FpIVMttlU9TKyYwmvXKBbs/gkhHTtvqpT8voqobZ/PzctSjZVBAJNirewsZ6qIWKI5kb3NGNQiPDz8hqF8OFRhoPQMSIVRuInt25J9QvzM9HcXf7mBhiAHS5l/1gNLoJMA4BQ9c22ZKN5FSEngPeR5xKnM+E8xkJMZ3MzPoJUuBBp599Zb6f4fTQd46v4ArZXXp4WNQ919dzyvR50sGRnPWvcYWqZtxm0ayzsF0kND5o5f5m2M4zYQOl0LBPwyiiDfmYdAqoIbR/L2QdjUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqzoP0hAJrN0m+NVs3w4FVn+wNMVm0c/WTqwVwDkrWs=;
 b=vZtCo+riPYxD8wcaBA68r/baYCLcev4zUQQcwnEIx9CXx1N3HBpxJsQB2FgbeQOg9Oa3gH/ixwDNNE92JKyLDiTEEY8ty81gnuYqFr9Bt5JCMurI1B2d8JOQEKqFPnpH0twuLN8/KN6TM002KuV8Wysra6bUKpUbCiezYpXnVjiSlOLyrb2ejOyDMtLc9R3SL5IHxhu9ngKjhpxqFhdLcPCDCoE5BYqF9xvr+JZHQAhkBlkZYhrx1Vllx9lBnka7IgERs6CdGJONeA9SQ6p4TK6etvp/XRRwh/KfaudhWf8ClI7DeQ5XhU1F7Gg4sQUZsmsKLyObebcWQ9BbBBb+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqzoP0hAJrN0m+NVs3w4FVn+wNMVm0c/WTqwVwDkrWs=;
 b=jMQsxztcyabqcx17IoSmUl1/A78FAL0Q2RRlSjQATiDCzimhklTWndL63mdRkhMPepZsXddSLb3IQnyKdqrmzgiDV225nniIMvcAO6DRlMz7MgU0Qcg8+cxTfKeia6R5qCQJDd0THz2xX4HXjBDJgf5rZWzolxN4rgb6pAc995S8Dzu6Bmmy/iHU2veLHV7NMIWleV0YmQpsYBEH17OOqWBGP4M8Q9+E3zZC1JoCLqfVbKpvzhyuouLrzo7FZ1B321Wa5EhGjv2l3q6UMnr04j8VstBEZSefVtCpMzxd+GvqtWJyTggtfmCfobrDAInvIC5HN+OR/t3tjB6+azgklA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GV1PR04MB10991.eurprd04.prod.outlook.com (2603:10a6:150:206::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 11:39:02 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 11:39:02 +0000
Date: Thu, 20 Feb 2025 13:38:58 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250220113858.m3c4ign7v5dn2kde@skbuf>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR06CA0228.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::49) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10991:EE_
X-MS-Office365-Filtering-Correlation-Id: c4884f6b-eed0-4d6d-ddaf-08dd51a32c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gG/S6IgLb2/631Xfc/DPqu690tvlAYnz2kBG2tpYPCQTdaZJ1IgEbg7ihnAj?=
 =?us-ascii?Q?a+0+b+x/sVqLQqZgbFqg+2w9T+08EdT9jxUZUQctKxnRMuKwO67FbbY3eFxh?=
 =?us-ascii?Q?ns5XxIYDl87eagJWabYyVos6zwsGu8Wdv+IX2DzvYtEbBbZduiFLnzeG5PJp?=
 =?us-ascii?Q?RCv91i2iikiRu3z5sx2sXX0mFJvWGoQ3OoZRcJcB/mIx2AxkJJbCrMCRn5s7?=
 =?us-ascii?Q?abOORthm05Bf0Ac05W/BXuvETn6hkGFQEWBMhUG4VKRJ4WqtWCgj/bXvDH9X?=
 =?us-ascii?Q?aW328N6UDYe+260YTjhf1PME87LR1cOcsOuVg5QMvkW0vjB8BmbZin90Foyl?=
 =?us-ascii?Q?6eo5E1NNnrGHH7VnDDnqZpFO/cdQ93/wjL8m30krATKdhCvCHlm6NLayjciv?=
 =?us-ascii?Q?u69fXXhpUYS+SUVC31PrYmzzE3BW0sL6N4S0cYBrbqBsZU8mQX5nEGOK72hk?=
 =?us-ascii?Q?BSnfMa+J20UbesYMMRQb6B7YMESzkRD3ha4TImS5DmDmxrJNu6Pn0yjhi9J2?=
 =?us-ascii?Q?rVQ5RnwKyw0w/va8bMQPaRKDc9WrTWw2lC7sYzpB8WdLPYPYcBmQb50eBk7v?=
 =?us-ascii?Q?2N/3qMQzUsKUMrG7ysv7cAAezfYQYBoyLlP7UNxewSaivMkKnm8caURX9oV3?=
 =?us-ascii?Q?2e1gh6zyfj+2Vvo2e4RTADAVRpLDIT/K5RcscIi0wxoDcKt0izE6yad/ayzH?=
 =?us-ascii?Q?pdV9jnsnvU5D6CLHO4S9qbo058SGK6C/R1y5eUPm591T021QJItpId460Hei?=
 =?us-ascii?Q?TPNip/XSP/uVwWax2wsJWCFejHXiW9Ek4WaLcg1epl1gp9x3AZ+f81DoH5bh?=
 =?us-ascii?Q?AkEDR49Tt1RM8FyX+OcmExuv7tPVmrommEtKz7zvF/9ZkPZmuELC2O4RFFr8?=
 =?us-ascii?Q?gTw3klJQyC5nL3dPNXRxVBkZ/8flRTqjgKDcjk6n8tZbOALCcRhICukFqsdN?=
 =?us-ascii?Q?gi55pXIdOPcFZNBu8KV0G5w87ZT4HILkhymsLsYIGrlDd8/Dql8bAUiw81Xz?=
 =?us-ascii?Q?K07C5pkLWmeBcJIV1QqhecUEDX3k7vLEeSqYZ1RuiJgr7IDcA9D4mYx8fBjb?=
 =?us-ascii?Q?QA9qAqj6nY5NkTRctvHY4La5x36uJUAB89UaPCSR4mPiww3SFg5NFM9SC6cg?=
 =?us-ascii?Q?EHlUUqHcFZPGIFeaOydRb0szQw7t4xKHyj7H03Fe46EvaF5mdupWVOLacrqC?=
 =?us-ascii?Q?AprzOGaBGCQFXAuGBR8wfvG9g7BOttcRX3HmV/VRZdxrQ6N15jJ9v6LS2Iin?=
 =?us-ascii?Q?lYTYmqLHmaV/S3j9QmChHR57JHgcwtov0UajJz34Su3N19VjcmPdB9g6FYx/?=
 =?us-ascii?Q?r0VraKqJcGuvq/0lfu61JtAAY2fAayw23wHMdD2DAaoj+NvxyX8S3JUV9Kdp?=
 =?us-ascii?Q?TzDZf96Q0xZvxG2tqWfyD+WDAjRa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ixsbLvyEpo8qXcgUQQg7sa/osLWt9a8iXU5PLGRd7Ztiq9B6BZmeSryQ3zud?=
 =?us-ascii?Q?ICfcvwqavxamYWbMKznPFyLR0gfQLr2FgkW6jMSh2hHvI8fCudEllTCye/Yh?=
 =?us-ascii?Q?Jr6/smiTq+rTlgo0fl+WXssUqKIT3NjQFPBmTs+MRdat93xLIsgxmY2zCRBq?=
 =?us-ascii?Q?sziEwhUov1ob+QH+eLQLtYIFdFaJ1OeIqu1uwckK9tR9PPB9aQkyZfSQtM+8?=
 =?us-ascii?Q?yTIODnOGrIRDT06XjTIfq7+X3CR4/+5Ul8fteZZNx6ELLfErbCDF8IyIKPVc?=
 =?us-ascii?Q?p1KNz6X2Yi03tP0R8htDte+Q/NHIYMiOMVX2vqYBfxLvVPNhMZPzwW9TsxvK?=
 =?us-ascii?Q?W1i95JNy0xVrrt9YD81qwtTXzltogAAdhmsfmlKfuFf+DDsE7kqQnu8aQbC5?=
 =?us-ascii?Q?FsyyAMstR/8D1+v4cdOWuk54JK1M7wfmoohmjAX9auzCHCU6qo/nI67tvIps?=
 =?us-ascii?Q?EiAyVAz3up8Ys/eLvQAjzjk/k6QZSPDHfZ53t8Fc57/oRqCcuCt5NG5ROXWa?=
 =?us-ascii?Q?Tctv9S2FD7Ud2dbvYQMngNhpTAO7n0ZeQgbdK1rv9ygWuMzhbDkIuIauFxXt?=
 =?us-ascii?Q?WwBUp4a7NuZ9Ak9WNxNtDXeve2uRt8lWumac/yyNCf7+NzCedg1YnsaW0iCe?=
 =?us-ascii?Q?HWUxBgnFZ62dCuTrO7wFqsFH/jEdVa2TE7w4A00M386yOSC9BjeP8m2WdaYO?=
 =?us-ascii?Q?8nqPjbRkeTrpi4oE3B1yw2/ehqdrCDljq9U9G2FGBlwe6Y40wdqJ6im/D1im?=
 =?us-ascii?Q?lAr46VLGlKXyuZ5RAl/AoszZgFn6QWZpjW8DymsLIlaFFsCegl5SgAe0lJV4?=
 =?us-ascii?Q?A5dLBwI/gFT3C1UHnkvBl7QNkdk76h/uswAEpn6cSGbfqOlLq3FYq6I7C18A?=
 =?us-ascii?Q?W3JZO47DQTvvJ1hs8a9DhteVks5jZWLEGyB/AN44w4+paDtGRlALdz5hDDz/?=
 =?us-ascii?Q?eNSbsuUEXxjjwUJaDOBTS1Kh8fuMop5qMeYEht7qzIoIroTGb9etP8cuInA7?=
 =?us-ascii?Q?hvM7ftcnOv6o8fvONQ6MJ6Slh/KCOG4SZ+1rWM5EhIBkNCVGfXjB396UnBHB?=
 =?us-ascii?Q?skY3ImQ+y5WwTcEgtTAaUQ+8BAV6ePh1jNYz87N4TbGcrRttzwhfPeTsqLRh?=
 =?us-ascii?Q?V7c6WmMk4wCps3krE+lfUvLD1bk+X6OiHiwQB7nMzs0WO+UgJ2oKreNLi7tK?=
 =?us-ascii?Q?zhy66vYhjuiHOCJye0/DZnev9TEWJ3+DWTcVUKMcWHf2G6Jykjh3D0F5zKPE?=
 =?us-ascii?Q?tlA1kwyhqpMGpp5+YzDzGrqPrgRZ0y/yHdrq61E/SO0bNaeM/llV8pOAqGgc?=
 =?us-ascii?Q?dwEX5FV59Tn/I+4JZTbGY8bEzsibC5Y7lXyg6RO+dIikd6dEbfqoSQAkN/8f?=
 =?us-ascii?Q?xsRJOJ2jaRebUhoFFm0DbIvdGDlsEY9la94HJRLCqGdwQF6Fu9kqmdgMbGIP?=
 =?us-ascii?Q?dxwdIXIEM7h1RrhCjDbzgsUIkOijuLxLW4DgiCpC51bDyiwzVeLouRwTO+Zv?=
 =?us-ascii?Q?iHzJBnWuWlWSfnNAK3qac9ET4J7bDLrShg21vlbdmIFYf0nOtT3/Is3MjSx+?=
 =?us-ascii?Q?RQ8Oz/F7nEbXZJEtVPOoGqNzuR1JfPX2KKB7F/cUfvfCRTAlzSQGPKYi9wkp?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4884f6b-eed0-4d6d-ddaf-08dd51a32c60
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 11:39:02.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ6Kvdfd5IN5L7x9J9AIky9MF5Y3eSt0iS5OfdtmMT+hkn3KrIpIa+3q5kovQsGWTcsHlK3XOO56Pq5M9MU5wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10991
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v5 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

On Wed, Feb 19, 2025 at 09:53:41PM -0500, Faizal Rahim wrote:
> +/**
> + * ethtool_mmsv_stop() - Stop MAC Merge Software Verification
> + * @mmsv: MAC Merge Software Verification state
> + *
> + * Drivers should call this method in a state where the hardware is
> + * about to lose state, like ndo_stop() or suspend(), and turning off
> + * MAC Merge features would be superfluous. Otherwise, prefer
> + * ethtool_mmsv_link_state_handle() with up=false.
> + */
> +void ethtool_mmsv_stop(struct ethtool_mmsv *mmsv);
> +
> +/**
> + * ethtool_mmsv_link_state_handle() - Inform MAC Merge Software Verification
> + *				      of link state changes
> + * @mmsv: MAC Merge Software Verification state
> + * @up: True if device carrier is up and able to pass verification packets
> + *
> + * Calling context is expected to be from a thread, interrupts enabled.

s/thread/task/, I think it's a more conventional way of referring to
process context.

> + */
> +void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up);
> +
> +/**
> + * ethtool_mmsv_event_handle() - Inform MAC Merge Software Verification
> + *				 of interrupt-based events
> + * @mmsv: MAC Merge Software Verification state
> + * @event: Event which took place (packet transmission or reception)
> + *
> + * Calling context expects to have interrupts disabled.
> + */
> +void ethtool_mmsv_event_handle(struct ethtool_mmsv *mmsv,
> +			       enum ethtool_mmsv_event event);
> +
> +/**
> + * ethtool_mmsv_get_mm() - get_mm() hook for MAC Merge Software Verification
> + * @mmsv: MAC Merge Software Verification state
> + * @state: see struct ethtool_mm_state
> + *
> + * Drivers are expected to call this from their ethtool_ops :: get_mm()
> + * method.
> + */
> +void ethtool_mmsv_get_mm(struct ethtool_mmsv *mmsv,
> +			 struct ethtool_mm_state *state);
> +
> +/**
> + * ethtool_mmsv_set_mm() - set_mm() hook for MAC Merge Software Verification
> + * @mmsv: MAC Merge Software Verification state
> + * @cfg: see struct ethtool_mm_cfg
> + *
> + * Drivers are expected to call this from their ethtool_ops :: set_mm()
> + * method.
> + */
> +void ethtool_mmsv_set_mm(struct ethtool_mmsv *mmsv, struct ethtool_mm_cfg *cfg);
> +
> +/**
> + * ethtool_mmsv_init() - Initialize MAC Merge Software Verification state
> + * @mmsv: MAC Merge Software Verification state
> + * @dev: Pointer to network interface
> + * @ops: Methods for implementing the generic functionality
> + *
> + * The MAC Merge Software Verification is a timer- and event-based state
> + * machine intended for network interfaces which lack a hardware-based
> + * TX verification process (as per IEEE 802.3 clause 99.4.3). The timer
> + * is managed by the core code, whereas events are supplied by the
> + * driver explicitly calling one of the other API functions.
> + */
> +void ethtool_mmsv_init(struct ethtool_mmsv *mmsv, struct net_device *dev,
> +		       const struct ethtool_mmsv_ops *ops);

The kernel-doc comments are fine, but I think the convention is to
put them near the function definitions (in net/ethtool/mm.c) rather than
near the function prototypes, for the very simple reason that in the C
language, you can have multiple function declarations but a single definition.
The kernel-doc for the structures is fine where it is.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
