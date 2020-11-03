Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCB22A3A15
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Nov 2020 02:54:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBAABC36B25;
	Tue,  3 Nov 2020 01:54:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C675C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Nov 2020 01:54:04 +0000 (UTC)
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4FD721D40;
 Tue,  3 Nov 2020 01:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604368442;
 bh=jTBDUd/sABFOHCwWC8ddceR41OFXoed4AKLUR43RnR4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=c/VPqWr1so++LBT2aQNBLfFBJC2xvJ5MUBk8EHbGHVIycwsTz0zSf3Xjm3ZT9hFkh
 Y1G8HH5DoMob2JqVu3v4PtMLQY0c+mouLtL6DJ98t2ureB3Eh1dRi9wq8QlfoDIDFL
 L0knRnde3ib4xNTg4qmorG3LibljefWk6KvFF7cs=
Date: Mon, 2 Nov 2020 17:54:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: trix@redhat.com
Message-ID: <20201102175401.091b384e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <20201101140720.2280013-1-trix@redhat.com>
References: <20201101140720.2280013-1-trix@redhat.com>
MIME-Version: 1.0
Cc: narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-meson8b: remove
	unneeded semicolon
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

On Sun,  1 Nov 2020 06:07:20 -0800 trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A semicolon is not needed after a switch statement.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied..
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
