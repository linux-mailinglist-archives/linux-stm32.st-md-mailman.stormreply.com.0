Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD351BF9247
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 00:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FD94C57A50;
	Tue, 21 Oct 2025 22:51:00 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF4B4C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 22:50:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C66762749;
 Tue, 21 Oct 2025 22:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E158C4CEF1;
 Tue, 21 Oct 2025 22:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761087057;
 bh=Qk7LUUgm4OTA/65R/5eca+jZCmwBOCQ0+YdsSmes8Bw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FSoV19XbKe7C8UMx+JY6Pj4jaUyBAFBp8/DerOBulBD4fm1gFoy8DcahXxFQGlet6
 IRYS11vIuBmB5CsRBqSD949YQbNPklP8BPk2h8A1mQYwdQv/5xOO2UhLS55hDAt+BG
 UcXdrfcMGgBPK7mFHXDzfH9ELSQgik8/zAObLXNmGIHlXwsqXiHmhMG8Ds4RzLCG/S
 spO/FKr47vGoEBYQdEMY7FyHCIiA2RsnZQytqDSlwApWUJRi+vxqKIoEBj0MaO2/tf
 Pofsp1AJAktzC4ySVsD5oTyEdlrGN9ScgTtsK/wEXZhiKXCeabbBk4/F4cqvYu+cNr
 3IYQ+6YtXo6XA==
Date: Wed, 22 Oct 2025 00:50:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <s2whbqys4xwn2ant7ftgixwkguqmvtwbguajdtz7bks7avgk7c@efhaves6wzg2>
References: <f7e0c023-d2d1-40ba-badb-74a7e9c23684@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7e0c023-d2d1-40ba-badb-74a7e9c23684@web.de>
Cc: Anand Moon <linux.amoon@gmail.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32: Omit two variable
 reassignments in stm32_i2c_dma_request()
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

Hi Markus,

> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete two redundant variable reassignments.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

merged to i2c/i2c-host.

Thanks,
Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
