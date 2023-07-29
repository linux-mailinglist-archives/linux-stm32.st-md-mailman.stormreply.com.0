Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D717679F5
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jul 2023 02:47:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E41B4C6B468;
	Sat, 29 Jul 2023 00:47:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2079.outbound.protection.outlook.com [40.107.6.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9EAAC6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jul 2023 00:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8BEoD5zGSqd4pR/jKvNfmaakjFvDl6vIiCmkCoB7PdbbqctERON2cfBVjBzo5da7LfgwH60vTrgmd7y2WnQGhZZsOaX6gmMgkHmAPoLEcPk3Y54ue+lBwD5CYNIyLDJHP4M3nHHcz9KBKx2Au1IkVLxAF7XYUSGGEIrUFp2Cop/VKdQIT/Ga42jTvhJdWEUTurpaeYphLwADqPDa/xWEdHTWKAQnE88WKcqW71OCYVLiX/qFA8oW04a94Q/MrN59kQFFvicC381B3H6xRo5zvq95Ri+Y9FehEXzD157zJSbYywzjXH9UC2s4UmK4IKAFBay7CxWB1mGz+Hgn7ZL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cISNBWcGVL4/PXnDL9FlW0H4xCA8xzuHkOq7nHtfRQ=;
 b=RZwYFHZkEQRRA11a2B7WsrnlqnuJu37oHybbazvvJC6vxFZh7yuyH16wNS76/OSd/suvRadn+ULe/J5F8evACZcM212BDTkYXHEOoOoD8dGFUMNxh5eyTiUpjecucB1dvV6ofj5dSBmEMOcfcMonk8Rt9OSMN5MAqy7kzYAamCzCFBz79040Ew3a0rDKcK9XiGNl9xC7MlWmfIeyu3vVKB0wFj/2qLPrr3AWd10CA1vLW7gXR35RWr3ZWozwl6YotEvmQGSbehiqJEqPQ4srKTpAyLlv1iPA3+voultSQk6yXI+USzm53XK83zVTUjfHdLvB/veRmyhMplj+YU6IFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cISNBWcGVL4/PXnDL9FlW0H4xCA8xzuHkOq7nHtfRQ=;
 b=CqoNeqPC3zh+Ak4rR6GkHGhITGHqHMnUIl04YbREDCjBe69z632Fv+Hk7u4ANazN5LxBT4MSpi0NN2chLXlkncAI7va8a+muhZlWKNEtAyrtWsWPkdJJpSWBV8P62suk+ZrreJAkqc1VP83RRBM1rjGYNU4hbUCTaE/CJY9Ugu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com (2603:10a6:208:16d::21)
 by PAXPR04MB8877.eurprd04.prod.outlook.com (2603:10a6:102:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Sat, 29 Jul
 2023 00:47:08 +0000
Received: from AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::6074:afac:3fae:6194]) by AM0PR04MB6452.eurprd04.prod.outlook.com
 ([fe80::6074:afac:3fae:6194%4]) with mapi id 15.20.6631.039; Sat, 29 Jul 2023
 00:47:08 +0000
Date: Sat, 29 Jul 2023 03:47:02 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Message-ID: <20230729004702.oiloyrt3p3x46u7s@skbuf>
References: <20230728232215.2071351-1-rkannoth@marvell.com>
 <20230728232215.2071351-1-rkannoth@marvell.com>
Content-Disposition: inline
In-Reply-To: <20230728232215.2071351-1-rkannoth@marvell.com>
 <20230728232215.2071351-1-rkannoth@marvell.com>
