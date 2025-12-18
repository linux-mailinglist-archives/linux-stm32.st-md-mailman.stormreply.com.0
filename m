Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 736DECCB0E0
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 10:02:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3872EC5663A;
	Thu, 18 Dec 2025 09:02:12 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E861CC01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 09:02:10 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BI8rUN01317947; Thu, 18 Dec 2025 10:01:56 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4abc8xuk-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 10:01:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FO4vw5Nu14tCL+O6LaYaTPsnKGJyAAeu0P0tUsDRy81sZJwPaEpAK9Ku08R7MHFd6Ylmyh+vBSVnna2YGqUjrZo3DB/9Uj8xHY1cd12XzrmCLzWJ+Kuza9wZ6EyQ7dkpLGIcF98yHr96EqYyTmrFMJa5Ht8cn1Ozkzk/codbUdzGdrHGVjMPWeek4uc0SnCLTg8/CwUNS3EE0/DCgCUxlTChISmHC+YTuMmHyrHdjiincUmJoWZGISZBHdmVa4DShMlntrA1JQ5C7EgJjcvI85nes5tjy+6nRvnnKH2/SvTPaW4dyVxVq9vCxNUfM8tvLqhWtFKJmQQsPPZ2SH+t5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpXoDFN0WuLCRaCnW33MmPWVUG34c4aDe0ijDMH7AiA=;
 b=D46rT7lJuohKDG8oWaTlJHbZkNHmkbFzahX4or1vy5RRoqtB58cCp0d+7eFhItQAloWD4R20xbWUyXdVv4CzrjEiLcgnLdikQxTexBGkm9ASfGSNnlyaIvTgze3G9uDiN+xiJTrzZMCrgXKE2KLVzo2Jlm/AH+lV/PRT4QWBcBKS2OSGW4LwBvZE/dhuP6BPnnUHRT3RVAGLSQEnZ6J4O9KvyFUxphbjMfCCvosvFXBQsmtgGTesCVLkTKSdRSH5nE+pwWbX++yrR+RTx0KY+z4bYCAUEAbUXdf4FZ3WvnFLj2FDwqtHhNclsO1Ncv9x45ANxNV1+ExLkgx5EhDSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpXoDFN0WuLCRaCnW33MmPWVUG34c4aDe0ijDMH7AiA=;
 b=gQXCQ9Gp4XtnsFGwPtqmogtSu39IuJAAb6Mumtp8D85L9+pAQ2MIJSIUmM8feUPJZuyZ4LzE+Z6vcKFaFIIshUrsuo+CnLzSp9LVPDz7AHRPlWBSfpnqS8CD/qafycpvkMWruAMNmr5y7qJKsOxhuYD2pVGBQVwxWbijK83OYAVFjXL8VH7nTNDdijrRMT7Wp9MmN6wA1g8hXWCdKx61SeqI+7xtnQbmh4caWWB50IeEO8ygycz8NaJpN4ucyaHMzh3xEZLV43Sato6/UvMOX4+T874cQpI+DgQq43h2I1L29WsUuwSBFQ/OHpwOhedzVWxl9mPFAeNIFGSu1m06Pg==
