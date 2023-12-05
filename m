Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8580485E
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 05:02:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4BC9C6C855;
	Tue,  5 Dec 2023 04:02:31 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A095FC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 04:02:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2c9eca5bbaeso35123901fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 20:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701748950; x=1702353750;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/4qYujN8YUPBa0JNq4UyKlX+K5Ufzv+oENh6Wntp8sY=;
 b=HtS9ZEMrYftXhcn95zuwOPHZLHv7qUa2ce/MHbDobw3wi443tyGM+EwWALrrdrK0+v
 D5Ez9BidwBx0IbQrPYuMVbRgbc2TM8rR9KJCJUKI6uoqlTPlOPQEAJ+Q8Rn+tnHuVh4h
 gjuQZ+WhN+3PQ0KzBN8egja7468neMWqwhUhSuQPmXJGa/klN+/rfFmXVKQrMsiyjCLp
 KPO8cb0AOb/sXozpJpDx9CplbOcTuyWgEGe6/U/tLWjhOC+jmxV9KF5mi5eIQ5gaz+ba
 syu29PyOjX8sapXDwBwtw1cMYlGpOq5y6IFOa4tzIxcPYC78OuI4zk1ltMfemL50Jl6p
 5hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701748950; x=1702353750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/4qYujN8YUPBa0JNq4UyKlX+K5Ufzv+oENh6Wntp8sY=;
 b=XInKRQJuD9Zt7fsN06nuSCzB0s8oo6mgy/lOACDYyyOYw/VdGmkiCRNQYNTTdf2Vuz
 ++XCXFIs3hqHsxYsvzORJah5rZ9WBZvGrghKV+gAtgkoeBN2rusVRwOzPzqQPUGwHkfB
 ofm+n/uH7EVD2ADdiQ8N5iT5jgfme1Sr3lGxRHZ3nyoiVn4vC/NLsj7HnTxQTuiqPU4M
 E/dnbC4T+WiGrLHIbqo+Tn3I19x8uoqiFiNjyxRi522Hd2+OEHjJUOkH/HN+qqVdCy2S
 Tq0dUB3I06VByKZiU/dYB2VVRpa9OSZdyreXLpmKuBvcnS6aAI7/Kr8p3aeW9Ka9ciMS
 5RyA==
X-Gm-Message-State: AOJu0YxHyqxhxG5tMEO1xl7hAzsOjJEnPVgsR3ePA6dzN0E/SlQ8GYS1
 I6qhcE230k7AtyAKFcfcLWE=
X-Google-Smtp-Source: AGHT+IHrIx2fsWidponzd79suuBm27EcmeV4zktJOvf/4l1bUyw4rU/TKKv5cOob2nfnnFf9tcKDNw==
X-Received: by 2002:a2e:a1c5:0:b0:2c9:fde5:a359 with SMTP id
 c5-20020a2ea1c5000000b002c9fde5a359mr663370ljm.20.1701748949460; 
 Mon, 04 Dec 2023 20:02:29 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a2e8748000000b002ca0a1f489asm384152ljj.52.2023.12.04.20.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 20:02:28 -0800 (PST)
Date: Tue, 5 Dec 2023 07:02:26 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rohan G Thomas <rohan.g.thomas@intel.com>
Message-ID: <d3e5i54yw5vqcnn67lw6jflgxgkqlsk3witwufoeqfqcf66p5u@7cnxjf2ddaf2>
References: <20231201055252.1302-1-rohan.g.thomas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231201055252.1302-1-rohan.g.thomas@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, bpf@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/3] net: stmmac: EST
	implementation
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

Hi Rohan

On Fri, Dec 01, 2023 at 01:52:49PM +0800, Rohan G Thomas wrote:
> Hi,
> This patchset extends EST interrupt handling support to DWXGMAC IP
> followed by refactoring of EST implementation. Added a separate
> module for EST and moved all EST related functions to the new module.
> 
> Also added support for EST cycle-time-extension.
> 
> changelog v2:
> * Refactor EST implementation as suggested by Serge and Jakub
> * Added support for EST cycle-time-extension

Thanks for the update and especially for keeping your promise in
refactoring the EST code. The series has already been merged in, but
anyway here is my tag:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

* which at least for Patch 1 you must have forgotten to add since v1
* seeing the patch hasn't changed.

Regarding the multiplier and the MTL_EST_Status.BTRL field width info
you submitted earlier:

On Fri, Dec 01, 2023 at 14:49:09PM +0800, Rohan G Thomas wrote:
> Managed to get DWC_ether_qos_relnotes.pdf for v5.20a and v5.30a. But I couldn't
> find anything related to this. So for refactoring, I'm keeping the logic as in
> the upstream code to avoid any regression.
>
>>
>> Also please double check that your DW QoS Eth v5.30a for sure states that
>> MTL_EST_CONTROL.PTOV contains value multiplied by _6_. So we wouldn't
>> be wasting time trying to workaround a more complex problem than we
>> already have.
>
> Yes, I checked this again. For DW QoS Eth v5.30a the multiplier for
> MTL_EST_CONTROL.PTOV is _9_ as per the databook.
>
> Also noticed a similar difference for MTL_EST_Status.BTRL field length. As per
> the upstream code and DW QoS Eth v5.10a databook this field covers bit 8 to bit
> 11. But for the xgmac IP and DW QoS Eth v5.30a databook this field covers bit 8
> to bit 15. Again nothing mentioned in the release notes. Here also I'm keeping
> the logic as in the upstream code to avoid any regression.

Thank you for digging into the problem. It's strange that Synopsys
hasn't mentioned about so many EST CSRs changes in the Release Notes.
Anyway if nothing in there my next step would have been to reach
somebody from Synopsys to clarify the situation and find out the
reason of the change. But seeing it's an additional burden and vendors
reply not that swiftly as we would wish I guess the best choice would
be indeed keeping the semantics as is, at least until somebody finds
that problem critical.

-Serge(y)

> 
> Rohan G Thomas (3):
>   net: stmmac: xgmac: EST interrupts handling
>   net: stmmac: Refactor EST implementation
>   net: stmmac: Add support for EST cycle-time-extension
> 
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c |   4 -
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 137 ---------------
>  drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  51 ------
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  16 --
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  53 ------
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |  21 +++
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  22 ++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_est.c  | 165 ++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_est.h  |  64 +++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |   4 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   8 +-
>  15 files changed, 276 insertions(+), 275 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
> 
> -- 
> 2.26.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