X-ClientProxiedBy: FR0P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::16) To AM0PR04MB6452.eurprd04.prod.outlook.com
 (2603:10a6:208:16d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6452:EE_|PAXPR04MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5d51a2-1286-44c0-ef0a-08db8fcd5659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3UyGqitxVnjw0dupaOqAp8lxHE3y4WHHUczPLMbt0ceAXF8ILiQWk382DFAAcAQW67mGHR8tqu4kz+hp3oQVKyIzGJptQotCP6x3eX4/7kPjMrW6kKoZMw0mmNWpCy1kC4i9byuEwUGZrPJDb4URYl+94bv7GKsAu2mYG92pKCXW9HtEcQ+sf0xFtFUtUb7t5W9z2eoKJnl6gMPSH83ANfv1IxNBrgcBBf/VUKEO/xWJgmhx1EgCE4Po7lPl53lnS+sm4Gd8XlHmWzAfVo6BjoLCzA2aTtNO9IoOnBk8kdZSVyd84ABDILMdGK4SEFGt+zjuO5aq1kKxkDQjvLc4EiebUdTm1qPQ5LDu9gI9/XkNYJNRbcu0il0yvCJF614eAi6UPcepuKQw0sFsqddw+vudFc009Tx4vDHYA096ko+TSxHBHPIRtNziRtVdtHXNNqKgqdKRgmawRxPw6yo8ujbUgT6R8EXUtfslCtOF4NnUe35qY34D881TxiL7gZYeGRGfDEqAGPuUYEGveJ3gcbCpDfE7RFOPhea64KrpwY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(451199021)(6666004)(478600001)(6486002)(6916009)(83380400001)(6512007)(9686003)(1076003)(26005)(6506007)(966005)(38100700002)(66476007)(66556008)(66946007)(186003)(4326008)(5660300002)(7416002)(7366002)(7406005)(316002)(8936002)(8676002)(2906002)(41300700001)(44832011)(86362001)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U5zszli7JXl4jXFfOciE9j2bTB3PTSMeXhxdX3qbhVCnulZGD202DfxRO79u?=
 =?us-ascii?Q?1HVmpX0EuTxwmBFgCVwX+dz6VYtQiuY0Nh/ovnsA9jVgh0V3weFSBk6B6Bwj?=
 =?us-ascii?Q?oJT9XEC5pXSsN36BZFY/XbpSzGRYyjK0RaHT5r1B43iIwTGCY3MACEccU1tK?=
 =?us-ascii?Q?Y1UKtHjtYk4Mqh48nmB4kY8dBL8NZH/AAI9OAjONWck+l8s2vmUeeKyzPuTH?=
 =?us-ascii?Q?6HW17621PKi/K6dmtPY3JbXisqHkNPB3DBYv9YRn5FaaxnKgLszpWtIcef8m?=
 =?us-ascii?Q?7rDMIgDWCkjduU+ej/gVRR320LHaiFeCAVyWDj19tTVpqwxhaeWeyyx53Erd?=
 =?us-ascii?Q?wg4QMZwLTFNdu/YYVsB7WTjx0TZDzBZowrDTVgxs9ICSzN49GQ8RjVMjRcrD?=
 =?us-ascii?Q?ElFHDLsn3iEVaJQy3KgJx/7lmB0dsN6vIsOgGWxhE92azOeP2iASxlJ72/In?=
 =?us-ascii?Q?vV1S8E164IFc3saCc/crJZ9scSGyti4UDlvB1XyikBcL1/l975R+chjlmNi3?=
 =?us-ascii?Q?ShqsZJFUlY5DTrJRrpanMRPT1MOTZUcH/cVlJ5S5xxuZyZOL4AYErfCn+yWR?=
 =?us-ascii?Q?NDxeJq6wSmgjMsDuAk0vyt1e7pd8VXI2A7IfxNi9e0S2XZblCZ/C0hurtmHl?=
 =?us-ascii?Q?CiliIZkV8RmWunadzLwvc6ArI3vKnn+URnhctl7pYsDJMUO7ffEw/z7CAzrQ?=
 =?us-ascii?Q?zKmGinWKh3tf9llKqiSyQKSh9oWrYLK/vSkQGVrl+7jFJe8ga9nym6YSh1To?=
 =?us-ascii?Q?pX8Tueu+P/MiQ8gxPwVETLOrxdNMzeSFpbRigOih8EKBxM6JcJhbPLybU0Hp?=
 =?us-ascii?Q?sKjtawdkqLJOoF3spV9KfPVwSHV1rhAoioAhRsmmGnZQUHZOYq+dqzeeAdre?=
 =?us-ascii?Q?y6ZemNI3Iad+co/mFeL965a9LX6uT2P0Ku8BQYUiuDBTiiQmrxWRt2Jn/tWx?=
 =?us-ascii?Q?eGXlzjPlDRYym/Z1H9/84pGnnNHHexYF/9MFPaQox8JiWIc4WU8XwpSdj0hR?=
 =?us-ascii?Q?y+SD7sGqZKb/B41/TKkN+i4RTMInxAZ0kIEb3kPygDiLO0unjkvg6JzQUwsZ?=
 =?us-ascii?Q?HpW+szKofx/ICARgSm4AYLvNqUkqoTH219NlLH0XQEPUjoQPnhQEvkR2CSIw?=
 =?us-ascii?Q?FOkAtzWxhZjsHoO4J3sF0TpMDjH2HptBD9SHF+ELQObgvF9rNBHR4n6Z+mE+?=
 =?us-ascii?Q?DSBPF1RBBY5d/Tub76kyLeWLF5H2nE2/HtwDm0T+CwMgg3Ks9IPbkTiiuVjz?=
 =?us-ascii?Q?MvDx3AgrMQ1jpChK9TE/bmoNBTQWPUroMIR0VOw5hCPNCMmt9FTdx1oHUO6c?=
 =?us-ascii?Q?M/dF2eXrFG47C3cbWzZotpu9NIzR8k6hS/mBSozFhMeBYSFykYEuZNC4KiRz?=
 =?us-ascii?Q?UypknypO6ecvmIDLAsdLJ3EgcItC4GwDFKhkLq7QO5yVE70RDhwF1voZ6EiG?=
 =?us-ascii?Q?gn7NwlT+Dh4tHfOJy3VuTpFmYEc7WfaLLgiHIbXbyDZhLOc7ctZZQjpM+3Sy?=
 =?us-ascii?Q?j5u51ogwUb60bGa5YfQsfIgTj5cHL3kxOvFztAQ4tUw3peq4K+DRCIQRxtpZ?=
 =?us-ascii?Q?HNEE3enQpQ5MgYgFFcFeV+CBLk9MUVm7BKZliynZUNiJZh8DPxnSL0n6RkSu?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5d51a2-1286-44c0-ef0a-08db8fcd5659
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2023 00:47:08.4726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvGVmNDrH5qUeaqhEp3t2AWY+gYEL8EWbiFtesEipphtxsaX0gdA6h8NYXP0nx/ZDCatPOX/pAesTRMSdfnaWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8877
Cc: taras.chornyi@plvision.eu, andrew@lunn.ch, alexandre.belloni@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, simon.horman@corigine.com,
 jdamato@fastly.com, kurt@linutronix.de, edumazet@google.com,
 anthony.l.nguyen@intel.com, ioana.ciornei@nxp.com,
 gerhard@engleder-embedded.com, wojciech.drewek@intel.com,
 UNGLinuxDriver@microchip.com, horatiu.vultur@microchip.com, lanhao@huawei.com,
 louis.peens@corigine.com, f.fainelli@gmail.com, leon@kernel.org,
 linux-net-drivers@amd.com, Steen.Hegelund@microchip.com,
 jesse.brandeburg@intel.com, kadlec@netfilter.org, huangguangbin2@huawei.com,
 joabreu@synopsys.com, intel-wired-lan@lists.osuosl.org,
 linux-arm-kernel@lists.infradead.org, kuba@kernel.org,
 d-tatianin@yandex-team.ru, pabeni@redhat.com, yisen.zhuang@huawei.com,
 pablo@netfilter.org, linux-rdma@vger.kernel.org, grygorii.strashko@ti.com,
 aelior@marvell.com, daniel.machon@microchip.com, idosch@nvidia.com,
 wenjuan.geng@corigine.com, claudiu.manoil@nxp.com, coreteam@netfilter.org,
 habetsm.xilinx@gmail.com, hui.zhou@corigine.com, peppe.cavallaro@st.com,
 michael.chan@broadcom.com, linux-omap@vger.kernel.org,
 lars.povlsen@microchip.com, petrm@nvidia.com, zdoychev@maxlinear.com,
 salil.mehta@huawei.com, muhammad.husaini.zulkifli@intel.com,
 wentao.jia@corigine.com, manishc@marvell.com, netdev@vger.kernel.org,
 oss-drivers@corigine.com, fw@strlen.de, linux-kernel@vger.kernel.org,
 shenjian15@huawei.com, ecree.xilinx@gmail.com, netfilter-devel@vger.kernel.org,
 shmulik.ladkani@gmail.com, mcoquelin.stm32@gmail.com, rajur@chelsio.com,
 olteanv@gmail.com, saeedm@nvidia.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 net-next] net: flow_dissector: Use
	64bits for used_keys
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