Received: from DU2PR04CA0194.eurprd04.prod.outlook.com (2603:10a6:10:28d::19)
 by AS2PR10MB7659.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:643::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 09:01:53 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::6c) by DU2PR04CA0194.outlook.office365.com
 (2603:10a6:10:28d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 09:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 09:01:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 10:02:38 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 10:01:52 +0100
Date: Thu, 18 Dec 2025 10:01:47 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20251218090147.GA1530303@gnbcxd0016.gnb.st.com>
References: <20251217-stm32-spi-enhancements-v1-0-943348b8ff66@foss.st.com>
 <20251217-stm32-spi-enhancements-v1-3-943348b8ff66@foss.st.com>
 <129a4deb-ec9c-41f0-910c-57cd43d17fcd@sirena.org.uk>
 <20251218083840.GA1530150@gnbcxd0016.gnb.st.com>
 <6c153ddd-a586-4138-b3c4-793278d93305@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c153ddd-a586-4138-b3c4-793278d93305@sirena.org.uk>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DF:EE_|AS2PR10MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: dbaeffe2-a42c-46e9-2a89-08de3e141694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FKpXyuVNSE3VxntB5RxYkF8916916oiuddcI4tofXHSaBIFKXZJfFib16jJn?=
 =?us-ascii?Q?ETwrzvjq6nysiEpkM0NspC6wcjdHB3FZ4JlToutu11GQcggWwTs/0cexQYam?=
 =?us-ascii?Q?trKCGe2w8vTyLrpSSQjigX6sUS9QaXp7da+mdO9z1OSWM3opAdDE42pwlfgp?=
 =?us-ascii?Q?uWMwwkY8KThoTPDZtf/iLhXmMAtoZC5culioxQM44InsW0AQ1q2Gd8vMVksC?=
 =?us-ascii?Q?8EscT9owukZVStbxST5TKNE2q9ntivc3smcgAD0yQkKOY8Qfn9wLK3a3uWy4?=
 =?us-ascii?Q?8oqaGZGiZD9dpqB7FaGAa/b7uhZIxZ/yTjzICzymU6+rlaxcebfYxMgPzmMd?=
 =?us-ascii?Q?BFDVmJ0lctwPKoeeDIZtGjaahW05LWklZAXb4HXqDrMePYTUfO2bFBhhI3hH?=
 =?us-ascii?Q?fdP4G1pQ4nwxbBHR+o9OY80svwNgBURikuYIDo7IJEB3DzC4sSHRYStJnwKp?=
 =?us-ascii?Q?t9EkdFhQiDxUe0M/EBRXlcQ4jcxvlfbW0uRGabPpXdrwAZK9O14qLM/nq5fy?=
 =?us-ascii?Q?K7FQjXz490wfIAQ6MfCqGalX8laGhXqBOqeaQcFfJS2BFHRgO25SpSxp5011?=
 =?us-ascii?Q?RKzDpovsev0HWqZSS/cgyfA3art/C4ea9j3s/2O+1uiRyzpt/68fFBe+n4v0?=
 =?us-ascii?Q?4gK8IfEhus6bF9BPF9pHjE1gjaWFCIjGaepgSVXFTRG71Uzp5kndwbwSMZis?=
 =?us-ascii?Q?SGIV7n4rNhFsQ94/vW93aNrynW9rl9Pw8YJuN8mMEaBd2QCYbxxlhZpilEdo?=
 =?us-ascii?Q?CC5j6hqhKQ19F2Clri34qWHgyg1js2zw3VRrsg7GmmAwssZS3mE1BChhwdux?=
 =?us-ascii?Q?T9UpK95iSNa1diC2boAR4lxL81wAiJyGzcJhE169uK39RI1l3biQ+dQ7O9D0?=
 =?us-ascii?Q?tpiWweTnaN+JPJrSSWFw2zLH86Ie/E+lQg+RBsCuGkiPU+67KbEjO2FBgPlm?=
 =?us-ascii?Q?HjqiY2lpHAvyrX0+pWrJkSjTuF7V9noGmIGkTwjoHWFOBs//nJHvX1wJFFLv?=
 =?us-ascii?Q?TIkvp7MW48iu1KAFoXXTFuPW8HPggfJzQtV1FzsPujioiOo5Xr4k1UmNMdiy?=
 =?us-ascii?Q?OATgi2sB/GvxQQeS2szFVfvSbakKQEnQS5a6i3Ceo8pWYQ421WxrDj4t8gh4?=
 =?us-ascii?Q?XzdMAy3cFhTHY0YJ6XJjLGV+SB+tHfnLaKOE/IBLcyO5qoieFHi/+6tyrC5+?=
 =?us-ascii?Q?67VKeM/XGyN9c6PyP7/M7SKhkfqdQwOjPMU91PRVbH3p7jIszSPgvlqJm2WB?=
 =?us-ascii?Q?r0/KqZdh2XJq94K56Lxw4a9KxngjRyTcTHBFbepfcewcHud5qNb9HWx/fbMI?=
 =?us-ascii?Q?JivCsxSmM5t5T5UXF8anDskQ1e5HAgqdQpPNupjauTW3TPEuuXEi3wkD12LZ?=
 =?us-ascii?Q?IBYPhR8E4YLLQtxkxrJdEz25VCMZGlAAFMV5z6Nx/dx1Dkq76MOVG4KHQHhE?=
 =?us-ascii?Q?OKamIl+3+Vh5yKslwjb+0P5hzcWiE6aNZ3yQt2XQeutKguKZzN7T3CnHG2bo?=
 =?us-ascii?Q?tFVrg7o0u4kJQLN+sBwLt/lo37tTPBSmzeNOoFiBNJ9r+M58ZgldLi//DqMP?=
 =?us-ascii?Q?HGw6dbYQh/Kz/ZFZ2Ks=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 09:01:53.1191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbaeffe2-a42c-46e9-2a89-08de3e141694
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7659
X-Proofpoint-GUID: 0YluABoH9o5uNFH6-dzZaHroBrvBbNM6
X-Proofpoint-ORIG-GUID: 0YluABoH9o5uNFH6-dzZaHroBrvBbNM6
X-Authority-Analysis: v=2.4 cv=bIYb4f+Z c=1 sm=1 tr=0 ts=6943c304 cx=c_pps
 a=KDZ5a5fL2lDbxPkgIe+xSg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7I9JURkk3rxALoUXsRgA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA3MyBTYWx0ZWRfX7upxmmXjtPw0
 23gj4zu4q326e74wmzU0tY0veiuIwGvvNejDbXWxOl4VgiUIzf168e1/UzN1RGt3W9oPMitbwwt
 aKm3gix8TH77IemZ6E0jKVs7IoAg9VWGBSd/rkF9FMfFheRV2Y+54BqIeqkOq/i5uwpOZIzAYMB
 vn3gN8yo4fKpgvJjb+C3JYDuMeIl0hVsqN/WvexqTn0+C4l6REORpy3z6m4fTYPZDlVSbAdHZch
 dZAnNXOPYXTz22YFocSt4szb4nUqAjwk9FoEINxT88OQ8j78Wjqr3DP/woJJ97HFLAr39ISNCXK
 IrW/uWQyeWnMc2z143AyRNE3muLuTSZQ9W72xmwWmHDsWLoLIKUzEbCGRkTuFdx/0Uy+J9snTB0
 1IBGldyQX+WwW+M9+WZ+gXoX6vfj7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180073
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] spi: stm32: properly fail on
	dma_request_chan error
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

On Thu, Dec 18, 2025 at 08:57:36AM +0000, Mark Brown wrote:
> On Thu, Dec 18, 2025 at 09:38:40AM +0100, Alain Volmat wrote:
> > On Thu, Dec 18, 2025 at 08:00:57AM +0000, Mark Brown wrote:
> 
> > > Bug fixes should go at the start of serieses to avoid spurious
> > > dependencies on new or cleanup changes.
> 
> > Actually I wasn't thinking about requiring this commit to go into
> > stable branches. Without commit, the driver will still work even if
> > there is an issue to request a dma channel since it will fallback to
> > interrupt based transfers.
> > This commit makes the error visible now, ensuring that if the
> > device-tree indicates that a DMA should be used, it will either be used
> > or probe will fail.
> 
> I'd not send it to stable either (admittedly I generally stopped tagging
> stuff for stable entirely) but I will apply it for v6.19.

Alright. Thanks. Let me send a v2, putting this patch in front of the
serie.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
