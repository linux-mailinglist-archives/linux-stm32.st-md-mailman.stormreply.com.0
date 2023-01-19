Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEEB67379A
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 12:57:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 958A7C6904C;
	Thu, 19 Jan 2023 11:57:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED245C69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674129459; x=1705665459;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OOSuI8Ptgbyop0bHqYWl6Cev1ihhKUlYoWWsszEriiM=;
 b=S4eSRqreChhxjLKV0pF553MLzwDKQ1UPx5NvsrG4IzMpeTcxltsHoi5l
 4PU0pcnYm6aJ8uVxVSRwlRf2rXnA2j0zLoxwM0BjYsm8rav5zV7PWklEt
 OoJWFF6NJMusuZRsk3SGlcgTzJUTy/wS7PSzhkM4+5C0UeUcxOSI6b+hU
 oPSPWAahh25yROlpqHwbPzFVWxwJP5F02tEO77vNZMcnpE79zcN/rroBC
 Hg9//miQXCGC2bJqBTWhPUSflx0toYaUraeHjurRSsw5umF/q06622qoZ
 Ip+U1X4NoAEbbhxYSg/9s+KAuDUHa1KyQrNB9R2pDZpId7lEYdItxpu/n Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305637389"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305637389"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:57:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692393155"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="692393155"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248])
 ([10.252.185.248])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:57:23 -0800
Message-ID: <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
Date: Thu, 19 Jan 2023 19:57:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <7-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
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

On 2023/1/19 2:00, Jason Gunthorpe wrote:
> Flow it down to alloc_pgtable_page() via pfn_to_dma_pte() and
> __domain_mapping().
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Irrelevant to this patch, GFP_ATOMIC could be changed to GFP_KERNEL in
some places. I will follow up further to clean it up.

For this patch,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
