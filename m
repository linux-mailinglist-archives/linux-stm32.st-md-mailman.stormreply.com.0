Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50047660492
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Jan 2023 17:42:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5593C69066;
	Fri,  6 Jan 2023 16:42:53 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8112C6905D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 16:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6ItEc+W/PEJ7Hyi9yk5HZG1Bv7hM92M/Ok6qdUvReTYUWAK0NDuTg2hulZmSGvxuQgn1H+FE8mA2dpDFlUP/TLPMShB/D4USO76folnD0USqPtH5fN+ikYqRN8mHuxP3ZBv3+XdoYMFqQex2inTBmSWhoyxtxg8gCqx3TJe3AcauEWJEA8FqZL6iVzsLlxKS485Jw0D8Vk4dz1a275d3qzMbGxRHhXyps+t3d//HBj+0QCqtnBWzJXeFzK7h3+Z4AbuovxWhAbZxUZpbz8MJzwbIbr+z0+Na4YAvWv4hw/lyiDDopSIIDFz3ZQTJAcwoWzC4YWFKr/or87GvaNXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW/5mujLMwqrzVEZt7wBA4VSpYB7Lob2U3kTzSD4quE=;
 b=kHyQe7kG2O2a9FP30LqIl9Xs0JK6NbixiSSxFjeR8TaZ0HIWfDMiq/jLSeB0Yb3xe2QJtyP+aCQ/vVGQIjQs/rTsVEx+9IHM6N+rzQjfjJEtQDwCRr4o49NeQAC02+icMdgMYuPNFiiD2k+qETKbXC1sQYh5DBnBCJp7EEB8x0dl6Nj5oqQnfozaZzjq3plU8FsPsRQr6gsej+OIoIZi15F2DqSWeS9iwYvGVmJP9NWR3Ml25rATyxVFV3Eou5byj+SUwPTGj3W4F/hGvL366VmyhCCDWy5FkRnturkzpSyVlQNFa2O2hOn/PIaM3WbTmiIaYNQnjgCoV3QQdNUpBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW/5mujLMwqrzVEZt7wBA4VSpYB7Lob2U3kTzSD4quE=;
 b=nP0WBqG05j/lW1Ul2cBQ0y+XWUfxP3UXC+CDjzBG19i5/XPiJaOOC9NdYk2HwA+QsnpvMxjjIEP8IyWBgAlUicgg8n0wrQ2fR2+fIWglRCdy9qn/o7eeeaeG3AcoUe3ppNlQ2ZCN4zy+Vyf+EBQvVBpC5ZWjVf766lVFCP5p6j/CRouvA6HWW+ed7L3WsFjEA3eROoGe25whLIL7ubDYarg8Q8WhNF5zcv0FTolTtk3uYGR33PZVyyn2vLGwIVhXHnK2uwOyFowy2RY5ZOgwKsocDJ8npSy0gY8TjugMyQ0fayj+GH1I/ea9DrUMrEUejvrH0ddEHajw2wD3WltXoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 16:42:50 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%9]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 16:42:49 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Date: Fri,  6 Jan 2023 12:42:45 -0400