On Sat, Jul 29, 2023 at 04:52:15AM +0530, Ratheesh Kannoth wrote:
> As 32bits of dissector->used_keys are exhausted,
> increase the size to 64bits.
> 
> This is base change for ESP/AH flow dissector patch.
> Please find patch and discussions at
> https://lore.kernel.org/netdev/ZMDNjD46BvZ5zp5I@corigine.com/T/#t
> 
> Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>
> Reviewed-by: Petr Machata <petrm@nvidia.com> # for mlxsw
> Tested-by: Petr Machata <petrm@nvidia.com>
> Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> 
> ---
> ChangeLog
> 
> v2 -> v3: commit message subject line fix as per comment of Petr Machata
> v1 -> v2: Commit message typo fix.
> v0 -> v1: Fix errors reported by kernel test robot
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c
> index 2b80fe73549d..8c531f4ec912 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc/ct_fs_smfs.c
> @@ -221,16 +221,21 @@ mlx5_ct_fs_smfs_destroy(struct mlx5_ct_fs *fs)
>  }
>  
>  static inline bool
> -mlx5_tc_ct_valid_used_dissector_keys(const u32 used_keys)
> +mlx5_tc_ct_valid_used_dissector_keys(const u64 used_keys)
>  {
> -#define DISS_BIT(name) BIT(FLOW_DISSECTOR_KEY_ ## name)
> -	const u32 basic_keys = DISS_BIT(BASIC) | DISS_BIT(CONTROL) | DISS_BIT(META);
> -	const u32 ipv4_tcp = basic_keys | DISS_BIT(IPV4_ADDRS) | DISS_BIT(PORTS) | DISS_BIT(TCP);
> -	const u32 ipv6_tcp = basic_keys | DISS_BIT(IPV6_ADDRS) | DISS_BIT(PORTS) | DISS_BIT(TCP);
> -	const u32 ipv4_udp = basic_keys | DISS_BIT(IPV4_ADDRS) | DISS_BIT(PORTS);
> -	const u32 ipv6_udp = basic_keys | DISS_BIT(IPV6_ADDRS) | DISS_BIT(PORTS);
> -	const u32 ipv4_gre = basic_keys | DISS_BIT(IPV4_ADDRS);
> -	const u32 ipv6_gre = basic_keys | DISS_BIT(IPV6_ADDRS);
> +#define DISS_BIT(name) BIT_ULL(FLOW_DISSECTOR_KEY_ ## name)
> +	const u64 basic_keys = DISS_BIT(BASIC) | DISS_BIT(CONTROL) |
> +				DISS_BIT(META);
> +	const u64 ipv4_tcp = basic_keys | DISS_BIT(IPV4_ADDRS) |
> +				DISS_BIT(PORTS) | DISS_BIT(TCP);
> +	const u64 ipv6_tcp = basic_keys | DISS_BIT(IPV6_ADDRS) |
> +				DISS_BIT(PORTS) | DISS_BIT(TCP);
> +	const u64 ipv4_udp = basic_keys | DISS_BIT(IPV4_ADDRS) |
> +				DISS_BIT(PORTS);
> +	const u64 ipv6_udp = basic_keys | DISS_BIT(IPV6_ADDRS) |
> +				 DISS_BIT(PORTS);
> +	const u64 ipv4_gre = basic_keys | DISS_BIT(IPV4_ADDRS);
> +	const u64 ipv6_gre = basic_keys | DISS_BIT(IPV6_ADDRS);
>  
>  	return (used_keys == ipv4_tcp || used_keys == ipv4_udp || used_keys == ipv6_tcp ||
>  		used_keys == ipv6_udp || used_keys == ipv4_gre || used_keys == ipv6_gre);

Probably leaving the style alone here, and just changing the types,
would have been a better choice. Anyway...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
