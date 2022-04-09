Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC854FA54C
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Apr 2022 08:08:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1361C628AD;
	Sat,  9 Apr 2022 06:08:47 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5573AC6046A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Apr 2022 06:08:46 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id e10so4848051qka.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Apr 2022 23:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=6aEcwmX5AHIuIeFqcYJ9jTFQjBEYXnOc4Olxo6nl8Es=;
 b=NqAdYhsFyqCpaZalKL8cZvkb0ebp2WuRLeZVDMBV9dnaLsD0hT6aMMQ1x2Gpg5345G
 +yO4oDYXUKqFAIV1Ac/DSJnN2zXSNk8YNat0v8IReqw/zVBgK8uPe1r4NjZWVWpybJU8
 dxf17wqIuahDlUYc1qEYdIrSo3YAZW/0uhEIvBdge44SZvyrjc/FGu+9F30AUhpazNQM
 UFO3izbcSbwR/kjPjgh+nyLiXzzlrRhudOVIhUrYpHG12yE+zu6lyoM90VBvW0GkHG6I
 ycykZh/XGWDW1qht46NE/BNnl/k2pgdvpjPmGyaU5zqIq52WH9JWnyILe48+6gOEaknW
 tGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=6aEcwmX5AHIuIeFqcYJ9jTFQjBEYXnOc4Olxo6nl8Es=;
 b=cjYsI8qmYd1FSD9eiHz30Hc+WOwokmOhfgLM6A1GcxxM27qS7UAAxmXDs1XodiW2XW
 LYnuqCm30FxZ1aqDlTimdAlrA60MxxZp2/+NdOzmMZsRDqMSKBFrkA2I4D4U8qwKlJhD
 GKeCffsLXU0lU6aGOHAiFAWpXhQiwlqw8h6VdMkLnzlNpdWM1kjCvM+zLXy6HY6VZrpp
 Fr4wup+SVPQJ4KR3PCvAQbfmGNtCdl1wgwNa2KsricHBgraHrjPxymngfzcq9OolfceJ
 l+Smgvq+WWERV59gpJxlYAWoaZNcizJqlDjaKoWSpMdw3ELlTKdpyTS+PK9RcwKWOxal
 n75g==
X-Gm-Message-State: AOAM530t1uQd+oT4wmvdfZ0byjOjPCqUGfr2mOp1cEXGScBew5PXKFOC
 bj2n9Oe6aRModIw2IooI9yAEZQ==
X-Google-Smtp-Source: ABdhPJwB4d7Ufi4cN4i+wikQ8L0VsgopVFCWZFF2+UtgD8fK4o0ibgOxwGW6k02yNhdIRgCp/83Ksg==
X-Received: by 2002:a05:620a:d87:b0:67b:311c:ecbd with SMTP id
 q7-20020a05620a0d8700b0067b311cecbdmr15327968qkl.146.1649484525161; 
 Fri, 08 Apr 2022 23:08:45 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a378d05000000b0069beaffd5b3sm1849345qkd.4.2022.04.08.23.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 23:08:44 -0700 (PDT)
Date: Fri, 8 Apr 2022 23:08:29 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20220409050638.GB17755@lst.de>
Message-ID: <f73cfd56-35d2-53a3-3a59-4ff9495d7d34@google.com>
References: <9a978571-8648-e830-5735-1f4748ce2e30@google.com>
 <20220409050638.GB17755@lst.de>
MIME-Version: 1.0
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Chuck Lever III <chuck.lever@oracle.com>,
 Mikulas Patocka <mpatocka@redhat.com>, viro@zeniv.linux.org.uk,
 Mark Hemment <markhemm@googlemail.com>, Borislav Petkov <bp@alien8.de>,
 Lukas Czerner <lczerner@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-stm32] [PATCH] tmpfs: fix regressions from wider use of
	ZERO_PAGE
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

On Sat, 9 Apr 2022, Christoph Hellwig wrote:
> On Fri, Apr 08, 2022 at 01:38:41PM -0700, Hugh Dickins wrote:
> > +		} else if (iter_is_iovec(to)) {
> > +			/*
> > +			 * Copy to user tends to be so well optimized, but
> > +			 * clear_user() not so much, that it is noticeably
> > +			 * faster to copy the zero page instead of clearing.
> > +			 */
> > +			ret = copy_page_to_iter(ZERO_PAGE(0), offset, nr, to);
> 
> Is the offset and length guaranteed to be less than PAGE_SIZE here?

Almost :) The offset is guaranteed to be less than PAGE_SIZE here, and
the length is guaranteed to be less than or equal to PAGE_SIZE - offset.

> 
> Either way I'd rather do this optimization in iov_iter_zero rather
> than hiding it in tmpfs.

Let's see what others say.  I think we would all prefer clear_user() to be
enhanced, and hack around it neither here in tmpfs nor in iov_iter_zero().
But that careful work won't get done by magic, nor by me.

And iov_iter_zero() has to deal with a wider range of possibilities,
when pulling in cache lines of ZERO_PAGE(0) will be less advantageous,
than in tmpfs doing a large dd - the case I'm aiming not to regress here
(tmpfs has been copying ZERO_PAGE(0) like this for years).

Hugh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
