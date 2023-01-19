Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D9674FD1
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jan 2023 09:52:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2385CC6905A;
	Fri, 20 Jan 2023 08:52:52 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E5AAC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 21:57:09 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JLT8bu030467; Thu, 19 Jan 2023 21:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xHuzXeNDiIwndNWeKonBxc5KI/X0aMeH30RDkuA23Fg=;
 b=D0cDcR8t7UzfNGwH0forG3q5QiVPdLRMK1YjkWalcDmqA6U2UGQMCtlCBfemNRT2ntfS
 SR1PhBUFqr9Ao4MsJnQolfs+mkiDm+H6M4jfKa30SWkI1c5tzG3nk65NlFhDhZK8KqY5
 0hlNVGLoMZ7FjiR6VVSLb63oge3vJDIHiUObNV1fzayr8835Bl1L9DNUmsMv9Lh3ZtOv
 +whCbWcBOmd1ZMKKAYksDP5iicxIibLX+kVbwnWxkMxZqnEzhwQEXDYaAaestpqVbOKw
 rcbzvJJk4qWz8J/US57JALqxYIx14Nln2nL0zUXcEjye2WlvcDnWLl7vq2IeP02YzvRI mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7dtqrkwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 21:56:48 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JLulA7031690;
 Thu, 19 Jan 2023 21:56:47 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7dtqrkwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 21:56:47 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJeXoe005711;
 Thu, 19 Jan 2023 21:56:46 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3n3m180852-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 21:56:46 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30JLuiOH6750758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Jan 2023 21:56:45 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8E7E5804B;
 Thu, 19 Jan 2023 21:56:44 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A2C158055;
 Thu, 19 Jan 2023 21:56:41 +0000 (GMT)
Received: from [9.160.87.67] (unknown [9.160.87.67])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 19 Jan 2023 21:56:41 +0000 (GMT)
Message-ID: <7eac2ce1-7ee9-7783-a9f2-9ec2f7019096@linux.ibm.com>
Date: Thu, 19 Jan 2023 16:56:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <9-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <9-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a1NkOyV4AkAwQdPDo6-7oJAzOHK_-aAo
X-Proofpoint-ORIG-GUID: V_h4SUwdpkFLvdx1u4mhG5SO4ES7urEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_14,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=853 priorityscore=1501 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190181
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:52:50 +0000
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
Subject: Re: [Linux-stm32] [PATCH v2 09/10] iommu/s390: Push the gfp
 parameter to the kmem_cache_alloc()'s
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

On 1/18/23 1:00 PM, Jason Gunthorpe wrote:
> dma_alloc_cpu_table() and dma_alloc_page_table() are eventually called by
> iommufd through s390_iommu_map_pages() and it should not be forced to
> atomic. Thread the gfp parameter through the call chain starting from
> s390_iommu_map_pages().
> 
> Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/s390/include/asm/pci_dma.h |  5 +++--
>  arch/s390/pci/pci_dma.c         | 31 +++++++++++++++++--------------
>  drivers/iommu/s390-iommu.c      | 15 +++++++++------
>  3 files changed, 29 insertions(+), 22 deletions(-)
> 

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
