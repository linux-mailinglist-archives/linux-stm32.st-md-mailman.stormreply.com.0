Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC07768DD4
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 230D9C6DD92;
	Mon, 31 Jul 2023 07:17:30 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C7D1C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jul 2023 16:30:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRMvA6Yhc50kIrAvDdLMqEDs1VD3Swks8lUN3Zewr/PYp60qBPGdRwx5a33MlvsFvsN3SB4iFogUB1vk83vSNGPE1h1rrVVHcu1OzsTQfsMrloibm0nrw4egiwMdXMAGoYBXQl52c8RHsOvSGuVF6cKZP4dwKwlYehOGWWKK1uDimwpEK95zlmBgkr8Eul+GHkPr/Mjhi28udfFqIXJFPaHfR203N88ve82vwSZP1FstwZ9njjAspDT6wevaAZ9rKjOd1AuYndEkSRmHnjHWZDblDZ1IV9iv5hg9I33IKDYJ7WsR8yBQdBMD8G8RUL58xKy0FPVMuVbAfgvROL9ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36d2jc9cZ1Pm+1+xvHQdeLIsW74rN05+z9bDj0qsIBo=;
 b=jdfoP5jZvZF0gu/oVaDQbVNim0txwT+/MItCvXNyybwNUKiIW3G1yrC6LRiUJfIpXAPFiZg5bBpvKps/VzXCTJqDRAHbcSu2qDLspGawmVef6csePHeLjh4u1uxK2mjhf7PtH/WKRm0jH5obtKJ8l8J2wVAaZHok1dn4ME6c0vUMxpYuS+v0qpf8VfrXB2wWGiQ6V1JmBRthQrgYtE7VoWmIihJd47nMrh5evIWB84WCpmUxSjlzI6cs81VAZhQOcAQi8l9y0vGavrIYZMqiTDoXRsA7ttKTp/8BWJmGGrm3RWJkVokmr2ITLD9bzW4l/Begf/o3b0jSDlDtwT2DDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36d2jc9cZ1Pm+1+xvHQdeLIsW74rN05+z9bDj0qsIBo=;
 b=DfV+PR+7ZfAdbfZbpQCGHA5kBde1wW1VqwXY75fU2hzdoS1iIvaOrO6VyBDLauLZZrcAMo0QR5shmTrGu7P2c1mYWBoLUNHUqPMvW3I0GPNPlpLikycKLG4ErPP3TEjjZD5npuzXe7H7Uy08dPRubANaWGbdXQF6lG1f7ev8AgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB8914.eurprd04.prod.outlook.com (2603:10a6:20b:42d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 16:30:04 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 16:30:04 +0000
Date: Fri, 28 Jul 2023 12:29:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Will Deacon <will@kernel.org>
Message-ID: <ZMPs+sOIzWR0LmrP@lizhi-Precision-Tower-5810>
References: <20230727152503.2199550-1-shenwei.wang@nxp.com>
 <20230727152503.2199550-3-shenwei.wang@nxp.com>
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
 <ZMPdKyOtpZKEMLsO@shell.armlinux.org.uk>
 <20230728153611.GH21718@willie-the-truck>
Content-Disposition: inline
In-Reply-To: <20230728153611.GH21718@willie-the-truck>
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: d5027379-098a-469c-d080-08db8f87e59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fNZBoCmB/AklSsVWxQczVXvmLsPz2hzoMvHm+2F/QLE41dv4Hp5gVy4DRRi0gQ8smJQnjdjVgy2YgU4URFfZo0cKR+3UkwYM5q1/1Mz3cm4OMil5/Sx4jGul5ipeSP7F5L0giLHN+r4TKyX8lZVpTrxzC2PVjprqxx4gQbJRulG52Xy2CMJXtfOUbWnaRGYn5qGalC34e/AJ1z6yYh1Rc0KpHtxDzqVQKtPD57t1z9aHgx3i0qecUpBpPD7k1a5DVCn0nhWQBeXXNFfcjLt2eYoFFXG1M7G5fH0DXN0aynLxMQ+I1xWq4FYBeym/w2Ed0p6r4IyYQnrf6nt3xn0233DAgrVzSfgRUImtcfc9s/bOgEmVOJeHkWc3e7MAeP5NZxeafiufVZxZ5eGRhXJHEUiV66Dwvdrm8Gr1JOd6NKuQ5LbNj2VRtdxS7sBkL28rKr/XHwqF+y58J//F8KMDCAA14nfyNlWTLJogOl6CCjeH9vM1lSqE4JCgHh2rclDKmlUW6OXCOxQXDw8h9GtL6+hvkJ71F4VsjGu6869sIlA/XUTAgltg9gOO6f36tTQFIiLuimaXr8u7fflXJM1/ZGpII5+RCJn1LSxk6ax/l1RRyKkjBGgM7DgQDZFKJPyP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4838.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(7916004)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199021)(83380400001)(86362001)(8936002)(5660300002)(6506007)(54906003)(966005)(6512007)(9686003)(478600001)(6666004)(6486002)(316002)(52116002)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(186003)(2906002)(7406005)(6916009)(26005)(7416002)(33716001)(38350700002)(38100700002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0JCEWwfr+l4iWIHTUlfdxXjua4I7Qz6br89mX0wXGLEvKdHR6oSmZMq37vnc?=
 =?us-ascii?Q?9qRx/yWtnxeVY2aYyW0NkQXMlX7NFPioc9zOdqUQR6EM7of98z1Om6OyYbTI?=
 =?us-ascii?Q?thHwqxEdoqI3rBXQ2dVurM+pQQhaCmxIK/R9cP5003x87Y2IR8ZTEKPGhMjh?=
 =?us-ascii?Q?8eKAoMNFTC5Oh9woHt5fnNtGwEm2E2KAZmF+AcAfu1Kp8ifOMkRNwJ8Lx56E?=
 =?us-ascii?Q?sA9zz+GSQSjYBUSqFLiC19DG/+zLeuYpRmiZid2YVgUZjudI5Z8vdpp9sDP8?=
 =?us-ascii?Q?OxSQnXp5RpU/MBaJsLY70eHNeOVse0Fj8VKl/G376gNah7PZ6jTwdBdovFLe?=
 =?us-ascii?Q?8T6FsTgOSRAha9gvwV2JKgASkl7VvX4ELihaLcMv/HDFSdMZVjF8BEWLxYBs?=
 =?us-ascii?Q?wmogMkIWF1OwvqBtRAQbDO5zMeOWosxlWKBUYVSrkFHJOG9v9OvVPPg193ad?=
 =?us-ascii?Q?2UAJ614GIx+XVyLipNj0/3NL1D8t14e/c/ZKDUHtkNIEGO+E569Of0HfGSVR?=
 =?us-ascii?Q?mkBiKuG0zzxrpulThf8obQkcyI6O81GlPbQeqiBT8NDQ6cSr//FJnq2tPiHM?=
 =?us-ascii?Q?SYu6P32fQCCGkBzBp/gEEs0ATgwK8fTL22p0Y3meQDnyFPDK0sHBL1DOQL6b?=
 =?us-ascii?Q?jtZWnBXslYyXgmt8kOryMxenlwn9DpFvp9azF8JCDzlGRRhn76z8VvEKss7w?=
 =?us-ascii?Q?accjGwmG0iJDr7lQKtCP44ySVXfbKVuoaRgnvSUV2ouyqG4m6HXKBoor28tn?=
 =?us-ascii?Q?ZzrvhtvMPBUO0vGRe5wlvp9/Vo2Ker7zH495o8azJ7Rsm0A+OH506LBXvEAk?=
 =?us-ascii?Q?BS1CU6WkR/g6AQS/E44BX4YMgiBbcEVH5zXtXILwMexjC9YlT+v39GJs8kZM?=
 =?us-ascii?Q?mZxKuBhMPETds/WS88zMXo/pahoqfRgrIQdELHx3xCIrhziTlNqaUeQa7TVz?=
 =?us-ascii?Q?X8FFjOEaASadETO565WTme/LpovYmaRyb6BEhSs1h3SNQXZlsIsPYQF/l7BR?=
 =?us-ascii?Q?oGMKMVnvlB0QzdigBJUwiux7va6cWDz9eRTB6Mz4kjhcKzAcCuEcbMKiyS4w?=
 =?us-ascii?Q?2etJdXtV5WJNruY9LcYPqwFO2xpNdohQ/+GfDlADt8FbcGZnzLiphZzhB5az?=
 =?us-ascii?Q?hi3Etttz16eYmVjPw5PvkzJv84CqAQgCdyi/d0G6iKO2tFkDUbS1+xNfTjL1?=
 =?us-ascii?Q?7T26/v5tG9AbYk8Gi8h91W5JSQn93Q5ZttMnRX6a6wYyY3Bab88h8P8Gbv62?=
 =?us-ascii?Q?j53Zz70Luz6EM4ceTo23QwonTLOnxuDyIk2m/R/qAAI2ybDBavzA1/AneZDj?=
 =?us-ascii?Q?p+WRYDkbwDx4GC/BerjYlwwpvH74Rmr/IOYQQBm2HCjlwBPbr/Z44qUwH2cx?=
 =?us-ascii?Q?tfDkWhokOcOYg6/Amxw9m++B11Qr1DFTAHSGdIZVSJmAHls802ebJdCog5U/?=
 =?us-ascii?Q?UESmdOCfUCl6fOP+2kRZyWNzI1dZUf9uLUl1+UN+QnmoRG7jcsoutrw9Km7T?=
 =?us-ascii?Q?0ihFpV38oyorqd4elMQ1bgjzp+BtOtVmHrZwanec8CGgwokskkz0ef3z0fOL?=
 =?us-ascii?Q?m4l859yJFTjR4OZ+YaI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5027379-098a-469c-d080-08db8f87e59f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 16:30:04.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XacQSG8hN98OLGu58MKydZSHGIT+HPx0m2rHYUGX74mD+zYRIscKCanqxYbUCkEVgkbv/QAfg9UxtvCNfkEPaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8914
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: imx@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
 Eric Dumazet <edumazet@google.com>, linux-amlogic@lists.infradead.org,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Wong Vee Khee <veekhee@apple.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause
 the TXC clock in fixed-link
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

On Fri, Jul 28, 2023 at 04:36:12PM +0100, Will Deacon wrote:
> On Fri, Jul 28, 2023 at 04:22:19PM +0100, Russell King (Oracle) wrote:
> > On Thu, Jul 27, 2023 at 01:36:45PM -0500, Andrew Halaney wrote:
> > > I don't have any documentation for the registers here, and as you can
> > > see I'm an amateur with respect to memory ordering based on my prior
> > > comment.
> > > 
> > > But you:
> > > 
> > >     1. Read intf_reg_off into variable iface
> > >     2. Write the RESET_SPEED for the appropriate mode to MAC_CTRL_REG
> > >     3. wmb() to ensure that write goes through
> > 
> > I wonder about whether that wmb() is required. If the mapping is
> > device-like rather than memory-like, the write should be committed
> > before the read that regmap_update_bits() does according to the ARM
> > memory model. Maybe a bit of information about where this barrier
> > has come from would be good, and maybe getting it reviewed by the
> > arm64 barrier specialist, Will Deacon. :)
> > 
> > wmb() is normally required to be paired with a rmb(), but we're not
> > talking about system memory here, so I also wonder whether wmb() is
> > the correct barrier to use.
> 
> Yes, I don't think wmb() is the right thing here. If you need to ensure
> that the write to MAC_CTRL_REG has taken effect, then you'll need to go
> through some device-specific sequence which probably involves reading
> something back. If you just need things to arrive in order eventually,
> the memory type already gives you that.
> 
> It's also worth pointing out that udelay() isn't necessarily ordered wrt
> MMIO writes, so that usleep_range() might need some help as well.

Hi Deacon:

Does it means below pattern will be problem?

1.writel()
2.udelay()
3.writel()

It may not wait enough time between 1 and 3. I think the above pattern
is quite common in driver code.  I am not sure if usleep_range involve
MMIO to get current counter, ARM may use cp15 to get local timer counter.

In our system, readl() is quite slow because cross some bus bridge.
even readl() can work, we don't know it is because delay by readl() itself.
Or it works logically. Suppose readl() and writel() just guarantee memory
access order. 

Frank

> Non-relaxed MMIO reads, however, _are_ ordered against a subsequent
> udelay(), so if you add the readback then this might all work out.
> 
> I gave a (slightly dated) talk about some of this at ELC a while back:
> 
> https://www.youtube.com/watch?v=i6DayghhA8Q
> 
> which might help.
> 
> Will
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