Message-Id: <5-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <0-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BL1PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS0PR12MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: f0cd8f24-13bf-491a-932d-08daf0050bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNwogv+Zcd6dTZcXqTYou5TM/aBn+LlTv/ZfmHv6l/7EhFrKfn+rCcz6u2dZ743pwoj1EBsr3Gidopf6AUeKqYxlxrFr2Rlpj/J9VqCR4mK5Bq59qvW9rWgGpagmrlbRjVBG68ak3MVu8g3w2oD/1p9uEgJnjMkD9QzgkwsjzDOZc6ZXvo7sPiI5pFPPrNIP2h2E72QJiPiSluHfLBnA+PBOSJpFKxsQuYK+4hDPrnhFrVMTiAYs7rncublT6CCW3PqXtBWkCAU/jL0ujLJjlur/FPSN0gA+hD7cpyD26cfsaNggxcRZPyM5Ep0Ht1rOl/Z33HJSEQ5v41i0jqB2/l12vUIqBMwkpoogSfqfmZeQNAzoMoKFHbOu1TqLE7mlR94ItzChMAdscBiNIl7FRa2RGAfs2yUZUrHvHAVfj3NHlNZkaPK6+QJe4fh+H829Vi4yjbib/LajRcLAtB8fZS0WEy6BF4ZyMjWvny/SSiA3QjSAFyHFGwCQ4Brats1rfE2UMQ3LwZYEQesBHO2RJSpBt7yUc3Y9aBeT26g6WJjN5AqRTNTC6vCYONgB9OmNWIeq46SfFRfXYtOLh5XXjGuZHxOiZIssPloD30Mo9WfsVQVJHq0oJcjcW7fiElcT+5LYNfY6t/IyvT0dkcVhu7gDI04tErvTRpcij9RVaE2rLS1Iqc4tjkQSTgTeWU/4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(7416002)(5660300002)(54906003)(2906002)(41300700001)(8676002)(66946007)(8936002)(66476007)(316002)(4326008)(66556008)(83380400001)(6666004)(478600001)(110136005)(6506007)(36756003)(186003)(2616005)(26005)(6512007)(6486002)(86362001)(38100700002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nkqw+k8ttZP4vYmGw7Pd5s8mJHGc1JmpfkdqbHN2glQN/h13IJ1EX33jg28A?=
 =?us-ascii?Q?gPXIsULNdIwvmnoqv8VGV7bAzj0TliTcpm/mNPfT/TGO6va6/8ZCodnpDDUS?=
 =?us-ascii?Q?Ubr0qOuSt0bKuEjgzJB3Ar7NC39KVfZUuRepTegkgRvdnHz2k/7CYUrtbzH3?=
 =?us-ascii?Q?YUItBx82JW/CnFrLkOj0U8NVue5Yr1P9f3Q7z80EvXNIeHdJ/m1DhEX2Bmlf?=
 =?us-ascii?Q?TQN5CpqkPPhZvQZK8FWY5KFwbD6d5+BMH/q+yEGxMif00WYqBJZS9gT3Q0cZ?=
 =?us-ascii?Q?OD3WNHb/bg7kSpQokiPVF7uhAqf08B0PWv88IH5I1SRpD+dZCHZypZ9DHmpK?=
 =?us-ascii?Q?sqpzuTEkaahO5fgLva6b0FjFyjq0DIelBq6yNOGxyie0KpXly9dTOd4o82H3?=
 =?us-ascii?Q?eLS9FnGOioqdYH2KcwQVYAhFY5vLPambY/DCi27Lo6CwX7CwBdm78j+yDVhI?=
 =?us-ascii?Q?DZkVdYQCqtIX69VrdYvdUVzr1EXzw2yMVMKyCBPrYn/S7xv+V1tCU1b4DOkR?=
 =?us-ascii?Q?Lt24buiOKCb1zfcAnL6hP4tsG/Ge8AT6wtNT4o5BVcW5meHvksizfPkaUeT6?=
 =?us-ascii?Q?SqM+ZQ01NCUyDTDWzasl16lxaV/7JGJuKJG9LCxEvIP3T41FhQtYavTRqTwQ?=
 =?us-ascii?Q?dZAHJLLI1tMKgg9+FnB4BwOeCwOGS/ArGwi58UQqoXfa11Y6FJdfMUHSSu+x?=
 =?us-ascii?Q?FljeXEweuyAlNgbaFH9+nYx7VewCFHoKnf88pFvlbhBB61SVaKmSkBuOrf5R?=
 =?us-ascii?Q?p8Hxarx4QlC3qTc4i1wgCj4AZmV4ZlJn/B5X72rDvElE7ff1CMtAas7UiuNa?=
 =?us-ascii?Q?jQoeWh+GN9srnBkOADz4ZljkR0yOenr1Z6+roarIdmeOm4PSD1mLRjIohcoX?=
 =?us-ascii?Q?r1V7P9i2L+G71+Z2v0sNJ4APV7eay6GE/15JHXOPeWlBWa0WKGrX/1ZaUqMW?=
 =?us-ascii?Q?UdSxxg3zMO0OH6kR8yU8kJ4k47+XdGRbqZ9h/t/u3vN9rvymOPaD26A1oCJX?=
 =?us-ascii?Q?t0BqHuPhNapojIhUPVHWg2ABavoWLXr2t4l+ZF9PbX2smchJ51K8xWms+pZV?=
 =?us-ascii?Q?wIh0Ahk8cl67IW7kHvl8UVS1tqX97TZ4f5QEAMmzxGjTiEASntc+kSnFDsKM?=
 =?us-ascii?Q?dkMYXMoqRnZ5+lyfRC3ptNHrnNzS+cby1jQ6nmmBocWtM37dhFhi/C2/cVSt?=
 =?us-ascii?Q?zbVEPFf8DaHjBce1H3M1slBVB5IW17vdM5kftaeVOVhpy7FXCglN1m1SA/sa?=
 =?us-ascii?Q?C0mX61AomnRYDDqAp38UlLBxMuNaj7GB5fKA4Hxkc9HYrZDOpTzwlg69zsjr?=
 =?us-ascii?Q?JxWO8OH/5h/z+5+O0HNhSeEoj87rMGDLmH6bk2UuSk5DO8mlDOJ8ylxwk+/x?=
 =?us-ascii?Q?hcAlooQs5oTAt5toLHLAbsy6IuaoHcGkvEVmGj1GSCoE4TrBU6IB1GtIPGa/?=
 =?us-ascii?Q?MyFIUEdf9T0gtg+6wZpb2Fy1BbuVGAhs5S6rDqReCPcqmL094GOixmbIMFvL?=
 =?us-ascii?Q?KLuURWJELDbqlTWkg9ioEtQoijqfDAV5c07XnHQqsHhjLKFBHngyuKzn5GIn?=
 =?us-ascii?Q?CyPjrFDFSm7Rhl2WdffnYGkH8vSd2WHYWmSN1U0y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cd8f24-13bf-491a-932d-08daf0050bd6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 16:42:49.2491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJc7a4+DiKTeFPENw3c3eTK4mEkL8GK2M1HtB7cPkg6HaFV1JzmxnPKOIWKHSmDt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-remoteproc@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Alex Williamson <alex.williamson@redhat.com>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-tegra@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, ath11k@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/8] iommufd: Use GFP_KERNEL_ACCOUNT for
	iommu_map()
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

