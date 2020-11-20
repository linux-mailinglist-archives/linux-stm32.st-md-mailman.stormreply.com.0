Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD12BA6F1
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Nov 2020 11:04:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54921C56632;
	Fri, 20 Nov 2020 10:04:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A814DC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Nov 2020 10:04:24 +0000 (UTC)
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20F6C22244;
 Fri, 20 Nov 2020 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605866663;
 bh=ARRNZfpi+Mn1V6hzOdD605q35U5qiyEAfEvZ9NLxQYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zKMYARwWUfc4c3r+USqkSPVcAVGEPkVMTtKs8egzt2R6APjiPlEQ5fKpWa9rH6VHR
 7jRRF8FdsG1EEOeuPR8nPnlq2GZrbvOEfeftih+9T5nA2NwzP9w9tbHHYeIxFe1iUU
 ZqCg9fFGKhjSFgP31Kl/9yPrT/2P/S1vjOWmabkw=
Date: Fri, 20 Nov 2020 15:34:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201120100408.GG2925@vkoul-mobl>
References: <20201116171917.10447-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116171917.10447-1-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/1] dt-bindings: phy:
 phy-stm32-usbphyc: convert bindings to json-schema
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

On 16-11-20, 18:19, Amelie Delaunay wrote:
> Convert the STM32 USB PHY Controller (USBPHYC) bindings to DT schema format
> using json-schema.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
