Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3A1AE8F00
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 21:52:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A80ABC30883;
	Wed, 25 Jun 2025 19:52:45 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30756C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 19:52:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB37849D30;
 Wed, 25 Jun 2025 19:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C74C4CEEE;
 Wed, 25 Jun 2025 19:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750881163;
 bh=VDiFnUxzpQuStKAHouo51b9DQbguX6DQSHvm/hd/xaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=seDyqdw1PJyKNbIhPu45Et06m6kzdAoVPPVwGA4LGIRHvchPiRZ9ODsLXKvcJcrLk
 pSoj+DrmWFvbqFEZtv5RQ5V30UjtwuGoCtsNcCIh2zKFvwQQ/s5x88UnPqBJIwVP+t
 xe4xflhWUVB+h9fm5VABSduTzYtI6plFNNV6didbcpYOl0WUjXU/IKWWvDWi00jUsy
 oQMgVmJ/tb9+VJFDD0/SwMB30iasbolNySCZJjjmAc6zRnG/+DlxXYhuYUxbXjrVq8
 ZfKseo/ULwtZwf3zcoT7/rcHi/kske3yf9fF7ahLnpg2YHPEz9jf6j1pArLJXfL18K
 /TIiewH4Inj2g==
Date: Wed, 25 Jun 2025 14:52:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Message-ID: <175088116219.2109196.794723987719315841.robh@kernel.org>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
 <20250610152309.299438-6-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250610152309.299438-6-antonio.borneo@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 5/5] dt-bindings: pinctrl:
 stm32: Add missing blank lines
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


On Tue, 10 Jun 2025 17:23:09 +0200, Antonio Borneo wrote:
> Separate the properties through a blank line.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml      | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