iommufd follows the same design as KVM and uses memory cgroups to limit
the amount of kernel memory a iommufd file descriptor can pin down. The
various internal data structures already use GFP_KERNEL_ACCOUNT.

However, one of the biggest consumers of kernel memory is the IOPTEs
stored under the iommu_domain. Many drivers will allocate these at
iommu_map() time and will trivially do the right thing if we pass in
GFP_KERNEL_ACCOUNT.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/pages.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 22cc3bb0c6c55a..f8d92c9bb65b60 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -457,7 +457,7 @@ static int batch_iommu_map_small(struct iommu_domain *domain,
 
 	while (size) {
 		rc = iommu_map(domain, iova, paddr, PAGE_SIZE, prot,
-			       GFP_KERNEL);
+			       GFP_KERNEL_ACCOUNT);
 		if (rc)
 			goto err_unmap;
 		iova += PAGE_SIZE;
@@ -502,7 +502,7 @@ static int batch_to_domain(struct pfn_batch *batch, struct iommu_domain *domain,
 			rc = iommu_map(domain, iova,
 				       PFN_PHYS(batch->pfns[cur]) + page_offset,
 				       next_iova - iova, area->iommu_prot,
-				       GFP_KERNEL);
+				       GFP_KERNEL_ACCOUNT);
 		if (rc)
 			goto err_unmap;
 		iova = next_iova;
-- 
2.39.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
