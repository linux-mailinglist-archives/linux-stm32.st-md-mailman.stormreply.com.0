Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BC19A24F3
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 16:25:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF8FC78032;
	Thu, 17 Oct 2024 14:25:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAAF3C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 14:25:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DF575C41BD;
 Thu, 17 Oct 2024 14:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1C0C4CEC3;
 Thu, 17 Oct 2024 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729175138;
 bh=xElwNTcwgTU6ZVWLcduWdFTZHns1fNNdsPlKx1iQ0LI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GqKSloMKuDCznntWlXfHu+M1zuNlOn6KbuOj8vSfhEKlY3hsYa+a/EdKeuBeVu0ml
 rSgVYp59PlSjwsuC+eW65FH+ybcmhDuiWnDnZEeDSZtVuDquM+deOYLfZ2pEk39+U2
 DMqvMrcQtTwbdMrxPTNV8Q0sv8FkKNqTs+tuf+Jsp000KyZdfcKAmdLyXs3iKYLfAy
 k6+PQ+5kIlZPeKnKsVAXe9iap6JZ4fByx/cayBjwtw27GNxa3YBe/8nX7VCHMJdaCX
 Jws11WFyUwCtmPM6vFs+C63pCGbLLzLZOHo5rKoxgkT2SDCXrpuHANt0QrMdyMMS99
 uQNARasiBpwYQ==
Date: Thu, 17 Oct 2024 15:25:33 +0100
From: Simon Horman <horms@kernel.org>
To: Abhishek Chauhan <quic_abchauha@quicinc.com>
Message-ID: <20241017142533.GS1697@kernel.org>
References: <20241016234313.3992214-1-quic_abchauha@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016234313.3992214-1-quic_abchauha@quicinc.com>
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>, kernel@quicinc.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, netdev@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Ong@qualcomm.com, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: Programming
 sequence for VLAN packets with split header
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

On Wed, Oct 16, 2024 at 04:43:13PM -0700, Abhishek Chauhan wrote:
> Currently reset state configuration of split header works fine for
> non-tagged packets and we see no corruption in payload of any size
> 
> We need additional programming sequence with reset configuration to
> handle VLAN tagged packets to avoid corruption in payload for packets
> of size greater than 256 bytes.
> 
> Without this change ping application complains about corruption
> in payload when the size of the VLAN packet exceeds 256 bytes.
> 
> With this change tagged and non-tagged packets of any size works fine
> and there is no corruption seen.
> 
> Current configuration which has the issue for VLAN packet
> ----------------------------------------------------------
> 
> Split happens at the position at Layer 3 header
> |MAC-DA|MAC-SA|Vlan Tag|Ether type|IP header|IP data|Rest of the payload|
>                          2 bytes            ^
>                                             |
> 
> With the fix we are making sure that the split happens now at
> Layer 2 which is end of ethernet header and start of IP payload
> 
> Ip traffic split
> -----------------
> 
> Bits which take care of this are SPLM and SPLOFST
> SPLM = Split mode is set to Layer 2
> SPLOFST = These bits indicate the value of offset from the beginning
> of Length/Type field at which header split should take place when the
> appropriate SPLM is selected. Reset value is 2bytes.
> 
> Un-tagged data (without VLAN)
> |MAC-DA|MAC-SA|Ether type|IP header|IP data|Rest of the payload|
>                   2bytes ^
> 			 |
> 
> Tagged data (with VLAN)
> |MAC-DA|MAC-SA|VLAN Tag|Ether type|IP header|IP data|Rest of the payload|
>                           2bytes  ^
> 				  |
> 
> Non-IP traffic split such AV packet
> ------------------------------------
> 
> Bits which take care of this are
> SAVE = Split AV Enable
> SAVO = Split AV Offset, similar to SPLOFST but this is for AVTP
> packets.
> 
> |Preamble|MAC-DA|MAC-SA|VLAN tag|Ether type|IEEE 1722 payload|CRC|
> 				    2bytes ^
> 					   |
> 
> Signed-off-by: Abhishek Chauhan <quic_abchauha@quicinc.com>
> ---
> Changes since v1
> - took care of comments from Simon on FIELD_PREP
> - explained the details of l2 and l3 split as requested by Andrew
> - Added folks from intel and Nvidia who disabled split header
>   need to check if they faced similar issues and if this fix  
>   can help them too. 
> 
> Changes since v0
> - The reason for posting it on net-next is to enable this new feature.

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
