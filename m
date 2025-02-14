Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FCA35DE8
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Feb 2025 13:53:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F45AC78F8C;
	Fri, 14 Feb 2025 12:53:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22B55C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2025 12:53:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72A285C56B1;
 Fri, 14 Feb 2025 12:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA9BC4CED1;
 Fri, 14 Feb 2025 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739537598;
 bh=W20/hho5/JKp2k83eRciL4B0jPMKgL9X5owBtOEnhK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n47noHxF18PlaEr5zaUzUu3eIqSCbdx3pLu2oHLYc8zf8YunCqQS8cNkd08YYatCz
 +YqzxN+xwQ1GMTDAyjnJ2cMlzT5lv9IMGycjrF9RuqR7VabMGLnAR56Xg47NxrWcAj
 dFeEzJFx+PTgD5nN1ZNbtFGJYQC8iB3ug+RQRBazAH2nuDPUJtwLURu/ueiQgqwVff
 ysXfzv3fhymVtK2H8CGKS9eu+9l0aUwqOkc3/YwgdWKVGVcLIWYH8CUW8vT0cb3KHq
 wWDP77ggDxI6iP0rYfG/dIn93iYkqOJwlk1gAkykLl23YwGr5vVhvkCnQRd2drRSTr
 y/njZSXq2q1Fg==
Date: Fri, 14 Feb 2025 18:23:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <Z688unKfcSeFE5X/@vaman>
References: <20250117140514.3614314-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250117140514.3614314-1-christian.bruel@foss.st.com>
Cc: kishon@kernel.org, arnd@arndb.de, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] Fixes: 2de679ecd724 ("phy: stm32: work
 around constant-value overflow assertion")
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

On 17-01-25, 15:05, Christian Bruel wrote:
> This patch replaces the workaround with fixes for two issues leading to
> constant-value overflow assertion:
> 
> - Guard against false positives with a WARN_ON check to make the compiler
> happy: This should not happen because the offset range is checked against
> the sorted imp_lookup_table values.
> 
> - Guard against a true warning found for the max_vswing, as a given
> vswing value can be 802000 or 803000 depending on the current impedance

Patch looks fine, the fixes line should go here and subject needs
revision

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
