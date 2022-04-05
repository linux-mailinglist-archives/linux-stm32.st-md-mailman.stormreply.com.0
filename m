Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E134F56B0
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Apr 2022 09:03:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F257C628AC;
	Wed,  6 Apr 2022 07:03:26 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 490BAC60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 19:59:55 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 i23-20020a9d6117000000b005cb58c354e6so264349otj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Apr 2022 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=vsB0AuI21Kofyvp/riTyvNd4coqIjgD81UccFUtHY1Y=;
 b=Rkj/0laop7KLDhsOuGYl3niAtveifqwL5e0lXIyZGGEB1m2SyARx3Ci4ExPlECaTkX
 7L2h9PJbcRmLixmWeR7a2H/j38YzUjHGSgu3s57NYqCTEAzbH+sQR9e52MexiSIpH6Vf
 Sv2LAOUWH3J38FPTjKaV4IpEhnKgbI9eUEH4/Hrlg6mcxhzq978HjsCyqxkBMi17ZJfT
 NDFn0g5mtAtXhrDjW6qKOkD0lEYXWzru37r1hI2HBZEPY9Zm8Q3IpgPMvDbaY+TPg7gJ
 awHH5L3kRLCOXBMIwig5z4glyV738Jh6WF+xGDSgZCmyHMAD7I7X1RBLVUE2n9BROIk3
 yD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=vsB0AuI21Kofyvp/riTyvNd4coqIjgD81UccFUtHY1Y=;
 b=8MAp7ZgiyNxFeeGZgkEyHcMGTsputbUsM54iyK5b7CsCMV3zxbiZbCEofTZjP6fXkP
 9gViuc3UtNMw9X5IwwKG1GWs9hsNXGlMns312plYGz0zqTYIMMaxgjGGSnZsE3ITgAVT
 9uKVvfSroJD0foDvbsXQVC5JOeXnjzDcqxbFj+B68RjL/ERAra+1vONeyV/sZhtZkgyQ
 FelnvrE9PYU9BgemFD9fGo9uWBSVzWZTRt1iKCz9IglEIPOZ+I6oHEnGmO7nFT9eHDIs
 6afdRgQqsIxwHeenX0jSLokhkCzVkAiBVa+95OAdW7tHotpr/fee7086DT3fRN+2YTO0
 Dt6A==
X-Gm-Message-State: AOAM532ZKBz9o0+/MM0JAEICJ1JeGn5P5VfSJIdj8+3RkW+EDWX7cVBE
 o6X/xTwsq+IgBwi0uG+i28sATg==
X-Google-Smtp-Source: ABdhPJwzGIRq6HBtLV2yo+jbEAfZXa6Ihlndw2zKxu4l+L+ifFdh57ilwowSntY2zVXQfwdL7la53w==
X-Received: by 2002:a9d:853:0:b0:5b2:617e:e982 with SMTP id
 77-20020a9d0853000000b005b2617ee982mr1876988oty.333.1649188793899; 
 Tue, 05 Apr 2022 12:59:53 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 r129-20020acac187000000b002ef358c6e0esm5643602oif.49.2022.04.05.12.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 12:59:51 -0700 (PDT)
Date: Tue, 5 Apr 2022 12:59:41 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <481a13f8-d339-f726-0418-ab4258228e91@foss.st.com>
Message-ID: <95a0d1dd-bcce-76c7-97b9-8374c9913321@google.com>
References: <481a13f8-d339-f726-0418-ab4258228e91@foss.st.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Apr 2022 07:03:24 +0000
Cc: miklos@szeredi.hu, djwong@kernel.org, hughd@google.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-mm@kvack.org,
 mpatocka@redhat.com, zkabelac@redhat.com, linux-fsdevel@vger.kernel.org,
 lczerner@redhat.com, akpm@linux-foundation.org, bp@suse.de, hch@lst.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] Regression with v5.18-rc1 tag on STM32F7 and
 STM32H7 based boards
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

On Tue, 5 Apr 2022, Patrice CHOTARD wrote:
> 
> We found an issue with last kernel tag v5.18-rc1 on stm32f746-disco and 
> stm32h743-disco boards (ARMV7-M SoCs).
> 
> Kernel hangs when executing SetPageUptodate(ZERO_PAGE(0)); in mm/filemap.c.
> 
> By reverting commit 56a8c8eb1eaf ("tmpfs: do not allocate pages on read"), 
> kernel boots without any issue.

Sorry about that, thanks a lot for finding.

I see that arch/arm/configs/stm32_defconfig says CONFIG_MMU is not set:
please confirm that is the case here.

Yes, it looks as if NOMMU platforms are liable to have a bogus (that's my
reading, but it may be unfair) definition for ZERO_PAGE(vaddr), and I was
walking on ice to touch it without regard for !CONFIG_MMU.

CONFIG_SHMEM depends on CONFIG_MMU, so that PageUptodate is only needed
when CONFIG_MMU.

Easily fixed by an #ifdef CONFIG_MMU there in mm/filemap.c, but I'll hunt
around (again) for a better place to do it - though I won't want to touch
all the architectures for it.  I'll post later today.

Hugh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
