Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD86714F6
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 08:18:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 648B9C6905F;
	Wed, 18 Jan 2023 07:18:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96F33C65047
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673944568; x=1705480568;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+/sep6cg202vL4sr/HrqlldWJYwNCPz0Civ/zJRrPiM=;
 b=nmaxmJ0WMS3A5UjaL8ABiyxKigv9JBkEqbaokmVkrV0nEzS/c0VHWCkP
 FJoZF1zs5a4zIIXSSzNckFg90LeVH5OqjBJTJ/BNx/vYTZ1MSZu1uugqq
 BralN4yu3/436TE9KeEDft2Q1THGxg1WCM3a2D51GJEPBwZKD5QMVYH+B
 1IyWMhkKtqmknd7KQb1gY9ODCdUtv4NCbLJ9FqHqz2YQVeTbPZF6H8BCN
 VOC1N8urbk3/J/EiI1CJ/UITsz9RCGnPS8p+wS3w92TCVVTnk+13gEMCZ
 g1i+YYa7qc+Zh4tsTCm9a/U3KeR6/iZ41zjtRE3h3VuxqpcTare6/NMPE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324696292"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="324696292"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 00:36:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783168240"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="783168240"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.187.178])
 ([10.252.187.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 00:35:59 -0800
Message-ID: <c742969d-d692-1580-d22c-0f8f3d897201@linux.intel.com>
Date: Tue, 17 Jan 2023 16:35:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <0-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <7-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <BN9PR11MB52765EE38CA21BA27EEA06548CC69@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB52765EE38CA21BA27EEA06548CC69@BN9PR11MB5276.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Wed, 18 Jan 2023 07:18:27 +0000
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 baolu.lu@linux.intel.com
Subject: Re: [Linux-stm32] [PATCH 7/8] iommu/intel: Support the gfp argument
 to the map_pages op
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

On 2023/1/17 11:38, Tian, Kevin wrote:
>> From: Jason Gunthorpe<jgg@nvidia.com>
>> Sent: Saturday, January 7, 2023 12:43 AM
>>
>> @@ -2368,7 +2372,7 @@ static int iommu_domain_identity_map(struct
>> dmar_domain *domain,
>>
>>   	return __domain_mapping(domain, first_vpfn,
>>   				first_vpfn, last_vpfn - first_vpfn + 1,
>> -				DMA_PTE_READ|DMA_PTE_WRITE);
>> +				DMA_PTE_READ|DMA_PTE_WRITE,
>> GFP_KERNEL);
>>   }
> Baolu, can you help confirm whether switching from GFP_ATOMIC to
> GFP_KERNEL is OK in this path? it looks fine to me in a quick glance
> but want to be conservative here.

This is also good for me. The memory notifier callback runs in a process
context and allowed to block.

Best regards,
baolu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
