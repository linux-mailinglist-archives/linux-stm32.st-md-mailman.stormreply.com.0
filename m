Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E9E433E13
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 20:06:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E097C5C857;
	Tue, 19 Oct 2021 18:06:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E32D0C5C854
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 18:06:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 674B8604AC;
 Tue, 19 Oct 2021 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634666809;
 bh=QRHoFOiTZy8VK0r2DCaWi9nxm3sfvfTDB4HypYQ8wpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIX0YVuaUlmTBhAiYoxYlY5KoMGZnwmQNfKdQl5h0rsGmj4Yh1fdGptzM4zbnhAal
 ulL2npUToEepyrzbf0aNGdrHacL1v/fkl8WlseiQ3gibXbFs70WAtSkN15lepHNPX2
 UV2civm+cGfDyGDAyVW1Gm8wqbbEoOfwEgFsvOhidqOWiytrsdvjpM1151QJdZZ6Cp
 Ut2DS6WjmQSmtYBcKOnHPLknscz0QaMkTppXz3rS9RrNCmHRFwF5B9rLJQrNgoKoy7
 b2m95hkXjwW++ibTmKrOTtLoBTZ41FOFqwkfuJ/p/x8wItNlIYpoy9dkGeZsU17fCN
 yBy2Dg8Kt9kvA==
Date: Tue, 19 Oct 2021 23:36:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YW8JNd82rZyjLoH9@matsya>
References: <20211015161427.220784-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015161427.220784-1-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/3] phy: stm32: add phy tuning support
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

On 15-10-21, 18:14, Amelie Delaunay wrote:
> This series brings phy tuning to stm32-usbphyc with new optional
> device tree properties.
> A prior patch add resume routine, which is used to restore UTMI
> switch and phy tuning configuration, as they can be reset if
> deep low power state is achieved.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
