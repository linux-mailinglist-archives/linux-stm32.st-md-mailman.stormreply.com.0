Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3236CDA1FE
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Dec 2025 18:34:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85155C8F276;
	Tue, 23 Dec 2025 17:34:01 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8C0CC030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 17:34:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C5AE44093;
 Tue, 23 Dec 2025 17:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08883C19423;
 Tue, 23 Dec 2025 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766511239;
 bh=Xhadf7WxNcbHexZkIdejQDCjOzzfeofXi1dqZAVER/U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RoXUVWJcWo5rR+PJhTILIkGMHhVBFPBj9jxUcbPpmJDrqsZnNb1Dv9Uravd+RSnom
 HSpJPfeAbyx0c2R41TgA4HZDueCZiHayXBiAYKhmtsARsQl6XpZRsAjOCMEbRcAj+J
 8RQ2Kap8hqnQvv1PHjuTih2H64AigYb5HbVsOwCw7fuPwtekQ65Pb89qd44gJfmHq5
 vbgbnrAB2mivdHNJtA1oz8yAk1NP/x6y5AvaKDBg3qvlPyXqKrcyPEr7YPwMtuxhWh
 LZFUmdvUL+uvCpLx8af+lzQzIf70FzjXZ7p3DmA5ufb1AQn8kGEtk/fTNYYWOPcL0p
 9uPGD2xuHJiEQ==
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <aTfHcMJK1wFVnvEe@stanley.mountain>
References: <aTfHcMJK1wFVnvEe@stanley.mountain>
Message-Id: <176651123567.749296.7003388912771665169.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:03:55 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 Fengguang Wu <fengguang.wu@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] phy: stm32-usphyc: Fix off by one in
	probe()
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


On Tue, 09 Dec 2025 09:53:36 +0300, Dan Carpenter wrote:
> The "index" variable is used as an index into the usbphyc->phys[] array
> which has usbphyc->nphys elements.  So if it is equal to usbphyc->nphys
> then it is one element out of bounds.  The "index" comes from the
> device tree so it's data that we trust and it's unlikely to be wrong,
> however it's obviously still worth fixing the bug.  Change the > to >=.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: stm32-usphyc: Fix off by one in probe()
      commit: cabd25b57216ddc132efbcc31f972baa03aad15a

Best regards,
-- 
~Vinod


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
