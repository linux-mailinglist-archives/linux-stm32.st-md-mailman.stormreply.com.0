Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C952B3DCF
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 08:38:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD71C3FADD;
	Mon, 16 Nov 2020 07:38:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C110C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 07:38:02 +0000 (UTC)
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA0E02227F;
 Mon, 16 Nov 2020 07:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605512280;
 bh=HZYKaCjuFYm1x81FaBrewRuQuRwQHQ4aSvcmjFLaPXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KlpdHlNJx806C1/bW6pg2aUKzBONsmXGEsSt4Qz9sK9I150yhhPXZZ3nbXaHBI7uy
 6iSNoFCRQ5emx4wNttjj45Y4mNt95xsudWgOSfqcx1wydjEqWvApGBiZrczA86t4nc
 ++7+mvrts5aObfAwGIiyFDB6MIpQ+UrKKmlwmPKs=
Date: Mon, 16 Nov 2020 13:07:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201116073756.GL7499@vkoul-mobl>
References: <20201110102305.27205-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110102305.27205-1-amelie.delaunay@st.com>
Cc: Etienne Carriere <etienne.carriere@st.com>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] phy: stm32: don't print an error on
	probe deferral
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

On 10-11-20, 11:23, Amelie Delaunay wrote:
> Change stm32-usbphyc driver to not print an error message when the device
> probe operation is deferred.

Applied all, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
