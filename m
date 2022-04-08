Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AFA4F9E4A
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 22:38:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C11D9C628A2;
	Fri,  8 Apr 2022 20:38:57 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06C0C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 20:38:55 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id b33so5781730qkp.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Apr 2022 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9HwDppLqHaQcBs/UBe2aw4cxWmdlTn3unTRBCytLFO0=;
 b=kDWT7DbLIXeryuqgzJKXPRooe+DFb5VrAV9s8VQQh3/+L/jkAAOBZkzbwMa9Y+oos5
 xnxE+TBlfk7ynX1+gqkkuP3JzEVI8mo5QCIzJjw4NrdeaKKiBsjlQPa32LF4zQlR8CMo
 qxfJz6xxrivp2BwcN71Gyk/3z0QMnL9Gmeu3Da1e3QfE4v/4pQSGcCwMiLyOcku5wgHf
 CZfBgZObe0vK4UJoPcPOS8TbVZaWAoObLYWjFjYFc3HV77ztvqr9DZRoGtYuTW224KS0
 nv+SXeVtLimXZK1E6e75cZMoMhsooPeZNKUKc0CnODdMdlAwq5ZZ3HIupplfob3LOqv4
 T//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
 bh=9HwDppLqHaQcBs/UBe2aw4cxWmdlTn3unTRBCytLFO0=;
 b=wvyQ6jCxY7A/7v00fgXpgLl/6OXpe67qM9yt7f6vdt6enp29SXXzsLZLj1On4uoP+r
 0qmoTalI37/4f4hDP9aqbtqR74NCg0XFc+WEJkzj43pw2UtSA/cBio65gefTHkk0N6Gh
 j8mdLZoS2Wu0eax8V6C+2zongQEgK5dm+j18P0+Do8jJMIBMUhCqicxh9epFWoTPOFmO
 VwUOo/S2f4JO6mtZR+7DCsGhrwUs5qgVg4BuIhMgUKJmZ/GccHiE1x+V/PVh5ggkYGCO
 5CqP9lsMepyHEQIfkE82eDl6Hi9hDjTmuUo+kzsW/lzG7Ze/yrCJTCcWAl/R8+Fmwp4D
 s6Nw==
X-Gm-Message-State: AOAM531UsUUoITzKIStLWGwP7vb65hmfqsTz53jBkTZCxU9IgvzQULKG
 eGv5Tb8qKkzeO7+JeJdfzzV+og==
X-Google-Smtp-Source: ABdhPJxNNfuUtbU+jVA4OD408wRYRnD+uHeEDWk6oAgIVTm4FABTOcVGdZuqmIMJ8LrzmwY67c43ig==
X-Received: by 2002:a37:b983:0:b0:67e:c0d2:c3ca with SMTP id
 j125-20020a37b983000000b0067ec0d2c3camr13883611qkf.749.1649450334495; 
 Fri, 08 Apr 2022 13:38:54 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a37ba02000000b0067dc1b0104asm13964961qkf.124.2022.04.08.13.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 13:38:53 -0700 (PDT)
Date: Fri, 8 Apr 2022 13:38:41 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <9a978571-8648-e830-5735-1f4748ce2e30@google.com>
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 "Darrick J. Wong" <djwong@kernel.org>, Hugh Dickins <hughd@google.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-mm@kvack.org, Chuck Lever III <chuck.lever@oracle.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Mark Hemment <markhemm@googlemail.com>,
 linux-fsdevel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>
Subject: [Linux-stm32] [PATCH] tmpfs: fix regressions from wider use of
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

Chuck Lever reported fsx-based xfstests generic 075 091 112 127 failing
when 5.18-rc1 NFS server exports tmpfs: bisected to recent tmpfs change.

Whilst nfsd_splice_action() does contain some questionable handling of
repeated pages, and Chuck was able to work around there, history from
Mark Hemment makes clear that there might be similar dangers elsewhere:
it was not a good idea for me to pass ZERO_PAGE down to unknown actors.

Revert shmem_file_read_iter() to using ZERO_PAGE for holes only when
iter_is_iovec(); in other cases, use the more natural iov_iter_zero()
instead of copy_page_to_iter().  We would use iov_iter_zero() throughout,
but the x86 clear_user() is not nearly so well optimized as copy to user
(dd of 1T sparse tmpfs file takes 57 seconds rather than 44 seconds).

And now pagecache_init() does not need to SetPageUptodate(ZERO_PAGE(0)):
which had caused boot failure on arm noMMU STM32F7 and STM32H7 boards
Reported-by: Patrice CHOTARD <patrice.chotard@foss.st.com>

Reported-by: Chuck Lever III <chuck.lever@oracle.com>
Fixes: 56a8c8eb1eaf ("tmpfs: do not allocate pages on read")
Signed-off-by: Hugh Dickins <hughd@google.com>
Tested-by: Chuck Lever III <chuck.lever@oracle.com>
---

 mm/filemap.c |    6 ------
 mm/shmem.c   |   31 ++++++++++++++++++++-----------
 2 files changed, 20 insertions(+), 17 deletions(-)

--- 5.18-rc1/mm/filemap.c
+++ linux/mm/filemap.c
@@ -1063,12 +1063,6 @@ void __init pagecache_init(void)
 		init_waitqueue_head(&folio_wait_table[i]);
 
 	page_writeback_init();
-
-	/*
-	 * tmpfs uses the ZERO_PAGE for reading holes: it is up-to-date,
-	 * and splice's page_cache_pipe_buf_confirm() needs to see that.
-	 */
-	SetPageUptodate(ZERO_PAGE(0));
 }
 
 /*
--- 5.18-rc1/mm/shmem.c
+++ linux/mm/shmem.c
@@ -2513,7 +2513,6 @@ static ssize_t shmem_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		pgoff_t end_index;
 		unsigned long nr, ret;
 		loff_t i_size = i_size_read(inode);
-		bool got_page;
 
 		end_index = i_size >> PAGE_SHIFT;
 		if (index > end_index)
@@ -2570,24 +2569,34 @@ static ssize_t shmem_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			 */
 			if (!offset)
 				mark_page_accessed(page);
-			got_page = true;
+			/*
+			 * Ok, we have the page, and it's up-to-date, so
+			 * now we can copy it to user space...
+			 */
+			ret = copy_page_to_iter(page, offset, nr, to);
+			put_page(page);
+
+		} else if (iter_is_iovec(to)) {
+			/*
+			 * Copy to user tends to be so well optimized, but
+			 * clear_user() not so much, that it is noticeably
+			 * faster to copy the zero page instead of clearing.
+			 */
+			ret = copy_page_to_iter(ZERO_PAGE(0), offset, nr, to);
 		} else {
-			page = ZERO_PAGE(0);
-			got_page = false;
+			/*
+			 * But submitting the same page twice in a row to
+			 * splice() - or others? - can result in confusion:
+			 * so don't attempt that optimization on pipes etc.
+			 */
+			ret = iov_iter_zero(nr, to);
 		}
 
-		/*
-		 * Ok, we have the page, and it's up-to-date, so
-		 * now we can copy it to user space...
-		 */
-		ret = copy_page_to_iter(page, offset, nr, to);
 		retval += ret;
 		offset += ret;
 		index += offset >> PAGE_SHIFT;
 		offset &= ~PAGE_MASK;
 
-		if (got_page)
-			put_page(page);
 		if (!iov_iter_count(to))
 			break;
 		if (ret < nr) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
