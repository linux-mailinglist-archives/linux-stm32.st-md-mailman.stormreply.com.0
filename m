Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB458674FD2
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Jan 2023 09:52:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 456A2C6905D;
	Fri, 20 Jan 2023 08:52:52 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C92BAC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 21:57:12 +0000 (UTC)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30JLlbHM030199; Thu, 19 Jan 2023 21:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uEw62BCO1kAE3MnqsTANbbpQMbTsLDdWyYH4p4E1DCA=;
 b=JeBeAbeePVqEpUQNApMZ8YIYEPuLwCZ2G/HwUA0cmJLkPk7ui0A5vQFQYJEVqdVbML5U
 e91pt5oFbU7tm1Nh7A8SxsxN045+sZTvEQ5k8ODQuVBWfdMnWWEOx2plljcn1hE/uFx1
 3c3qdPwGLHTfGV+Xj1XOZLv9pGhrORCY0KStHgA+e6dM1txf3fJgNK7v77HTGl6GazGJ
 vDcd9/OoOTa4KBu/a3iDR5icyiDw5I5jPYFd9BbKlvc9N3qsIOsgjCHSEzgOptqfLcJ/
 HoXfR0nLDnjtgu6JzBG5EYU4milBxTfxfY0/ItTN9LsByz11xbMq6hTzsAZfSsNbZ4cY 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7e3d866k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 21:56:56 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JLuu21027289;
 Thu, 19 Jan 2023 21:56:56 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7e3d8667-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 21:56:56 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJkuri025991;
 Thu, 19 Jan 2023 21:56:54 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n3m18897y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 21:56:54 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30JLuqn966453836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Jan 2023 21:56:52 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66B7458059;
 Thu, 19 Jan 2023 21:56:52 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9964F5805B;
 Thu, 19 Jan 2023 21:56:49 +0000 (GMT)
Received: from [9.160.87.67] (unknown [9.160.87.67])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 19 Jan 2023 21:56:49 +0000 (GMT)
Message-ID: <1c7a7395-dabf-ddbf-00eb-9e7e44910750@linux.ibm.com>
Date: Thu, 19 Jan 2023 16:56:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <10-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <10-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u9tb2Epyw4L_fk2u2w9vs35Q310gGVQW
X-Proofpoint-ORIG-GUID: CtIEVTzNTPEu57hDSdzSORw4_xg43p3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_14,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=773 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Subject: Re: [Linux-stm32] [PATCH v2 10/10] iommu/s390: Use GFP_KERNEL in
	sleepable contexts
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
> These contexts are sleepable, so use the proper annotation. The GFP_ATOMIC
> was added mechanically in the prior patches.
> 
> Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/s390/pci/pci_dma.c    | 2 +-
>  drivers/iommu/s390-iommu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
