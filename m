Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0B1449E3D
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Nov 2021 22:30:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77A7DC5EC6C;
	Mon,  8 Nov 2021 21:30:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [178.238.156.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03971C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Nov 2021 21:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=0iwskvT7/hdjJZTdU1Eyzgws/WDVQd1HAOKc57+uQjw=; b=pocPJMpyTmtM9PRMwz8gM4cb65
 ARrDqhE6l7qEoqBDn++car9Pk7CDPei4UiXKcIDsH/a1HDLe6m2anTctYJ62lvbBmUynMSr0G0+yZ
 b75PmapDuqR+2iZrpLdqTgkA0usuSwZ86/bjCEqWJrjVJUkmMfzUuON1gWib2CGIZ0BWuuOWKZ00d
 RtKjM2s7wqMwC262T1JMmh65f+iu3S+hh1vAV4sRq5pZHW1YTr/6yBjjRAs4aDk6BeGRIn9InQwEq
 GeZQBBjbwIrbskHtmOw1Og0DWU7kH2MMn5gKVxTOMB+ti/ODlT/TrdS9oCok+IWUIuKMXcpkQpT2N
 jU+nRFxQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkCE1-008jfC-Qe; Mon, 08 Nov 2021 21:30:46 +0000
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <67712270-d8b3-8475-f365-d24ed4cbb117@infradead.org>
Date: Mon, 8 Nov 2021 13:30:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108140126.3530-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] rpmsg: Fix documentation return formatting
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

On 11/8/21 6:01 AM, Arnaud Pouliquen wrote:
> kernel documentation specification:
> "The return value, if any, should be described in a dedicated section
> named Return."
> 
> Signed-off-by: Arnaud Pouliquen<arnaud.pouliquen@foss.st.com>
> ---
>   drivers/rpmsg/qcom_glink_native.c |  2 +-
>   drivers/rpmsg/qcom_smd.c          |  2 +-
>   drivers/rpmsg/rpmsg_core.c        | 24 ++++++++++++------------
>   drivers/rpmsg/virtio_rpmsg_bus.c  |  2 +-
>   4 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
