Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F266714F7
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 08:18:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CF7FC69064;
	Wed, 18 Jan 2023 07:18:30 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30BDAC65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 08:49:50 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30H7jBg2002153; Tue, 17 Jan 2023 08:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=H906UnaT+mKc1vvKmTCCEcWqGmxotatY633LkzBqxYU=;
 b=A6BVq7HNMg+oOk9phju+5wb8NvQ5nhXgUGV4aDzrytllvMMkF1QwAASO805mzs95eZ2n
 nFKcix/B9tP3yq5RutbLwr2yS0Abm57uKLmBtWu1LQCnzO68gBvKuRAubGf/f3lwbm/t
 d7yQv+5f0SONkcFHHSaAcX07ZpD4eOvZsvKy1FKh8tdh0yhzrWgHCxFAGAnbCx2hVThN
 Rond9aWSHw3YaiM/1OecQ05uP252qJXP3SYTDx0h1dBaObZJqgSUfIb/xpcCfRKWX9Px
 JCMj5JyJGhH44nebnIBpCrl3064gZ9Rc08Ewv1HQn0ismQJBIsB7Inz4PAelp10g6+mT Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5hky0gqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 08:49:29 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30H8ftP6001523;
 Tue, 17 Jan 2023 08:49:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5hky0gq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 08:49:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30GGKqhH025576;
 Tue, 17 Jan 2023 08:49:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3n3m16ajt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 08:49:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30H8nMXa14222046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 08:49:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAED920049;
 Tue, 17 Jan 2023 08:49:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33E1620040;
 Tue, 17 Jan 2023 08:49:22 +0000 (GMT)
Received: from [9.155.211.163] (unknown [9.155.211.163])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 08:49:22 +0000 (GMT)
Message-ID: <0bd438b3afa979b9f4d4d1e9c76451a93e7ef7eb.camel@linux.ibm.com>
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>
Date: Tue, 17 Jan 2023 09:49:22 +0100
In-Reply-To: <8-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
References: <8-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MKx4-ANHPJUrZonOgwaEaY-EVKsDWzHU
X-Proofpoint-GUID: SbFxmq8QKSSdWBsgb5noBKiad8Yo5FPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_04,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=713 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1011 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170071
X-Mailman-Approved-At: Wed, 18 Jan 2023 07:18:27 +0000
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alex Williamson <alex.williamson@redhat.com>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-tegra@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, ath11k@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 8/8] iommu/s390: Push the gfp parameter to
 the kmem_cache_alloc()'s
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

On Fri, 2023-01-06 at 12:42 -0400, Jason Gunthorpe wrote:
> dma_alloc_cpu_table() and dma_alloc_page_table() are eventually called by
> iommufd through s390_iommu_map_pages() and it should not be forced to
> atomic. Thread the gfp parameter through the call chain starting from
> s390_iommu_map_pages().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/s390/include/asm/pci_dma.h |  5 +++--
>  arch/s390/pci/pci_dma.c         | 31 +++++++++++++++++--------------
>  drivers/iommu/s390-iommu.c      | 15 +++++++++------
>  3 files changed, 29 insertions(+), 22 deletions(-)
> 
---8<---
>  

Looks good to me and I have no objections.

Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
