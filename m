Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A4A4A57F1
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Feb 2022 08:42:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26526C60471;
	Tue,  1 Feb 2022 07:42:53 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFA5BC5EC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 18:31:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5Hgzp9J3sweKvDceGheWVljEURHpzmdYsO2EoCIVIO3Iq3M+yAMNpRqKvqZ/197UnX3fYi2kS/8hHd4LDmQkiqWWV91jQ3fjobzdgqxh6149L5m3y+hah0LfVacC9l00Cqcd/JiPklYMkinVZU3m1r6RV7EJ6+l0REVSCd20tUlSIiQ+vlIy3fRAKpsQxduGYbWEjPPHVcpDOQI5yjgZaA5aLyftnJ+zir5+Kso0UonfEhc/uGDnIFxZiWGip0jtZNyQ4B+NQuCXTLKK5x1Sgf6ikkkt+dJpZaBieM1tUPrpxRp2vWx64CQcC+XBB6n7PXnR8VD84TCgMd8ci6JSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjiSP917Cj0/Jwj+IfHlTne822aryGdxB/ai1WKhRmU=;
 b=K7/EeK6MP2pcxjBBCnj4JWP3cdAa01RnZBIia9nvW1zGCmSpUGoQdeGgxeekPe4sSBhksC7/+GA/LBXUrPXbbRlwLLfnuFcTnKh4QPBh9ICcedcw7dtdLZgs81/qP6ghnEN6fDN0j0bi7NP6DVW/wQ6wz/VcY/Vh+ushtOiZUJiTfx0vLrsVYLT8r4sBr/YeYojiTOTg9pYdqnqhRGCPVBGPKgIb4zHR70EkO74ywv3gR54S9UpBPMl19xFV1GPg5mFzZFH8cY2F0X78qWvxmspRst0UyWEEyyVaIOmB2s+9xsf5Td+KOyribrj3omnPt6CL8BXo2hpQNfxeF9dx4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjiSP917Cj0/Jwj+IfHlTne822aryGdxB/ai1WKhRmU=;
 b=DXmgAPk7NrRtFGXSi96kZfgRfakD6UwKDReEg5bvwvCW+YRMCi3Cl1LOKriEAbKoyhTRWV04rxBv/YG6Z6yep3UaySsxulo5Jmwc72X0BbWeDGpY+7Iud7NzhOyVB6RmM6x+7glO5GUb9kEOtKDjHp1fqb3xXYWnhMvhv3aD9CxQL9ECgoWQqngY24KC7H9GKtA/q8msyEPK6gZp6OO5+/b0DiTTigkBgulpBNyRe+yhr+hQDyYxvIxFzU89OqM8m1XieDRhGY2eMcANgdpC8xnJpheOa9wVAocEQfHSzhSWYJEvA+5SIVmrFHT0uYXtJ1myaXiup4c9uNqTg2TPfw==
