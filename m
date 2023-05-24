Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F4C70EE5E
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 08:46:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B2E0C6A61E;
	Wed, 24 May 2023 06:46:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC07FC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 06:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d42AHTFlpUEOeGU5jPR9+1OGQMHqlZflKmgaMdb+Sas=; b=MwxCPps7AIYBrNm23ThRPeSFhC
 C5DcQDk8QDb0J10OGerS6pvVbC2XXSobScNXP3T0adiQL/ZTAYnQKwvhIgUNlHAf0O+pSVLvqihBX
 9pPenUhaV/I2af9WBMJ1Qtqh7hPk6P0UENM4y2Z3nKZ0EJXBD+j5LW26GwVC54b2H8Uzr3xkvhucT
 g2E494/FR4dLUjMH4EA3D6RgblH2jlKE/5rjuHhm1JkSqUxKILGJTMx39Og/kp6hTcsQf5zkueNP9
 N+Kc0CaC65olQL5nEcqbGZMJuA5xzcvhJOfFdVbomC6y3LKw5YoxCxqQ+cZkpsENELgyOBvzFnvfJ
 UOgXaVEw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q1iGR-00CWbv-2z; Wed, 24 May 2023 06:46:27 +0000
Date: Tue, 23 May 2023 23:46:27 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZG2yw0xZ6XGGp9E5@infradead.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <20230523091350.292221-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523091350.292221-2-arnaud.pouliquen@foss.st.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 1/4] tee: Re-enable vmalloc page
 support for shared memory
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

On Tue, May 23, 2023 at 11:13:47AM +0200, Arnaud Pouliquen wrote:
> This patch revert commit c83900393aa1 ("tee: Remove vmalloc page support")

As per the discussion back then: don't just blindly do the same dumb
thing again and fix the interfae to actually pass in a page array,
or iov_iter or an actually useful container that fits.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
