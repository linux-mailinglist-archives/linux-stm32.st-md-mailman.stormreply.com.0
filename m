Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB5B4FA4D6
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Apr 2022 07:06:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C5B2C628A2;
	Sat,  9 Apr 2022 05:06:43 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC32EC5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Apr 2022 05:06:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AB9CC68AFE; Sat,  9 Apr 2022 07:06:38 +0200 (CEST)
Date: Sat, 9 Apr 2022 07:06:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hugh Dickins <hughd@google.com>
Message-ID: <20220409050638.GB17755@lst.de>
References: <9a978571-8648-e830-5735-1f4748ce2e30@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a978571-8648-e830-5735-1f4748ce2e30@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-nfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Chuck Lever III <chuck.lever@oracle.com>,
 Mikulas Patocka <mpatocka@redhat.com>, viro@zeniv.linux.org.uk,
 Mark Hemment <markhemm@googlemail.com>, linux-fsdevel@vger.kernel.org,
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

On Fri, Apr 08, 2022 at 01:38:41PM -0700, Hugh Dickins wrote:
> +		} else if (iter_is_iovec(to)) {
> +			/*
> +			 * Copy to user tends to be so well optimized, but
> +			 * clear_user() not so much, that it is noticeably
> +			 * faster to copy the zero page instead of clearing.
> +			 */
> +			ret = copy_page_to_iter(ZERO_PAGE(0), offset, nr, to);

Is the offset and length guaranteed to be less than PAGE_SIZE here?

Either way I'd rather do this optimization in iov_iter_zero rather
than hiding it in tmpfs.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
