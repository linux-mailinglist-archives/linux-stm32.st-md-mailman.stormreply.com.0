Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D366737AC
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 12:59:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1907C6904C;
	Thu, 19 Jan 2023 11:59:42 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13C5AC69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 11:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674129581; x=1705665581;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5iljU3ubicNtm4iB5o/W1SF+gNSsJnJBGq8FDgyaBeE=;
 b=FrW0c4fmGTOrn7GtMN1hJW2r9WX5Ak67PC5bl9xv2nZ5WaQ3E1CGHI3a
 K8pks7TBTbbNMb0C6Pt5ZaY3x9lU/ApF7CrGfikc97xyVEg1TRzRzO4Sc
 FlqqlttgdjN7JhY3Dh5FSBJhiFCjnbm/C7pVIVVrqtVbDoGYPVpgRgfml
 WVc8pwlGOfacqEiaSeLF/j0m2716707DALe24YI98Ntwe4zDhu4lU994J
 xIQQLNCi32dZ9zG83gWlJsm5RvHjnYwwBSgWm4GrWyRlHp2VIYvdUlHup
 08fHAlhXJ89zE7a+870flmxmpPb18Twx+MAT3kHgl+Ib6X4bhDopkaKWi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352522350"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="352522350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:59:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833967799"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="833967799"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248])
 ([10.252.185.248])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:59:31 -0800
Message-ID: <54887e93-22a1-496a-838c-ad6a8b4a830f@linux.intel.com>
Date: Thu, 19 Jan 2023 19:59:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <7-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
 <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
Cc: linux-s390@vger.kernel.org, linux-media@vger.kernel.org,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-remoteproc@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Alex Williamson <alex.williamson@redhat.com>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-tegra@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, ath11k@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
Subject: Re: [Linux-stm32] [PATCH v2 07/10] iommu/intel: Support the gfp
 argument to the map_pages op
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

On 2023/1/19 19:57, Baolu Lu wrote:
> On 2023/1/19 2:00, Jason Gunthorpe wrote:
>> Flow it down to alloc_pgtable_page() via pfn_to_dma_pte() and
>> __domain_mapping().
>>
>> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> 
> Irrelevant to this patch, GFP_ATOMIC could be changed to GFP_KERNEL in
> some places. I will follow up further to clean it up.

It has been done in the next patch. Sorry for the noise.

Best regards,
baolu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
