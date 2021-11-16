Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0A452E8E
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Nov 2021 10:59:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC60CC5E2CC;
	Tue, 16 Nov 2021 09:59:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6494C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Nov 2021 09:59:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D65B6120F;
 Tue, 16 Nov 2021 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637056744;
 bh=72HtoTGOJnv1qQ+d/4YD/KC5HfK4DkAfw+y+7wktYf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vsj2gGJxGtDVL78WRh9z3uErysp0TtVMznFmvYqHqr0vcB/bPq9Quiu7cjektfttc
 SImNPjIIhqHmzFmhbXoMftbdi9tfCNIPnYS7wMzNCM5OrGseShZnIhR9EpLqzo3/FS
 XJEoF6jfkUjUg1KTyzGC2pIXX/5Wj8dqkUyIh+IboIgxNnTmPSWRw7MAP5ZFwQac5Q
 hilkJed3q0lBMVyI5horwXcOkiAG4Lx+iVP29IajxQYjP5kBWriAge/JdhOkyInOiZ
 peqI5XrjQV4e07hHoDcJxaX+HZKtFlaQykdHFE6G3Tjc6BSk/uRADhMd2Fhiboj7pw
 5pSWch50ectFg==
Date: Tue, 16 Nov 2021 15:28:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YZOA4wQH4Q4fNVTY@matsya>
References: <20211026154817.198937-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211026154817.198937-1-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] phy: stm32: fix st,
 slow-hs-slew-rate with st, decrease-hs-slew-rate
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

On 26-10-21, 17:48, Amelie Delaunay wrote:
> st,decrease-hs-slew-rate is described in phy-stm32-usbphyc.yaml. Then
> fix the property name in driver.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