Received: from BN9PR12MB5244.namprd12.prod.outlook.com (2603:10b6:408:101::17)
 by SN6PR12MB2784.namprd12.prod.outlook.com (2603:10b6:805:68::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 18:31:15 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22)
 by BN9PR12MB5244.namprd12.prod.outlook.com (2603:10b6:408:101::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 18:31:14 +0000
Received: from BY5PR12MB4209.namprd12.prod.outlook.com
 ([fe80::35a1:8b68:d0f7:7496]) by BY5PR12MB4209.namprd12.prod.outlook.com
 ([fe80::35a1:8b68:d0f7:7496%4]) with mapi id 15.20.4930.022; Mon, 31 Jan 2022
 18:31:14 +0000
Date: Mon, 31 Jan 2022 10:31:11 -0800
From: Saeed Mahameed <saeedm@nvidia.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Message-ID: <20220131183111.4yebinn5zp42asil@sx1>
References: <20220131172450.4905-1-saeed@kernel.org>
 <20220131095905.08722670@hermes.local>
Content-Disposition: inline
In-Reply-To: <20220131095905.08722670@hermes.local>
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To BY5PR12MB4209.namprd12.prod.outlook.com
 (2603:10b6:a03:20d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f834c361-7fad-4b65-6317-08d9e4e7dc2c
X-MS-TrafficTypeDiagnostic: BN9PR12MB5244:EE_|SN6PR12MB2784:EE_
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr,ExtAddr
X-Microsoft-Antispam-PRVS: <BN9PR12MB5244DC5BB24E6D1ED1C1B795B3259@BN9PR12MB5244.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pvOqOEL+dUhVqXe0OQ4NRjiw0y0pdseaWwjqtpUSfg/AY5KjFs6ar5NexOa6Cj2s4LVM/FVLcxa4XoGtYzfsvKceAsh3mSLRHGdRjefUaYBLmQqtlaYN49TDDIBHrIgTc22bt70v8EsfKjjjbZEW1q+A8B0FuijICSXBbXT2Lz2+qC6x2jUwzsQdWVxMnU6kYWcJjoNXPToVvR9HWF35tfK1jJZfbFonrxRI6BnF7Whsvy+wuXyXtXUD7IpB+8mcfSUlR6ep+DZC647cO4T+eHiKb1TaAimQIgRqt80UyVUG/xERP8lyMhwnk/sTYlEwg0l+qBrMt6cVxfwb6JHS2cSrT7Mbx1wtzn2WdKEDiUUq+LVc3MGSJFDyogSrQoGvXXUowcF9Jz4EH4fTRi3/QqQOfgLme9S49l32M0NhaXHIR84Tast1eBV+rtLRNLlBgfA+Iuus+VD+aeEGiEvp66X6RvPCtVUbiLn7gjtbzjty9Oxl3ju9yJiaiH0vpkyI3WEnsVWIZ1dydo9h4RhMeHNiFHiZ5anCfI/fxVaQQ0anERM0I9ylA5wJDbW/cjJx40pi6Usis0BT7flk6TMgeEySqk5KZc2GLxzcgUMhqJshA49TpzvWp2v/kRyR3k4yG7b49/4Naa4cKEtnzKzBpjQfUHUQOcVgf0o71/YE9Md4lBY7pmw1dFd4uq5vcGaFxMNGixIC0hJ/Q02/Xs9m/FtvBPu3xHrvBJ3h2Losq2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5244.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(2906002)(1076003)(26005)(186003)(33716001)(6666004)(66946007)(38350700002)(38100700002)(6506007)(316002)(52116002)(86362001)(4326008)(8676002)(8936002)(66476007)(66556008)(7336002)(6512007)(7416002)(9686003)(7366002)(6916009)(7406005)(54906003)(5660300002)(508600001)(6486002)(129723003)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3Nk4/Fr1GFhW5WHic3d0lOKtey/V7Pe3tezjTvQxWGQ1o+7Q9xkM1I5wPSo+?=
 =?us-ascii?Q?bw6zSW7sBbsAXLF2a1AAsW0qKn4QQ3/QqDtJhmLYEXp3MwV2NU7d3CkLGt37?=
 =?us-ascii?Q?8vGMVEsvFTZoUKRI9cV0XzbGGKAFlnAu7/dzm2xb5g3hZDG6P2zaFXuaqMEH?=
 =?us-ascii?Q?hfc8tjzSkPKumejGDDoI3sRhFuNyZqSyuSGJrJmeI9KtrCiUIKoU5prM2ePN?=
 =?us-ascii?Q?jTKYF5wiwWtI9VI0ZFM0qyKRjohBSjuYCeMoCKqkTktZwDW6z0bttTXvsZVg?=
 =?us-ascii?Q?a9AIosw58jZeLCdgXuBsUgiEtrJEPitTqgL71PGBDT+dvZMctBxBK5QH35K7?=
 =?us-ascii?Q?0z0qurmRW5i1eAEhDh5d/ZVjfsnhGhXtcba2QBbjEcNCka5lxp3YbLBQWL6j?=
 =?us-ascii?Q?D9m1utRZ7Vul5TV/XcahjKZyaSOUxhDdzFlVxVIXaazbT1f0FxuJmoYipT2i?=
 =?us-ascii?Q?6dPzK/4r1eywKw6J6JvWV+kZ40iRNanBj8uAt1WmJ4+rKYr8XbIq84fCxDal?=
 =?us-ascii?Q?/CwKDGX47Z/zbC1mEuQUkjrruBvLiJIc5S8SiM/iKIGnlVn2sB8w44tkaNUQ?=
 =?us-ascii?Q?Qg2G3XGMo+Y0Y/j5A3B5NOgLdbKQ0t//fON92aIel2yTpkUwEZIs8TEZC5ko?=
 =?us-ascii?Q?O+tZZqD9QN+uKpDEY4BY1TfpvFN3AHKk1awyex4eC58bYMHL9p0o9Q7AIzJ0?=
 =?us-ascii?Q?1rm/uKikfw1JfNa85wjMvNCwVv4zpBiEWVdiNFheUWPz+Z2zSCnBJcqsprRF?=
 =?us-ascii?Q?uy09Jv3vTHbG8ZWi6ds/DwgkpGowyNLdnqCN5owAnPq6h5pkv7tXTyOD0KCf?=
 =?us-ascii?Q?0lpXJaCJlPWGs3uagB6yapkqLNVvQL+B1vEcComvi8zllflVHqzfT9MiRMH7?=
 =?us-ascii?Q?lXqM2boc3z7HG7etWa8gqGLZZlMyXYm0FNRSTlsJkcLyENuYSNbYa2FdPE47?=
 =?us-ascii?Q?S5Bifuq2DwV6TOGZtjss6wYjHuL21kzCfqQktEPamscHCVeyM6M8wYAgXQTV?=
 =?us-ascii?Q?N1qB3VhRlaA4KPAOYd99+2Kn1bODGYZ9++9MkFIPFv0+KfNEDttozochlgqZ?=
 =?us-ascii?Q?+A0h5o9DCDmO87s/DtDxNgFsUAyyqQC35QfyGUOnvIGUXRQIiD7milbO22ow?=
 =?us-ascii?Q?FUZRaim7AnX7IpRfiFecUsfn1gjKPZTG/daa5nCrxABqkRlA1Syw8w7qAN1D?=
 =?us-ascii?Q?NsO1ZNW077HR8cSSqxom2W50d1dpguVWQfkWwW/1mEwZuY7SNNF9pDjOa8V+?=
 =?us-ascii?Q?QuvBj2KSYsezBdea11vB/HxwWxWnFMCAC965ut0qR3ezQ3TxeCsQwWn9SA64?=
 =?us-ascii?Q?5fElTPdQJS2Dk9lzl45EUftfec3NckZ4TrxU/wDlhjJUcLcTrAEmBu1ROXKT?=
 =?us-ascii?Q?ZJZaKUvg9ZiF+7gXlZwyHmyoqR2qiLAL0jLatxLYoYGKhEN2O2afHvShNvIU?=
 =?us-ascii?Q?UDNDDerF9wjTMQETtUP5P8slZZXSoJxbavyRXQqJZsIwgfO9Tv8uUS2UOHzi?=
 =?us-ascii?Q?c24CHYruPwGQhN/NV+XKVAnu2xv9is0HXn+4DdoURqOiJPiiovsUxORg9b/w?=
 =?us-ascii?Q?4w1IvZnguq39QYEmgLZU9ipfQZOy++YHlYv8dRZapH0e8aq0M0ZEHVLTfmT/?=
 =?us-ascii?Q?pXHtaQgC1c1N9s3odsPJ/fs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f834c361-7fad-4b65-6317-08d9e4e7dc2c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4209.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 18:31:13.6641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y23B3lKPpvhoxS86UJR92LJ+g4zCzGX4X5N0TQ7BI0S3K6PAc+DBGPBLWPZ/zOjl115P7Iy76sJxixpCyBQzoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2784
X-Mailman-Approved-At: Tue, 01 Feb 2022 07:42:52 +0000
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Awogbemila <awogbemila@google.com>,
 Linus Walleij <linus.walleij@linaro.org>, rafal@milecki.pl,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Andy Gospodarek <andy@greyhouse.net>, Edwin Peer <edwin.peer@broadcom.com>,
 Wei Liu <wei.liu@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-sunxi@lists.linux.dev,
 Jiri Pirko <jiri@resnulli.us>, l.stelmach@samsung.com,
 Shay Agroskin <shayagr@amazon.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
 Shannon Nelson <snelson@pensando.io>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chris Snook <chris.snook@gmail.com>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Arthur Kiyanovski <akiyano@amazon.com>, Stefan Wahren <stefan.wahren@i2se.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Gabriel Somlo <gsomlo@gmail.com>,
 Rain River <rain.1986.08.12@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Shai Malin <smalin@marvell.com>, Maxime Ripard <mripard@kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, drivers@pensando.io,
 Omkar Kulkarni <okulkarni@marvell.com>, linux-arm-kernel@lists.infradead.org,
 Vegard Nossum <vegard.nossum@oracle.com>, David Arinzon <darinzon@amazon.com>,
 UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catherine Sullivan <csully@google.com>, linux-hyperv@vger.kernel.org,
 oss-drivers@corigine.com, Noam Dagan <ndagan@amazon.com>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
 Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 Saeed Mahameed <saeed@kernel.org>, Liming Sun <limings@nvidia.com>,
 Michael Chan <michael.chan@broadcom.com>, Salil Mehta <salil.mehta@huawei.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Oleksij Rempel <linux@rempel-privat.de>,
 Edward Cree <ecree.xilinx@gmail.com>, Saeed Bishara <saeedb@amazon.com>,
 Mark Einon <mark.einon@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Slark Xiao <slark_xiao@163.com>, Gary Guo <gary@garyguo.net>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Jeroen de Borst <jeroendb@google.com>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Prabhakar Kushwaha <pkushwaha@marvell.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Richard Cochran <richardcochran@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 David Thompson <davthompson@nvidia.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: kbuild: Don't default net
 vendor configs to y
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 31 Jan 09:59, Stephen Hemminger wrote:
>On Mon, 31 Jan 2022 09:24:50 -0800
>Saeed Mahameed <saeed@kernel.org> wrote:
>
>> From: Saeed Mahameed <saeedm@nvidia.com>
>>
>> NET_VENDOR_XYZ were defaulted to 'y' for no technical reason.
>>
>> Since all drivers belonging to a vendor are supposed to default to 'n',
>> defaulting all vendors to 'n' shouldn't be an issue, and aligns well
>> with the 'no new drivers' by default mentality.
>>
>> Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>
>
>This was done back when vendors were introduced in the network drivers tree.
>The default of Y allowed older configurations to just work.
>
>So there was a reason, not sure if it matters anymore.
>But it seems like useless repainting to change it now.

it sounds like it's useless to have it in first place, and it was and still
confusing to me why vendors need to by Y by default, can you explain what
are those "older configurations" ? 

The idea of this patch is to set a better example for new vendors and
to have a leaner  .config

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
