Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF273A366
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 16:44:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 229BFC65E4F;
	Thu, 22 Jun 2023 14:44:08 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2118.outbound.protection.outlook.com [40.107.243.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F37BC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 14:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AllV9syy3hYMKddyLt1XSZOGP9LvGOvMUOG93fuOXT/f0VYExiq1FcYvoLoM8p+xcozUSuFTMyJMfqhk/4Qm4hDf25XZK2GuxVBFaR+y7cChjvb9P2EtXreBSPwCkJNTxwFekfUStnGd6oJUWTJndVip8jeJYbd0/8xdHaFJoNbNru+Iiyg4GsgKfA3UMPSjXgx+H3vB1PYPq1l51G9w3wgtXt4OfdORmCJdFEmYFx0THJmwh2d+C03yZ7vdMWF3m0BGMyqUUFkxJpvQn1lIu54ArRGFDThs+/QaweSwHNaOmbchbmiYOXFUuXmJOn6YhYpr3qurTgTEGqPnn+erxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJeY5ibdnpRmsomQfUYESaWdssHf40rWMh1d6/AIkI4=;
 b=EP2zApA/dwk4iLBj9bkjOMWOFGW5dcquvmMXkdBhls+77oX9/hLKJTstOzAqDaq40xvOWZhy5XrL6qC9PnV7cljcZmoH1f/tgSbPrvf727benzdl4AhR9d01p9/9QB1OaIQDfiFtKXyJ1afKrwgxDUgbc7ddZX/JLLNgeX4YzRX84nF4r1E9wcp+44s9GfesZSx4VrbD5hV5FDK0KmE8FqjFYUs7sy79f9qP0ZXzZaUCxSfvmMDODV18JmFI+XepIaFL6hUD4XrYKwaYWDhYul2oh/tZDL8cdu4MSzajsAiOHzPuu424QCiDaaCD7NYZzW3ax7g7mLdsR7MbRFlyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJeY5ibdnpRmsomQfUYESaWdssHf40rWMh1d6/AIkI4=;
 b=Hr/geyTCHIhxiolm98HQn67kihwb8TMzNZufAandRw99mqXu7MCaq82/0Rpplp+hsoce7Yjda0Ay3UtH3YtcbTasnQpXPalXy4wyd4wqaTvAw8omOO5NDxqSAMVfkIuJmQmjzSTLvxvS2iZKRTURwKZLakatBMiGZE/dAOVFf0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH2PR13MB4474.namprd13.prod.outlook.com (2603:10b6:610:6d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:44:01 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 14:44:01 +0000
Date: Thu, 22 Jun 2023 16:43:51 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZJReJ2yxqKGQx1BU@corigine.com>
References: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
 <20230622041905.629430-4-yong.liang.choong@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20230622041905.629430-4-yong.liang.choong@linux.intel.com>
X-ClientProxiedBy: AS4PR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::18) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH2PR13MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d523a9-53de-4e0f-ce20-08db732f1e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hk2/iYTQFVOXF8s5A1lsWFrtLIlh4SuyeouK5Z/kgUjyxZxIjAKZDexVLLIf6zwdDqbJkj8A2/LA82UZnRlqxzp1AsoVZZDuvmec1Ui5NHvmVN/Tn+1R0m8c5TwXmXEE+OmNlgekVRtzMfB4vgzWjVfdPXncjhThvZ47stGYI+qhvTKv1tdmiwQeyr0Tn0qobF0x8FBgBubFePhgS/A8CfV94VrQuXOZu0LUwUUUhtPGxV2PECN5QjtKnd712KhDVkA2FOJfmrVhPJ6cQgIbt/RugpQSmz6yyFc64hgR2+d2q560jF7GDHlmjRGSby5iPj/aWeI4B0HzhJIh479/leLp2Jwy5dUBdogzmo5PZL9OXDl1a1Qyzeukxu+nJja8WVPXv+kJai6Izy7ELsx8ukdxzTRDzPUyLwCxQi3Gq8CHbI0GjzVL91NX1Bu8qcv7FvtDmPfKFhMEew97SAZuOnqr6yh8U3TA9F2VnjFr/wYj1ypQ3Go6YAVdcxKnfGWNbMzl6K/Op9q6ztVec5rXjfXan+4uhcXA7JASt8nUQ2wy/vZWm3m+TNlFwzSbtxyILQBruTvBxr6aokqkMTl/VCpdpPCR7nCbLadE0foEZuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39830400003)(396003)(366004)(136003)(346002)(451199021)(7416002)(44832011)(7406005)(5660300002)(8936002)(36756003)(8676002)(38100700002)(15650500001)(2906002)(478600001)(6666004)(6486002)(186003)(54906003)(86362001)(2616005)(6512007)(6506007)(6916009)(4326008)(66946007)(66476007)(66556008)(41300700001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9dMpTHa43my7AJEr/qWdSpgNX8ZdFXhOAGifq7k+vhXt+gIfwnxCjzF2kBKF?=
 =?us-ascii?Q?1GX6Qd2vH2JvQSpRjxMVkSV41zEtw4vgVgpAgnZTSJFS0P5U78x5jNn20AQa?=
 =?us-ascii?Q?c/Uk7dCfzqGj47sexnXHJxCxacL456anYEPfjw6qMAhQEKFpq/7g/CIdOEUl?=
 =?us-ascii?Q?47Nd8K2fkjUuqCuwMG7otznPX1qnWLrKY9JVDMnJrpUDX9pPWRixbMcr4HJ5?=
 =?us-ascii?Q?Bl9HPP+u2Dv4qbwqmwrziqRubdNPtRQbA+tObmXhK1ddDBKZCCuhNq9VGrBU?=
 =?us-ascii?Q?8f+wF5pIAXv8XjFN6NNRtUlh7zRUZrxK8KSnkDOWllzXYDN/AYgfV9S5EA3g?=
 =?us-ascii?Q?ZlbKhw5eeTyQMV9boEAIls0vIzQYLFnIzoGOkmv5f+g2B4VO9VjeFmzCt0Zq?=
 =?us-ascii?Q?gzFiQgyHA9I/VZBK3yoc/em5qKzdG8tCm+aMJ0bnp2JZoRgOEEplrWlYlEmY?=
 =?us-ascii?Q?AiL5LwSO7WD1wk6lMGjWOFqTS9Ryln+u4VqwNjpX8m4oOZp0d0fzaSU5mar1?=
 =?us-ascii?Q?Y3hbqp2oaVduCcweN//ZMdQ+tV9joa1j+mFjUPpToREq6ffpyuJF2vcPpHP5?=
 =?us-ascii?Q?LLM10drRSPWs3Lnmn4ycaeDE6dHJGePZBWWSzqPNK3f+1DfbFJdfrpyLhJJs?=
 =?us-ascii?Q?DmtOEFtk7KeQC8qfcXbzYIr4amIcLP+32153SgK3l+aUySraKv/A1jnsU9Zv?=
 =?us-ascii?Q?/jwjPTHOIGblNR4SrotvQae+jKuVv7nQttFFish+h7ECsR8Nl3wL2miu86/Y?=
 =?us-ascii?Q?AQ3hhy+qnEPCOe13+LnVer9iR8BALiSnXOBzDVfGK0bDWr7DfrH4mGdPmJ0Z?=
 =?us-ascii?Q?rveNKe3uqk6Vr1Sd0fFNxUsyXiq5An/g2jDNHYSshXp/rNB4GQsGTWge5Hbq?=
 =?us-ascii?Q?wcvUUQr4yqqdsNXc+QUoiJ3eAeK4lUc4M/wk6rvb4U02EVc6RyTfF26Zz4TF?=
 =?us-ascii?Q?yNmtWVT0HeR6UBRdP2pCmLe8pIqQVshp5l2TWfHkNulnamZuFaMlgwvDiHK5?=
 =?us-ascii?Q?CTNOThqGF75gTslZzLn/xkwv16lglkrgUPCalRO8uCfZmxCXorFHV8ErR0qn?=
 =?us-ascii?Q?sSJdx4h6BMfIPbhx4TBydYeMiTEdmoiRK6696+ukNR3xAhPmOQG0Eb5mM+Wu?=
 =?us-ascii?Q?5g/95KQaCSnA/jqa1hE/eHcvewez1+a8ivWBWqGe+hIsFo1gR2F3Yj8SrWpD?=
 =?us-ascii?Q?DdBizqknnXeW1wvYLUye2mB1UPcjAiFAKqDAT3DNrbfzTLVn7l2ukl5cTvKb?=
 =?us-ascii?Q?8hmhrmJhu2aYKUzOJBz1ULIMFHocavF76ynQfIZD+7NZdUz0iVy3TcL0aCF8?=
 =?us-ascii?Q?REo2p0aFBpL+DhiTRyNg/HJHLyCSfNad2E19j6OPD0SPiCPlgu99ag2lXBof?=
 =?us-ascii?Q?4bhS4FONXJIp6h0hMYEUMhR+m1WGgwQ3gRHmg4LYu4tnQC5qwRBLzh8yabM2?=
 =?us-ascii?Q?IYAeo512VWPyuerj+lgFPs+Sv1gqlgzu3hMTgG1o0oHDApPXqUvxtFyOvM63?=
 =?us-ascii?Q?6S6Pnwxv4nZNjCD24Z4HijitXJnsSLZuvJaXOKxTI8F2titb6KBeZ3UyNJxa?=
 =?us-ascii?Q?aPOCR5YMpt7nLCJXUtcd62z5WfcPncaTf4a/rdHQ1jsoRuGBRvZMzyfd4yBP?=
 =?us-ascii?Q?ej7TqQu0m7es2zfV2XyfjtQhYNJ0A0s6u6hsn70dpcLEB0M33p0rBhY5bsoQ?=
 =?us-ascii?Q?G6hp9w=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d523a9-53de-4e0f-ce20-08db732f1e59
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:44:01.3988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+wLiHjfjojaYeZJtx8vcX3IbehvfGVePKRAYJ+8vUhjPpkgYYPGMDvNIQYozkV+Vo6SU/uEPXgjJLzfDHgUANG/qAwsx6YX/Ccrn9VtV9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB4474
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 Tee Min <tee.min.tan@linux.intel.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org, Tan@web.codeaurora.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: phy: update in-band AN
 mode when changing interface by PHY driver
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

On Thu, Jun 22, 2023 at 12:19:02PM +0800, Choong Yong Liang wrote:
> From: "Tan, Tee Min" <tee.min.tan@linux.intel.com>
> 
> Add cur_link_an_mode into phy_device struct for PHY drivers to
> communicate the in-band AN mode setting with phylink framework.
> 
> As there is a mechanism in PHY drivers to switch the PHY interface
> between SGMII and 2500BaseX according to link speed. In this case,
> the in-band AN mode should be switching based on the PHY interface
> as well, if the PHY interface has been changed/updated by PHY driver.
> 
> For e.g., disable in-band AN in 2500BaseX mode, or enable in-band AN
> back for SGMII mode (10/100/1000Mbps).
> 
> Signed-off-by: Tan, Tee Min <tee.min.tan@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

...

> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 11c1e91563d4..c685b526e307 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -756,6 +756,8 @@ struct phy_device {
>  	/* MACsec management functions */
>  	const struct macsec_ops *macsec_ops;
>  #endif
> +	/* For communicate the AN mode setting with phylink framework. */
> +	u8 cur_link_an_mode;
>  };

Hi Choong Yong Liang,

Please consider adding cur_link_an_mode to the kernel doc
for struct phy_device - which is above the definition of struct phy_device.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
